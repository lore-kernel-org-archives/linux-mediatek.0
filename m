Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF34C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 01:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7fZtpL0iNYJsohXcq4CBeKTLBpuQ3naoPd+9PJ+rI0k=; b=MM30IfnHlhLzaGM/tGJ5vo6mjm
	o4usCzSmwnWPUr8mAWaz0IaNvQ5YWtGB+4JPauZCMD/S+yd/QUFkQiRPIkzEBCJR8Z706inqP77of
	VAFnAWt+cMRWZTqiDWGoz6NUmrfVpiB540v6W4xZhrCfsLPJfC7U+tHzOSG5izduc5CkOKksrFP9N
	xL8t0ekqHJ9bqs2bapEm/q3/7gAQq3sDe7Xwa/JaDmSamWebG+XYYF7RXjLa1iOsGBIkBLn7wb+j6
	yr/P2FD0p1Xf9rKC7jIdUHgslnpDEE75uPo6GjS3PcYfPYz3RYQlZ6Z+OZaPHD8l4BXixXJQJiqka
	wfMAVrYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkSe-002OZm-0R;
	Mon, 24 Jul 2023 01:34:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkSa-002OYh-2n;
	Mon, 24 Jul 2023 01:34:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A53860F37;
	Mon, 24 Jul 2023 01:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B42C433CA;
	Mon, 24 Jul 2023 01:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162443;
	bh=HBPxB4RSNktNe65BuqWS+L5dNFVXfE7ZABDYXvs5vsc=;
	h=From:To:Cc:Subject:Date:From;
	b=RUhqvw34kkZAd5pBAZmtJ/+HoxqO78WbfyaxZijh9Rt5CO8Rie3fzQLcaysa5Pvn2
	 6Xp3qDMkxhfMUzgTx0AZfgBv8nhOH+OgxBCEfATpKAPmBvn0NkF0Hj8Mv5Eyz2c2IM
	 kTqKPYXfr79rwerTr6s+u8mhOeSxkRn3jkHFacNkxRiqYfbh3mi0bMowQQMzMCjwD8
	 ngOuCAD+0G01iv7JMr7bvLJn5i3QD7Lr4faKlDFOfwm0p2SCltI92LVOWKWd6BKVXD
	 eVpB9gQCYdIkJipXbtDTeSbsT/J8zXEziVRN9yiWhxXFtlCnCJHfIWuG7+160zcX5z
	 5KJXSpYZipnSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	Pina Chen <pina.chen@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 01/16] media: v4l2-mem2mem: add lock to protect parameter num_rdy
Date: Sun, 23 Jul 2023 21:33:45 -0400
Message-Id: <20230724013401.2333159-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.186
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_183404_944637_A642D683 
X-CRM114-Status: GOOD (  10.63  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

[ Upstream commit 56b5c3e67b0f9af3f45cf393be048ee8d8a92694 ]

Getting below error when using KCSAN to check the driver. Adding lock to
protect parameter num_rdy when getting the value with function:
v4l2_m2m_num_src_bufs_ready/v4l2_m2m_num_dst_bufs_ready.

kworker/u16:3: [name:report&]BUG: KCSAN: data-race in v4l2_m2m_buf_queue
kworker/u16:3: [name:report&]

kworker/u16:3: [name:report&]read-write to 0xffffff8105f35b94 of 1 bytes by task 20865 on cpu 7:
kworker/u16:3:  v4l2_m2m_buf_queue+0xd8/0x10c

Signed-off-by: Pina Chen <pina.chen@mediatek.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/media/v4l2-mem2mem.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 5a91b548ecc0c..8d52c4506762d 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -588,7 +588,14 @@ void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
 static inline
 unsigned int v4l2_m2m_num_src_bufs_ready(struct v4l2_m2m_ctx *m2m_ctx)
 {
-	return m2m_ctx->out_q_ctx.num_rdy;
+	unsigned int num_buf_rdy;
+	unsigned long flags;
+
+	spin_lock_irqsave(&m2m_ctx->out_q_ctx.rdy_spinlock, flags);
+	num_buf_rdy = m2m_ctx->out_q_ctx.num_rdy;
+	spin_unlock_irqrestore(&m2m_ctx->out_q_ctx.rdy_spinlock, flags);
+
+	return num_buf_rdy;
 }
 
 /**
@@ -600,7 +607,14 @@ unsigned int v4l2_m2m_num_src_bufs_ready(struct v4l2_m2m_ctx *m2m_ctx)
 static inline
 unsigned int v4l2_m2m_num_dst_bufs_ready(struct v4l2_m2m_ctx *m2m_ctx)
 {
-	return m2m_ctx->cap_q_ctx.num_rdy;
+	unsigned int num_buf_rdy;
+	unsigned long flags;
+
+	spin_lock_irqsave(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags);
+	num_buf_rdy = m2m_ctx->cap_q_ctx.num_rdy;
+	spin_unlock_irqrestore(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags);
+
+	return num_buf_rdy;
 }
 
 /**
-- 
2.39.2


