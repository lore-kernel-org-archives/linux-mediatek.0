Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA6CC2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 08:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0392F207FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 08:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B16pJ3NM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P1xvWC6H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0392F207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTogsZRiq4oAQRGc4L+3RnXzFVhrq7ff20NGLm0FjYo=; b=B16pJ3NM+8MJmY
	m7tgrHlSgiyNJN4gCPzcWYECQfKw7kVf6gylggBD5YQhxgsd/JvylqDWTvasMiskPq3kdWf87ley9
	zNVGedNQnGyVTkp0njlTyeUqFhtrC/F1PpB5Nzn40c1EuZeOFG0TQYwMTNg7j8D3ZHN5Jxmdr2hqz
	xjaAvWxpFbz2ffVEkO8AXoCABB8GJZvSSZH4z6YWF2L38VPd8gr+pyscheemZE9CRp7MlYwsfF4fR
	CdCD+paMqfUS7zkQt05UquGitn2/Kh/yrOc+cBj+iP1BQ1wBfN5V7MSqefCvF/5OjgriscQWEYtM+
	p2/5zY/D4zV1CX90+0nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieElP-0005Ws-Kl; Mon, 09 Dec 2019 08:51:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieElM-0005WD-MR; Mon, 09 Dec 2019 08:51:30 +0000
X-UUID: 1e711ad201c34c7fa79c6174845fa194-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Xr2/g3CmQSCe7XSe29tjEitMS2VOZyuM620kmLXWO6Q=; 
 b=P1xvWC6HDaWhqgmYSncCgQAH8w+XZKpkMz44/oBFhr3zDee4L99O/yiaD85cTEOn8EXnEagEfkFkVPxxVmnbqNJOMLxJS/m3Gz9GOeQyUnuS9vcBkk7Dcx0jEiaGsAWnzwfrYy3zLCfeFRAqBT9QE8qDuQWL09gK29ybu4yV3ig=;
X-UUID: 1e711ad201c34c7fa79c6174845fa194-20191209
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1497410360; Mon, 09 Dec 2019 00:51:20 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 00:52:19 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 16:51:03 +0800
Message-ID: <1575881471.14479.2.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 10/12] clk: mediatek: mt8183: switch mmsys to
 platform device probing
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Mon, 9 Dec 2019 16:51:11 +0800
In-Reply-To: <20191207224740.24536-11-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-11-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_005128_740836_EBBF505D 
X-CRM114-Status: GOOD (  13.09  )
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
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias:

On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Switch probing for the MMSYS to support invocation to a
> plain paltform device. The driver will be probed by the DRM subsystem.
> 
> Singed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/clk/mediatek/clk-mt8183-mm.c | 39 +++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
> index 720c696b506d..e6dcad18d81a 100644
> --- a/drivers/clk/mediatek/clk-mt8183-mm.c
> +++ b/drivers/clk/mediatek/clk-mt8183-mm.c
> @@ -3,14 +3,20 @@
>  // Copyright (c) 2018 MediaTek Inc.
>  // Author: Weiyi Lu <weiyi.lu@mediatek.com>
>  
> +#include <linux/module.h>
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
>  
>  #include <dt-bindings/clock/mt8183-clk.h>
>  
> +struct clk_mt8183_mm_priv {
> +	struct clk_onecell_data *clk_data;
> +};
> +
>  static const struct mtk_gate_regs mm0_cg_regs = {
>  	.set_ofs = 0x104,
>  	.clr_ofs = 0x108,
> @@ -84,28 +90,37 @@ static const struct mtk_gate mm_clks[] = {
>  
>  static int clk_mt8183_mm_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct clk_mt8183_mm_priv *private;
> +	struct device_node *node = pdev->dev.parent->of_node;
> +
> +	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
>  
> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	platform_set_drvdata(pdev, private);

There is a more simple modification that you need not to define struct
clk_mt8183_mm_priv,

clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
platform_set_drvdata(pdev, clk_data);

Regards,
CK

>  
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -			clk_data);
> +			private->clk_data);
>  
> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	return of_clk_add_provider(node, of_clk_src_onecell_get,
> +			private->clk_data);
>  }
>  
> -static const struct of_device_id of_match_clk_mt8183_mm[] = {
> -	{ .compatible = "mediatek,mt8183-mmsys", },
> -	{}
> -};
> +static int clk_mt8183_mm_remove(struct platform_device *pdev)
> +{
> +	struct clk_mt8183_mm_priv *private = platform_get_drvdata(pdev);
> +
> +	kfree(private->clk_data);
> +
> +	return 0;
> +}
>  
>  static struct platform_driver clk_mt8183_mm_drv = {
>  	.probe = clk_mt8183_mm_probe,
> +	.remove = clk_mt8183_mm_remove,
>  	.driver = {
>  		.name = "clk-mt8183-mm",
> -		.of_match_table = of_match_clk_mt8183_mm,
>  	},
>  };
> -
> -builtin_platform_driver(clk_mt8183_mm_drv);
> +module_platform_driver(clk_mt8183_mm_drv);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
