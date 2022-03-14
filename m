Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bf90BiMtx9Qhxhy0WfymokbHv7Fv0qKos4mHH+iR4ws=; b=car8zCnRL+/VLb
	lT1zI9ogv8K++00BIOSS+IYWNEMTUt5A+5vFBPWAtzbdmv5grRV+mKjtsxOCehTBtaH/TPwJnZ+WY
	PDM1eMFDxLdAizr1LLIQ+0FvUC4A+/nQb2MEIK6RizXYfSA6P2vjp69GdZvl249Ve+MFGKftVCcMI
	GYbvP0K+wvNVBsE3G4ebtzTHqSYuGVV15iq7305tguyE9gGOaA04PX+gfHITAvdhFD3sxZ69vZdQF
	RaiKM1d2ovXM6YNRKZ4IxQBNj+1hRG0aJHN/jkezMS25l6KPg5d0FPnigCVIw/PX+/Izj0GqnDPbM
	1JUIOk9OVVsHXV6NtMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nToJn-006Jts-Lb; Mon, 14 Mar 2022 17:17:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nToD6-006HQe-FO; Mon, 14 Mar 2022 17:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bQz+DZspKO2NlWA3xRfNA8zOrjj317q6BL7C8mxOhzY=; b=OIsgdnO4QzBd/zye/6EHEYcm8i
 4hK9LRaGPzXPMIpkaptycd8MBA4mZ1KSiPMDZ8xw9t4FFr/N3bD4997xdIJftg1I3fz/84RzJnb17
 ur9E8sAe+GW9zJIAO+qTtHp9JIVaajD07RwzTrpmMlbSj2PvaIyhzD+M790Ot9lXDLWb7TaNy+6zT
 zqFd8Kx3UnGjB1CS8ONe7AVxiqsYFs756w/pf1ElaXFra9gaFGntjFS/gtUUERKaj8BBOrr014fto
 IbCtthxGcfUOz++Jv5tVhjgOGQtvPdqJnXTL8KMmDreQJQFUuIVuFaRJeFJkgwmz+yvY035BFGRAO
 ZiwhxiYg==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnf9-000uIb-3E; Mon, 14 Mar 2022 16:35:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76BF3B80EB5;
 Mon, 14 Mar 2022 16:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD372C36B06;
 Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275709;
 bh=o0gupAW6zbpEXw379aWkja/Syw8JErkoJTYi3M7B6GY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDLZKE8pzceQfB1nZ5Hb+YpMglx7/H8cFhCFRIYtzkWJAjSahd+hnyXuG3GZLlimg
 OoRJaQcfcPFbMQI/w+2Rrev9P/HkZf4EjqBHKFsSrcCG9v+JRGfGYrOy28yDLfEpYh
 i5VhGUXlAUkNos7ntfwIa7Lcu4FcguDjfd8/Epv5pytnK9jO5rmj5l/jaWZAOFP8lB
 ksz0Vkk1mXuPu5wPSFajmE3l04FdZpZxbGrKLsK1yg57ctw0yAOVNH8yb/hitnkEdv
 R77PtV9ItvCTb38jJvHmKsPnmypqVwS7Geh0Yh4ZunAijWCvjROPnTtRT5zaBljXDe
 7/0DLDHHtSdvA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnf0-001wz2-LR; Mon, 14 Mar 2022 17:35:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Alexandre Courbot <acourbot@chromium.org>,
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Steve Cho <stevecho@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Yong Wu <yong.wu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 45/67] media: platform: rename mtk-vcodec/ to
 mediatek/mtk-vcodec/
Date: Mon, 14 Mar 2022 17:34:40 +0100
Message-Id: <01e83934b803e54c5712731d5fe523eb5bd4db99.1647274407.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163515_449330_D4595B86 
X-CRM114-Status: GOOD (  11.26  )
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

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

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
