<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * App\CurrencyFormatSetting
 *
 * @property int $id
 * @property string $currency_position
 * @property int $no_of_decimal
 * @property string|null $thousand_separator
 * @property string|null $decimal_separator
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting query()
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting whereCurrencyPosition($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting whereDecimalSeparator($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting whereNoOfDecimal($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CurrencyFormatSetting whereThousandSeparator($value)
 * @mixin \Eloquent
 */
class CurrencyFormatSetting extends Model
{
    public $timestamps = false;
}
