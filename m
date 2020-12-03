Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE213C19425
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 22:54:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B39A223E4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 22:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B39A223E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NI9Ys3BsviT9+2YBk651fXDBuysjMZKBZneozfV6g8E=; b=iwSalU90aoUX70kbtT8bZ/8C9O
	Pzko3Ay9bkUOb0Zx4DJCHcv/V2cv90PVY9HoiOS7ibBgQW8TVV9vbf7gdULDr834I/fuf9rPMFdFR
	bW/aiQPgPgquxp/zAIJsCckcQ1mqSet1ng+Cv+QrnZmJ2VpNMbZuevWu8gbvIIlnNVz0x4lq7WJJK
	M3iRs+wZ8GQNdSpI5l/DLrCOZEelkLvwIiK/NGyzQwFIvGdNIUoqz+edu3NMP8cQ3kFSl5h6NjR4G
	B6lC1BrHUgU0gTc0DsvXExy32G1k0DAtrHfQgE2JaJU/2XHrO7CcaVT3r0Tg5HGXkzHUi1iMboBCA
	DKx4U4CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkxUb-0007k1-2j; Thu, 03 Dec 2020 22:54:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkxUW-0007iG-OU; Thu, 03 Dec 2020 22:54:25 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH] phy: mediatek: allow compile-testing the hdmi phy
Date: Thu,  3 Dec 2020 23:54:02 +0100
Message-Id: <20201203225418.1477560-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_175424_874282_BE51A594 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing the DRM_MEDIATEK_HDMI driver leads to a harmless
warning:

WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
  Depends on [n]: ARCH_MEDIATEK [=n] && OF [=y]
  Selected by [y]:
  - DRM_MEDIATEK_HDMI [=y] && HAS_IOMEM [=y] && DRM_MEDIATEK [=y]

The driver builds fine, so allow compile-testing it as well
to get rid of the warning.

Fixes: b28be59a2e26 ("phy: mediatek: Move mtk_hdmi_phy driver into drivers/phy/mediatek folder")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/mediatek/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 65ed26e40c9f..29a85b2738f8 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -40,7 +40,9 @@ config PHY_MTK_XSPHY
 
 config PHY_MTK_HDMI
 	tristate "MediaTek HDMI-PHY Driver"
-	depends on ARCH_MEDIATEK && OF
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on OF
 	select GENERIC_PHY
 	help
 	  Support HDMI PHY for Mediatek SoCs.
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
