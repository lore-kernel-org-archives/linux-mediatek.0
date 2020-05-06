Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E81C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC0F206D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLEhg1m1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="bHT6W/fW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC0F206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWlcI3cIfERBZHODL3bX11P4TkDMq3KvF8AhZ6Q0K5A=; b=hLEhg1m1BsFQD/
	wsuc3gF7OjU81Bh7tuTCR/NTO1WcX+DMXSXElcfgJYd7J7hOQZozZwFPgAStAvxekXZqfcKCYVRgd
	KTnv1Et0lcFOKzCEGImC97311/PD82GpZZg8jjwkBnH13s7UWsR2ydmhlZHziYRPOHlyWAZVW9xJr
	jg6Qt/beGTTzE6McHjt+isCDMXJHiDASQG4Y/qSOjq95hiSm7btrgLUzmGc6fT2NBjm7L15banVRX
	2cYrGQ3IPNUxzPVF69UTxEqDYLjtdkFszu0Wn7TkuxnBB31x3pF1fSFtsv9jcWt0oz8UTjVdBRuN8
	LLZLhlq6UUYFcaDkvOcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWD0A-0000mc-12; Wed, 06 May 2020 05:53:50 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWCzw-0000bL-Cb
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 05:53:37 +0000
Received: by mail-qk1-x741.google.com with SMTP id c10so822903qka.4
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=22ofnai8Kmb8nUlZsIXdX+pSRFQQCaWUWDTVletlIn8=;
 b=bHT6W/fWOA40fzVohmqwgewBY83jYMapJYxNmoWYZVRhjvCcN/uCGzLtu9ZZpjegPt
 Q5UbabCAQpEu6VOQ2/0bfia7psVZhQGM9SB5PDcKKTxpXQn9IS3XpkRWbxDGHYQAG7N1
 ovzcSLqAS+e8Fw4CCoKn+w1qIPMvetUcoab0V7CJoEZh64Q5tvUMem8gw2iKrTYXkngI
 YqVYPnFDEVpL7n0s2gMY4wNqTWgAriIEJAvPIW46iz2mFzAkM75yNUg8U+l18gc8m3i9
 irKLWLsMowcpjqZtMkd8CoZmJ6mEW1aJe6aQcZk2+U4qiUPJRXSGghS4vawiCrNLWoCM
 CvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=22ofnai8Kmb8nUlZsIXdX+pSRFQQCaWUWDTVletlIn8=;
 b=M/YLVCxfwadv6n39EtULbTVxkNcV4iuGEHlWL9dbDWX9K1py4NQhEMBjOnYjc2uTUF
 DpQDSTLseqyCt/dU8BCnFtSnAO1uIbOrXoBqeotNNELXLvU/Z86AZD5DzZhCEkrjjUHJ
 rgVa8+QV0NzBQ0jsfdKo07DoypTdtcLUQpVndEiwHJIBCj79zRqifIa0LO0pHnUy3Pdt
 57KjzbSE1zHNMvSQk8Q0PI5eL1E60UZ6tGHGIRgtyoI7hUv75DIWyiyLsKtZq0zKHg2E
 oO4Zs2fs7PUMXmnw8LWqiOAPnh4egENr/d9vVAj4yod7SWQMiDQz0yNeg8IhoRgR6O1y
 m4tg==
X-Gm-Message-State: AGi0PuZhL9kyUAkNjVXj6tQuS5N53+2tOaoKjucc68lfl4ybeurXYj8f
 tlKSsVDnxiVddBmNgHl//bdDciJezzvfSw==
X-Google-Smtp-Source: APiQypLikjqrC0WTXdzYihbO3/y7LWLnb+LLpLiSTCvKKz620VCQubf/5jDWJa4A3ZgrSWfdszM/kA==
X-Received: by 2002:a05:620a:a12:: with SMTP id
 i18mr6804658qka.316.1588744413624; 
 Tue, 05 May 2020 22:53:33 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id p31sm706132qtf.11.2020.05.05.22.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 22:53:33 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/3] kasan: memorize and print call_rcu stack
