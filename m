From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] soc: mediatek: Handle return of of_match_device function
Date: Thu, 1 Feb 2018 15:16:03 +0000
Message-ID: <5fe8a04b-de13-87fb-2916-f3d26e320c4d@arm.com>
References: <1517482822-28758-1-git-send-email-himanshujha199640@gmail.com>
 <b8265d37-0ef0-9d24-8ace-8fae7f67477d@arm.com>
 <CAMuHMdWxH9kQ7Zq5jCHL0hkA3Oin17f75TAq9dPC7FQMagT-vA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWxH9kQ7Zq5jCHL0hkA3Oin17f75TAq9dPC7FQMagT-vA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, sean.wang@mediatek.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kevin-cw.chen@mediatek.com, Cheng Mars <mars.cheng@mediatek.com>, Himanshu Jha <himanshujha199640@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 01/02/18 15:09, Geert Uytterhoeven wrote:
> On Thu, Feb 1, 2018 at 4:02 PM, Robin Murphy <robin.murphy@arm.com> wrote:
>> On 01/02/18 11:00, Himanshu Jha wrote:
>>> In scpsys_probe function, return value of of_match_device function which
>>> returns null is dereferenced without checking. Therefore, add a check for
>>> potential null dereference.
>>>
>>> Detected by CoverityScan, CID#1424087 "Dereference null return value"
>>>
>>> Fixes: commit 53fddb1a66dd ("soc: mediatek: reduce code duplication of
>>> scpsys_probe across all SoCs")
>>> Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>
>>> ---
>>>    drivers/soc/mediatek/mtk-scpsys.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-scpsys.c
>>> b/drivers/soc/mediatek/mtk-scpsys.c
>>> index 435ce5e..6e7f196 100644
>>> --- a/drivers/soc/mediatek/mtk-scpsys.c
>>> +++ b/drivers/soc/mediatek/mtk-scpsys.c
>>> @@ -981,6 +981,9 @@ static int scpsys_probe(struct platform_device *pdev)
>>>          int i, ret;
>>>          match = of_match_device(of_scpsys_match_tbl, &pdev->dev);
>>> +       if (!match)
>>> +               return -EINVAL;
>>> +
>>>          soc = (const struct scp_soc_data *)match->data;
>>
>> You could of course replace the whole sequence with an
>> of_device_get_match_data() call, which happens to be inherently safe against
>> the no-match case even when that *is* impossible by design.
> 
> +1
> 
>>>          scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs,
> 
> ... followed by the static analyser gang complaining we may dereference
> NULL pointer soc...

Well, if the static analysers can't track the provenance of 
dev->driver->of_match_table, let's keep ignoring them until they get 
cleverer :P

Robin.

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
