Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjdnRmDNzPxJNV2+8PP16uxh1hn+JIgT1vs9kf2Xf58=; b=MRnIQAbQY375Hu
	rSW59YIR0r7L6KQjae4x4sMEGYUuKlVOIhW7eSSqFra4liIsOEfNrXdP+u7ny+S2HnU4+YBw0pksl
	iL0AHK69LiKhZK7YO+NFbceRfOam3lPqKqSTLglevJ3iZvxR9LBe5hsxDB1BpPbd29d3YUHcfoor9
	HJcwfHob1c2JHFZDFfv04pRvMiggQqf+dM1pl5xdc6rJTfQAO4s69CG5QKGQYwWOHf1NCuW/yPeN8
	yqVBYllKuDOsuyEFyUAE9hvo52rt0fIhiJOeVBEe1k75B3vzdsbexY7tJQic448wz7CHoj6wGQC1D
	ip0zCwP8dmmmqWKBYSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTLsx-002bBU-FE; Sun, 13 Mar 2022 10:55:39 +0000
Received: from desiato.infradead.org ([90.155.92.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTLpk-002ZVc-B7; Sun, 13 Mar 2022 10:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZBiDiCLTNiwe4oJnh5EXAgHADZMGZ25T3+T32153og0=; b=mJlyQlCNGL0cMQy92FGmBZryRl
 BR02CgRcPQZJKxrY4vBVz7IaFAh+jlk+beoOaOuWoWz6rnGWJOBWNMsMuR5cojCQolLtPomVE0hch
 Jx5yP1pb2dSfsE3GT+YnThS4DP3b1vVnKKIuYmgi+nap3F9wFrm3FNXSn28oZi30lSKTIvLuPe5gr
 vQW+6yLeo8o1NWY9zWXChbMnOkXF+3hjT/eq0TJNAjEBteeN6MB5Mim8n33ERnrnkrkkvLpRnGukj
 tX1p1htMGONJtKLrmqZa4C7bUBvtlxMlfhSoTV+pUya2rCP1egPR1X8FLRzVEbsULzFEJ7Be6+Khu
 t4oyKEwA==;
Received: from ams.source.kernel.org ([145.40.68.75])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTLpe-000Uq4-Lq; Sun, 13 Mar 2022 10:52:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 586C4B80CC5;
 Sun, 13 Mar 2022 10:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD89C340FA;
 Sun, 13 Mar 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647168729;
 bh=HoopYOEpxuaYPaONTVhJjIO5eFHfFTSdNlpQocjOuNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KKBcRn2CzfXUR2sCEdms5vFAj4K7/mxfXAjBMFBzPriFIVdBakehntZwv0MjYlH+1
 LwkFzfobDbTnM02r2u9H7yAjufCIVkWG/gEQZSis4evNXz4RTOqCXPT1nePiPCb3AE
 cz+6+DyiIOnwDj+1ZtIkXl2aEscOA4Ztvy7+MjaoXMWvbP7FJln/8bOFDbJGwlUYsP
 p6uRpEHMJeS86/2BiCxws0uux7QpuAyPXG6HHd1nH2dGXNp9f402zxk1C+h6iQ68H1
 APjZ7d+IAbafL/Dgn9UBN8pz2RrkTMCdCImmQCtk9SOTJbr3JCEGMTShMqIJTmByG6
 TS17BB0kYuVrQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTLpW-001I1c-Vd; Sun, 13 Mar 2022 11:52:07 +0100
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
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Steve Cho <stevecho@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Yong Wu <yong.wu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 06/24] media: platform: rename mtk-vcodec/ to
 mediatek/mtk-vcodec/
Date: Sun, 13 Mar 2022 11:51:47 +0100
Message-Id: <53a632ce79c9d02673d7540e18d681f123afb801.1647167750.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647167750.git.mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_105214_879524_C4085DB9 
X-CRM114-Status: GOOD (  11.00  )
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
See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/

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
index a45fd3fe103e..8ba10b657164 100644
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
