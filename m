Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70490C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6pVk/EzOjofGashLTnr3ERF+AHjyNcZVrq9MtFfYvM=; b=GDRWGIdD/WRmfD
	ipuKv/euCYsJBwlw1hcdlyb3vI+BuTbOWWBzeVLbkbUTaogaMGMaPyozJTFPRuQuygHJaeKvdQGoJ
	eLpT4+1CrC4s74FZ06+TqHTnYHpRMvYu44aC8sndUwz34ryHlIicXGTtGYvHYk0v0Ik6ih0+zZFDa
	4ypm8xgu28FOcuSwpzf5zShe2a0i1fABDl4245BNvj628HPNNPQC6aLY8CToNC5z7ayvrmGJEV65q
	XhbKTiWqiQRGRNay+oBL2had53ry4zChOWKnTU8VOH2KnBbnDSFbmjdlCCdIMXrJ4sm598elKBPR9
	0OcU1fqTi5zu+fZ5lvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKeDS-009wnA-PK; Thu, 17 Feb 2022 10:40:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKeDG-009wjl-8f; Thu, 17 Feb 2022 10:40:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 581411F4560C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645094437;
 bh=a4kVXcts5RYYnYTz5xCDykmha1OtLX+CuQebEarzxD4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PILuS0FjWxb32OJHPC9LFsuDVR2N2f8T1T47E8XjDZYH4g/Qdf9Ys1kjJL1nPJFZf
 0HCZnyJ2jttRNd/7uL54TZOwi8FNIoQxm/rHjQdH7o+aSkXC2rNq11KKxzp7fDiLRd
 j0MNWb2YrLuAIzsbfjoXnM4UmnCw4SCXlXhGRAL0DiaIPR/rDn0115FZAhoDauUl7c
 XJCJCEJJfeS+r1AuvnwXPyAc+WGolhB/mO8sgBUfFSASYRVKk4Khj2wvlZWOpa8DSU
 hCDnCYyLXHXuUbZU9hyrcoYc7KjABQL1sEyOpI6AXMRSlrzaGRN2JDOLh7uSjDIWwF
 pnJ2kUPw5uxgQ==
Message-ID: <e93b12d6-5c7b-2ad6-47e5-c1311d95cba2@collabora.com>
Date: Thu, 17 Feb 2022 11:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] soc: mediatek: mtk-infracfg: Disable ACP on MT8192
Content-Language: en-US
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nick Fan <Nick.Fan@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>
References: <20220215184651.12168-1-alyssa.rosenzweig@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220215184651.12168-1-alyssa.rosenzweig@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_024038_473834_CD8CE9AE 
X-CRM114-Status: GOOD (  25.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/02/22 19:46, Alyssa Rosenzweig ha scritto:
> MT8192 contains an experimental Accelerator Coherency Port
> implementation, which does not work correctly but was unintentionally
> enabled by default. For correct operation of the GPU, we must set a
> chicken bit disabling ACP on MT8192.
> 
> Adapted from the following downstream change to the out-of-tree, legacy
> Mali GPU driver:
> 
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2781271/5
> 
> Note this change is required for both Panfrost and the legacy kernel
> driver.

Hello Alyssa,
the v2 note should not get inside the commit message, even though they should be
on the patch to provide context.
Look at the example...

> 
> v2: Move the change from clk-mt8192.c to mtk-infracfg.c (Robin).
> Although it does not make sense to add this platform-specific hack to
> the GPU driver, it has nothing to do with clocks. We already have
> mtk-infracfg.c to manage other infracfg bits; the ACP disable should
> live there too.
> 
> Co-developed-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Nick Fan <Nick.Fan@mediatek.com>
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

v2: Move the change from clk-mt8192.c to mtk-infracfg.c (Robin).

^^^ put it here, after the "---" :)

Anyway,
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   drivers/soc/mediatek/mtk-infracfg.c   | 19 +++++++++++++++++++
>   include/linux/soc/mediatek/infracfg.h |  3 +++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
> index 0590b68e0d78..2acf19676af2 100644
> --- a/drivers/soc/mediatek/mtk-infracfg.c
> +++ b/drivers/soc/mediatek/mtk-infracfg.c
> @@ -6,6 +6,7 @@
>   #include <linux/export.h>
>   #include <linux/jiffies.h>
>   #include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/soc/mediatek/infracfg.h>
>   #include <asm/processor.h>
>   
> @@ -72,3 +73,21 @@ int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
>   
>   	return ret;
>   }
> +
> +static int __init mtk_infracfg_init(void)
> +{
> +	struct regmap *infracfg;
> +
> +	/*
> +	 * MT8192 has an experimental path to route GPU traffic to the DSU's
> +	 * Accelerator Coherency Port, which is inadvertently enabled by
> +	 * default. It turns out not to work, so disable it to prevent spurious
> +	 * GPU faults.
> +	 */
> +	infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt8192-infracfg");
> +	if (!IS_ERR(infracfg))
> +		regmap_set_bits(infracfg, MT8192_INFRA_CTRL,
> +				MT8192_INFRA_CTRL_DISABLE_MFG2ACP);
> +	return 0;
> +}
> +postcore_initcall(mtk_infracfg_init);
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index d858e0bab7a2..fcbbd0dd5e55 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -229,6 +229,9 @@
>   #define INFRA_TOPAXI_PROTECTEN_SET		0x0260
>   #define INFRA_TOPAXI_PROTECTEN_CLR		0x0264
>   
> +#define MT8192_INFRA_CTRL			0x290
> +#define MT8192_INFRA_CTRL_DISABLE_MFG2ACP	BIT(9)
> +
>   #define REG_INFRA_MISC				0xf00
>   #define F_DDR_4GB_SUPPORT_EN			BIT(13)
>   


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
