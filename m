Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB987C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xf4b9AvRUDXnujMAQaJtLtfqbUshCF5QycvaFtGdBY4=; b=199eQPPKSLwc8ymvpmkB6X/3eg
	U74ErsZ4IzQkKeMPiJ8wLJ6IKiWMHviOzLwx0RZ2rMiyVj9Y/9+6gBHDGpEgInoIIVgEu9tY/zxtl
	ttU3GZsQytKDRr8/ytZw1xmlaLAnub9BM9JSUA4a+3ZXIT7R7MVTS46B1llWkmXOoUxcCQQLAscdY
	vlz19LJeDOq4KnerQq76P9XiIwcmW6KWNHWttZ27TLZdZqe7h3vskTge79HQvrZrGZeXcoJ1jxvAu
	2/+lJoc4rXrqUASCFqNUHhy82dOfZNg3v1f/f0TgP6x7Rid+D/h5UWceXIpdn/iO85qQbzpq1hyVA
	fTwSMCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYy2-00000000J2Q-3LZh;
	Mon, 26 Feb 2024 11:16:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYxy-00000000Izm-1kCG;
	Mon, 26 Feb 2024 11:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708946172;
	bh=rbz5V7dAp9UKMWAJ4NGuXVlKWd6zmgzIZmH1IQn+dU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fYY39ux/ltUowjNs1wv42h9v43ezzKaVupXe98joJu0hgeKUs2czrOscxzdORgCdZ
	 IFV2243rdAeXgBtotTPscvVH86qVHBtgVOyrdb7VUtkxPwT1q5ziFR0+NIb+IDcfU1
	 4pZI6L8JJXikYDsbh1UwI/xr5S8wKKkQNq8/+z/g6o5pN1IBjBqOidmvvFv5Ropu96
	 U+NEySA/0sP1Yid5WGkDCObo/XSg/lgrppi5LNCPTtP3vOJ7HGmBN2wbzVsf+PKOOQ
	 km5Xvo3XaTW5FeD6o5AIdhFZnVi4mfNrI4pDL4A/iPLCEewonNNCtzpsFFr4vZfNk5
	 8ZqdJ9Nktpmrg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 53D663780022;
	Mon, 26 Feb 2024 11:16:11 +0000 (UTC)
Message-ID: <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com>
Date: Mon, 26 Feb 2024 12:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to
 mtk_clk_desc
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_031614_664482_2283E597 
X-CRM114-Status: GOOD (  22.22  )
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

Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
> On Mon, Jan 8, 2024 at 4:18 PM Pin-yen Lin <treapking@chromium.org> wrote:
>>
>> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
>> this clock controller needs runtime PM for its operations.
>> Also do a runtime PM get on the clock controller during the
>> probing stage to workaround a possible deadlock.
>>
>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> The patch itself looks fine.
> 
> Besides the MT8183 MFG clock issues, we do actually need this for the
> MT8192 ADSP clock. Its power domain is not enabled by default.
> 

...but on MT8195 the ADSP clock works - because the ADSP node exists.

This poses a question: should we make clock controllers depend on power domains,
or should we keep everything powered off (hence clocks down - no power consumption)
*unless* the user exists?

For the second one, this means that the *device* gets the power domain (adsp), and
not the clock controller (which clocks are effectively useless if there's no user).

Angelo

>> ---
>>
>> Changes in v3:
>> - Update the commit message and the comments before runtime PM call
>>
>> Changes in v2:
>> - Fix the order of error handling
>> - Update the commit message and add a comment before the runtime PM call
>>
>>   drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
>>   drivers/clk/mediatek/clk-mtk.h |  2 ++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>> index 2e55368dc4d8..ba1d1c495bc2 100644
>> --- a/drivers/clk/mediatek/clk-mtk.c
>> +++ b/drivers/clk/mediatek/clk-mtk.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>>
>>   #include "clk-mtk.h"
>> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>                          return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>>          }
>>
>> +
>> +       if (mcd->need_runtime_pm) {
>> +               devm_pm_runtime_enable(&pdev->dev);
>> +               /*
>> +                * Do a pm_runtime_resume_and_get() to workaround a possible
>> +                * deadlock between clk_register() and the genpd framework.
>> +                */
>> +               r = pm_runtime_resume_and_get(&pdev->dev);
>> +               if (r)
>> +                       return r;
>> +       }
>> +
>>          /* Calculate how many clk_hw_onecell_data entries to allocate */
>>          num_clks = mcd->num_clks + mcd->num_composite_clks;
>>          num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
>> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>                          goto unregister_clks;
>>          }
>>
>> +       if (mcd->need_runtime_pm)
>> +               pm_runtime_put(&pdev->dev);
>> +
>>          return r;
>>
>>   unregister_clks:
>> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>   free_base:
>>          if (mcd->shared_io && base)
>>                  iounmap(base);
>> +
>> +       if (mcd->need_runtime_pm)
>> +               pm_runtime_put(&pdev->dev);
>>          return r;
>>   }
>>
>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
>> index 22096501a60a..c17fe1c2d732 100644
>> --- a/drivers/clk/mediatek/clk-mtk.h
>> +++ b/drivers/clk/mediatek/clk-mtk.h
>> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
>>
>>          int (*clk_notifier_func)(struct device *dev, struct clk *clk);
>>          unsigned int mfg_clk_idx;
>> +
>> +       bool need_runtime_pm;
>>   };
>>
>>   int mtk_clk_pdev_probe(struct platform_device *pdev);
>> --
>> 2.43.0.472.g3155946c3a-goog
>>




