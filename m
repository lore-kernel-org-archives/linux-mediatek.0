Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AFFC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:32:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2090460FD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2090460FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f//uNgxRc30NwwPz45CpZtUl6dBL8xdiGYTwm1YImXA=; b=oZKtnkf5CA/dGOyTiDXDK3OJg
	Ml/C8AI/Tym62m/bQFyYx3rrwbL96LrtrDI3j7ZIvhMGbyQfNM5TINQTGR+Qsltxea/GUZlIou8yy
	xK8vXjSLd5IvwekdJnv0l4qMgoaGMJyakn66zSAcpchzqZ9DIxQDsYV2NU9tLwb+Imy9n9BSVfQQ+
	Gqdbm2oDzohy9mSBKHLh2TdSDLp0QsHBsjkyZYxUJ2bqN2f1qBFIZWnQUw5OJCrJrrX2+LD4n9Rw9
	F+rTVPm+kNJAaZX17vG52j/xg4IHxjfkY+vAkPgPPj7bsdsgtjutkgkX4rkl57FOLx/3TMbzsls86
	qeILIGpGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljCwd-002aji-Sr; Wed, 19 May 2021 03:32:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCwc-002ajM-5I
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 03:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EFieo9GKLjNzFcw2I/kSmnmISdqv5y65syZ4W5f+otM=; b=XAmaYSrZMaqFqZz7Z4lz40mVeS
 ObmgIBiYniaJMIMONu46RkuDKbxDfFCdCWDmqxeNBp6S2rpgTBY0hRem/HX+ol6l5uAo2kKqNEHQh
 PnU1eMBwnOLrUS3ROXRVqrRaa5ykmj0/Rbq6JMmACY9QxYP1KxvMfggsPRlya2U5iXn1FLwDupXR2
 hcHpHyKLPt+G/CSkMLM/64Z54WOvjCSuvgC03/Bgo1IwaBqm53yuEyBwyiS9o6Ribga+8Yq6e/8GH
 qe0ENL3C5jSGHBws+HzT6FXv0qathpzSV72aTTH+EVr86du3cR9asDUNWpc44D1XW9AFsPdLqWgbP
 4KBmtSZA==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCwZ-00F5Yn-DI
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 03:32:24 +0000
Received: by mail-pf1-x436.google.com with SMTP id c17so8927143pfn.6
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 20:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EFieo9GKLjNzFcw2I/kSmnmISdqv5y65syZ4W5f+otM=;
 b=jg+03OuU5Or5NrYsPpEbbtfkBc4h4o97IxMpzXgtuk/46U4fAZOvyQKQ9+Ydo6Sy3a
 3c437ZsmvF8wGt9T2xt5v1RNLGmiwTHfrSui0s9VQq0qvndKE8UgZ/RvUn52v+5lCcVo
 MPBC5oIBO2ZpnXevKyNVoJy6Y1NInpw4gX8qqJ00Zd1MhR+uGPoSJuJgLYlL+q9nhA7/
 2VDVGrvhoV2I8VdhG+GgRcUoslg66k4a5yLinUL2o080/aWNq81fT0e3hZ5qocIjzZxs
 B1QrtJOGxKXW1Ocv3gFR9hucw7To0FlM6bnJsRukY19dgEhuEEY3Oplew8PYzaQ0+khk
 eZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EFieo9GKLjNzFcw2I/kSmnmISdqv5y65syZ4W5f+otM=;
 b=g4DOJyXtsNrm4aouyv55MjKnShKWSRViAf6ByIttc2Wl3JLwqFaQRj1iIAirErhPKz
 XjwWlEWc+xnYQ8L+reIrTPAFMRqkyDbOsYEvaJKtzzeNwDjDzModvGpBFE9XBI9NdeXn
 xwqJPHijXbyW2boErs4Sl6ihnL4OqD+PD3GoPBu0PtkI+VnQRs6sS1hqcRE6APhsVn9p
 JDb87UMEwo4IqLJFqKKFzywAZN/v2hnchXrlb+7SelpjmztSu/wiyfOqbZ5CJzGEAGvH
 JUuqAYUgirLszHc6yDRaEZEAfMM+xlS5Vb+HKv4gHAYVS01RceUlWx+3hJ4x7+5fFPwg
 v49A==
X-Gm-Message-State: AOAM533BMH+ZYaEo3Dgi5QILzoRYkD64SbIXxE2ceTyzRjQfz3QtHaX8
 0XTs8V0FN29RTxkKchkVohY=
X-Google-Smtp-Source: ABdhPJx3N8GDQwe87LA8AIAi8nQP8xA6CsSgbEO+LriXkox2kVZQkH/3KSMxNrcosNAMXZPJczSuaA==
X-Received: by 2002:a62:7f51:0:b029:2dc:e1c9:ef71 with SMTP id
 a78-20020a627f510000b02902dce1c9ef71mr8594501pfd.33.1621395142620; 
 Tue, 18 May 2021 20:32:22 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g13sm8244587pfr.75.2021.05.18.20.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 20:32:22 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH net-next v2 1/4] net: phy: add MediaTek Gigabit Ethernet PHY
 driver
Date: Wed, 19 May 2021 11:31:59 +0800
Message-Id: <20210519033202.3245667-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519033202.3245667-1-dqfext@gmail.com>
References: <20210519033202.3245667-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_203223_473034_69859FD4 
X-CRM114-Status: GOOD (  19.74  )
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

