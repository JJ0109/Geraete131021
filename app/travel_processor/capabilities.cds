using {GeraetetypService} from '../../srv/travel-service';

annotate GeraetetypService.Geraetetyp with @odata.draft.enabled;
annotate GeraetetypService.Geraetetyp with @Common.SemanticKey: [GeraetetypID];
