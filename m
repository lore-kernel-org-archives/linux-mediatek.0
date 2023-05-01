Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E17C77B60
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv6GGfQoCCsEVzrI8zbqyeKtCeys1LEvMb8h1CYFlRo=; b=cfGoBLS3eXbe4PCsOWrzo0u62Z
	G58qSlskDJF78Xcf3vlrE/o7XYwhdOlD2Cew5+6cMSbOD3RKIK9HAdmkL+4wL8SmDQiFkLK3IP0DS
	DjeLlVbe1VcQP80tvFN8hf5fduCpU7ysYDYLiVj5ZgLukaIClURy1Y5DBcNw8vg7oHGklBExdThWk
	pP3buZ/H8JDK2Fk/N72anizWfLWnVimhJ8nVNskeD5dCeTXMn8ce19kUtW0+VknFhMi0K8j79RX96
	FJOzkL+3UmynLjZ/+szabvS+Mjf9XF2p/rE9r/ER/ZGImEaqGr2bAXtxuYG4J3oNT4IzGZKpHVPeg
	AsjoLKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJlR-00F55x-0i;
	Mon, 01 May 2023 02:59:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJlO-00F545-15;
	Mon, 01 May 2023 02:59:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E41E561717;
	Mon,  1 May 2023 02:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70184C433EF;
	Mon,  1 May 2023 02:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682909980;
	bh=YKojEJiiV1QvwHI5f0ezVGrRBJg+sS7nU5ba/bX9Vb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p9AzbP/kx+wSby7ytTnMivAm3jk1V+SGZZXz941qqCeaVX9eCs+7ZYNfAiDa/v+iJ
	 ThW+a+ZicUbSPKwJ5lWDqFIrytV1nZbsaktsHB8dSFAsOOidhwUoYo8RRSXr/xtLCg
	 npqYgTaCz5kS32kTyZe1s5mmErZHrztaoXsIZvPEbt8WlC+L8LZ0xMuBla+UUVx4IV
	 34NQQAGU7ZG4GRT4dLDIt5vb/JohOqqbgaMhz/4O2oV8j+HFjzysaPpCyPPnR03w43
	 EHsSUa/0J5X0mqRagA/PpqpgFG5M2UeIeqqLSKmcUZu30dFnq6ls7z/NbryxePF58T
	 hlQ3fAX5fzhPA==
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
Subject: [PATCH AUTOSEL 6.3 42/44] media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
Date: Sun, 30 Apr 2023 22:56:30 -0400
Message-Id: <20230501025632.3253067-42-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025632.3253067-1-sashal@kernel.org>
References: <20230501025632.3253067-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_195942_412721_65DF09AA 
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


