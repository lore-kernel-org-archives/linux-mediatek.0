Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C5EC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nz76j0qRG7M80pmlEKyVRAG1FYXj27a46ctowWFtgUI=; b=UwwKr/UnLk/vLAkdiT5c3gt2k9
	IcOR9EP15eF8dO0d9ZbbU1RjWLThQLaNxBobVgjjYWg6uaZp+5z7ry7x1xJQpOmoFS+ZjoG04x99B
	5wA/bMglxbxYxspYRxmfk7H9NEG4MYr+tf4hmSd4slPvVhjaCZvYpNssmyctFWph10c4VfxKrrqMi
	4vvrIgZu5DHhb3oLkOXtYJxq44uFnHi73fGo/1pBoeFmNoJECtpPXhpgK3HQPt7FshjfKDrIfBCxU
	PY+jrwpDeoo1kTK5oj4r0wwguvlPkdrooOJkrONHvqLkk6EQn3hGz51IN5S/KRYvfhlSjkrDTeYWK
	LYVxSRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8K-005ADN-2K;
	Wed, 07 Jun 2023 09:07:12 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8F-005A8e-0q
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 09:07:08 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-55b2170b536so378220eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686128822; x=1688720822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz76j0qRG7M80pmlEKyVRAG1FYXj27a46ctowWFtgUI=;
        b=EwJ6ylXOZhGaP+0ge6C4IJsrjlSUexk1wQ6jL3h3wsudSISMlA/XDzEVnr91bilrJY
         ctT78e5Tf15nGS3bKaNGTd0zw4MoJ/EAwEfIcwuz2YEKYPhx6pX96frDRMCVbZKPXuIf
         zUPolFsiG4YV2W9LmDFX6U3BILbEJB4grFYuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128822; x=1688720822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nz76j0qRG7M80pmlEKyVRAG1FYXj27a46ctowWFtgUI=;
        b=HbJqMnoC7HzpOiOLSXLFnNW4aQhSt2GYxrfTMO0mQ6mCX8dC2kAdVXwYftSjvnJE9q
         v5wiph6zDoCEkaBEaz2YTLFll1adXXtAmeAcTNmQnel4UrVHFT01/gI7FjqSjMSyPELK
         pds/3lomilibbqPFzK8gGj9JksGysQpkjoTFfb2GNRq412520d+OC/LO75x9NbxzP5oZ
         yDbLKm7NPR2lDu6BGaTKjdjlYDPHvnb6dKw7h9/VEbU0CgmMM7LhLIYV+PrGEvdHx5Ij
         eoxgYffFGkQOcIb7YDH7Zdg7PTcErSl2ezRVqpdqwd6zO5IquylAHaZ3yeme+a91dWu1
         XPrA==
X-Gm-Message-State: AC+VfDzu1FS8uUz/M3uNsCZXHj/qu2z5I3WBdKb3XjfXnZfPSw+78rGS
	PdATHMtXDPpFjBdhlAjtAQRpCg==
X-Google-Smtp-Source: ACHHUZ7hcSVOowiPXhPeqmmoXLnSzASTWamdqYbyKBsrA0/VfrVRfq1YMn7GAAugHeW71s9tNSygag==
X-Received: by 2002:a05:6358:c591:b0:125:a552:4389 with SMTP id fc17-20020a056358c59100b00125a5524389mr2980713rwb.22.1686128822414;
        Wed, 07 Jun 2023 02:07:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:443b:29bb:b677:185d])
        by smtp.gmail.com with ESMTPSA id b38-20020a631b66000000b0051eff0a70d7sm8505732pgm.94.2023.06.07.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:07:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/4] arm64: dts: mediatek: mt8186: Add CCI node and CCI OPP table
Date: Wed,  7 Jun 2023 17:06:49 +0800
Message-ID: <20230607090653.2468317-2-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230607090653.2468317-1-wenst@chromium.org>
References: <20230607090653.2468317-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_020707_297040_B4EB16E2 
X-CRM114-Status: GOOD (  11.32  )
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

Add a device node for the CCI (cache coherent interconnect) and an OPP
table for it. The OPP table was taken from the downstream ChromeOS
kernel.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 117 +++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 8c02232cac38..1b754f7a0725 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -27,6 +27,115 @@ aliases {
 		rdma1 = &rdma1;
 	};
 
