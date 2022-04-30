Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E49C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AB78hpuiZ86kSu1XTA+k+vtjlByj4ScovBbO/ZW/pig=; b=VI4YBfKBPME25X
	O9Fx/A83ChCfbp0Zt2Bu01KCyi7JNOiGFQrx9dPGMkFtR7x4YJshOx3ZrvQQTuuYrkB+DQ6nWoZPI
	TtnScO9tJpx55J32A2/R7NVeOSS7XGB28Hy4iRbP/ajJF5MxsdgHNXpRKjG4biJS6Ofpr5trADzQr
	YLApwW60tB4dIS2N2nwUkHLS8rJnvYQbilCVqliN+vFScmhncRJ5mpOT3drzjsLxWA/+Em3VUz1mE
	IJCqNXXCH2djCq2h5AVpckJVxwNE56NzW9B5oNf7XZSsBlS9pCI5zEXEbwGHLOvk8ScFdyyf6kMla
	qVV0pJ6lkIg4QIlL2y8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkq3v-00EeBm-6n; Sat, 30 Apr 2022 16:35:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkq3k-00Ee9I-CW; Sat, 30 Apr 2022 16:35:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id i17so348244pla.10;
 Sat, 30 Apr 2022 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EyGOhUWTiu5u131oTuoKOtQFl2U6BDUbmbvuOTx3toc=;
 b=Zuuwy2M6G2TwFQUNnapePqiqchEQ9b1DK7KVD30MpVWCQCOjgd2YOrl9FAD9LiaJnY
 IDl4V5NC0EGSiZWubq9qnjmrDkhVcX6TVMFGInVD68debHAM8Ku4TJTNb8YoWqwzPlpb
 24XNGR3crfXm/eytqO6nEM89AVC9XuOaJtvN2sHdIUsk0ZI1E2kBDIYy6VU31pemikrT
 EsJac+JYKxGk//S71HMS+Cm9v+NAocdh5qutNBLoUfGyl8X6XOjPoRg0Kfbe7W8QeNzg
 T3J3ndqs16qdEAkvTJz96ayfh+cTPgCxj7r3nb9xg5sklbySy2goTWsVL/vSj7eaR9/9
 nVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EyGOhUWTiu5u131oTuoKOtQFl2U6BDUbmbvuOTx3toc=;
 b=G75vJYI2+cggs6BZDgs4MnUUl86LLGVF/oQUPynzPlK1gUqDMJcMA5zpsKR9KDwBj8
 Bxvt2NO8adVOeYw/MN5LlWq+PBCwRTmcOpSQx6JlQJxyLbPcniDdpcJVNAty7X0WirrL
 obVsGs4UzXq6X3RuNO7jbhX8YADYi5AqzJpeQRdfTusBVpi9xIYJLBa/anT8mvLDrRzX
 OIaGDW3TvoROjUUlzPPug/Hx7CshB/vU33OXhs8SFLKdQ8osH2NI+NgvPJ++g2lEulLI
 ZWJW7Kt7b52KqGC/zXq13pprhh1k2xjSp7qVI1dmruBwY9P0apG/QAHpskbcK3n+mMxF
 +JPQ==
X-Gm-Message-State: AOAM533uDKo/ECizmAWOpko2j9an6K/T7eDjsydSCnGhSX+4gw42CB03
 PQ6OVGxNS65yGiRBkupNj9e+J2bbudtO/g==
X-Google-Smtp-Source: ABdhPJzpINsjuBEKWL2ROktmfsUJ53AY3PCTX+D41hWSE2ffksbSXCdPFcmTn6RkP6Uz/RB1YfHK7A==
X-Received: by 2002:a17:90b:4a49:b0:1d2:adce:8a89 with SMTP id
 lb9-20020a17090b4a4900b001d2adce8a89mr9816215pjb.43.1651336503290; 
 Sat, 30 Apr 2022 09:35:03 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:c0f1:53a1:ea79:5d2f])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a65608d000000b003c14af50606sm8401152pgu.30.2022.04.30.09.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 09:35:02 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm: dts: mediatek: add mtk-snfi for mt7629
Date: Sun,  1 May 2022 00:34:52 +0800
Message-Id: <20220430163453.537061-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_093504_466376_247E9135 
X-CRM114-Status: GOOD (  10.01  )
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

This patch adds device-tree nodes for the MTK SPI-NAND Flash Interface
to mt7629 device tree.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/arm/boot/dts/mt7629.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 46fc236e1b89..6f231e2ed68f 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -286,6 +286,27 @@ spi: spi@1100a000 {
 			status = "disabled";
 		};
 
+		snfi: spi@1100d000 {
+			compatible = "mediatek,mt7629-snand";
+			reg = <0x1100d000 0x1000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_NFI_PD>, <&pericfg CLK_PERI_SNFI_PD>;
+			clock-names = "nfi_clk", "pad_clk";
+			nand-ecc-engine = <&bch>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		bch: ecc@1100e000 {
+			compatible = "mediatek,mt7622-ecc";
+			reg = <0x1100e000 0x1000>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_NFIECC_PD>;
+			clock-names = "nfiecc_clk";
+			status = "disabled";
+		};
+
 		qspi: spi@11014000 {
 			compatible = "mediatek,mt7629-nor",
 				     "mediatek,mt8173-nor";
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
