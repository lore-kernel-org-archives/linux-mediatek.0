Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15731C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 06:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0jpRmKfl5KZXNJMdYP7Bim01DF90AgiWJC04Xp+FbI=; b=PvvOg5G3WH+kXFCSwnVne2B+oX
	s1YN7kG7Gg30DoC36SKZeQkLk8B6QfEEDNurqomMllzbeLhKN5Jeold3ZWYKXP9IsRJG1y2Sdc+K9
	2KuKFS4+mGy3mH9YqNmg8lKTxlGTCP5fKkpzwt740WyrRiCXhAN76shq7VkUlS54JTvPZ/ivUkH01
	ewiHFaSS4ikPyRcHWhLUShhR7c3Sf90HvTibSpYjaWW+J+IDHTuRpD7ednN2oSbvc8Xr4ntkb3BhM
	SPadcmmPVIAT+F8oj717iMnJ37xoqWiVOP6wOZWSscAqfCLfdZIS239ZWdYfijyl9ukOhxhcIMII9
	efkBNwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64Rd-004bpm-Am; Tue, 28 Jun 2022 06:11:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64Ft-004W1i-Hy; Tue, 28 Jun 2022 05:59:23 +0000
X-UUID: 83391d3c26df4cfbb6845834a03ba319-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:5cb8c69b-9d48-4068-acc8-e3e1a9bb1e74,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:447cd262-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 83391d3c26df4cfbb6845834a03ba319-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1515129431; Mon, 27 Jun 2022 22:59:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 13:54:27 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jun 2022 09:35:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 09:35:43 +0800
Message-ID: <4c74f395d42152470c317965813180a3a4616d13.camel@mediatek.com>
Subject: Re: [PATCH v23 05/14] drm/mediatek: add display merge start/stop
 API for cmdq support
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
Date: Tue, 28 Jun 2022 09:35:43 +0800
In-Reply-To: <20220620091930.27797-6-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
	 <20220620091930.27797-6-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225921_629674_7D98C82B 
X-CRM114-Status: GOOD (  17.33  )
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
> Add merge start/stop API for cmdq support. The ovl_adaptor merges
> are configured with each drm plane update. Need to enable/disable
> merge with cmdq making sure all the settings taken effect in the
> same vblank.

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
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 18 +++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index e847e90f436d..33e61a136bbc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
>  void mtk_merge_advance_config(struct device *dev, unsigned int l_w,
> unsigned int r_w,
>  			      unsigned int h, unsigned int vrefresh,
> unsigned int bpc,
>  			      struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt);
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt);
>  
>  void mtk_ovl_bgclr_in_on(struct device *dev);
>  void mtk_ovl_bgclr_in_off(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index 40da0555416d..c7af5ccab916 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -67,17 +67,29 @@ struct mtk_disp_merge {
>  };
>  
>  void mtk_merge_start(struct device *dev)
> +{
> +	mtk_merge_start_cmdq(dev, NULL);
> +}
> +
> +void mtk_merge_stop(struct device *dev)
> +{
> +	mtk_merge_stop_cmdq(dev, NULL);
> +}
> +
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> -	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> +	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CTRL);
>  }
>  
> -void mtk_merge_stop(struct device *dev)
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> -	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CTRL);
>  }
>  
>  static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,


