Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D29C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:59:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4703361415
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4703361415
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5x6RkNOJeZnugQPjKJ1ks4nlb1Bc7LJwvD/ZsUNMU88=; b=woGEV51P5uvBbv
	N+B35h0xTZXx2pDsjUmMz+Y3JQuyvevy53JsAD6yEyJgVpEzszIl7uDrH0fXwOZMH6ruiXlf+uC5l
	ncqRYMBTKV9rfwP0ofSJ+ZtPgMfAvx0D5QJRNZEyDsO+HNyQ68OL4Z2qIG9cKc13nOZcdnI9hADTw
	BBF/JBSUHkFN8PpMsJq081qTwcIKlvPN9HkyzueaWaf7kwxwAnakTLqbbYdNMawqYyHmlNTMs/nFG
	rr/Vg5bxDgA2c7sbqpl2wSgx3a2qKgD1qp64B1XcHEn1fOhzkarfH6kIeFBcnOL/GRBkBswW7fDDC
	wpSc9uBdg4jhnDSGXhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJXs-002FSb-UO; Mon, 24 May 2021 22:59:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll9hw-000ufn-UI; Mon, 24 May 2021 12:29:22 +0000
X-UUID: 7a47a95c9bad47308a2afec0f2eb673b-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dQuyyQU7UauZwax4eQTHxgtYYUdYo4hr0TjEbAjFBtI=; 
 b=sK1Cg03+WqNwZOWCSN0ohuWeAv5uwFcM2uXJlAK4wJaqxBs/TU+CxNEQnnJBa8MGXufBSaAC1S4/DCW5wfrlLgjqNPXsowwPFkcrUcrOOc9NGd3iuaT5/PrZVTq7zmdYWa6TjiMiOl9PLDJIzldytzQHNI7mdLaGGj3kCjIB3pc=;
X-UUID: 7a47a95c9bad47308a2afec0f2eb673b-20210524
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 991728766; Mon, 24 May 2021 05:29:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 05:29:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 20:29:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 May 2021 20:29:10 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, "chun-jie . chen" <chun-jie.chen@mediatek.com>
Subject: [PATCH v9 05/22] dt-bindings: ARM: Mediatek: Document bindings of
 MT8192 clock controllers
Date: Mon, 24 May 2021 20:20:36 +0800
Message-ID: <20210524122053.17155-6-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_052921_013347_D580CD27 
X-CRM114-Status: GOOD (  11.99  )
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

This patch adds the binding documentation of topckgen, apmixedsys,
infracfg, pericfg and subsystem clocks for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 .../arm/mediatek/mediatek,apmixedsys.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt |  1 +
 .../bindings/arm/mediatek/mediatek,camsys.txt | 22 +++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,imgsys.txt |  2 ++
 .../arm/mediatek/mediatek,infracfg.txt        |  1 +
 .../bindings/arm/mediatek/mediatek,ipesys.txt |  1 +
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt |  1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt  |  1 +
 .../arm/mediatek/mediatek,pericfg.yaml        |  1 +
 .../arm/mediatek/mediatek,topckgen.txt        |  1 +
 .../arm/mediatek/mediatek,vdecsys.txt         |  8 +++++++
 .../arm/mediatek/mediatek,vencsys.txt         |  1 +
 12 files changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
index ea827e8763de..551c30735cd7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
@@ -18,6 +18,7 @@ Required Properties:
 	- "mediatek,mt8167-apmixedsys", "syscon"
 	- "mediatek,mt8173-apmixedsys"
 	- "mediatek,mt8183-apmixedsys", "syscon"
+	- "mediatek,mt8192-apmixedsys", "syscon"
 	- "mediatek,mt8516-apmixedsys"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index b32d374193c7..699776be1dd3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -13,6 +13,7 @@ Required Properties:
 	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
 	- "mediatek,mt8167-audiosys", "syscon"
 	- "mediatek,mt8183-audiosys", "syscon"
+	- "mediatek,mt8192-audsys", "syscon"
 	- "mediatek,mt8516-audsys", "syscon"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
index a0ce82085ad0..7d0b14e5c8ba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
@@ -9,6 +9,10 @@ Required Properties:
 	- "mediatek,mt6765-camsys", "syscon"
 	- "mediatek,mt6779-camsys", "syscon"
 	- "mediatek,mt8183-camsys", "syscon"
+	- "mediatek,mt8192-camsys", "syscon"
+	- "mediatek,mt8192-camsys_rawa", "syscon"
+	- "mediatek,mt8192-camsys_rawb", "syscon"
+	- "mediatek,mt8192-camsys_rawc", "syscon"
 - #clock-cells: Must be 1
 
 The camsys controller uses the common clk binding from
@@ -22,3 +26,21 @@ camsys: camsys@1a000000  {
 	reg = <0 0x1a000000  0 0x1000>;
 	#clock-cells = <1>;
 };
