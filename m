Return-Path: <SRS0=ZjOp=6Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E87DC47257
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 May 2020 01:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70469208DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 May 2020 01:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KnLezq1n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="arqNH5Dt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70469208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOZ8hEdlRwHSdeV0OWFvufjN2kzEk699TTd2zDuwtoA=; b=KnLezq1n/34BOt
	xcndm/OXGgvE8LrraUEMj6ySMZXI6oq/eS54AHnXNiPJ/3S3FAXg/JlrK5Xa6JO6FigYcxC48sCmT
	XRjahvnXi+aNI1Ccr6Uty1/n6w0D5eK9A6qzTXu1ieUPye9WiKkfwfbdb7A/FkNvkjM8puMdAPozi
	SQaEJCuyDYIOWLjgiS7Bev+K+S7Q8mDNfSya2AN6KevcWdAhcSwH10VIH9Cr06tEsnWN/dosDdmd3
	mf8xP6Svyu1YuXMLNDk4Z2ds2+e7FtLS9yLl7ZOUtaQh/iWyZ9sK6XiwOnJAIVYp6lelwl7HksaqM
	EvqOg8vWlbSGWi8YRhuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXane-0004Bp-BB; Sun, 10 May 2020 01:30:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXanX-00044C-2I; Sun, 10 May 2020 01:30:32 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71E4824957;
 Sun, 10 May 2020 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589074230;
 bh=ix8iTjqF132SnVv4OLbjsHPr6YEm5+jXddQ2kFsg3vw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=arqNH5DtBFhnacg4lStoi4lNJYTnb2RlB6XUtJJsAdb8c0mmuLuhOW8n7UaPejrbO
 Vh/48l5zE6UuV8E3rFQQzC0UDjJjgYsFGd30Az6rQaJWWo1vEnAVMyXKjegcNMmflz
 tD38h0xKZf3ZIK1giEPPxk7a3V6ggVe9nB031U2A=
Received: by mail-ed1-f51.google.com with SMTP id d16so4764565edq.7;
 Sat, 09 May 2020 18:30:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuY2pdRMXinJClHjnZzXfyAhLx65Te+UF62QKN4DEMWxqMftefLX
 DTGH3oxELhw86ltIZGpi/H7iK6udkS/atxxNSg==
X-Google-Smtp-Source: APiQypKavV96F5Rfs0zUVAMo0khKlR0Q9NlSm0iglorzoQwicEWvMXuImhm7hoN6zToXdJcUiR0llqZOfr2lVHvghjo=
X-Received: by 2002:aa7:c649:: with SMTP id z9mr8191853edr.288.1589074228868; 
 Sat, 09 May 2020 18:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200506123356.9147-1-bernard@vivo.com>
In-Reply-To: <20200506123356.9147-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 10 May 2020 09:30:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY__QR52YjdKZ6YPbjyfFQPVyNWSjrSRxYxuTH0pLEkQyrg@mail.gmail.com>
Message-ID: <CAAOTY__QR52YjdKZ6YPbjyfFQPVyNWSjrSRxYxuTH0pLEkQyrg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: cleanup coding style in mediatek a bit
To: Bernard Zhao <bernard@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_183031_128643_7425CE3F 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NeaciDbml6Ug6YCx5LiJIOS4i+WNiDg6MzTlr6vpgZPvvJoKPgo+IFRoaXMgY29kZSBjaGFuZ2Ug
aXMgdG8gbWFrZSBjb2RlIGJpdCBtb3JlIHJlYWRhYmxlLgo+CgpBcHBsaWVkIHRvIG1lZGlhdGVr
LWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVr
LWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nCgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQg
WmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgfCAxMiArKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5j
Cj4gaW5kZXggZmY0M2EzZDgwNDEwLi40M2U5ODc2ZmQ1MGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0zMTEsMTQgKzMxMSwxMCBAQCBzdGF0aWMgdm9pZCBtdGtf
aGRtaV9od19zZW5kX2luZm9fZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLCB1OCAqYnVmZmVy
LAo+ICAgICAgICAgdTggY2hlY2tzdW07Cj4gICAgICAgICBpbnQgY3RybF9mcmFtZV9lbiA9IDA7
Cj4KPiAtICAgICAgIGZyYW1lX3R5cGUgPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7
Cj4gLSAgICAgICBmcmFtZV92ZXIgPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7Cj4g
LSAgICAgICBmcmFtZV9sZW4gPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7Cj4gLSAg
ICAgICBjaGVja3N1bSA9ICpidWZmZXI7Cj4gLSAgICAgICBidWZmZXIgKz0gMTsKPiArICAgICAg
IGZyYW1lX3R5cGUgPSAqYnVmZmVyKys7Cj4gKyAgICAgICBmcmFtZV92ZXIgPSAqYnVmZmVyKys7
Cj4gKyAgICAgICBmcmFtZV9sZW4gPSAqYnVmZmVyKys7Cj4gKyAgICAgICBjaGVja3N1bSA9ICpi
dWZmZXIrKzsKPiAgICAgICAgIGZyYW1lX2RhdGEgPSBidWZmZXI7Cj4KPiAgICAgICAgIGRldl9k
YmcoaGRtaS0+ZGV2LAo+IC0tCj4gMi4yNi4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
