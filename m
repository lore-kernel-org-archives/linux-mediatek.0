Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DF5C352A3
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 01:53:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB70C20848
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 01:53:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EjYf0aAL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t2l4dAhY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB70C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyJhB30y9uPlZmThhKlIfOb1mAsudvLv+kYe8slMgHk=; b=EjYf0aAL8qaNJG
	Gj/DatA4XIteL4uxRUUSYCimRC7LWbIVBi2IGJVbKkNDkNt5Pc7Oyb98PiKhsMB6yh+kLvICWR+U4
	E0M6uw8emXdCZsRjzxzHJCXTv1lxmhp5m7w526WLWJr9aezqaaogjn0DwiHndVsW/IvwS417e9wT7
	WRjBmspv5WNhOaQpSgCO3W6vvB6oDZInu9rdC1EZzFcuM0fFmPe0h/3nR+a5omnFJttfFmfmgh3DV
	grlF0xyM0WGuWXEzItxz6ktLwZwOaTygGjhcEq8FBvg+IKwjR4cpxjGL7/ybPCE2kzARD5Z0j3nKS
	LN2+xwaCHapuJuu/80gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2QAE-00006s-Qd; Fri, 14 Feb 2020 01:53:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2QA2-0008Fi-S2; Fri, 14 Feb 2020 01:52:56 +0000
X-UUID: 8d70de22439d4960a674538fdc6239d5-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5kuuBKwpTdX0p4HJiRAoqn7HWcPfUW5EtfpYL3ZhCNs=; 
 b=t2l4dAhY+2Fng+4k5/ovqJsy1gYRA9OXtImVPDXaON1Zp4etcAr0r9Hc3MJF869tohF8vm+gODwMd25Ugs0Yx8wW0RWQ4/ob0R9niL7MhYVk34jMBD4vOKE4X7BpJrrI3e3idHell2kQKZQ0OK62kSJTGWZwtzvqdlcheRkHu00=;
X-UUID: 8d70de22439d4960a674538fdc6239d5-20200213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1428441004; Thu, 13 Feb 2020 17:52:50 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 17:53:01 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 09:52:11 +0800
Message-ID: <1581645161.22833.6.camel@mtksdaap41>
Subject: Re: [PATCH v7 11/13] clk: mediatek: mt8183: switch mmsys to
 platform device probing
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Fri, 14 Feb 2020 09:52:41 +0800
In-Reply-To: <20200213201953.15268-12-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-12-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_175254_916502_CC675BC9 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, linux-clk@vger.kernel.org,
 drinkcat@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias:

On Thu, 2020-02-13 at 21:19 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Switch probing for the MMSYS to support invocation to a
> plain paltform device. The driver will be probed by the DRM subsystem.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
> Changes in v7:
> - free clk_data->clks as well
> - get rid of private data structure
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/clk/mediatek/clk-mt8183-mm.c | 30 ++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
> index 720c696b506d..7576cd231be3 100644
> --- a/drivers/clk/mediatek/clk-mt8183-mm.c
> +++ b/drivers/clk/mediatek/clk-mt8183-mm.c
> @@ -3,8 +3,10 @@
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
> @@ -85,27 +87,35 @@ static const struct mtk_gate mm_clks[] = {
>  static int clk_mt8183_mm_probe(struct platform_device *pdev)
>  {
>  	struct clk_onecell_data *clk_data;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *node = pdev->dev.parent->of_node;
> +
> +	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);

I think this is redundant.

> +	if (!clk_data)
> +		return -ENOMEM;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	platform_set_drvdata(pdev, clk_data);
>  
> -	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -			clk_data);
> +	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
>  
>  	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  }
>  
> -static const struct of_device_id of_match_clk_mt8183_mm[] = {
> -	{ .compatible = "mediatek,mt8183-mmsys", },
> -	{}
> -};
> +static int clk_mt8183_mm_remove(struct platform_device *pdev)
> +{
> +	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	kfree(clk_data->clks);
> +	kfree(clk_data);

These two statement looks like a reverse of mtk_alloc_clk_data() and
exist in many files. It is worth to have a function (maybe
mtk_free_clk_data()) to do this.

In addition, should we undo what is done in clk_mt8183_mm_probe() such
as mtk_clk_register_gates() and of_clk_add_provider()?

Regards,
CK

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
