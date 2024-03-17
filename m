Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11212C54E68
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDIU3B3LIVzuN5PE/PJX7w58eJrKbdUCsia7rvfzz/E=; b=NJpeDt2W4LyKLX+V+A4HkOBN55
	b5ZAc2GosjOG+WW7PvtUclUg8D19jtzRRIhqOWkCs2BC567sMlDj+XXnW85XooBhyHmVCScPFzeNZ
	B6EPCV8ynqO8GMEPhj6IGxh0rsI9saqtlHAV+wETjoUD0rEh2KAM3ZNiapRycEBQW6SfFXeQNBoPv
	20TAfAEaZsE+R2AOxbeKWw+dKKCTIONDTSxcjyF/jl/80igFnWMJD+zEmW1lnOAIBnke8N0MuhauJ
	24DTw/hM3C9eZtA1/VerUF/gmLVDXTYR1nqUuNP3tjE/TRYLsxHhmRYvzOZFDGPkRYIK0y4C2z++Y
	w2iXa75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjN-00000006bj2-30A2;
	Sun, 17 Mar 2024 22:11:49 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjG-00000006bfY-3ROr;
	Sun, 17 Mar 2024 22:11:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-513d9176cf9so2625041e87.1;
        Sun, 17 Mar 2024 15:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710713495; x=1711318295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDIU3B3LIVzuN5PE/PJX7w58eJrKbdUCsia7rvfzz/E=;
        b=QTv7f04nz9DHWU65JTCZI9UjLBpPAGzcFJ1cqrCDO1BVe7h6lq8Tt8wN0On2Y7MUdD
         rY4Yi8ZwkB9eC5VAEIlrxTcOQ0/XFLIVc1fcxGr4P045k1KF3LklW7/qgGqtVrp1Bcy4
         qb1yTDgso16RVreDiKxJvUskvz7VBIkPF2NqB26s0KOut3snQNDdGnRMnDWDJEVZNfhs
         BFBOXpv0KYx+a4xafFCtXkRd58uXKdTCebA4J8qR8aP4gs8zCxr2y9Nfj0nAM6VmkVle
         PrfxWPgbvwD6tY80M2E8slaRPXtKn0x8wtwcv+ZSPbv7XtBXXQuSfTsXxcTFfIsHdl5l
         p/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710713495; x=1711318295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDIU3B3LIVzuN5PE/PJX7w58eJrKbdUCsia7rvfzz/E=;
        b=ioWg8d0kcclqwwD6nOSWUjvj/xmY7cQA2hoTsm6IwFrZnrXzzy6toRNFaaTtItssSg
         lJTHnJJuggFZmYYBW6XO3bpUDpaaOBESyZgh6j27fZqN8e/tX9MKzTRwSjmdcHwg4UIT
         w0aOOdshWh6l9QVMJsKwpCzzo1IJJtXSJs+FHT7FW9ZDjRYmUsUfkzFBSmzKXFw821oF
         E2UZo/VTQeVOqpK5ZEfBQjKZbQAYzcV5H4GgEa9d+vfvcWoXoN2bzHyHjAVYGbmLIUBk
         skyYaoc+qKoTkbXRxncHHJ744jXo2+Wi1pQ++BPIBc9i1UL//F+NTwGbsd9NYhaGgkGy
         hGrw==
X-Forwarded-Encrypted: i=1; AJvYcCUSAtCTgyGodPNypYnVCAaL/W+7JGWwqQ2RsKrHFv+KpKXrn1TzOiGsiYs97c58NJf3ESEHy8hrRL3vTBZ1JnOtJ68crq0jzuAkjW9ptW2Z+PUydLvGlUZKaUObjH92Oe6nogjLrpiWi8n4BlLIpVl2GSdXI/3v/CM=
X-Gm-Message-State: AOJu0Ywn2XDFZaMxIdrwR0Oc2Hg/cBRZAzRGjnoWRG8ptYVGjbnFsQj/
	v4epHX92RovwxjiCEsNrjqpNndHVfjlgitKm1X9Da5d6HxUzvuDT
