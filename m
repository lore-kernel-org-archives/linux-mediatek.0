Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE39C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdZRgg9vsjmpvlTVlQ1CCRDjT3Cm3tBBrOK0C4habeE=; b=H0WB9w9Ny5W/uN
	lCAlJu5Elso8deM3CR/y1yxtSUMrCfj4TXH8ZiQEPhwYNLDcxjhhW0HIHG5hmnOrSZJUpFMWKAu2d
	YzyYbVF9R46vtLSgDdtdWCwkknhn357KiI7lhDwY8IIzcHUaLySlJu1bvBm/plGoqOSvCIvHj8ACq
	GKkC4px/wQCSaI2Wu2YBBp225A+qGTW2fwP+fCZnrrAG7VC0J/3JuGvP/ePIShyRsMTv+/hJzusZh
	c9DOQ7TYGNJwLD1bImdwf3ZfVW6AzlKtfYXtZ9lwTfvZgwX6mmsc7iTGxZ3uObVhld4T1TSOecYI5
	d/xRF/4yqzmhhyGBJREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTgBt-004X1L-Jo; Mon, 14 Mar 2022 08:36:33 +0000
Received: from desiato.infradead.org ([90.155.92.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfpd-004LzU-MZ; Mon, 14 Mar 2022 08:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=gi8R+MUpCdCfceM50UNz5SULmX3Kc8t3R2X0l3L+IaA=; b=eyYMc5UgPyhXPTl8odrxRZh20r
 NwU9UkExbIgt3iwlgPsUOyGbW3GiOFvwhckAa6GPC3qPMCkRYbpZTSRU/cpU0yEjlyAP6Y+lEcdxl
 PGFaZhYYPbdSXAsxJd8z71nLFsRkT9c/abP8rluwCKLHkhm+TY+W/mERIPeb20dypdIBv39/2+izc
 kDDAoOA2jWlZBgn4Z3z+Zqrrxos2V8hZvTcGc+HydHZ/8Y3J44yNmp1pwwyAvQuamcUa684gZ3OgI
 /jhr8bbX4WLgZtqGptd5lq0zV23x7y+FfsTmZPv3Iv+IiJwJeABBqTOz5wA3+0nCT2k2gTCV+0fqj
 /BHzI7Sg==;
Received: from ams.source.kernel.org ([145.40.68.75])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfYm-000kPf-Dp; Mon, 14 Mar 2022 07:56:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01CEDB80D5E;
 Mon, 14 Mar 2022 07:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0A6C36B09;
 Mon, 14 Mar 2022 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647244562;
 bh=n/UoFSRaEnwbl3Y+dHXeARVN1a8H5ZurI28WAt99CBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CJtyxpCO+e5bOhMzPTFrXJCWExC2+TNTBp4gJdfiwvRo2Mvt2NWff2K5YmBS7rGY+
 Urm+10X7yKPXSWU/nAeHVEvniNBAeV9+FX/Z8dLrjVDbCn9KI8/ymtPXVqPqqOFQU2
 Finmtzjh2TifpQ3lSE1wPlcuwofXCsI+3nsn8XLKCE+JG71gyBJfN+EJihVf4U4Cdv
 GxYLKMyH3SuxYivbaPFfgRbHLsAQv6FvxUUUagPnNxpMRAfb2ptjIFm3UVwz8ADvTO
 inB+x4ZEt9pDyArlajriFFbXlPQDL86k3SloBfqhqM2Yr2aK5fXC4R0TK8jPkKEooo
 lQdOBHKmrIQug==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTfYe-001kX5-5X; Mon, 14 Mar 2022 08:56:00 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Alexandre Courbot <acourbot@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hirokazu Honda <hiroh@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Steve Cho <stevecho@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 45/64] media: platform: rename mtk-vcodec/ to
 mediatek/mtk-vcodec/
Date: Mon, 14 Mar 2022 08:55:37 +0100
Message-Id: <b0cdc623854d49bf1510765f05bce6b003adee45.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_075608_646940_578283A4 
X-CRM114-Status: GOOD (  11.15  )
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
rename mtk-vcodec/ to mediatek/mtk-vcodec/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 MAINTAINERS                                                     | 2 +-
 drivers/media/platform/Kconfig                                  | 2 +-
 drivers/media/platform/Makefile                                 | 2 +-
 drivers/media/platform/{ => mediatek}/mtk-vcodec/Kconfig        | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/Makefile       | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec.c   | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec.h   | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_drv.c     | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_hw.c      | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_hw.h      | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_pm.c      | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_pm.h      | 0
 .../{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_stateful.c         | 0
 .../{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_stateless.c        | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_drv.h   | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc.c   | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc.h   | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_drv.c     | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_pm.c      | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_pm.h      | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.c    | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.h    | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_priv.h     | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_scp.c      | 0
 .../platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_vpu.c      | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_intr.c  | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_intr.h  | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_util.c  | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_util.h  | 0
 .../platform/{ => mediatek}/mtk-vcodec/vdec/vdec_h264_if.c      | 0
 .../platform/{ => mediatek}/mtk-vcodec/vdec/vdec_h264_req_if.c  | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_vp8_if.c | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_vp9_if.c | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_base.h    | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_if.c  | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_if.h  | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_ipi_msg.h | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/vdec_msg_queue.c   | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/vdec_msg_queue.h   | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_vpu_if.c  | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_vpu_if.h  | 0
 .../platform/{ => mediatek}/mtk-vcodec/venc/venc_h264_if.c      | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/venc/venc_vp8_if.c | 0
 .../media/platform/{ => mediatek}/mtk-vcodec/venc_drv_base.h    | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_if.c  | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_if.h  | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_ipi_msg.h | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_vpu_if.c  | 0
 drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_vpu_if.h  | 0
 49 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/Kconfig (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_drv.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_hw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_hw.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_pm.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_pm.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_stateful.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_stateless.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_drv.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_drv.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_pm.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_pm.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_priv.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_scp.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_vpu.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_intr.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_intr.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_util.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_util.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_h264_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_h264_req_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_vp8_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_vp9_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_base.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_if.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_ipi_msg.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_msg_queue.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_msg_queue.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_vpu_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_vpu_if.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc/venc_h264_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc/venc_vp8_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_base.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_if.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_ipi_msg.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_vpu_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_vpu_if.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2203d98bbcf1..bfe014870a77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12147,7 +12147,7 @@ M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
-F:	drivers/media/platform/mtk-vcodec/
+F:	drivers/media/platform/mediatek/mtk-vcodec/
 F:	drivers/media/platform/mtk-vpu/
 
 MEDIATEK MMC/SD/SDIO DRIVER
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 8a7ac0b8e09f..10055af0c7f8 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -80,7 +80,7 @@ source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell/Kconfig"
 source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
-source "drivers/media/platform/mtk-vcodec/Kconfig"
+source "drivers/media/platform/mediatek/mtk-vcodec/Kconfig"
 source "drivers/media/platform/mtk-vpu/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6f5d09cd8f9b..637a3a7ac036 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -20,7 +20,7 @@ obj-y += intel/
 obj-y += marvell/
 obj-y += mediatek/mtk-jpeg/
 obj-y += mediatek/mtk-mdp/
-obj-y += mtk-vcodec/
+obj-y += mediatek/mtk-vcodec/
 obj-y += mtk-vpu/
 obj-y += nxp/
 obj-y += omap/
diff --git a/drivers/media/platform/mtk-vcodec/Kconfig b/drivers/media/platform/mediatek/mtk-vcodec/Kconfig
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/Kconfig
rename to drivers/media/platform/mediatek/mtk-vcodec/Kconfig
diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mediatek/mtk-vcodec/Makefile
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/Makefile
rename to drivers/media/platform/mediatek/mtk-vcodec/Makefile
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_drv.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_drv.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateful.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateful.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateless.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateless.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_drv.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_drv.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_drv.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_drv.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_priv.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_priv.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_scp.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_scp.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_vpu.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_vpu.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.h
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.c
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
rename to drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.h
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_if.c
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_req_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_req_if.c
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp8_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp8_if.c
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp9_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp9_if.c
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h b/drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_base.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_drv_base.h
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_base.h
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_drv_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.c
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_drv_if.h
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.h
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mediatek/mtk-vcodec/vdec_ipi_msg.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_ipi_msg.h
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.c
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.h
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.c
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
rename to drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.h
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mediatek/mtk-vcodec/venc/venc_h264_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/venc/venc_h264_if.c
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mediatek/mtk-vcodec/venc/venc_vp8_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/venc/venc_vp8_if.c
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_base.h b/drivers/media/platform/mediatek/mtk-vcodec/venc_drv_base.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc_drv_base.h
rename to drivers/media/platform/mediatek/mtk-vcodec/venc_drv_base.h
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc_drv_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.c
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc_drv_if.h
rename to drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.h
diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mediatek/mtk-vcodec/venc_ipi_msg.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
rename to drivers/media/platform/mediatek/mtk-vcodec/venc_ipi_msg.h
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.c
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc_vpu_if.c
rename to drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.c
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.h
similarity index 100%
rename from drivers/media/platform/mtk-vcodec/venc_vpu_if.h
rename to drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.h
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
