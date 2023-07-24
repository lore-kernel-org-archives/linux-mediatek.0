Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C2C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 01:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtMhqfMU1mksJ9TkJRE4oQFoAlRrGgnjTWrn39pQ17o=; b=Z7U2BmJ5J4mu4jdSJPcKkuxYKR
	JtLq4I5vR8j6t0jo6odLTdJJQktMCE0trH6ftvSK/cmOkAuPWDVDS52deF8TPxoPI0eYpW5JHdzNd
	dw4YM2mol9AuNxwrP+1D8K9ya2haGg3b5TW/dc8AYCSzAyMtN7QkC7TtA+SZlReIg5VmAeTEDogMD
	C241BqwKwD6AWyGGIvfVd3+eQSlhVDmdHWZ9pHijZoF3r+QARslZJ0lp5z0/Y5i9IOE7GpW4eQYiK
	jpCl796i+lTmUUbNh0LHlntNaKbw6gr+t8GWcv7vMqeFJZA3I7sxjMKtW7U4VIRBfpSUdxwAHdt6d
	r6R3rGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkQU-002Ny6-2X;
	Mon, 24 Jul 2023 01:31:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkQN-002Nvt-1P;
	Mon, 24 Jul 2023 01:31:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F29D360F37;
	Mon, 24 Jul 2023 01:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E549C433CC;
	Mon, 24 Jul 2023 01:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162306;
	bh=sPgqBc9MDblYXPHS71Myl2hrzTAGjCrucv1FSII+xSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PtQYyWlGdOnS/jH+ZGCJWimp1grJZ870ZbuAmtEcoGrx0nrxAL7SvjUYHdKg6zQ/7
	 Np8RA9UxpR97BtTkCcF5YOMfrIXaN33he67Perlix7m6rFZNPM8XwHqQU34UF3OSMj
	 LGXgMy8+6dbF3RO2KgZ3jnJZu8X3HSrN13mx5nTtOcq2gLF3scOxYyNpQpD7cIxwwW
	 0EExZx8tkUGTVe0DPgs7wwGgyabBw4X91xi/TvDIcSaRhKi3E5yoBCMYjuCrl4qCTl
	 JxXS9ddCIk8/Q5VnFSYZWrvXvLt7m10uwjIPCMbfoLxXUP6kiwuUtPB6UPljOH26U2
	 1O8tG11yY7yHQ==
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
Subject: [PATCH AUTOSEL 6.4 03/40] media: v4l2-mem2mem: add lock to protect parameter num_rdy
Date: Sun, 23 Jul 2023 21:31:03 -0400
Message-Id: <20230724013140.2327815-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013140.2327815-1-sashal@kernel.org>
References: <20230724013140.2327815-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_183147_519088_21E1B509 
X-CRM114-Status: GOOD (  11.30  )
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
index bb9de6a899e07..d6c8eb2b52019 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -593,7 +593,14 @@ void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
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
@@ -605,7 +612,14 @@ unsigned int v4l2_m2m_num_src_bufs_ready(struct v4l2_m2m_ctx *m2m_ctx)
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


