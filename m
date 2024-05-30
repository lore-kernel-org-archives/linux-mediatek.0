Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A05C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3dPYP7w2xcwwD4ezxBwzChfzLxfVatZgNqWhWYFewg=; b=kcdN3vJEmbMRLe50285Nw54FiG
	rBWmbks/XhYDz9hhC4VAXJbd663TZVQof88tDldsBFFAPiDxpgN1Wkjk/PZEf7RCgJWlW7deyWC+x
	1JlaDS/wmjv1VZGCUSD7EeufLUhIBeVq4zi7ahRQY2mZJVfrVRjzCDMeWqfC9OaRQAcFW6B4APSA6
	TPcr5Z5JOwvhxz2Vccy9e4SwM2HEfmALrm4mJy5fSMf8f+blDvHs25qGlb9c8gKgK9fMgBZdk4o/z
	rTwrEGI3ArHBDZLJAJBuQodKDx0Q4pVJrr5E/egKEHHn5+w7Y6ACPisrhVVjzJ9urqizgiYahSUg3
	KFONQbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbH8-00000006eRG-2qXL;
	Thu, 30 May 2024 08:36:42 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbGA-00000006dtm-1JgD
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 08:35:47 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-6c0fdf42328so158709a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058141; x=1717662941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3dPYP7w2xcwwD4ezxBwzChfzLxfVatZgNqWhWYFewg=;
        b=ZRCK0BE2SunqARcBhuH7J/MAAP/rIb89KACjjupqYx19gPMfNf+4hjTOGZ5iBGTse7
         0UPDF8P+755AQLn8E1wdFz/fZ8U03zOd/aZr4geiq3pj+JR3fMF/f21cEZ1oUpzK8OrT
         4DQ2AETtCApEzKqoXL1+UxZcBS2QTkNJg3V2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058141; x=1717662941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3dPYP7w2xcwwD4ezxBwzChfzLxfVatZgNqWhWYFewg=;
        b=oZ8aNLmMZjeRNRumdeq/qboBFxqt6U5muTZeyrNhG1t06YHuY/jsIxQB9QPMcfr3ke
         xPUsqLkeUel6H22gdQqGSXF0A0vAHG5kieHB4hRfk3PL10PpFwD/xi9w9i5OQ7Pnt3NN
         e+EX4hUuCzFMGiNkdeyrPvoWoOGFFzt9eiXLmbrNaYkxYNyZ6aSYhDGQCKnR2eZJLLQq
         w75uPvvuWD5jh+Kvd+zJBa1KgNvliYQEtV1Q75fdnR+WMPswKv++gvSVEPiRRs9tnQn5
         w0A1uNHD8ZVJddxJ5fB7fZDb6Je+iYsb5Z3WCfZMl5yj7XHIrUXTGy3+B7UXgdYjnt+G
         RpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtwR4Zfgx6FfDOPq3dimmQv0GDAzIHCVyNNQCuDUmjmZu3MBV+b3b8nHs1T24WVo2Rs4/HWzycC2MhaWEV9qBLHUcnlZOi9KF28UhJcZJb5HW/
X-Gm-Message-State: AOJu0YxxvBeWaE53yNgCPvU6lHUgWl6+Ik623KHiYlmqExQSLtp7XYBe
	85MUHBrH2yO/dr/TNBl8CSWHQNGb25AZmKiI6KfYGrbcvDRed/+J3uPJIVNY8g==
X-Google-Smtp-Source: AGHT+IFl9n7DktKEcpEJ4WGQz7AcjFouxFiRzMPk6dDKBcDqPpXqbxbt5Utw0hXKMF4XUXofIeg46w==
X-Received: by 2002:a05:6a21:99a3:b0:1b1:ec17:e59c with SMTP id adf61e73a8af0-1b264618a95mr1679425637.61.1717058141165;
        Thu, 30 May 2024 01:35:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Thu, 30 May 2024 16:35:05 +0800
Message-ID: <20240530083513.4135052-7-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_013542_793316_EA2E881E 
X-CRM114-Status: GOOD (  10.89  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 136b28f80cc2..3d7b9cc20a16 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -993,6 +993,30 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,powervr-6xt";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&mfgtop>;
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.45.1.288.g0e0cd299f1-goog


