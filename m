Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF5C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/PjryqInJ7i7Yj59nqh4YHHVkYYXAuVHtZYKJoQjUA=; b=x3HtsfzNTIQJV0139rlAxJAntt
	hlZe4TZZtFEDAnsh22juOb1prxwtSTXWcmEgEWHQbCT1SNikqfIgLYZWFAtekOXaDpzgmjLq6kuZw
	CTDsWkd4wmc56S0qbemvnnl2Qe1HE157kH81/BsqniVEtvk/DCg83VKoyHVH1y3KchgzNERQdZ9Xz
	Pm8bUdpXedEzbLFHKn7zKmuTMKNLWd80gsu0ImoGGvsqd9uKF1wjDSfbyCHjjeqXmGhTQqsDQTSfT
	VtIJ5AAsBH24qHqU5v7LVONFQbTTulcnIYfShSmJpKVaxpk9u2KDNuHYLp5C/paexdNeIITRDVQ1/
	7QHOhUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAQT-00EEfN-Q9; Thu, 11 Aug 2022 15:48:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAOs-00ECzT-3e; Thu, 11 Aug 2022 15:47:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5ED3616FE;
	Thu, 11 Aug 2022 15:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5D0C433D7;
	Thu, 11 Aug 2022 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660232827;
	bh=xizQ1FcyAgy3xUVeDsDcPWFhWdEEzYl0CwRjLQCek1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SlOhIodFFLKhRJVzGBo/DNKEUOS0UD6S9ZYVsBEmhjiB+q76NQrjq3Xc6i9GDsaHj
	 9AUzDPZQUldRqH6uDAhk5Bi2Dh0qAUHsvUxdrX+LhSfx7jPzrXoFRGGjY6xURAj/Zu
	 6Ewx8Q9mz/c8Nu4r+ewfLovOrIGyCNLsor4rpLWTEgGVQfWWiejtLusH5JZmJkdhN4
	 6wOB9vQ30savbr1xVKV6ZfAnXUgTNz1psRFWZn6N8iZAgNZCuKpc21UVKsblesAkK/
	 CCEY8pi0UGdQedXQvG/dcRdp6npFxmGMOQBPSoHTWDeTbVeUBxoSMzjrvONj7XpMxj
	 4m+cHn5UkmVpQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hirokazu Honda <hiroh@chromium.org>,
	Irui Wang <irui.wang@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 44/93] media: mediatek: vcodec: Report supported bitrate modes
Date: Thu, 11 Aug 2022 11:41:38 -0400
Message-Id: <20220811154237.1531313-44-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_084710_251450_C765D4C2 
X-CRM114-Status: GOOD (  11.64  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hirokazu Honda <hiroh@chromium.org>

[ Upstream commit d8e8aa866ed8636fd6c1017c3d9453eab2922496 ]

The media driver supports constant bitrate mode only.
The supported rate control mode is reported through querymenu() and
s_ctrl() fails if non constant bitrate mode (e.g. VBR) is requested.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
Reviewed-by: Irui Wang <irui.wang@mediatek.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_enc.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index c21367038c34..98d451ce2545 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -50,6 +50,14 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE_MODE val= %d",
+			       ctrl->val);
+		if (ctrl->val != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
+			mtk_v4l2_err("Unsupported bitrate mode =%d", ctrl->val);
+			ret = -EINVAL;
+		}
+		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE val = %d",
 			       ctrl->val);
@@ -1373,6 +1381,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
 	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
 			       V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
+	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+			       0, V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
 
 
 	if (handler->error) {
-- 
2.35.1


