Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08315C48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5K+LPUTpDWl7CTSQ7wwWQlCqZnBOjCKam3sPzq3LFCk=; b=hSriplBmqZLz4QrlRmr2algOvm
	JfjRJZl+LyGRdRat0QNQDgGJ4W0E8PEI4ptzQCsJ2Or7OcbXZm1bwEXw6vSwuAOJCnax2hVcLCjOx
	50z1w96oHMySdwRx050UNzCDgBa0b9hZiMx2r72RCe+KDxlbOy2aeHihtOB0JG788vQ1Bf2lv8IFb
	38yd4AQp1N3TK4a+Ar3aRdILRKcDI39LXLTByOU7fGD3QUYXkw8kywAlQMPgbdDO1LNYvIkiRxjdr
	NlY0t+6veejbkgKOXD7bPCyaAkFFCzmjfxk5cBrX+adNaPQYcpErCtaGbkuE3evRUwnWVcsdYVcZP
	Rrpc3eTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9e-0000000HVt0-2lYN;
	Wed, 21 Feb 2024 07:36:34 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9G-0000000HVd5-3mBK;
	Wed, 21 Feb 2024 07:36:12 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d2305589a2so3456351fa.1;
        Tue, 20 Feb 2024 23:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708500969; x=1709105769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K+LPUTpDWl7CTSQ7wwWQlCqZnBOjCKam3sPzq3LFCk=;
        b=lOZbmmRYfjSpkTCqBp6qP7Hep4ocFWYGQF6Xgy17Qym/fcHUR8U8N1frXm/4Vnns3H
         tSoyNIGbFOYytPrQ+6ZAZIj/D8ka+4N/k/W+dVvJeqtV1+i9Y1LARWzqZzheGF0UvwZs
         Irf1+8UoMoHDyyPQNK4njV5TQPT+58h44pMUNaOWovDmoJhIEOJpkPeZsvLw8EFGmwRy
         fKYQFtj3fsMDavBJhu8sfuWqc6xuNALE7BLRwjcMyEtS8y8mFPXLXOyuLw1gex+mcyQR
         maKLRXWDS48t2p9dfNkKkd3ObZ7aXR6pAyEgNg6jsoeF0f2twhO3z92ETye5mYuJkzbm
         Z8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500969; x=1709105769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K+LPUTpDWl7CTSQ7wwWQlCqZnBOjCKam3sPzq3LFCk=;
        b=a6xFS+5uk8WPEfCoxOfu0CzDARyTbGDQpGRcntf4vdrsOzK1XlyQ0LJP2yU5wqbpGI
         x8GqTgBQp7VmdbClGqeeV35L6P5LYJ5lGPxANcDoqHWXvXnavRfLbjd7Y2hMHFYjJ2xX
         Mn6H/qFfusdZz7XMvccOtU0PNRlZy2zAeODIWnkzp4UI4pkRNe8EC03gscLAnb+fewoJ
         GHv8eQWZmYV0EvSaJJCf6HrfwcSvdeg2soTNAhUNm1L5CAB6utnSqPgfL/SxzccupRYv
         fb3ljmGVMb5dRcwvFflXD3xoaQLEXreZ+z6vPwZTu5o2NO14NdUkqUUVArCgFt44EoIN
         qD8A==
X-Forwarded-Encrypted: i=1; AJvYcCUzp4zoxFLF0h6uC8+KwW4wU9Jt4EAASEyvC0uPxMc3P7KBoLaBHl11hdecyOpzS57XB5DFfRamS8gbefKXeyDnmBRDKj5wHvPaW+Gi1Yhn+ZSxZeoXTfe3PO4EUFc5V1+2988dm4/eSUM3Ul6gdeoPhBhR6V9G+Rk=
X-Gm-Message-State: AOJu0YyOEL90LEAR8D3Jawg5u0ZfuQy+f42moUHBobqGVMFpTDG457rf
	n5rL8XGslJG95b+tQFeB8KaVqnKpTuIjl1a1p5N0pWjGO1yYXqQ0
X-Google-Smtp-Source: AGHT+IFCRIUB71wvbXRhTRzpy+rQD1aWwOBIh3hXm5/xx0yOSjW8vja0s/q45MUSdS0SGtkyDZ9S2A==
X-Received: by 2002:a2e:854d:0:b0:2d2:3a2d:d2fa with SMTP id u13-20020a2e854d000000b002d23a2dd2famr4765275ljj.28.1708500968737;
        Tue, 20 Feb 2024 23:36:08 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z3-20020a2e7e03000000b002d0f99a7fc4sm1722330ljc.79.2024.02.20.23.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:36:08 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt7981: add pinctrl
Date: Wed, 21 Feb 2024 08:35:23 +0100
Message-Id: <20240221073524.20947-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240221073524.20947-1-zajec5@gmail.com>
References: <20240221073524.20947-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_233611_030728_006A9951 
X-CRM114-Status: GOOD (  12.16  )
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

MT7981 contains on-SoC PIN controller that is also a GPIO provider.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4feff3d1c5f4..fdd5c22cfc9c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -86,6 +86,43 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
+		pio: pinctrl@11d00000 {
+			compatible = "mediatek,mt7981-pinctrl";
+			reg = <0 0x11d00000 0 0x1000>,
+			      <0 0x11c00000 0 0x1000>,
+			      <0 0x11c10000 0 0x1000>,
+			      <0 0x11d20000 0 0x1000>,
+			      <0 0x11e00000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x11f10000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_rt", "iocfg_rm", "iocfg_rb", "iocfg_lb",
+				    "iocfg_bl", "iocfg_tm", "iocfg_tl", "eint";
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			gpio-ranges = <&pio 0 0 56>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+
+			mdio-pins {
+				mux {
+					function = "eth";
+					groups = "smi_mdc_mdio";
+				};
+			};
+
+			spi0-pins {
+				mux {
+					function = "spi";
+					groups = "spi0", "spi0_wp_hold";
+				};
+			};
+
+		};
+
 		clock-controller@15000000 {
 			compatible = "mediatek,mt7981-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.35.3


