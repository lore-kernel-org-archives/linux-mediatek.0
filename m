Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3287C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=; b=0TnlMzg+xPZ1g/CJCV1Meax3Xv
	R+1ZpwdgNhnQ3OHq7s4FsIOKkY04ES5oc5rksgZdkZsg7gKYE5/EYSifFx8E0uyWqFx1y0UWqeWI/
	4qeq/1urS3UyDr6Q76ZzqNBT7V5D2vTrECtkdS6NVutpSNG5jJKehJdYU4qVFZ+ZOVt7a9fldoqv1
	cfUw/A8h/m/73eBeQbqNAu/spz+sRu3UiiMtNfUPpMpHr5PWFFleWpq3vcaWsBm3WGPfFF8w8iu4o
	y7ai3fYrN+iQQSEqeSnmT0Q2ix6lR5QsY+DEWCqn9e2dyq/I+LHEtpq3XA/UH0H8h4W6xKvcvfP0a
	W9SwumqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyk-008MnO-2T;
	Fri, 31 Mar 2023 17:55:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyS-008MbY-2H
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:55:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so14418253wms.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=;
        b=8A5AY6A0oT4jQtA5VnLRDkxo4xlP9WLPy51nJgXYmEavfSgvz3fJKE8ZrzcXFNeBFo
         EfF2wUhVpQbBlHRujvUDuN39zt+xogqnq+mg+9SPoe1d/iL0WCDcRSN3OON4G5z3Ur+v
         0PqaorL1ik7KHU22aIJ4sEelbAyBQzH/qauXHVuZlmozckIILUdygli5BSuizYVcqB+L
         sjRJpEK2Xt5CbEHCTAUH2KmIhuht3Y5cQfIwRjNXS9tjpMv7MID3s9R4/Ob1Fn0Vop9Q
         BTuAnebzZlRMd/gOTdbkelqy6PflcwdjCWmsRP+1gNj4KOpkzgnIQsNaIgsUluwSMdym
         ElUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH9QAwye48bejYcJsmUVDgnU+lbK1EZ9+5kkrqikkcY=;
        b=uHnv/IETa1RiZW8KKb8r/FkaGXKEljshbf6lRP/ghKh+Dnvd8S2Hi1SbR9L6qOmBcI
         53+23kxNXzY+jcd0ZNVuHq8HFkdi2fvBTLGvJiaAjsVzhlR98+ogeSZLOsZUwOBvcUtq
         ufz7tiO+CVCwPtG4Yf1L2hbiJ/hSMCateIlXDJiCb/1VzPcxy24bcCYiyGT0aQR+pp+4
         nIw8yqk1hnXM/PhDH6qvETHThp33hEaZr3QEJfH/A89cmX/n8VhRkhbHReNiKqmjhC8G
         s7Ht3MOQnb4pRjj9yOFZaUtoDb8f8hD59+2o/n/+q1LO0N3KeH3DXFV0zG2YAruLplVX
         V+fA==
X-Gm-Message-State: AO0yUKWL1IZMP+vFG91rt9ZzmrIvooDJK10HMn5kVoTi9SiVybfXcgqa
	+eueiU1Fqyy+TAnjvj57vv/7Tw==
X-Google-Smtp-Source: AK7set8qDHNjM9Vo7umMqfyzo3JUxtB/kXW7ZJu4q//up/3L1jNprqByGyVGQI7yO91idcPzEAIepQ==
X-Received: by 2002:a05:600c:282:b0:3ed:b094:3c93 with SMTP id 2-20020a05600c028200b003edb0943c93mr20977086wmk.23.1680285338027;
        Fri, 31 Mar 2023 10:55:38 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:48 +0200
Subject: [PATCH v4 04/11] arm64: dts: mediatek: add mt6357 PMIC support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-4-5cffe66a38c0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=O8w7thwfT5MR8VFkiJw3MJIje+8Rl/nHai1vgZPIVV8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6UgiVTVhzknxnURoOGVCKLYcU2dVLkzXoobrjj
 VsxXt6KJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURZ7TD/
 9iTLIVvSg7owqsUoDceY6ndNYIT8HmsApucX9g14JcswuQ+UyI2U0SjNL+HOGzgO0sBVVeH5q3keTm
 D5e56FbmFfLnWkp7O4gQblNL/OqU3sIOkAG+szu8f1CNMJfEsXALVsNW83tJry9o3z6CaZMkylI8F5
 4pw78JcX80XNZDuHIwV/4QBBeU8Q+94J8JyUHiKwWLfEFcUnEscztsNjYX/4Izbntad3gDhy+c5ylM
 ySWsj5nmft58+ZjEY15bBTXt8WQBFQ8PHppGAbzkF7A5J+BMQaRn8+Y7PoOM+Vp/qhxGh70bqyG8QK
 6Z1cZs7fMVnIcPRGr9US0LYCL+fstARA/nVSzqiTcomu+KgRtNBHLnMbEagczKheJWnBk6XcizkVH8
 TE6b1Dq0SWWxi2S5MP+6j6vCnxqBl5xv3yBjth8lAC8loJhfsx5XecsTKK2+lqDyYV5FgQQW2etCsh
 HnbSTTGu/M4369PL4LcPnTyT7zfKku2BU0V8BQuRkawr6Ok5l4Voaq/XqYaN1qmsK+YM3DJL36pJMO
 0sQGlAOYZtDxpykIbt5VeTc3ZzRJOnWC8D5ykWkpwuO5Q+ljjjBa2dKsBnaMVEdPBc5hgFXc1Lq658
 lc7R3F9XE4bne9GzejjbaitCyTPIQyxVq3okUnExQdjPgBv88cFFuI2Pv3HQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105542_499116_E15D4690 
X-CRM114-Status: UNSURE (   9.77  )
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

This power management system chip integration helps to manage regulators
and keys.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index dd7da86420cf..a238bd0092d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -94,6 +95,12 @@ &i2c0 {
 	status = "okay";
 };
 
+&mt6357_pmic {
+	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


