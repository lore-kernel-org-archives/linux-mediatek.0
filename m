From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt1873-evb: MMC failing with linux-next
Date: Fri, 12 Feb 2016 17:01:26 +0100
Message-ID: <56BE01D6.40908@gmail.com>
References: <7hegcmadfk.fsf@baylibre.com> <56BDF937.60208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <56BDF937.60208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 12/02/16 16:24, Matthias Brugger wrote:
> Hi Kevin,
>
> On 09/02/16 02:18, Kevin Hilman wrote:
>> Hello,
>>
>> I tried getting MMC working with linux-next (next-20160208) on
>> mt8173-evb by enabling a few options[1] on top of the default defconfig,
>> and this results in a kernel that hangs as soon as it starts userspace.
>>
>> The MMC driver seems to start, though has some regulator issues:
>>
>> [    0.526380] sdhci: Secure Digital Host Controller Interface driver
>> [    0.527176] sdhci: Copyright(c) Pierre Ossman
>> [    0.528835] vio18: unsupportable voltage range: 3300000-1980000uV
>> [    0.529610] mtk-msdc 11230000.mmc: Regulator set error -22:
>> 3300000 - 3300000
>> [    0.563731] mtk-msdc 11240000.mmc: Got CD GPIO
>>
>> The driver appears to be attempting to set 3.3V but using a 1.8V
>> regulator (vio18), which is failing.
>>
>> Then, the kernel hangs after freeing unused memory:
>>
>> [    0.616386] hctosys: unable to open rtc device (rtc0)
>> [    0.624118] usb_vbus: disabling
>> [    0.624547] vusb: disabling
>> [    0.624929] vgp6: disabling
>> [    0.625635] ALSA device list:
>> [    0.626009]   No soundcards found.
>> [    0.626963] Freeing unused kernel memory: 724K (ffffffc000977000 -
>> ffffffc000a2c000)
>>
>> And nothing further here.
>>
>
> I can see the warning from the mmc regulator access, but after that my
> board boots just fine.
> I'm using linux-next as of today (20160212).
> I attached my config, it should be defconfig plus the config options you
> mentioned (and an initramfs).
>
> Is this the configuration you have?

I spotted an error in my scripts to build the kernel. After fixing this 
I can reproduce your error.

Regards,
Matthias

>
> Regards,
> Matthias
>
>> It boots fine when disabling the MMC driver (CONFIG_MMC_MTK=n).
>>
>> Any ideas?
>>
>> Kevin
>>
>> [1]
>> CONFIG_MMC_MTK=y
>> CONFIG_MFD_MT6397=y
>> CONFIG_REGULATOR_MT6397=y
>> CONFIG_MTK_PMIC_WRAP=y
>>
