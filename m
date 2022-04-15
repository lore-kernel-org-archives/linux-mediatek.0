Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26170C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myA8iu0IKydP+7Ap+ZD2Z4jujC4TJqQikVtXyJHzWsQ=; b=Gkq/MHzCf47vd8
	Z0eX5ejLeKtCBJoxdxl/L2zvmFdT+5SRUp64sRDweCWyVKjnpTrAwBvx15jeiYZbtGIXkX1rnpp1h
	Gkp42UmcfromA+0PxaIkAgeoDdX8cE21qwovLoSEpCQq0HPAr2qyY0Lr65E+kjAu7TBuz1eXVafvj
	Q8waiSrLtj+AmW0o0SEEeAsrp4sLoqERqQt8+hVj8xVe+ylRhg43HXp+/WWUz33ECOFlUVwGzc52M
	/Ydp0k69KjxwLtV4nor910alOWk/t1FCJpLewjRR+WbaxynQ/vE5IqK9E6MQS6w8bbgysZswM79AX
	qozEaIQWVzayTSqq/+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfPJJ-00AxoQ-O7; Fri, 15 Apr 2022 17:00:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfPJ9-00AxjX-FX
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 17:00:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id g18so11261076wrb.10
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DtrWZQmLbh6BgPYAsMpSHPxDFToRkqobGkqBOET+Pc=;
 b=xWkLOaddSO4SKchm0277aiMkAwx1ZOGp2XXeXJPSksUvO3GmJz5BK80b5J3dEBY6EN
 wnhgzaisOm6LgOJeZz4wWQqDiZtCEiYb4OTacJJhH/O8QMp4a+YKmFVmyfCCNm+IhkUD
 Ufwd1uH5BIH8fK/LnX4C7Qlz5BgYuDifZGO3cC2VJsCnM2tqVC0x4M8cGPsRRzsW6Bbk
 XAKP5wmNFTST8DJsrASlC6AmOYIOo77PiEYCi+g/ctpZ77Tm7Ybq2uamx7aCKJSwP/dw
 c+UJ31dqtfTz1LQa1GpLWxscDkanxRdBLlLaambeawWsJdFNuFqzWJecW7iSoGUVR3DI
 r9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DtrWZQmLbh6BgPYAsMpSHPxDFToRkqobGkqBOET+Pc=;
 b=HsU3a3T8zn4vHgQGB28Z+OUVhlb8fVDJDWXENSRJrGhRHNlX6OpcmcyE8TgkSuVPVZ
 3zEEhepRPLk9bgj7gMiZi5d4R0W7Tl9Cz7Nkvlws22FRiMvwS4UB+MXaCIG6aspdbi6l
 Ji5hqx+uYR73Isq3iYHk8OKFgj75hAb5WrFRbtMwxmgkiarx3IVg9ere025ac13lase/
 6VTN8YNeipIq4tGa1KYZSx5l6Hye9zTDTMNvai9dHZTNdPgJhZCgkC3GweFCfmCwwX9o
 Fqc0MGfhGVmuYWKyImO2FOSA/n4WdSqld/YC3i1MMlFjT8rWGx6NP6DWxTKLzaUdYgDx
 u0MA==
X-Gm-Message-State: AOAM531nUzgBpek9O+fbtgbY3ujpZEl925SbIDSSd1Cwc4zfBpHS82Ps
 G6iLTIsJhDuDnH71lVO5IrJuOA==
X-Google-Smtp-Source: ABdhPJyvWQj30Y6+u8XT8aJ4AK2kwz8H/ZsRhCjD+JCTOfHK6pVtnfj5JXf8eLkK9T8Dh119HuzfcA==
X-Received: by 2002:a5d:48ca:0:b0:207:b62b:7483 with SMTP id
 p10-20020a5d48ca000000b00207b62b7483mr81653wrs.349.1650042027083; 
 Fri, 15 Apr 2022 10:00:27 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 i127-20020a1c3b85000000b00391a363f5adsm2119704wma.36.2022.04.15.10.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 10:00:26 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8195: add UFS HCI node
Date: Fri, 15 Apr 2022 18:59:39 +0200
Message-Id: <20220415165939.1861470-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415165939.1861470-1-fparent@baylibre.com>
References: <20220415165939.1861470-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_100031_554447_43795CEB 
X-CRM114-Status: UNSURE (   9.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the node for the UFS HCI controller for the MediaTek MT8195 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index b57e620c2c72..2255e19cc3b2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -619,6 +619,30 @@ mmc2: mmc@11250000 {
 			status = "disabled";
 		};
 
+		ufshci: ufshci@11270000 {
+			compatible = "mediatek,mt8195-ufshci",
+				     "mediatek,mt8183-ufshci";
+			reg = <0 0x11270000 0 0x2300>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&ufsphy>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AES_UFSFDE>,
+				 <&infracfg_ao CLK_INFRA_AO_AES>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_TICK>,
+				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_SYS>,
+				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_TICK>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_MP_SAP_B>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_TX_SYMBOL>,
+				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>;
+			clock-names = "ufs", "ufs_aes", "ufs_tick",
+				      "unipro_sysclk", "unipro_tick",
+				      "unipro_mp_bclk", "ufs_tx_symbol",
+				      "ufs_mem_sub";
+			freq-table-hz = <0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>;
+			status = "disabled";
+		};
+
 		xhci1: usb@11290000 {
 			compatible = "mediatek,mt8195-xhci",
 				     "mediatek,mtk-xhci";
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
