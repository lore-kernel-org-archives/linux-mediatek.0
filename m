Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33828C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:38:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A96A2417D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:38:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iw0JkIIx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nKeArM35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A96A2417D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IJ1U1Z76Co8Qmyr+CL3/9TyhaCuHWb4qVrnsiU5bsHY=; b=iw0JkIIxCFNvacqa7jRw/EAQQ
	evVpuE7Bm5VdmouAfvi8FA4sLOngkV1/MmQTvOQ5ynP9iaL7dqFiwxLftWLUMESMaVsUGWTnA2UBE
	Zm05XzbDU1n8ETsT85VhflT2LL1sgXY5IlVFvlyjJfYhp98qrt0TVQUPZmsZXDZZf917xuNgnVBJM
	g4HG+tPcHrS34QE+rvgKKGpc/G0mGtBFKfXx4GR/u8ZXCRmHEkzMvH5AsGr7frsRqEYGAgAQoSm/r
	gc9FAwVLl2QgSQwub0xRtOz9K+iu/kBgB6UJE2Xr3W+46QWRFXIo0CPI088+cesXvRZN5bio6G/mN
	Shz2JL2Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVZrU-0005AC-VL; Thu, 22 Oct 2020 12:38:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVZr2-0004zV-OD; Thu, 22 Oct 2020 12:38:07 +0000
X-UUID: 1fb07036fb8a4ce9bc2c99687081166e-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QckeAew5w1m3cTth7W/ZhNf9FbV66GSrfyU8fXpoW30=; 
 b=nKeArM35E+gnC6F9j4TUxlZeo39f7POBGL+RpQS8heeuPnQuN7E2yxSuXXibkZTDuOvY4CyuADG7oqb1Lp8WUvJYKLS+tp4AurpIoqSSyXZixPywRfFgu+vI2C/TbXSy5gbhXXE4KFgYYxOTv/C1VeS0lmrY1ZV86llvPhhCjU4=;
X-UUID: 1fb07036fb8a4ce9bc2c99687081166e-20201022
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1516130180; Thu, 22 Oct 2020 04:37:55 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:51 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 07/34] dt-bindings: ARM: Mediatek: Document bindings of
 MT8192 clock controllers
Date: Thu, 22 Oct 2020 20:37:00 +0800
Message-ID: <1603370247-30437-8-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_083804_969869_55466911 
X-CRM114-Status: GOOD (  13.52  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the binding documentation of topckgen, apmixedsys,
infracfg, pericfg and subsystem clocks for Mediatek MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt     | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt     | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt     | 2 ++
 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt   | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt     | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt     | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt      | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml   | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt   | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt    | 1 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt    | 1 +
 12 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
index bd7a0fa..6942ad4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
@@ -17,6 +17,7 @@ Required Properties:
 	- "mediatek,mt8135-apmixedsys"
 	- "mediatek,mt8173-apmixedsys"
 	- "mediatek,mt8183-apmixedsys", "syscon"
+	- "mediatek,mt8192-apmixedsys", "syscon"
 	- "mediatek,mt8516-apmixedsys"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index 38309db..fdcb267 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -12,6 +12,7 @@ Required Properties:
 	- "mediatek,mt7622-audsys", "syscon"
 	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
 	- "mediatek,mt8183-audiosys", "syscon"
+	- "mediatek,mt8192-audsys", "syscon"
 	- "mediatek,mt8516-audsys", "syscon"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
index a0ce820..0082f21 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
@@ -9,6 +9,7 @@ Required Properties:
 	- "mediatek,mt6765-camsys", "syscon"
 	- "mediatek,mt6779-camsys", "syscon"
 	- "mediatek,mt8183-camsys", "syscon"
+	- "mediatek,mt8192-camsys", "syscon"
 - #clock-cells: Must be 1
 
 The camsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
index 1e1f007..b4312d1 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
@@ -14,6 +14,8 @@ Required Properties:
 	- "mediatek,mt7623-imgsys", "mediatek,mt2701-imgsys", "syscon"
 	- "mediatek,mt8173-imgsys", "syscon"
 	- "mediatek,mt8183-imgsys", "syscon"
+	- "mediatek,mt8192-imgsys", "syscon"
+	- "mediatek,mt8192-imgsys2", "syscon"
 - #clock-cells: Must be 1
 
 The imgsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
index 49a968b..ba5e781 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
@@ -18,6 +18,7 @@ Required Properties:
 	- "mediatek,mt8135-infracfg", "syscon"
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
index ad5f9d2..fc1ce61 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
@@ -9,6 +9,7 @@ Required Properties:
 	- "mediatek,mt2712-mfgcfg", "syscon"
 	- "mediatek,mt6779-mfgcfg", "syscon"
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
index 1af30174..b672c91 100644
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
index 9b0394c..c480278 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
@@ -17,6 +17,7 @@ Required Properties:
 	- "mediatek,mt8135-topckgen"
 	- "mediatek,mt8173-topckgen"
 	- "mediatek,mt8183-topckgen", "syscon"
+	- "mediatek,mt8192-topckgen", "syscon"
 	- "mediatek,mt8516-topckgen"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
index 7894558..ee679e0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
@@ -13,6 +13,7 @@ Required Properties:
 	- "mediatek,mt7623-vdecsys", "mediatek,mt2701-vdecsys", "syscon"
 	- "mediatek,mt8173-vdecsys", "syscon"
 	- "mediatek,mt8183-vdecsys", "syscon"
+	- "mediatek,mt8192-vdecsys", "syscon"
 - #clock-cells: Must be 1
 
 The vdecsys controller uses the common clk binding from
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