+
+camsys_rawa: syscon@1a04f000 {
+	compatible = "mediatek,mt8192-camsys_rawa", "syscon";
+	reg = <0 0x1a04f000 0 0x1000>;
+	#clock-cells = <1>;
+};
+
+camsys_rawb: syscon@1a06f000 {
+	compatible = "mediatek,mt8192-camsys_rawb", "syscon";
+	reg = <0 0x1a06f000 0 0x1000>;
+	#clock-cells = <1>;
+};
+
+camsys_rawc: syscon@1a08f000 {
+	compatible = "mediatek,mt8192-camsys_rawc", "syscon";
+	reg = <0 0x1a08f000 0 0x1000>;
+	#clock-cells = <1>;
+};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
index dce4c9241932..b9e599e116dc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
@@ -15,6 +15,8 @@ Required Properties:
 	- "mediatek,mt8167-imgsys", "syscon"
 	- "mediatek,mt8173-imgsys", "syscon"
 	- "mediatek,mt8183-imgsys", "syscon"
+	- "mediatek,mt8192-imgsys", "syscon"
+	- "mediatek,mt8192-imgsys2", "syscon"
 - #clock-cells: Must be 1
 
 The imgsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
index eb3523c7a7be..6e05a0014cf7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
@@ -19,6 +19,7 @@ Required Properties:
 	- "mediatek,mt8167-infracfg", "syscon"
 	- "mediatek,mt8173-infracfg", "syscon"
 	- "mediatek,mt8183-infracfg", "syscon"
+	- "mediatek,mt8192-infracfg", "syscon"
 	- "mediatek,mt8516-infracfg", "syscon"
 - #clock-cells: Must be 1
 - #reset-cells: Must be 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
index 2ce889b023d9..9cd10350ab9b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt6779-ipesys", "syscon"
+	- "mediatek,mt8192-ipesys", "syscon"
 - #clock-cells: Must be 1
 
 The ipesys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
index 054424fb64b4..6bfb49a43ef9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
@@ -10,6 +10,7 @@ Required Properties:
 	- "mediatek,mt6779-mfgcfg", "syscon"
 	- "mediatek,mt8167-mfgcfg", "syscon"
 	- "mediatek,mt8183-mfgcfg", "syscon"
+	- "mediatek,mt8192-mfgcfg", "syscon"
 - #clock-cells: Must be 1
 
 The mfgcfg controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index 78c50733985c..9712a6831fab 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -16,6 +16,7 @@ Required Properties:
 	- "mediatek,mt8167-mmsys", "syscon"
 	- "mediatek,mt8173-mmsys", "syscon"
 	- "mediatek,mt8183-mmsys", "syscon"
+	- "mediatek,mt8192-mmsys", "syscon"
 - #clock-cells: Must be 1
 
 For the clock control, the mmsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 8723dfe34bab..b405cbcafb90 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -26,6 +26,7 @@ properties:
               - mediatek,mt8135-pericfg
               - mediatek,mt8173-pericfg
               - mediatek,mt8183-pericfg
+              - mediatek,mt8192-pericfg
               - mediatek,mt8516-pericfg
           - const: syscon
       - items:
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
index 5ce7578cf274..1627e384b2ba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
@@ -18,6 +18,7 @@ Required Properties:
 	- "mediatek,mt8167-topckgen", "syscon"
 	- "mediatek,mt8173-topckgen"
 	- "mediatek,mt8183-topckgen", "syscon"
+	- "mediatek,mt8192-topckgen", "syscon"
 	- "mediatek,mt8516-topckgen"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
index 98195169176a..376c82ed09ab 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
@@ -14,6 +14,8 @@ Required Properties:
 	- "mediatek,mt8167-vdecsys", "syscon"
 	- "mediatek,mt8173-vdecsys", "syscon"
 	- "mediatek,mt8183-vdecsys", "syscon"
+	- "mediatek,mt8192-vdecsys", "syscon"
+	- "mediatek,mt8192-vdecsys_soc", "syscon"
 - #clock-cells: Must be 1
 
 The vdecsys controller uses the common clk binding from
@@ -27,3 +29,9 @@ vdecsys: clock-controller@16000000 {
 	reg = <0 0x16000000 0 0x1000>;
 	#clock-cells = <1>;
 };
+
+vdecsys_soc: syscon@1600f000 {
+	compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
+	reg = <0 0x1600f000 0 0x1000>;
+	#clock-cells = <1>;
+};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
index 6a6a14e15cd7..d22de01c24ec 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
@@ -11,6 +11,7 @@ Required Properties:
 	- "mediatek,mt6797-vencsys", "syscon"
 	- "mediatek,mt8173-vencsys", "syscon"
 	- "mediatek,mt8183-vencsys", "syscon"
+	- "mediatek,mt8192-vencsys", "syscon"
 - #clock-cells: Must be 1
 
 The vencsys controller uses the common clk binding from
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
