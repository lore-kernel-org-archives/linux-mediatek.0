Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F196C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:02:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5971613CA
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5971613CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FYn9+6wcS1cJ5NbsjYTSjxWZy78wl8fluzyPMjPe00s=; b=P9hqhYBaO/dhVsgyMAnRQnzAd
	+HVj4YylVtPAMqb3tAS3N9JGTIE2UURgD+2CSQeaUr/OWjnxMppwxadx3V01BnKXmLHQ5mJrYUHik
	Rb0r5smrDEUohhXAdaKBrGPYvyDERKM1kk3Nzx8zeC6Or/g/U7nF/JP9DPWQJxDKBUkgZECMlz9uz
	JJvkMgxPYDstJM6Ej4BmLVtE+CYf+FhNYaZJWCEEZ1jZ5/lUuyWyQY508IX4H/e1OmhZvFngeBRTE
	z22C+C+ZIj4rxuBBK96W+ptImVi/3y5D3RRIDGb/jADerT811FGEK13RdRr6ZZAerls9BhYxtK/2n
	OYE/qYIEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lToA1-002yLd-OP; Tue, 06 Apr 2021 16:02:37 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTo9z-002yKo-0D
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 16:02:36 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lTo9t-00F91t-0O; Tue, 06 Apr 2021 18:02:29 +0200
Date: Tue, 6 Apr 2021 18:02:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: DENG Qingfang <dqfext@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
Message-ID: <YGyGFOrXwEsqCW/z@lunn.ch>
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_170235_151581_35124B04 
X-CRM114-Status: GOOD (  17.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMTE6NDc6MDhQTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgUWluZ2Zhbmc6Cj4gCj4gREVORyBRaW5nZmFuZyA8ZHFmZXh0QGdtYWlsLmNv
bT4g5pa8IDIwMjHlubQ05pyINuaXpSDpgLHkuowg5LiL5Y2IMTA6MTnlr6vpgZPvvJoKPiA+Cj4g
PiBBZGQgc3VwcG9ydCBmb3IgTWVkaWFUZWsgUEhZcyBmb3VuZCBpbiBNVDc1MzAgYW5kIE1UNzUz
MSBzd2l0Y2hlcy4KPiA+IFRoZSBpbml0aWFsaXphdGlvbiBwcm9jZWR1cmUgaXMgZnJvbSB0aGUg
dmVuZG9yIGRyaXZlciwgYnV0IGR1ZSB0byBsYWNrCj4gPiBvZiBkb2N1bWVudGF0aW9uLCB0aGUg
ZnVuY3Rpb24gb2Ygc29tZSByZWdpc3RlciB2YWx1ZXMgcmVtYWlucyB1bmtub3duLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IERFTkcgUWluZ2ZhbmcgPGRxZmV4dEBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL25ldC9waHkvS2NvbmZpZyAgICB8ICAgNSArKwo+ID4gIGRyaXZlcnMvbmV0
L3BoeS9NYWtlZmlsZSAgIHwgICAxICsKPiA+ICBkcml2ZXJzL25ldC9waHkvbWVkaWF0ZWsuYyB8
IDEwOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxMTUgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L25ldC9waHkvbWVkaWF0ZWsuYwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9waHkv
S2NvbmZpZyBiL2RyaXZlcnMvbmV0L3BoeS9LY29uZmlnCj4gPiBpbmRleCBhNjE1YjM2NjBiMDUu
LmVkZDg1OGNlYzllYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3BoeS9LY29uZmlnCj4g
PiArKysgYi9kcml2ZXJzL25ldC9waHkvS2NvbmZpZwo+ID4gQEAgLTIwNyw2ICsyMDcsMTEgQEAg
Y29uZmlnIE1BUlZFTExfODhYMjIyMl9QSFkKPiA+ICAgICAgICAgICBTdXBwb3J0IGZvciB0aGUg
TWFydmVsbCA4OFgyMjIyIER1YWwtcG9ydCBNdWx0aS1zcGVlZCBFdGhlcm5ldAo+ID4gICAgICAg
ICAgIFRyYW5zY2VpdmVyLgo+ID4KPiA+ICtjb25maWcgTUVESUFURUtfUEhZCj4gCj4gVGhlcmUg
YXJlIG1hbnkgTWVkaWF0ZWsgcGh5IGRyaXZlcnMgaW4gWzFdLCBzbyB1c2UgYSBzcGVjaWZpYyBu
YW1lLgoKVGhvc2UgYXJlIGdlbmVyaWMgUEhZIGRyaXZlcnMsIHdoZXJlIGFzIHRoaXMgcGF0Y2gg
aXMgYWRkIGEgUEhZCmRyaXZlci4gVGhlIG5hbWluZyB1c2VkIGluIHRoaXMgcGF0Y2ggaXMgY29u
c2lzdGVudCB3aXRoIG90aGVyIFBIWQpkcml2ZXJzLiBTbyBpJ20gaGFwcHkgd2l0aCB0aGlzIHBh
dGNoIGluIHRoaXMgcmVzcGVjdC4KClBIWSBkcml2ZXJzIGhhdmUgYmVlbiBhcm91bmQgYSBsb3Qg
bG9uZ2VyIHRoYW4gZ2VuZXJpYyBQSFkgZHJpdmVycy4gU28KaSB3b3VsZCBhY3R1YWxseSBzYXkg
dGhlIGdlbmVyaWMgUEhZIGRyaXZlciBuYW1pbmcgc2hvdWxkIG1ha2UgaXQKY2xlYXIgdGhleSBh
cmUgZ2VuZXJpYyBQSFlzLCBub3QgUEhZcy4KCkJ1dCBsZXRzIG5vdCBiaWtlIHNoZWQgYWJvdXQg
dGhpcyB0b28gbXVjaC4KCiAgICAgIEFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
