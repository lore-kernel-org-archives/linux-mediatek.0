Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93539C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/H7FevQksncpt98jgrnRYlBdkWKr4m3QcK2b8CGpzBE=; b=kK0+05Bm1FS8Ha
	pOvZlUckWRCZO0SiwB+O9Udwm/tbpkdsyNo79BaUGkHDluO2o90m5eYwV9BLgUWkfObQoOyil5LTu
	cVyea9wqIcK1gwXb5547lckGm4wRO6LOtIOCdu4AjrLdz7BHD5ggPbVV7JUf7BMil0qUQeUY0BbEA
	Z6e9SQoLFklQj1ETbROVx/vTZpaiCfjb+YXTFpDN36uaPTWJhg+TL3++fHco4dDAqb4Gzig9HZrJH
	VASqNlP5bkLzUcyLvmRUS2Vyno4hDQexOk/+VBAsRY5SH9liEvae1Sj3rtPbo6KBWA2UextNZVSN4
	1FmpKGNa/UJQXV1INSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnqo-006zMz-A4; Thu, 03 Mar 2022 15:58:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnbm-006twn-6m
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 15:43:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i8so8456841wrr.8
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Mar 2022 07:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSCHAaDenzt4edS/TpOqLWi3iR26rz23jJzPsr8loik=;
 b=rG7/7F3dsVpH+KXNJD7VT7jRZyBZTUZSFw/espgf5K7KrE5qU8zc6i4r+oBidw/zA8
 8U2+ORhiGKbYxeHleTcHaGZcGQP16ljYOk2124ryYEGee5qL02dcTwv4PucPIcZogMmH
 K+WCw0TISP2SzioYnXIm1I2y5MGtNGNDnh9reuODWKsVcqCQ7NPGxrVAQ6UdP7um92KE
 AbGwO7vseqUKIdExVAQ1jxsX+8jRQL+dOj/GAxgiL+Zsnr98jNNuQJ5Yleha5KWw3pAz
 MKmxfCgFmhfuHwIOGN9ebBSyCknPeGYz6FCBPrnlX3HhfUYo2u+6YtxXSzbehAKtgd6G
 JfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSCHAaDenzt4edS/TpOqLWi3iR26rz23jJzPsr8loik=;
 b=SK8UdgzVVDJ4clyGpXxc7wpsUeyVTaMSdG43Lprle6yxuJEXqr/M1GXcYDIsb6DRIe
 QT+6wxojaNRQ+wC9x3V3rsCD06p2GIwFJBQp5qm+gDH0MM5qxHbnXJB3m1cjyVqfl7W5
 i8+VjiPIP8pTZ6SZxqmR8Q3TaccYdO46HjS4TorRRz4iRptCWOcAtPjosekkrB8Cjngp
 j1YPWQkkwOFlCClI18UhjDK/ohzeF5SolnDM08Tm/XzazEMnFozMjXQ5A26AjVWvZMNr
 iCKg3UAoCMuH6iT0PR2BwsM3LYQQrEczCZfna4kSr2Dw4Uq+YZ23g9jdk5oUFuxl5OkP
 nI0w==
X-Gm-Message-State: AOAM533/wPa1kZfNR6efHbL46o40qYvm078/JaDb067QS/5UrR87F/Co
 kRIfVd/VUPntnRhBD9JyKxeF6Q==
X-Google-Smtp-Source: ABdhPJzpTbgc6mER3JSjzjYsqiHETOOoZa7y+1TxYK/JpmzljTZGmrvxt+exnZrgbxkIdOrUNgOKkg==
X-Received: by 2002:a05:6000:253:b0:1ef:8a2b:8db8 with SMTP id
 m19-20020a056000025300b001ef8a2b8db8mr19278269wrz.321.1646322191248; 
 Thu, 03 Mar 2022 07:43:11 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8b2c:5e00:e059:ffd7:be1c:ef2c])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm3272452wrx.108.2022.03.03.07.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:43:10 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v21 3/3] arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m
Date: Thu,  3 Mar 2022 16:43:02 +0100
Message-Id: <20220303154302.252041-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220303154302.252041-1-mkorpershoek@baylibre.com>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_074314_330374_52617AA6 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek matrix keypad support in defconfig.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 30516dc0b70e..e8ca75ce52c1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -391,6 +391,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MT6779=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_GOODIX=m
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
