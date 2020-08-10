Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8619C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:34:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 949DE2073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:34:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iEqvsw7K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qLCWArRY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 949DE2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hH1s/u7rA7tz6R2R0qCyJWDkcK/tkJNiDEadYYilze8=; b=iEqvsw7KJxDQ8wSOrjJgRQer5W
	f4RWXJYBuvRp0VOr3t5nP0+vg+KEWyR2XIsj2zY+DkLPlGPH0xZV7ljHzbF/B5HqOKbTXJ0H5UglF
	Gt3UEGxxsgHcClq7xQpFCcYnZ5mjqGO/0i7WXZUb4tzb/TeLHMT9E0TYOWkpKFAuIZnh+9r/l+rli
	UlywOiOr4Ls7HI1TZC9Qu5U2KC3WwRjD+cX7OMO14L16TdcUnKKx2sUqVyQbtpW+0O7CLvPSuviaP
	qhpc3lFs2oDmBmhum4aiG5d5GDbv1EPopwgOxKnTR/5r0kzTEUjZI/mK9aXsMgsxJXJkhsNofLv6Q
	PEUVNbKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k52KT-0005C9-Bb; Mon, 10 Aug 2020 07:34:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k52KM-00059A-Db; Mon, 10 Aug 2020 07:34:39 +0000
X-UUID: be188d1ac12f46d9875eed086b8cbbde-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fNYSYPr/EUtrb5AE0HZcFt+MO/QDfADl7kGfo3uCntY=; 
 b=qLCWArRYBL/s6QmwRwC3W+F72p9XtzECtMFBScH4yYdUFvvN7ueXYRBWMcoF4CFretyV4ITarA4dV9LFynSRAuCN4ZU2AhLtYeDkwK4XxC9bF9pduJVsvFzwAjq5YBzzdLx4TvJF/uLP6pINCabHP7X22ThUj0g396i28XdQ4lg=;
X-UUID: be188d1ac12f46d9875eed086b8cbbde-20200809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 759410396; Sun, 09 Aug 2020 23:34:27 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 00:28:48 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 15:28:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Aug 2020 15:28:46 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 5/5] kasan: update documentation for generic KASAN
Date: Mon, 10 Aug 2020 15:28:47 +0800
Message-ID: <20200810072847.921-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_033438_600187_DF112B2D 
X-CRM114-Status: GOOD (  14.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Generic KASAN support to record the last two timer and workqueue
stacks and print them in KASAN report. So that need to update
documentation.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/dev-tools/kasan.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index fede42e6536b..5a4c5da8bda8 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -193,8 +193,8 @@ function calls GCC directly inserts the code to check the shadow memory.
 This option significantly enlarges kernel but it gives x1.1-x2 performance
 boost over outline instrumented kernel.
 
-Generic KASAN prints up to 2 call_rcu() call stacks in reports, the last one
-and the second to last.
+Generic KASAN prints up to 2 call_rcu() call stacks, timer queueing stacks,
+and workqueue queueing stacks in reports, the last one and the second to last.
 
 Software tag-based KASAN
 ~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
