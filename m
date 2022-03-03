Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UGqIv2hq/p0HF9HVNu+ctmJNrZbks9RWfzwbbcPeRU8=; b=pHKXKxQIuqv/NK
	a2u2oP6z5Ua9lX5eEmfG9augudPw3gcwpk+4OC1b+pXfZCk8wofe/day619kSvtwtflrMm8N5xAdm
	WGKjlUdWsTbZIqwy1VyahE9ugsJBhCXbxW/BmbLG3RsL6yd6mgB4LKVQDQ95OSQyWzhDUEvjdp/eH
	iW3WJgw50II9I7EKO6HEepW2SFk62idR7ReCq6fmt9R1XNhVNRNL7Bhe4jzzr/ghZdFqGqkCHcNud
	pfjqM4IPay+ugXMWHIp4AaxjLJTfiy3IjyJxmD1VWaBm0FMgsdjYmElX5hVsro+VwaW5Orvjr2BR8
	zwB068FqCqVLRHW1M/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnnF-006y1Z-7f; Thu, 03 Mar 2022 15:55:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnbh-006tun-J9
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 15:43:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id j17so8534944wrc.0
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Mar 2022 07:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PQYi5V1lBftwwUBkJym+Rqvvi9OxhM3bg4N4a7up4g=;
 b=ii7ieihtWdQjGhc0wAY2obQoDNuQbavoa/z0Z1invHkvtW0lLnlSTaf1AESWTTnFJC
 mYvpjwT2YnGO6avrMN+XqwIIhVVD26M8nYpCRPssahgfG/w6oASdBkmAl49TWGcZfiHc
 QM6Ew7mmiLzj6wZ/PdJo49O7DuHSt0QVCg+lIv5YVaIvM+cyJ/dVM1PDOrqjq35GOZFJ
 LUQhXQZLaixMYQssB3WqNkdBc81LAuXWqSXJjSOYaYppXSkH9KOhaTySdYMPgveR9WEO
 X/7p7a5zLJSMWUYQC4utzilK5wSPU59saQSU3KbSANl2PirVUc5enoQ/TWD/VWej2YQu
 NyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PQYi5V1lBftwwUBkJym+Rqvvi9OxhM3bg4N4a7up4g=;
 b=Dp6zf2yhw2/2EPIgZ7A82J2ik4lHrT6xYrZwn7gsu5tmkZIntotFACpZwpnr7e6tQl
 Hd54EqNGimZzam6synqlDdPriWc2GyZiPzTq81mWwio36hL+HjLI/wZ8gjUlODriwqkd
 KxL6S2HAKAljALsjxA4pfZ/Dc1KdkXEQi5C+t+H5QYJRUGdQsJKzOJQ1JalsiuvT/RX9
 3GXjNvpVatTcRVUWIcjxbG93jUcTX2hT7D6jn3yv4E34mJRS8s1l/qEBcyFoDlTUcXMg
 ZlpLR4SQt8HkW8OirTujIMXMDuCV2E/NzrnJP+c+Rse51u1t6r4/ulmluJiQ868+D64F
 tAOg==
X-Gm-Message-State: AOAM533Mq/CDSS9UMuGJ6lkiO0UF1oPRYemkYyJLKrVt2nrgYKVnMIC1
 eYaIHKPINok9F7NSYMpSTLHN/g==
X-Google-Smtp-Source: ABdhPJwjWCWULRfIdubZwads+hZK1W/6OkX6dkMsq2u8EwoVi2VvqGzLxjPky3oaLS8WkdkBtFt/cA==
X-Received: by 2002:a5d:534d:0:b0:1ef:956e:320a with SMTP id
 t13-20020a5d534d000000b001ef956e320amr17525107wrv.613.1646322187010; 
 Thu, 03 Mar 2022 07:43:07 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8b2c:5e00:e059:ffd7:be1c:ef2c])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm3272452wrx.108.2022.03.03.07.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:43:06 -0800 (PST)
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
Subject: [PATCH v21 0/3] Add matrix keypad driver support for Mediatek SoCs
Date: Thu,  3 Mar 2022 16:42:59 +0100
Message-Id: <20220303154302.252041-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_074309_758503_618E5662 
X-CRM114-Status: GOOD (  11.44  )
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

Thus, I have made the following:

* All Reviewed-By: tags were kept
* Applied Marco's Reviewed-By: on the bindings (since he approved v10)
* Fengping is still the maintainer since he is the original author of this driver

Please tell me if you would rather have me do things differently.

[1] https://lore.kernel.org/all/20200909072159.14888-1-fengping.yu@mediatek.com/

v20 -> v21:
driver: reduce code line count (suggested by Andy)
driver: use bitmask for magic "32" value (suggested by Andy)

v19 -> v20:
bindings: use dual license
bindings: fixed 2 indentation issues found by yamllint
bindings: drop clock-names description
bindings: use standard keyboard node name for example
bindings: use default: keyword for default values
use debounce-delay-ms property instead of mediatek,debounce-us

fengping.yu (3):
  dt-bindings: input: Add bindings for Mediatek matrix keypad
  Input: mt6779-keypad - Add MediaTek keypad driver
  arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m

 .../input/mediatek,mt6779-keypad.yaml         |  77 +++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |  12 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mt6779-keypad.c        | 215 ++++++++++++++++++
 5 files changed, 306 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 create mode 100644 drivers/input/keyboard/mt6779-keypad.c


base-commit: dfafa56029576c52a393b61dcba7a3a43fd2b6c0
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
