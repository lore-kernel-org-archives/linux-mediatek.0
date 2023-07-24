Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D18C0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6aTOMltWWEwleVk4QXZysyc67GMhKSpOVID6QKcz/Q=; b=DiD+sbxhzuAFyfhsWAatBdohQ/
	r0OtGWuVPz4K5ZjsHSdlIA65QYT7I7bRTbvPD6Z4P43Ken01xI8RMVtISi4TKaYfn0I5ff0ShGxET
	+fMzlvF7470cnK1LYcw/NHCi04w2/sKtEq7PAI1Zuy8YMOuJBgyW5dgq28lEwMFjBBeVCZABTcuuI
	vRTNb8SRrLO1Drjav0LhV/odI7mbgOv+knYvmJsozxVr3d9HnIa8jNzsdNcg/cn5vt1b7ArNRBFYI
	6Sg2iCUTNAxS0OU1cTLuM9bD/dSFfBexOpAxVpuaD9lfJLRJTMJbuTtCsK69WDfm2+869ZCJbdqwk
	V9YqBQXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO2xc-005S1M-0g;
	Mon, 24 Jul 2023 21:19:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO2xY-005S08-35;
	Mon, 24 Jul 2023 21:19:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D81B61423;
	Mon, 24 Jul 2023 21:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B491C433C7;
	Mon, 24 Jul 2023 21:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690233553;
	bh=Kj3XfjZcezJ9YNhnOjElUCHift7/ySxvviPokSxuUfw=;
	h=From:To:Cc:Subject:Date:From;
	b=N20CdsGLjqTiQ1aVBymIuJeFt3sAkR8Xs1S7Xrei7URkWIFKMPxKhvZ7JzBAY/tZ6
	 qeTGRI23GVQlJFw1i/SX6IMCz6HlvbNT4Q9ktfo82y4YZRKyIZm7Iz5GBX2naAD0La
	 qhqGFY8QH33p0o4SGOfIRjTR5tUrDGDLgjopTQ44GGbgm+Nb8P/GSwNyCwKtR1YAi+
	 lrDqOHcF6gCnWmjZR66gSRQlh3rrdfLvOzOqozasSXt7W3z6DbqQa8H4kqld8Vcmjy
	 1EAvGj1phm/OfwT+nNWqHbtxEHMUq5UvGv9dZecMisg1azwXg1WCKoqPgkmDGHaCeu
	 BXxlaySrNaymg==
Received: (nullmailer pid 805831 invoked by uid 1000);
	Mon, 24 Jul 2023 21:19:11 -0000
From: Rob Herring <robh@kernel.org>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] net: phy/pcs: Explicitly include correct DT includes
Date: Mon, 24 Jul 2023 15:19:05 -0600
Message-Id: <20230724211905.805665-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_141917_080037_4BF04887 
X-CRM114-Status: GOOD (  13.61  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Split out can, dsa, wireless, phy/pcs to separate patches
---
 drivers/net/pcs/pcs-rzn1-miic.c   | 1 +
 drivers/net/phy/marvell-88x2222.c | 1 -
 drivers/net/phy/mediatek-ge-soc.c | 2 --
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 323bec5e57f8..e5d642c67a2c 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -12,6 +12,7 @@
 #include <linux/of_platform.h>
 #include <linux/pcs-rzn1-miic.h>
 #include <linux/phylink.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
 
diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index f83cae64585d..e3aa30dad2e6 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -14,7 +14,6 @@
 #include <linux/mdio.h>
 #include <linux/marvell_phy.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/sfp.h>
 #include <linux/netdevice.h>
diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index 95369171a7ba..da512fab0eb0 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -2,8 +2,6 @@
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/phy.h>
 
-- 
2.40.1


