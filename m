Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B36C2BA17
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 15:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A4C124899
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 15:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HgBp1Elm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="sZxBLYbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A4C124899
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpSLhWL0pRt3TT/akAhYGnFzuWgeo4XESaA776YhN2A=; b=HgBp1ElmKpayfD
	R92S4g1wMnlLQXdVEjWs+bYYTj44ZtkEYeIfF65Jhf8hp0RdTlBRQ8qzKU5B65qfbZ3ky2VMvCCKq
	u+DyuRe9Fk876twq5oEx7jgYCKRaFZaaYmA+Rg+fue3ObfasPBCoBR7/Cn0OLb6shAvNizfsWdKd7
	iFVEqCiw/DBAnBhd1NFoQ8xEb0niSmN2HsR5E6znkEWL73ZDkADg5E7hq5s/vMNk5NDXtf6LeH9jz
	vlat3fiv782NCiWFPq2coagIxg3BnrToZcGEsx/GiP4NRpSXjgy6VnlqsfTKdp9AVu9zMajZQlO3g
	G2DvbfViehyFHu3qLuRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLTZ7-0000ub-7b; Mon, 06 Apr 2020 15:21:33 +0000
Received: from forward501j.mail.yandex.net ([2a02:6b8:0:801:2::111])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLTYz-0000n8-Pd; Mon, 06 Apr 2020 15:21:28 +0000
Received: from mxback6j.mail.yandex.net (mxback6j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::10f])
 by forward501j.mail.yandex.net (Yandex) with ESMTP id DE2783380468;
 Mon,  6 Apr 2020 18:21:20 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback6j.mail.yandex.net (mxback/Yandex) with ESMTP id OzbyaIb4Ls-LIAivFVM; 
 Mon, 06 Apr 2020 18:21:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1586186480; bh=hFG2UijyKPqo20hUOizY7T4Nc94PdinHDzgqa+EFXZ0=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=sZxBLYbnkxaNFTnlpz5cDxZd+UT2tvNmQm4AwYNzXD2dm+Vv+SnYT9CfUjVevWPQ0
 2TrWht3aFGnbDVNjGq+RIEsXRUl1PjxohIPS65jGI7Llcmnfu7Lpo2UsFkxIu64mUa
 j4z5TQKneCLEZdGPpXKKQe2rGcpvi/vYPA8kW69Q=
Authentication-Results: mxback6j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by myt5-5e0e3f348369.qloud-c.yandex.net with HTTP;
 Mon, 06 Apr 2020 18:21:18 +0300
From: Alexander Lobakin <bloodyreaper@yandex.ru>
Envelope-From: bloodyreaper@yandex.ru
To: Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <20200406144758.GC301483@lunn.ch>
References: <20200406105910.32339-1-79537434260@yandex.com>
 <20200406144758.GC301483@lunn.ch>
