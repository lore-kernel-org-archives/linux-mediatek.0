Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330BDC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czM8DBayHVyqm7eWnmJUx8XTvSwkYnsGOgEg/DJr9R4=; b=S/GdcpraOFmpUn/6gy7f8mwnOF
	lq2+Zx6hlKjMZNGtvJ8WqCZ9qlWDayqNbI8jzEQtadVlwFYf8GsH1I3dvz6P7eFiGHGW+yjjwbyiM
	Cr1nS15h5Q42I2hj0jisUlRR3O+1HJUWRZYm0sxkHUkf0y6S0el9remY853iRCYmZoBrLW6oToRDw
	NETx7IDTwoIJkeOM5ecXCVTcMGH3v4La6YhUDJRDJGiXVeYSVh0sA2SztEg8a96xIE+YU79pCD7uf
	sKRtx+xtoLU32BEHw4tAhUMuo6ZeTq/SOzmSIWTHwz1kOj2zrYq6VkHqfU/O1qUmlGIgmLx9PorEO
	iuIsBgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ak-0000000018v-2scG;
	Fri, 01 Mar 2024 11:35:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ab-0000000014x-2Mgg;
	Fri, 01 Mar 2024 11:35:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a44ad785a44so25071666b.3;
        Fri, 01 Mar 2024 03:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709292916; x=1709897716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czM8DBayHVyqm7eWnmJUx8XTvSwkYnsGOgEg/DJr9R4=;
        b=SY2v9g2qqf0UbhdsKRyWGdRXa8nCDarZnRHup6wUhPDgzyEwstPy1Aao0zIt1AhmIw
         l8QtKo4T2YjiUZwuS0UV5Go/WXpVkNapQAFUotBhKPGLDYT5JMFGWeMy8fkcjXSsPXeX
         fe0nExa0bG5Grg/CuZfyAWLVSYHh06nfmMmCF56gCNA4FeUeBFUcTx6jE2wIkPSHvo3U
         ybisFCO0/Jp4bSGRysSAaJP+/2kqqBi24CEINJXDiJNkMdpaB42kWjKWz3OBJ7yhwG56
         ocFXwFb9FaCPYeOKVRPZ2fg9JyfjzGztLMh1jkExSBhmieuCDmG67Yi1LFApveyjzF7o
         wCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292916; x=1709897716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czM8DBayHVyqm7eWnmJUx8XTvSwkYnsGOgEg/DJr9R4=;
        b=P7FYz4ZOKBxczAGcD/EB+YyV6ckpZXpmDGOngizFTUzcNccz3lWx+cUx3bQQdp6e0+
         uuEeQLNuiR4rXj0I0LxVAxcFtePNC17mNJ+EBOzEmqW2vG4+V6A7xvubSRQX7jsomD63
         bU0Y95pGQQ7p5R1TIymZtpmrEz0GetPwEu1RabRk2Pz26tiD1ZqFyx11YAB/z9IyZORo
         wTZ8fsPzrbl4DoOClWeWl/P98gmgXw3nTICOQifpSFJkVtAXdZqXoE8tO/XqSzLzOzEJ
         84eMgxJCDHYBSe6UmATvh+xSCL70kHhvk3Mkn9KYNZNBXwrzTMiqyRaFsuP6g8ZfQsfI
         qlKA==
X-Forwarded-Encrypted: i=1; AJvYcCXuKJE9E1cStmkNdtZ4i0PHvPQ8NG6CECp5COCf0YO8Gp0RtvtG0zjb4KKK51SrgT5Enq6CkbwZiKeTiCFmv7ohh2tyG16J15HpA78kamkMEJ01H7iwRYvZhFf0sTIvc3eQjjhLizC2dun1HZ6IwchcorE6vJYGyGI=
X-Gm-Message-State: AOJu0YwyPy10GAfIRmgYJToGE1fHLF49nnzqafs003P9lKapke/ckJPF
	skvGJL4Xc0ecu1iZef6PYbnQF4lE8iXmccPX0AjEwlWj+q04QNh5
X-Google-Smtp-Source: AGHT+IH+/9e4RSmsSeOscUfNHVqMBJcw/1QGsSy+l6pIBhMbP5jqUqbpEIzG0EOtFN44mEcEe34NMQ==
X-Received: by 2002:a17:906:11ce:b0:a44:1fcf:9b9c with SMTP id o14-20020a17090611ce00b00a441fcf9b9cmr1045704eja.51.1709292915494;
        Fri, 01 Mar 2024 03:35:15 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id st11-20020a170907c08b00b00a3f5c39bf2asm1618457ejc.0.2024.03.01.03.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:35:15 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/4] arm64: dts: mediatek: mt7622: fix clock controllers
Date: Fri,  1 Mar 2024 12:35:03 +0100
Message-Id: <20240301113506.22944-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240301113506.22944-1-zajec5@gmail.com>
References: <20240301113506.22944-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_033517_674898_619899E6 
X-CRM114-Status: GOOD (  11.03  )
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


