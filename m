From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] watchdog: mtk_wdt: Use MODE_KEY when stopping the
 watchdog
Date: Fri, 20 Nov 2015 17:51:55 +0100
Message-ID: <564F4FAB.8000703@gmail.com>
References: <1447814701-23504-1-git-send-email-drinkcat@chromium.org>
 <564CA620.7080700@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <564CA620.7080700@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Nicolas Boichat <drinkcat@chromium.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 18/11/15 17:24, Guenter Roeck wrote:
> On 11/17/2015 06:45 PM, Nicolas Boichat wrote:
>> WDT_MODE value need to be or-ed with MODE_KEY when setting
>> watchdog mode. Add it to mtk_wdt_stop function, so that the
>> watchdog can be stopped (e.g. during suspend).
>>
>> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

>
>> ---
>>   drivers/watchdog/mtk_wdt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>> index 6ad9df9..b751f43 100644
>> --- a/drivers/watchdog/mtk_wdt.c
>> +++ b/drivers/watchdog/mtk_wdt.c
>> @@ -123,6 +123,7 @@ static int mtk_wdt_stop(struct watchdog_device
>> *wdt_dev)
>>
>>       reg = readl(wdt_base + WDT_MODE);
>>       reg &= ~WDT_MODE_EN;
>> +    reg |= WDT_MODE_KEY;
>>       iowrite32(reg, wdt_base + WDT_MODE);
>>
>>       return 0;
>>
>
