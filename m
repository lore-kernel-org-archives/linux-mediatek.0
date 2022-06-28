Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF95C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 06:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrd18jDkL+GyX8NAgPyqfz48Y92XMpElU+1xaowr3Oo=; b=SoHrP/wkIseVudJAGCP3N1Bb/d
	qP2GkVTH3sOSuXccwLKdoVer3D8cyfrqDHi2U+EdsJsH8Un9iEkBsaL1uHn0fwYgTd38dCgYRHjBj
	xlGjsP/NpNN4YHk9EipyoxTQzKQuUJupbs+KAIpbMz4JcVzjyyu/Et+x19F2AFv4ThOWqXj7bcXNj
	cwRIkh2M5Eh8lVgvG0oMhBieMmC1+4r67ih2r1UB2lGw1n7Rn/lgGpYcgVZ/PwZxBkbi1/ALtC1LI
	GGVQkdDEY0Hk4kUlALkKslWw9aR8xJIVsgH1hPyz0QtPIv5CVD+uSUaXFmSCSxZlN8CJuwXUJkLhk
	5mamr7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64PH-004aYC-LC; Tue, 28 Jun 2022 06:09:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64Ec-004VWq-TG; Tue, 28 Jun 2022 05:58:07 +0000
X-UUID: 0b86b7094b944875834adf21acc6c788-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:ce43f788-bddb-4732-8f7c-579561fa82bd,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:6b1af585-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0b86b7094b944875834adf21acc6c788-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1225414644; Mon, 27 Jun 2022 22:57:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 09:37:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 09:37:58 +0800
Message-ID: <e58b55e1992ce37f35491f90cf7ccfb419a739e2.camel@mediatek.com>
Subject: Re: [PATCH v23 06/14] drm/mediatek: add display merge mute/unmute
 support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Date: Tue, 28 Jun 2022 09:37:58 +0800
In-Reply-To: <20220620091930.27797-7-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
	 <20220620091930.27797-7-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225803_029546_9168C216 
X-CRM114-Status: GOOD (  16.21  )
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

Hi, Nancy:

On Mon, 2022-06-20 at 17:19 +0800, Nancy.Lin wrote:
> Add merge mute/unmute setting for MT8195.
> MT8195 Vdosys1 merge1~merge4 support HW mute function.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index c7af5ccab916..2e13d2fb429e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -58,12 +58,15 @@
>  #define FLD_PREULTRA_TH_LOW			GENMASK(15, 0)
>  #define FLD_PREULTRA_TH_HIGH			GENMASK(31, 16)
>  
> +#define DISP_REG_MERGE_MUTE_0		0xf00
> +
>  struct mtk_disp_merge {
>  	void __iomem			*regs;
>  	struct clk			*clk;
>  	struct clk			*async_clk;
>  	struct cmdq_client_reg		cmdq_reg;
>  	bool				fifo_en;
> +	bool				mute_support;
>  };
>  
>  void mtk_merge_start(struct device *dev)
> @@ -80,6 +83,10 @@ void mtk_merge_start_cmdq(struct device *dev,
> struct cmdq_pkt *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> +	if (priv->mute_support)
> +		mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv-
> >regs,
> +			      DISP_REG_MERGE_MUTE_0);
> +
>  	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
>  		      DISP_REG_MERGE_CTRL);
>  }
> @@ -88,6 +95,10 @@ void mtk_merge_stop_cmdq(struct device *dev,
> struct cmdq_pkt *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> +	if (priv->mute_support)
> +		mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg, priv-
> >regs,
> +			      DISP_REG_MERGE_MUTE_0);
> +
>  	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
>  		      DISP_REG_MERGE_CTRL);
>  }
> @@ -262,6 +273,8 @@ static int mtk_disp_merge_probe(struct
> platform_device *pdev)
>  	priv->fifo_en = of_property_read_bool(dev->of_node,
>  					      "mediatek,merge-fifo-
> en");
>  
> +	priv->mute_support = of_property_read_bool(dev->of_node,
> +						   "mediatek,merge-
> mute");
>  	platform_set_drvdata(pdev, priv);
>  
>  	ret = component_add(dev, &mtk_disp_merge_component_ops);


