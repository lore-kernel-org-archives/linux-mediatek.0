From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Question about checking rate_spi in pwrap_init_reg_clock
Date: Tue, 21 Apr 2015 13:43:19 +0200
Message-ID: <CABuKBeJqgWHWNYaFXS-BwEayHEtiYGt+56LLXs3QaO3MHUk0bQ@mail.gmail.com>
References: <1429581487.5994.1.camel@ingics.com>
 <20150421103155.GX6325@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20150421103155.GX6325-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "fan. chen" <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

2015-04-21 12:31 GMT+02:00 Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
> On Tue, Apr 21, 2015 at 09:58:07AM +0800, Axel Lin wrote:
>> hi,
>> The implementation in pwrap_init_reg_clock seems has off-by-one bug.
>> If rate_spi is 26000000, current code set ck_mhz to 18 rather than 26.
>>
>> I guess it needs below fix, but I'm not 100% sure as I don't have the datasheet.
>> Can someone confirm if this is a bug or not?
>
> Yes, seems to be a bug. Thanks for noting. Will you send a formal patch
> or should I do it?

Did you have a look on both datasheets/reference kernels, mt8135 and mt8173?
Reading the datasheet and reference kernel code for mt6589 this SPI
waveform configuration looks like magic.

But reading the clock frequency which can have clk_spi in mt8135, they
are 0 MHz, 26 MHz and bigger then 26 MHz, which leads me to the
conclusion that the code is correct. Otherwise the check for bigger
then 18 MHz is useless and should be deleted, if we have a similar
clock distribution in mt8173.

So maybe someone from Mediatek can shed light on this issue.

Thanks,
Matthias
