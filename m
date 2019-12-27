Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50180C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 13:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23AA920882
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 13:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oj/qEeg3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="pVibluFE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23AA920882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmYVor/Mx6Tpm9H73DqcqQaqXtzDd2tzB1UyGba/4kE=; b=Oj/qEeg3IESYjU
	rWE0Onk8/l+BlFV+bQYYuINf1xMMqTltHMXsZ5Y6JHKNhrMuNUvMoDpkiUZZ75n7NMvERXpOdxMSV
	f0hBn1daYbqvJPZ3IvcAArs4oGO//ux6cwr5RBY5oWqIZy15NSEFuu6MvOmjTpUwBF2ub+xthnWwI
	w3uXdI1rngI5NFmFT2qzfZTahYfIvAjM4x7lnJclYnuxPUIw4UMled+/BzobRHFLyvdo40EU8mcMS
	U32TipvfQnJPlVGlM2sBUvYYAZ0dKMhBXQC2/ul/D9arLSYyUaWVMFtN1NvvOlDGkOAQDBJcMDHxA
	QGCpxLGNsDYCQtp6m/hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikpwR-0003zk-KV; Fri, 27 Dec 2019 13:46:11 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikpwO-0003zQ-A3
 for linux-mediatek@lists.infradead.org; Fri, 27 Dec 2019 13:46:10 +0000
Received: by mail-qk1-x743.google.com with SMTP id x1so21495426qkl.12
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Dec 2019 05:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=6etHYhtSl6+gXzRLDDVOeZLed1tEXttA1I2y9xptx5o=;
 b=pVibluFELp7k4SND3Z5PjkskuFcDEeleMyhu5q8UEudXaNsljge7lU3JQfwHJJ1TX7
 F6s8BebrG3hXu1iJcapwKjPQ9/C5GEB+LZkoThO+FUeysWg5mVzBLhV4Amv+/ZgFst1l
 znnBHcKy1vu01qdHze6Ng4uc/YW22LUXyF9VPGd34q718iUKq/qdM2lbalyjVMQetBNb
 cOSkZo8XEtcUAQAGI4P6ciyVfjl+IauE7KBXn0ovpan7wcCxY4N2NC3wVt2aI7wNBk8o
 rmd7NzBk+lsuym0EqZQ6T2uxOnhUG/PTR6rUMmmMIbhDZpc+GQPWIKk/IFEAmfdH5Zbe
 Tlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=6etHYhtSl6+gXzRLDDVOeZLed1tEXttA1I2y9xptx5o=;
 b=RqQ+95xuYnheL+1zqbf9kGrZSN2kP619sXkWwIScE1SDycjwWIy/oyqEdWo8ZQLAPJ
 tdiU+3/0uc4HzAS9raskyaGNVQ5gXb98G9VbTxLgZll1jodgKjg28yyTAo3XUpSCL8iO
 ciwWmfxIpwa1ATcMC/IPXKgY2MSaNCf3MRQsnQruz1nSg5hDZRoMCbdLlU1ZYct5flUC
 6Wwr5Y+jeXHTOvUVBsow6sejsikxBGjxlkoOIgu0vTkz0EMt4n979NYlIKkEWFH9F2xY
 CLTr/YXs3pyQtlbjaSfGup8mTpmHoSrk/wkoz5W63yi8tYJbed1TNJTci10DGet5VvH3
 2tSA==
X-Gm-Message-State: APjAAAX+6IKDrx6UZjWRTf4T8lHwMEAX3N/qwCTm2Bi6GILznmqN9fCi
 HDKcgHE3XK0/DJbqedQJ3UmtqA==
X-Google-Smtp-Source: APXvYqx1ipKxuo/brS6sZTb08L0kWqRCscwQVwKNLbEb/EyIXR5uBSfMmlxGFWE48SR7iT9V4rKUYQ==
X-Received: by 2002:ae9:c317:: with SMTP id n23mr34496883qkg.356.1577454365616; 
 Fri, 27 Dec 2019 05:46:05 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 16sm9787242qkj.77.2019.12.27.05.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2019 05:46:05 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] mm/page_owner: print largest memory consumer when OOM
 panic occurs
