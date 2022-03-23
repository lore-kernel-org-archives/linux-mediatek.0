Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A13C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DreIGgpYzNqEEPqMf3a+xtyE8o6ZWyJbgOF0jTUxJJU=; b=BltQmiqgx51/7t
	I6T9fv2ywGKqDXvjW2pZEfnpREaRXBuiiEFvisF+O0jMhAbEzBemS0OVI7Zt5wBwFB9+y5HQgiXy8
	EoaihNs7cjYgfZjkGmbseEJb39O4XcX4+Z3F9b5WZpxMlyGMwXEz3DCmbu9QgAC7oUTp5U7gyfkaa
	umzUsE7tnoubCVtCu4dHhWylInVFVz3e3ycqVFRJ27SUn57St3DHwK6fzsUro7FvAGJS1aea7Mw+/
	kAmjoaDp9Q6FhyQfqHo6LGU6SCtNm/BsyIRxbE1Ti+g6DnT/eokMrnYDtkxX67psNdbMz4s4jlOib
	UHOuTKXpvwOfzwNb3o+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX2py-00E4xX-KJ; Wed, 23 Mar 2022 15:23:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX2pQ-00E4jv-B8; Wed, 23 Mar 2022 15:23:18 +0000
X-UUID: b74d6884eb1a453399c9eb8b02f005ab-20220323
X-UUID: b74d6884eb1a453399c9eb8b02f005ab-20220323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 366619251; Wed, 23 Mar 2022 08:23:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 08:23:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 23:23:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Mar 2022 23:22:59 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>, <mingo@redhat.com>
CC: <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>
Subject: [PATCH v3 0/2] tracing: make tracer_init_tracefs initcall asynchronous
Date: Wed, 23 Mar 2022 23:22:55 +0800
Message-ID: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_082316_458447_AC23FA75 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move trace_eval_init() to subsys_initcall to make it start
earlier.
And to avoid tracer_init_tracefs being blocked by
trace_event_sem which trace_eval_init() hold [1],
queue tracer_init_tracefs() to eval_map_wq to let
the two works being executed sequentially.

It can speed up the initialization of kernel as result
of making tracer_init_tracefs asynchronous.

On my arm64 platform, it reduce ~20ms of 125ms which total
time do_initcalls spend.

Mark-PK Tsai (2):
  tracing: Avoid adding tracer option before update_tracer_options
  tracing: make tracer_init_tracefs initcall asynchronous

 kernel/trace/trace.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