Date: Wed, 6 May 2020 01:53:31 -0400
Message-Id: <2BF68E83-4611-48B2-A57F-196236399219@lca.pw>
References: <20200506051853.14380-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200506051853.14380-1-walter-zh.wu@mediatek.com>
To: Walter Wu <walter-zh.wu@mediatek.com>
X-Mailer: iPhone Mail (17D50)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_225336_455526_152F6D58 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-mm@kvack.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIE1heSA2LCAyMDIwLCBhdCAxOjE5IEFNLCBXYWx0ZXIgV3UgPHdhbHRlci16aC53dUBt
ZWRpYXRlay5jb20+IHdyb3RlOgo+IAo+IFRoaXMgcGF0Y2hzZXQgaW1wcm92ZXMgS0FTQU4gcmVw
b3J0cyBieSBtYWtpbmcgdGhlbSB0byBoYXZlCj4gY2FsbF9yY3UoKSBjYWxsIHN0YWNrIGluZm9y
bWF0aW9uLiBJdCBpcyBoZWxwZnVsIGZvciBwcm9ncmFtbWVycwo+IHRvIHNvbHZlIHVzZS1hZnRl
ci1mcmVlIG9yIGRvdWJsZS1mcmVlIG1lbW9yeSBpc3N1ZS4KPiAKPiBUaGUgS0FTQU4gcmVwb3J0
IHdhcyBhcyBmb2xsb3dzKGNsZWFuZWQgdXAgc2xpZ2h0bHkpOgo+IAo+IEJVRzogS0FTQU46IHVz
ZS1hZnRlci1mcmVlIGluIGthc2FuX3JjdV9yZWNsYWltKzB4NTgvMHg2MAo+IAo+IEZyZWVkIGJ5
IHRhc2sgMDoKPiBzYXZlX3N0YWNrKzB4MjQvMHg1MAo+IF9fa2FzYW5fc2xhYl9mcmVlKzB4MTEw
LzB4MTc4Cj4ga2FzYW5fc2xhYl9mcmVlKzB4MTAvMHgxOAo+IGtmcmVlKzB4OTgvMHgyNzAKPiBr
YXNhbl9yY3VfcmVjbGFpbSsweDFjLzB4NjAKPiByY3VfY29yZSsweDhiNC8weDEwZjgKPiByY3Vf
Y29yZV9zaSsweGMvMHgxOAo+IGVmaV9oZWFkZXJfZW5kKzB4MjM4LzB4YTZjCj4gCj4gRmlyc3Qg
Y2FsbF9yY3UoKSBjYWxsIHN0YWNrOgo+IHNhdmVfc3RhY2srMHgyNC8weDUwCj4ga2FzYW5fcmVj
b3JkX2NhbGxyY3UrMHhjOC8weGQ4Cj4gY2FsbF9yY3UrMHgxOTAvMHg1ODAKPiBrYXNhbl9yY3Vf
dWFmKzB4MWQ4LzB4Mjc4Cj4gCj4gTGFzdCBjYWxsX3JjdSgpIGNhbGwgc3RhY2s6Cj4gKHN0YWNr
IGlzIG5vdCBhdmFpbGFibGUpCj4gCj4gCj4gQWRkIG5ldyBDT05GSUcgb3B0aW9uIHRvIHJlY29y
ZCBmaXJzdCBhbmQgbGFzdCBjYWxsX3JjdSgpIGNhbGwgc3RhY2sKPiBhbmQgS0FTQU4gcmVwb3J0
IHByaW50cyB0d28gY2FsbF9yY3UoKSBjYWxsIHN0YWNrLgo+IAo+IFRoaXMgb3B0aW9uIGRvZXNu
J3QgaW5jcmVhc2UgdGhlIGNvc3Qgb2YgbWVtb3J5IGNvbnN1bXB0aW9uLiBJdCBpcwo+IG9ubHkg
c3VpdGFibGUgZm9yIGdlbmVyaWMgS0FTQU4uCgpJIGRvbuKAmXQgdW5kZXJzdGFuZCB3aHkgdGhp
cyBuZWVkcyB0byBiZSBhIEtjb25maWcgb3B0aW9uIGF0IGFsbC4gSWYgY2FsbF9yY3UoKSBzdGFj
a3MgYXJlIHVzZWZ1bCBpbiBnZW5lcmFsLCB0aGVuIGp1c3QgYWx3YXlzIGdhdGhlciB0aG9zZSBp
bmZvcm1hdGlvbi4gSG93IGRvIGRldmVsb3BlcnMganVkZ2UgaWYgdGhleSBuZWVkIHRvIHNlbGVj
dCB0aGlzIG9wdGlvbiBvciBub3Q/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
