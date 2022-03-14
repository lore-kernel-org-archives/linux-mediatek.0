Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E87C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0mXbzSi3lfMlf90A7AsqsbiHVEuYhcgmOCrkZ0BpPs=; b=b7sw4Nk/eWlrTe
	d9gW9TBejj9DXadH2ivHGHPgJtmSeBNi4HF74wi5G69awWaEKZLRy8MbrVhmXqT/YRUdYPg8m3PkI
	HtCzI8Dnrfg3jAmo7baWe3NeDiD6H1d4nVAWYBgARspUcbO3KV/T/6QRzqpvv2Qv5Ssd6GorCUECE
	HGv5VovTOvtLGO+a7eDRIPL5IZ6ts5pa8t9iLQX34lnfP2A19R5uilqLfYATRJvHRnOIvqXUQj063
	ieOwZThEnSMSlo6nujkgrxgSBIa78gPu1wl9fsiB5kSkPXtUxIv5XJ2n6iNuOHs34YeF9e7/kbJXa
	MRe8QnJfE5a4OMQuwI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nToJk-006JsB-1i; Mon, 14 Mar 2022 17:17:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nToD5-006HQe-2j; Mon, 14 Mar 2022 17:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rDZtvruqxz7DRnWpFA0QoKwPt82SYnjArFtNLkYPyPw=; b=F6rxVibTQusxitbO3WgyMObqqR
 8IQT9gljvfqM9krht5x37VDDok9WbR91EPGNOsliJ5eJ39LgHlA+T4f3gHGd2MXBqomn6OR1hYCGt
 LN7pBR7Nt+jBT1zIhj5zVYvZTKBem/x7nlJYxwVTueaHPIh03PvCh/QOThTFKimO6Qnt1Z6U4I7BZ
 6hfCjmJG82+85vncwIrR2C2gLOaEDn6MUkXGCEw6RlzsonKq7ssaBkw/vWY0GGvU8+Ycki2aXQmr3
 DeLkQMqGEqf2ieZbCl3u2XjMqS1CYhcpO5o2vdeXCCW8HhmJszMXjXHC8AAv3Mmsfg16qYZRynSON
 Je0UZw1w==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnf9-000uIY-1z; Mon, 14 Mar 2022 16:35:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24E16B80EC6;
 Mon, 14 Mar 2022 16:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63831C36AF2;
 Mon, 14 Mar 2022 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275710;
 bh=oXzvkGdwbB6HW9GK/IZizvDPe4hOuT+RXwBX5+8EZ3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UqBGLJw3D1GYo7+Ej/k3krCEhclwV3dYYYbJrHm2MhMRuVZC0qZ3YtKZSVA481c4D
 W2UMyJ3qMpuvygiAQ5Iaz1arzcjl2X7ecaUwf6YKanVIYKCN01h40VseiTWgIZHLXc
 5zuuYeFiwNezon1b3Lm3B3X04XRO3pmFZ09adrMf8xs4Ze+lKR3/K9lJKxN0vtKdxy
 Bg8KXhJ0JStoWFTg14QN1Vc8Esfr0nlENllY08NffQ9b2+RA+Y3na+1PSBWwV2jrPx
 edwSRB5SeSts0CC0X3jUbNA8B+c/bIAFByHJWIoFfttqXtYmjQ5gzXx7mqkdtVGb4W
 dQvZp812wokwg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnf2-001x8A-63; Mon, 14 Mar 2022 17:35:08 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>, Bin Liu <bin.liu@mediatek.com>,
 Cai Huoqing <caihuoqing@baidu.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Colin Ian King <colin.king@intel.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Ding Senjie <dingsenjie@yulong.com>, Evan Green <evgreen@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hirokazu Honda <hiroh@chromium.org>,
 Houlong Wei <houlong.wei@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Rick Chang <rick.chang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Xu Wang <vulab@iscas.ac.cn>, Yong Wu <yong.wu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 67/67] media: platform: rename mediatek/mtk-jpeg/ to
 mediatek/jpeg/
Date: Mon, 14 Mar 2022 17:35:02 +0100
Message-Id: <a7d36ceef06723b2c7f11f77d048566c3a81107f.1647274407.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163515_457771_BDAB094C 
X-CRM114-Status: GOOD (  11.46  )
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
rename mediatek/mtk-jpeg/ to mediatek/jpeg/.

