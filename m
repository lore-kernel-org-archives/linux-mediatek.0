Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A05FC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:07:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A81B61CA8
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A81B61CA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8rnsx5Zut/R9oq8Q+cTBIjsfo1+POVj30s1kjpmBck=; b=2cd23/R85WOjOf
	BUnkTJueCh1JOP5qK7n2up2or9KnnXF1bqGkqasrz1N/8ovsozGC2tFq8rXsOyfc1baHrh4RENYWc
	TORSAQB8PA45jofeIJgZ881Oj00nrpbrlrYAWw1bTLE0f1NxiwMjAentCfUDpOsj2nDlT+sCskB9k
	CZodb3jWgqKIBaoo0h9JDHwt7a1Z7OFOUh+883MmXmizT1wDSGMf/yTSXR4S8/dFQogzeEvXxcIpk
	oAsUWWJSGQ7K9V5q7RfI0bLffQMXhqPkivs7qCZpo9zM9W2Jrv40HjUWBX9lGL47bly0r5sjDaJjx
	PSIOacczWWf/UalB3dBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m11ed-00DoKU-Bu; Wed, 07 Jul 2021 07:07:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m11eZ-00DoJs-7l; Wed, 07 Jul 2021 07:07:30 +0000
X-UUID: 279aaf620ee24263b2c1bae507f86f58-20210707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XUFiV0mz1tACoql8gbf5EXY5tu0IL4q4i5iWTDtveXk=; 
 b=Dx1RY6mCob1G/5eXvGDiOLRmATtpQgJ17/KH1riReFuISYpaZGw8YQL5lV8yfT6IizN/VX1WPufkCMZuuyzmVpcpzi1rvHD0E/CWr86bTdws+TAs7093HVywyTHngCkGUQLqmgoOvZY5zm2ezMzzMH46ajbo/G69kPkP6aaCD5o=;
X-UUID: 279aaf620ee24263b2c1bae507f86f58-20210707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1203639992; Wed, 07 Jul 2021 00:07:23 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 00:02:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 15:02:07 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 15:02:07 +0800
Message-ID: <1625641327.7824.37.camel@mtksdaap41>
Subject: Re: [PATCH v1 16/17] drm/mediatek: add MERGE support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 15:02:07 +0800
In-Reply-To: <20210707041249.29816-17-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-17-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_000727_340262_A4209C3C 
X-CRM114-Status: GOOD (  19.39  )
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

Hi, Jason:

On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> 1. Add MERGE module file.
> 2. Add REG_FLD macro in mtk_dem_crtc header to support
>    bitwise register settings.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  11 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 623 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  31 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  drivers/soc/mediatek/mtk-mutex.c            |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h      |   6 +
>  10 files changed, 695 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index dc54a7a69005..5fd95b9d5aae 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -5,6 +5,7 @@ mediatek-drm-y := mtk_disp_ccorr.o \
>  		  mtk_disp_gamma.o \
>  		  mtk_disp_ovl.o \
>  		  mtk_disp_rdma.o \
> +		  mtk_disp_merge.o \
>  		  mtk_drm_crtc.o \
>  		  mtk_drm_ddp_comp.o \
>  		  mtk_drm_drv.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index cafd9df2d63b..7fd5260e2a72 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -89,4 +89,15 @@ void mtk_rdma_enable_vblank(struct device *dev,
>  			    void *vblank_cb_data);
>  void mtk_rdma_disable_vblank(struct device *dev);
>  
> +int mtk_merge_clk_enable(struct device *dev);
> +void mtk_merge_clk_disable(struct device *dev);
> +void mtk_merge_enable_vblank(struct device *dev,
> +		    void (*vblank_cb)(void *), void *vblank_cb_data);
> +void mtk_merge_disable_vblank(struct device *dev);
> +void mtk_merge_config(struct device *dev, unsigned int width,
> +		     unsigned int height, unsigned int vrefresh,
> +		     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start(struct device *dev);
> +void mtk_merge_stop(struct device *dev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> new file mode 100644
> index 000000000000..4867fe3fb93f
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -0,0 +1,623 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.

2021

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_disp_drv.h"
> +
> +#define DISP_REG_MERGE_CTRL (0x000)
> +#define FLD_MERGE_EN REG_FLD_MSB_LSB(0, 0)

#define FLD_MERGE_EN   BIT(0)

> +#define FLD_MERGE_RST REG_FLD_MSB_LSB(4, 4)
> +#define FLD_MERGE_LR_SWAP REG_FLD_MSB_LSB(8, 8)
> +#define FLD_MERGE_DCM_DIS REG_FLD_MSB_LSB(12, 12)
> +
> +#define DISP_REG_MERGE_WIDTH (0x004)
> +#define FLD_IN_WIDHT_L REG_FLD_MSB_LSB(15, 0)

#define FLD_IN_WIDHT_L GENMASK(15, 0)

> +#define FLD_IN_WIDHT_R REG_FLD_MSB_LSB(31, 16)
> +
> +#define DISP_REG_MERGE_HEIGHT (0x008)
> +#define FLD_IN_HEIGHT REG_FLD_MSB_LSB(15, 0)
> +
> +#define DISP_REG_MERGE_SHADOW_CRTL (0x00c)
> +
> +#define DISP_REG_MERGE_DGB0 (0x010)
> +#define FLD_PIXEL_CNT REG_FLD_MSB_LSB(15, 0)
> +#define FLD_MERGE_STATE REG_FLD_MSB_LSB(17, 16)
> +
> +#define DISP_REG_MERGE_DGB1 (0x014)
> +#define FLD_LINE_CNT REG_FLD_MSB_LSB(15, 0)
> +
> +#define DISP_REG_MERGE_CFG2_0 (0x160)
> +
> +#define DISP_REG_MERGE_CFG2_2 (0x168)
> +
> +#define MT8195_DISP_MERGE_RESET		0x004

MT8195_DISP_MERGE_RESET is useless, so remove.

> +#define MT8195_DISP_MERGE_CFG_0		0x010
> +#define MT8195_DISP_MERGE_CFG_1		0x014
> +#define MT8195_DISP_MERGE_CFG_4		0x020
> +#define MT8195_DISP_MERGE_CFG_5		0x024
> +#define MT8195_DISP_MERGE_CFG_8		0x030
> +#define MT8195_DISP_MERGE_CFG_9		0x034
> +#define MT8195_DISP_MERGE_CFG_10	0x038
> +#define MT8195_DISP_MERGE_CFG_11	0x03c
> +#define MT8195_DISP_MERGE_CFG_12	0x040
> +#define CFG_11_11_1PI_1PO_BYPASS	1
> +#define CFG_11_11_2PI_2PO_BYPASS	2
> +#define CFG_10_10_2PI_1PO_BYPASS	3
> +#define CFG_10_10_2PI_2PO_BYPASS	4
> +#define CFG_10_10_1PI_1PO_BUF_MODE	5
> +#define CFG_10_10_1PI_2PO_BUF_MODE	6
> +#define CFG_10_10_2PI_1PO_BUF_MODE	7
> +#define CFG_10_10_2PI_2PO_BUF_MODE	8
> +#define CFG_10_01_1PI_1PO_BUF_MODE	9
> +#define CFG_10_01_2PI_1PO_BUF_MODE	10
> +#define CFG_01_10_1PI_1PO_BUF_MODE	11
> +#define CFG_01_10_1PI_2PO_BUF_MODE	12
> +#define CFG_01_01_1PI_1PO_BUF_MODE	13
> +#define CFG_10_11_1PI_1PO_SPLIT		14
> +#define CFG_10_11_2PI_1PO_SPLIT		15
> +#define CFG_01_11_1PI_1PO_SPLIT		16
> +#define CFG_11_10_1PI_1PO_MERGE		17
> +#define CFG_11_10_1PI_2PO_MERGE		18
> +#define CFG_10_10_1PI_1PO_TO422		19
> +#define CFG_10_10_1PI_2PO_TO444		20
> +#define CFG_10_10_2PI_2PO_TO444		21
> +#define MT8195_DISP_MERGE_CFG_13	0x044
> +#define MT8195_DISP_MERGE_CFG_14	0x048
> +#define MT8195_DISP_MERGE_CFG_15	0x04c
> +#define MT8195_DISP_MERGE_CFG_17	0x054
> +#define MT8195_DISP_MERGE_CFG_18	0x058
> +#define MT8195_DISP_MERGE_CFG_19	0x05c
> +#define MT8195_DISP_MERGE_CFG_20	0x060
> +#define MT8195_DISP_MERGE_CFG_21	0x064
> +#define MT8195_DISP_MERGE_CFG_22	0x068
> +#define MT8195_DISP_MERGE_CFG_23	0x06c
> +#define MT8195_DISP_MERGE_CFG_24	0x070
> +#define MT8195_DISP_MERGE_CFG_25	0x074
> +#define MT8195_DISP_MERGE_CFG_26	0x078
> +#define MT8195_DISP_MERGE_CFG_27	0x07c
> +#define MT8195_DISP_MERGE_CFG_28	0x080
> +#define MT8195_DISP_MERGE_CFG_29	0x084
> +#define MT8195_DISP_MERGE_CFG_36	0x0a0
> +#define MT8195_DISP_MERGE_CFG_36_FLD_ULTRA_EN \
> +	REG_FLD(1, 0)
> +#define MT8195_DISP_MERGE_CFG_36_FLD_PREULTRA_EN \
> +	REG_FLD(1, 4)
> +#define MT8195_DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN \
> +	REG_FLD(1, 8)
> +#define MT8195_DISP_MERGE_CFG_36_VAL_ULTRA_EN(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_36_FLD_ULTRA_EN, val)
> +#define MT8195_DISP_MERGE_CFG_36_VAL_PREULTRA_EN(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_36_FLD_PREULTRA_EN, val)
> +#define MT8195_DISP_MERGE_CFG_36_VAL_HALT_FOR_DVFS_EN(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN, val)
> +#define MT8195_DISP_MERGE_CFG_37	0x0a4
> +#define MT8195_DISP_MERGE_CFG_37_FLD_BUFFER_MODE \
> +	REG_FLD(2, 0)
> +#define MT8195_DISP_MERGE_CFG_37_VAL_BUFFER_MODE(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_37_FLD_BUFFER_MODE, val)
> +#define MT8195_DISP_MERGE_CFG_38	0x0a8
> +#define MT8195_DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA \
> +	REG_FLD(1, 0)
> +#define MT8195_DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA \
> +	REG_FLD(1, 4)
> +#define MT8195_DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH \
> +	REG_FLD(16, 16)
> +#define MT8195_DISP_MERGE_CFG_38_VAL_VDE_BLOCK_ULTRA(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA, val)
> +#define MT8195_DISP_MERGE_CFG_38_VAL_VALID_TH_BLOCK_ULTRA(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA, val)
> +#define MT8195_DISP_MERGE_CFG_38_VAL_ULTRA_FIFO_VALID_TH(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH, val)
> +#define MT8195_DISP_MERGE_CFG_39	0x0ac
> +#define MT8195_DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA \
> +	REG_FLD(1, 8)
> +#define MT8195_DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA \
> +	REG_FLD(1, 12)
> +#define MT8195_DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH \
> +	REG_FLD(16, 16)
> +#define MT8195_DISP_MERGE_CFG_39_VAL_NVDE_FORCE_PREULTRA(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA, val)
> +#define MT8195_DISP_MERGE_CFG_39_VAL_NVALID_TH_FORCE_PREULTRA(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA, val)
> +#define MT8195_DISP_MERGE_CFG_39_VAL_PREULTRA_FIFO_VALID_TH(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH, val)
> +#define MT8195_DISP_MERGE_CFG_40	0x0b0
> +#define MT8195_DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW \
> +	REG_FLD(16, 0)
> +#define MT8195_DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH \
> +	REG_FLD(16, 16)
> +#define MT8195_DISP_MERGE_CFG_40_VAL_ULTRA_TH_LOW(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW, (val))
> +#define MT8195_DISP_MERGE_CFG_40_VAL_ULTRA_TH_HIGH(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH, val)
> +#define MT8195_DISP_MERGE_CFG_41	0x0b4
> +#define MT8195_DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW \
> +	REG_FLD(16, 0)
> +#define MT8195_DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH \
> +	REG_FLD(16, 16)
> +#define MT8195_DISP_MERGE_CFG_41_VAL_PREULTRA_TH_LOW(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW, val)
> +#define MT8195_DISP_MERGE_CFG_41_VAL_PREULTRA_TH_HIGH(val) \
> +	REG_FLD_VAL(MT8195_DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH, val)
> +
> +struct mtk_disp_merge_data {
> +	bool need_golden_setting;
> +	enum mtk_ddp_comp_id gs_comp_id;
> +};

Now only support mt8195-merge, so remove mtk_disp_merge_data.

> +
> +struct mtk_merge_config_struct {
> +	unsigned short width_right;
> +	unsigned short width_left;
> +	unsigned int height;
> +	unsigned int fmt;
> +	unsigned int mode;
> +	unsigned int swap;

Could you explain this parameter?

> +};
> +
> +struct mtk_disp_merge {
> +	struct mtk_ddp_comp ddp_comp;
> +	struct drm_crtc *crtc;

I think sub driver should get rid of ddp_comp and crtc.

> +	struct clk *clk;
> +	struct clk *async_clk;
> +	void __iomem *regs;
> +	struct cmdq_client_reg		cmdq_reg;
> +	int irq;
> +	void (*vblank_cb)(void *data);

Why implement vblank_cb? For the first patch of one driver, just keep
the basic function.

> +	void *vblank_cb_data;
> +	const struct mtk_disp_merge_data *data;
> +};
> +
> +static struct mtk_ddp_comp *merge_5_comp;

Useless, so remove.

> +
> +static inline struct mtk_disp_merge *comp_to_merge(struct mtk_ddp_comp *comp)
> +{
> +	return container_of(comp, struct mtk_disp_merge, ddp_comp);
> +}

Useless, so remove.

> +
> +void mtk_merge_start(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write_mask(NULL, 0x1, &priv->cmdq_reg, priv->regs,
> +		DISP_REG_MERGE_CTRL, ~0);

Your mask is 0xffffffff, use mtk_ddp_write().

> +}
> +
> +void mtk_merge_stop(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write_mask(NULL, 0x0, &priv->cmdq_reg, priv->regs,
> +		DISP_REG_MERGE_CTRL, ~0);

Your mask is 0xffffffff, use mtk_ddp_write().

> +}
> +
> +static int mtk_merge_check_params(struct mtk_merge_config_struct *merge_config)
> +{
> +	if (!merge_config->height ||
> +		!merge_config->width_left || !merge_config->width_right) {
> +		pr_err("%s:merge input width l(%u) w(%u) h(%u)\n",
> +			  __func__, merge_config->width_left,
> +			  merge_config->width_right, merge_config->height);
> +		return -EINVAL;
> +	}
> +	pr_debug("%s:merge input width l(%u) r(%u) height(%u)\n",
> +			  __func__, merge_config->width_left,
> +			  merge_config->width_right, merge_config->height);
> +	return 0;
> +}
> +
> +static int mtk_merge_golden_setting(struct mtk_disp_merge *priv,
> +				  struct cmdq_pkt *handle)
> +{
> +	int ultra_en = 1;
> +	int preultra_en = 1;
> +	int halt_for_dvfs_en = 0;
> +	int buffer_mode = 3;
> +	int vde_block_ultra = 0;
> +	int valid_th_block_ultra = 0;
> +	int ultra_fifo_valid_th = 0;
> +	int nvde_force_preultra = 0;
> +	int nvalid_th_force_preultra = 0;
> +	int preultra_fifo_valid_th = 0;
> +	int ultra_th_low = 0xe10;
> +	int ultra_th_high = 0x12c0;
> +	int preultra_th_low = 0x12c0;
> +	int preultra_th_high = 0x1518;
> +
> +	mtk_ddp_write_mask(handle,
> +		MT8195_DISP_MERGE_CFG_36_VAL_ULTRA_EN(ultra_en) |
> +		MT8195_DISP_MERGE_CFG_36_VAL_PREULTRA_EN(preultra_en) |
> +		MT8195_DISP_MERGE_CFG_36_VAL_HALT_FOR_DVFS_EN(halt_for_dvfs_en),
> +		&priv->cmdq_reg, priv->regs,
> +		MT8195_DISP_MERGE_CFG_36,
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_36_FLD_ULTRA_EN) |
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_36_FLD_PREULTRA_EN) |
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN));
> +
> +	mtk_ddp_write_mask(handle,
> +		MT8195_DISP_MERGE_CFG_37_VAL_BUFFER_MODE(buffer_mode),
> +		&priv->cmdq_reg, priv->regs,
> +		MT8195_DISP_MERGE_CFG_37,
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_37_FLD_BUFFER_MODE));
> +
> +	mtk_ddp_write_mask(handle,
> +		MT8195_DISP_MERGE_CFG_38_VAL_VDE_BLOCK_ULTRA
> +		(vde_block_ultra) |
> +		MT8195_DISP_MERGE_CFG_38_VAL_VALID_TH_BLOCK_ULTRA
> +		(valid_th_block_ultra) |
> +		MT8195_DISP_MERGE_CFG_38_VAL_ULTRA_FIFO_VALID_TH
> +		(ultra_fifo_valid_th),
> +		&priv->cmdq_reg, priv->regs,
> +		MT8195_DISP_MERGE_CFG_38,
> +		REG_FLD_MASK
> +		(MT8195_DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA) |
> +		REG_FLD_MASK
> +		(MT8195_DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA) |
> +		REG_FLD_MASK
> +		(MT8195_DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH));
> +
> +	mtk_ddp_write_mask(handle,
> +		MT8195_DISP_MERGE_CFG_39_VAL_NVDE_FORCE_PREULTRA
> +		(nvde_force_preultra) |
> +		MT8195_DISP_MERGE_CFG_39_VAL_NVALID_TH_FORCE_PREULTRA
> +		(nvalid_th_force_preultra) |
> +		MT8195_DISP_MERGE_CFG_39_VAL_PREULTRA_FIFO_VALID_TH
> +		(preultra_fifo_valid_th),
> +		&priv->cmdq_reg, priv->regs,
> +		MT8195_DISP_MERGE_CFG_39,
> +		REG_FLD_MASK
> +		(MT8195_DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA) |
> +		REG_FLD_MASK
> +		(MT8195_DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA) |
> +		REG_FLD_MASK
> +		(MT8195_DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH));
> +
> +	mtk_ddp_write_mask(handle,
> +		MT8195_DISP_MERGE_CFG_40_VAL_ULTRA_TH_LOW(ultra_th_low) |
> +		MT8195_DISP_MERGE_CFG_40_VAL_ULTRA_TH_HIGH(ultra_th_high),
> +		&priv->cmdq_reg, priv->regs,
> +		MT8195_DISP_MERGE_CFG_40,
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW) |
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH));
> +
> +	mtk_ddp_write_mask(handle,
> +		MT8195_DISP_MERGE_CFG_41_VAL_PREULTRA_TH_LOW(preultra_th_low) |
> +		MT8195_DISP_MERGE_CFG_41_VAL_PREULTRA_TH_HIGH(preultra_th_high),
> +		&priv->cmdq_reg, priv->regs,
> +		MT8195_DISP_MERGE_CFG_41,
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW) |
> +		REG_FLD_MASK(MT8195_DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH));
> +
> +	return 0;
> +}
> +
> +void mtk_merge_config(struct device *dev, unsigned int w,
> +				  unsigned int h, unsigned int vrefresh,
> +				  unsigned int bpc, struct cmdq_pkt *handle)
> +{
> +	struct mtk_merge_config_struct merge_config;
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +	struct mtk_ddp_comp *comp = &priv->ddp_comp;
> +
> +	/*golden setting*/
> +	if (priv->data) {
> +		if (priv->data->need_golden_setting &&
> +			priv->data->gs_comp_id == comp->id)
> +			mtk_merge_golden_setting(priv, handle);
> +	}
> +
> +	switch (comp->id) {
> +	case DDP_COMPONENT_MERGE0:
> +		merge_config.mode = CFG_10_10_1PI_2PO_BUF_MODE;
> +		merge_config.width_left = w;
> +		merge_config.width_right = w;
> +		merge_config.height = h;
> +		merge_config.swap = 0;
> +		break;
> +	case DDP_COMPONENT_MERGE5:
> +		merge_config.mode = CFG_10_10_2PI_2PO_BUF_MODE;
> +		merge_config.width_left = w;
> +		merge_config.width_right = w;
> +		merge_config.height = h;
> +		merge_config.swap = 0;
> +		break;
> +	default:
> +		pr_err("No find component merge %d\n", comp->id);
> +		return;
> +	}
> +
> +	mtk_merge_check_params(&merge_config);
> +
> +	switch (merge_config.mode) {
> +	case CFG_10_10_1PI_1PO_BUF_MODE:

CFG_10_10_1PI_1PO_BUF_MODE is useless, so remove.

> +	case CFG_10_10_1PI_2PO_BUF_MODE:
> +	case CFG_10_10_2PI_2PO_BUF_MODE:
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_left),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_0, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_left),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_4, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_left),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_24, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_left),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_25, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			merge_config.swap,
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_10, 0x1f);
> +	break;
> +	case CFG_11_10_1PI_2PO_MERGE:

