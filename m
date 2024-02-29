Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610A1C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peyYiiJNgy/pr5Xh0v9CmRUMIlzvTgSc432/YpP2mkI=; b=XgpCjYr8rtiQNmjnXML3CNIjk4
	A9v0oDduPPV2IcVzCfW5/jDfV6FjNm9eVTJPzanJylEVOr6E5Z2ABWxM0uF88tcxyG0jqceUZh2bH
	mRHrQvXpr1c3sFZ4fBY/7sOjBFOP31yma/67iwV8kmXCkyH/Z3hTDVgbvMMFq1H+YC5oriROtJdjT
	9DRnYgwiWBbyf+kYL4+O1dEpprvOP/Z389VJ1LfA+FvER7KuX+6ha/ZTZYKhoE0hchZ8ad9F2/tU8
	0uld8JFGiPH/nrd/K54z7LZkIdDVDAv1bxAEbihojpPRmaEhequ9qymXwkPWqqDHFzFwiq65C8/d8
	JWucB7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfcyr-0000000CzcK-3J6k;
	Thu, 29 Feb 2024 09:45:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfcyo-0000000Cza5-1OKT;
	Thu, 29 Feb 2024 09:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709199928;
	bh=zqMod5Dpmo25ZYJnsrKD9ta8Mkuv6yxXbpPE124uuWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cGGUw0GnTQlL8WhUt9CYdUBIGh5WzXoZi4F6acKTJ/nfgKY0bGsEOMGPt+4hfVPrz
	 vNpEJT8waAK2cuNo6R8RcTti5lm4I6qYEL0bVw8d0g6uQ+P4l/w0ALBQy5DRjnWhtC
	 /v4VOleLj0QalfQK4cWa6ebsZS7R8HLJtNoxVUE7QTpP5z7S25zZg48tceTKSD49pZ
	 G8M+V6D0VhHTRqQBL4U1ecuV7CJQjRMU/TSrYsnDxCgaRoHo+gWArm3BptRnP9R1dM
	 XNNTHfu+mlgCxmD8M9lOyNVNx2IOLPr2gLsJXJUoxPfBWa/6YU1AH9zYr7NsFRpjiI
	 qnCJozDOS5mpg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 335B53780F7F;
	Thu, 29 Feb 2024 09:45:28 +0000 (UTC)
Message-ID: <cc74422d-962f-4da5-867b-158a71db1a7b@collabora.com>
Date: Thu, 29 Feb 2024 10:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to
 mtk_clk_desc
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Pin-yen Lin <treapking@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
 <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com>
 <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_014530_588870_F4F66893 
X-CRM114-Status: GOOD (  39.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/02/24 08:17, Chen-Yu Tsai ha scritto:
> On Mon, Feb 26, 2024 at 7:16 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
>>> On Mon, Jan 8, 2024 at 4:18 PM Pin-yen Lin <treapking@chromium.org> wrote:
>>>>
>>>> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
>>>> this clock controller needs runtime PM for its operations.
>>>> Also do a runtime PM get on the clock controller during the
>>>> probing stage to workaround a possible deadlock.
>>>>
>>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>>>
>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>>
>>> The patch itself looks fine.
>>>
>>> Besides the MT8183 MFG clock issues, we do actually need this for the
>>> MT8192 ADSP clock. Its power domain is not enabled by default.
>>>
>>
>> ...but on MT8195 the ADSP clock works - because the ADSP node exists.
> 
> That's an indirect dependency that should not be relied on. Say the clock
> driver probed but the ADSP hasn't, and you try to read out the current
> status. What would happen?
> 
> - Read out works fine, because the power domain is default on, and hasn't
>    been turned off by late cleanup
> - Read out is bogus (but you can't tell)
> - Read out hangs.
> 
> The third is what happens on MT8192. There's still some issues on that
> front, as even after I applied the ADSP power domain patches from MediaTek,
> the readout was still hanging.
> 

That MT8192 lockup story is getting crazy in my head... anyway, besides that,
I get the point - I was somehow ignoring the fact that kernel modules do exist.

Eh, sorry about that :-)

>> This poses a question: should we make clock controllers depend on power domains,
>> or should we keep everything powered off (hence clocks down - no power consumption)
>> *unless* the user exists?
> 
> That's a policy discussion separate from actual hardware dependencies.
> *If* the clock controller needs the power domain to be active for the
> registers to be accessed, the clock controller *must* have a direct
> dependency on the power domain.
> 

I admit I should've worded that better.

"should we make clock controllers depend on power domains" was actually implying
"IF those need one" :-)

