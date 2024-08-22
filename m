Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53220C531DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 06:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=; b=ro0BZfJsjP7grXFCQkaq2FKVK3
	ld0037/KqtyED9KQYvlmSL8L3eu5WpcQmgSYf2eywiW95qpcmMjLzsXMEwr9TGL6vSbT4EJjtXlY1
	n1QHAe1OIB/7TpqB6xPif91ZH2unwZdP1ALn6OXyCpuuAGCOyw8T6JwxCtq4INZ+i+LPNEeCHaqg1
	u4MHRNo3eNGAgKjB1SjltVO3GsjPir5jQJV9ijs2k2YdD5V+cWDCovpiS/GP4MLjqPx9trNmxl+yO
	GhZoVyRG53ddYeLhLpEAdIx9RNFmDpxahSMfs1vgSrTOLVxxqqusF66YaXbY8xMdyG9q9JlAKF+ES
	VFMzMTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1dF-0000000BgpN-09iD;
	Thu, 22 Aug 2024 06:49:17 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1bH-0000000Bg9i-48TU
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 06:47:17 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2702ed1056bso292725fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 23:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724309234; x=1724914034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
        b=BXh8HRR3rhVlFdWewD9qK5vwjmab4rA5xuKhNvLHERsXTH9sSbYfpRjt2NEEWiH5Sy
         2P3uR32LkrAdvulehWOZLQKu7rfnTCuazPmSN0ezQkcI+YAjY0yGiUEA+gF1JOarhLBR
         CiGIF/CjfDT1M2Db4yOdtUJIgrRcbDtDXy140=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724309234; x=1724914034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
        b=TBncZH13O/ibkQH8VGa5UgHv+BvnEikuweJXCCSzU7Z4ldTvSRAqSWYdS6onfCew4i
         ayrvChqNwDfDTLOzaTHk6m75yp3hchl8tKAPuWNOd+WyVk5gakim0F/lYZBzhn24ImkZ
         m5ukcTJaJJSY1mV2xGuYdjk9zI8yOqV2yrseRt4GgzuDOh8IKJeThMuBz8JGii1dyDvh
         C56LzezWP8SJ6Qzb483ELz6G2zNi/vG+HPZRPyEweHwERbf/6YH1BIbxceZ0crBNAvjI
         m/whCLP7ni1MsE3/4unbAWsDoFMiIZkgrUR7Orp/Nd0mAzVBlvpgLPduEZXYV3ELKzaC
         zXxw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Du3CuARKQ8ChZRyNJMW+bxZxYmzDBlLkU0Va7AajUNk7O3Nyzf2Q3MfrAy7uFC5EZ+SaJ3jdYVcnw3uWCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhGDVfaLfZuuXQSnNCkXCdycLfdn87BUuYZJGGzLpYjtuwebIy
	15OeF4+HDsH+ERHgzSRMOxgX+/ozyNPlqs9HAHBdRZxO3Gg2Rz6xJc6rDKA98w==
X-Google-Smtp-Source: AGHT+IGrUfTOkboBsPUwPI3QFIqP0YcLyJ19ev6z6avzO4hsPA9b8UhcQhr91d3x2cfdkibvPWSpUA==
X-Received: by 2002:a05:6871:1cb:b0:25b:6d53:d294 with SMTP id 586e51a60fabf-2737ef7d20bmr5327067fac.23.1724309234476;
        Wed, 21 Aug 2024 23:47:14 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7143424a530sm698129b3a.51.2024.08.21.23.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 23:47:14 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: mediatek: mt8186: Add svs node
Date: Thu, 22 Aug 2024 06:46:50 +0000
Message-ID: <20240822064650.1473930-4-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240822064650.1473930-1-rohiagar@chromium.org>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_234716_050559_825E31FC 
X-CRM114-Status: UNSURE (   9.11  )
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


