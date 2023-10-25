Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B70C25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FbpQ7S1XZfsbyrXloG/Yne46pSCtOgAJxynN5p8+Go=; b=mVMU0U39TKnnhMR2BN4E0o63gJ
	VXUglaf6I2jfEmUW4zmHwy5LhwKmLafIICS6HV05EgU1iV+xrMQZeb2y2Ktw2Vt5t+3VTF71fBnU+
	jYA6r8Te6n1DX8byzcnXFB9fGnBGDUf+9FFv84Y9m6Aoo+Spju2QCIR763KVPgEI+zI3UJCIevNpO
	q1/f7lf+OcfXNRqlEchPsKjDhH70bwG1BDzCzcnk0Mqwz5od1HUXO4PUQv+09HpmSerSkXAeS9t/k
	x0shk311C9UyAeY1ZZ28GT2r1MXjFFbTb/4hDbl7sztFo1gxt7UAZk/LYHjQLM2kbe2qXOpBUWJLy
	A4cXqAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaM4-00BqgY-2M;
	Wed, 25 Oct 2023 09:39:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLU-00BqNu-2R;
	Wed, 25 Oct 2023 09:38:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C3D7660734D;
	Wed, 25 Oct 2023 10:38:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698226715;
	bh=EDKsDLQxS9/ZtjnnbKTtME2Dw+H53IZ5rGtiKIDEb0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTNgLc1/9ilQc1o+ymqXdVcTpiz1mSpgJnKsogjvKbF5SACTZGQJWX9t6Vn7OvzAX
	 IfcS01czf9E6KlvOltFmebALWuwO0AhnuOtIoti9QZ/EQYqtcFIdFffh1cxu8KykQn
	 BGMHFQ3qMOwHNu/lv/cyMtmbNmbb59tA4wCjkL/NOsUgWvcZ+Mjf7EDf/p/r0L6+hY
	 P8Xr26Y1fIGbx4+FEmN6hEMz/xd6JyXCCTiWS7HY1dGWsDMZoe66+m4EBTRSSoQO6E
	 aAhhGWjWn6q1XAeDL3wSXqV9taFMn1s+rqsIg0JdbnPRCAq1K/1QzDPLWoRIqGJ/AI
	 ccARlegoxi+YQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: hsinyi@chromium.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	erin.lo@mediatek.com,
	eddie.huang@mediatek.com,
	pihsun@chromium.org,
	fparent@baylibre.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 5/8] arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
Date: Wed, 25 Oct 2023 11:38:13 +0200
Message-ID: <20231025093816.44327-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
References: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023836_943715_C43CAB1A 
X-CRM114-Status: GOOD (  11.31  )
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

The reserved memory for scp had node name "scp_mem_region" and also
without unit-address: change the name to "memory@(address)".
This fixes a unit_address_vs_reg warning.

Fixes: 1652dbf7363a ("arm64: dts: mt8183: add scp node")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts    | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index f8c1f8df85d0..bae9b6763862 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -31,7 +31,7 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		scp_mem_reserved: scp_mem_region {
+		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index c81407e44eca..e909cfadb6d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -116,7 +116,7 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		scp_mem_reserved: scp_mem_region {
+		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
-- 
2.42.0