CFG_11_10_1PI_2PO_MERGE is useless, so remove.

> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_left),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_0, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_right),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_1, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | w),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_4, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_left),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_24, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_right),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_25, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_left),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_26, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			(merge_config.height << 16 | merge_config.width_right),
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_27, ~0);
> +
> +		mtk_ddp_write_mask(handle,
> +			merge_config.swap,
> +			&priv->cmdq_reg, priv->regs,
> +			MT8195_DISP_MERGE_CFG_10, 0x1f);
> +	break;
> +	default:
> +	break;
> +	}
> +	mtk_ddp_write_mask(handle, merge_config.mode,
> +		&priv->cmdq_reg, priv->regs, MT8195_DISP_MERGE_CFG_12, 0x1f);
> +	mtk_ddp_write_mask(handle, 0x1,
> +		&priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CTRL, 0x1);
> +}
> +
> +int mtk_merge_clk_enable(struct device *dev)
> +{
> +	int ret = 0;
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	ret = pm_runtime_get_sync(dev);
> +
> +	if (priv->clk) {
> +		ret = clk_prepare_enable(priv->clk);
> +		if (ret)
> +			pr_err("merge clk prepare enable failed\n");
> +	}
> +
> +	if (priv->async_clk) {
> +		ret = clk_prepare_enable(priv->async_clk);
> +		if (ret)
> +			pr_err("async clk prepare enable failed\n");
> +	}
> +
> +	return ret;
> +}
> +
> +void mtk_merge_clk_disable(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	if (priv->async_clk)
> +		clk_disable_unprepare(priv->async_clk);
> +
> +	if (priv->clk)
> +		clk_disable_unprepare(priv->clk);
> +
> +	pm_runtime_put_sync(dev);
> +}
> +
> +void mtk_merge_enable_vblank(struct device *dev,
> +			    void (*vblank_cb)(void *),
> +			    void *vblank_cb_data)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +	int irq_frame_done_en = BIT(16);
> +
> +	priv->vblank_cb = vblank_cb;
> +	priv->vblank_cb_data = vblank_cb_data;
> +
> +	writel(irq_frame_done_en, priv->regs + DISP_REG_MERGE_CFG2_0);
> +}

