Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70714C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 03:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTcdE99TcQTNlc0Sc8sOfgvuwoyx0Fa/oqYqR+lzGXw=; b=T/EssDFY/xRRS3+S0Nug2uFjKa
	UK5I94GcO5jux4ESDhjcHgj7PRjO4tQTW9KO8k3C1XUqpdH/Y+T+TIdwm7aBucmymi8X+9JkgKXNj
	3i4SBGKkSF8yshyvp2INxcoiv71nwZi34gT16geLF1qxaD0HSPnuOiTtmokSbQi6fpjd5D25HiW9F
	c5w64rycZkBeHkZnAFyURTKmTi+0mRhx7CXKer4MP64O3DoukpPlvYK9h0gvAb1RXatmYmMWR6lA9
	XhQLu+QcRx+4R19Hyfc+ssZabYmCaM1a/yfka0JFgrFWy0j+7eH+Nptjg8kFbMHOR1jwXoRdhXkR9
	+igAPAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3fA-00A7Ky-FE; Wed, 01 Feb 2023 03:19:56 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3ea-00A73C-Tq; Wed, 01 Feb 2023 03:19:24 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(17481:0:AUTH_RELAY)
	(envelope-from <chiaen_wu@richtek.com>); Wed, 01 Feb 2023 11:18:52 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 1 Feb
 2023 11:18:51 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Wed, 1 Feb 2023 11:18:51 +0800
From: ChiaEn Wu <chiaen_wu@richtek.com>
To: <corbet@lwn.net>, <pavel@ucw.cz>, <lee@kernel.org>,
	<matthias.bgg@gmail.com>, <andriy.shevchenko@linux.intel.com>,
	<jacek.anaszewski@gmail.com>
CC: <linux-doc@vger.kernel.org>, <peterwu.pub@gmail.com>,
	<cy_huang@richtek.com>, <linux-leds@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <szunichen@gmail.com>, ChiaEn Wu
	<chiaen_wu@richtek.com>
Subject: [PATCH v17 3/3] docs: leds: Add MT6370 RGB LED pattern document
Date: Wed, 1 Feb 2023 11:17:29 +0800
Message-ID: <f2427b8c277bf7f310eaf9146cf843f32a65dc9e.1675246896.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675246896.git.chiaen_wu@richtek.com>
References: <cover.1675246896.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_191921_474005_F86A2296 
X-CRM114-Status: GOOD (  12.56  )
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


