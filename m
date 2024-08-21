Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67890C52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=; b=jGT02XPAsZVamJoPeq3mJDAcNq
	9sTz7pi0wdUZCqWnGaY7wlV+Tzha5WTBwDV6Tmp4qQuUSWJkWDXCZmUYvqJ3sppZpKwPAPdFxM+Kf
	1Xp8cuNtKEDCtox5kycpICkDKwrkb5pjSGiYL+EJS3ZGc5BkP+5dsGNeyWOfXH/0BpD3khMEuFw+B
	ZnY6T7giINT1BEvtZXCTUCVcjQ/6Ki6FimhCpMDkXms1Im742cqtxQcrQHMl/PYJgceKYYXTovZgu
	XzmUAF6NYUbPaFh5QJp18wBKh3JadnoAO0IFF/qQ8duco0dwqLgtaN/MpPiqf4CBRhpApNDi1TuFz
	Myc1J+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghfF-00000008FTN-02nf;
	Wed, 21 Aug 2024 09:30:01 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghco-00000008EmO-1zqk
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Aug 2024 09:27:32 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3792900a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724232449; x=1724837249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
        b=oFArLeXQBazHamLczBcKjpGXzPvjEsXzfb0LXP0VsMpaPChFLcbaBg1suwPFRPvMhr
         qb+WIOKztwmm+E1DvqKvY2sHlQ/719OpW+otXgddvJ8NEOjVHrrurVdKaJ6POXsBxYhD
         N/f2r6B9rAWeb80MU3DvCLrIwyoItVZTWnNZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232449; x=1724837249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
        b=OrfA8ZTYwVVV94JNf9tjAYrO3bEnrZUF/+7FKcOy6Jd7oMPWJv9jZuwDkofEgyeFjk
         IDIsgnA+2PFLpLuD5FO27fmxrtIh5d0CWGFngcioEHoaWWS6IrYE8LPd0iE8+paNxvDN
         4oNyMm20/Xh7MGGv1O8dxcBvGSZBSAaHytu2ebGQh4A/FvX20sefRSNnwsL4nYKafRMU
         usbkVMWcWiBcG+o7jvVka4qL+GP9Sc/e6Fy0kQ3wU+PQXO3I2YyiKPfP5DPED/PIDp2z
         fd9kNMoFFNWIJRSJ6znxDJR6Rl8DxlLeLSkKuEi+rMaWZXN6EzUx50Qtqpyu35An3twm
         SlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSx0C+oJRZjQdjsDBpndV20UTgWHFnNBjEqAsZc4sfcwY+22JpzwkcmIw+TL1Dahdh2cAKC6r07ELLxXDXDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgQAqFXYavVO5PgOTag6wwBnqgjbu+JifQOuU44FhNBDn6KHD
	0Uow6qcpv23QHxOc6HvZKoHlATb7DEQ2Nsno8Zybrzk2vu8P6SPTzM7mWxK4TQ==
X-Google-Smtp-Source: AGHT+IFnfIrNiUomfEp1ttryB9uQgWfxL55rhoeddUhSzpcz4uk60NiwIgmgyqLVCB/iQ59t6moGxQ==
X-Received: by 2002:a05:6a20:4392:b0:1c4:b302:ad14 with SMTP id adf61e73a8af0-1cad8160aa4mr2007740637.24.1724232449282;
        Wed, 21 Aug 2024 02:27:29 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-201f0300844sm89985195ad.47.2024.08.21.02.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:27:29 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8186: Add svs node
Date: Wed, 21 Aug 2024 09:26:59 +0000
Message-ID: <20240821092659.1226250-4-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240821092659.1226250-1-rohiagar@chromium.org>
References: <20240821092659.1226250-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_022730_623222_C57CDD42 
X-CRM114-Status: UNSURE (   8.96  )
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

Add clock/irq/efuse setting in svs nodes for mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index e27c69ec8bdd..a51f3d8ce745 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1361,6 +1361,18 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		svs: svs@1100b000 {
+			compatible = "mediatek,mt8186-svs";
+			reg = <0 0x1100b000 0 0x400>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>, <&lvts_e_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg_ao MT8186_INFRA_PTP_CTRL_RST>;
+			reset-names = "svs_rst";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1676,6 +1688,14 @@ efuse: efuse@11cb0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			lvts_e_data1: data@1cc {
+				reg = <0x1cc 0x14>;
+			};
+
+			svs_calibration: calib@550 {
+				reg = <0x550 0x50>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
-- 
2.46.0.295.g3b9ea8a38a-goog


