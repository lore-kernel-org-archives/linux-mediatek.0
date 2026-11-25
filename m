Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C8606A329
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ex69hbqd;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=VWvc5xgG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yx9YK7GyALNlSIOlyd6tdiuojVKohVxx5VZC4AGzrUg=; b=Ex69hbqdRRSzLn
	3kBjN+Ly0Te15huI6NDHNsWdghQB9oOjrGSzl4VMCxDhZ1QnqFJLjoB7T7dWurN2DOIVSCreyqYZi
	IypKMkYK2YwbkCOGpDrvbSeCk3XVVg+LP3njuAd2loykb862uNBHtMtczAvJjOJ1Ij//T1gZg9BlX
	g6tXNviSTHb2Geqe6JTab455Xby7FscEKmKjdT2LvKr9LRIXcSdmP06DSLPzVW82AwrZKQZD9PtH2
	UmbqP9W/rsitkzM1bHPd+TkWStrKeD2mowVaubBoO170zRTm/fAvxnY/8mOC5xRstZ3inrmxeB4LT
	XmzIc2UQ4LTrHnXJ5FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF1T-0000000AMyG-12AU;
	Wed, 25 Nov 2026 15:35:03 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF1N-0000000AMwS-426n;
	Wed, 25 Nov 2026 15:35:02 +0000
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B8FB1A0FB5;
	Wed, 25 Nov 2026 15:34:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 6455B20016;
	Wed, 25 Nov 2026 15:34:51 +0000 (UTC)
Date: Wed, 25 Nov 2026 10:34:50 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Martin Kaiser
 <martin@kaiser.cx>, Vinod Koul <vkoul@kernel.org>,
 <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/1] tracing: Fix UBSAN shift-out-of-bounds in
 test_event_printk()
Message-ID: <20261125103450.5ac2cb14@gandalf.local.home>
In-Reply-To: <20261125080431.1612026-1-kuyo.chang@mediatek.com>
References: <20261125080431.1612026-1-kuyo.chang@mediatek.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6455B20016
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Rspamd-Server: rspamout08
X-Stat-Signature: ubqde6ieu3wdxtk8jdhq1tp7gf991wrc
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/JLtkXh3EEEE35Z0otfqP+yQWg8VULYJc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=yx9YK7GyALNlSIOlyd6tdiuojVKohVxx5VZC4AGzrUg=; b=VWvc5xgG/+glr+78M8MPdPTRirY2FRLf7NiL8eY4xUMujYNoszr0W7v4665cG8Q3RpArRQBb+aYIzCCsRsYwwzx05Ovaz0hZLLZytXdTsf4zU7dxldoQ543ySEy7MWNXKbHzAZEj3g6AwLVwpjggxeAq1KZrcsbBS4bTi50Av0s=
X-HE-Tag: 1795620891-404864
X-HE-Meta: U2FsdGVkX18C7udoKw12/AiHBrrty8VxiPCnt1dz7a0K2CPgVnK39U+tiZVbMUG0XznJYcP8D/G4dF0WEmPOS/6MvG5jDwMfS1nVfjcrTGZIq4r6EnJO+u+A59uuGDDS+AZezMMpTIs2whZ3YQrxA+uglJj6UcWN9ZxeIyxsW9FF2Ikw+73OEYebLNIGhRFAXLTE9LFa4t02CdbbbZzCyFGUOINKa7nG1WFLmbeF+bcQgpKjfhpyJutl2AstX+LOBrFlhc7kLwy3Hbd0LLOtu/691a3GFu6eDHnLUq3sMrNU0Znqkph4CwX0v7iFboeEinWSLba7R9ekkOOVbR9Xe7e7VIeOJsLaKL1tbaUMJlDxrBEfj//WhQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073458_067325_97AA2417 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 16:03:56 +0800
Kuyo Chang <kuyo.chang@mediatek.com> wrote:

> Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
> in TP_printk()") removed the early return when dereference_flags is zero
> so that test_double_dereference() can check all event arguments.
> 
> As a result, trace events with more than 64 arguments in TP_printk() now
> always reach the argument-parsing loop and evaluate (1ULL << arg) when
> arg >= 64, triggering a UBSAN shift-out-of-bounds trap.
> 
> Additionally, in the format string parsing loop, the bounds check only
> tested 'arg == 63'. If the first 64 specifiers are non-pointer and
> non-string formats (e.g., %d) and a subsequent specifier (arg >= 64) is
> %s or %p*, 'arg == 63' evaluates to false and '1ULL << arg' also shifts
> out of bounds.
> 
> Fix both issues by changing the upper bound check to 'arg >= 63' and
> guarding the '(1ULL << arg)' checks in the argument loop with
> 'arg < 64'.
> 
> Fixes: b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer in TP_printk()")
> Cc: stable@vger.kernel.org

I'll add this as a cleanup but I'm nuking the above tags. There is no event
with anywhere close to 64 args. These checks were simply a failsafe in case
they ever happened (which they likely will never do).

-- Steve

