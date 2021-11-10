Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0B4C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:52:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE9F76113E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE9F76113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2oUflZmsYUbOHm9oBbHxgnfr26Rn0QvOCro1ZW35rQ=; b=vo71MI+8LDn9hJ
	NF19+M85lairxq1a6UK0lBIXHysfz74RVhQlBRmuYiq+D1qNPXMLsKGITQkbkBn/LYCJlsj7FhImZ
	/5QMN3t/Pvj1HY9l0nmN10uvCZBz91JLVUUIZ9nIB07NInjSZEy1EHvBBYldXHSuAtspwz5Ke0jNL
	uBvWtPpob6z5mlZ2O1+fN29J1nfZVpdDJPIMhcbbs1wcXB0mXL3e/Q02TXg3LvfAUKHUWTVZCCMVC
	xYWNBTY7f27nEyrxMRPmbEVDiMv12WO1e1j+pwwjT7lxhWQXfSEolv1FEAIoYXMoVIVElrJ4bto0U
	OpS1N92PiKk2piJH6zjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktdr-006DtD-7u; Wed, 10 Nov 2021 19:52:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktbw-006Cti-Cy
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:50:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d5so5984326wrc.1
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fi1SQ0650VpnUBsZivmkkBhDo1jhzZgEKHW44G9Rwtw=;
 b=h3AI7I6ru3Nn/MCBCN35cPu4WE47fz6h+EIjb1eXtPS/nC4egSJFdDxGFcHv0KaE7p
 gt2ox2xz4q/bE6vbUm4+C5y1y1axolM+2MKnGJyp33JG1q5EcxX+mDca6A1MdDAPjH14
 Iw2YT7/zeUur84LG9TKKpGcjdr+t3eoiuYsae9Y5PI2E686+j47lM6po+zm/iif9+2td
 G1gnU1A6G8zFUJMo/eoIoeo8ivhQSrcHpol52F5NQYnWb2OoacJU89GqL63cfQlvR8HB
 qp7IoZjwOuXLDV9bFLm1IgT/dZWW8QzbUJamQ+Rq1MqR8bGTdkRObjNsq73lwQHgNYmn
 kCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fi1SQ0650VpnUBsZivmkkBhDo1jhzZgEKHW44G9Rwtw=;
 b=Kn5bOqyEiPbDMcg6pc1MYps4WRf5IYuoKqWuWlcjKwpxUHIR5h0DQOWgDmrzog0oHE
 f7bQAzykIfiwuG3Ko7LXnwra88drOa2QLPLBs78+yhC9cbz0LA50h1iGwhjlJ8qn1iUL
 FJP98XI3A6Fbanq45DsR3TwhbxHwpFph40f15LiK9NUBQ/UTlWYWmxghYMf8oHbcwvkm
 LEiSWaC2q20fY1c2gT12tpxQtrhDbZFrIY11rV50++qijm8Wxq2q2zfAQhdScoGhP7C8
 WC2IKWtWGI3WZCll/3B5HorXR2zrf3N3z8qD1MD7+G8KdZt1Wz2P/7Tcebzy7ZgYBSRt
 X03w==
X-Gm-Message-State: AOAM530G3/S13ZUKWQdj28Fqjl9gE7xdpuuoDYfT83MLYiAPiXSjOwTo
 d355tZyakVTf+02s6J3vSky3jw==
X-Google-Smtp-Source: ABdhPJyNwAHNRfrXhmSz0qWblbyRi1RZjAletdfZItDgstEuKD8EM5XYNkrrljsACKRpt8B1eOaSzA==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr1857692wrt.375.1636573818895; 
 Wed, 10 Nov 2021 11:50:18 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k15sm750935wrx.53.2021.11.10.11.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:50:18 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: mediatek: mt8192: fix i2c node names
Date: Wed, 10 Nov 2021 20:49:59 +0100
Message-Id: <20211110194959.20611-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211110194959.20611-1-fparent@baylibre.com>
References: <20211110194959.20611-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_115020_478097_4C59A948 
X-CRM114-Status: GOOD (  10.02  )
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

Fix the i2c node names to be compliant to the YAML schema. The
I2C node name should match the following pattern: "^i2c@[0-9a-f]+$".

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v3: rebased
v2: new patch

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index c7c7d4e017ae..53d790c335f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -479,7 +479,7 @@ audsys: clock-controller@11210000 {
 			#clock-cells = <1>;
 		};
 
-		i2c3: i2c3@11cb0000 {
+		i2c3: i2c@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
 			      <0 0x10217300 0 0x80>;
@@ -498,7 +498,7 @@ imp_iic_wrap_e: clock-controller@11cb1000 {
 			#clock-cells = <1>;
 		};
 
-		i2c7: i2c7@11d00000 {
+		i2c7: i2c@11d00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d00000 0 0x1000>,
 			      <0 0x10217600 0 0x180>;
@@ -511,7 +511,7 @@ i2c7: i2c7@11d00000 {
 			status = "disabled";
 		};
 
-		i2c8: i2c8@11d01000 {
+		i2c8: i2c@11d01000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d01000 0 0x1000>,
 			      <0 0x10217780 0 0x180>;
@@ -524,7 +524,7 @@ i2c8: i2c8@11d01000 {
 			status = "disabled";
 		};
 
-		i2c9: i2c9@11d02000 {
+		i2c9: i2c@11d02000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d02000 0 0x1000>,
 			      <0 0x10217900 0 0x180>;
@@ -543,7 +543,7 @@ imp_iic_wrap_s: clock-controller@11d03000 {
 			#clock-cells = <1>;
 		};
 
-		i2c1: i2c1@11d20000 {
+		i2c1: i2c@11d20000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d20000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
@@ -556,7 +556,7 @@ i2c1: i2c1@11d20000 {
 			status = "disabled";
 		};
 
-		i2c2: i2c2@11d21000 {
+		i2c2: i2c@11d21000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d21000 0 0x1000>,
 			      <0 0x10217180 0 0x180>;
@@ -569,7 +569,7 @@ i2c2: i2c2@11d21000 {
 			status = "disabled";
 		};
 
-		i2c4: i2c4@11d22000 {
+		i2c4: i2c@11d22000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d22000 0 0x1000>,
 			      <0 0x10217380 0 0x180>;
@@ -588,7 +588,7 @@ imp_iic_wrap_ws: clock-controller@11d23000 {
 			#clock-cells = <1>;
 		};
 
-		i2c5: i2c5@11e00000 {
+		i2c5: i2c@11e00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11e00000 0 0x1000>,
 			      <0 0x10217500 0 0x80>;
@@ -607,7 +607,7 @@ imp_iic_wrap_w: clock-controller@11e01000 {
 			#clock-cells = <1>;
 		};
 
-		i2c0: i2c0@11f00000 {
+		i2c0: i2c@11f00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11f00000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
@@ -620,7 +620,7 @@ i2c0: i2c0@11f00000 {
 			status = "disabled";
 		};
 
-		i2c6: i2c6@11f01000 {
+		i2c6: i2c@11f01000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11f01000 0 0x1000>,
 			      <0 0x10217580 0 0x80>;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
