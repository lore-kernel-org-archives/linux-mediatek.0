Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623D7C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyJm/OfsyIJ5uXNbYeIMyaLdtHaPXQQYpfcJJr8LKks=; b=RfSq/TqTKFD9iHP3jts/wSyRTU
	xlvQ/IcTRDkWhI0B3JwfRHvDP/Jz+zpoVx1/mT8raNIpto/l8iS5+0U7gL2GmtUwmoC1lv+g0hbNs
	4KM/YcoJChglY+zxeiPSUEf37WFcifcdZ/qz2j35y7GR+Uv2e64KaWzveOPEiuCYwG+qKYG8+TrhJ
	825EBzozm0bEnN+8wXgvYgxVGg9C4BIYOBAG/wPSBulnK/SlriXjCokwAz4unjx5UzxuZBfyB9MLo
	OIfdZ54hsCiBiwIYb3bEm91yBvZi06jClZlvwCFejHJeDj+57oaUGlL4vdRzNNqB0a6h7ZqV5nDDg
	WWVT5vPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1gL-001cVD-R3; Fri, 02 Sep 2022 08:05:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1gJ-001cQk-IH; Fri, 02 Sep 2022 08:05:40 +0000
X-UUID: ef8d553764474985a9856b02209d3e5c-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NyJm/OfsyIJ5uXNbYeIMyaLdtHaPXQQYpfcJJr8LKks=;
	b=CqVqtw5g0paicSvSV4ijFkk4fI5/4lIsCvwagB4D5EwxaWCjLGnnL0g0Nlqz5SDNd3QJETfy1XOcGkD3EVUSHbeH6uq4wEfcvOd0oWDNyPjSrEpGDB8ItIcHk0cko4QbXIhm2zkmz7yiCmFN+r9ojRmnfcE4rNxDDRcsCkSI/DU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:778722eb-2536-42b7-80ac-c5f12f94a019,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:ee086fd0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ef8d553764474985a9856b02209d3e5c-20220902
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1173429194; Fri, 02 Sep 2022 01:05:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 15:44:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 15:44:57 +0800
Message-ID: <55eec0effd6cd08edbb130ec7f74ad993a75907d.camel@mediatek.com>
Subject: Re: [PATCH v17 07/10] drm/mediatek: dp: Determine device of
 next_bridge
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 2 Sep 2022 15:44:57 +0800
In-Reply-To: <20220901044149.16782-8-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
	 <20220901044149.16782-8-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_010539_626330_CEBE7ED2 
X-CRM114-Status: GOOD (  17.30  )
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

Hi, Bo-Chen:

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> It's not necessary to have a next_bridge for DP device, so we add
> this
> patch to judge this.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 136e13150281..e37c9185e4ec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1886,7 +1886,10 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  				     "failed to request dp irq
> resource\n");
>  
>  	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 
> 1, 0);
> -	if (IS_ERR(mtk_dp->next_bridge))
> +	if (IS_ERR(mtk_dp->next_bridge) &&
> +	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
> +		mtk_dp->next_bridge = NULL;
> +	else if (IS_ERR(mtk_dp->next_bridge))
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
>  				     "Failed to get bridge\n");
>  