Useless, so remove.

> +
> +void mtk_merge_disable_vblank(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	priv->vblank_cb = NULL;
> +	priv->vblank_cb_data = NULL;
> +
> +	writel(0x0, priv->regs + DISP_REG_MERGE_CFG2_0);
> +}

Useless, so remove.

> +
> +static int mtk_disp_merge_bind(struct device *dev, struct device *master,
> +			       void *data)
> +{
> +	return 0;
> +}
> +
> +static void mtk_disp_merge_unbind(struct device *dev, struct device *master,
> +				  void *data)
> +{
> +}
> +
> +static irqreturn_t mtk_disp_merge_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_disp_merge *priv = dev_id;
> +
> +	/* Clear frame completion interrupt */
> +	writel(0x1, priv->regs + DISP_REG_MERGE_CFG2_2);
> +	writel(0x0, priv->regs + DISP_REG_MERGE_CFG2_2);
> +
> +	if (!priv->vblank_cb)
> +		return IRQ_NONE;
> +
> +	priv->vblank_cb(priv->vblank_cb_data);
> +
> +	return IRQ_HANDLED;
> +}

Useless, so remove.

> +
> +static const struct component_ops mtk_disp_merge_component_ops = {
> +	.bind	= mtk_disp_merge_bind,
> +	.unbind = mtk_disp_merge_unbind,
> +};
> +
> +static int mtk_disp_merge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct mtk_disp_merge *priv;
> +	enum mtk_ddp_comp_id comp_id;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_MERGE);
> +	if ((int)comp_id < 0) {
> +		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
> +		return comp_id;
> +	}
> +
> +	priv->ddp_comp.id = comp_id;
> +
> +	if (comp_id == DDP_COMPONENT_MERGE5)
> +		merge_5_comp = &priv->ddp_comp;
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "failed to get merge clk\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regs)) {
> +		dev_err(dev, "failed to ioremap merge\n");
> +		return PTR_ERR(priv->regs);
> +	}
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> +	if (ret)
> +		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq < 0)
> +		priv->irq = 0;
> +
> +	priv->async_clk = of_clk_get(dev->of_node, 1);

