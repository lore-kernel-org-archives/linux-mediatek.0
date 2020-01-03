Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E54C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 16:47:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C58D12072C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 16:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMQZ5dbO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnURXQXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C58D12072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=08bxXrnszOpwtjXaW9T5/QypFKIu3+jOCq1/yAVxcAQ=; b=uMQ
	Z5dbOrRnT0tknr0K7HIXOa5r+h75jm5L+8bcge89GeyGogwtOQPHfmWZ1ZEpUyh3Va5mdu6aMtIKQ
	0sL2ev3MSQBKF5Jxjbj7DhJ/wxerkXaRiLkg1kjWn/AN5EV2zINHuW8sVU0i8pvbu7lz33pZjN/x5
	WizUAEIeACDZNjxNL9BzSrmRcaQllLn07czZRyCqMNeZ1aRk/yg4Uh7C1tndkHf9bTGzGFQZ4eEnC
	R94vFqRlz5D1hcOErkg5t1tCdbglGdVM/azrd0teQ9beGD9rMQ9JV2DQlHgWM4bL9k2kik+4dnNRJ
	+2j9mHzPH/lXD0viI1OWA0uEpBRCZww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inQ6l-0006TQ-AD; Fri, 03 Jan 2020 16:47:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inQ6b-0006Hv-Vu; Fri, 03 Jan 2020 16:47:23 +0000
Received: from localhost.localdomain (unknown [194.230.155.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89CB92072C;
 Fri,  3 Jan 2020 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578070041;
 bh=6X5A46t01A3B94izlLbWPVwVfTKnq8mB/NEvKSeTiYU=;
 h=From:To:Cc:Subject:Date:From;
 b=hnURXQXIcZParjC2p7Erx4qCw7NyJeBsZWa3s9Sn5Q7mrqM0IdZE81fOQX+KDl6Em
 IhokR6mxJL1yVTqUNuexJ9uvdTw6N2KQcS+J9Oz6K+ZwEGGmqlqlipPOx1K/tyx07r
 F8PbFfYmNF0//KGEzifXF8wxbEdYATJsLycPp8FA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] phy: mediatek: Fix Kconfig indentation
Date: Fri,  3 Jan 2020 17:47:09 +0100
Message-Id: <20200103164710.4829-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_084722_051235_C267C7DD 
X-CRM114-Status: GOOD (  11.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/phy/mediatek/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 376f5d189da0..7d19134c6b7c 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -3,12 +3,12 @@
 # Phy drivers for Mediatek devices
 #
 config PHY_MTK_TPHY
-    tristate "MediaTek T-PHY Driver"
-    depends on ARCH_MEDIATEK && OF
-    select GENERIC_PHY
-    help
-      Say 'Y' here to add support for MediaTek T-PHY driver,
-      it supports multiple usb2.0, usb3.0 ports, PCIe and
+	tristate "MediaTek T-PHY Driver"
+	depends on ARCH_MEDIATEK && OF
+	select GENERIC_PHY
+	help
+	  Say 'Y' here to add support for MediaTek T-PHY driver,
+	  it supports multiple usb2.0, usb3.0 ports, PCIe and
 	  SATA, and meanwhile supports two version T-PHY which have
 	  different banks layout, the T-PHY with shared banks between
 	  multi-ports is first version, otherwise is second veriosn,
@@ -25,10 +25,10 @@ config PHY_MTK_UFS
 	  specified M-PHYs.
 
 config PHY_MTK_XSPHY
-    tristate "MediaTek XS-PHY Driver"
-    depends on ARCH_MEDIATEK && OF
-    select GENERIC_PHY
-    help
+	tristate "MediaTek XS-PHY Driver"
+	depends on ARCH_MEDIATEK && OF
+	select GENERIC_PHY
+	help
 	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
 	  USB3.1 GEN2 controllers on MediaTek chips. The driver supports
 	  multiple USB2.0, USB3.1 GEN2 ports.
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
