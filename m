Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541B7C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jan 2024 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJWaZdp7vwDloIQ8UP6qzcfjDSiX0CaWYDKppc3KgpY=; b=j3M9Q1VBAPiUx1
	HjxLZr6Dc1Aqew3OX9Ve+5eeTykuzal+HMGOAYPMeaYF5w7EuVxZC2JeSivzg49k2c/EzmQJvRNKw
	wVkSTi+mHdvgh4iym6fGuiGnFNAyyfnjKYBnQM2RgtwsxHvrxIMSZdMt/iqmNXt7BkN/+Zh2iUi+Q
	cfSXeO9e2lOOjaDGuBu96685yEn89gIv8Q9+0ymfV4kDv+ApA550oLujlBOIPNhGJ1gm8ihRmRzFd
	afX4fFDv4XXFCsBewjCWqr5rfr1EN3/M9GB8OicCA7iMGwdq+CrzEoBHLSiMb1IRILkNbJcWAT1fk
	a0nlzeB8dvZqIofQq7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmwb-00HIf0-1E;
	Fri, 05 Jan 2024 16:21:13 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmwW-00HIch-0a;
	Fri, 05 Jan 2024 16:21:11 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 5AEE04027B;
	Fri,  5 Jan 2024 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1704471665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJWaZdp7vwDloIQ8UP6qzcfjDSiX0CaWYDKppc3KgpY=;
	b=eTopNlLc2+mGcCIV+tMnOyedCitCF83/aJOtYLEbxcgOCBQLCYMDMx6+Aa3JEH5Hx3kCgN
	auv4YVUphpYKa0WbyYbeQ4FhrGz/Ae45YjSMDzpETYWyF2dC/RgwET1YGwepZnUy16risK
	gmJig4Cr65ntK6Av8xywoPDzKIO02Dw=
Received: from frank-G5.. (fttx-pool-80.245.77.34.bambit.de [80.245.77.34])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 7F9C6360303;
	Fri,  5 Jan 2024 16:21:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/2] clk: mediatek: add infracfg reset controller for mt7988
Date: Fri,  5 Jan 2024 17:20:55 +0100
Message-Id: <20240105162056.43266-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105162056.43266-1-linux@fw-web.de>
References: <20240105162056.43266-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 31b037bd-067d-4073-9b39-c5bd1557013d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_082108_383659_029F4EAB 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Infracfg can also operate as reset controller, add support for it.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index 8011ef278bea..1660a45349ff 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -14,6 +14,9 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 #include <dt-bindings/clock/mediatek,mt7988-clk.h>
+#include <dt-bindings/reset/mediatek,mt7988-resets.h>
+
+#define	INFRA_RST_SET_OFFSET	0x80
 
 static DEFINE_SPINLOCK(mt7988_clk_lock);
 
@@ -249,12 +252,29 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA3(CLK_INFRA_133M_PCIE_CK_P3, "infra_133m_pcie_ck_p3", "sysaxi_sel", 31),
 };
 
+static u16 infra_rst_ofs[] = {
+	INFRA_RST_SET_OFFSET,
+};
+
+static u16 infra_idx_map[] = {
+	[MT7988_INFRA_RST0_THERM_CTRL_SWRST] = 0 * RST_NR_PER_BANK + 9,
+};
+
+static struct mtk_clk_rst_desc infra_rst_desc = {
+	.version = MTK_RST_SET_CLR,
+	.rst_bank_ofs = infra_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infra_rst_ofs),
+	.rst_idx_map = infra_idx_map,
+	.rst_idx_map_nr = ARRAY_SIZE(infra_idx_map),
+};
+
 static const struct mtk_clk_desc infra_desc = {
 	.clks = infra_clks,
 	.num_clks = ARRAY_SIZE(infra_clks),
 	.mux_clks = infra_muxes,
 	.num_mux_clks = ARRAY_SIZE(infra_muxes),
 	.clk_lock = &mt7988_clk_lock,
+	.rst_desc = &infra_rst_desc,
 };
 
 static const struct of_device_id of_match_clk_mt7988_infracfg[] = {
-- 
2.34.1