Add support for MediaTek Gigabit Ethernet PHYs found in MT7530 and
MT7531 switches.
The initialization procedure is from the vendor driver, but due to lack
of documentation, the function of some register values remains unknown.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
v1 -> v2:
Renamed to mediatek-ge.c

 drivers/net/phy/Kconfig       |   5 ++
 drivers/net/phy/Makefile      |   1 +
 drivers/net/phy/mediatek-ge.c | 112 ++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 drivers/net/phy/mediatek-ge.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 25511f39b01f..1534e408505b 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -207,6 +207,11 @@ config MARVELL_88X2222_PHY
 	  Support for the Marvell 88X2222 Dual-port Multi-speed Ethernet
 	  Transceiver.
 
+config MEDIATEK_GE_PHY
+	tristate "MediaTek Gigabit Ethernet PHYs"
+	help
+	  Supports the MediaTek Gigabit Ethernet PHYs.
+
 config MICREL_PHY
 	tristate "Micrel PHYs"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index bcda7ed2455d..24328d7cf931 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_LXT_PHY)		+= lxt.o
 obj-$(CONFIG_MARVELL_10G_PHY)	+= marvell10g.o
 obj-$(CONFIG_MARVELL_PHY)	+= marvell.o
 obj-$(CONFIG_MARVELL_88X2222_PHY)	+= marvell-88x2222.o
+obj-$(CONFIG_MEDIATEK_GE_PHY)	+= mediatek-ge.o
 obj-$(CONFIG_MESON_GXL_PHY)	+= meson-gxl.o
 obj-$(CONFIG_MICREL_KS8995MA)	+= spi_ks8995.o
 obj-$(CONFIG_MICREL_PHY)	+= micrel.o
diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek-ge.c
new file mode 100644
index 000000000000..11ff335d6228
--- /dev/null
+++ b/drivers/net/phy/mediatek-ge.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/phy.h>
+
+#define MTK_EXT_PAGE_ACCESS		0x1f
+#define MTK_PHY_PAGE_STANDARD		0x0000
+#define MTK_PHY_PAGE_EXTENDED		0x0001
+#define MTK_PHY_PAGE_EXTENDED_2		0x0002
+#define MTK_PHY_PAGE_EXTENDED_3		0x0003
+#define MTK_PHY_PAGE_EXTENDED_2A30	0x2a30
+#define MTK_PHY_PAGE_EXTENDED_52B5	0x52b5
+
+static int mtk_gephy_read_page(struct phy_device *phydev)
+{
+	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
+}
+
+static int mtk_gephy_write_page(struct phy_device *phydev, int page)
+{
+	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
+}
+
+static void mtk_gephy_config_init(struct phy_device *phydev)
+{
+	/* Disable EEE */
+	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+
+	/* Enable HW auto downshift */
+	phy_modify_paged(phydev, MTK_PHY_PAGE_EXTENDED, 0x14, 0, BIT(4));
+
+	/* Increase SlvDPSready time */
+	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
+	__phy_write(phydev, 0x10, 0xafae);
+	__phy_write(phydev, 0x12, 0x2f);
+	__phy_write(phydev, 0x10, 0x8fae);
+	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+
+	/* Adjust 100_mse_threshold */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x123, 0xffff);
+
+	/* Disable mcc */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xa6, 0x300);
+}
+
+static int mt7530_phy_config_init(struct phy_device *phydev)
+{
+	mtk_gephy_config_init(phydev);
+
+	/* Increase post_update_timer */
+	phy_write_paged(phydev, MTK_PHY_PAGE_EXTENDED_3, 0x11, 0x4b);
+
+	return 0;
+}
+
+static int mt7531_phy_config_init(struct phy_device *phydev)
+{
+	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
+		return -EINVAL;
+
+	mtk_gephy_config_init(phydev);
+
+	/* PHY link down power saving enable */
+	phy_set_bits(phydev, 0x17, BIT(4));
+	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, 0xc6, 0x300);
+
+	/* Set TX Pair delay selection */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x13, 0x404);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x14, 0x404);
+
+	return 0;
+}
+
+static struct phy_driver mtk_gephy_driver[] = {
+	{
+		PHY_ID_MATCH_EXACT(0x03a29412),
+		.name		= "MediaTek MT7530 PHY",
+		.config_init	= mt7530_phy_config_init,
+		/* Interrupts are handled by the switch, not the PHY
+		 * itself.
+		 */
+		.config_intr	= genphy_no_config_intr,
+		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.read_page	= mtk_gephy_read_page,
+		.write_page	= mtk_gephy_write_page,
+	},
+	{
+		PHY_ID_MATCH_EXACT(0x03a29441),
+		.name		= "MediaTek MT7531 PHY",
+		.config_init	= mt7531_phy_config_init,
+		/* Interrupts are handled by the switch, not the PHY
+		 * itself.
+		 */
+		.config_intr	= genphy_no_config_intr,
+		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.read_page	= mtk_gephy_read_page,
+		.write_page	= mtk_gephy_write_page,
+	},
+};
+
+module_phy_driver(mtk_gephy_driver);
+
+static struct mdio_device_id __maybe_unused mtk_gephy_tbl[] = {
+	{ PHY_ID_MATCH_VENDOR(0x03a29400) },
+	{ }
+};
+
+MODULE_DESCRIPTION("MediaTek Gigabit Ethernet PHY driver");
+MODULE_AUTHOR("DENG, Qingfang <dqfext@gmail.com>");
+MODULE_LICENSE("GPL");
+
+MODULE_DEVICE_TABLE(mdio, mtk_gephy_tbl);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
