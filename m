Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A976C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 13:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B661422AAE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 13:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B661422AAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/IvuUPIXNoVO8O3tf9Br+Og9Mj+1lKAuoiP9xL4q6Hs=; b=U1MVzMjKFgYImQJIAaJQCxEEqr
	WGehqdsIbSEN6KQQ2xQbFOUZ6H+xC9WBavdZIh00hWMNoH97zl6rTZ8A3ld9vNzgScowSxmmHe0MI
	iPKhU6dzTND0yze1pJ9j3i644fWCMaf1nkuiew+bVJym83+jIar42K2GaSRJwxhILYKMqdfSL6ZI9
	Ps5biMspbcdM27svU6EaR2F8SNitWBZpqlpy6bxZybmfE1sBT0UCmUsu7PEEvd+2xXnrj/JJ5TOay
	KgsCEr5O20amAs4ZkOAEfUdcZPZ8E+CD3NZ7EJKFU3vimkLF0G+OIEKvn0/O00dIr4tIJMUoKRMwC
	vt3HwbWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klBa0-0000qD-5W; Fri, 04 Dec 2020 13:57:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klBZw-0000pH-9v; Fri, 04 Dec 2020 13:56:57 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] [v2] phy: mediatek: allow compile-testing the hdmi phy
Date: Fri,  4 Dec 2020 14:56:43 +0100
Message-Id: <20201204135650.2744481-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_085656_417199_F8CC7DAE 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org,
 Colin Ian King <colin.king@canonical.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing the DRM_MEDIATEK_HDMI driver shows two missing
dependencies, one results in a link failure:

arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function `mtk_hdmi_phy_probe':
phy-mtk-hdmi.c:(.text+0xd8): undefined reference to `__clk_get_name'
arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x12c): undefined reference to `devm_clk_register'
arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x250): undefined reference to `of_clk_add_provider'
arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x298): undefined reference to `of_clk_src_simple_get'

The other one is a harmless warning:

WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
  Depends on [n]: ARCH_MEDIATEK [=n] && OF [=y]
  Selected by [y]:
  - DRM_MEDIATEK_HDMI [=y] && HAS_IOMEM [=y] && DRM_MEDIATEK [=y]

Fix these by adding dependencies on CONFIG_OF and CONFIG_COMMON_CLK.
With that done, there is also no reason against adding
CONFIG_COMPILE_TEST.

Fixes: b28be59a2e26 ("phy: mediatek: Move mtk_hdmi_phy driver into drivers/phy/mediatek folder")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: reword changelog text
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
