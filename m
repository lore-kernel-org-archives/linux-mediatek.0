Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:05:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65935613BD
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65935613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0dCWIx+WHhXMvUnZKNod0CWmR3uMWf/a6LyMzLLwo2w=; b=peqhOz7ajmpURFnKgtiLwFlvK
	7MSSgW7qZiTJHsTfo+i9XsAL++GpHkLCK+jSuvppcdP7YLbJLqYVdRy0JFcm8Hw6TUbqv+sAFTTG7
	x05+Qp6wwphW/oaO6fJNBIRIWi1omhqnKdbEDkIFJ8mB5F42qtCj+hVgV4/PSKO+Mn9RucIoPO/By
	q/+KkHAbIb1FznI+VpSJzsmw2Ke2uRU7e1FqtL+S8isgoVcz4JFnkIIG+P52AnYqVlVTwyr7XtJdp
	+3U80iGBQXGSIBRfhS9Ngd46Vjs6IYSKvXDY0RH/oANRDYR+K37c7yR7Sc4CwSoC9AVJybEJRfC5y
	1EpetABYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lToCp-002yWo-OB; Tue, 06 Apr 2021 16:05:31 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lToCm-002yWP-E3
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 16:05:30 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lToCh-00F94W-A1; Tue, 06 Apr 2021 18:05:23 +0200
Date: Tue, 6 Apr 2021 18:05:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
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
 netdev <netdev@vger.kernel.org>, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
Message-ID: <YGyGwzyFKSNBQj2U@lunn.ch>
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
 <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_170528_522649_2F9209FF 
X-CRM114-Status: GOOD (  11.19  )
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

T24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMTE6NTc6MTRQTSArMDgwMCwgREVORyBRaW5nZmFuZyB3
cm90ZToKPiBPbiBUdWUsIEFwciA2LCAyMDIxIGF0IDExOjQ3IFBNIENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSwgUWluZ2Zhbmc6Cj4gPgo+
ID4gREVORyBRaW5nZmFuZyA8ZHFmZXh0QGdtYWlsLmNvbT4g5pa8IDIwMjHlubQ05pyINuaXpSDp
gLHkuowg5LiL5Y2IMTA6MTnlr6vpgZPvvJoKPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvcGh5L0tj
b25maWcKPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvcGh5L0tjb25maWcKPiA+ID4gQEAgLTIwNyw2
ICsyMDcsMTEgQEAgY29uZmlnIE1BUlZFTExfODhYMjIyMl9QSFkKPiA+ID4gICAgICAgICAgIFN1
cHBvcnQgZm9yIHRoZSBNYXJ2ZWxsIDg4WDIyMjIgRHVhbC1wb3J0IE11bHRpLXNwZWVkIEV0aGVy
bmV0Cj4gPiA+ICAgICAgICAgICBUcmFuc2NlaXZlci4KPiA+ID4KPiA+ID4gK2NvbmZpZyBNRURJ
QVRFS19QSFkKPiA+Cj4gPiBUaGVyZSBhcmUgbWFueSBNZWRpYXRlayBwaHkgZHJpdmVycyBpbiBb
MV0sIHNvIHVzZSBhIHNwZWNpZmljIG5hbWUuCj4gCj4gU28gIk1FRElBVEVLX01UNzUzMF9QSFki
IHNob3VsZCBiZSBva2F5PwoKTm8uIE1FRElBVEVLX1BIWSBpcyBjb25zaXN0ZW50IHdpdGggb3Ro
ZXIgUEhZIGRyaXZlcnMuIFBsZWFzZSBsZWF2ZSBpdAphcyBpdCBpcy4gQW5kIHdpdGggdGltZSwg
d2UgZXhwZWN0IG90aGVyIGRldmljZXMgd2lsbCBiZSBzdXBwb3J0ZWQgYnkKdGhpcyBkcml2ZXIs
IHNvIGhhdmluZyBNVDc1MzAgaW4gdGhlIG5hbWUgd291bGQgYmUgY29uZnVzaW5nLgoKICAgQW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