I really wonder if - at this point - it's simply a better idea to not restrict
the call to devm_pm_runtime_enable/resume_and_get to `need_runtime_pm == true`.

Do we really need to exclude that on other clock controllers that don't have
any power domain dependency? Any side effect?

Saying this because if we can avoid yet another per-SoC flag I'm really happy,
as readability is also impacted and besides - if we ever find out that one of
those need a power domain in the future, we'll need just one commit and just
only in the devicetree, instead of enabling a flag in driver X as well as that,
avoiding some (potentially unnecessary) noise... I guess.

P.S.: I just noticed that the return value for the devm_pm_runtime_enable() call
       is not being checked!

.......

In short....

Chen-Yu, at this point, do you have any reason why we wouldn't be able and/or it
wouldn't be a good idea to just avoid adding the `need_runtime_pm` flag (meaning
that we perform pm_runtime calls for all clock drivers unconditionally)?

If this is about longer boot time, I don't think that it's going to be more than
a millisecond or two, so that should be completely ignorable.

Can you please do a test for that, or should I?

Cheers
Angelo

>> For the second one, this means that the *device* gets the power domain (adsp), and
>> not the clock controller (which clocks are effectively useless if there's no user).
> 
> No. See my previous paragraph.
> 
> ChenYu
> 
>> Angelo
>>
>>>> ---
>>>>
>>>> Changes in v3:
>>>> - Update the commit message and the comments before runtime PM call
>>>>
>>>> Changes in v2:
>>>> - Fix the order of error handling
>>>> - Update the commit message and add a comment before the runtime PM call
>>>>
>>>>    drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
>>>>    drivers/clk/mediatek/clk-mtk.h |  2 ++
>>>>    2 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>>>> index 2e55368dc4d8..ba1d1c495bc2 100644
>>>> --- a/drivers/clk/mediatek/clk-mtk.c
>>>> +++ b/drivers/clk/mediatek/clk-mtk.c
>>>> @@ -13,6 +13,7 @@
>>>>    #include <linux/of.h>
>>>>    #include <linux/of_address.h>
>>>>    #include <linux/platform_device.h>
>>>> +#include <linux/pm_runtime.h>
>>>>    #include <linux/slab.h>
>>>>
>>>>    #include "clk-mtk.h"
>>>> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>>>                           return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>>>>           }
>>>>
>>>> +
>>>> +       if (mcd->need_runtime_pm) {
>>>> +               devm_pm_runtime_enable(&pdev->dev);
>>>> +               /*
>>>> +                * Do a pm_runtime_resume_and_get() to workaround a possible
>>>> +                * deadlock between clk_register() and the genpd framework.
>>>> +                */
>>>> +               r = pm_runtime_resume_and_get(&pdev->dev);
>>>> +               if (r)
>>>> +                       return r;
>>>> +       }
>>>> +
>>>>           /* Calculate how many clk_hw_onecell_data entries to allocate */
>>>>           num_clks = mcd->num_clks + mcd->num_composite_clks;
>>>>           num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
>>>> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>>>                           goto unregister_clks;
>>>>           }
>>>>
>>>> +       if (mcd->need_runtime_pm)
>>>> +               pm_runtime_put(&pdev->dev);
>>>> +
>>>>           return r;
>>>>
>>>>    unregister_clks:
>>>> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>>>    free_base:
>>>>           if (mcd->shared_io && base)
>>>>                   iounmap(base);
>>>> +
>>>> +       if (mcd->need_runtime_pm)
>>>> +               pm_runtime_put(&pdev->dev);
>>>>           return r;
>>>>    }
>>>>
>>>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
>>>> index 22096501a60a..c17fe1c2d732 100644
>>>> --- a/drivers/clk/mediatek/clk-mtk.h
>>>> +++ b/drivers/clk/mediatek/clk-mtk.h
>>>> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
>>>>
>>>>           int (*clk_notifier_func)(struct device *dev, struct clk *clk);
>>>>           unsigned int mfg_clk_idx;
>>>> +
>>>> +       bool need_runtime_pm;
>>>>    };
>>>>
>>>>    int mtk_clk_pdev_probe(struct platform_device *pdev);
>>>> --
>>>> 2.43.0.472.g3155946c3a-goog
>>>>
>>
>>
>>