Date: Fri, 27 Dec 2019 08:46:03 -0500
Message-Id: <2EA70B54-A7E1-4C5A-A447-844A3FEA7E93@lca.pw>
References: <1577432670.4248.3.camel@mtkswgap22>
In-Reply-To: <1577432670.4248.3.camel@mtkswgap22>
To: Miles Chen <miles.chen@mediatek.com>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_054608_373355_8B8F5668 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIERlYyAyNywgMjAxOSwgYXQgMjo0NCBBTSwgTWlsZXMgQ2hlbiA8bWlsZXMuY2hlbkBt
ZWRpYXRlay5jb20+IHdyb3RlOgo+IAo+IEl0J3Mgbm90IGNvbXBsZXRlIHNpdHVhdGlvbi4KPiAK
PiBJJ3ZlIGxpc3RlZCBkaWZmZXJlbnQgT09NIHBhbmljIHNpdHVhdGlvbnMgaW4gcHJldmlvdXMg
ZW1haWwgWzFdCj4gYW5kIHdoYXQgd2UgY2FuIGRvIGFib3V0IHRoZW0gd2l0aCBjdXJyZW50IGlu
Zm9ybWF0aW9uLgo+IAo+IFRoZXJlIGFyZSBzb21lIGNhc2VzIHdoaWNoIGNhbm5vdCBiZSBjb3Zl
cmVkIGJ5IGN1cnJlbnQgaW5mb3JtYXRpb24KPiBlYXNpbHkuCj4gRm9yIGV4YW1wbGU6IGEgbWVt
b3J5IGxlYWthZ2UgY2F1c2VkIGJ5IGFsbG9jX3BhZ2VzKCkgb3Igdm1hbGxvYygpIHdpdGgKPiBh
IGxhcmdlIHNpemUuCj4gSSBrZWVwIHNlZWluZyB0aGVzZSBpc3N1ZXMgZm9yIHllYXJzIGFuZCB0
aGF0J3Mgd2h5IEkgYnVpbHQgdGhpcyBwYXRjaC4gCj4gSXQncyBsaWtlIGEgbWlzc2luZyBwaWVj
ZSBvZiB0aGUgcHV6emxlLgo+IAo+IFRvIHByb3ZlIHRoYXQgdGhlIGFwcHJvYWNoIGlzIHByYWN0
aWNhbCBhbmQgdXNlZnVsLCBJIGhhdmUgY29sbGVjdGVkCj4gcmVhbCB0ZXN0IGNhc2VzCj4gdW5k
ZXIgcmVhbCBkZXZpY2VzIGFuZCBwb3N0ZWQgdGhlIHRlc3QgcmVzdWx0IGluIHRoZSBjb21taXQg
bWVzc2FnZS4KPiBUaGVzZSBhcmUgcmVhbCBjYXNlcywgbm90IG15IGltYWdpbmF0aW9uLgoKT2Yg
Y291cnNlIHRoaXMgbWF5IGhlbHAgZGVidWcgKnlvdXIqIHByb2JsZW1zIGluIHRoZSBwYXN0LCBi
dXQgaWYgdGhhdCBpcyB0aGUgb25seSByZXF1aXJlbWVudCB0byBtZXJnZSB0aGUgZGVidWdnaW5n
IHBhdGNoIGxpa2UgdGhpcywgd2Ugd291bGQgZW5kIHVwIHdpdGggZW5kbGVzcyBvZiB0aG9zZS4g
SWYgeW91ciBnb2FsIGlzIHRvIHN0b3AgZGV2ZWxvcGVycyBmcm9tIHJlcHJvZHVjaW5nIGlzc3Vl
cyB1bm5lY2Vzc2FyaWx5IGFnYWluIHVzaW5nIHBhZ2Vfb3duZXIgdG8gZGVidWcsIHRoZW4geW91
ciBwYXRjaCBkb2VzIG5vdCBoZWxwIG11Y2ggZm9yIHRoZSBtYWpvcml0eSBvZiBvdGhlciBkZXZl
bG9wZXJz4oCZIGlzc3Vlcy4KClRoZSBwYWdlX293bmVyIGlzIGRlc2lnbmVkIHRvIGdpdmUgaW5m
b3JtYXRpb24gYWJvdXQgdGhlIHRvcCBjYW5kaWRhdGVzIHRoYXQgbWlnaHQgY2F1c2UgaXNzdWVz
LCBzbyBpdCBtYWtlIHNvbWV3aGF0IHNlbnNlIGlmIGl0IGR1bXBzIHRoZSB0b3AgMTAgZ3JlYXRl
c3QgbWVtb3J5IGNvbnN1bWVyIGZvciBleGFtcGxlLCBidXQgdGhhdCBhbHNvIGNsdXR0ZXIgdGhl
IE9PTSByZXBvcnQgc28gbXVjaCwgc28gaXQgaXMgbm8tZ28uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
