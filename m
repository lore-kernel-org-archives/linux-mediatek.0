Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B6AC27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENjQGXVG6zrSf3b2hbLXRZe8ZGThnN5eIJS2xnyzsB0=; b=YjEXJhF6cmX0Zk063832G77cLA
	UFSd4UFiTpBq5Sb/36tglYPMkp7pozOwrcY5vEz+6BZ5wfDadg42/AaRx9m+1veGD10rg4y4++CSt
	avvA2VIZSe1a8VYCnVg6ii4aE3+muejZ9Vhl89jsQbAcNgBTM8OPvEBTVpvubAjLESpGz82R9S/9o
	s+k6P1UERSzQfr1IdC1DqoFpxsR0PBWucXpZuNgSpYfr9WeeqJ5wPe0WNtmhHMhAZqWp+JOhysuKv
	GDaA2ZmYgesgFJsbLB/kXLemojOmYeqF3DTcSIzjQpWQGQW5a9aUwUBYp4dYG0YnogcQohrjXuU3a
	ygxcVM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBTw-0000000AeEQ-1pXy;
	Mon, 17 Jun 2024 12:29:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBTq-0000000AeAa-3Z0g;
	Mon, 17 Jun 2024 12:29:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f6559668e1so35122815ad.3;
        Mon, 17 Jun 2024 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718627341; x=1719232141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENjQGXVG6zrSf3b2hbLXRZe8ZGThnN5eIJS2xnyzsB0=;
        b=GelbVw/KHeQyQ2msE9GXed1fpq7OVCFu8u125/wAjPgrP1GpU/a496E5YcdcuLuOxA
         1/q5vhzLbVsQTS0O6ni6IzTaXRiQr3gCfrofqugxCwgUlM56IxNVJ4gVmklWgbT1mTDp
         5YImJMrZBLIYEhBKOhtq5/4gFNtB0nDyYRbrDwgIXKDk16g8Nfi1CzhGFn62YMp0w1XZ
         LUiz7iZZPWGgJNC/KvYP9ugrpCvoBj1b7pUEgaOysOn4ZICP1R2fNTNvYz2sxqGbSakr
         pG1Rk0cAdlKXEOYwEqgFtWHSk3+B0JSlYCVdAvApRXiBpF2UIunSneZ7vL4ylmndC8Kk
         TW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718627341; x=1719232141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENjQGXVG6zrSf3b2hbLXRZe8ZGThnN5eIJS2xnyzsB0=;
        b=ITYi4GsEsk/EkPDnNA02XtBquBNfJDLtcsV7WEwWaL7/k/8vLiuBD8ZyB2ZPAabl5O
         HBjY6vcu3C7pvtyllrIhFHfOKjCpfzYvdta78pnuy3wySSNh8d7qX4N09agEEwgPKfo6
         lxykk/0msATkV8RxTrMy208rC2+dXvInHDiDDYu0kn/xzdk6WqDvcc28CLsoGbDHmSuv
         HJhCYTP9cDlEQeVelemhub050yKttmq2OpMTZd/4f0PvCvZLwwyHC36rtkjdc0ML4kyu
         sBIno1yO/4eLNuy+rvCC7q78i8fwU66jk4Ol/FF+zX8ApnsUBNfp5g2quz1O73B6rRZ4
         V65A==
X-Forwarded-Encrypted: i=1; AJvYcCXELHBRjpQL6b7f2Xk3EZfI0Vzco5Ux4oUhVf5pz1B4OfuoJyht7o9kMM5LNZx1H+xt6YpPbFX7C8OycX++a0FGTp0yt3kzN0RWqhIvyPzsYdGIorYE8WIcXVvtDsGDe2S27owdORaX4S2n6OIuWj0qYD3UZerfTk8=
X-Gm-Message-State: AOJu0Ywerj7F3t+8qrSSWqFyfzJ6GTpm72QvdJOjytp+7uLAaYseOmzm
	umut1AsIMffieDuzYBxjyXiza3PAQfUxF4LclrpYx40WwY8UpJcF
