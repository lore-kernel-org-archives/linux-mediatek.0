Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDF3C38A24
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 17:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BADE207DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 17:04:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nW1kLo/0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EpvVqjRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BADE207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6aDfNPoYQWfnzdo/K8MU5uVZOeYyHCX+Lv2dxS/0aw=; b=nW1kLo/0p38/Xx
	v7gdytnTiG3T13uiI2NNFUNA1OsLFpV0u3Qtuek7vrWLJyLcALQ2N2LfqOl5A9Wxl7Lfxn+QxJEiW
	/qswJaWJLkYOsrRDQoR+fOJvEh5m+Z9nCgl4OQZRc6HTgkFpsD/pmTHvnT4NU5ff4Gtrnwn0ZVrSI
	BIUMnvHzcQhv9U9XrrgAPDfZmOk0xJYdjab0WcFDdHIHqmgX3bhplZcziUj0uQgqC3hhyt08ALUQC
	eUOXaC5uETH0AXZ4+k4Te2Vm4OGN37hfC05IGJRbgxiqRI/nLY9/xM9UOO0Xrs2cb4tkLRe9ttW/V
	TXuqb8UoT3GIInRvwbGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWjwN-0004h0-FW; Thu, 07 May 2020 17:04:07 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWjwF-0004YU-3W
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 17:04:00 +0000
Received: by mail-qk1-x743.google.com with SMTP id b6so847971qkh.11
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 10:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hld7f/Kw9bjvhfjaZsf7n7gSrldLUvvGkUrL/YswQok=;
 b=EpvVqjRHFxbK1wUeGGCkLIlkrmGeJJgfCrCsU+zmzM1wqgCW5VyfqZ7BHVia1xluk3
 gTvSp++LYK9R3PE9phD5/DFTk3/tQNJuidf/vzvvPtt7kdJynt8wVj/QTKbLYd7LPJNt
 pjmMliIGNvRFvzqCRSw/0q8XbuQA5ONaif8qjvwLZ2fyu5P1nTO6HibWKYEIwhPXjO7N
 aOMb6cpnL80stcrIAMjulGkzuyr/hqMdxxZv/MM075BCRgcShupXD0aySGxg+vn1h/hs
 CN5+wmJ8NlmAuwXJLYvUs2oCDLXSa/LjT1/ErrAonSYhTh8NKuWUUMvQEzUM5Jvz2gik
 yP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hld7f/Kw9bjvhfjaZsf7n7gSrldLUvvGkUrL/YswQok=;
 b=BWS9rJsSlj9dg+ygRAdBQezHwi7ZccgoJRqcGHYifkNZyCvQ9l5UE1VtfsU1CQN0/j
 dZMVi+vj3TkUmqajuzBmZOErH5Uk5NkEHHnz+EwgpuW3QMLKmbu7NETKelbBNNm84Ya6
 BQgMrCCD6ZmZ/ki6qGvhF8XiMohO1ZuEjSm+8VDvK48Fy6ugv9wt6+jl0vgMQhDfPv+7
 ygn+kPzNcj+QJASyZ++N3UoakK/j/k4iXYgRvs/vcwY2QhY7MqQlrgQDccgCQjS8biSS
 jRrAyh1Zd4hJz8CzUAY/e+oQTd1+cfZGRuzttpz9W2LTDgGaWs0qBgjuhqg+l77E2Jnb
 vsig==
X-Gm-Message-State: AGi0PuZMQU73mNAIIzq6SmWGTquDrTWu1IaHBrx1lDUFNG3ZHzRW4DJE
 hjwH4/NICj0j+pS4mlSCGjO4B+jClwJcdXf14cL/dQ==
X-Google-Smtp-Source: APiQypJYPuD7vyBsx50AXMNfbjWRHiKRLtVBSWgqWt5R2mCiujv+F5SYL9Ov+qQKOQm8p348+/a1owCEaNzPso5tN/k=
X-Received: by 2002:a05:620a:65a:: with SMTP id
 a26mr14772836qka.323.1588871035690; 
 Thu, 07 May 2020 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
 <20200506101236.25a13609@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJWckQdKvUGFDAJ1WMtD9WoGWmGe3kyKYhcfRT2nOB93xw@mail.gmail.com>
 <20200507095315.1154a1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200507095315.1154a1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 7 May 2020 19:03:44 +0200
