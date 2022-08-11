Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435DCC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQYYODCsP0zkhy69BquDp4WpZuFoI71BAd1j72iXPSU=; b=EvcKmVJXUsFQOmRcKP1gjB2Q2m
	5hBIshGL0VBA1dnG169Qvn56OCkG6+hylqg5wA07bSE8r+uTEtwXdEwSVkrijgcAIF2nhuGmEdEP/
	7D+jPWqGzG4HQQBR95qHMrel6xP2f8WKdJ11JHb47RxdQOPHuXW7PWqSGjIg+8KiRGF/35EeCmH1F
	aAdHKRtiNNGL2i1KpKJ5PwnWTSed16FlYYmz4dEsx4fCsxINMCehfjFwobXY5ht0Sv64XADmBpPCP
	LAyG05pZLqOdLHN8K5CVSqz2pb4Wlch3o0cTwIIOjTTaIaIOx9GP7tttIxHWrmrcfNxPRCrvvkBa1
	wyyhUP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAQK-00EEQG-2Y; Thu, 11 Aug 2022 15:48:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAOl-00ECtb-BV; Thu, 11 Aug 2022 15:47:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E41E7616F9;
	Thu, 11 Aug 2022 15:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C662C433D6;
	Thu, 11 Aug 2022 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660232821;
	bh=AEsPbHbEe182m0t/WV82gX2x94xwC8rhYlBhPE0RDVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1OiGsdCpXlRHaDFZBqyXG/sIjmVd8tgtXksnOnqApCn4DsJdCnfKPyjpq2XrM5Am
	 yixrQ8PO/zNGV01sYmGGzDc5hJxNEQlvIiFLK6DiQ3xbkVZuCt0XzfmjNbGPTdgKis
	 DAArdvJy/qZKucZSAGk52Q14yG/gvzHNiaeBe8fORxfwmGDch0H+AU8C5LBZp6bObr
	 kIZEJ7q+XcLFeA/DGpcuzPh0SlCA/qpAWjhP1BJeFU+4GLQKlx/JG8rHogKpNtlgXt
	 AKiKJcx+hu+fbw60peZS8hiA9gG561nEzgFc4NkBKSWYvehZr6mdDmjMamGclicYzw
	 aTzZOKnqfLhhQ==
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
Subject: [PATCH AUTOSEL 5.18 42/93] media: mediatek: vcodec: return EINVAL if plane is too small
Date: Thu, 11 Aug 2022 11:41:36 -0400
Message-Id: <20220811154237.1531313-42-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_084704_876715_84A34792 
X-CRM114-Status: GOOD (  11.10  )
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
index c8ee5e2b4f69..e52cf8109989 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -725,6 +725,7 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 			mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
 				i, vb2_plane_size(vb, i),
 				q_data->sizeimage[i]);
+			return -EINVAL;
 		}
 	}
 
-- 
2.35.1


