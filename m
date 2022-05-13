Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 03:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DpLDZCIJ8Djg72aTAz23q2PiHniYzVj22M7FHpNKzk8=; b=yMHWx8qg5Tc2It
	8B4gm7aIu1s0G76OuAXqrneFQ9g8ZLXja7YG+G9mbievBYrKHO/oy836ywIg7CI09BdqEz+9ENCUJ
	DWxFndqeq2rSU5v/vbrhnotQCbCSQcqxN2UyO5pHZrfwa4x3XhN0iZpbuF2C0pQ8d9uYxjEJ03d9F
	pob77I6wTAn50davC+0YuZmau/zbqKvgwfhUtJudi+xQv78uInqzmRP46hs3I7buqQru28ic0qCmN
	DoS09UPX5+/i2fMOC+nmRhqJ4olliHzhPL0Ku9p9wlecjdgfNXjGnwpXkJ+luq18tCR9jqOhk1K63
	wjBm+/UDDVGPNodIb4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npM1u-00EKKo-9r; Fri, 13 May 2022 03:31:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npM1O-00EK0G-AZ; Fri, 13 May 2022 03:31:19 +0000
X-UUID: 30bda4e8271d4b6e8165d248b6113d38-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d169510a-c063-44a0-a39f-f5b3603a41ee, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-15
X-CID-META: VersionHash:faefae9, CLOUDID:599224a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 30bda4e8271d4b6e8165d248b6113d38-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2077087963; Thu, 12 May 2022 20:31:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 20:24:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 May 2022 11:24:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 May 2022 11:24:54 +0800
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
Subject: [RESEND,
 v4] media: mediatek: vcodec: Fix v4l2 compliance decoder cmd test fail
Date: Fri, 13 May 2022 11:24:53 +0800
Message-ID: <20220513032453.4997-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_203118_468828_3B909AE7 
X-CRM114-Status: GOOD (  13.59  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
resend v4:
- add Reviewed-by tag for patch v4.
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
index 3859e4c651c6..52e5d36aa912 100644
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
index b417a6ab2176..995e6e2fb1ab 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -395,6 +395,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	if (dev->vdec_pdata->uses_stateless_api) {
+		v4l2_disable_ioctl(vfd_dec, VIDIOC_DECODER_CMD);
+		v4l2_disable_ioctl(vfd_dec, VIDIOC_TRY_DECODER_CMD);
+
 		dev->mdev_dec.dev = &pdev->dev;
 		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
 			sizeof(dev->mdev_dec.model));
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