From binding document and device tree, there is no async clk, would you
modify binding document?

Regards,
CK

> +	if (IS_ERR(priv->async_clk)) {
> +		ret = PTR_ERR(priv->async_clk);
> +		dev_dbg(dev, "No merge async clock: %d\n", ret);
> +		priv->async_clk = NULL;
> +	}
> +
> +	priv->data = of_device_get_match_data(dev);
> +
> +	if (priv->irq) {
> +		ret = devm_request_irq(dev, priv->irq,
> +					mtk_disp_merge_irq_handler,
> +					IRQF_TRIGGER_NONE, dev_name(dev), priv);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to request irq %d: %d\n",
> +					priv->irq, ret);
> +			return ret;
> +		}
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	pm_runtime_enable(dev);
> +
> +	ret = component_add(dev, &mtk_disp_merge_component_ops);
> +	if (ret != 0) {
> +		dev_err(dev, "Failed to add component: %d\n", ret);
> +		pm_runtime_disable(dev);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_disp_merge_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &mtk_disp_merge_component_ops);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct mtk_disp_merge_data mt8195_merge_driver_data = {
> +	.need_golden_setting = true,
> +	.gs_comp_id = DDP_COMPONENT_MERGE5,
> +};
> +
> +static const struct of_device_id mtk_disp_merge_driver_dt_match[] = {
> +	{
> +		.compatible = "mediatek,mt8195-disp-merge",
> +		.data = &mt8195_merge_driver_data
> +	},
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
> +
> +struct platform_driver mtk_disp_merge_driver = {
> +	.probe = mtk_disp_merge_probe,
> +	.remove = mtk_disp_merge_remove,
> +	.driver = {
> +		.name = "mediatek-disp-merge",
> +		.owner = THIS_MODULE,
> +		.of_match_table = mtk_disp_merge_driver_dt_match,
> +	},
> +};
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index cb9a36c48d4f..7419cd0fb424 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -14,6 +14,37 @@
>  #define MTK_MAX_BPC	10
>  #define MTK_MIN_BPC	3
>  
> +#define _MASK_SHIFT(val, width, shift) \
> +	(((val) >> (shift)) & ((1 << (width)) - 1))
> +
> +#define REG_FLD(width, shift) \
> +	((unsigned int)((((width) & 0xff) << 16) | ((shift) & 0xff)))
> +
> +#define REG_FLD_MSB_LSB(msb, lsb) REG_FLD((msb) - (lsb) + 1, (lsb))
> +
> +#define REG_FLD_WIDTH(field) ((unsigned int)(((field) >> 16) & 0xff))
> +
> +#define REG_FLD_SHIFT(field) ((unsigned int)((field) & 0xff))
> +
> +#define REG_FLD_MASK(field) \
> +	((unsigned int)((1ULL << REG_FLD_WIDTH(field)) - 1) \
> +	 << REG_FLD_SHIFT(field))
> +
> +#define REG_FLD_VAL(field, val) \
> +	(((val) << REG_FLD_SHIFT(field)) & REG_FLD_MASK(field))
> +
> +#define REG_FLD_VAL_GET(field, regval) \
> +	(((regval) & REG_FLD_MASK(field)) >> REG_FLD_SHIFT(field))
> +
> +#define DISP_REG_GET_FIELD(field, reg32) \
> +	REG_FLD_VAL_GET(field, __raw_readl((unsigned long *)(reg32)))
> +
> +#define SET_VAL_MASK(o_val, o_mask, i_val, i_fld) \
> +	do { \
> +		(o_val) |= ((i_val) << REG_FLD_SHIFT(i_fld)); \
> +		(o_mask) |= (REG_FLD_MASK(i_fld)); \
> +	} while (0)
> +
>  void mtk_drm_crtc_commit(struct drm_crtc *crtc);
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			const enum mtk_ddp_comp_id *path,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index f154f7c0cd11..2ccf3db1950d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -339,6 +339,14 @@ static const struct mtk_ddp_comp_funcs ddp_rdma = {
>  	.layer_config = mtk_rdma_layer_config,
>  };
>  
> +static const struct mtk_ddp_comp_funcs ddp_merge = {
> +	.clk_enable = mtk_merge_clk_enable,
> +	.clk_disable = mtk_merge_clk_disable,
> +	.start = mtk_merge_start,
> +	.stop = mtk_merge_stop,
> +	.config = mtk_merge_config,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_ufoe = {
>  	.clk_enable = mtk_ddp_clk_enable,
>  	.clk_disable = mtk_ddp_clk_disable,
> @@ -362,6 +370,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>  	[MTK_DISP_MUTEX] = "mutex",
>  	[MTK_DISP_OD] = "od",
>  	[MTK_DISP_BLS] = "bls",
> +	[MTK_DISP_MERGE] = "merge",
>  };
>  
>  struct mtk_ddp_comp_match {
> @@ -397,6 +406,12 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
>  	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
>  	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
> +	[DDP_COMPONENT_MERGE0]	= { MTK_DISP_MERGE,	0, &ddp_merge },
> +	[DDP_COMPONENT_MERGE1]	= { MTK_DISP_MERGE,	1, &ddp_merge },
> +	[DDP_COMPONENT_MERGE2]	= { MTK_DISP_MERGE,	2, &ddp_merge },
> +	[DDP_COMPONENT_MERGE3]	= { MTK_DISP_MERGE,	3, &ddp_merge },
> +	[DDP_COMPONENT_MERGE4]	= { MTK_DISP_MERGE,	4, &ddp_merge },
> +	[DDP_COMPONENT_MERGE5]	= { MTK_DISP_MERGE,	5, &ddp_merge },
>  	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
>  	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
>  	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> @@ -515,6 +530,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
>  	    type == MTK_DISP_CCORR ||
>  	    type == MTK_DISP_COLOR ||
>  	    type == MTK_DISP_GAMMA ||
> +	    type == MTK_DISP_MERGE ||
>  	    type == MTK_DPI ||
>  	    type == MTK_DSI ||
>  	    type == MTK_DISP_OVL ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..038775b4531b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -34,6 +34,7 @@ enum mtk_ddp_comp_type {
>  	MTK_DISP_MUTEX,
>  	MTK_DISP_OD,
>  	MTK_DISP_BLS,
> +	MTK_DISP_MERGE,
>  	MTK_DDP_COMP_TYPE_MAX,
>  };
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 635cebf9ff0f..f891316008aa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -462,6 +462,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DISP_DITHER },
>  	{ .compatible = "mediatek,mt8195-disp-dither",
>  	  .data = (void *)MTK_DISP_DITHER },
> +	{ .compatible = "mediatek,mt8195-disp-merge",
> +	  .data = (void *)MTK_DISP_MERGE },
>  	{ .compatible = "mediatek,mt8173-disp-ufoe",
>  	  .data = (void *)MTK_DISP_UFOE },
>  	{ .compatible = "mediatek,mt2701-dsi",
> @@ -579,6 +581,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  		if (comp_type == MTK_DISP_CCORR ||
>  		    comp_type == MTK_DISP_COLOR ||
>  		    comp_type == MTK_DISP_GAMMA ||
> +		    comp_type == MTK_DISP_MERGE ||
>  		    comp_type == MTK_DISP_OVL ||
>  		    comp_type == MTK_DISP_OVL_2L ||
>  		    comp_type == MTK_DISP_RDMA ||
> @@ -683,6 +686,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
>  	&mtk_disp_rdma_driver,
>  	&mtk_dpi_driver,
>  	&mtk_drm_platform_driver,
> +	&mtk_disp_merge_driver,
>  	&mtk_dsi_driver,
>  };
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 637f5669e895..18548a373626 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -51,6 +51,7 @@ extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_gamma_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
> +extern struct platform_driver mtk_disp_merge_driver;
>  extern struct platform_driver mtk_dpi_driver;
>  extern struct platform_driver mtk_dsi_driver;
>  
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 080bdabfb024..84ece5486902 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -284,6 +284,7 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
>  	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
>  	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
>  	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
>  	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
>  };
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 2228bf6133da..3135ce82a7f7 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -39,6 +39,12 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_UFOE,
>  	DDP_COMPONENT_WDMA0,
>  	DDP_COMPONENT_WDMA1,
> +	DDP_COMPONENT_MERGE0,
> +	DDP_COMPONENT_MERGE1,
> +	DDP_COMPONENT_MERGE2,
> +	DDP_COMPONENT_MERGE3,
> +	DDP_COMPONENT_MERGE4,
> +	DDP_COMPONENT_MERGE5,
>  	DDP_COMPONENT_ID_MAX,
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
