Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024DC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 03:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv6GGfQoCCsEVzrI8zbqyeKtCeys1LEvMb8h1CYFlRo=; b=j4qpB1+PyVgjjaC455PkWoc5Ga
	Z1p5pPYcyen1I2vYdoH6aMSomL39kuhP8nbOAwuQyNmgpx/TzU7Xg40CDodM3rJWgiIgUm78abAA+
	Pp3KkZ/3grUM4v3FuvjTUQnwLan1xdcq/svFgdwgbC3ctDYNimfFWUhjgWaKju7dSV5mYGINZuV1s
	47rvLoNRzRLivE/0BKNYw+yDpQ5hwxMvVLZIKKY+sfQvGCXGiR2IsWLFj+E5ch9AgqtlkVcFo3RHv
	EWhOI0dIw/vk0i3jJ9vi/mTzs3gG3dU8Z7VR6QnVz1lGBQIlELnVDYHEUqUmyAKDkB2abDtRyyqk+
	s3t6D6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJqP-00F8FQ-2N;
	Mon, 01 May 2023 03:04:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJq6-00F83J-34;
	Mon, 01 May 2023 03:04:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 142CE6179B;
	Mon,  1 May 2023 03:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9962C433A1;
	Mon,  1 May 2023 03:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682910273;
	bh=YKojEJiiV1QvwHI5f0ezVGrRBJg+sS7nU5ba/bX9Vb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNTwHfRrJ8cnetVn+jV6xjHcnBFwb0cHcNYhjg3R0z8Yw/VPuSYLLXcYYf42WU7mW
	 7jd4rHcXG5qZDi7UKcwn6cPZ38YhLCkrnv6geGaXHo6te7TDglHvh1DZNwb2UFWBff
	 Ld7y4MFu9UBdjkCjivuLrlgzCGMg3w1drQVsSguWN3KoQLUicYYS8NUdXczG11ngkL
	 mNHcdjvndfdzzMWpBjVEMTZAuze+bm4dLyACBjFBbdanv4XSGEfDCdVKUqoCHk2rRR
	 2Sn9sTn6XWfRjnAw0q6t5zg9BibYzcNP9qAomwFBPXCBLzcadYGJ0PCy933/Ehkk9X
	 1OWyjXEHYxBOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wei Chen <harperchen1110@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 33/33] media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
Date: Sun, 30 Apr 2023 23:02:27 -0400
Message-Id: <20230501030227.3254266-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501030227.3254266-1-sashal@kernel.org>
References: <20230501030227.3254266-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_200435_041067_0497CE0C 
X-CRM114-Status: GOOD (  13.13  )
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

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit 8fbcf730cb89c3647f3365226fe7014118fa93c7 ]

variable *nplanes is provided by user via system call argument. The
possible value of q_data->fmt->num_planes is 1-3, while the value
of *nplanes can be 1-8. The array access by index i can cause array
out-of-bounds.

Fix this bug by checking *nplanes against the array size.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 641f533c417fd..173407664cf42 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -753,6 +753,13 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	}
 
 	if (*nplanes) {
+		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+			if (*nplanes != q_data->fmt->num_planes)
+				return -EINVAL;
+		} else {
+			if (*nplanes != 1)
+				return -EINVAL;
+		}
 		for (i = 0; i < *nplanes; i++) {
 			if (sizes[i] < q_data->sizeimage[i])
 				return -EINVAL;
-- 
2.39.2


