Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4C0C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 13:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B2420B1F
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 13:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B2420B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZjgQlfAA/B8bM1dDP3L+JLe33oud66CmLCa+Vq8hpK0=; b=1vSgqWpiBmzfa4iXt8Xu/gwl1l
	EklXqSIQk2b8Fc0eBATPsq0pQt1mazSLfzwdYmEw6kn3/8S/LXWEsWrmq1wS+guuHYwt3xmjIK8JF
	NCD3e8UEdqSPcOhd4zv4VH0A35bRo5tw3jO3n8QJlhs9zE+kXB6I+F24+IKc2i8kX7sqTCeKV9CHk
	optDJn4NvTtB8Wc/l06wNytB3S33IZ8HRdvWk92O9Kob4pl3eTH4VXBSzo6jPFEL+s/mLF2rxeg/l
	QzweKJYA6TtguWf1GZOpCCNgu1aoWcfiRBRYcb7Pm940ALPBP0x72dKY/MPkPxA+eW7k0dKipl5Sj
	39LZc8Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw3r7-0008P7-F0; Sun, 03 Jan 2021 13:55:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw3r4-0008Nw-4i; Sun, 03 Jan 2021 13:55:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F28B20DD4;
 Sun,  3 Jan 2021 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609682129;
 bh=I8/8m7XCo+o6DMFOKhb0sO1ao1C/CETgg0rwagCHQ9I=;
 h=From:To:Cc:Subject:Date:From;
 b=CvjWPqsDDh4uOEMJz6NAAWmjjOgY83/ejjwLjzMLyMFXYNejmeMG2oeGHwZOTAStW
 /si/MEn1LNJ7SnN63AmLQPJ5xWf3L+16RGB4qo54nJiX0b+pa8EQsTbGlGz4k+OCfz
 R/mLmhpxEXT5MKmD6JRSLcQWHApy4ZUpTD7+RPfvlxY+MQlXelQOAfhjHZbZSgV1CH
 FG6Cc+LA7IFYQFBuPDH+RtDlmPlcE9IY5EI1VTVYe+I0NRaxwFot5khnMTePXP/2i3
 9j1+QyR2SJQSZeL9CRDchDQT4ys7QhbqEc7dqAJUyMWRkebyVFZQmZ9hwjRGYyuwAo
 HDvJmwEYboxpQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] phy: mediatek: allow compile-testing the dsi phy
Date: Sun,  3 Jan 2021 14:55:17 +0100
Message-Id: <20210103135524.3678664-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_085534_252147_AB3B55DF 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds show another broken dependency:

WARNING: unmet direct dependencies detected for PHY_MTK_MIPI_DSI
  Depends on [n]: ARCH_MEDIATEK [=n] && OF [=y]
  Selected by [m]:
  - DRM_MEDIATEK [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_MEDIATEK [=n] || ARM [=y] && COMPILE_TEST [=y]) && COMMON_CLK [=y] &&
HAVE_ARM_SMCCC [=y] && OF [=y] && MTK_MMSYS [=y]

This is similar to the hdmi driver I fixed earlier, and I guess the
common-clk bug would sooner or later also manifest here, so just use
the exact same solution I chose for the other driver, and hope that
any future drivers just copy it from here.

Fixes: 90f80d95992f ("phy: mediatek: Move mtk_mipi_dsi_phy driver into drivers/phy/mediatek folder")
Fixes: f5f6e01f9164 ("phy: mediatek: allow compile-testing the hdmi phy")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/mediatek/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index d38def43b1bf..55f8e6c048ab 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -49,7 +49,9 @@ config PHY_MTK_HDMI
 
 config PHY_MTK_MIPI_DSI
 	tristate "MediaTek MIPI-DSI Driver"
-	depends on ARCH_MEDIATEK && OF
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on OF
 	select GENERIC_PHY
 	help
 	  Support MIPI DSI for Mediatek SoCs.
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
