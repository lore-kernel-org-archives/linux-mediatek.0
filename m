Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA027C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sl2Nz3r3QHK3O34XbDmltWCqB2J4PPc2tFOYmmeULv8=; b=0/YDUjq22gZJDF
	WweuwV95GE7H7r0PUvGLRyyBGeuqvHb+YXosMupV3tKOWvxuT4P8SuMfq4rNj+xg71kISHvKCTxkQ
	jzlbI+48UJnbbwHp3hq5ej8100KvzYu3ZYH+xGcyAuCrDYr3mgZkiGXyy8ohKlpiGVukJJl7r4xOY
	vvPiHG5spI6BBUrberYO0JNXXbe//k7dC+kjVnB4QBr2sze9e0y1IBxyQ7vU0GriY4d4COatxas7o
	6LGv+1bNmXShY0b4u0KU9PCEDzb9SWPg5sJbybntBz/EUfRtPhFj6wpEQNHUnSiBqu2Pvwr3VjSUH
	9axE3C2uQ43KpdkaBpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8MYw-009Bb4-3V; Fri, 14 Jan 2022 13:24:14 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8MYj-009BYH-EQ; Fri, 14 Jan 2022 13:24:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BBF1ED1;
 Fri, 14 Jan 2022 05:23:58 -0800 (PST)
Received: from [10.57.67.190] (unknown [10.57.67.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 516313F774;
 Fri, 14 Jan 2022 05:23:56 -0800 (PST)
Message-ID: <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
Date: Fri, 14 Jan 2022 13:23:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_052401_636898_3A9D08E3 
X-CRM114-Status: GOOD (  29.27  )
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

On 2022-01-10 18:13, Alyssa Rosenzweig wrote:
> Set a mysterious chicken bit in the MT8192 clock driver (!) to get the
> Mali GPU on MT8192 to work. This workaround is from the downstream Mali
> driver shipped in ChromeOS. The change there is unsuitable for mainline
> but good as a reference for the hardware behaviour:
> 
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2781271/5
> 
> That links to an internal Google issue tracker which I assume has more
> information on the bug. I would appreciate if someone from Google or
> MediaTek could explain what this change actually does and why it's
> necessary on MT8192.
> 
> At any rate, this register logically belongs to the MT8192 "infra" clock
> device, so it makes sense to set it there too. This avoids adding any
> platform-specific hacks to the 3D driver, either mainline (Panfrost) or
> legacy (kbase).

Does this really have anything to do with clocks? My (uninformed) 
impression is that the infracfg blocks are general amalgamations of 
configuration registers that simply happen to contain clock and reset 
controls among other functionality. In particular, "ACP" usually refers 
to the Accelerator Coherency Port of a CPU cluster or DSU, and given the 
stated symptom of the issue affected by it, my first guess would be that 
this bit might indeed control routing of GPU traffic either to the ACP 
or the (presumably non-coherent) main interconnect.

If that is the case, I think this would logically belong as a 
SoC-specific quirk in panfrost, where we'd need to retrieve the syscon 
regmap for ourselves (see around line 800 of drivers/iommu/mtk_iommu.c 
for a similar example).

Cheers,
Robin.

> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Nick Fan <Nick.Fan@mediatek.com>
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> ---
>   drivers/clk/mediatek/clk-mt8192.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
> index cbc7c6dbe0f4..e3673494d08d 100644
> --- a/drivers/clk/mediatek/clk-mt8192.c
> +++ b/drivers/clk/mediatek/clk-mt8192.c
> @@ -1179,6 +1179,10 @@ static const struct mtk_pll_data plls[] = {
>   
>   static struct clk_onecell_data *top_clk_data;
>   
> +/* Control registers in the infra block used to set a chicken bit */
> +#define INFRA_CTRL 0x290
> +#define INFRA_CTRL_DISABLE_MFG2ACP BIT(9)
> +
>   static void clk_mt8192_top_init_early(struct device_node *node)
>   {
>   	int i;
> @@ -1224,6 +1228,29 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
>   	return of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
>   }
>   
> +/*
> + * Disable ACP on the infra clock. Setting this quirk is required for 3D to
> + * work correctly. Without this quirk, any work queued to the Mali GPU faults,
> + * for example raising a Data Invalid Fault. This suggests the GPU is failing
> + * to read back the contents of shared CPU/GPU memory correctly, perhaps due to
> + * a MT8192 platform integration issue breaking memory or caches.
> + *
> + * Relevant downstream change:
> + * https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2781271/5
> + */
> +static int clk_mt8192_infra_disable_mfg2acp(struct platform_device *pdev)
> +{
> +	void __iomem *base = devm_platform_ioremap_resource(pdev, 0);
> +	void __iomem *infra_ctrl = base + INFRA_CTRL;
> +
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	writel(readl(infra_ctrl) | INFRA_CTRL_DISABLE_MFG2ACP, infra_ctrl);
> +
> +	return 0;
> +}
> +
>   static int clk_mt8192_infra_probe(struct platform_device *pdev)
>   {
>   	struct clk_onecell_data *clk_data;
> @@ -1238,6 +1265,10 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
>   	if (r)
>   		return r;
>   
> +	r = clk_mt8192_infra_disable_mfg2acp(pdev);
> +	if (r)
> +		return r;
> +
>   	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>   }
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
