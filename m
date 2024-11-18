Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF9AD43FE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpvNWCyCojrkvYdu6o2rWrPDcX4yyavTS3Qt2myCoUo=; b=CQ0kLmGpDURgJrQ97bjRHpZn6D
	pT/2EJliYfsv50kC5Af+Njkp3e7adpi1/0RD7Lw0GBtQdOcbIdfnv++tkp0h5jIQfXJYVjxDz41TQ
	hbAph1vha58+pWwLBPAQyOqf2CuSJxJYQ1/dXDTof1PeoPsI0jbzoPSL6Kr3tuhPO5dTUE2EwRDXb
	IgZtgVWF+xFtIQ7pw07FOViZmYWXNcsj7Twb5DPz1Ggy72amQBDTEP6kPeU8hO4b4vWebscRYLILw
	5r0psOhIxsBgWxzpXrNWenCLJWmJ0eJaedrDr5sPeDCgYbSX5lG5wySLv+HGRLNRDjtNxSRDxsKzJ
	pFU/7WYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwCh-00000008e2e-315f;
	Mon, 18 Nov 2024 07:29:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwCd-00000008e1D-1cL9
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Nov 2024 07:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=hpvNWCyCojrkvY
	du6o2rWrPDcX4yyavTS3Qt2myCoUo=; b=f3oZ9P4TdOlRmdKNkheJwEcz4/4MKC
	E+us1Y0Z5G/c0MS+Bz6Y92iZAVSu6gh8I2EHNZnsE4vvnM1IEBU4jw0BJ7jBK/23
	ZOZQ4RJ2AcAdG3Fo/aXZB9caknqWoqjSSmuy/JraNtaDb8tIiDJKRDaiRhkY0XkA
	7uTdsdNMuXZYeAsP3CdBbf4AhdYfGmUY5qgfm3fYIZ2/IzEDR4qK0/w+urqiJ5wP
	VkQidxTC4V72CV9fMrJrQhUtcLb2vyrTsDKAGJ7/HUe7z6Sm4E5RVmqvrVAL3k93
	lE86wQvmOS98Rttic76V8vKZ0HEY2F4KmUzwsfyyatEqffHmbpqiBuog==
Received: (qmail 112200 invoked from network); 18 Nov 2024 08:29:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:34 +0100
X-UD-Smtp-Session: l3s3148p1@ykLZ4ConvNUujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	coresight@lists.linaro.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Len Brown <len.brown@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pavel Machek <pavel@ucw.cz>,
	platform-driver-x86@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Young <sean@mess.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	x86@kernel.org
Subject: [PATCH 00/15] treewide: don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:28:59 +0100
Message-Id: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_232944_275464_D66D4279 
X-CRM114-Status: GOOD (  11.23  )
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

While working on the wakeup functionality of a RTC driver, I noticed
that we have a few occasions where 'pm_wakeup.h' gets included directly
despite the comment that it shouldn't be done. It doesn't build-break
because these files also include 'device.h' either directly or via some
indirection, mostly 'platform_device.h'. Still, respect the requirement
that 'pm_wakeup.h' shall only be included in 'device.h' and not
directly.

Based on 6.12-rc7. Build-bot is happy and there are no dependencies. I
suggest that each patch goes in via the relevant subsystem tree.

Thanks and happy hacking,

   Wolfram


Wolfram Sang (15):
  x86/platform/olpc-xo1-sci: don't include 'pm_wakeup.h' directly
  drivers core: don't include 'pm_wakeup.h' directly
  HID: google: don't include 'pm_wakeup.h' directly
  coresight: etm4x: don't include 'pm_wakeup.h' directly
  Input: spear-keyboard - don't include 'pm_wakeup.h' directly
  Input: sun4i-lradc-keys - don't include 'pm_wakeup.h' directly
  media: mceusb: don't include 'pm_wakeup.h' directly
  mmc: core: don't include 'pm_wakeup.h' directly
  net: phy: broadcom: don't include 'pm_wakeup.h' directly
  net: wwan: t7xx: don't include 'pm_wakeup.h' directly
  PCI: don't include 'pm_wakeup.h' directly
  platform/x86: quickstart: don't include 'pm_wakeup.h' directly
  rtc: brcmstb-waketimer: don't include 'pm_wakeup.h' directly
  usb: typec: tcpci_mt6370: don't include 'pm_wakeup.h' directly
  PM / Sleep: don't include 'pm_wakeup.h' directly

 arch/x86/platform/olpc/olpc-xo1-sci.c              | 1 -
 drivers/base/power/sysfs.c                         | 1 -
 drivers/hid/hid-google-hammer.c                    | 1 -
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 -
 drivers/input/keyboard/spear-keyboard.c            | 1 -
 drivers/input/keyboard/sun4i-lradc-keys.c          | 1 -
 drivers/media/rc/mceusb.c                          | 1 -
 drivers/mmc/core/core.c                            | 1 -
 drivers/mmc/core/host.c                            | 1 -
 drivers/net/phy/broadcom.c                         | 2 +-
 drivers/net/wwan/t7xx/t7xx_pci.c                   | 1 -
 drivers/pci/pci.c                                  | 1 -
 drivers/platform/x86/quickstart.c                  | 1 -
 drivers/rtc/rtc-brcmstb-waketimer.c                | 1 -
 drivers/usb/typec/tcpm/tcpci_mt6370.c              | 1 -
 kernel/power/autosleep.c                           | 1 -
 16 files changed, 1 insertion(+), 16 deletions(-)

-- 
2.39.2