+	cci: cci {
+		compatible = "mediatek,mt8186-cci";
+		clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>,
+			 <&apmixedsys CLK_APMIXED_MAINPLL>;
+		clock-names = "cci", "intermediate";
+		operating-points-v2 = <&cci_opp>;
+	};
+
+	cci_opp: opp-table-cci {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cci_opp_0: opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <600000>;
+			opp-level = <15>;
+		};
+
+		cci_opp_1: opp-560000000 {
+			opp-hz = /bits/ 64 <560000000>;
+			opp-microvolt = <675000>;
+			opp-level = <14>;
+		};
+
+		cci_opp_2: opp-612000000 {
+			opp-hz = /bits/ 64 <612000000>;
+			opp-microvolt = <693750>;
+			opp-level = <13>;
+		};
+
+		cci_opp_3: opp-682000000 {
+			opp-hz = /bits/ 64 <682000000>;
+			opp-microvolt = <718750>;
+			opp-level = <12>;
+		};
+
+		cci_opp_4: opp-752000000 {
+			opp-hz = /bits/ 64 <752000000>;
+			opp-microvolt = <743750>;
+			opp-level = <11>;
+		};
+
+		cci_opp_5: opp-822000000 {
+			opp-hz = /bits/ 64 <822000000>;
+			opp-microvolt = <768750>;
+			opp-level = <10>;
+		};
+
+		cci_opp_6: opp-875000000 {
+			opp-hz = /bits/ 64 <875000000>;
+			opp-microvolt = <781250>;
+			opp-level = <9>;
+		};
+
+		cci_opp_7: opp-927000000 {
+			opp-hz = /bits/ 64 <927000000>;
+			opp-microvolt = <800000>;
+			opp-level = <8>;
+		};
+
+		cci_opp_8: opp-980000000 {
+			opp-hz = /bits/ 64 <980000000>;
+			opp-microvolt = <818750>;
+			opp-level = <7>;
+		};
+
+		cci_opp_9: opp-1050000000 {
+			opp-hz = /bits/ 64 <1050000000>;
+			opp-microvolt = <843750>;
+			opp-level = <6>;
+		};
+
+		cci_opp_10: opp-1120000000 {
+			opp-hz = /bits/ 64 <1120000000>;
+			opp-microvolt = <862500>;
+			opp-level = <5>;
+		};
+
+		cci_opp_11: opp-1155000000 {
+			opp-hz = /bits/ 64 <1155000000>;
+			opp-microvolt = <887500>;
+			opp-level = <4>;
+		};
+
+		cci_opp_12: opp-1190000000 {
+			opp-hz = /bits/ 64 <1190000000>;
+			opp-microvolt = <906250>;
+			opp-level = <3>;
+		};
+
+		cci_opp_13: opp-1260000000 {
+			opp-hz = /bits/ 64 <1260000000>;
+			opp-microvolt = <950000>;
+			opp-level = <2>;
+		};
+
+		cci_opp_14: opp-1330000000 {
+			opp-hz = /bits/ 64 <1330000000>;
+			opp-microvolt = <993750>;
+			opp-level = <1>;
+		};
+
+		cci_opp_15: opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <1031250>;
+			opp-level = <0>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -83,6 +192,7 @@ cpu0: cpu@0 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu1: cpu@100 {
@@ -101,6 +211,7 @@ cpu1: cpu@100 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu2: cpu@200 {
@@ -119,6 +230,7 @@ cpu2: cpu@200 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu3: cpu@300 {
@@ -137,6 +249,7 @@ cpu3: cpu@300 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu4: cpu@400 {
@@ -155,6 +268,7 @@ cpu4: cpu@400 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu5: cpu@500 {
@@ -173,6 +287,7 @@ cpu5: cpu@500 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu6: cpu@600 {
@@ -191,6 +306,7 @@ cpu6: cpu@600 {
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu7: cpu@700 {
@@ -209,6 +325,7 @@ cpu7: cpu@700 {
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		idle-states {
-- 
2.41.0.rc0.172.g3f132b7071-goog


