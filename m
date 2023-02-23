Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8572EC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTcdE99TcQTNlc0Sc8sOfgvuwoyx0Fa/oqYqR+lzGXw=; b=LXur98VA5ou2BkP69Lc0r4lSW0
	pnUnf/X53BOX+wUbBcAEt828UKmcAchsNBeZwNz/XPELM9qgUc+XD2Ac7tiA11FdB/DALxedqx9Z7
	WqdTw2l6tUSVBEB8nk2RiwOZeK30vBn55BmbG+gNxIbwdctZfDti9rNaSJ6cvPOrf4AIJp4dl9rC2
	H9ZOfuGgDn+0Ms4DzZbLDdZsl6tLurClkrYejOlSp0eJwnntsY8Yr/ry+6/KdLW3qQtD1OxYRK5yn
	xD6YcU0Vij9vMoRnL6bU1cZsPAt7YB4UimSaDp7GfYhlk6ZgSd3iKgO1/1uAgTEPYCG6H8qKFJpeT
	sqg7Qavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9i3-00G8Sm-Ib; Thu, 23 Feb 2023 11:24:23 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9hz-00G8Ns-Nb; Thu, 23 Feb 2023 11:24:21 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(14980:0:AUTH_RELAY)
	(envelope-from <chiaen_wu@richtek.com>); Thu, 23 Feb 2023 19:23:39 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 23 Feb
 2023 19:23:39 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Thu, 23 Feb 2023 19:23:38 +0800
From: ChiaEn Wu <chiaen_wu@richtek.com>
To: <corbet@lwn.net>, <pavel@ucw.cz>, <lee@kernel.org>,
	<matthias.bgg@gmail.com>, <andriy.shevchenko@linux.intel.com>,
	<jacek.anaszewski@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <linux-doc@vger.kernel.org>, <peterwu.pub@gmail.com>,
	<cy_huang@richtek.com>, <linux-leds@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <szunichen@gmail.com>, ChiaEn Wu
	<chiaen_wu@richtek.com>
Subject: [PATCH v17 RESEND 3/3] docs: leds: Add MT6370 RGB LED pattern document
Date: Thu, 23 Feb 2023 19:23:09 +0800
Message-ID: <c6487954daff5e514023056ad7de1d0ddee674a8.1677150607.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1677150607.git.chiaen_wu@richtek.com>
References: <cover.1677150607.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_032420_219326_1FFAA26D 
X-CRM114-Status: GOOD (  11.53  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Document the MT6370 RGB LED pattern trigger.

This simply describe how the pattern works, each timing period, and the
pattern diagram for MT6370 RGB LED.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 Documentation/leds/leds-mt6370-rgb.rst | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/leds/leds-mt6370-rgb.rst

diff --git a/Documentation/leds/leds-mt6370-rgb.rst b/Documentation/leds/leds-mt6370-rgb.rst
new file mode 100644
index 00000000..d1b2e4f
--- /dev/null
+++ b/Documentation/leds/leds-mt6370-rgb.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Kernel driver for Mediatek MT6370 RGB LED
+=========================================
+
+Description
+-----------
+
+The MT6370 integrates a four-channel RGB LED driver, designed to provide a
+variety of lighting effect for mobile device applications. The RGB LED driver
+includes a smart LED string controller and it can drive 3 channels of LEDs with
+a sink current up to 24mA and a CHG_VIN power good indicator LED with sink
+current up to 6mA. It provides three operation modes for RGB LEDs:
+PWM Dimming mode, breath pattern mode, and constant current mode. The device
+can increase or decrease the brightness of the RGB LED via I2C interface.
+
+The breath pattern for a channel can be programmed using the "pattern" trigger,
+using the hw_pattern attribute.
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware breath pattern for a MT6370 RGB LED.
+
+The breath pattern is a series of timing pairs, with the hold-time expressed in
+milliseconds. And the brightness is controlled by
+'/sys/class/leds/<led>/brightness'. The pattern doesn't include the brightness
+setting. Hardware pattern only controls the timing for each pattern stage
+depending on the current brightness setting.
+
+Pattern diagram::
+
+     "0 Tr1 0 Tr2 0 Tf1 0 Tf2 0 Ton 0 Toff" --> '0' for dummy brightness code
+
+      ^
+      |           ============
+      |          /            \                                /
+Icurr |         /              \                              /
+      |        /                \                            /
+      |       /                  \                          /   .....repeat
+      |      /                    \                        /
+      |   ---                      ---                  ---
+      |---                            ---            ---
+      +----------------------------------============------------> Time
+       < Tr1><Tr2><   Ton    ><Tf1><Tf2 ><  Toff    >< Tr1><Tr2>
+
+Timing description::
+
+Tr1:    First rising time for duty 0 to 30%.
+Tr2:    Second rising time for duty 31% to 100%.
+Ton:    On time for duty 100%.
+Tf1:    First falling time for duty 100% to 31%.
+Tf2:    Second falling time for duty 30% to 0%.
+Toff:   Off time for duty 0%.
+
+Tr1/Tr2/Tf1/Tf2/Ton: 125ms to 3125ms, 200ms per step.
+Toff: 250ms to 6250ms, 400ms per step.
+
+Pattern example::
+
+       "0 125 0 125 0 125 0 125 0 625 0 1050"
+
+This Will configure Tr1/Tr2/Tf1/Tf2 to 125m, Ton to 625ms, and Toff to 1050ms.
-- 
2.7.4


