Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76512CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wm/Q9vJ2tas3K3rcjLYa2PyWbgbTw72GxteCLrujtIU=; b=EqP29XMLY2bT/P7EApT6cdPeYt
	rjBj/ldeDhl0gJAVzv/shCHAgwDo0trDvQ/kRex9s6RHhjfz5DvWu6u+xGHtQZCZkgdRjUJjq7jqO
	uabiWOb9rUuHR9ot5AQOTfZPxzfapgXXeDaZpyQKqeyzk7axtiQCTMxeoEd6W+D8mh+MXodRUYi/4
	tUbkCYIKrjkbDqMLK18gLdAY5/REjrXatAEeLZ6eWxijyPG884fjtO67Gr64zh04G1W1TbMw2BRCI
	B8UFipu6gepRT9J6XKGeO3jBvENe2Bbz7Sr2M3gOi3p4PwJfp6pxPJ3AzcfLDQeccudNCR0zpQIjD
	qCIXToqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkOy8-00CHna-0F;
	Sun, 24 Sep 2023 13:16:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkOy4-00CHm6-1M;
	Sun, 24 Sep 2023 13:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 13E1EB80AD5;
	Sun, 24 Sep 2023 13:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2A5C433D9;
	Sun, 24 Sep 2023 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695561370;
	bh=x/nzVIl2gyab2szhiXSwlJxDiAJS0+cM22APpBMLpWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r9WbdCsYRg/r3dpMBafKadBK/68e5SzBABFciUk01lM7paNHf/SI0JAICisPUwpUI
	 bjdxL32SIrAeoLZyjTPF5hMTiFSbYJ8iRkgdl8SAV0quMwvvPqHzZ5/Gjz+jI31meI
	 3xlHf13cq4EeJMHB+FSOk5OshPmTO5J4Z7s7S/L8mZLmDP+H+6KbO1KO8nRlVRVNAh
	 ZU8T4ABxiJj13EVB2So9tTCjwwmGVxqw6ZZwJB6Clm1Z8gN8XcfuSlhwWbMHWdCh8n
	 BE3jRx7sWDhRjVfQZoOMW943fLQKYodw35MJMABIjpaWbBTS/XmtGVEcKtqupFVHr5
	 cD9hwtkUHaqvQ==
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
Subject: [PATCH AUTOSEL 6.5 17/41] ring-buffer: Do not attempt to read past "commit"
Date: Sun, 24 Sep 2023 09:15:05 -0400
Message-Id: <20230924131529.1275335-17-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_061612_601253_A7243DAC 
X-CRM114-Status: GOOD (  16.64  )
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
index 1267e1016ab5c..53b73b85cf737 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2398,6 +2398,11 @@ rb_iter_head_event(struct ring_buffer_iter *iter)
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


