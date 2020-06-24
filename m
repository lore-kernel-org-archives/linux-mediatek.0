Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A3AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:57:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC8220738
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:57:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMqFzBcn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ZgOTBUbP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC8220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=URji3Bp8Mp7wSzETTu8c52434aVuy0vzdtkgDF+BNrY=; b=ZMqFzBcnHP50JdpIarHQ6XfZK
	Pci7FB5hUjDM9qvrUTT3rq4hN3qs/Cwk9+wXwXJGjPvuPEXwcU3ZES/cFTED3hTA0q/TGvtRu+i48
	wi752Qu0CNzyWp0CHHlulvclwAwXaqdjIAezXKBUfPTq6sbznj3zmvyyb0fBWeH8CZwcmSj1hjnej
	3Ze1OrcHRj3t1kOs6Dtvdp7u62uuYXO9Mg8q1Be/jyQ58ytp1F7vZZ3pVoXseAJ0LPHDX2jLvHWlH
	QKplMpovsxkGP4xoi8mx+3MQhvM7oQ7oGZQkzQh/T4BGkfQLGQh3NSZ3Gd5/dWIm9UtG6xh4y3Nff
	Rrj+XYtQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo8iL-00059E-Fx; Wed, 24 Jun 2020 16:57:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo8iI-00057U-Ld; Wed, 24 Jun 2020 16:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L0BSl9Rz5P8GUkSvL7sI0fAZe5Hrhoqy7/0x3FiFW2Y=; b=ZgOTBUbPjta9cXrzFnnIAnab4
 Dcm9pDc0Ejlq5vVTWRjyevo27fV7XGPaj06Z05BDeZRcenj/FWeWJut7lz1cg2jUDgZnf8MvLUdYM
 P+biZdJlriNMVb3RtYtqgt1B8ql+d+lgDKGM3OOj3i9TDJ3SIgG6/R4Rg8amZWPYlQq6fIY/e5RIH
 39Hwa7ZromkrO1urRg88NKb0eQZfm104fYt7Wvq+tEViZGuPwfd3FP5JIhp40PZgkNtwizse0M5zD
 FpIcwGpyg+93AxBkRp7ezqMw7JKjDwcBW5nSjVKmWjVeWpHEex9JZNfJ7NiOhJ6zOdVKpd7uk/VBN
 B1UNRAHEg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59222)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jo8i8-0003ML-Ug; Wed, 24 Jun 2020 17:57:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jo8i7-00027d-Ep; Wed, 24 Jun 2020 17:57:19 +0100
Date: Wed, 24 Jun 2020 17:57:19 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 14/15] net: phy: add PHY regulator support
Message-ID: <20200624165719.GB1551@shell.armlinux.org.uk>
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-15-brgl@bgdev.pl>
 <20200622132921.GI1551@shell.armlinux.org.uk>
 <CAMRc=Me1r3Mzfg3-gTsGk4rEtvB=P9ESkn9q=c7z0Q=YQDsw2A@mail.gmail.com>
 <20200623094252.GS1551@shell.armlinux.org.uk>
 <CAMpxmJVP9db-4-AA4e1JkEfrajvJ4s0T6zo5+oFzpJHRBcuSsg@mail.gmail.com>
 <20200623095646.GT1551@shell.armlinux.org.uk>
 <CAMRc=MeKE12sXZycyGA7vmjNai0JfDhRX+XDTp3r3YtrmLQj3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MeKE12sXZycyGA7vmjNai0JfDhRX+XDTp3r3YtrmLQj3A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDY6Mjc6MDZQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiB3dC4sIDIzIGN6ZSAyMDIwIG8gMTE6NTYgUnVzc2VsbCBLaW5nIC0gQVJN
