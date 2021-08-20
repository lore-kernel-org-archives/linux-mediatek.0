Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81763C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 10:26:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47DC7610D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 10:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47DC7610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnQr6Ns5jGOqzt7BEQqqXpetRWT3GsiI7n7AxQyYsVY=; b=fek913uDfQRItC
	t00ubebLjlBYS0gIG4m9Mo0gGFoimfBfeORCDpy/OoX5MX9GPGl1smTcJ/hxzJwBpjung9HL3YMsh
	D3oejyVleT5YMXILlNmhiIDgOVSsOnMKjdcDUnBHIfZNCVsRlces2JfvW29DGeDuIiajLrFS3gJmr
	8/7qn6GZb6AD1Aiztqw2vcFOOh3mxp368u8dkU8G8t3jz6l7CTvt9fdkATmvuWHLsh+djzHNZmQG2
	VBTShl9L0DcU1p2Ymx0Z4uDIv+RE1lX/f+/iXa39Vj668ope4MroD5BWHERoBV1tNysBavkRFN4O2
	b5DoJLvCQOh+s3cog8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH1id-00AezR-FM; Fri, 20 Aug 2021 10:25:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH1iK-00AeuM-QA; Fri, 20 Aug 2021 10:25:33 +0000
X-UUID: 5301d98c19be48e294cd8d072695cff3-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Hg+A9wC5xVUwpu1LLCJpp1r0a/s3BDtm8w7sWFDT+xg=; 
 b=WDYUpP0SZHri4ELOj51yB0VlcI/2DBYXSCnztNTrZyOay3nI58vMgNutcBGrOqRsn4kdky4eiyRN/E8t4QGFrvsDwDM3J7zt19sO7+edxDSne76zbRDX++RiIe1JAlZIGCJRpv1GcrQI3hnSLnUDB1X3U0TAIhEgDaQjD7W23qg=;
X-UUID: 5301d98c19be48e294cd8d072695cff3-20210820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 510481722; Fri, 20 Aug 2021 03:25:25 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 03:25:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 18:25:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 18:25:21 +0800
Message-ID: <1629455122.11260.2.camel@mtksdaap41>
Subject: Re: [PATCH v3 12/15] drm/mediatek: add display MDP RDMA support for
 MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Fri, 20 Aug 2021 18:25:22 +0800
