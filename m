Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4CAC761A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 18:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=; b=iC5xZIzZpM0KYA87VmheNTjAIl
	sy/D2ZiuyBUhgWNhqOrfCtpe+4l4O48jtg2aLJ0WiKbRezuDAxYb7NL+4votLcUIcktww2YfUbeki
	EOLniOjJwJWwm8lC1MoQGPiIHS8vkPjZGapzPc4bljJO7wn+0dhW6czFtmPl+6+HVUcVn2f1eIsCV
	JBltW+u+B7c9JdlqmkKnSDFYuxU95/SEkjXQj398rxeJLpgfvRxTk3BetuwmpGiC1PfpdDkiJHTAC
	l2X15J+/jZykm6xG+o7kKdWZGiuzvyrCL6GRqgygCP3HsWCUTKBM3+u0nyi2cVCXDge1e+jrN9bUb
	YB8dvglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJl6-008VBI-05;
	Fri, 31 Mar 2023 18:45:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJkg-008V17-3A
	for linux-mediatek@bombadil.infradead.org;
	Fri, 31 Mar 2023 18:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=; b=lz+lxtfAOdGOno0AQ9VHrqSgv/
	jp3TNcaNd/rxEj1weAKAtQDO2iIw4qxZ/ZcPH+d6i2UlXBKb9gFDAsuP9KixcOiJXGDBMtABgnypf
	lGUgS7V0AKZWR+xIvmx9xD0teq6RqaJTls3QuhmiBedY8DO8TmWnCxU+Hi8GbJKNNhe4WYBDs95of
	BT1mVk02Oj9H4OSVi3OhDzLfO148FilTjydHtNwhbfAiI70n9o4Chp28vPK2f04VNZPa6tfTSp/L0
	ACCdW5+I2FhGNMXF+Qta+siZUhMQcWzJwldZL6EwgwSd/9H+ZVooB71Y4iE4hZFEysCDk+eU+OqHB
	Q4cpcvvg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyk-007kGm-1L
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:56:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so14418383wms.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=;
        b=BKyf4eSl5Ij8A5Gk9OSRlQSn2pRoCFWyIYl/CqoGNZgbm3sTj4Tv8ezZYERUqYV4H1
         E1tGOiKM2FrLCEMFlUDF+++sbqxg6jwnfy7ioW0/ojVLifPGBvdW5KgQLCzYuiEwXwX0
         OSzdSY/7ZXbyoUv8KFlPcEk8X8pX01Hn/Gz1FFf/q4L47pZUJI3IJBPtkig8cOlDWBkU
         BWn6+tFIo+bwR8hfGYIpG6Y9zN3JHnAZp/CG24sYy++/NfHClaO+ydkH8IQ3vghuQfQ1
         7ssCO7pPDXB4WISTBpVwKX8tjFzYwOXsEcSRptT+0BQMh2wy36HPaEMmH1H44IUU+/xm
         H25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=;
        b=FMXZRrKuaoCTLW49r68jKm3tULHhGLoW59IKxQvROAzIyIwpqVCc1OARMol11yWcPs
         SQ59h8XddxcKTmLS9u7sJjsyphvL4skAxThYzVP6NOlIlD0GS9q/le2Ohf7OfPmaeh3s
         plgpRgThR4M5IPj9U21bhKH7v1OV6YUPvCJGrl3J9kGGhl07bKwtP819XSRERUnPkxzL
         FrPFIOn0yQs3Nu+9mhBgrwxDPh96aDLTb7c/g7JDwoVfppNRmvhEm1lZGeix33585Av0
         7rjW0rbt6ofObD9rr58EircmPdMIVpOvzjXPAQXWUIMpCv9VF1/k1/M13jpHVk3JGOgq
         voJw==
X-Gm-Message-State: AAQBX9dWMF4TcL2ZDRxdApT+PcJGDC5GNTTLZg4epE9kj0n98ytzxFG1
	4hxmVFyUEuEMCDr6x3EohyYXyQ==
X-Google-Smtp-Source: AKy350aDtT9OhmWwKzPH1TmxBtMFR1n4CYep02Ck+wMXTMA4wIXwTafKEFqAvJeirbWtYd2GUvRhJQ==
X-Received: by 2002:a7b:ce83:0:b0:3f0:4428:9445 with SMTP id q3-20020a7bce83000000b003f044289445mr2085101wmj.14.1680285344904;
        Fri, 31 Mar 2023 10:55:44 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:54 +0200
Subject: [PATCH v4 10/11] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-10-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6Ukn9Y4BN12qGraLtke2CiqXMYiKZyMbME2Gl/
 1edfSjuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURSc/D/
 wNDoxeQEaf93XmF9jGY8jY1y7xJyADP3nrf5Z2y2Lt8wFIMZpE+JGGU146cxaQavq53zD0qB2u2eTs
 Eu0JHbahVSK0SaUUnev0u/HQzkVs+FFk7zIiKxYMe8AHp+SpZEval+8zoCJAvw9nc/hA39qSqASTDp
 V8NExTLbMJSOEftHExDxGl2LdyJ1a8kDVKO9hCmLEIY+XmyJn8a7bTYw2rKoKB1BWI/xRyQDpwZ0dj
 vGrvZgO2HvWGtZt8CDuh+uMdRNdrH7WXdA/Clr9Qttl7FEeoEM08DKqMp1nRDCOdSMFLDeNUQtqLwd
 KxnnbD3YrCz8mcMtACdKSoUR/10eIdrqPGNt2nlvE1Wyn4OUkyT0ndFSvbdkXhjI/t9R9WYNZKie/E
 LQ2qlXA9Tzbp7CO+fgktZvXfRH2Z0USTVM61r2upgfKsMCVp5lun3LvxfkAxqRVoxXnj3KhykCzQnq
 4bQOoKnsHPBBz6Dx5V+GtIv0rq0Gjo2+XUrnSdn36u7qPkkU5GJBKyMSsMlaxiIyqYp65pPGZvTw7/
 qSlpRtdxNNXMft9G9QHAl+XV/R0mpMYKiTYoWdJz+tNqGCoCpEg0xAnBmGgtCyMevnP/t8x0NoNXD8
 DR/iIp3h193YRUPY0Emb7nks6pTaHoMWVHB0SnbG8jlEOkr7Wp/5RMT/ersA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_185558_919679_06FE38DB 
X-CRM114-Status: UNSURE (   9.49  )
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


