From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] soc: mediatek: Handle return of of_match_device function
Date: Thu, 1 Feb 2018 16:09:26 +0100
Message-ID: <CAMuHMdWxH9kQ7Zq5jCHL0hkA3Oin17f75TAq9dPC7FQMagT-vA@mail.gmail.com>
References: <1517482822-28758-1-git-send-email-himanshujha199640@gmail.com>
 <b8265d37-0ef0-9d24-8ace-8fae7f67477d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <b8265d37-0ef0-9d24-8ace-8fae7f67477d-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Cheng Mars <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Himanshu Jha <himanshujha199640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 1, 2018 at 4:02 PM, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
> On 01/02/18 11:00, Himanshu Jha wrote:
>> In scpsys_probe function, return value of of_match_device function which
>> returns null is dereferenced without checking. Therefore, add a check for
>> potential null dereference.
>>
>> Detected by CoverityScan, CID#1424087 "Dereference null return value"
>>
>> Fixes: commit 53fddb1a66dd ("soc: mediatek: reduce code duplication of
>> scpsys_probe across all SoCs")
>> Signed-off-by: Himanshu Jha <himanshujha199640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/soc/mediatek/mtk-scpsys.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-scpsys.c
>> b/drivers/soc/mediatek/mtk-scpsys.c
>> index 435ce5e..6e7f196 100644
>> --- a/drivers/soc/mediatek/mtk-scpsys.c
>> +++ b/drivers/soc/mediatek/mtk-scpsys.c
>> @@ -981,6 +981,9 @@ static int scpsys_probe(struct platform_device *pdev)
>>         int i, ret;
>>         match = of_match_device(of_scpsys_match_tbl, &pdev->dev);
>> +       if (!match)
>> +               return -EINVAL;
>> +
>>         soc = (const struct scp_soc_data *)match->data;
>
> You could of course replace the whole sequence with an
> of_device_get_match_data() call, which happens to be inherently safe against
> the no-match case even when that *is* impossible by design.

+1

>>         scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs,

... followed by the static analyser gang complaining we may dereference
NULL pointer soc...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
