Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5F9CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfvpEAMGK+6r8FLLKbnrE+dLm/z7tM4hUzY6qJLeZuw=; b=JzchfAh0L7PCIKYQd1y0Dzglg8
	5NsMGvZk6WSsGhAyFqZVv8WsoOr+rh/opVlTbXocl3PPXTYYKJctn6bZpEdsW1RGu8RK4zrc9noDr
	vx2rAkhV/Z1l21OonSIaVaYPXdj8/op5DRHYrWtEKlvT3mRyJVne2ba93RG2nt+UnhESQz3OnbuAu
	33uZwxeCpr0G4gjXbCumHjL5D6oDkLAbaMH1kBjxHxC1GoJYw5hnOiImX3L0sgLuHBm7n2IThdqz9
	46qt8hV3muTPik6rrWIYD5kJYOCDqDMuE6fFqnGxWUluv2wcZDZa3TtaTn0amA85s/9nV1So0C6cU
	ni2F99ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkP0D-00CIIq-1y;
	Sun, 24 Sep 2023 13:18:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkP0A-00CIHO-1d;
	Sun, 24 Sep 2023 13:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 34193B80ADB;
	Sun, 24 Sep 2023 13:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CE8C433C8;
	Sun, 24 Sep 2023 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695561500;
	bh=v+kjxH+8OrRaW4gMS8neV9tdlMoMKrRmQAPLQr171wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q36FmwPGmlxD2F67ahXk98i1FS/eoXRilbaFywEBthDF5EnNmKIO+8t9IWJxucxsS
	 Q3e0LFVHs9VbLaazTjaUma8nIfFvlpH1gy291oWd/ZrXu8A2SFcGoZ6XhDC0j5GHe9
	 cX4jUegYuJiMKI7rayQ4bmL5idQhchec5EfCAonbOeg6X2wfv+CjZM+nx4BBQxgOu0
	 MiO4/D/AvyWNIjYE+xsUypDUZ7TPvIOD4/K+LJNEoI2z7UX9Q6lXLk/zm7w6i2Mx7G
	 wFkQ8BTTZuLHZ5oxb2XuPA5XRfb4mmarZYn0WmIIaIviqU6odC4rNQncF7nSicZPfr
	 c/kqSj0TKq9Qg==
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
Subject: [PATCH AUTOSEL 6.1 14/28] ring-buffer: Do not attempt to read past "commit"
Date: Sun, 24 Sep 2023 09:17:31 -0400
Message-Id: <20230924131745.1275960-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131745.1275960-1-sashal@kernel.org>
References: <20230924131745.1275960-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.55
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_061822_677288_798E5AFB 
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
index 42ad59a002365..c0b708b55c3b9 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2388,6 +2388,11 @@ rb_iter_head_event(struct ring_buffer_iter *iter)
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


