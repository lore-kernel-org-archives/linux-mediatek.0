Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E06C43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C9BE61BFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C9BE61BFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=notMz9tjXDF/GgOH7lf89/QU77yJgLv671r3P7wMskw=; b=39H1tmH557dNaH
	OeXCJk7sMyheK+w3PZLuWvAWD57240SCthM9DkaXaK6zo/aYrEe+rl6/wTXX2PfahrkQMt661CJ1F
	KF47OgMVJddQwi8husF+JhnUzk6bmaafuGNFV9hZxU0FgvRDZRH3fyj7zI8GsZnx8GeQ2tB0wLboo
	7bTss8zbKInbCbO79rNl4kuDt1BK1EDT7Qy6k7Leg9brbHX3IjCpDlRydIxZYf+qer1O5GUkAQZ1W
	hfmuNqAUe3SZ1Igz/wxd4C9OtCGBRdU6SZN6I+8CDuNOqD2ADvoCFDpFo20P+dvO4soWO60qxLSU8
	u7Lda9Nl5zCMLDsJQmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKeN-004mhB-Bo; Wed, 17 Nov 2021 13:06:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKeJ-004meO-VO
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 13:06:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 213261F45CAA
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637154409; bh=fkjDwUt5aIF7ZYKWMjK2FWkQxgVnsFK/2/jn4p1kTCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LBNxrvJdnwH4QXxfJdLoxQ/IcqSV42d7mSOuNYJKvbj0Tc/Q5YMiW2KHRED3o6+p1
 eMf/S38jHUfZnOj8NTpujOd+X2q81+HVjQpelIl3SBHaxNS8ypsSTJY+77zL/0AKOj
 G3ptQarhF+gCfxpBwPOb49PnW6tkqM8FEmcVNA+vcFQyc5Z661dwoC1X7DqjGaCVvo
 EAlPKke3eS1DGoOQXEImHwue8pmP0qr7NBaOiQCveeEridyEDrmorEGeteLKFE6jCT
 njjGfmS7tJ+Bg+wVU9jYBDghatyV7D+NOi1k4yzgZif2/qOCTcF1lulSnoRzt2DmLg
 +i3BoHwF93Isw==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
 hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
Subject: [PATCH v2 1/7] media: mtk-vcodec: enc: add vp8 profile ctrl
Date: Wed, 17 Nov 2021 15:06:29 +0200
Message-Id: <20211117130635.11633-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_050652_168707_5B5BF0C8 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order for the encoder to work with gstreamer
it needs to have the V4L2_CID_MPEG_VIDEO_VP8_PROFILE
ctrl. This patch adds that ctrl with only profile 0
supported.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 8998244ea671..87a5114bf680 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -103,6 +103,13 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
 		p->gop_size = ctrl->val;
 		ctx->param_change |= MTK_ENCODE_PARAM_GOP_SIZE;
 		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+		/*
+		 * FIXME - what vp8 profiles are actually supported?
+		 * The ctrl is added (with only profile 0 supported) for now.
+		 */
+		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_VP8_PROFILE val = %d", ctrl->val);
+		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME");
 		p->force_intra = 1;
@@ -1394,6 +1401,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
 			       h264_max_level,
 			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
+			       V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
+
 
 	if (handler->error) {
 		mtk_v4l2_err("Init control handler fail %d",
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
