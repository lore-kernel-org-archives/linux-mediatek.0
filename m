Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7CDC54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=; b=SxS298/o2I+AE19pwfwGT8mX/Y
	3433ndTvxjsCNMVqaOB5FWfxfHRLViq9rjYk44CtBq36wTbjmnA+ey8xkQtFl3AvFOUNowX0eJ8l4
	iYh286yLCZzZYqnwFJ3J2fJMgu5+vzSB9KV6GSaOKhgufNyyasas8j8xhbQjYxUinG6np4Rjwqe9a
	t08cTyUpjs2XB5lHkci5YHXDpPGk8o2890nO35ly3+jvx6Xcslu9EId0HtgVuWILF429ikELKilW7
	yOL+bzElIGzCsKBrGqRvCcIFefhNjmpP8eAHMCErxr5zWrhx4gzh6jmxDLdSm5FubD8M+Z1aEThVf
	TAXjT/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebbl-00000001032-3zzZ;
	Mon, 26 Feb 2024 14:05:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebZ5-00000000yp6-2k3h
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=; b=D+mj1yH5A3DvXfDk9uPmlFX3dm
	YSI3FgnZnRPcKhzPk/XRyfmigzL5sRHdCQX0SToeec5DlW1mYDY89AaljarIdK9e9FU+D/A4zWeri
	7xQ0uz3NEisj3jBt1cL4b3Tu5Mki9ObA///6iud+awIaFzWqnZuHHGimv6XFJXKFNPPu0gIuVjdNY
	lI9ytftUvnMVfodlDflzLho1keWfqYz+Wo8q6Rd3EYfTFnpnSceP0WvtciLF9QcJCGPG2p5Ex3QeM
	QRwFKnfGWaLa8luk5/lrcFXoAZ1iF4Ci1yZ+TtPIz2yCmmAmZvb1yQoI0ByO8OYNU5Ueu6+ZJEB1v
	v9XfNY3g==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYt-0000000HKKe-2GWW
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:42 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d23d301452so43785961fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956149; x=1709560949; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=;
        b=csXE+ailcMgPa5IkNqxu/wLREzwl4Y1OU1nJGURdxXO4rtEemufA0VOHcUtM7TFaI9
         YhfWVashLewmnSQN8w27ERy+bRvzhEBnKzeTFzwtXx/rBXtX243WQTDKNVEMWkUpZS4M
         mPB0YdmT4upvkBm7pjKdxOcLfp3x5NSL4uzXDd5VvhjgG1r7yAOns7oAekZ6r6rtZbW1
         v9z1xqcmHOEoAZM3g/V6jzWfajMeijtEqJRYspIsNlmgz+KruwoCiKrQveJcFhJjmcJt
         nnBzVGgYaAPdPKNhtiYDEMbVQGSTX2Wrb8p2lva07AWSJiyGK9Kg0Nj7HaHfeQ0FeopK
         tDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956149; x=1709560949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=;
        b=Hj00lcfrCHRx7QEFWXzfrE25i+GP5sVtGlVdjfof7uNrdCh0zCno+19RAwbJlsTsy2
         vMD+wFdw/jyTj0Ejhhr4KzDMnByG/VGoRhl9Xi8eD4GB4AExO9B4PhIqLR4Ghf+ELLw4
         EyEv47HYWkqmQBIY550W3fzrsQ1TPi7kZQ0AkDL/RlZb18DIKUdb4VcyV9hilQI1To2L
         p+RzdJiTZRieIYu41Yt8bHyCN6owDf6Ps0adl2wp6w/OfzqNfqiYKS8zuqO7F6KT2507
         qqai7Qlc3OeWlu7uvslL+rKrvnczSY/uPvAttBbmRAMWXheaKYqivp8fqMV9Ooq5W+S+
         N5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU8oZR3x576dgSOizfsDmGAol41Fye5JE9vego20U6gmpAgMLUlmlHyfZj6QS5LeQEdjToc4LFDLdoihaMT7YTPoloyOjOmXXc70uqHsKhI7Ioz
X-Gm-Message-State: AOJu0YxIB03+NgrSV6+E7rsUsq8JcbZD4HX3lM2OxE7NnYp+Yf76CzE5
	4IRs+aFVAsx+bn/DZ6o5+hgyf/IM1s3u6WPQMPwZQhH2r8JWGTHGDfFjqZCVQYs=
X-Google-Smtp-Source: AGHT+IF3qwR9Gc+h1O6WyIDdP7kIsfb8il8xKzj6tOQtu9QhZUg+J5sdQ8PPlj87e4Oz8wu+C95RXg==
X-Received: by 2002:a2e:9247:0:b0:2d2:9185:2017 with SMTP id v7-20020a2e9247000000b002d291852017mr550055ljg.17.1708956149131;
        Mon, 26 Feb 2024 06:02:29 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:28 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:54 +0100
Subject: [PATCH 16/18] arm64: dts: mediatek: add mt6357 audio codec support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-16-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=wXzcoZ01ca5dM7JiP+jpbdH0FdMDFiDQ13DjfVwqVVs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndPcSE5JSY3z1YtT9jmziw95lzTv7FpKPgFmzb
 WqBD0pyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURQ4gD/
 45DtjX8QtQ9BlpoeQoUHYlLB65IVbXtkjFBMq1f3miUNgR/FSQpZ71R4jQLQ9TUUy/X6lsq1+5i0+m
 xbD5HeTgN/G7posNpd1nPboTHB/+/7edI6JQwqTfaOOh1ihqQUOk0e+FSQHEb00SBIubf/1gPzKWJ8
 pGBTnVMV55xcvqL0QuVarAxPho9t9JKKGENCNytIoPk+Ufd21qFJ4H/w6sbta/F5XQyrj2UmQcPUhH
 wyP/DFzz0c8/f0Xx/BLOpuO+/9HjIpv2bxvLLEfgaXD6ap8ZqhuAUP1VgXHWdoPY/k/WE/zutLBILv
 k0R59zI+yJZA9JTJuHF2RJ33LtLQn6YaiKoHjD7PCO0PvdrvnRRzBB+udbHUAj9sIPLjb1JovChRhM
 SFGQIhRV76UfeL7wiVwUdh/jgsW57n78DhFBsc4ckarEvb6C9u5fgiHCCxc+Hg2q3XxZTvRKy9M4ox
 3VMUdtp8ownC1VrR/sQxlHByUgvK8TzwKMwQ0SKRBqhduIs4nF23/tVX7Jo/tRge/28AhdBSHFOe1p
 ALtfws/Gzp0JaH1zGHdJGLwb2JvAf5ugK56diBaEvIMfQsWGFazGdJBtfzKNT6D3UhbTeofnTuSn62
 3boyWxQP16ra4yZJ6OJxzL65SIXw1oLRwvNl57L7wmG/3u/EIp3AdGKmD+iQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140231_651014_FF2F394E 
X-CRM114-Status: GOOD (  11.14  )
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

Add audio codec support of MT6357 PMIC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..64b693049930 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (c) 2020 MediaTek Inc.
- * Copyright (c) 2023 BayLibre Inc.
+ * Copyright (c) 2024 BayLibre Inc.
  */
 
 #include <dt-bindings/input/input.h>
@@ -10,6 +10,10 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		codec {
+			compatible = "mediatek,mt6357-sound";
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";

-- 
2.25.1


