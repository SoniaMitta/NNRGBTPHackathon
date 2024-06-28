using {com.satinfotech.Hydmetro as metro} from '../db/schema';

service hydmetro {
    entity train as projection on metro.train
}

annotate hydmetro.train with @odata.draft.enabled;