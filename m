Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E53C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBbMh4VJQSENMww0dOzgXxo1RM/VlCElXB1csm8/4yk=; b=MFay6SNxqhib8nakUbWrtoVBJe
	R1Cj52Vi5S0AG5/IuPEZz3TsgHFTFAoeA/7dj0mMBVWFVCVJJQRUrAwHuxylbumIgitDJBpeCISer
	aeZ6FhwaxlvzZbEZXCVN2vEcasdjYU9jdFmMf2ryaGlgaELHZ083uA2o/GBvVDotLVisjcbCeqNYR
	aCVDwAx4OiJJsYgYL2QJTBWIyw66C0RAqqwFKhKThmvKKZAUOG2hU8B2rRq1sQ0lHKN5Gkl5j18XI
	k70g3Z/OCxAeUqIaLWcLtKeYf6dVWc77oTDQ+j+uly35elXrfMZGzfrEqpOc6Ysi53cbKfYpuCsph
	zr6YgaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3dFk-005PSJ-L7; Tue, 21 Jun 2022 12:45:08 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3dFO-005PH1-6L; Tue, 21 Jun 2022 12:44:48 +0000
Received: by mail-oi1-x233.google.com with SMTP id q11so16883678oih.10;
        Tue, 21 Jun 2022 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBbMh4VJQSENMww0dOzgXxo1RM/VlCElXB1csm8/4yk=;
        b=eolm2QQGIWVt9QGJZP7tr72BIW3micukjnoCEafo7KN3jMzs3m4Elt5xV/fiYg+lOd
         vir4bPdilxNpZlovp5y+FTc5/9GKgAWLg2rYAWI4DCjZnGVqziDReoL8DlblgxyRpUwR
         xnBePY1UrQC/lYHe7a6asq6bjM5aKrl/Z1fKRcuNtZj92nmKrSmt69XnsYMnO7eq27fM
         IgN8ycYrO/V81iMl1wYK1Ygdzrw2xIB1C0whXaZEjXmYezgjxNb1LNEum7A7arTZ9t+h
         E8m8x0ID7HdUCiWTKKIAagp6KX3Z7QStVXmoffBq9lS+sH1UxGG2KnvNvqPS2Oa4ItWK
         Ebug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBbMh4VJQSENMww0dOzgXxo1RM/VlCElXB1csm8/4yk=;
        b=P+wek1Tz0oU6Iknqdj30sgYMkjGV84+UM7KLLBAmq2v7YFgeihDU/2zFthkzlU9m3P
         toQbxUvtDp29LRiMdp0bMus9U++2Lcnfw350mQYNwv3KfNcDWfMuXrKPx4NGBwe0roXC
         kUbOLBXjGUpLM+lDfrv1b0vFvnX9XbUzx/Sc+mGDAJCCE2U4yc5Zt6WBzaX6VRNCH17P
         /kcztSFeC8YANoQduqbYePoNZKQ0wv/O/qHNbn5Z2kHjg3Qopl16Jc2QvZVhsdklsXqL
         bQR/vaU7CD0aFKXDAxf9oZ5MzbqSQuigxUoidiI6L4W0SmG7BURpsxjmnggrSmZBqiRY
         a0eA==
X-Gm-Message-State: AJIora8R98ZPeI3t2N3bpo+epNAjykPJiW39QsqtACvNGGbS2Ii9t7x5
	gM4+NudcoW0OlNfzg4uPkDk=
X-Google-Smtp-Source: AGRyM1sq4B19d7lmERuBrPFlV3/m2YkAYtRTELTucq5c/IRSj7me2X0BE8FuHX0EtJp00/WkU+EhaA==
X-Received: by 2002:a05:6808:f92:b0:32f:6e27:6cc7 with SMTP id o18-20020a0568080f9200b0032f6e276cc7mr14067682oiw.36.1655815484060;
        Tue, 21 Jun 2022 05:44:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:8593:ab55:c903:7d93])
        by smtp.gmail.com with ESMTPSA id s22-20020a056870e6d600b000f33ced2c50sm8898350oak.56.2022.06.21.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 05:44:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] arm64: dts: mediatek: Replace 'enable-sdio-wakeup'
Date: Tue, 21 Jun 2022 09:44:35 -0300
Message-Id: <20220621124435.121740-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_054446_271852_35573228 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Fabio Estevam <festevam@denx.de>

As explained in Documentation/devicetree/bindings/mmc/mmc-controller.yaml,
the 'enable-sdio-wakeup' property is considered deprecated.

Replace it with the 'wakeup-source' property instead.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi    | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts     | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi  | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 923c1c3477e5..e21feb85d822 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -410,7 +410,7 @@ &mmc3 {
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 	keep-power-in-suspend;
-	enable-sdio-wakeup;
+	wakeup-source;
 	cap-sdio-irq;
 	vmmc-supply = <&sdio_fixed_3v3>;
 	vqmmc-supply = <&mt6397_vgp3_reg>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 7ac9864db9de..52dc4a50e34d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -134,7 +134,7 @@ &mmc1 {
 	vmmc-supply = <&mt6358_vmch_reg>;
 	vqmmc-supply = <&mt6358_vmc_reg>;
 	keep-power-in-suspend;
-	enable-sdio-wakeup;
+	wakeup-source;
 	non-removable;
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b50261e8b9ed..89e4358f140a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -382,7 +382,7 @@ &mmc1 {
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 	keep-power-in-suspend;
-	enable-sdio-wakeup;
+	wakeup-source;
 	cap-sdio-irq;
 	non-removable;
 	no-mmc;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index afeb5cd37826..530e0c9ce0c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -159,7 +159,7 @@ &mmc1 {
 	vmmc-supply = <&mt6358_vmch_reg>;
 	vqmmc-supply = <&mt6358_vmc_reg>;
 	keep-power-in-suspend;
-	enable-sdio-wakeup;
+	wakeup-source;
 	non-removable;
 };
 
-- 
2.25.1


