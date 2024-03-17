Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1426C54E6A
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GavwCOAQVbhDQ+vdRdLwuJP4i+t3za5/lzx/uEHUH9I=; b=WckwR3hCPPufKn7Ljwb81q2e+w
	AgRqOSY9cIhAlfdxanPo5+WYXAr4Ik0O3mKUJdxYWY+o05YGn1UMYHXDIj5aywOCQxH5gFQdJx9f/
	0psyOoE9QDXB81jOgkG16j42vAEqD6/CdaEPfADbMcXVEM3nfGlQeZjhyywH+y87jgEbGuBtplrw9
	AOD9quwa/MbqBGYCTOhM4A1DTNMNMtk675AfFlitIdWSLk/qd7RQvxgXYSEaNoAVKKSIBXPXOdYN9
	r62nEUr2lCfskaa8Y1Jrw65cZrTWvWcY2DFVLOCuA0KZ8M8KzaDMO1X4SBRAHvjbqJo1/uDD5Fu3h
	tUju0pFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3Z-00000006ehJ-0SXX;
	Sun, 17 Mar 2024 22:32:41 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3F-00000006eTd-2L37;
	Sun, 17 Mar 2024 22:32:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-513e134f73aso978827e87.2;
        Sun, 17 Mar 2024 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710714740; x=1711319540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GavwCOAQVbhDQ+vdRdLwuJP4i+t3za5/lzx/uEHUH9I=;
        b=CpM4//yGm13t6v3HRl/OxIhHct5Sto8K0/rnmjEmrCNQd9qygog1Vd0QVoIa4QRrgp
         vaL/om5qwL3MuIs4lnRYGgCP1hdTpMtszAbzoufbbh9ku3p3GD9guxNq7NMT8RA3aCf6
         0gPFZp/O9auykV2+Y8e+Pi8MI1ImpcdONWCAQ3TghxapquDk/5roRAK6ICJhga+BsGCo
         JF/i6W14Woy2sXti631XkYcKj4yEJl1XlPavXxgburWOfAqffH6TW930lYiAkSKTTW1+
         VY+n937lhI3fsfnGT0auyozMWhsTJDntuywNeSvMuNMjTDt9fextXDhg+DTIlDDIQb8Y
         kJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710714740; x=1711319540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GavwCOAQVbhDQ+vdRdLwuJP4i+t3za5/lzx/uEHUH9I=;
        b=fu6dIcn5nW7eVZkIs4ULLYe2j+vGEZDaL/G7fjK83/Mq4uQyX79sBUTC00J7KAoJcU
         oq/r7Y40UCRSPTe9pHYnjqa3qU0ZdehpUGWLQHJEdWeCsPvPxkhb75rxAi2eY75gx13u
         xyPNtdMjn9pN7bl1046YcThZy7lG+5q3NFY4LSxEMQR9AwN2EF2XU9SxjYeHgW/8XU+1
         uYiOLj8pVyROlCXG9xZQRgIVv7OMmBePxXvkKT0QtstKF3C6YOj/xmci4JaWJEoarnbT
         1YEwtsgRTvD4bEg4M4LHEPm5K+MJ85O6b4AQBiBYKPpgSZY/4cUocaVA3ocK2QSAAh8A
         j9LA==
X-Forwarded-Encrypted: i=1; AJvYcCWdGoSdA5pw8liGJMHe5O1WnadxFzfsLnS54MmsEOj0OSOgxhXlSZqCjVZ/sBk8I86G1IT6f6zK4E16tjNoZJE63RTlgfs+v1AdbpNE+a7gLiWTNsMHBo3mWok+2UjxuWq4eW0a2YpqoaUCKgugXlC7KaJff6FVLko=
X-Gm-Message-State: AOJu0Yze++1GxDkNDakRFVqCXdYkJoXSafnJ3l0y/ZngAar+O+AQ/i9D
	wuhFA4rFCTfyumR8bCHjA1sfNg24QH3RUJthkNbd+YqC9HgnBoYC
X-Google-Smtp-Source: AGHT+IH2QUUdKpCb2MBt9QJkoYk74bgy89kZwcAUoxzCuORsr4QlNkeeYPDyLt6hR7T3gwPPeGpP8A==
X-Received: by 2002:ac2:48b5:0:b0:513:5971:10c9 with SMTP id u21-20020ac248b5000000b00513597110c9mr6728299lfg.56.1710714739667;
        Sun, 17 Mar 2024 15:32:19 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x5-20020ac259c5000000b0051322c11100sm1366981lfn.221.2024.03.17.15.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:32:19 -0700 (PDT)
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
Subject: [PATCH V3 3/4] arm64: dts: mediatek: mt7981: add pinctrl
Date: Sun, 17 Mar 2024 23:32:05 +0100
Message-Id: <20240317223206.22033-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317223206.22033-1-zajec5@gmail.com>
References: <20240317223206.22033-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_153221_627669_0FD89FB6 
X-CRM114-Status: GOOD (  10.44  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
V2: Drop board specific code

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index a187a34d12ee..5674ac81d1f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,6 +94,28 @@ pwm@10048000 {
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
+		};
+
 		clock-controller@15000000 {
 			compatible = "mediatek,mt7981-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.35.3