X-Google-Smtp-Source: AGHT+IEWH8YEfcqZ8aCC3vP7Rg2A553aHXTV4DlDBjWWBoYM1LboDHCiNYBz/dVm4EElj9SYzXAh3g==
X-Received: by 2002:a17:902:da8c:b0:1f6:f521:ff88 with SMTP id d9443c01a7336-1f8626d28aemr106670315ad.23.1718627341562;
        Mon, 17 Jun 2024 05:29:01 -0700 (PDT)
Received: from localhost ([103.139.191.219])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1f855f5e21bsm76214255ad.307.2024.06.17.05.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:29:01 -0700 (PDT)
From: Kartik Agarwala <agarwala.kartik@gmail.com>
Date: Mon, 17 Jun 2024 17:58:25 +0530
Subject: [PATCH v2 2/3] arm64: dts: mediatek: Add missing Avdd-supply
 property for mt6358codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-mt6358-v2-2-5d9f0e99941e@gmail.com>
References: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
In-Reply-To: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Kartik Agarwala <agarwala.kartik@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=agarwala.kartik@gmail.com; h=from:subject:message-id;
 bh=t6vDfDP0WnUDhtsCtioJQdhwXB9x1/6tdEwfQb8gr7w=;
 b=owEBbQKS/ZANAwAKAXiEk+OPlULqAcsmYgBmcCvz/vyTIuqPsDiI00NxTqHBkb/5udifcp2ZL
 wZL5ej26gKJAjMEAAEKAB0WIQSJkbnrkCGnamD0k/R4hJPjj5VC6gUCZnAr8wAKCRB4hJPjj5VC
 6gycD/9OEGDj6BiFMD4zkN23OdiwvprN+ma57OcLYu0JEd/8tqvWJE9S9c6imQOB5Cpl1q31bKi
 MYrtHTMQwDaJXW0toYFEERMcFWRUolnSjhpIMlSpek3CKY4slBJJxOUjHXqh882LMhJ1fXBCDP7
 XZSZz7Ffi/jR+7wp9zieGNBUVOygsEa39n61nS89tB3u02RE5IFS+amViuBdO3K7r2ApFcY2VQ2
 L9WqKs23VhYzomo+EsUwbJZUzy5kBZe0jAmhv6jE7OGkffLU1l4H0v/w1t6PsVGeQH/kKiQMU2C
 zl5iXQowjLBDzbwDEgIf7ACVxRggnB5ASROiSewlcAdWSdiRPenPafjAXfvjM9+j3NAAsy/I2ow
 cwGw6+wbM+7QSgl2jg6a4RIpL3A4dzLkGAAkoRyO4aBfpD32C++SQQMIlEPL+d+RqOCrIOf0tsN
 FnQh0gSbnxte3XlqjYhKiKIlNTp870JERD9mj2Sa/kOD3tuEVlQZl1LmWLPy2+tYrQI+5n+qTCb
 HAWccxWELQFFEaSIYTo4YJWyG789X3A7dhd3NTMBcy0dV2bCIPDHITbhvBgtLwi4oADgvU+EQwS
 dfaN0e9rt4WfCfYmKp5828VwBUf01h9HxeHrN1+ZTeyCsj1uOidhBrqpyXsdVnc/Pod/tXtPeKY
 V1+khP8cdR2wrSg==
X-Developer-Key: i=agarwala.kartik@gmail.com; a=openpgp;
 fpr=8991B9EB9021A76A60F493F4788493E38F9542EA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_052902_997458_1006489B 
X-CRM114-Status: UNSURE (   9.40  )
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

Avdd-supply property is a required property for the mt6358codec.
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts     | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 681deddff..241dc210d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -154,6 +154,10 @@ &mt6358_vsram_gpu_reg {
 	regulator-coupled-max-spread = <100000>;
 };
 
+&mt6358codec {
+	Avdd-supply = <&mt6358_vaud28_reg>;
+};
+
 &pio {
 	i2c_pins_0: i2c0 {
 		pins_i2c {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 333c516af..b3c988e3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -191,6 +191,10 @@ &mt6358_vsram_gpu_reg {
 	regulator-coupled-max-spread = <100000>;
 };
 
+&mt6358codec {
+	Avdd-supply = <&mt6358_vaud28_reg>;
+};
+
 &pio {
 	i2c_pins_0: i2c0 {
 		pins_i2c {

-- 
2.34.1


