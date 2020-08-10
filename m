Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072CEC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 11:20:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA1B8206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 11:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YCAXIqSQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="AC8ZVjcV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA1B8206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:Date:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zQfzaYlbhJGvx/YZRL0WQwMousMjxg9Xj/qyXc1uWyc=; b=YCAXIqSQAz4KsdAl1010tCLr3
	1mjRT80E1j4xvbNkeV5m03LDYzTCIIUJbP9CFXDWmxCuzbOy1Lt+VArN+59JmE8FFRfhTEec68Eo9
	725NgskXYxQOdov5qdB4GhOQ2WdeSizFulmpJULEJnFTQHo3InQhDDCC1s0VzjIx2V0ms06HQ/+0L
	mZGPWTprZDIeXp4ImB0w+m3Uu2tiooqZq1XnCy9RO6Qj/Vc2skzTfkZBQPRll7enwRMyAgmFDapdj
	yDh+w6AfdIPO5PkIxn2PTtHobUycRNov4W+L9imQAVgZWPOMb9qgC4ormE4t6Gco6HTTbiaOFykLE
	44TwPgryw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k55qG-00041r-Db; Mon, 10 Aug 2020 11:19:48 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k55qB-000406-GB
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 11:19:44 +0000
Received: by mail-qk1-x741.google.com with SMTP id b79so7887825qkg.9
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 04:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=jBoqTcJjXqs5aO9SnK52GQyuo0v59XIXZ4pSXxs8r7w=;
 b=AC8ZVjcVv/L1gU8pXCKrOqaZ6vVq6XYgBjH2Hnm+JxbKrX1w5Fuuq8tGRaPTmcrs/f
 mJIHbtSmH/nnaQMZS4xirhZfVsoXp5JvBB21U5dnsFG9ZvZTPC38v77lG6WG92amYQGK
 yYE4WLzofc8nU/u3+NcZZLV+J7FAU2IjheLHFddS9jMSJqzabuU1T7hSyVoiT1+2ljAu
 54004XHqK+k/qXzk487itILNgkbds1WB/yUrp5q6w9OpnK/rUe1AJYkaY0PDQ3EZBybm
 /2lxTwtsKaKphX0xEVrMryVTz//L94l9ZRi2id7gCcyoPX8zF5wwyB62zfkgJ+toO/w4
 PkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=jBoqTcJjXqs5aO9SnK52GQyuo0v59XIXZ4pSXxs8r7w=;
 b=Ai5hqkbkORTPeqyXvILs9UIJyJg5lwxqN6Uhzd40DSzNH8HEFVtEE5H/IyYp1yhWj7
 hDlt95TMAGsiKwD7nef0iQ6NwxJhftvQ6KoEEgFsghyCifWqnSXqoZOj8xIKktI/S9ns
 4LNyFzbIuRikSfnECUNQOn6lq3JdQYyI21FAQ5hlrCONk0+UMLAjzXX1nzohuaZyDVXl
 hLSKfZ83u6Vfjp9XoVXipUZgrE00FDoZ1Hf5gipJX9arAMzOQGOKGSYJriTEzJ0gWnvn
 EM22oNiTieL1TVDC+iD2gDzEpz4tsBTjiVDGD9+O93mGHAPBku43v/B2RNAVY3b3weXM
 aGnA==
X-Gm-Message-State: AOAM53388hyFLo5u2yaLNl8sWHKe1BNidL6OOASZGTygNdHS2Ub+0hbI
 IR6718EcC39qKB0H+BNmVOrrRQ==
X-Google-Smtp-Source: ABdhPJxbYWJL54iYtvN7kseO1/qs8NUOF49R1djsu38CnnLAFIRAGsxnqDfsY9uF6MEN5J7f/NaM2w==
X-Received: by 2002:a05:620a:142:: with SMTP id
 e2mr25276476qkn.418.1597058378182; 
 Mon, 10 Aug 2020 04:19:38 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 78sm13980983qke.81.2020.08.10.04.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 04:19:36 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/5] kasan: add workqueue and timer stack for generic KASAN