In-Reply-To: <20210818091847.8060-13-nancy.lin@mediatek.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-13-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_032529_253400_E92E1C13 
X-CRM114-Status: GOOD (  19.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi, Nancy:

On Wed, 2021-08-18 at 17:18 +0800, Nancy.Lin wrote:
> Add MDP_RDMA driver for MT8195. MDP_RDMA is the DMA engine of
> the ovl_adaptor component.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---

[snip]

> +
> +#define MDP_RDMA_EN                                            0x000
> +#define FLD_ROT_ENABLE                            REG_FLD(1, 0)

I would like the bitwise definition has one more indent than the byte
definition.

> +
> +#define MDP_RDMA_RESET                                         0x008
> +
> +#define MDP_RDMA_CON                                           0x020
> +#define FLD_OUTPUT_10B                            REG_FLD(1, 5)
> +#define FLD_SIMPLE_MODE                           REG_FLD(1, 4)
> +
> +#define MDP_RDMA_GMCIF_CON                                     0x028
> +#define FLD_EXT_ULTRA_EN                          REG_FLD(1, 18)
> +#define FLD_PRE_ULTRA_EN                          REG_FLD(2, 16)
> +#define FLD_ULTRA_EN                              REG_FLD(2, 12)
> +#define FLD_RD_REQ_TYPE                           REG_FLD(4, 4)
> +#define VAL_RD_REQ_TYPE_BURST_8_ACCESS       7
> +#define FLD_EXT_PREULTRA_EN                       REG_FLD(1, 3)
> +#define FLD_COMMAND_DIV                           REG_FLD(1, 0)
> +
> +#define MDP_RDMA_SRC_CON                                       0x030
> +#define FLD_OUTPUT_ARGB                           REG_FLD(1, 25)
> +#define FLD_BIT_NUMBER                            REG_FLD(2, 18)
> +#define FLD_UNIFORM_CONFIG                        REG_FLD(1, 17)
> +#define FLD_SWAP                                  REG_FLD(1, 14)
> +#define FLD_SRC_FORMAT                            REG_FLD(4, 0)
> +
> +#define MDP_RDMA_COMP_CON                                      0x038
> +#define FLD_AFBC_EN                               REG_FLD(1, 22)
> +#define FLD_AFBC_YUV_TRANSFORM                    REG_FLD(1, 21)
> +#define FLD_UFBDC_EN                              REG_FLD(1, 12)
> +
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE                          0x060
> +#define FLD_MF_BKGD_WB                            REG_FLD(23, 0)
> +
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_PIXEL                         0x068
> +#define FLD_MF_BKGD_WP                            REG_FLD(23, 0)
> +
> +#define MDP_RDMA_MF_SRC_SIZE                                   0x070
> +#define FLD_MF_SRC_H                              REG_FLD(15, 16)
> +#define FLD_MF_SRC_W                              REG_FLD(15, 0)
> +
> +#define MDP_RDMA_MF_CLIP_SIZE                                  0x078
> +#define FLD_MF_CLIP_H                             REG_FLD(15, 16)
> +#define FLD_MF_CLIP_W                             REG_FLD(15, 0)
> +
> +#define MDP_RDMA_TARGET_LINE                                   0x0a0
> +#define FLD_LINE_THRESHOLD                        REG_FLD(15, 17)
> +#define FLD_TARGET_LINE_EN                        REG_FLD(1, 16)
> +
> +#define MDP_RDMA_SRC_OFFSET_0                                  0x118
> +#define FLD_SRC_OFFSET_0                          REG_FLD(32, 0)
> +
> +#define MDP_RDMA_TRANSFORM_0                                   0x200
> +#define FLD_INT_MATRIX_SEL                        REG_FLD(5, 23)
> +#define FLD_TRANS_EN                              REG_FLD(1, 16)
> +
> +#define MDP_RDMA_UTRA_H_CON_0                                  0x248
> +#define FLD_PREUTRA_H_OFS_0                       REG_FLD(10, 10)
> +
> +#define MDP_RDMA_UTRA_L_CON_0                                  0x250
> +#define FLD_PREUTRA_L_OFS_0                       REG_FLD(10, 10)
> +
> +#define MDP_RDMA_SRC_BASE_0                                    0xf00
> +#define FLD_SRC_BASE_0                            REG_FLD(32, 0)
> +
> +#define RDMA_INPUT_SWAP		BIT(14)
> +#define RDMA_INPUT_10BIT	BIT(18)
> +

[snip]

> +
> +static void mtk_mdp_rdma_fifo_config(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
> +				     struct cmdq_client_reg *cmdq_base)
> +{
> +	unsigned int pre_ultra_h = 156;
> +	unsigned int pre_ultra_l = 104;

Give the reason why this value. You could refer to merge [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20210819022327.13040-13-jason-jh.lin@mediatek.com/

> +	unsigned int reg_mask;
> +	unsigned int reg_val;
> +	unsigned int reg;
> +
> +	reg = MDP_RDMA_GMCIF_CON;
> +	reg_val = REG_FLD_VAL(FLD_RD_REQ_TYPE, VAL_RD_REQ_TYPE_BURST_8_ACCESS) |
> +		  REG_FLD_VAL(FLD_COMMAND_DIV, 1) |
> +		  REG_FLD_VAL(FLD_EXT_PREULTRA_EN, 1) |
> +		  REG_FLD_VAL(FLD_ULTRA_EN, 0) |
> +		  REG_FLD_VAL(FLD_PRE_ULTRA_EN, 1) |
> +		  REG_FLD_VAL(FLD_EXT_ULTRA_EN, 1);
> +	reg_mask = REG_FLD_MASK(FLD_RD_REQ_TYPE) |
> +		   REG_FLD_MASK(FLD_COMMAND_DIV) |
> +		   REG_FLD_MASK(FLD_EXT_PREULTRA_EN) |
> +		   REG_FLD_MASK(FLD_ULTRA_EN) |
> +		   REG_FLD_MASK(FLD_PRE_ULTRA_EN) |
> +		   REG_FLD_MASK(FLD_EXT_ULTRA_EN);
> +	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);

#define FLD_COMMAND_DIV         BIT(0)
#define FLD_EXT_PREULTRA_EN     BIT(3)
#define FLD_RD_REQ_TYPE         GENMASK(7, 4)
#define FLD_ULTRA_EN            GENMASK(13, 12)
#define FLD_PRE_ULTRA_EN        GENMASK(17, 16)
#define FLD_PRE_ULTRA_EN_ENABLE     1
#define FLD_EXT_ULTRA_EN        BIT(18)

mtk_ddp_write_mask(cmdq_pkt, FLD_EXT_ULTRA_EN | FLD_PRE_ULTRA_EN_ENABLE
<< 16 | VAL_RD_REQ_TYPE_BURST_8_ACCESS << 4 | FLD_EXT_PREULTRA_EN |
FLD_COMMAND_DIV, cmdq_base, base, MDP_RDMA_GMCIF_CON, FLD_EXT_ULTRA_EN |
FLD_PRE_ULTRA_EN | FLD_ULTRA_EN | FLD_RD_REQ_TYPE | FLD_EXT_PREULTRA_EN
| FLD_COMMAND_DIV);

> +
> +	reg = MDP_RDMA_UTRA_H_CON_0;
> +	reg_val = REG_FLD_VAL(FLD_PREUTRA_H_OFS_0, pre_ultra_h);
> +	reg_mask = REG_FLD_MASK(FLD_PREUTRA_H_OFS_0);
> +	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
> +
> +	reg = MDP_RDMA_UTRA_L_CON_0;
> +	reg_val = REG_FLD_VAL(FLD_PREUTRA_L_OFS_0, pre_ultra_l);
> +	reg_mask = REG_FLD_MASK(FLD_PREUTRA_L_OFS_0);
> +	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
> +}
> +

[snip]

> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> new file mode 100644
> index 000000000000..50fa6e18d244
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_MDP_RDMA_H__
> +#define __MTK_MDP_RDMA_H__
> +
> +enum mtk_mdp_rdma_profile {
> +	RDMA_CSC_RGB_TO_JPEG = 0,
> +	RDMA_CSC_RGB_TO_FULL709 = 1,
> +	RDMA_CSC_RGB_TO_BT601 = 2,
> +	RDMA_CSC_RGB_TO_BT709 = 3,
> +	RDMA_CSC_JPEG_TO_RGB = 4,
> +	RDMA_CSC_FULL709_TO_RGB = 5,
> +	RDMA_CSC_BT601_TO_RGB = 6,
> +	RDMA_CSC_BT709_TO_RGB = 7,
> +	RDMA_CSC_JPEG_TO_BT601 = 8,
> +	RDMA_CSC_JPEG_TO_BT709 = 9,
> +	RDMA_CSC_BT601_TO_JPEG = 10,
> +	RDMA_CSC_BT709_TO_BT601 = 11,
> +	RDMA_CSC_BT601_TO_BT709 = 12
> +};
> +
> +struct mtk_mdp_rdma_cfg {
> +	enum mtk_mdp_rdma_profile profile;
> +	unsigned int source_width;

source_width is useless, so remove.

Regards,
CK.

> +	unsigned int pitch;
> +	unsigned int addr0;
> +	unsigned int width;
> +	unsigned int height;
> +	unsigned int x_left;
> +	unsigned int y_top;
> +	bool csc_enable;
> +	int fmt;
> +};
> +
> +#endif // __MTK_MDP_RDMA_H__
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
