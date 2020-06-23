Return-Path: <SRS0=E2+4=AE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A53C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 20:16:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159F221473
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 20:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VgEhywTU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9UwVHOw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159F221473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ThbWmkUn6965uTA8B9rSAG7Uups5NehccTV3F+JhA50=; b=VgEhywTUe9tGTUy9KmexdRQ2Y
	2VJUsRGtd8QExpdjcxVqnm3DGEoXJbpAlzL4tITskeajJN14LDbXjqJShMsJ+nl9mMsaZcH33b/up
	VV5Fv4F8kP4rCRMfybhT0lH5T6vg/9zLaNKCjXC/6rhDDC9kGZd+HYJX6JGBO+ve1UlKQbC6NDmJg
	FOn+frAz+ibbfFZ3j/uIxDc3Hzdi9wqQMmX0Mlwd2XsBbfgmc/2QTkPrEiZ/0FKndL3o0QqEDVlPt
	uSbhMqmCZ2wiaJw0A9yD8VJCpa5L93riDYZ8d3hkqSVqSOF/krgoEykJwqMGysmog+hW/KN98B95j
	DWxwVsl1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnpLS-0007Dp-LH; Tue, 23 Jun 2020 20:16:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnpLM-0007Cm-Cd; Tue, 23 Jun 2020 20:16:34 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BB322064B;
 Tue, 23 Jun 2020 20:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592943390;
 bh=gDGnvZfZxG08b9wvGhCaBJiEgiArLyhOEhwuqh+/4Xg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y9UwVHOwGJuOhYMiSxOJo8XDSMmeGgWKrc0Uz3JBUaLR4LA6LbHi7+Oi+JfJLfcaq
 pKB2NjOEMM3KUgJf9UswWdLF53hl6JjKFdIhEfegfP+IvdJWnRd/j9XnlTSz2f0k02
 fsulvyWw9rlpOsS0WvtokvCV2JlEajVWPOdNF6KA=
Date: Tue, 23 Jun 2020 13:16:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 03/11] net: devres: relax devm_register_netdev()
Message-ID: <20200623131628.232ec75e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAMRc=MfF1RbQCJ62QhscFLu1HKYRc9M-2SMep1_vTJ2xhKjLAA@mail.gmail.com>
References: <20200622100056.10151-1-brgl@bgdev.pl>
 <20200622100056.10151-4-brgl@bgdev.pl>
 <20200622154943.02782b5a@kicinski-fedora-PC1C0HJN>
 <CAMRc=MfF1RbQCJ62QhscFLu1HKYRc9M-2SMep1_vTJ2xhKjLAA@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-doc <linux-doc@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 intel-wired-lan@lists.osuosl.org, Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek
 SoC..." <linux-mediatek@lists.infradead.org>, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMyBKdW4gMjAyMCAxMToxMjoyNCArMDIwMCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+IHd0LiwgMjMgY3plIDIwMjAgbyAwMDo0OSBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJu
ZWwub3JnPiBuYXBpc2HFgihhKToKPiA+IE9uIE1vbiwgMjIgSnVuIDIwMjAgMTI6MDA6NDggKzAy
MDAgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZTogIAo+ID4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4gPgo+ID4gPiBUaGlzIGRldnJl
cyBoZWxwZXIgcmVnaXN0ZXJzIGEgcmVsZWFzZSBjYWxsYmFjayB0aGF0IG9ubHkgdW5yZWdpc3Rl
cnMKPiA+ID4gdGhlIG5ldF9kZXZpY2UuIEl0IHdvcmtzIHBlcmZlY3RseSBmaW5lIHdpdGggbmV0
ZGV2IHN0cnVjdHMgdGhhdCBhcmUKPiA+ID4gbm90IG1hbmFnZWQgb24gdGhlaXIgb3duLiBUaGVy
ZSdzIG5vIHJlYXNvbiB0byBjaGVjayB0aGlzIC0gZHJvcCB0aGUKPiA+ID4gd2FybmluZy4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tp
QGJheWxpYnJlLmNvbT4gIAo+ID4KPiA+IEkgdGhpbmsgdGhlIHJlYXNvbmluZyBmb3IgdGhpcyBz
dWdnZXN0aW9uIHdhcyB0byBjYXRjaCBwb3NzaWJsZSBVQUYKPiA+IGVycm9ycy4gVGhlIG5ldGRl
diBkb2Vzbid0IG5lY2Vzc2FyaWx5IGhhcyB0byBiZSBmcm9tIGRldm1fYWxsb2NfKgo+ID4gYnV0
IGl0IGhhcyB0byBiZSBwYXJ0IG9mIGRldm0tZWQgbWVtb3J5IG9yIG1lbW9yeSB3aGljaCBpcyBm
cmVlZAo+ID4gYWZ0ZXIgZHJpdmVyJ3MgcmVtb3ZlIGNhbGxiYWNrLgo+ID4gIAo+IAo+IFllcyBJ
IHVuZGVyc3RhbmQgdGhhdCBVQUYgd2FzIHRoZSBjb25jZXJuIGhlcmUsIGJ1dCB0aGlzIGxpbWl0
YXRpb24gaXMKPiB1bm5lY2Vzc2FyeS4gSW4gaXRzIGN1cnJlbnQgZm9ybSBkZXZtX3JlZ2lzdGVy
X25ldGRldigpIG9ubHkgd29ya3MgZm9yCj4gc3RydWN0IG5ldF9kZXZpY2UgYWxsb2NhdGVkIHdp
dGggZGV2bV9hbGxvY19ldGhlcmRldigpLiBNZWFud2hpbGUKPiBjYWxsaW5nIGFsbG9jX25ldGRl
digpICh3aGljaCBkb2Vzbid0IGhhdmUgaXRzIGRldm0gY291bnRlcnBhcnQgeWV0IC0KPiBJIG1h
eSBsb29rIGludG8gaXQgc2hvcnRseSksCgpJZiByZXNvdXJjZSBtYW5hZ2VkIGFsbG9jX25ldGRl
digpIGlzIG5lZWRlZCBkZXZtX2FsbG9jX25ldGRldigpIGNhbgpiZSBjcmVhdGVkLCBhbmQgZXZl
biByZXVzZSBkZXZtX2ZyZWVfbmV0ZGV2KCkgc28gbm8gY2hhbmdlcyB0byB0aGUKd2FybmluZyBh
cmUgZXZlbiBuZWNlc3NhcnkgZm9yIHN1Y2ggZXh0ZW5zaW9uLgoKPiB0aGVuIHJlZ2lzdGVyaW5n
IGEgZGV2bSBhY3Rpb24gd2l0aCBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSB3aGljaAo+IHdv
dWxkIGZyZWUgdGhpcyBtZW1vcnkgaXMgYSBwZXJmZWN0bHkgZmluZSB1c2UgY2FzZS4gVGhpcyBw
YXRjaCB3b3VsZAo+IG1ha2UgaXQgcG9zc2libGUuCgphbGxvY19uZXRkZXYoKSArIGRldm1fYWRk
X2FjdGlvbiBtYWtlcyBubyBzZW5zZSBpbiB0aGUgdXBzdHJlYW0ga2VybmVsLApqdXN0IGFkZCB0
aGUgYXBwcm9wcmlhdGUgaGVscGVyLCB3ZSBjYXJlIGxpdHRsZSBhYm91dCBvdXQgb2YgdHJlZSBj
b2RlLgoKPiA+IEFyZSB0aGVyZSBjYXNlcyBpbiBwcmFjdGljZSB3aGVyZSB5b3UndmUgc2VlbiB0
aGUgbmV0ZGV2IG5vdCBiZWluZwo+ID4gZGV2bSBhbGxvY2F0ZWQ/ICAKPiAKPiBBcyBJIHNhaWQg
YWJvdmUgLSBhbGxvY19uZXRkZXYoKSB1c2VkIGJ5IHdpcmVsZXNzLCBjYW4sIHVzYiBldGMuCj4g
ZHJpdmVycyBkb2Vzbid0IGhhdmUgYSBkZXZyZXMgdmFyaWFudC4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