Date: Mon, 10 Aug 2020 07:19:35 -0400
Message-Id: <B873B364-FF03-4819-8F9C-79F3C4EF47CE@lca.pw>
References: <20200810072115.429-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200810072115.429-1-walter-zh.wu@mediatek.com>
To: Walter Wu <walter-zh.wu@mediatek.com>
X-Mailer: iPhone Mail (17F80)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_071943_560487_68FE9DDF 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mm@kvack.org,
 Stephen Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 Tejun Heo <tj@kernel.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIEF1ZyAxMCwgMjAyMCwgYXQgMzoyMSBBTSwgV2FsdGVyIFd1IDx3YWx0ZXItemgud3VA
bWVkaWF0ZWsuY29tPiB3cm90ZToKPiAKPiDvu79TeXpib3QgcmVwb3J0cyBtYW55IFVBRiBpc3N1
ZXMgZm9yIHdvcmtxdWV1ZSBvciB0aW1lciwgc2VlIFsxXSBhbmQgWzJdLgo+IEluIHNvbWUgb2Yg
dGhlc2UgYWNjZXNzL2FsbG9jYXRpb24gaGFwcGVuZWQgaW4gcHJvY2Vzc19vbmVfd29yaygpLAo+
IHdlIHNlZSB0aGUgZnJlZSBzdGFjayBpcyB1c2VsZXNzIGluIEtBU0FOIHJlcG9ydCwgaXQgZG9l
c24ndCBoZWxwCj4gcHJvZ3JhbW1lcnMgdG8gc29sdmUgVUFGIG9uIHdvcmtxdWV1ZS4gVGhlIHNh
bWUgbWF5IHN0YW5kIGZvciB0aW1lcy4KPiAKPiBUaGlzIHBhdGNoc2V0IGltcHJvdmVzIEtBU0FO
IHJlcG9ydHMgYnkgbWFraW5nIHRoZW0gdG8gaGF2ZSB3b3JrcXVldWUKPiBxdWV1ZWluZyBzdGFj
ayBhbmQgdGltZXIgcXVldWVpbmcgc3RhY2sgaW5mb3JtYXRpb24uIEl0IGlzIHVzZWZ1bCBmb3IK
PiBwcm9ncmFtbWVycyB0byBzb2x2ZSB1c2UtYWZ0ZXItZnJlZSBvciBkb3VibGUtZnJlZSBtZW1v
cnkgaXNzdWUuCj4gCj4gR2VuZXJpYyBLQVNBTiB3aWxsIHJlY29yZCB0aGUgbGFzdCB0d28gd29y
a3F1ZXVlIGFuZCB0aW1lciBzdGFja3MsCj4gcHJpbnQgdGhlbSBpbiBLQVNBTiByZXBvcnQuIEl0
IGlzIG9ubHkgc3VpdGFibGUgZm9yIGdlbmVyaWMgS0FTQU4uCj4gCj4gSW4gb3JkZXIgdG8gcHJp
bnQgdGhlIGxhc3QgdHdvIHdvcmtxdWV1ZSBhbmQgdGltZXIgc3RhY2tzLCBzbyB0aGF0Cj4gd2Ug
YWRkIG5ldyBtZW1iZXJzIGluIHN0cnVjdCBrYXNhbl9hbGxvY19tZXRhLgo+IC0gdHdvIHdvcmtx
dWV1ZSBxdWV1ZWluZyB3b3JrIHN0YWNrcywgdG90YWwgc2l6ZSBpcyA4IGJ5dGVzLgo+IC0gdHdv
IHRpbWVyIHF1ZXVlaW5nIHN0YWNrcywgdG90YWwgc2l6ZSBpcyA4IGJ5dGVzLgo+IAo+IE9yaWdu
aWFsIHN0cnVjdCBrYXNhbl9hbGxvY19tZXRhIHNpemUgaXMgMTYgYnl0ZXMuIEFmdGVyIGFkZCBu
ZXcKPiBtZW1iZXJzLCB0aGVuIHRoZSBzdHJ1Y3Qga2FzYW5fYWxsb2NfbWV0YSB0b3RhbCBzaXpl
IGlzIDMyIGJ5dGVzLAo+IEl0IGlzIGEgZ29vZCBudW1iZXIgb2YgYWxpZ25tZW50LiBMZXQgaXQg
Z2V0IGJldHRlciBtZW1vcnkgY29uc3VtcHRpb24uCgpHZXR0aW5nIGRlYnVnZ2luZyB0b29scyBj
b21wbGljYXRlZCBzdXJlbHkgaXMgdGhlIGJlc3Qgd2F5IHRvIGtpbGwgaXQuIEkgd291bGQgYXJn
dWUgdGhhdCBpdCBvbmx5IG1ha2Ugc2Vuc2UgdG8gY29tcGxpY2F0ZSBpdCBpZiBpdCBpcyB1c2Vm
dWwgbW9zdCBvZiB0aGUgdGltZSB3aGljaCBJIG5ldmVyIGZlZWwgb3IgaGVhciB0aGF0IGlzIHRo
ZSBjYXNlLiBUaGlzIHJlbWluZHMgbWUgeW91ciByZWNlbnQgY2FsbF9yY3UoKSBzdGFja3MgdGhh
dCBtb3N0IG9mIHRpbWUganVzdCBtYWtlcyBwYXJzaW5nIHRoZSByZXBvcnQgY3VtYmVyc29tZS4g
VGh1cywgSSB1cmdlIHRoaXMgZXhlcmNpc2UgdG8gb3Zlci1lbmdpbmVlciBvbiBzcGVjaWFsIGNh
c2VzIG5lZWQgdG8gc3RvcCBlbnRpcmVseS4KCj4gCj4gWzFdaHR0cHM6Ly9ncm91cHMuZ29vZ2xl
LmNvbS9nL3N5emthbGxlci1idWdzL3NlYXJjaD9xPSUyMnVzZS1hZnRlci1mcmVlJTIyK3Byb2Nl
c3Nfb25lX3dvcmsKPiBbMl1odHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2cvc3l6a2FsbGVyLWJ1
Z3Mvc2VhcmNoP3E9JTIydXNlLWFmdGVyLWZyZWUlMjIlMjBleHBpcmVfdGltZXJzCj4gWzNdaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTg0MzcKPiAKPiBXYWx0
ZXIgV3UgKDUpOgo+IHRpbWVyOiBrYXNhbjogcmVjb3JkIGFuZCBwcmludCB0aW1lciBzdGFjawo+
IHdvcmtxdWV1ZToga2FzYW46IHJlY29yZCBhbmQgcHJpbnQgd29ya3F1ZXVlIHN0YWNrCj4gbGli
L3Rlc3Rfa2FzYW4uYzogYWRkIHRpbWVyIHRlc3QgY2FzZQo+IGxpYi90ZXN0X2thc2FuLmM6IGFk
ZCB3b3JrcXVldWUgdGVzdCBjYXNlCj4ga2FzYW46IHVwZGF0ZSBkb2N1bWVudGF0aW9uIGZvciBn
ZW5lcmljIGthc2FuCj4gCj4gRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva2FzYW4ucnN0IHwgIDQg
KystLQo+IGluY2x1ZGUvbGludXgva2FzYW4uaCAgICAgICAgICAgICB8ICA0ICsrKysKPiBrZXJu
ZWwvdGltZS90aW1lci5jICAgICAgICAgICAgICAgfCAgMiArKwo+IGtlcm5lbC93b3JrcXVldWUu
YyAgICAgICAgICAgICAgICB8ICAzICsrKwo+IGxpYi90ZXN0X2thc2FuLmMgICAgICAgICAgICAg
ICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+IG1tL2thc2FuL2dlbmVyaWMuYyAgICAgICAgICAgICAgICB8IDQyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IG1tL2thc2FuL2thc2FuLmggICAg
ICAgICAgICAgICAgICB8ICA2ICsrKysrLQo+IG1tL2thc2FuL3JlcG9ydC5jICAgICAgICAgICAg
ICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiA4IGZpbGVzIGNoYW5nZWQsIDEzNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IFlvdSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMg
Imthc2FuLWRldiIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBz
dG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBrYXNhbi1kZXYr
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4KPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBv
biB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9rYXNhbi1k
ZXYvMjAyMDA4MTAwNzIxMTUuNDI5LTEtd2FsdGVyLXpoLnd1JTQwbWVkaWF0ZWsuY29tLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