Subject: Re: [PATCH net-next] net: dsa: add GRO support via gro_cells
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 06 Apr 2020 18:21:18 +0300
Message-Id: <20241586185765@iva8-5e86d95f65ab.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_082126_328548_39B63ACC 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Woojung Huh <woojung.huh@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Microchip Linux Driver Support <unglinuxdriver@microchip.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Mao Wenan <maowenan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MDYuMDQuMjAyMCwgMTc6NDgsICJBbmRyZXcgTHVubiIgPGFuZHJld0BsdW5uLmNoPjoKPiBPbiBN
b24sIEFwciAwNiwgMjAyMCBhdCAwMTo1OToxMFBNICswMzAwLCBBbGV4YW5kZXIgTG9iYWtpbiB3
cm90ZToKPj4gwqBncm9fY2VsbHMgbGliIGlzIHVzZWQgYnkgZGlmZmVyZW50IGVuY2Fwc3VsYXRp
bmcgbmV0ZGV2aWNlcywgc3VjaCBhcwo+PiDCoGdlbmV2ZSwgbWFjc2VjLCB2eGxhbiBldGMuIHRv
IHNwZWVkIHVwIGRlY2Fwc3VsYXRlZCB0cmFmZmljIHByb2Nlc3NpbmcuCj4+IMKgQ1BVIHRhZyBp
cyBhIHNvcnQgb2YgImVuY2Fwc3VsYXRpb24iLCBhbmQgd2UgY2FuIHVzZSB0aGUgc2FtZSBtZWNo
cyB0bwo+PiDCoGdyZWF0bHkgaW1wcm92ZSBvdmVyYWxsIERTQSBwZXJmb3JtYW5jZS4KPj4gwqBz
a2JzIGFyZSBwYXNzZWQgdG8gdGhlIEdSTyBsYXllciBhZnRlciByZW1vdmluZyBDUFUgdGFncywg
c28gd2UgZG9uJ3QKPj4gwqBuZWVkIGFueSBuZXcgcGFja2V0IG9mZmxvYWQgdHlwZXMgYXMgaXQg
d2FzIGZpcnN0bHkgcHJvcG9zZWQgYnkgbWUgaW4KPj4gwqB0aGUgZmlyc3QgR1JPLW92ZXItRFNB
IHZhcmlhbnQgWzFdLgo+Pgo+PiDCoFRoZSBzaXplIG9mIHN0cnVjdCBncm9fY2VsbHMgaXMgc2l6
ZW9mKHZvaWQgKiksIHNvIGhvdCBzdHJ1Y3QKPj4gwqBkc2Ffc2xhdmVfcHJpdiBiZWNvbWVzIG9u
bHkgNC84IGJ5dGVzIGJpZ2dlciwgYW5kIGFsbCBjcml0aWNhbCBmaWVsZHMKPj4gwqByZW1haW4g
aW4gb25lIDMyLWJ5dGUgY2FjaGVsaW5lLgo+PiDCoFRoZSBvdGhlciBwb3NpdGl2ZSBzaWRlIGVm
ZmVjdCBpcyB0aGF0IGRyaXZlcnMgZm9yIG5ldHdvcmsgZGV2aWNlcwo+PiDCoHRoYXQgY2FuIGJl
IHNoaXBwZWQgYXMgQ1BVIHBvcnRzIG9mIERTQS1kcml2ZW4gc3dpdGNoZXMgY2FuIG5vdyB1c2UK
Pj4gwqBuYXBpX2dyb19mcmFncygpIHRvIHBhc3Mgc2ticyB0byBrZXJuZWwuIFBhY2tldHMgYnVp
bHQgdGhhdCB3YXkgYXJlCj4+IMKgY29tcGxldGVseSBub24tbGluZWFyIGFuZCBhcmUgbGlrZWx5
IGJlaW5nIGRyb3BwZWQgd2l0aG91dCBHUk8uCj4+Cj4+IMKgVGhpcyB3YXMgdGVzdGVkIG9uIHRv
LWJlLW1haW5saW5lZC1zb29uIEV0aGVybmV0IGRyaXZlciB0aGF0IHVzZXMKPj4gwqBuYXBpX2dy
b19mcmFncygpLCBhbmQgdGhlIG92ZXJhbGwgcGVyZm9ybWFuY2Ugd2FzIG9uIHBhciB3aXRoIHRo
ZQo+PiDCoHZhcmlhbnQgZnJvbSBbMV0sIHNvbWV0aW1lcyBldmVuIGJldHRlciBkdWUgdG8gbWlu
aW1hbCBvdmVyaGVhZC4KPj4gwqBuZXQuY29yZS5ncm9fbm9ybWFsX2JhdGNoIHR1bmluZyBtYXkg
aGVscCB0byBwdXNoIGl0IHRvIHRoZSBsaW1pdAo+PiDCoG9uIHBhcnRpY3VsYXIgc2V0dXBzIGFu
ZCBwbGF0Zm9ybXMuCj4+Cj4+IMKgWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8y
MDE5MTIzMDE0MzAyOC4yNzMxMy0xLWFsb2Jha2luQGRsaW5rLnJ1Lwo+Cj4gSGkgQWxleGFuZGVy
CgpIaSBBbmRyZXchCgo+IG5ldC1uZXh0IGlzIGNsb3NlZCBhdCB0aGUgbW9tZW50LiBTbyB5b3Ug
c2hvdWxkIG9mIHBvc3RlZCB0aGlzIHdpdGggYW4KPiBSRkMgcHJlZml4LgoKSSBzYXcgdGhhdCBp
dCdzIGNsb3NlZCwgYnV0IGRpZG4ndCBrbmV3IGFib3V0ICJSRkMiIHRhZ3MgZm9yIHRoYXQgcGVy
aW9kLApzb3JyeS4KCj4gVGhlIGltcGxlbWVudGF0aW9uIGxvb2tzIG5pY2UgYW5kIHNpbXBsZS4g
QnV0IGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZQo+IHNvbWUgcGVyZm9ybWFuY2UgZmlndXJlcy4K
CkknbGwgZG8sIHN1cmUuIEkgdGhpbmsgSSdsbCBjb2xsZWN0IHRoZSBzdGF0cyB3aXRoIHZhcmlv
dXMgbWFpbiByZWNlaXZpbmcKZnVuY3Rpb25zIGluIEV0aGVybmV0IGRyaXZlciAobmFwaV9ncm9f
ZnJhZ3MoKSwgbmFwaV9ncm9fcmVjZWl2ZSgpLApuZXRpZl9yZWNlaXZlX3NrYigpLCBuZXRpZl9y
ZWNlaXZlX3NrYl9saXN0KCkpLCBhbmQgd2l0aCBhbmQgd2l0aG91dCB0aGlzCnBhdGNoIHRvIG1h
a2UgdGhlbSBhcyBjb21wbGV0ZSBhcyBwb3NzaWJsZS4KCj4gwqDCoMKgwqDCoEFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
