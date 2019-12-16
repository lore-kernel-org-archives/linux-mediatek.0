Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B88DC43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 08:39:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DFDF206A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 08:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P6n35d/u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ftRjKrdB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DFDF206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pkl5jTwVv5KPwoNyCiaqbJJ/Sh2zhTjGBe9RL4k0/0g=; b=P6n35d/u1QRKvg
	bYNTMyWeckB+DknDV/aBorOq/OqlTTD2upq/zGFgRtq79XPR1Q8SEPSvJigVG/9jWPmDOPDNojqHW
	YXSCg37FOZ7t2cMndN5/mzzHBYGxAoSlGetTz0/L+uaMHpyx7o9CdluFvoABbme2/X3/09X0bd76x
	wDErWGy44Q8mSxrPOjpb0nMwtYcxiAV41RXHiaT8H6bC8PeUl3oYxrldqSH04yRMDxjiaG9LSWrOa
	WPMSRGZ1Rg5HD1yNJ684AGZhZY/HFUEi3ViHsg01hh+LElTMHQKziMiKGQBtgYc5YwD8owiBKY79a
	UjHIDFmSEP23sXo+lT+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iglut-0008Ob-7V; Mon, 16 Dec 2019 08:39:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igluo-0008L2-Cg
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 08:39:43 +0000
X-UUID: 969b92239676467089be1b28d7fdfb7c-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Dcn4edIKmaaxZ4WZoa2gNgfaTP9lTdkKWVMAcN2SDvg=; 
 b=ftRjKrdBTcJ5b0iUAxZSWSoJGcUS0IFFGTQGXD6bv2/ffYe/tZZnslSp/X+RsxU1O147/s8Y118l45/0bkTr0CrTkAvoUEKyv3S1vJxVY/1uNXSChIbAZQphcYLBNSdKtJfN9u3OKUaU/o/YfVSnnedYy13R0Jm53tiWewphjGE=;
X-UUID: 969b92239676467089be1b28d7fdfb7c-20191216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 487610173; Mon, 16 Dec 2019 00:39:38 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 00:29:52 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Dec 2019 16:28:41 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Dec 2019 16:29:19 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/mediatek: config mipitx impedance with calibration
 data
Date: Mon, 16 Dec 2019 16:29:37 +0800
Message-ID: <20191216082937.119164-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216082937.119164-1-jitao.shi@mediatek.com>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A94EBA85556E547017273BA5806BB90878484B707971CA67C29CE8ECBE80A01C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_003942_432564_6C16F98C 
X-CRM114-Status: UNSURE (   9.96  )
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

Read calibration data from nvmem, and config mipitx impedance with
calibration data to make sure their impedance are 100ohm.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
index eea44327fe9f..a1b6292145de 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
@@ -28,6 +28,7 @@ struct mtk_mipi_tx {
 	void __iomem *regs;
 	u32 data_rate;
 	u32 mipitx_drive;
+	u32 rt_code[5];
 	const struct mtk_mipitx_data *driver_data;
 	struct clk_hw pll_hw;
 	struct clk *pll;
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
index 124fdf95f1e5..f624516944bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
@@ -5,6 +5,8 @@
  */
 
 #include "mtk_mipi_tx.h"
+#include <linux/nvmem-consumer.h>
+#include <linux/slab.h>
 
 #define MIPITX_LANE_CON		0x000c
 #define RG_DSI_CPHY_T1DRV_EN		BIT(0)
@@ -28,6 +30,7 @@
 #define MIPITX_PLL_CON4		0x003c
 #define RG_DSI_PLL_IBIAS		(3 << 10)
 
+#define MIPITX_D2P_RTCODE	0x0100
 #define MIPITX_D2_SW_CTL_EN	0x0144
 #define MIPITX_D0_SW_CTL_EN	0x0244
 #define MIPITX_CK_CKMODE_EN	0x0328
@@ -108,6 +111,64 @@ static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };
 
+static int mtk_mipi_tx_config_calibration_data(struct mtk_mipi_tx *mipi_tx)
+{
+	u32 *buf = NULL;
+	int i, j;
+	struct nvmem_cell *cell;
+	struct device *dev = mipi_tx->dev;
+	size_t len;
+
+	cell = nvmem_cell_get(dev, "calibration-data");
+	if (IS_ERR(cell)) {
+		dev_warn(dev, "nvmem_cell_get fail\n");
+		return -EINVAL;
+	}
+
+	buf = (u32 *)nvmem_cell_read(cell, &len);
+
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(buf)) {
+		dev_warn(dev, "can't get data\n");
+		return -EINVAL;
+	}
+
+	if (len < 3 * sizeof(u32)) {
+		dev_warn(dev, "invalid calibration data\n");
+		kfree(buf);
+		return -EINVAL;
+	}
+
+	mipi_tx->rt_code[0] = ((buf[0] >> 6 & 0x1F) << 5) |
+			      (buf[0] >> 11 & 0x1F);
+	mipi_tx->rt_code[1] = ((buf[1] >> 27 & 0x1F) << 5) |
+			      (buf[0] >> 1 & 0x1F);
+	mipi_tx->rt_code[2] = ((buf[1] >> 17 & 0x1F) << 5) |
+			      (buf[1] >> 22 & 0x1F);
+	mipi_tx->rt_code[3] = ((buf[1] >> 7 & 0x1F) << 5) |
+			      (buf[1] >> 12 & 0x1F);
+	mipi_tx->rt_code[4] = ((buf[2] >> 27 & 0x1F) << 5) |
+			      (buf[1] >> 2 & 0x1F);
+
+	for (i = 0; i < 5; i++) {
+		if ((mipi_tx->rt_code[i] & 0x1F) == 0)
+			mipi_tx->rt_code[i] |= 0x10;
+
+		if ((mipi_tx->rt_code[i] >> 5 & 0x1F) == 0)
+			mipi_tx->rt_code[i] |= 0x10 << 5;
+
+		for (j = 0; j < 10; j++) {
+			mtk_mipi_tx_update_bits(mipi_tx,
+				MIPITX_D2P_RTCODE * (i + 1) + j * 4,
+				1, mipi_tx->rt_code[i] >> j & 1);
+		}
+	}
+
+	kfree(buf);
+	return 0;
+}
+
 static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 {
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
@@ -130,6 +191,8 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 				RG_DSI_HSTX_LDO_REF_SEL,
 				mipi_tx->mipitx_drive << 6);
 
+	mtk_mipi_tx_config_calibration_data(mipi_tx);
+
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
 }
 
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
