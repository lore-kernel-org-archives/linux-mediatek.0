Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A93DC43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 10:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A67420726
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 10:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFhHy3LI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A67420726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiFCr93RUluz4qA/EPqlieUHotUsTMUf7H0hR50ptqk=; b=CFhHy3LIFgVez5
	Q0NR+GoAz4XNtAjyrP8Uj6mExr5JalBM/gKVOY+IjCicor7FQhvcis288gLdNtY81dG4YfeAbvZiu
	O8rVdVCMKiaWhKsMQxhtqH/pclcH9eD2gpT3D2QK/Hv08SWMe5Jwu9k7p3EomH6xvlmv0/yD84I1L
	+nIIZc0NxGFOoc7Wq7AsswcI7Tsh4j1fONg9beiA661R+AoLsfuat+C6ztaFfcVfjS1hPB1ra4qoV
	+pJ9yZJgASS0Pp0DrZTSgbTV4BxuPeVLJxBNpYJCLfIgK6mNZiQVdV1rOYz8BAcliv6xK5I0lI2eu
	TPtSbR3WaEpz4+MvmVvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieFrK-0007pY-PO; Mon, 09 Dec 2019 10:01:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieFrB-0007h5-CH; Mon, 09 Dec 2019 10:01:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A9E2C28BA5C
Subject: Re: [resend PATCH v6 08/12] clk: mediatek: mt6779: switch mmsys to
 platform device probing
To: matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-9-matthias.bgg@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <ef75d3d2-7a2d-5b68-ad0a-ffdf1da4bab9@collabora.com>
Date: Mon, 9 Dec 2019 11:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-9-matthias.bgg@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_020133_675722_56FF49F7 
X-CRM114-Status: GOOD (  16.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On 7/12/19 23:47, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Switch probing for the MMSYS to support invocation to a
> plain paltform device. The driver will be probed by the DRM subsystem.
> 
> Singed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/clk/mediatek/clk-mt6779-mm.c | 41 +++++++++++++++++++---------

And the same comment from previous patch. The comment applies to patches until 11.

>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
> index fb5fbb8e3e41..439ec460c166 100644
> --- a/drivers/clk/mediatek/clk-mt6779-mm.c
> +++ b/drivers/clk/mediatek/clk-mt6779-mm.c
> @@ -4,13 +4,19 @@
>   * Author: Wendell Lin <wendell.lin@mediatek.com>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
>  #include <dt-bindings/clock/mt6779-clk.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
>  
> +struct clk_mt6779_mm_priv {
> +	struct clk_onecell_data *clk_data;
> +};
> +
>  static const struct mtk_gate_regs mm0_cg_regs = {
>  	.set_ofs = 0x0104,
>  	.clr_ofs = 0x0108,
> @@ -84,30 +90,39 @@ static const struct mtk_gate mm_clks[] = {
>  	GATE_MM1(CLK_MM_DISP_OVL_FBDC, "mm_disp_ovl_fbdc", "mm_sel", 16),
>  };
>  
> -static const struct of_device_id of_match_clk_mt6779_mm[] = {
> -	{ .compatible = "mediatek,mt6779-mmsys", },
> -	{}
> -};
> -
>  static int clk_mt6779_mm_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct clk_mt6779_mm_priv *private;
> +	struct device_node *node = pdev->dev.parent->of_node;
> +
> +	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
>  
> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	platform_set_drvdata(pdev, private);
>  
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -			       clk_data);
> +			       private->clk_data);
>  
> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	return of_clk_add_provider(node, of_clk_src_onecell_get,
> +						private->clk_data);
> +}
> +
> +static int clk_mt6779_mm_remove(struct platform_device *pdev)
> +{
> +	struct clk_mt6779_mm_priv *private = platform_get_drvdata(pdev);
> +
> +	kfree(private->clk_data);
> +
> +	return 0;
>  }
>  
>  static struct platform_driver clk_mt6779_mm_drv = {
>  	.probe = clk_mt6779_mm_probe,
> +	.remove = clk_mt6779_mm_remove,
>  	.driver = {
>  		.name = "clk-mt6779-mm",
> -		.of_match_table = of_match_clk_mt6779_mm,
>  	},
>  };
> -
> -builtin_platform_driver(clk_mt6779_mm_drv);
> +module_platform_driver(clk_mt6779_mm_drv);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
