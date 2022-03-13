Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPC7PoW2txW07CXwvJapFO/TVtnkX60HSXqG/5LcotQ=; b=L5ngRUHn581O8D
	gbh4xyJgSVXy5a9i3OHVJor11CrWlVzEa/6V5qyzoBW4nFMBUbjvUdMxVodkgsVvrs/w5mG3NPtMr
	0ncZGR1heY7SAy6wiWkC3dCpanhMX3tT/ItN56b8sgcpU9ysSgKqAA0UidaoCybTCJhGD1tSeLTdx
	fdyy2tHklqKE/o79lohw4WjPMzKinDHkqTCIGfCCyo6mFU56q76da24d+/t5f9C0zALUZJV6h1lB9
	Rst72jSL3KpUlSl1QdHXVaRReJ6OMg2j5IcIdyJA69kMIFI2CMFLa9MBwG/F4c7enZK0gpoSvbjPs
	nJoGGtBDakjpJzm5hWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTLrH-002aDK-Qs; Sun, 13 Mar 2022 10:53:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTLpc-002ZNt-E4; Sun, 13 Mar 2022 10:52:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19908B80CAC;
 Sun, 13 Mar 2022 10:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8ACC340FC;
 Sun, 13 Mar 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647168729;
 bh=+XUrxUNJJc78O+G+Ztb+zSl+5Iq7rWoIkMhUhvOheWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IG+X9wJ1YQpuJ79qHtaVUuZ9k1cWgA9Wts6EoW3UWDux4fElQnuv8sKbU14YuK1GF
 +7tjg3rOVRRUOL8EnEjnGZQ3K4XaRAY6gquOqf38M1Uh+tfb02Bzo3uk8GCd841ziJ
 7m+U+2fjAlX4wGc1vXBNrhSeJdJhTc4qrjK9C+JgDYsB2bHztmCiQ7AooqFtI8wNuC
 yXxgYNwmlPZJM9A5cCQ6NAyWusoFXMB617ie3O+eOS31X8c3Mi3k6Un4FhGRK9orQC
 rCN3UFOL04S0mnfDKB2n7ahehABI471RPQrJ9M9ikQKym0WsK+zqGzvoxj9yZh3j5x
 TcgdOEQfIJ4pQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTLpX-001I1g-1I; Sun, 13 Mar 2022 11:52:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
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
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 07/24] media: platform: rename mtk-vpu/ to mediatek/mtk-vpu/
Date: Sun, 13 Mar 2022 11:51:48 +0100
Message-Id: <e42fa23cbaa6aec532da7e9683553ee4091ed4b8.1647167750.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647167750.git.mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_035212_793258_D920DFC4 
X-CRM114-Status: GOOD (  11.77  )
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
See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/

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
index 8ba10b657164..33f8f41b2771 100644
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
