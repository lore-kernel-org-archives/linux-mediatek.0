Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66236C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 15:06:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37BFF207FB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 15:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EpfCs8nH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1lncfq4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37BFF207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT3afGB0siOfUb5BFnMBwJNCpzTd8N4IfmcFz1CC75I=; b=EpfCs8nHGyvi5X
	EAcgWKsJ/XHGdkjnNpFSmkHx6zlw28tK9CqMwekTuYOK0Ww0wJs3cDDVDOYanRTIlo7YtMwwal33u
	FLoHhs63WN9UrTOc4HQqlEknGbtdppax6l9W7DmqoGPz4T/mEIS8QJwKhL5dwXCGMCeL3LK4L2jX4
	1Y3fAKT/3+D//LWH7W78ZvYRKJ3huHLd1q8TTrOzF68mdu/p7K0ofO0i2gH9B9wyqGlmGHILzIBNm
	/jYLCqV0HU5IDCncS5LYzD0yUGA9s3yS2ipiG+DRGmtAod1w0mMl/LGai8IZUF1Mbax0Mc4972IUY
	n+Z1zXol52eopsv4iQ4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb3pB-00059c-Ju; Tue, 19 May 2020 15:06:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb3p0-00050b-UD; Tue, 19 May 2020 15:06:24 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0E3F2083E;
 Tue, 19 May 2020 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589900782;
 bh=29TXNGWd/fhmzxIwOPHw0n8O5RIe1LfOq81Iyfco7wA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1lncfq4bQRql8j2TS2Wgze6M/ZcGlwO1+fkIQdkV/IW8TfwyMJhtgMCTFcF4VgJ6Z
 8wrfyiDhSj6IpSkVByeGUSjrJkmtgJPElPcdodb+2Gj+0CJDHVPeiB4KdveoMQj0X/
 wUhqBT3fvzumGtyJKbV99u7XSH2jt+4vK0BuQ7ks=
Received: by mail-ej1-f53.google.com with SMTP id n24so4209450ejd.0;
 Tue, 19 May 2020 08:06:21 -0700 (PDT)
X-Gm-Message-State: AOAM5326FRHq0gvTvqUCVyWmNEplQkeRr8dQ5gTZB+EcOhDt3UylVrld
 JTorlbFzLCLiMu6GpodK7mX6crK58j9Dq9KdjQ==
X-Google-Smtp-Source: ABdhPJxqywpflae8clvRSoz205FDG3+5j2OG7HiXGl7nWU2mgAQwazM8mHI+SRKZTW7x6x9DfTSufqtqAiC8fcsPHqY=
X-Received: by 2002:a17:907:724e:: with SMTP id
 ds14mr13708797ejc.260.1589900780280; 
 Tue, 19 May 2020 08:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113156.25009-1-matthias.bgg@kernel.org>
 <20200518113156.25009-4-matthias.bgg@kernel.org>
In-Reply-To: <20200518113156.25009-4-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 May 2020 23:06:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Lh=4N2L9ZOrVw+wK1tSrCA=UuOH+7xs0U=12B3Qi7Ug@mail.gmail.com>
Message-ID: <CAAOTY_-Lh=4N2L9ZOrVw+wK1tSrCA=UuOH+7xs0U=12B3Qi7Ug@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: mt6797: Fix mmsys node name
To: matthias.bgg@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_080622_998536_32532233 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Allison Randal <allison@lohutok.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDXmnIgx
OOaXpSDpgLHkuIAg5LiL5Y2INzozM+Wvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IE5vZGUgbmFtZXMgYXJlIHN1cHBvc2VkIHRv
IG1hdGNoIHRoZSBjbGFzcyBvZiB0aGUgZGV2aWNlLiBUaGUKPiBtbXN5cyBub2RlIGlzIGEgc3lz
Y29uIGFzIGl0IHByb3ZpZGVzIG1vcmUgdGhlbiBqdXN0IGEgY2xvY2sgY29udHJvbGxlci4KPiBV
cGRhdGUgdGhlIG5hbWUuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KPgo+IC0tLQo+Cj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ2Nzk3LmR0c2kgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ2Nzk3LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc5Ny5kdHNp
Cj4gaW5kZXggMTM2ZWY5NTI3YTBkLi4zZWZkMDMyNDgxY2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3OTcuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ2Nzk3LmR0c2kKPiBAQCAtMjMzLDcgKzIzMyw3IEBAIHVhcnQzOiBz
ZXJpYWxAMTEwMDUwMDAgewo+ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ICAgICAgICAgfTsKPgo+IC0gICAgICAgbW1zeXM6IG1tc3lzX2NvbmZpZ0AxNDAwMDAwMCB7Cj4g
KyAgICAgICBtbXN5czogc3lzY29uQDE0MDAwMDAwIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDY3OTctbW1zeXMiLCAic3lzY29uIjsKPiAgICAgICAgICAgICAg
ICAgcmVnID0gPDAgMHgxNDAwMDAwMCAwIDB4MTAwMD47Cj4gICAgICAgICAgICAgICAgICNjbG9j
ay1jZWxscyA9IDwxPjsKPiAtLQo+IDIuMjYuMgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