IExpbnV4IGFkbWluCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gbmFwaXNhxYIoYSk6Cj4gPgo+
ID4gT24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMTE6NDY6MTVBTSArMDIwMCwgQmFydG9zeiBHb2xh
c3pld3NraSB3cm90ZToKPiA+ID4gd3QuLCAyMyBjemUgMjAyMCBvIDExOjQzIFJ1c3NlbGwgS2lu
ZyAtIEFSTSBMaW51eCBhZG1pbgo+ID4gPiA8bGludXhAYXJtbGludXgub3JnLnVrPiBuYXBpc2HF
gihhKToKPiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgSnVuIDIzLCAyMDIwIGF0IDExOjQxOjExQU0g
KzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiA+ID4gPiBwb24uLCAyMiBjemUg
MjAyMCBvIDE1OjI5IFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbgo+ID4gPiA+ID4gPGxp
bnV4QGFybWxpbnV4Lm9yZy51az4gbmFwaXNhxYIoYSk6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gW3NuaXAhXQo+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBp
cyBsaWtlbHkgdG8gY2F1c2UgaXNzdWVzIGZvciBzb21lIFBIWSBkcml2ZXJzLiAgTm90ZSB0aGF0
IHdlIGhhdmUKPiA+ID4gPiA+ID4gc29tZSBQSFkgZHJpdmVycyB3aGljaCByZWdpc3RlciBhIHRl
bXBlcmF0dXJlIHNlbnNvciBpbiB0aGUgcHJvYmUKPiA+ID4gPiA+ID4gZnVuY3Rpb24sIHdoaWNo
IG1lYW5zIHRoZXkgY2FuIGJlIGFjY2Vzc2VkIGluZGVwZW5kZW50bHkgb2YgdGhlIGxpZmV0aW1l
Cj4gPiA+ID4gPiA+IG9mIHRoZSBQSFkgYm91bmQgdG8gdGhlIG5ldHdvcmsgZHJpdmVyICh3aGlj
aCBtYXkgb25seSBiZSB3aGlsZSB0aGUKPiA+ID4gPiA+ID4gbmV0d29yayBkZXZpY2UgaXMgInVw
Ii4pICBXZSBjZXJ0YWlubHkgZG8gbm90IHdhbnQgaHdtb24gZmFpbGluZyBqdXN0Cj4gPiA+ID4g
PiA+IGJlY2F1c2UgdGhlIG5ldHdvcmsgZGV2aWNlIGlzIGRvd24uCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFRoYXQncyBraW5kIG9mIHdvcmtlZCBhcm91bmQgZm9yIHRoZSByZXNldCBzdHVmZiwg
YmVjYXVzZSB0aGVyZSBhcmUgdHdvCj4gPiA+ID4gPiA+IGxheWVycyB0byB0aGF0OiB0aGUgbWRp
byBkZXZpY2UgbGF5ZXIgcmVzZXQgc3VwcG9ydCB3aGljaCBrbm93cyBub3RoaW5nCj4gPiA+ID4g
PiA+IG9mIHRoZSBQSFkgYmluZGluZyBzdGF0ZSB0byB0aGUgbmV0d29yayBkcml2ZXIsIGFuZCB0
aGUgcGh5bGliIHJlc2V0Cj4gPiA+ID4gPiA+IHN1cHBvcnQsIGJ1dCBpdCBpcyBub3QgbmljZS4K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZWd1bGF0b3JzIGFyZSByZWZlcmVuY2Ug
Y291bnRlZCBzbyBpZiB0aGUgaHdtb24gZHJpdmVyIGVuYWJsZXMgaXQKPiA+ID4gPiA+IHVzaW5n
IG1kaW9fZGV2aWNlX3Bvd2VyX29uKCkgaXQgd2lsbCBzdGF5IG9uIGV2ZW4gYWZ0ZXIgdGhlIFBI
WSBkcml2ZXIKPiA+ID4gPiA+IGNhbGxzIHBoeV9kZXZpY2VfcG93ZXJfb2ZmKCksIHJpZ2h0PyBB
bSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+ID4gPiA+Cj4gPiA+ID4gSWYgdGhhdCBpcyB0cnVlLCB5
b3Ugd2lsbCBuZWVkIHRvIGF1ZGl0IHRoZSBQSFkgZHJpdmVycyB0byBhZGQgdGhhdC4KPiA+ID4g
Pgo+ID4gPgo+ID4gPiBUaGlzIGNoYW5nZSBkb2Vzbid0IGhhdmUgYW55IGVmZmVjdCBvbiBkZXZp
Y2VzIHdoaWNoIGRvbid0IGhhdmUgYQo+ID4gPiByZWd1bGF0b3IgYXNzaWduZWQgaW4gRFQgdGhv
dWdoLiBUaGUgb25lIEknbSBhZGRpbmcgaW4gdGhlIGxhc3QgcGF0Y2gKPiA+ID4gaXMgdGhlIGZp
cnN0IHRvIHVzZSB0aGlzLgo+ID4KPiA+IEl0J3MgcXVhbGl0eSBvZiBpbXBsZW1lbnRhdGlvbi4K
PiA+Cj4gPiBTaG91bGQgd2Ugd2FpdCBmb3Igc29tZW9uZSBlbHNlIHRvIG1ha2UgdXNlIG9mIHRo
ZSBuZXcgcmVndWxhdG9yCj4gPiBzdXBwb3J0IHRoYXQgaGFzIGJlZW4gYWRkZWQgd2l0aCBhIFBI
WSB0aGF0IHVzZXMgaHdtb24sIGFuZCB0aGV5Cj4gPiBkb24ndCByZWFsaXNlIHRoYXQgaXQgYnJl
YWtzIGh3bW9uIG9uIGl0LCBhbmQgc2V2ZXJhbCBrZXJuZWwgdmVyc2lvbnMKPiA+IGdvIGJ5IHdp
dGhvdXQgaXQgYmVpbmcgbm90aWNlZC4gIEl0IHdpbGwgb25seSBiZSBhIG5vdGljYWJsZSBpc3N1
ZQo+ID4gd2hlbiB0aGUgYXNzb2NpYXRlZCBuZXR3b3JrIGRldmljZSBpcyBkb3duLCBhbmQgdGhh
dCBuZXR3b3JrIGRldmljZQo+ID4gZHJpdmVyIGRldGFjaGVzIGZyb20gdGhlIFBIWSwgc28gX2lz
XyBsaWtlbHkgbm90IHRvIGJlIG5vdGljZWQuCj4gPgo+ID4gT3Igc2hvdWxkIHdlIGRvIGEgc21h
bGwgYW1vdW50IG9mIHdvcmsgbm93IHRvIHByb3Blcmx5IGltcGxlbWVudAo+ID4gcmVndWxhdG9y
IHN1cHBvcnQsIHdoaWNoIGluY2x1ZGVzIGEgdHJpdmlhbCBncmVwIGZvciAiaHdtb24iIGFtb25n
c3QKPiA+IHRoZSBQSFkgZHJpdmVycywgYW5kIGFkZCB0aGUgbmVjZXNzYXJ5IGNhbGwgdG8gYXZv
aWQgdGhlIHJlZ3VsYXRvcgo+ID4gYmVpbmcgc2h1dCBvZmYuCj4gPgo+IAo+IEknbSBub3Qgc3Vy
ZSB3aGF0IHRoZSBjb3JyZWN0IGFwcHJvYWNoIGlzIGhlcmUuIFByb3ZpZGUgc29tZSBoZWxwZXIK
PiB0aGF0LCB3aGVuIGNhbGxlZCwgd291bGQgaW5jcmVhc2UgdGhlIHJlZ3VsYXRvcidzIHJlZmVy
ZW5jZSBjb3VudCBldmVuCj4gbW9yZSB0byBrZWVwIGl0IGVuYWJsZWQgZnJvbSB0aGUgbW9tZW50
IGh3bW9uIGlzIHJlZ2lzdGVyZWQgdG8gd2hlbgo+IHRoZSBkcml2ZXIgaXMgZGV0YWNoZWQ/CgpJ
IHRoaW5rIGEgUEhZIGRyaXZlciBuZWVkcyB0aGUgdXRpbGl0eSB0byBjb250cm9sIHRoaXMuICBX
ZSBuZWVkIHRvIGJlCmNhcmVmdWwgaGVyZSB3aXRoIG5hbWluZywgYmVjYXVzZSBwaHlsaWIgaXMg
bm90IHRoZSBvbmx5IGNvZGUgaW4gdGhlCmtlcm5lbCB0aGF0IHVzZXMgdGhlIHBoeV8gcHJlZml4
LgoKSWYgd2UgaGFkIHJ1bnRpbWUgUE0gc3VwcG9ydCBmb3IgUEhZcywgd2l0aCByZWd1bGF0b3Ig
c3VwcG9ydCBob29rZWQKaW50byBydW50aW1lIFBNLCB0aGVuIHdlIGFscmVhZHkgaGF2ZSBzdGFu
ZGFyZCBpbnRlcmZhY2VzIHRoYXQgZHJpdmVycwpjYW4gdXNlIHRvIGNvbnRyb2wgd2hldGhlciB0
aGUgZGV2aWNlIGdldHMgcG93ZXJlZCBkb3duLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0
cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUh
IDQwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
