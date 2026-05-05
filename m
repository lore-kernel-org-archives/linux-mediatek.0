Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD81CD342F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=; b=D5o+imJPQ62V5kxW7O4EDgL156
	QLXOsxP/MjBWbjk5TbtwjauBrTnAs8b7GxOzbMusM+OPWIKyYThIgTVTDoajkr2KwHAO34RNthPha
	SQ2w6IJJTXF2UWGfDZcg6GXkyWs8WgPaIvDnJz0Cvy2DJOfURunsUw4yShVn5Kp5rczxERvWeA3Z7
	Py4l1OUfX5E16W+MnwIMcmfEjXLA1odP4W92HHN6Hi8nSY4CuqlznUc/4WnyF+3b6AhyFEPPoZV+n
	EmX5MJoQIicnlsgAJ3KO53Wh8ItOfVLJX2aACLtD7O0cG7fKHKwf+EsUOxn37eEZXcZjG63oHWFeZ
	zUJEPP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnn-0000000FrHX-18lI;
	Tue, 05 May 2026 10:14:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnm-0000000FrFb-0VHV
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=; b=ZYoBbzFIUF0KjwxreHXRSyIeiT
	5Af9/BqrTEqtA5cTCf9UjYpOveA1jtGqg2rQuUqYE4tie0Xoxd+UqZR331kXiHrIh7SLmAtLAJGwl
	GsMzgFNT5lPGoTU3wFMQKD+gYfA/OnY0bJDUK9ZQBRZ2x8XsDryS1S8PAiaNMoB0SAlQ5nOzUhvFI
	Z4Kuet7PqO+Pd0iWFnROLEBhPLBp5sNzhAy3PrpZT2xmclnOutwvsWoXHPm30iZIUQhLYmdj8MHtL
	J8ioYSk7YMfZApijNvFXGvxo2XSurHPT6/iNc7EJq2CxVDLksgF+9yU/XMRCv7nNM5xjUWMRhNTkO
	w7E+Yl3w==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnf-0000000D9aC-0OYv
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-83659d38e38so938724b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976085; x=1778580885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=;
        b=F8UGN0DAwZnUHS+czCFBQR9YUbSIvWuU2eb7AaJm49eqnKks/sriol41rw74ZXx235
         5CSgUGV1lK8WxRQ9/mFknLFmEZpFo8NFi+hQW/QnscKMDZ/b0FVnPrLxedWC8gSEZslU
         /bxxByTwSsp0tOgfsVPOSpwhjalFGLsJZ6Vuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976085; x=1778580885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=;
        b=FaJqp1LT7aa3QmZkvyKZnNyXyzrVVY56IhAkHh7IYToL4bTWGM4er2s2wfrwrw56YW
         p+MLXlWxb2she6f1/TERzxjZVPdVHa0Y7GjzxX1AXi+DZ7GkeFp7XeEu+TnRnaQXnLyR
         XR1cdcQLV4G0DbjXD5xumpnaZ016zwwlfPteuX34TgRR/7w79pJncSFlS4LEa8Fu8WI+
         Fyks8/aL3HSC7D77YJTvhYt8vSonUCgMoq7OFFqbSBk4oRgVFTj8af89wP1vjy5zl2Zo
         O/HzeEfMV7mm6jnnDYCY3ZNNnqVrWvC9lbNmPIbLvN9TkKppAW/zoi00sFfzXxB24hWC
         sKRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jQ7N8VWvmJ60QPO+O/UQEOOOH/UyJfJDVUehkzkf3bCvwR/GFdA8NpYCYDek6V/EvHHfwONFCMSU5XIBQvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw276wiyDfYwUsMp7E/wOa4sn5di9UPO5X+RErjFoKIzZ55ix+p
	OzRSf/G5HRR7CYYbuQ6NoeEXp0z462m462Y3UgLtGKyR/OezmMa6gl0MLcEq2toytQ==
X-Gm-Gg: AeBDies9Q84eODZRaYO6zeOqMF9eJrFt6l3TQZ/02at2hzX8IQ02rDD5yQQSf3q4LXX
	9BioVIs1xOrnEnZuCEgxCuQddEJtKqn4M8Tyusz9ixDdX5UJdRU7xmHPWs+aRjsW1zPrIyGVYqt
	qq3Jmwzl3EZZNeOhq7oy7nIDassrpeLDtlOt65hKc1RGZhMYsof2Df3vVN1GDfltd/0ZJxLK6pN
	cIfr5rxxLR2aXCsyN/6EU4fQT9vYnMUd22R6ur5NLognub3/iYObVOz8etIg+6LvfNydKmU/gWV
	/n62izeYIWeyjaSXuZEM7BRCNhJXwbQ/BrePtQzI9x36G95o9UcGyJRi7qJ8ZQa+JYDCJD2Qgzj
	x14+XBHCBEskntFYh7HOPrN9XrKSbHQQOyWZVTB8jsdMeYuGVgyZRZRuyvNjSZHuCpN1eo51Yk8
	o5yRT03qcaqT3xUxiaPQVv4NvlscXRvMZas/VQX0YGP++/hRo4HCxUkBpM+r349GvQ+H0BYoayh
	6qOMfgaR4y+1D4e4CzcIm3vqGZ5xA==
X-Received: by 2002:a05:6a00:391a:b0:838:a46:ce96 with SMTP id d2e1a72fcca58-83923d96a0emr2448390b3a.27.1777976085583;
        Tue, 05 May 2026 03:14:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/16] arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:13:59 +0800
Message-ID: <20260505101408.1796563-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111449_303448_26D12FD4 
X-CRM114-Status: UNSURE (   9.66  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f1ff64a84267..0b9fedac842c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1312,6 +1312,23 @@ pins-report-sw {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_z2>;
+	vsys-vcore-supply = <&pp4200_z2>;
+	vsys-vgpu11-supply = <&pp4200_z2>;
+	vsys-vgpu12-supply = <&pp4200_z2>;
+	vsys-vpa-supply = <&pp4200_z2>;
+	vsys-vproc1-supply = <&pp4200_z2>;
+	vsys-vproc2-supply = <&pp4200_z2>;
+	vsys-vpu-supply = <&pp4200_z2>;
+	vsys-vs1-supply = <&pp4200_z2>;
+	vsys-vs2-supply = <&pp4200_z2>;
+	vsys-vmodem-supply = <&pp4200_z2>;
+	vsys-ldo1-supply = <&pp4200_z2>;
+	vsys-ldo2-supply = <&pp4200_z2>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &scp {
-- 
2.54.0.545.g6539524ca2-goog


