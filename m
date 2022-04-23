Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7025FC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 07:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xm+eFxF54vCPvhf35gTfQAXHafhziMU+69sxb9Mn3BU=; b=nHKtGIeJzTY3hm
	HV2dehXC4xhv38YIvJbyB1IXRJDmbRy7jv2FGbhWT48hglG+RZc4U4isZ7ITslEFHjJO9iFpJtn/W
	iQqmOPDPkOyShCaJatXL5XPfx9AhVg/hNOSYBdFka6tb/mVYq2vkfjKHNmp25f2EKHKxxqHVTyiK3
	OZzMga7WI+9QW9Df2tPhnZq5Oynb7tnB8nVn9KQDkCJNBdGhc9enhXA1zzX5DpXv53/Kvnl+NhiY5
	xgLSTLI5FfOctqY7xWi6DmtxHyImhaPV3SsrVgFejyu+GVd0/YqKel4nc48Y8y9fftOPjbdjCcsHn
	4Tru4J0FBhpAP+FhlPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niAJE-003kRj-1Y; Sat, 23 Apr 2022 07:36:00 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niAJ0-003kNg-Ek; Sat, 23 Apr 2022 07:35:50 +0000
X-UUID: 94c068477812475498ef08abca4012ca-20220423
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:79d16071-65fa-4e99-ad7f-20fd7e741ec6, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:6097aef0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 94c068477812475498ef08abca4012ca-20220423
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 814089778; Sat, 23 Apr 2022 00:35:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Apr 2022 00:35:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Apr 2022 15:35:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Apr 2022 15:35:32 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH ,
 v4] media: mediatek: vcodec: Fix v4l2 compliance decoder cmd test fail
Date: Sat, 23 Apr 2022 15:35:31 +0800
Message-ID: <20220423073531.24749-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_003546_522505_F0C3DBC4 
X-CRM114-Status: GOOD (  13.15  )
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

Will return -EINVAL using standard framework api when test stateless
decoder with cmd VIDIOC_(TRY)DECODER_CMD. Disable them to adjust v4l2
compliance test for user driver(GStreamer/Chrome) won't use decoder cmd.

Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
changes compared with v3:
- using v4l2_disable_ioctl to replace return -ENOTTY
changes compared with v2:
- add reviewed-by tag
changes compared with v1:
- add Fixes: tag
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 13 +------------
 .../platform/mediatek/vcodec/mtk_vcodec_dec_drv.c   |  3 +++
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 130ecef2e766..c8ee5e2b4f69 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -47,14 +47,7 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
 static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
-
-	/* Use M2M stateless helper if relevant */
-	if (ctx->dev->vdec_pdata->uses_stateless_api)
-		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
-								cmd);
-	else
-		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
+	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
 
@@ -69,10 +62,6 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	/* Use M2M stateless helper if relevant */
-	if (ctx->dev->vdec_pdata->uses_stateless_api)
-		return v4l2_m2m_ioctl_stateless_decoder_cmd(file, priv, cmd);
-
 	mtk_v4l2_debug(1, "decoder cmd=%u", cmd->cmd);
 	dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index df7b25e9cbc8..7e93e1c55158 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -400,6 +400,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	if (dev->vdec_pdata->uses_stateless_api) {
+		v4l2_disable_ioctl(vfd_dec, VIDIOC_DECODER_CMD);
+		v4l2_disable_ioctl(vfd_dec, VIDIOC_TRY_DECODER_CMD);
+
 		dev->mdev_dec.dev = &pdev->dev;
 		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
 			sizeof(dev->mdev_dec.model));
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