Message-ID: <CAMpxmJUEk3itZs4HujJOXUiL80kmEvGBvLF0NFc2UQoVDVTWRg@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Jakub Kicinski <kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_100359_141498_F0804CD0 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Y3p3LiwgNyBtYWogMjAyMCBvIDE4OjUzIEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+
IG5hcGlzYcWCKGEpOgo+Cj4gT24gVGh1LCA3IE1heSAyMDIwIDExOjI1OjAxICswMjAwIEJhcnRv
c3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiDFm3IuLCA2IG1haiAyMDIwIG8gMTk6MTIgSmFrdWIg
S2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4gbmFwaXNhxYIoYSk6Cj4gPiA+Cj4gPiA+IE9uIFdl
ZCwgNiBNYXkgMjAyMCAwODozOTo0NyArMDIwMCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+
ID4gPiA+IHd0LiwgNSBtYWogMjAyMCBvIDE5OjMxIEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5l
bC5vcmc+IG5hcGlzYcWCKGEpOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFR1ZSwgIDUgTWF5IDIw
MjAgMTY6MDI6MjUgKzAyMDAgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+ID4gPiA+ID4g
RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gUHJvdmlkZSBkZXZtX3JlZ2lzdGVyX25ldGRldigpIC0gYSBk
ZXZpY2UgcmVzb3VyY2UgbWFuYWdlZCB2YXJpYW50Cj4gPiA+ID4gPiA+IG9mIHJlZ2lzdGVyX25l
dGRldigpLiBUaGlzIG5ldyBoZWxwZXIgd2lsbCBvbmx5IHdvcmsgZm9yIG5ldF9kZXZpY2UKPiA+
ID4gPiA+ID4gc3RydWN0cyB0aGF0IGhhdmUgYSBwYXJlbnQgZGV2aWNlIGFzc2lnbmVkIGFuZCBh
cmUgZGV2cmVzIG1hbmFnZWQgdG9vLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL25ldC9jb3JlL2Rldi5jIGIvbmV0L2NvcmUv
ZGV2LmMKPiA+ID4gPiA+ID4gaW5kZXggNTIyMjg4MTc3YmJkLi45OWRiNTM3Yzk0NjggMTAwNjQ0
Cj4gPiA+ID4gPiA+IC0tLSBhL25ldC9jb3JlL2Rldi5jCj4gPiA+ID4gPiA+ICsrKyBiL25ldC9j
b3JlL2Rldi5jCj4gPiA+ID4gPiA+IEBAIC05NTE5LDYgKzk1MTksNTQgQEAgaW50IHJlZ2lzdGVy
X25ldGRldihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQo+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4g
PiAgRVhQT1JUX1NZTUJPTChyZWdpc3Rlcl9uZXRkZXYpOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiArc3RydWN0IG5ldGRldmljZV9kZXZyZXMgewo+ID4gPiA+ID4gPiArICAgICBzdHJ1Y3QgbmV0
X2RldmljZSAqbmRldjsKPiA+ID4gPiA+ID4gK307Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSXMgdGhl
cmUgcmVhbGx5IGEgbmVlZCB0byBkZWZpbmUgYSBzdHJ1Y3R1cmUgaWYgd2Ugb25seSBuZWVkIGEg
cG9pbnRlcj8KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGVyZSBpcyBubyBuZWVkIGZvciB0
aGF0LCBidXQgaXQgcmVhbGx5IGlzIG1vcmUgcmVhZGFibGUgdGhpcyB3YXkuCj4gPiA+ID4gQWxz
bzogdXNpbmcgYSBwb2ludGVyIGRpcmVjdGx5IGRvZXNuJ3Qgc2F2ZSB1cyBhbnkgbWVtb3J5IG5v
ciBjb2RlCj4gPiA+ID4gaGVyZS4KPiA+ID4KPiA+ID4gSSBkb24ndCBjYXJlIGVpdGhlciB3YXkg
YnV0IGRldm1fYWxsb2NfZXRoZXJkZXZfbXFzKCkgYW5kIGNvLiBhcmUgdXNpbmcKPiA+ID4gdGhl
IGRvdWJsZSBwb2ludGVyIGRpcmVjdGx5LiBQbGVhc2UgbWFrZSB0aGluZ3MgY29uc2lzdGVudC4g
RWl0aGVyIGRvCj4gPiA+IHRoZSBzYW1lLCBvciBkZWZpbmUgdGhlIHN0cnVjdHVyZSBpbiBzb21l
IGhlYWRlciBhbmQgY29udmVydCBvdGhlcgo+ID4gPiBoZWxwZXJzIHRvIGFsc28gbWFrZSB1c2Ug
b2YgaXQuCj4gPgo+ID4gSW4gb3JkZXIgdG8gdXNlIGRldnJlc19maW5kKCkgdG8gY2hlY2sgaWYg
c3RydWN0IG5ldF9kZXZpY2UgaXMgbWFuYWdlZAo+ID4gaW4gZGV2bV9yZWdpc3Rlcl9uZXRkZXYo
KSBJIG5lZWQgdG8ga25vdyB0aGUgYWRkcmVzcyBvZiB0aGUgcmVsZWFzZQo+ID4gZnVuY3Rpb24g
dXNlZCBieSBkZXZtX2FsbG9jX2V0aGVyZGV2X21xcygpLiBEbyB5b3UgbWluZCBpZiBJIG1vdmUg
YWxsCj4gPiBuZXR3b3JraW5nIGRldnJlcyByb3V0aW5lcyAoY3VycmVudGx5IG9ubHkgZGV2bV9h
bGxvY19ldGhlcmRldl9tcXMoKSkKPiA+IGludG8gYSBzZXBhcmF0ZSAuYyBmaWxlIChlLmcuIHVu
ZGVyIG5ldC9kZXZyZXMuYyk/Cj4KPiBUbyBpbXBsZW1lbnQgRWR3aW4ncyBzdWdnZXN0aW9uPyBN
YWtlcyBzZW5zZSwgYnV0IEknbSBubyBleHBlcnQsIGxldCdzCj4gYWxzbyBDQyBIZWluZXIgc2lu
Y2UgaGUgd2FzIGFza2luZyBhYm91dCBpdCBsYXN0IHRpbWUuCgpZZXMsIGJlY2F1c2UgdGFraW5n
IHRoZSBsYXN0IGJpdCBvZiBwcml2X2ZsYWdzIGZyb20gbmV0X2RldmljZSBzZWVtcwp0byBiZSBt
b3JlIGNvbnRyb3ZlcnNpYWwgYnV0IGlmIG5ldCBtYWludGFpbmVycyBhcmUgZmluZSB3aXRoIHRo
YXQgSQpjYW4gc2ltcGx5IGdvIHdpdGggdGhlIGN1cnJlbnQgYXBwcm9hY2guCgpCYXJ0CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
