Return-Path: <SRS0=Ks85=53=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92CDC2BB85
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 07:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA9520732
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 07:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1PBTro3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HANf0K7O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA9520732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhNEBpc+3yfhtANC0Evplqmq9097omcq3moQxA4l3l4=; b=r1PBTro3VUZHpb
	Yoqp8R+LM4qiBrovSij7xkSVZec6nvyKD6CZgWcFfV55/SYjsK5CnphwV9FfhX1a7W0XgE8n3W0ww
	scJ52fx59vcLhFxvHm41clfhP3GvV4lsaKAdQHfw33K56KhlXq6o52Typ4+0r+P0PSUYjZPnDLRAb
	2ztjeU/96OklssKozkQWmCF06f7UAYreHWKFqTBX+oP3sXbauD0IuhS2RTfL8qj9ftiquWChf6j4E
	INnADYMbHjlQbZ89nfkOtwVQ6UD0r+f0vddxFhcgcu3hIJjVFBySs+dTXBdP4gSeb/bKa0r5ZqHwt
	cL6/KaTRtkI2pdCSXAAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNApQ-0002oU-OG; Sat, 11 Apr 2020 07:45:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNAoi-00086p-7h; Sat, 11 Apr 2020 07:44:41 +0000
X-UUID: 1e613bc07df74f098bbbf5fd338928f1-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AHxhUn2kmmaiTpuNqyuJ91haPBs27z9l86TI6FY89lo=; 
 b=HANf0K7OwymCJmRC/RqCZPhcDTIdxnfUP1R+AltCBZ+zuN5FxTUZf1Jmq7SZPjEA64Zo7Cm6k0iEUn8EBIKXUwqgzRMevEGEe2dXimYWLCTinPY5dR0tTEszinZQr2Ky1efo4hfI5SOZBRm67ReyBFyIbpnhiWeE8oSeXfJmGKE=;
X-UUID: 1e613bc07df74f098bbbf5fd338928f1-20200410
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 738955166; Fri, 10 Apr 2020 23:44:33 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 00:44:32 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Apr 2020 15:44:28 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 11 Apr 2020 15:44:25 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 3/4] drm/mediatek: add the mipitx driving control
Date: Sat, 11 Apr 2020 15:44:07 +0800
Message-ID: <20200411074408.38090-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200411074408.38090-1-jitao.shi@mediatek.com>
References: <20200411074408.38090-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F585F1D0662B1E91FEA6FA77DF2A7867D88A48573C1192C85F33AC2D99FED72D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_004440_277897_31198EEA 
X-CRM114-Status: GOOD (  11.29  )
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
 srv_heupstream@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a property in device tree to control the driving by different
board.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 14 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c |  7 +++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index e4d34484ecc8..e301af64809e 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -125,6 +125,20 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "drive-strength-microamp",
+				   &mipi_tx->mipitx_drive);
+	/* If can't get the "mipi_tx->mipitx_drive", set it default 0x8 */
+	if (ret < 0)
+		mipi_tx->mipitx_drive = 4600;
+
+	/* check the mipitx_drive valid */
+	if (mipi_tx->mipitx_drive > 6000 || mipi_tx->mipitx_drive < 3000) {
+		dev_warn(dev, "drive-strength-microamp is invalid %d, not in 3000 ~ 6000\n",
+			 mipi_tx->mipitx_drive);
+		mipi_tx->mipitx_drive = clamp_val(mipi_tx->mipitx_drive, 3000,
+						  6000);
+	}
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
index 91f08a351fd0..e4cc967750cb 100644
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
+				(mipi_tx->mipitx_drive - 3000) / 200 << 6);
+
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
 }
 
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
