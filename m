Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53300C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 06:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ29scIurdffcE9vi0I8VNWWI2guXDepDhuR2pBQn6g=; b=m0tGdNhU1oaGEEVORnjVleABY1
	LkISDHs8nWzD5Upvx9eQNio4IiRN6PdcVGkDIhFDBr5eE9UHhSUv+ZlUwSPcUzidABhncWHIXAfXo
	jwT01ROpx1eoGdqyMQbqwRnI9/ksEaCxQL9lWyndbqVVBMsA8RS7vwCW4r3k5sUlw1jYuGUExecxY
	ytUJaV4gvXFC4zGMBGUzoSQY+3LlApUpcap+c72PsxHzV+ggd5hR2HndlgneHPm3tkMbwOtoQ9Jub
	NmZoYqjo5wPj0qvDiC4WJ7oAv+CJrrML4VnLmQe5m49CPTTMEzyXKEMSdkpbvfeGG7PYJBnDJo9Y2
	wJSqY6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJ7X-00282h-NK; Tue, 09 Aug 2022 06:53:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJ6R-0027Y8-Qr; Tue, 09 Aug 2022 06:52:40 +0000
X-UUID: 7584b840413d4a4a8afacafcb969b68f-20220808
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:8b32c280-d79a-4cb8-93b0-a694b9a4e916,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:5624cbfc-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7584b840413d4a4a8afacafcb969b68f-20220808
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 155976659; Mon, 08 Aug 2022 23:49:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 13:58:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 13:58:40 +0800
Message-ID: <302677f4420e7e76728fdabce92fb275b985b21c.camel@mediatek.com>
Subject: Re: [PATCH v4 2/4] memory: mtk-smi: Add return value for configure
 port function
From: Yong Wu <yong.wu@mediatek.com>
To: Chengci.Xu <chengci.xu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>
Date: Tue, 9 Aug 2022 13:58:39 +0800
In-Reply-To: <20220801021851.7169-3-chengci.xu@mediatek.com>
References: <20220801021851.7169-1-chengci.xu@mediatek.com>
	 <20220801021851.7169-3-chengci.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_235236_000572_A85C1C42 
X-CRM114-Status: GOOD (  23.17  )
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

On Mon, 2022-08-01 at 10:18 +0800, Chengci.Xu wrote:
> In MT8188, the register to enable/disable IOMMU can only be
> configured
> in secure world by SMC call. We should add a return value for
> configure
> port function for preparation because SMC call may return an error
> result.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index d7cb7ead2ac7..08c1668d47bf 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -127,7 +127,7 @@ struct mtk_smi_common_plat {
>  
>  struct mtk_smi_larb_gen {
>  	int port_in_larb[MTK_LARB_NR_MAX + 1];
> -	void (*config_port)(struct device *dev);
> +	int				(*config_port)(struct device
> *dev);
>  	unsigned int			larb_direct_to_common_mask;
>  	unsigned int			flags_general;
>  	const u8			(*ostd)[SMI_LARB_PORT_NR_MAX];
> @@ -185,7 +185,7 @@ static const struct component_ops
> mtk_smi_larb_component_ops = {
>  	.unbind = mtk_smi_larb_unbind,
>  };
>  
> -static void mtk_smi_larb_config_port_gen1(struct device *dev)
> +static int mtk_smi_larb_config_port_gen1(struct device *dev)
>  {
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
> @@ -214,23 +214,26 @@ static void
> mtk_smi_larb_config_port_gen1(struct device *dev)
>  			common->smi_ao_base
>  			+ REG_SMI_SECUR_CON_ADDR(m4u_port_id));
>  	}
> +	return 0;
>  }
>  
> -static void mtk_smi_larb_config_port_mt8167(struct device *dev)
> +static int mtk_smi_larb_config_port_mt8167(struct device *dev)
>  {
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  
>  	writel(*larb->mmu, larb->base + MT8167_SMI_LARB_MMU_EN);
> +	return 0;
>  }
>  
> -static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> +static int mtk_smi_larb_config_port_mt8173(struct device *dev)
>  {
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  
>  	writel(*larb->mmu, larb->base + MT8173_SMI_LARB_MMU_EN);
> +	return 0;
>  }
>  
> -static void mtk_smi_larb_config_port_gen2_general(struct device
> *dev)
> +static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  {
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  	u32 reg, flags_general = larb->larb_gen->flags_general;
> @@ -238,7 +241,7 @@ static void
> mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  	int i;
>  
>  	if (BIT(larb->larbid) & larb->larb_gen-
> >larb_direct_to_common_mask)
> -		return;
> +		return 0;
>  
>  	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_THRT_UPDATE)) {
>  		reg = readl_relaxed(larb->base +
> SMI_LARB_CMD_THRT_CON);
> @@ -259,6 +262,7 @@ static void
> mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  		reg |= BANK_SEL(larb->bank[i]);
>  		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
>  	}
> +	return 0;
>  }
>  
>  static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
> @@ -511,7 +515,9 @@ static int __maybe_unused
> mtk_smi_larb_resume(struct device *dev)
>  		mtk_smi_larb_sleep_ctrl_disable(larb);
>  
>  	/* Configure the basic setting for this larb */
> -	larb_gen->config_port(dev);
> +	ret = larb_gen->config_port(dev);
> +	if (ret)
> +		return ret;

return larb_gen->config_port(dev);

After this,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

>  
>  	return 0;
>  }


