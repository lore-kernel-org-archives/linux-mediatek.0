Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFC9C10F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 07:47:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88218206B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 07:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCtU2W7v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YtdI/BxA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88218206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjkhx11gc5/ApYPpHnwKnk1zI2eeXXPMBYq3YbYxoY4=; b=jCtU2W7vbrt1Nl
	HDYvrWbKly/S+iB+gQDqFG04shOVmffaqJuX0GILYhtQjXByWSU/ul0iArAA2SseYwfO9VfCbRI+p
	YEGduxs58kKlCqGQkFGnIrgyesj52NJ7l/u0624ArKnw3ip1BYIfl2o+8Ix9Aw8cOKWtaDesOrht4
	4TRFzLx2oplfMR6VdLS3Ysc90mm0Bsbv6WzpFgCBtNg/Ej+c33uOwzn7N1JqDEEjXs22hN3L4Cdk3
	m+EyTdpjyHsOAtIj0bElmZEvkbK/wwF9vgElkd6eTbKnLoBUwqcDQazc3lEukEgdXmp4NsR5Ho38+
	HRBdgDa3bMUPKMf3hRmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBw4z-0007Pa-NU; Wed, 11 Mar 2020 07:47:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBw4c-00078y-1I; Wed, 11 Mar 2020 07:46:41 +0000
X-UUID: 9ec8608efd014759ac936a3e89af141a-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=t8hedylVJwkJMYP7UnqBpDhKqAa/d5AZ7g/YjEG5AI8=; 
 b=YtdI/BxAMRQ8mOy/RKXbjQm8g6IgtEzYRMnMvxsDeVvV06dNCBF17s44gGov+ODpIvfPu/DLMC3jjVAohaQ5V+CooVpejUtOmAA0BjX2UoVlToMYQE4duO6jFIJq4WnjahM8xf5ORs/IkeCjJe/Jl24l2KglBSpoxhm+4EZmauM=;
X-UUID: 9ec8608efd014759ac936a3e89af141a-20200310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 198073272; Tue, 10 Mar 2020 23:46:29 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 00:41:25 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 11 Mar 2020 15:38:26 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 11 Mar 2020 15:42:04 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/4] drm/mediatek: add the mipitx driving control
Date: Wed, 11 Mar 2020 15:40:31 +0800
Message-ID: <20200311074032.119481-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200311074032.119481-1-jitao.shi@mediatek.com>
References: <20200311074032.119481-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FD68469F06CED291422597CC0694F2D92E1A1462DDD16CD56C8592C26162E0552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_004638_133552_8F199BEE 
X-CRM114-Status: GOOD (  11.06  )
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

Add a property in device tree to control the driving by different
board.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 6 ++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        | 1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index e4d34484ecc8..2a1ac4e97cbb 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -125,6 +125,12 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "drive-strength-microamp",
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
