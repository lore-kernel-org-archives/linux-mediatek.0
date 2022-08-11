Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA9AC25B0D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo8ELwcJCgjL2Pp5bl8aiUASBScWyI6MWh7BSIZI/DM=; b=vycZX4WkXZ+VcKvtPkKSh2mADH
	N+UaPX/qpmnfl8TBuSOQ7RVuTrkyJzDj0BM4H+DuO8GuLSVXVu5XsRkMANqYLCQOPstjB16ZMMD3f
	KL3Yl+OEHJc2JEkE6a7srzdyDpjQUFyzZQphr6KIeFfZU6AhSHpBB920nvGhp9Y3/4EZQ9J5nf5js
	0JEjsXJMGahUK7d/zk6CauIlOTtoDVOmPhpNWL9W2zGKO3n1UV+h6n07BfqQcoJ5qNW+G7FwjpHKP
	7ABYHL1bFBP6y/SZuTU1ZSJwE2pZmUCj6rflDNY3vGqrPynu3q6aSWdx/5550ekUMyZo/UC/jHHxL
	V9GWIviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAcZ-00EcEu-JR; Thu, 11 Aug 2022 16:01:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAcB-00EbkG-Q6; Thu, 11 Aug 2022 16:00:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 46DB6B82156;
	Thu, 11 Aug 2022 16:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343C4C433C1;
	Thu, 11 Aug 2022 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660233652;
	bh=lR+hSg/BKa6lPnDchxZkpZQFm6ZDmOCFvOi5wGYsemc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SdjyEES98D1vGEDJV90GwWC3U7Ux2sYdVpGDHQt+V5IgOJEio2+sl02t8Ya4ilzIN
	 FpMTiRlQCD0oBReaqiBAxyPgLPul6KIvLj5LqEq4bVUJ6wY5G0tTzCqaQdWwoSNx1e
	 TZ3vxDH10bacFRUfIrBwz47aBG8mrMV+Zn5OHsvSiQ72PYlrv1CAOIiPpelSPmRjh+
	 DIdG7xLtNU2mE2KpokEG1xUFOXotct1aM9Zq5WE4oJXUH5Ve1Dy85NdgwJ65TN2VLq
	 0w0hG3br/e1BREGv3qQRiWxXnvHbHHCBacMwEYDqzpFhsSFXlb8o+5A7kLSdzjzeUI
	 dMqKqo2/2ASvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Justin Green <greenjustin@chromium.org>,
	Andres Calderon Jaramillo <andrescj@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	acourbot@chromium.org,
	tzungbi@google.com,
	yunfei.dong@mediatek.com,
	hiroh@chromium.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 37/69] media: mediatek: vcodec: return EINVAL if plane is too small
Date: Thu, 11 Aug 2022 11:55:46 -0400
Message-Id: <20220811155632.1536867-37-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_090056_031748_65058BAB 
X-CRM114-Status: GOOD (  11.53  )
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
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 56d86e59421e..71646ef31663 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1120,6 +1120,7 @@ static int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 			mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
 				i, vb2_plane_size(vb, i),
 				q_data->sizeimage[i]);
+			return -EINVAL;
 		}
 	}
 
-- 
2.35.1