X-Google-Smtp-Source: AGHT+IFn0N0GzA1zPaazKzhyFHTss9QlGUK8P61HVX56vrihGWw26wgIJkeeFrchxoL5S3DAiIS8Gg==
X-Received: by 2002:a19:430b:0:b0:513:cbf2:50b3 with SMTP id q11-20020a19430b000000b00513cbf250b3mr5558840lfa.35.1710713494656;
        Sun, 17 Mar 2024 15:11:34 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id y16-20020a197510000000b00513d8e5a088sm973049lfe.140.2024.03.17.15.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:11:34 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	"David S . Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/4] arm64: dts: mediatek: mt7622: fix clock controllers
Date: Sun, 17 Mar 2024 23:10:47 +0100
Message-Id: <20240317221050.18595-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317221050.18595-1-zajec5@gmail.com>
References: <20240317221050.18595-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_151142_899898_EE409881 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

From: Rafał Miłecki <rafal@milecki.pl>

1. Drop unneeded "syscon"s (bindings were updated recently)
2. Use "clock-controller" in nodenames
3. Add missing "#clock-cells"

Fixes: d7167881e03e ("arm64: dts: mt7622: add clock controller device nodes")
Fixes: e9b65ecb7c30 ("arm64: dts: mediatek: mt7622: introduce nodes for Wireless Ethernet Dispatch")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 27 +++++++++++-------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 3ee9266fa8e9..283fdf7d2d8b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -283,16 +283,14 @@ thermal_calibration: calib@198 {
 		};
 	};
 
-	apmixedsys: apmixedsys@10209000 {
-		compatible = "mediatek,mt7622-apmixedsys",
-			     "syscon";
+	apmixedsys: clock-controller@10209000 {
+		compatible = "mediatek,mt7622-apmixedsys";
 		reg = <0 0x10209000 0 0x1000>;
 		#clock-cells = <1>;
 	};
 
-	topckgen: topckgen@10210000 {
-		compatible = "mediatek,mt7622-topckgen",
-			     "syscon";
+	topckgen: clock-controller@10210000 {
+		compatible = "mediatek,mt7622-topckgen";
 		reg = <0 0x10210000 0 0x1000>;
 		#clock-cells = <1>;
 	};
@@ -734,9 +732,8 @@ wmac: wmac@18000000 {
 		power-domains = <&scpsys MT7622_POWER_DOMAIN_WB>;
 	};
 
-	ssusbsys: ssusbsys@1a000000 {
-		compatible = "mediatek,mt7622-ssusbsys",
-			     "syscon";
+	ssusbsys: clock-controller@1a000000 {
+		compatible = "mediatek,mt7622-ssusbsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
@@ -793,9 +790,8 @@ u2port1: usb-phy@1a0c5000 {
 		};
 	};
 
-	pciesys: pciesys@1a100800 {
-		compatible = "mediatek,mt7622-pciesys",
-			     "syscon";
+	pciesys: clock-controller@1a100800 {
+		compatible = "mediatek,mt7622-pciesys";
 		reg = <0 0x1a100800 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
@@ -921,12 +917,13 @@ sata_port: sata-phy@1a243000 {
 		};
 	};
 
-	hifsys: syscon@1af00000 {
-		compatible = "mediatek,mt7622-hifsys", "syscon";
+	hifsys: clock-controller@1af00000 {
+		compatible = "mediatek,mt7622-hifsys";
 		reg = <0 0x1af00000 0 0x70>;
+		#clock-cells = <1>;
 	};
 
-	ethsys: syscon@1b000000 {
+	ethsys: clock-controller@1b000000 {
 		compatible = "mediatek,mt7622-ethsys",
 			     "syscon";
 		reg = <0 0x1b000000 0 0x1000>;
-- 
2.35.3


