Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE83C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1uxs44pYZTdJVSHHAHuLwX9uAGT7rFS6Eo+qj106d/E=; b=uawW839uFqRJbe
	ydAQZmh9hX8pXalboPYAlUrnn1bCA8jXp7JYMy07LtpZOpY7nGJbOfZ1aq8WlwRn/zs/CAzecKh2y
	bLgaEk5e/p80Zjct01DQoGWcqyNbDhtjog1+i4EsGOjZEZGNcE+QYgaSLnx/JJCtf1cRKCHC2T7ki
	h9vev7G8taIp5OL4Wa3zUkQFxP8WWoXGE1WoJlhL1ia7W7hECFwEcRp/3BZlVZgu7kutk4NCwar7X
	Wpx7li48q5hMjoVLmUsIdBwWxCBwCmiXkvsr7CzwkqQM6qI2FxvSqLEvSOy/qeN8A1jNpx6KH4WsB
	8BHIWOgRMjTkqTjcitIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nClat-00CnYG-5a; Wed, 26 Jan 2022 16:56:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCkKU-00CKWL-0Q
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 15:35:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id f17so26453712wrx.1
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Jan 2022 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U2VlbaDiL8zCwzswKdJmuhmgZcDC5jFlEtFb0awmuo=;
 b=H63H9mJZx+2wNR4miZeP2BG9jFbtr6BXJRaDXRJB7+UM87PNnkEuDk4JU86/Uuj4nU
 o74Z1FhfadPMea+oscObqeq5MTVxmYqEVr7LaHsT0WU46Z1aN4ZAK7VLijKdpn/rNwTw
 B3zZi6kW/J7SScpS7ZZvEeV43gZZvIN18CxSDu147n+JJfmHEI+kHWAijEFYhz+rBMCH
 7stkchPJ7/1oyNDPCV/DO6HNvgP87Vq4WvLeCA7V+sdluRStNy3PqpjTOLkyygD12tn/
 4wC9Ggh63fA3g/fKGbTNpsyhiZQdduKj5JEpa//INoJmnGun9M6uL6NVUksz3A1otNvo
 w2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U2VlbaDiL8zCwzswKdJmuhmgZcDC5jFlEtFb0awmuo=;
 b=Gu3Qy60J4mQVdLUIjD3DqV3mNnZ96637XrOkdHt5swzN0DhsjnvEpSNHuwNPF8AnW+
 kqaZtbvWTjZcFVg3dY54YZfC2l3n4T/vIt4bbvKN2BC4x5E+e2LLT4E4Rl4OSZ8Dv3oO
 YwPWM5DEVsu9OXIHYNuU9ccdZtFz13s95sJyiJKjE/NESnnjD57OqArCKqdf47zjrgME
 jKfMEqmDKwkngIgBq3+7lynZAfChtBYF0ze1ybB2DWREQHoRserjHNRrM6sCD+QQho6v
 CIy3BGaKgPRguFJOHlDGvHlXm8NXFFG6u+kHc82EbHNwycAx3RY4oyJtEroqrittwnrC
 tESw==
X-Gm-Message-State: AOAM530jZrUHAtQbW/GqmwYYfQe4+ByaRtXt9FMXNXuk/rczPf4zKLsb
 0VyPfYUKRXdEmi1tio4F3r67cg==
X-Google-Smtp-Source: ABdhPJz2hfUkHjqnjSjNIHx9xgMie+71LhrZ6IWHyS38Ps4va/mJ4GSkip4hIiWw/0AIIgt4hddUww==
X-Received: by 2002:a5d:508a:: with SMTP id a10mr6584123wrt.360.1643211323734; 
 Wed, 26 Jan 2022 07:35:23 -0800 (PST)
Received: from mkorpershoek-XPS-13-9370..
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id n10sm3360958wmr.25.2022.01.26.07.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 07:35:23 -0800 (PST)
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
Subject: [PATCH v19 0/3] Add matrix keypad driver support for Mediatek SoCs
Date: Wed, 26 Jan 2022 16:35:16 +0100
Message-Id: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_073526_177794_7F651FB7 
X-CRM114-Status: GOOD (  14.18  )
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

Dear all,

This is a follow-up on an abandoned series, see [1]

Since Dmitry seemed generally happy with the driver, I applied his rename
recommendations.
I also did a couple of binding fixes which were needed to pass "make dt_binding_check".

Thus, I have made the following:

* All Reviewed-By: tags were kept
* Applied Marco's reviewed by on the bindings (since he approved v10)
* Fengping is still the maintainer since he is the original author of this driver
* The binding license is not changed even if checkpatch recommended it:
  > WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)

Please tell me if you would rather have me do things differently.

[1] https://lore.kernel.org/all/20200909072159.14888-1-fengping.yu@mediatek.com/

v18 -> v19:
- bindings: fix maintainer -> maintainers keyword
- bindings: add matrix-keymap.yaml ref and remove included properties
- bindings: fix compatible strings (reported by make dt_binding_check)
- bindings: reorder properties to match the required ones
- bindings: remove un-necessary descriptions
- bindings: fix multiline description for mediatek,debounce-us
- bindings: fix example to pass make dt_binding_check
- bindings: fixed licence to GPL-2.0 only (checkpatch)
- bindings: rename to mediatek,mt6779-keypad.yaml to match driver
- rename driver to mt6779-keypad.c
- prefix function names with mt6779_keypad_
- prefix globals with mt6779_keypad_
- rename CONFIG_KEYBOARD_MTK_KPD to CONFIG_KEYBOARD_MT6779
- rename module name to mt6779-keypad
- update copyright year to 2022

fengping.yu (3):
  dt-bindings: input: Add bindings for Mediatek matrix keypad
  Input: mt6779-keypad - Add MediaTek keypad driver
  arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m

 .../input/mediatek,mt6779-keypad.yaml         |  80 +++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |  12 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mt6779-keypad.c        | 218 ++++++++++++++++++
 5 files changed, 312 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 create mode 100644 drivers/input/keyboard/mt6779-keypad.c


base-commit: 87a0b2fafc09766d8c55461a18345a1cfb10a7fe
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
