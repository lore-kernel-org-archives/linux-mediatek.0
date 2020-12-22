Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BB3C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:12:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA38221D7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA38221D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N/X7CZ1+XbGS6ndM7P7uBszH9VWmcX8ooE5ZFZtPox8=; b=wo4/vQuEQ3zWEywGAjeFrUwsC
	GnF+JruFosV2Ut6NIW4yQBAoP7n1f41m0nN0hR/r1wPx1WP4Mw9iUNE3fCIsnf8oWBSk3j7GjhH6j
	QQuPaUTkwAMlOqDcectmyL8ydrrczKfEPxwXt9gD/xmqBm70yXGzWaWZm6BGPDPSoHFTka+ZBIAhB
	mRZcRA1ZOHsfPGVhbONyrdhtBs4C0nFoq3c9pK8Kx+ETlgaCo9vkKAOBRNhjwyvyKV0SfpzK5Xf2/
	uP1eTlDT3MQG7f5ZgfP/LlnD5G2SSPF8PM+2NULZXAFkCb9PZjpw5IT0cmhfWG8dPqqUd9MQhWvUI
	Yn8CVfe6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krhSy-0002uS-T7; Tue, 22 Dec 2020 13:12:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krhQt-0001mW-KD; Tue, 22 Dec 2020 13:10:34 +0000
X-UUID: fa19a4c18f26464f9015916a6d0232de-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CfolAVAIVBgojYCJsdzPsl30xlismFKIvMN+6BWxbY4=; 
 b=gpFX0bUO8z/pK9VYpGts4K/b0ruvEVoGMMaSb1DKsqs6yFvpNfDL7uZwQTXCGqJkj7QGFiy/uOHHupBABMG9F3MaPRo3Gc2/2PzI2Rqchc5Yqzd/xrQ0E5wzp3zvAIedAedrDb4iConhYXZebdsPDSxyetIPrbucL7Z8q/4Q6bw=;
X-UUID: fa19a4c18f26464f9015916a6d0232de-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 311772282; Tue, 22 Dec 2020 05:10:02 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 05:09:53 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 21:09:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 21:09:49 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v6 05/22] dt-bindings: ARM: Mediatek: Document bindings of
 MT8192 clock controllers
Date: Tue, 22 Dec 2020 21:09:30 +0800
Message-ID: <1608642587-15634-6-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_081031_946392_3CAACA51 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the binding documentation of topckgen, apmixedsys,
infracfg, pericfg and subsystem clocks for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |  1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,camsys.txt      | 22 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |  2 ++
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |  1 +
 .../bindings/arm/mediatek/mediatek,ipesys.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt      |  1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |  1 +
 .../bindings/arm/mediatek/mediatek,pericfg.yaml    |  1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |  1 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |  8 ++++++++
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |  1 +
 12 files changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
index ea827e87..551c307 100644
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
index b32d374..699776b 100644
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
index a0ce820..7d0b14e 100644
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
index dce4c924..b9e599e 100644
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
index eb3523c..6e05a00 100644
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
index 2ce889b..9cd1035 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
@@ -7,6 +7,7 @@ Required Properties:
 
 - compatible: Should be one of:
 	- "mediatek,mt6779-ipesys", "syscon"
+	- "mediatek,mt8192-ipesys", "syscon"
 - #clock-cells: Must be 1
 
 The ipesys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
index 054424f..6bfb49a 100644
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
index d8c9108..81fa345 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -15,6 +15,7 @@ Required Properties:
 	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
 	- "mediatek,mt8173-mmsys", "syscon"
 	- "mediatek,mt8183-mmsys", "syscon"
+	- "mediatek,mt8192-mmsys", "syscon"
 - #clock-cells: Must be 1
 
 For the clock control, the mmsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 8723dfe..b405cbc 100644
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
index 5ce7578..1627e38 100644
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
index 9819516..376c82e 100644
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
index 6a6a14e..d22de01 100644
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