Requested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 MAINTAINERS                                            | 10 +++++-----
 drivers/media/platform/mediatek/Kconfig                |  8 ++++----
 drivers/media/platform/mediatek/Makefile               |  8 ++++----
 .../media/platform/mediatek/{mtk-jpeg => jpeg}/Kconfig |  0
 .../platform/mediatek/{mtk-jpeg => jpeg}/Makefile      |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_core.c        |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_core.h        |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_hw.c      |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_hw.h      |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_parse.c   |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_parse.h   |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_reg.h     |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_enc_hw.c      |  0
 .../mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_enc_hw.h      |  0
 .../media/platform/mediatek/{mtk-mdp => mdp}/Kconfig   |  0
 .../media/platform/mediatek/{mtk-mdp => mdp}/Makefile  |  2 +-
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_comp.c  |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_comp.h  |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_core.c  |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_core.h  |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_ipi.h   |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_m2m.c   |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_m2m.h   |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_regs.c  |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_regs.h  |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_vpu.c   |  0
 .../platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_vpu.h   |  0
 .../platform/mediatek/{mtk-vcodec => vcodec}/Kconfig   |  0
 .../platform/mediatek/{mtk-vcodec => vcodec}/Makefile  |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec.c   |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec.h   |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_dec_drv.c        |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_dec_hw.c         |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_dec_hw.h         |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_dec_pm.c         |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_dec_pm.h         |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_dec_stateful.c   |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_dec_stateless.c  |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_drv.h   |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_enc.c   |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_enc.h   |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_enc_drv.c        |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_enc_pm.c         |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_enc_pm.h         |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_fw.c    |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_fw.h    |  2 +-
 .../{mtk-vcodec => vcodec}/mtk_vcodec_fw_priv.h        |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_fw_scp.c         |  0
 .../{mtk-vcodec => vcodec}/mtk_vcodec_fw_vpu.c         |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_intr.c  |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_intr.h  |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_util.c  |  0
 .../mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_util.h  |  0
 .../{mtk-vcodec => vcodec}/vdec/vdec_h264_if.c         |  0
 .../{mtk-vcodec => vcodec}/vdec/vdec_h264_req_if.c     |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec/vdec_vp8_if.c |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec/vdec_vp9_if.c |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_drv_base.h    |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_drv_if.c      |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_drv_if.h      |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_ipi_msg.h     |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_msg_queue.c   |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_msg_queue.h   |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_vpu_if.c      |  0
 .../mediatek/{mtk-vcodec => vcodec}/vdec_vpu_if.h      |  0
 .../{mtk-vcodec => vcodec}/venc/venc_h264_if.c         |  0
 .../mediatek/{mtk-vcodec => vcodec}/venc/venc_vp8_if.c |  0
 .../mediatek/{mtk-vcodec => vcodec}/venc_drv_base.h    |  0
 .../mediatek/{mtk-vcodec => vcodec}/venc_drv_if.c      |  0
 .../mediatek/{mtk-vcodec => vcodec}/venc_drv_if.h      |  0
 .../mediatek/{mtk-vcodec => vcodec}/venc_ipi_msg.h     |  0
 .../mediatek/{mtk-vcodec => vcodec}/venc_vpu_if.c      |  0
 .../mediatek/{mtk-vcodec => vcodec}/venc_vpu_if.h      |  0
 .../media/platform/mediatek/{mtk-vpu => vpu}/Kconfig   |  0
 .../media/platform/mediatek/{mtk-vpu => vpu}/Makefile  |  0
 .../media/platform/mediatek/{mtk-vpu => vpu}/mtk_vpu.c |  0
 .../media/platform/mediatek/{mtk-vpu => vpu}/mtk_vpu.h |  0
 77 files changed, 15 insertions(+), 15 deletions(-)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/Kconfig (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/Makefile (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_core.c (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_core.h (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_hw.c (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_hw.h (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_parse.c (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_parse.h (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_dec_reg.h (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_enc_hw.c (100%)
 rename drivers/media/platform/mediatek/{mtk-jpeg => jpeg}/mtk_jpeg_enc_hw.h (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/Kconfig (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/Makefile (77%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_comp.c (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_comp.h (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_core.c (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_core.h (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_ipi.h (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_m2m.c (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_m2m.h (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_regs.c (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_regs.h (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_vpu.c (100%)
 rename drivers/media/platform/mediatek/{mtk-mdp => mdp}/mtk_mdp_vpu.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/Kconfig (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/Makefile (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec_drv.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec_hw.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec_hw.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec_pm.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec_pm.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec_stateful.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_dec_stateless.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_drv.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_enc.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_enc.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_enc_drv.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_enc_pm.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_enc_pm.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_fw.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_fw.h (97%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_fw_priv.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_fw_scp.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_fw_vpu.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_intr.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_intr.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_util.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/mtk_vcodec_util.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec/vdec_h264_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec/vdec_h264_req_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec/vdec_vp8_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec/vdec_vp9_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_drv_base.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_drv_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_drv_if.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_ipi_msg.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_msg_queue.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_msg_queue.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_vpu_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/vdec_vpu_if.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc/venc_h264_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc/venc_vp8_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc_drv_base.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc_drv_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc_drv_if.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc_ipi_msg.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc_vpu_if.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vcodec => vcodec}/venc_vpu_if.h (100%)
 rename drivers/media/platform/mediatek/{mtk-vpu => vpu}/Kconfig (100%)
 rename drivers/media/platform/mediatek/{mtk-vpu => vpu}/Makefile (100%)
 rename drivers/media/platform/mediatek/{mtk-vpu => vpu}/mtk_vpu.c (100%)
 rename drivers/media/platform/mediatek/{mtk-vpu => vpu}/mtk_vpu.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81ce7b4e2b2a..152fef3163e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12130,7 +12130,7 @@ M:	Rick Chang <rick.chang@mediatek.com>
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
-F:	drivers/media/platform/mediatek/mtk-jpeg/
+F:	drivers/media/platform/mediatek/jpeg/
 
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
@@ -12138,8 +12138,8 @@ M:	Houlong Wei <houlong.wei@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
-F:	drivers/media/platform/mediatek/mtk-mdp/
-F:	drivers/media/platform/mediatek/mtk-vpu/
+F:	drivers/media/platform/mediatek/mdp/
+F:	drivers/media/platform/mediatek/vpu/
 
 MEDIATEK MEDIA DRIVER
 M:	Tiffany Lin <tiffany.lin@mediatek.com>
@@ -12147,8 +12147,8 @@ M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
-F:	drivers/media/platform/mediatek/mtk-vcodec/
-F:	drivers/media/platform/mediatek/mtk-vpu/
+F:	drivers/media/platform/mediatek/vcodec/
+F:	drivers/media/platform/mediatek/vpu/
 
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
index aa79626088ec..122eb94ed430 100644
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -2,7 +2,7 @@
 
 comment "Mediatek drivers"
 
-source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
-source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
-source "drivers/media/platform/mediatek/mtk-vcodec/Kconfig"
-source "drivers/media/platform/mediatek/mtk-vpu/Kconfig"
+source "drivers/media/platform/mediatek/jpeg/Kconfig"
+source "drivers/media/platform/mediatek/mdp/Kconfig"
+source "drivers/media/platform/mediatek/vcodec/Kconfig"
+source "drivers/media/platform/mediatek/vpu/Kconfig"
diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
index 403d5ecd2b10..d3850a13f128 100644
--- a/drivers/media/platform/mediatek/Makefile
+++ b/drivers/media/platform/mediatek/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += mtk-jpeg/
-obj-y += mtk-mdp/
-obj-y += mtk-vcodec/
-obj-y += mtk-vpu/
+obj-y += jpeg/
+obj-y += mdp/
+obj-y += vcodec/
+obj-y += vpu/
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/Kconfig b/drivers/media/platform/mediatek/jpeg/Kconfig
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/Kconfig
rename to drivers/media/platform/mediatek/jpeg/Kconfig
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/Makefile b/drivers/media/platform/mediatek/jpeg/Makefile
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/Makefile
rename to drivers/media/platform/mediatek/jpeg/Makefile
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.c
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.h
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.c
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.h
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.c
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.h
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.h
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_reg.h
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.c
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
diff --git a/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.h
rename to drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
diff --git a/drivers/media/platform/mediatek/mtk-mdp/Kconfig b/drivers/media/platform/mediatek/mdp/Kconfig
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/Kconfig
rename to drivers/media/platform/mediatek/mdp/Kconfig
diff --git a/drivers/media/platform/mediatek/mtk-mdp/Makefile b/drivers/media/platform/mediatek/mdp/Makefile
similarity index 77%
rename from drivers/media/platform/mediatek/mtk-mdp/Makefile
rename to drivers/media/platform/mediatek/mdp/Makefile
index eab6f984aeea..b7c16ebecc80 100644
--- a/drivers/media/platform/mediatek/mtk-mdp/Makefile
+++ b/drivers/media/platform/mediatek/mdp/Makefile
@@ -7,4 +7,4 @@ mtk-mdp-y += mtk_mdp_vpu.o
 
 obj-$(CONFIG_VIDEO_MEDIATEK_MDP) += mtk-mdp.o
 
-ccflags-y += -I$(srctree)/drivers/media/platform/mediatek/mtk-vpu
+ccflags-y += -I$(srctree)/drivers/media/platform/mediatek/vpu
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.c
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.h
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.c
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.h
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_ipi.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_ipi.h
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.c
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.h
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.h
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_regs.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.c
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_regs.c
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_regs.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.h
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_regs.h
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.c
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c
diff --git a/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.h
rename to drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/Kconfig
rename to drivers/media/platform/mediatek/vcodec/Kconfig
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/Makefile b/drivers/media/platform/mediatek/vcodec/Makefile
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/Makefile
rename to drivers/media/platform/mediatek/vcodec/Makefile
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_drv.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_hw.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_pm.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateful.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_dec_stateless.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_drv.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_drv.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_enc_pm.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h
similarity index 97%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h
index 539bb626772c..15ab6b8e3ae2 100644
--- a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h
@@ -6,7 +6,7 @@
 #include <linux/remoteproc.h>
 #include <linux/remoteproc/mtk_scp.h>
 
-#include "../mtk-vpu/mtk_vpu.h"
+#include "../vpu/mtk_vpu.h"
 
 struct mtk_vcodec_dev;
 
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_priv.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_priv.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_priv.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_scp.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_fw_vpu.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_intr.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.c
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/mtk_vcodec_util.h
rename to drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_if.c
rename to drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_h264_req_if.c
rename to drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp8_if.c
rename to drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec/vdec_vp9_if.c
rename to drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_base.h b/drivers/media/platform/mediatek/vcodec/vdec_drv_base.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_base.h
rename to drivers/media/platform/mediatek/vcodec/vdec_drv_base.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.c
rename to drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_drv_if.h
rename to drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/vdec_ipi_msg.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_ipi_msg.h
rename to drivers/media/platform/mediatek/vcodec/vdec_ipi_msg.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.c
rename to drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_msg_queue.h
rename to drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.c
rename to drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/vdec_vpu_if.h
rename to drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc/venc_h264_if.c
rename to drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc/venc_vp8_if.c
rename to drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc_drv_base.h b/drivers/media/platform/mediatek/vcodec/venc_drv_base.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc_drv_base.h
rename to drivers/media/platform/mediatek/vcodec/venc_drv_base.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/venc_drv_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.c
rename to drivers/media/platform/mediatek/vcodec/venc_drv_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mediatek/vcodec/venc_drv_if.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc_drv_if.h
rename to drivers/media/platform/mediatek/vcodec/venc_drv_if.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/venc_ipi_msg.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc_ipi_msg.h
rename to drivers/media/platform/mediatek/vcodec/venc_ipi_msg.h
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.c
rename to drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
diff --git a/drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vcodec/venc_vpu_if.h
rename to drivers/media/platform/mediatek/vcodec/venc_vpu_if.h
diff --git a/drivers/media/platform/mediatek/mtk-vpu/Kconfig b/drivers/media/platform/mediatek/vpu/Kconfig
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vpu/Kconfig
rename to drivers/media/platform/mediatek/vpu/Kconfig
diff --git a/drivers/media/platform/mediatek/mtk-vpu/Makefile b/drivers/media/platform/mediatek/vpu/Makefile
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vpu/Makefile
rename to drivers/media/platform/mediatek/vpu/Makefile
diff --git a/drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.c
rename to drivers/media/platform/mediatek/vpu/mtk_vpu.c
diff --git a/drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
similarity index 100%
rename from drivers/media/platform/mediatek/mtk-vpu/mtk_vpu.h
rename to drivers/media/platform/mediatek/vpu/mtk_vpu.h
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
