Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0447EC28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljCyC7U0qPjAmj58JMjXm7YRxm8mySo00m5eEY/sQGI=; b=YrxWnr0JRkFl7s
	2Tdbn3pXPPy6bxanHffoLey/RpzPtIcQmjPqoznUc24hhQosmyrhrJuHgpxIC+E3RQHj7R2vSC10O
	zkd4CFiq3ckxOeD3Pm5E2sFQS+5yweiNxt+e4aNppKbcLxDDC4vrJNaJVY1pEULxuTBmhSCHKhhLX
	kbqVxT3pxBfpNtrCWffD8P3oUhemP/sIY9g5hJCRrl/pJ6xtWO4evZ0Qbw8U/HiqfJXKlGzauTgB/
	pQa8n5Iw6f3wkAi90NrAKva5PkaoKz2w11SBMbPhp/1d3lcD0L2+ABwWuE5QOgJOXyZIypgLtBgZ8
	NsDquqRG0w9AXwKvGd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nClc5-00Co5z-N2; Wed, 26 Jan 2022 16:57:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCkKW-00CKYZ-B8
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 15:35:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r25so9758839wrc.12
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Jan 2022 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KlQywLM4SRqpFvXyB5cSelAzc/97HjHZ8/iIFU/mpmM=;
 b=K0xAZphaFB3cOn2S+KjeL76gs//nCrAcf06PaPQ51oH2guyo8PFTVs0KveAl7euaUT
 Dsg21sXr2zJBKnHm7Xx7EhRkvlZkqzm3J4rrdH4wdjV2rACFV9LYD9ScKhtqdwTr00fX
 gY+VXsxZd4wSgadmZUmjcR0Y6x99tltZ+cLckMc6KgKg8p5NMZSyEIacvnvAwyTjVxbT
 NswgQkcr013ohkacykuRhWGYZRPg/VFUepXYuxw4zrvgfUavlZBRGc701qc3/18lmpS4
 jVTbY6Vt1fw/ZLzeigRTsjd3bsQ/ufFGYmxdOHDRlV+4p1cuAqnB657T+jAxo42Kxp6Q
 PijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KlQywLM4SRqpFvXyB5cSelAzc/97HjHZ8/iIFU/mpmM=;
 b=E3dYPPkEyQSa/56Dl8llNiIDSkMWdQsHk+gOV9/3nNMrJHYtOQ4M+BgfHzHlafZhQV
 k8FOTo+GSqU4LYAvuZ9A/nCmiGE/s+OVdhoO6P9lO3KBIHZMLxOXt8q/MH/0ZkC5e6Wn
 eD7tSKfjR6ywcSQC4ouNyUyjMwN4vAIdLzSul0ArmACdCdOnZxuLZ2hZ4oA4BrEMo0sT
 uH78d32KH5o9gdW0vcazz2KKsmYvKk0TXBGcRCONU97QqikbxhVRr1VT5Frxsy5PbmS3
 IZOW/ElX+Q73zpn4XzAjxdg0jdZup+DGrcVgDLQKUymGmaTaDrZi/O2UJYB3VfDQ+vzT
 G3ww==
X-Gm-Message-State: AOAM531GYMqO1SSaQWZtDRCz2e5fqzLvlkpOV3B+xRWQ7ON93RhWCEvI
 OZ1TeKqBccCnefJ4TDb37WImsg==
X-Google-Smtp-Source: ABdhPJxotKUt+W40osc+v3XbruY7Q8g2wgWP28RkprzdfNHadOgnPqN6aUrBhwYKp8IgGrivKAt0gw==
X-Received: by 2002:a05:6000:c1:: with SMTP id
 q1mr20663651wrx.195.1643211326793; 
 Wed, 26 Jan 2022 07:35:26 -0800 (PST)
Received: from mkorpershoek-XPS-13-9370..
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id n10sm3360958wmr.25.2022.01.26.07.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 07:35:26 -0800 (PST)
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
Subject: [PATCH v19 3/3] arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m
Date: Wed, 26 Jan 2022 16:35:19 +0100
Message-Id: <20220126153519.3637496-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
References: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_073528_523692_F84A4BE3 
X-CRM114-Status: UNSURE (   9.17  )
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
index f2e2b9bdd702..099a9e68711c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -390,6 +390,7 @@ CONFIG_KEYBOARD_GPIO=y
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
