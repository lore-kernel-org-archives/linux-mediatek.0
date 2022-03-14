Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0476C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9CaK4nCeyrbLrn3URWeS0BLjeipopsSMXzBglEDRE4=; b=bfE4sip8gHI6z8
	Urg1pa6qlOKTa75rbEesIPLKFgCMEGmcDQpDHwraJB4esWSPa+dXrj6voTQxSYxNk5PqG3aRu3Ntq
	iSstmlBWHMrHqKbJeEGEWrvrSc/6Hp5VU42Xw8+jPhRBtH9iZcB1lqaOwumI7gBS30cwDnIG2yX6p
	JXeW5aD/MbE2O6MpixmU41uH/xqDw0+qgIsBejvBWiU3oWQV8iuCUgUe5Up5plYucHGQKbX3AhlLk
	YYlrXZbTCM510voT9Yt1mGtRfR8QewTiDytI9qYUok5DXrkx6dJYCBO7W5UxJy1tVghH/tqRhGg2F
	NqgcaraJkQgGTid6as1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTo6u-006EqC-GI; Mon, 14 Mar 2022 17:03:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTo1a-006Cfr-56; Mon, 14 Mar 2022 16:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4M0Bq2vLaEyFELsVx131Gocr3J7WMw160LmQhjTvQ6w=; b=T/tt78Hy6HNGc97OkxS63hZxfB
 ezAlcys9SAO5rF40Mc1f5ZNObrbMas3EsmWy55l/0kEfkmKUMqxoKFMT/MW6+T46TuwdyEpo0GLK8
 iWDaCUZDGIicLMdCNyTZj4kBhOdMLwvYzzW95ecBGS8c1IcwFm5jZUKeErTWBaacoJtGjZH4NO2S1
 DBVMN9l+z70caa5AcdNJRXGwUzJy85l104490Y5sSAnz8AisNhJXKP10YKxhMMAjwzSlYLPrx4rvU
 RmfiWqhqCf7MhYC4EZsekzoqqLWuncTpzvJKYP9frZbF8/FzJ9fkBQNEaVgbj5lQ62Kms1cynuGPG
 lsus24Iw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnfF-004DRs-PO; Mon, 14 Mar 2022 16:35:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26376614A0;
 Mon, 14 Mar 2022 16:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA38FC36AE2;
 Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275709;
 bh=lXeLnqZ5Zmymy/mgfeMaIxAUlHmMCiEmJMsdC9TCZs0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F+jft0wgEdAZZ55ScSNXGngpwHnugRq5y24VcewiQgNeqze/dQFlQq4zaMTZtlIOl
 jv2aGKK6yzPhAriw+MEDLPFKeXuS9bfLFCRnxSxf8LJzaR8sku4KiOm8dIwnpJdgC6
 HTj9duKag2Pmekve4en33hnqETet16VPXej7MEmQUsBz/9uepc43Y++9+wtZZlPlpm
 7Wq9f/jmiGN3zo4sbcBnlBvMdNpbpJr0QE1woDf/tKBIjI89Ai1DJo+LXlAgisYvkQ
 oRcDE3l/b62c9vU9hRScZo9hDa+2VyG13yCdlhVvo/tSMkGXOXdzvxIq/ox+igWtza
 KLoj4cXw9UCNg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnf0-001wz6-N7; Mon, 14 Mar 2022 17:35:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Ding Senjie <dingsenjie@yulong.com>, Dmitry Osipenko <digetx@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Houlong Wei <houlong.wei@mediatek.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 46/67] media: platform: rename mtk-vpu/ to mediatek/mtk-vpu/
Date: Mon, 14 Mar 2022 17:34:41 +0100
Message-Id: <e2ad7e2692092f9f1a8277daf8df97691a06cd66.1647274407.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163522_068599_1DCA27DB 
X-CRM114-Status: GOOD (  11.34  )
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

As the end goal is to have platform drivers split by vendor,
rename mtk-vpu/ to mediatek/mtk-vpu/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 MAINTAINERS                                             | 4 ++--
 drivers/media/platform/Kconfig                          | 2 +-
 drivers/media/platform/Makefile                         | 2 +-
 drivers/media/platform/mediatek/mtk-mdp/Makefile        | 2 +-
 drivers/media/platform/{ => mediatek}/mtk-vpu/Kconfig   | 0
 drivers/media/platform/{ => mediatek}/mtk-vpu/Makefile  | 0
 drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.c | 0
 drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.h | 0
 8 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/Kconfig (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfe014870a77..58e0d42b1278 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12139,7 +12139,7 @@ M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
 F:	drivers/media/platform/mediatek/mtk-mdp/
-F:	drivers/media/platform/mtk-vpu/
+F:	drivers/media/platform/mediatek/mtk-vpu/
 
 MEDIATEK MEDIA DRIVER
 M:	Tiffany Lin <tiffany.lin@mediatek.com>
@@ -12148,7 +12148,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
 F:	drivers/media/platform/mediatek/mtk-vcodec/
-F:	drivers/media/platform/mtk-vpu/
+F:	drivers/media/platform/mediatek/mtk-vpu/
 
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 10055af0c7f8..a9ad0c3bd0cc 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -81,7 +81,7 @@ source "drivers/media/platform/marvell/Kconfig"
 source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
 source "drivers/media/platform/mediatek/mtk-vcodec/Kconfig"
-source "drivers/media/platform/mtk-vpu/Kconfig"
+source "drivers/media/platform/mediatek/mtk-vpu/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 source "drivers/media/platform/omap3isp/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 637a3a7ac036..954ad8f2cde1 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -21,7 +21,7 @@ obj-y += marvell/
 obj-y += mediatek/mtk-jpeg/
 obj-y += mediatek/mtk-mdp/
 obj-y += mediatek/mtk-vcodec/
-obj-y += mtk-vpu/
+obj-y += mediatek/mtk-vpu/
 obj-y += nxp/
 obj-y += omap/
 obj-y += omap3isp/
diff --git a/drivers/media/platform/mediatek/mtk-mdp/Makefile b/drivers/media/platform/mediatek/mtk-mdp/Makefile
index 5982d65c9971..eab6f984aeea 100644
--- a/drivers/media/platform/mediatek/mtk-mdp/Makefile
+++ b/drivers/media/platform/mediatek/mtk-mdp/Makefile
@@ -7,4 +7,4 @@ mtk-mdp-y += mtk_mdp_vpu.o
 
 obj-$(CONFIG_VIDEO_MEDIATEK_MDP) += mtk-mdp.o
 
-ccflags-y += -I$(srctree)/drivers/media/platform/mtk-vpu
+ccflags-y += -I$(srctree)/drivers/media/platform/mediatek/mtk-vpu
diff --git a/drivers/media/platform/mtk-vpu/Kconfig b/drivers/media/platform/mediatek/mtk-vpu/Kconfig
similarity index 100%
rename from drivers/media/platform/mtk-vpu/Kconfig
rename to drivers/media/platform/mediatek/mtk-vpu/Kconfig
diff --git a/drivers/media/platform/mtk-vpu/Makefile b/drivers/media/platform/mediatek/mtk-vpu/Makefile
similarity index 100%
rename from drivers/media/platform/mtk-vpu/Makefile
rename to drivers/media/platform/mediatek/mtk-vpu/Makefile
diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.c
similarity index 100%
rename from drivers/media/platform/mtk-vpu/mtk_vpu.c
rename to drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.c
diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.h b/drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.h
similarity index 100%
rename from drivers/media/platform/mtk-vpu/mtk_vpu.h
rename to drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.h
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
