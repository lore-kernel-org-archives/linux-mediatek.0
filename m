Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E1BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sb9mbfISfXOuTwXYbmCh3eWTQjNhtd1x8mN2o6zpoTY=; b=wmf2cZ75YIhAvNS9CkzDDa7eoP
	4KtgSqBuwA41DZlwwKN+HyjslwPcDNPK2o6nZQMpoH+ni4UdiSsC4pC7QUgxkdGmPBZZ+JMqsAFUm
	AtaXcbSwJugLBIWBUPumT7oU9MZJn8xC+ZFfApp31JqrMzNxlDqqoT2h5076fOrg5RnhtALAoKpbx
	sVT0xHG983bQQZF7ZlOvE1uMIM753jZhEWPGDaj7OTLwbcptJod36VFO35koKqJe/3W5Q3PthXv/X
	pBoRgbPsxuzHhYIkKuFR6SeGGtL5GBzUD6I1mo5Myqp6PKF8tvFmH2X+RHj7lriJAeuYd61gQCl0R
	hRA6fEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYOv-000knc-0W; Mon, 14 Nov 2022 12:17:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYOf-000key-1f; Mon, 14 Nov 2022 12:17:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30037B80D20;
	Mon, 14 Nov 2022 12:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76D4C433C1;
	Mon, 14 Nov 2022 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668428221;
	bh=UH+GWkwtfms2AOzvG2j6b82aSdcxdwm3nMRBgLF6O14=;
	h=From:To:Cc:Subject:Date:From;
	b=d1PUskdkK8fQfRAqaWSguZqyt5ak+ENLkFQEh5ZoLq7cmDRLS8xmGFF6ytUPwgdBy
	 LqE6iqeC5bPYUOKMAQV0IgesFXwVaPpvYNW9tMsAdEX+nRYuDAs3u9Fx4H+rH+SJxz
	 EOp5Dj2tGDHj4cPaj3BJGf5zWMyQJ+HjfIH2VFbuXqRPaO8QogsWSz0fyZKjc1c4Bu
	 7/pj4AuddXeSz01oiG4Ggl2a16RVHUxGOT/Lnt3ul55K7a6WXncOxL4vzwE/VDlVuO
	 5ArUt/AdxOYHP4MWksraFb4Uo+rnRgAcW11N3XFvlIicZeFnFVnFqqrSz97kYjN7Y6
	 SmdKUT4fydJPA==
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	frank-w@public-files.de
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v2] arm64: dts: mediatek: mt7986: Add SoC compatible
Date: Mon, 14 Nov 2022 13:16:53 +0100
Message-Id: <20221114121653.14739-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_041705_277725_A4A6DC8E 
X-CRM114-Status: GOOD (  13.65  )
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

From: Matthias Brugger <mbrugger@suse.com>

Missing SoC compatible in the board file causes dt bindings check.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---
Changes since v1:
- Move SoC compatible to first line of the block
- Add SoC compatible to mt7986b


 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 1 +
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 3 +++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index afe37b702eef9..0e3b603159477 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "MediaTek MT7986a RFB";
-	compatible = "mediatek,mt7986a-rfb";
+	compatible = "mediatek,mt7986a-rfb", "mediatek,mt7986a";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 72e0d9722e07a..3c52ec3f99a31 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/reset/mt7986-resets.h>
 
 / {
+	compatible = "mediatek,mt7986a";
 	interrupt-parent = <&gic>;
 	#address-cells = <2>;
 	#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 3443013b5971e..d03e66a84c5d4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "MediaTek MT7986b RFB";
-	compatible = "mediatek,mt7986b-rfb";
+	compatible = "mediatek,mt7986b-rfb", "mediatek,mt7986b";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
index 23923b9f8944b..db5189664c29b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
@@ -5,6 +5,9 @@
  */
 
 #include "mt7986a.dtsi"
+/ {
+	compatible = "mediatek,mt7986b";
+};
 
 &pio {
 	compatible = "mediatek,mt7986b-pinctrl";
-- 
2.38.1


