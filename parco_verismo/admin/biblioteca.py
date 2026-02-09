"""
Admin per Opere e Autori.
"""

# Django imports
from django.contrib import admin

# Third-party imports
from parler.admin import TranslatableAdmin

# Local imports
from ..models import Autore, Opera, LuogoLetterario, OperaInLuogo


@admin.register(LuogoLetterario)
class LuogoLetterarioAdmin(admin.ModelAdmin):
    list_display = ("nome", "slug", "ordine")
    prepopulated_fields = {"slug": ("nome",)}
    search_fields = ("nome",)
    list_editable = ("ordine",)


class OperaInLuogoInline(admin.TabularInline):
    model = OperaInLuogo
    extra = 1
    fields = ('luogo', 'categoria', 'ordine')
    autocomplete_fields = ['luogo']


@admin.register(Autore)
class AutoreAdmin(admin.ModelAdmin):
    list_display = ("nome", "slug")
    prepopulated_fields = {"slug": ("nome",)}
    search_fields = ("nome",)


@admin.register(Opera)
class OperaAdmin(TranslatableAdmin):
    list_display = ("__str__", "autore", "fonte_testo")
    list_filter = ("autore", "fonte_testo")
    search_fields = ("translations__titolo", "autore__nome")
    inlines = [OperaInLuogoInline]
    
    fieldsets = (
        ('Informazioni base', {
            'fields': ('autore', 'titolo', 'slug', 'copertina')
        }),
        ('Contenuto', {
            'fields': ('breve_descrizione', 'trama', 'analisi'),
            'classes': ('collapse',)
        }),
        ('Link esterno', {
            'fields': ('link_fonte', 'fonte_testo'),
            'description': 'Inserisci il link all\'opera. La fonte verrà rilevata automaticamente dal link, oppure puoi selezionarla manualmente.'
        }),
    )
