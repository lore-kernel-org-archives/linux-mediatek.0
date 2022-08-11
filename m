Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26200C25B0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUYdSuMPsOvJpfPuTxiU4QHmtirabAg+qFPXgrTVNGU=; b=xdWKY6hwEqxqEnmQaHrttAOJWn
	wtfMd0FX6sSKliXq7Yxfa2niiidDzvmzHtPTcsrvCUOBmjOeSzs8eVp6a1cZkSePdeP8SutIqiDxT
	guatAE42PhxSnZF0d8Z5VW9afdYGXiPYmTnn1kBje+51ywiMF/KzYu2gOZmA7Q0mYIfHlAIXbtVsN
	Auwn7xVeQ8qgLK84sflkgsZNOVvBSKpEklydcDfadOGkDNQjvawYoLg+zFUe26TC3/Qwt68a5JZCl
	JZ5//ZgjhTACuA0O/5qN0tuliY/OLQBgAWrE+G5QktytnsWP0RjZMAEo0RsFoz6bL5TQkgYv0PsdB
	yBp5CxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMACG-00E0lV-3b; Thu, 11 Aug 2022 15:34:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMABn-00E0Mv-Vn; Thu, 11 Aug 2022 15:33:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9A3A6B82157;
	Thu, 11 Aug 2022 15:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB29C433C1;
	Thu, 11 Aug 2022 15:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660232015;
	bh=YbP9ChO/K+7SMUXeYPgcaet4O69I6m639FXRxjesmJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZNA3Kn4sZPAPZgyI3bHfU5l92+X2XVjPfqDraPC0+Tc0YW1lQQJ8G8FaCSwOglyo
	 rcvuD9vaPL/fEke8mBxUJtGxpulXygVXco2RmtiH+t3xWGlr4UYAeH8wJ+xfxWZWBS
	 5gyLQ97OrFAn8zzpdCgmNREmm8HFjDSeQ2/ahmLxXV+N/1wt6yB49eN3+w+Bk+Baqw
	 Hwn4YnYviAFKv7F469uK5MpPOqxXtNvhf/e7YawViYwGSTZ7FFOYmYQEnZAyy1LxrO
	 xfPhTHgOf9KqCqy5rxZ+Mpz3rwLsStUVVMt4gLAK1grQFhzlBhAG9GJ2as9yNF7ax+
	 fUOpiNHrC01Ng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Justin Green <greenjustin@chromium.org>,
	Andres Calderon Jaramillo <andrescj@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 047/105] media: mediatek: vcodec: return EINVAL if plane is too small
Date: Thu, 11 Aug 2022 11:27:31 -0400
Message-Id: <20220811152851.1520029-47-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_083340_180283_E969DD7C 
X-CRM114-Status: GOOD (  11.13  )
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

From: Justin Green <greenjustin@chromium.org>

[ Upstream commit f5caaa47f55fa742f1a230e5b4258c139e223c74 ]

Modify vb2ops_vdec_buf_prepare to return EINVAL if the size of the plane
is less than the size of the image. Currently we just log an error and
return 0 anyway, which may cause a buffer overrun bug.

Signed-off-by: Justin Green <greenjustin@chromium.org>
Suggested-by: Andres Calderon Jaramillo <andrescj@chromium.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..191e13344c53 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -735,6 +735,7 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 			mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
 				i, vb2_plane_size(vb, i),
 				q_data->sizeimage[i]);
+			return -EINVAL;
 		}
 		if (!V4L2_TYPE_IS_OUTPUT(vb->type))
 			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
-- 
2.35.1


