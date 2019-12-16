Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EDAC2D0CF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 08:29:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0976D20733
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 08:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="isaP74h8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p3eMdGzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0976D20733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQXAheRYC4sXgtooiF3DA9bAiJHyAyWIk21qyvzjX+4=; b=isaP74h80dHcC0
	fBw/KYJnzTh4a4j0rM/EsvrXdWq5XTxMkOtnCDFyTV+BcuJPvnc1YU2Sh3bJi1vfltiIPbBcK67vC
	/Jx2IUAb+oreUaKRXwe5qZ1rJB9jyyWdkG5/Ms01nxBgu7zGvdbtTumQZJFrpMirCM11ytY0IYfEG
	eoKBoILtf5dAG3wEfVz7ekemGeYxDoy2S0jrDeRhtm1tDWkkZUN7Gb1SaDNHYMwhLybFJFBHo67+2
	ZYIRNsYXYdAHaMXs9a+myvG70ZMA+nGgqXCyq8kF+fEqqMLmiPZwX3q2IS6vYk5QNwa9yqRnsjfrB
	9e5whAkK4dFPhX0taW2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igllC-0004ep-Ej; Mon, 16 Dec 2019 08:29:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igll9-0004d5-2C
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 08:29:44 +0000
X-UUID: 42b507f361084b5ba654ed6c6663b5f5-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XdO6DxCLv2eqDKtcLSh5mOGePmSad4AJHFN1yrqNlXg=; 
 b=p3eMdGzB23TqP1b6/0bU0UEOpgeC+pVU8dIRzL8mmjh6UJ1vGDFzuNPeldV2130z41NHy6LtcruqZjtKFj/3lCEhn0PPCTEKezo5C3za1S/5kBVOxVlNo6yOqO/mx7u4EYutHsGNuSheP1YzQdGLlckXXjjKQVUikkUM5u+0CTM=;
X-UUID: 42b507f361084b5ba654ed6c6663b5f5-20191216
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1136253284; Mon, 16 Dec 2019 00:29:36 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 00:29:54 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Dec 2019 16:29:56 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Dec 2019 16:29:18 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/mediatek: add the mipitx driving control
Date: Mon, 16 Dec 2019 16:29:36 +0800
Message-ID: <20191216082937.119164-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216082937.119164-1-jitao.shi@mediatek.com>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9DF936B3070C5451CC197DF71E14FCCB93E815FB780F9A5B6D6187004E3053832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_002943_116249_450D3A8D 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a property in device tree to control the driving by different
board.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 6 ++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        | 1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index e4d34484ecc8..ec8406c86bfb 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -125,6 +125,12 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "mipitx-current-drive",
+				   &mipi_tx->mipitx_drive);
+	/* If can't get the "mipi_tx->mipitx_drive", set it default 0x8 */
+	if (ret < 0)
+		mipi_tx->mipitx_drive = 0x8;
+
 	ref_clk_name = __clk_get_name(ref_clk);
 
 	ret = of_property_read_string(dev->of_node, "clock-output-names",
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
index 413f35d86219..eea44327fe9f 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
@@ -27,6 +27,7 @@ struct mtk_mipi_tx {
 	struct device *dev;
 	void __iomem *regs;
 	u32 data_rate;
+	u32 mipitx_drive;
 	const struct mtk_mipitx_data *driver_data;
 	struct clk_hw pll_hw;
 	struct clk *pll;
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
index 91f08a351fd0..124fdf95f1e5 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
@@ -17,6 +17,9 @@
 #define RG_DSI_BG_CORE_EN		BIT(7)
 #define RG_DSI_PAD_TIEL_SEL		BIT(8)
 
+#define MIPITX_VOLTAGE_SEL	0x0010
+#define RG_DSI_HSTX_LDO_REF_SEL		(0xf << 6)
+
 #define MIPITX_PLL_PWR		0x0028
 #define MIPITX_PLL_CON0		0x002c
 #define MIPITX_PLL_CON1		0x0030
@@ -123,6 +126,10 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
 	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
 
+	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_VOLTAGE_SEL,
+				RG_DSI_HSTX_LDO_REF_SEL,
+				mipi_tx->mipitx_drive << 6);
+
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
 }
 
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
