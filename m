Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C0C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u8iAO1EmOnqPrPkw9RbsuEtCfHrAe0AJuHBTNSqc/3Y=; b=VVl6AxWOW0Emws
	IzryW15o7gzEwQBNEzXbALCRhOyvnbWLTaHr1Om7PgB+Ivc95ObglzEPkvuEA5f+PSMxdgK/Cize9
	JDQPvm+7aGjqhSKox1haieq9bCZUSz7wZZ5FIGcKPcmlDmFrTSd7/L/WIHMl/q0UdaEYNiVElzI2i
	3XaUiK3G/p97FpGZm728MuG3iW3dtNQUbf+ZVKaMEbTAyUAzIJNxwSQbEGmQACgaKvQbohZihB95D
	bV/igVN4dXgPH3XbU643Pc8qqIXWmD6fVvsnzeNkwOihqarOQKEc10dEguqPNgQZkdlKwGXPx9rHC
	vOfH1yYlsatLwkrDeryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2lS-00FMc2-3O; Thu, 27 Jan 2022 11:16:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2kj-00FMJS-3L
 for linux-mediatek@lists.infradead.org; Thu, 27 Jan 2022 11:15:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id f17so4153694wrx.1
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Jan 2022 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AqCQ3Cv7kubS972WRmyqz9Ovn66XN6I/kVUjqRm07dI=;
 b=FTCageDzja7MDHvfCdCrAWTT1F+s07YyGIVA7XEv4aLKB2thbXHqzqoYf2B1gCt55v
 FPdI0kwpmhullu7lusRBsFROrm+KGgOqAtkHTjjbNhm6h5D9+3Ne1tFsyO728iltINTl
 dBQs0alpeVpfV3Ha9RCcABOFdXRj9F9nclZzHbGfx/nZgyAVj22++a7xGi+3VV6O+50e
 YlO6CPOAiBrbTNpl7iW6UryfHdGsLmrXnjHP5ob91ye0kIvslaoJHzzvOTBaqn/RosYg
 tF9a1eLC1+aX8lSTzRPeyy00PR6DzazDjd+e9EaH2EA5Y4Nck7tI0AegXRpMNS2yhmF1
 WXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AqCQ3Cv7kubS972WRmyqz9Ovn66XN6I/kVUjqRm07dI=;
 b=QP9/wX9Mi0440HYNi7rO2TRhRFp6OveISaYoXo5Y4lDOWN7IlAk1nBqIPCKX97AKI/
 LqnEj/3InKFcubLRRQKTWL+CkdkLQM0cZc9X4KtpXKXnkAfxE+lsthQhWIjBN4sp/UiC
 JuYm+WXusv/T/qtnRwXI/j/xqWMl3gLeCT7DJVmWPLdB/h0GDDNgVqSN5IdvSstu8aN5
 wQblrF3YAF+XLIRtI0fU6QiqE9mCL2z9ybtc2nA64a9eZXsrgqAcreVxgl63VLzppfnQ
 dxNg+wBU2NAxHT+Sx/z/2CgGR2b5L3KKQDI5+e8Jh2jo3yko2W/sN6PHz9kmJ/AnPd+7
 PUNQ==
X-Gm-Message-State: AOAM5304s1muHjW/s6KVp66YRgpPZQMw16MryrRbXWAAjYc0ofIEAlt5
 TsHIXK2rMtpv0iGnqASoKjWpeQ==
X-Google-Smtp-Source: ABdhPJwjpkby8GQSoY8fsnnpW0eosHE4KMSv6I6bmTxLodSfB9LUCloN8JxTHyEdgsOEm+5ExtPVTQ==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr2661269wrd.418.1643282143753; 
 Thu, 27 Jan 2022 03:15:43 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8b2c:5e00:7d3d:d638:46ec:78dd])
 by smtp.gmail.com with ESMTPSA id r7sm5956311wma.39.2022.01.27.03.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:15:43 -0800 (PST)
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
Subject: [PATCH v20 0/3] Add matrix keypad driver support for Mediatek SoCs
Date: Thu, 27 Jan 2022 12:15:23 +0100
Message-Id: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_031545_255754_8A19036F 
X-CRM114-Status: GOOD (  11.47  )
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
 drivers/input/keyboard/mt6779-keypad.c        | 218 ++++++++++++++++++
 5 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 create mode 100644 drivers/input/keyboard/mt6779-keypad.c


base-commit: 87a0b2fafc09766d8c55461a18345a1cfb10a7fe
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
