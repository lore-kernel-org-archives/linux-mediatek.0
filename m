Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87360D1625B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWJu2S/ieJ6v9yJvOOOZUajs4/O8S8cJ9i+RQGe16Fw=; b=CisG66+h5wFnnM
	AhIyZtIxUlEmqjXcaLLZ7bX+44jZbmgmYga+ncXxQdYtlkJ1bjpvIhglQfMlQluvpfzcrKjv0VFc2
	djnRZJKn0p4Uq6nn1m9bFiwm6Q91j6fwObT8BFPqUhI9OQsb4qNlfKpHewG13xwxInlwrD2TuL4XC
	gDc5NsY7k1gixFVhBi9a7XDBlR1SPfi8Rb0/Uld3O3ES5Qa6SslMc6iSwAuCKt9IqbH2Hva+HdnGd
	zl9K2Btz/xeEkxFjTl6tt9kqf4CiXcl5qQg/vJNaTKiYKIkOdKKukMxXPPAgAhOMRIpoGb5jP0rHY
	egh/e0yEskNyVLWk1qPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KZ8-000000059Md-14g3;
	Mon, 14 Oct 2024 12:52:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IzB-00000004rWE-3HFe
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20cb47387ceso17746415ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904297; x=1729509097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWJu2S/ieJ6v9yJvOOOZUajs4/O8S8cJ9i+RQGe16Fw=;
        b=B5zg+2jarfUlcO8Ri5Agwm4PXFuMviAt3tBhGNyGOQhVISAwUiFv+uEX6U+xIxkSVv
         3PbWG/COS284iWmBzyfqMDapGB8yJJahnWppR07IAOEvIUbzFSKVsPfKvahcCIY+aInA
         MW7uU7Mt9FDj896zXffLgyDtN0m/49RHRuqsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904297; x=1729509097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWJu2S/ieJ6v9yJvOOOZUajs4/O8S8cJ9i+RQGe16Fw=;
        b=Y8+Fn+R0fNAv3/4G4DktuQ+fRbEhmjY2yGF0LI7vZIODtE2UeMribt7rzSaFyb+aJl
         YalChUd/dClY0iC0W5+W/UEFpjwZQLIjo4vXCeV8bTmI+rkRplIHexwpzuov/Ebk86P7
         NqdU5eSZamniveiTZbkv1E3Yk19lXpbF2O8jR5MtGKtn79U3k3oTVvfGL45nGdBLH3aq
         Hc+lqTgbNjEFF0xzIYIpLwhlKY/EkuiWH5KkZ/NMRz22bAd1CF+I8oAyh0305ecg5FpS
         fVFbFx8CF1GCDA5OBZiwERtRdqniRiwTgiLkgPJ2qJ2LAj+PfPcb4ZfhtlI15+0y7VUO
         cqsg==
X-Forwarded-Encrypted: i=1; AJvYcCXGEn3n7YZ3mGlcF0WVmGlpluXRfk6T3okDKMOJMOQr9iAtG+5oArdzzEC0qCzK44px/6UmzaB7VP1dOaO8TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysJhvQLh/kBKdkVIn+e41oJCsm34Eb5sxn0cg8kqWtVp53NClP
	0P7LTvKQKDdcQRSwbnCtpMIDz4K5Fqinz1kXbgsNZ3b6ZcfRt1jkSeT7VVWd2w==
X-Google-Smtp-Source: AGHT+IFSdH06u0c52oLgqgrVrnabmA0sXZRsEVDWxzWRDsMMS60gGETPeBjTqLsCaWG4B/VOoLVseg==
X-Received: by 2002:a17:903:228d:b0:20c:a644:c5bf with SMTP id d9443c01a7336-20ca644c633mr122246685ad.31.1728904297219;
        Mon, 14 Oct 2024 04:11:37 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:36 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 9/9] arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
Date: Mon, 14 Oct 2024 19:09:31 +0800
Message-ID: <20241014111053.2294519-10-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041137_995320_45B150DA 
X-CRM114-Status: UNSURE (   9.37  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add edp-tx and dp-tx nodes for the Embedded DisplayPort (eDP) and
DisplayPort ports to connect to DP-INTF ports and panels, and add the
efuse cell for the DP calibration data.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 6f5727f05255..e47fe1f453a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2016,6 +2016,10 @@ efuse: efuse@11f20000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			dp_calib_data: dp-calib@1a0 {
+				reg = <0x1a0 0xc>;
+			};
+
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
@@ -2877,5 +2881,27 @@ padding7: padding@1c124000 {
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x4000 0x1000>;
 		};
+
+		edp_tx: edp-tx@1c500000 {
+			compatible = "mediatek,mt8188-edp-tx";
+			reg = <0 0x1c500000 0 0x8000>;
+			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_EDP_TX>;
+			max-linkrate-mhz = <8100>;
+			status = "disabled";
+		};
+
+		dp_tx: dp-tx@1c600000 {
+			compatible = "mediatek,mt8188-dp-tx";
+			reg = <0 0x1c600000 0 0x8000>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_DP_TX>;
+			max-linkrate-mhz = <5400>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.47.0.rc1.288.g06298d1525-goog


