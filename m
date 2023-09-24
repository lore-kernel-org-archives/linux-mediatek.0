Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0AFCE7A8B
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDTfwjIcgPzIDmWE6o/xYDGhx2K2MbbCVTAK8ngY5QU=; b=JsK40ZYXu2Tg4tE8/TbIjWqDpS
	/YnbYZO3wmS13amUl+TpEBvBOxYtb/zGD3pCRHYBUm5l+5cl4ywzGNrdlpxA/yDFhiYwtpeb1MCF1
	64aXxMKKquD3dxRKRQv0INK/3+J3lIwYXYbyLjXqPSblyavGCCGNGmeyd3cOavJvJrgbL/zG5qmwW
	1QwmuKLqvL/j0r7jUfnGGdrmV15vBX1MKXe96I2DduHquGXYLVmJaQHUAtzDT/xvTlvZ1j4CDIDw9
	uHCl44TSjdIkLwdvqwnvRcmAXT9YflDD0v4nFGL/AeFJVRMaV3DtMMnJ019ThOz0jN/x4nlg9Mel0
	HMjbFgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkP1D-00CIf3-15;
	Sun, 24 Sep 2023 13:19:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkP18-00CIcY-2z;
	Sun, 24 Sep 2023 13:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4FA08CE01CE;
	Sun, 24 Sep 2023 13:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBFDC433B7;
	Sun, 24 Sep 2023 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695561560;
	bh=5G+R8/4bS5QTwYkm4dcfzu9PDsZREyopQW5Nt0fIakw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NJOkFhaIY1q+p9+yESpQaZU9fFZpYFCSdeyhUQe/GkKNt3s1KS906xs6ctqayJwB2
	 K8I2WJQyl7jwwnSyMHuk1ODx+GWSxVYgBOELL0NuxgNJ7PogFOfm9qi49DMXogG/hq
	 g/k5XKHz41D3XUzfAJ2ECz3XVcP2gDM5ynhIUC27xUZ1goNZIhOYX7xVcJ7GqX/z8E
	 KcDf+HxuI2J2QwZ3GwsKZFEzDYFBUxTou30VvBtbAgGr0z7dLgudWwOe/kbntNAjad
	 MJmehbuIfkBUADvykpEPs24o/Yd0VMK+Cck94gkr3J4oDBfko5MVBqUcwVZC0r8+GF
	 bkAKDqtdqESGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tze-nan Wu <Tze-nan.Wu@mediatek.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 11/18] ring-buffer: Do not attempt to read past "commit"
Date: Sun, 24 Sep 2023 09:18:48 -0400
Message-Id: <20230924131857.1276330-11-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131857.1276330-1-sashal@kernel.org>
References: <20230924131857.1276330-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.133
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_061923_140914_21F818A3 
X-CRM114-Status: GOOD (  16.84  )
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

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

[ Upstream commit 95a404bd60af6c4d9d8db01ad14fe8957ece31ca ]

When iterating over the ring buffer while the ring buffer is active, the
writer can corrupt the reader. There's barriers to help detect this and
handle it, but that code missed the case where the last event was at the
very end of the page and has only 4 bytes left.

The checks to detect the corruption by the writer to reads needs to see the
length of the event. If the length in the first 4 bytes is zero then the
length is stored in the second 4 bytes. But if the writer is in the process
of updating that code, there's a small window where the length in the first
4 bytes could be zero even though the length is only 4 bytes. That will
cause rb_event_length() to read the next 4 bytes which could happen to be off the
allocated page.

To protect against this, fail immediately if the next event pointer is
less than 8 bytes from the end of the commit (last byte of data), as all
events must be a minimum of 8 bytes anyway.

Link: https://lore.kernel.org/all/20230905141245.26470-1-Tze-nan.Wu@mediatek.com/
Link: https://lore.kernel.org/linux-trace-kernel/20230907122820.0899019c@gandalf.local.home

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Reported-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/trace/ring_buffer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index b15d72284c7f7..69db849ae7dad 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2352,6 +2352,11 @@ rb_iter_head_event(struct ring_buffer_iter *iter)
 	 */
 	commit = rb_page_commit(iter_head_page);
 	smp_rmb();
+
+	/* An event needs to be at least 8 bytes in size */
+	if (iter->head > commit - 8)
+		goto reset;
+
 	event = __rb_page_index(iter_head_page, iter->head);
 	length = rb_event_length(event);
 
-- 
2.40.1


