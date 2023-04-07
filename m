Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C738C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=; b=VVPcCihjXdz1DgujjyNQIxFhew
	tyzBjxi13U5oYJc8+GhPU9VFQvgn3OQ6Xeo8Le3YPPhamaRwqHrYc99iXMPqINJRwAxbN39OWAQPI
	g/PLe/AHsZT4jKYfQb1RSLNb35Av1dvu82f4YWyi1BBzvI8STLUXWyVKJ7tcC5CNOppHHmeETgam6
	sSQ4Q8cYpyQ8wm9Deitn1GgB6WFpuUoq/n8ouojmvV7D1i0M08p4mb1kdXV9HcNTVCOkThdmQUd6V
	lKAxnPEamhpQ2GfHP8DZK6o6SoOYUx25yvelSwpqritxcfg1UNbkBUJ9UiNtwFz9MQRNhS2f49YeQ
	OiRe82Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmgU-00ARZY-0u;
	Fri, 07 Apr 2023 14:03:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklh4-00AENM-2N
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id r29so42224613wra.13
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872394; x=1683464394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=;
        b=Wx5r6rwoZXIrXBsodMUM0oII/5nipadhyGy6LHtFD+bB5yZjumtsv4QneVp0SBZlYK
         EP2Ng+ZOMLwIwTZ8ljMgdOKNDwLICtVoOp6+QWwgzXJdTky87OjW8pYOgmN3EqwoTdjq
         bniT5A+2hwsiahPETKGJQxe1dhH3cYn2EUawUyPFQFutmCa9wMYmImPuZtRdLQf6Yx7f
         ekqIrj60MXo1MSas3WS7rtqGPnhN9Lu0+uSSXpIgBDX5LyzVM/fg047O5ADZ+hHKFChf
         uxU3kC4CaX0D2nJqFP1qRtxoLePe/++yhC9McgUyAymTga45UysulDKvRS+WPy2Jk841
         G92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872394; x=1683464394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=;
        b=PTkY7QrGF02I+FmkghtkCleR10dwUB/JNPImsOELYuHXLCDBqTqZyV6xTKu3ISATor
         GpuIFRSUdDHZxvv8HmamkEqYLXbEvv9KXL3uBpTc0GeZR4fAKqKt7H8DIdHoXmQWXga3
         HNq8WUEAwVfMhZFLosAI2JyQglZfXzmfoopioM6HJvz5RJWteOCZonG6+9RVjgDVZSTf
         yoWnFqby8/HOLYth6qSyOv0b0yzUoCMsNxWYzVu895afz0n9Wz2bWXuMsdLdXdV4/DFB
         97TCmpgSRv/k4JiFrLIeTt7J2QoTFjg7kDwz56Bf50wRNVzxF4GJ4bOWvwbyCHXFCH2d
         FEUQ==
X-Gm-Message-State: AAQBX9cXECwK+eTwTfLyZcaiDeEDJUyspmAooQEN8DFJmuKPpr/wa2+w
	/5ayyP33YaFQjspgIdcigqNeCw==
X-Google-Smtp-Source: AKy350aU5oyIMQNJHKB2Q7i2iktd547uIw2cnWKNsd/AChoC9Z5ZjLNanzFJpOzwSjJwcwg8elCIFg==
X-Received: by 2002:a5d:440f:0:b0:2ce:aa73:4960 with SMTP id z15-20020a5d440f000000b002ceaa734960mr1151038wrq.5.1680872394222;
        Fri, 07 Apr 2023 05:59:54 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:30 +0200
Subject: [PATCH v5 11/12] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-11-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=thd5AdegnYYpCr5cvUhR9vmXYqLF1bam1m97/2vSMvw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO7mlVygoKoHzDLc4skrgvWXMffmUB2OTqvE1Pi
 c3wcQU6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATuwAKCRArRkmdfjHURW/wD/
 919ZvcBWotpNTzA2QakuXWR8YpgHzJv5llnmMuVSbhBbh98pYJEpyrCdApt/o0bQ/uIRm5pkF60WSm
 8ZJ7SXU6o2qiBf/gmARfVUhXHMQilV8rCLWY/i533DB7NAGSR3641+5YUwcKW28WuhiNpH6p+0NC3K
 7trOW4KYf5i1PGss8QxCNWPHZzBO38y+QlmHQEo+UnmuBlA8ZPsnPMg2huqM9o80mrsYrhuY4+3UMH
 vWeInJFh9FitTBqjrE3dhuqu8ARfdpC/xlg6FlwOPVmNAEww1g5xth+44gh92VO7ppRL7+86ZEb4cM
 H9HVVm/UUXOmjuM4Qt8hBBQJ0tjz6sWSsQ4op9PaUCGgyosrZuh7DC4HtDMXyXgUmplQ95udNEXpdY
 f16gCioiIcveLbisi7y1ZLbtEhOO07DN5Ky1u5o5/7eYNLjMwjfK7gr4j90jEesvhW2QKpBdqIb1p+
 fNT4MKHSFAAUPFSoIXludMBQJC2y8K81qgGeHQo1I9RvFAF3m72PsA0S3Qu3MLYahHunihh1AQx6yQ
 taahWZkbNOu/mDMJeI29FKFhLlmLh/AG93+/XSdjOS8/Z8OM+GExcPp4bQdR0k0vUYYE6vpaYMi95M
 NqmK5xInj549swvCtQciPhpvZw+qTpSgs60jzuGbzUnlKAFBswFG4IY+PY7g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055954_820115_31938E35 
X-CRM114-Status: UNSURE (   9.39  )
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

In order to have cpufreq support, this patch adds proc-supply and
sram-supply for each CPU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 431078f8670e..d723838ed49b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,26 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&cpu0 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
 &ethernet {
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";

-- 
2.25.1


