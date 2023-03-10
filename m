Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84503C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 06:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2f7PcdZsfyhr/wPvOYFQehbqeQQKC8HQ7+DblIGL2Q=; b=WX8jZdSywqY3gYECmwK9B2xE/1
	RmIdZnkMGDnX74/WTNxxOrbszC2eQSzOGBedrR6RUN3lklXTor3SBmmyKP/BSdIr7yogDXROlYFy5
	fHJji7uYWzoYAUqls1+HiRLj+6ALSzfd3+Ujnu/A15KHLvAOnYgy3HGOEcg2JFeTm0ThyhbVICqe/
	vDGv3rT3TsuU1f2nNCW8127/lfJCeyAJ33UxXyVjqN4w0R6aX2HoJl9xt+O4ut74vSI96F72+0puU
	1jo0/KC2soNiir2edfDsOu8mTOatJ116d2jrEaNheIYkOAEUIdRlXBy+kfjjPY1lj7L5R/EIcsfi/
	FasBjuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWgP-00DJGC-56; Fri, 10 Mar 2023 06:56:53 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWgK-00DJBX-5W; Fri, 10 Mar 2023 06:56:51 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(20043:0:AUTH_RELAY)
	(envelope-from <chiaen_wu@richtek.com>); Fri, 10 Mar 2023 14:56:02 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 10 Mar
 2023 14:56:02 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 10 Mar 2023 14:56:02 +0800
From: ChiaEn Wu <chiaen_wu@richtek.com>
To: <corbet@lwn.net>, <pavel@ucw.cz>, <lee@kernel.org>,
	<matthias.bgg@gmail.com>, <andriy.shevchenko@linux.intel.com>,
	<jacek.anaszewski@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <linux-doc@vger.kernel.org>, <peterwu.pub@gmail.com>,
	<cy_huang@richtek.com>, <linux-leds@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <szunichen@gmail.com>, ChiaEn Wu
	<chiaen_wu@richtek.com>
Subject: [PATCH v18 3/3] docs: leds: Add MT6370 RGB LED pattern document
Date: Fri, 10 Mar 2023 14:55:57 +0800
Message-ID: <38f1e863b0f099158a63fb6f95056a1cb30d80a0.1678430444.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1678430444.git.chiaen_wu@richtek.com>
References: <cover.1678430444.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_225648_662594_5C574DDF 
X-CRM114-Status: GOOD (  12.21  )
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
v18:
- Revise the text in document title and description.
---
 Documentation/leds/leds-mt6370-rgb.rst | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/leds/leds-mt6370-rgb.rst

diff --git a/Documentation/leds/leds-mt6370-rgb.rst b/Documentation/leds/leds-mt6370-rgb.rst
new file mode 100644
index 00000000..abf739e
--- /dev/null
+++ b/Documentation/leds/leds-mt6370-rgb.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+The device for Mediatek MT6370 RGB LED
+=========================================
+
+Description
+-----------
+
+The MT6370 integrates a four-channel RGB LED driver, designed to provide a
+variety of lighting effect for mobile device applications. The RGB LED devices
+includes a smart LED string controller and it can drive 3 channels of LEDs with
+a sink current up to 24mA and a CHG_VIN power good indicator LED with sink
+current up to 6mA. It provides three operation modes for RGB LEDs:
+PWM Dimming mode, breath pattern mode, and constant current mode. The device
+can increase or decrease the brightness of the RGB LED via an I2C interface.
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


