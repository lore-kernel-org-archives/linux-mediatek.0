Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7EDC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 08:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04977207FF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 08:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="crdeZ4LE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KpdNB/QG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04977207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wOdql1S1LrHnIOXPHr0+nR0ZhzpNIt9lf+Czux8jPY=; b=crdeZ4LEXjnfHo
	uifLeFzC4Rq+gO/+nGKKLeIct1bGcJZWSMS5Gc04KBMYB590vC8avcmDgiJ+XC4KKD/KHwtXZ1khF
	4HSY+XXx31jNf1Rudcgewthz5merpe8EEbBofGv32grSStHTcddZiCTVYxB8wPKhjUeWt3xQd7/fp
	vkD5y1j8DsWSUxJuE0oD04HAneq1WL36hHWy8zLeOxckcULtqZu14GMDxdrbTN1Hsrog1TsSggWRh
	ww2/ImravXhKFt39zDUjniEhBS7zvE3aB7MCHFycObR5oZyMh/rsoAEptHMvzLzt4dbI7R/F7GaN0
	NrUzuFG02spESMwK3HxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJCGH-0006St-HR; Tue, 31 Mar 2020 08:28:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJCFl-0005wp-1q; Tue, 31 Mar 2020 08:28:10 +0000
X-UUID: 01b9f34ed72b4a39bf1d95e30355e3e3-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YQ57/0uYu8e2rMbWbbfkX9m+q6kPZQyOhAzfeLnK1/g=; 
 b=KpdNB/QGALXWhAauazNBulgahq8crIoinuziaDxhTgfvtR3rUq+YdCIXDDM/nQbM14Ts0n96xFg6Tukv9IT7bGRB46M8XkxwLmNsH7+te5arUBJ5s9pVCUh6ZZzxZlzPBL25YK4LQ2i9nLI9mZxsKfx0mpF6lFn9G8SK2qky79g=;
X-UUID: 01b9f34ed72b4a39bf1d95e30355e3e3-20200331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1149862758; Tue, 31 Mar 2020 00:27:46 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 01:28:00 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 31 Mar 2020 16:27:59 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 31 Mar 2020 16:27:56 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 4/4] drm/mediatek: config mipitx impedance with calibration
 data
Date: Tue, 31 Mar 2020 16:27:25 +0800
Message-ID: <20200331082725.81048-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200331082725.81048-1-jitao.shi@mediatek.com>
References: <20200331082725.81048-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AE94F9B996E80ACF14AC902A5CF3432598D7C8C9E609F120D86AFFCA9479468E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_012809_098161_0FCC133D 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Read calibration data from nvmem, and config mipitx impedance with
calibration data to make sure their impedance are 100ohm.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
index e4cc967750cb..0f87cd3d1d7d 100644
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
@@ -108,6 +111,58 @@ static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };
 
+static void mtk_mipi_tx_config_calibration_data(struct mtk_mipi_tx *mipi_tx)
+{
+	u32 *buf;
+	u32 rt_code[5];
+	int i, j;
+	struct nvmem_cell *cell;
+	struct device *dev = mipi_tx->dev;
+	size_t len;
+
+	cell = nvmem_cell_get(dev, "calibration-data");
+	if (IS_ERR(cell)) {
+		dev_info(dev, "nvmem_cell_get fail\n");
+		return;
+	}
+
+	buf = (u32 *)nvmem_cell_read(cell, &len);
+
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(buf)) {
+		dev_info(dev, "can't get data\n");
+		return;
+	}
+
+	if (len < 3 * sizeof(u32)) {
+		dev_info(dev, "invalid calibration data\n");
+		kfree(buf);
+		return;
+	}
+
+	rt_code[0] = ((buf[0] >> 6 & 0x1f) << 5) | (buf[0] >> 11 & 0x1f);
+	rt_code[1] = ((buf[1] >> 27 & 0x1f) << 5) | (buf[0] >> 1 & 0x1f);
+	rt_code[2] = ((buf[1] >> 17 & 0x1f) << 5) | (buf[1] >> 22 & 0x1f);
+	rt_code[3] = ((buf[1] >> 7 & 0x1f) << 5) | (buf[1] >> 12 & 0x1f);
+	rt_code[4] = ((buf[2] >> 27 & 0x1f) << 5) | (buf[1] >> 2 & 0x1f);
+
+	for (i = 0; i < 5; i++) {
+		if ((rt_code[i] & 0x1f) == 0)
+			rt_code[i] |= 0x10;
+
+		if ((rt_code[i] >> 5 & 0x1f) == 0)
+			rt_code[i] |= 0x10 << 5;
+
+		for (j = 0; j < 10; j++)
+			mtk_mipi_tx_update_bits(mipi_tx,
+				MIPITX_D2P_RTCODE * (i + 1) + j * 4,
+				1, rt_code[i] >> j & 1);
+	}
+
+	kfree(buf);
+}
+
 static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 {
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
@@ -130,6 +185,8 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 				RG_DSI_HSTX_LDO_REF_SEL,
 				(mipi_tx->mipitx_drive - 3000) / 200 << 6);
 
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
