Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CC8C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 01:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c3hNHEK4ngsuecbMOanvheQ+Y5qK4S8SilPh5lyWLhk=; b=KT6HPmoAaA8NIWYOM2X93ilQjt
	qEpu+FlHqERvljZPCrEardwvnp+B3ps32fe8RtkWiU+R+GKzpNc+U+FEqAi4MOh5bJRJ24H4Na2Pt
	YncdFJdrFes3Q9jlFxUFDIZfDq8l4/5X9vvXn4cy9+3Kq40BN4YCS2sFuLsHLI8X4dok9bs2Gcg4F
	fWEAgFx2FuCvtBV3b13hOM+xyI4rMLgyup7QVsRGyTQ4FJTY6nYOhDysCan9HufdMK0Ly1M/p18yj
	uphNjc4hDHyXN93B4OZqsCTm9XuhNER79Am4qLpayGlaQ/Dk9Iu35Ulurca10TtJ0D6PYUQK3wQ7e
	40jr2hBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkT4-002Okd-25;
	Mon, 24 Jul 2023 01:34:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkT0-002OiG-0Q;
	Mon, 24 Jul 2023 01:34:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5486460F1A;
	Mon, 24 Jul 2023 01:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9E6C433C9;
	Mon, 24 Jul 2023 01:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162468;
	bh=LFXWMkfDiUDwx/BpayJngmYjVbhdF3GuvRAsrQT52do=;
	h=From:To:Cc:Subject:Date:From;
	b=lGxEIXtZd5n0ecjk5cWsxwfVLd5QxWwGhJliaAf5Otx7ORiVufGs7ZC7S191IPb0z
	 mlpkNur6EsAGoscN2Zz8fGBlaubLfHtEvU3Jc7JqdkLA0EzCkxHalMhoFFue5xd+ZT
	 yBtquRzBp7RBXA4rjTU1zDdshxk86GgSLKALZengEeyf38Cpovtcf7By3znSVSrYxa
	 sjwmZ6y1dfrUeyvHD9quMvHyWiKUGZpTYeSMAA6SbVsQ4lipaUryGJMxwdn4BzhvF0
	 A1u5QwTDWlP9LlYer5A7E4AtDyFmJpZFVV3ezEJVv20NYF43+Xg8rLoLlkJaNybRF1
	 pXx76jwDGDY9A==
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
Subject: [PATCH AUTOSEL 5.4 01/12] media: v4l2-mem2mem: add lock to protect parameter num_rdy
Date: Sun, 23 Jul 2023 21:34:14 -0400
Message-Id: <20230724013426.2333833-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.249
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_183430_211096_FDB5BD3A 
X-CRM114-Status: GOOD (  11.00  )
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
index 0b9c3a287061e..57b48c33f56cf 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -401,7 +401,14 @@ void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
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
@@ -413,7 +420,14 @@ unsigned int v4l2_m2m_num_src_bufs_ready(struct v4l2_m2m_ctx *m2m_ctx)
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


