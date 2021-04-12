Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19488C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:05:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC676121E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC676121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9JNr8STZPX1ZeThwgZEdu2UNHCOoiqzi1I0BsscXob0=; b=K0T5dQlqOBTLswvUchW7nYbya
	y2J3QPGdxTOyuDtGhS5lTNFXSXqRKJwQ0f1GmLi3oBhBGnYW1Me2ZHVDJOniqnMAkpFI/SXQ0Y0q7
	6D0v50Wvo7DistZ5vzN9BMNM8PKbBAG91i/O/hsYUtyR3g7jQ6ODqeBHhXBCaX9BwOnCMHfJ2SQzR
	/e7kwa3T6IcpAM6fvckuBOPjQg057SfS7M/oINlZlUh4vN5x/ol04RlygnshWkDdSw0TyBv7RoXek
	rOekKqT55yqaag3EVPEGSbuQQ4RjWf4YkcYGJgZQ5USBwquWEJBnMq9Mx9+nW/zyh/LLrY8gX+Ua0
	hHaWM/i/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqcy-005txS-W8; Mon, 12 Apr 2021 07:04:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqcv-005twx-PS
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 07:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:To:From:
 Message-ID:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=M3JQj7NzQ2CBv+j5XuKuVWBX0H8tPiRu38YIUIPNjSc=; b=Tt00HbBhQWP6z7HQktbVuYxikb
 VNTNB3no1jcFkPYT9IqG1rprNQazB8+yZydStkjJHhmhQmvpetztg+WZWp6FWn0JS9isiD3IZi8r/
 9aRi0oBLC/Gpm097lIAYKAA/4jvMuvLp6tFyfhblHKjfqajg4onjGz/xc+ANhHqdvQqFrd84/exj9
 ZOwG7J+sAUxGT9tbk9eI0Pg1i5sHfECm+rMDJU03Lwo0n6NxvsSfmiMKYdYdqt0+F09/cLoQhHdUz
 pHMzqDLMVo0YLMTDwmvdpDOZwltN7Hm1CA6/b2dPuP64Miq9RIU6DD4jY/D+wdfOT6Zd2k+eyHWGK
 HzR/iNgg==;
Received: from mx.i2x.nl ([2a04:52c0:101:921::25])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqcs-005uyW-Uj
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 07:04:52 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id 7DC8A5FB39;
 Mon, 12 Apr 2021 09:04:49 +0200 (CEST)
Authentication-Results: mx.i2x.nl;
 dkim=pass (2048-bit key) header.d=vdorst.com header.i=@vdorst.com
 header.b="KOH61tZq"; dkim-atps=neutral
Received: from www (unknown [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 33C67BCA030;
 Mon, 12 Apr 2021 09:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 33C67BCA030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1618211089;
 bh=M3JQj7NzQ2CBv+j5XuKuVWBX0H8tPiRu38YIUIPNjSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KOH61tZqHiukrLYL9orX2yh2BVHg/y8DgL5igT2aG+TF571PC/ImF29hG0/4PBw/7
 3Di7yXomrnD8HlzijAEPIKkRf58yfY75kRFmqmk3ZNvkIIB8fsIsus7DL2xMnnZFtu
 mCrKmG/p3wBBnxrPZuFBlODuczwfhpwFJsxpABR0sBp2X1G6MwFdI4Js43WlaXRhqL
 FbZaQUo8fm00uX0EJKouhWyspLxMyH81yxtvbP4UKXeBNmLddqZUy6sLusKEXXu6oI
 Al3jwshnr79LRIAbUGE7OatklqNrl4RgNnM4XE1P9ArFAWIDktsHtvwRfp9BB1pM6D
 EPFXRfrMGg+rQ==
Received: from 48.79.2.5.in-addr.arpa (48.79.2.5.in-addr.arpa [5.2.79.48])
 by www.vdorst.com (Horde Framework) with HTTPS; Mon, 12 Apr 2021 07:04:49
 +0000
Date: Mon, 12 Apr 2021 07:04:49 +0000
Message-ID: <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Landen Chao
 <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 1/4] net: phy: add MediaTek PHY driver
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-2-dqfext@gmail.com>
In-Reply-To: <20210412034237.2473017-2-dqfext@gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_000451_150916_97885EFD 
X-CRM114-Status: GOOD (  21.71  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgUWluZ2ZhbmcsCgpRdW90aW5nIERFTkcgUWluZ2ZhbmcgPGRxZmV4dEBnbWFpbC5jb20+OgoK
PiBBZGQgc3VwcG9ydCBmb3IgTWVkaWFUZWsgUEhZcyBmb3VuZCBpbiBNVDc1MzAgYW5kIE1UNzUz
MSBzd2l0Y2hlcy4KPiBUaGUgaW5pdGlhbGl6YXRpb24gcHJvY2VkdXJlIGlzIGZyb20gdGhlIHZl
bmRvciBkcml2ZXIsIGJ1dCBkdWUgdG8gbGFjawo+IG9mIGRvY3VtZW50YXRpb24sIHRoZSBmdW5j
dGlvbiBvZiBzb21lIHJlZ2lzdGVyIHZhbHVlcyByZW1haW5zIHVua25vd24uCj4KPiBTaWduZWQt
b2ZmLWJ5OiBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPgo+IC0tLQo+IFJGQyB2MyAt
PiBSRkMgdjQ6Cj4gLSBSZW1vdmUgdW51c2VkIGluY2x1ZGUuCj4KPiAgZHJpdmVycy9uZXQvcGh5
L0tjb25maWcgICAgfCAgIDUgKysKPiAgZHJpdmVycy9uZXQvcGh5L01ha2VmaWxlICAgfCAgIDEg
Kwo+ICBkcml2ZXJzL25ldC9waHkvbWVkaWF0ZWsuYyB8IDExMSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbmV0L3BoeS9tZWRpYXRlay5jCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvcGh5L0tjb25maWcgYi9kcml2ZXJzL25ldC9waHkvS2NvbmZp
Zwo+IGluZGV4IGE2MTViMzY2MGIwNS4uZWRkODU4Y2VjOWVjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbmV0L3BoeS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9uZXQvcGh5L0tjb25maWcKPiBAQCAt
MjA3LDYgKzIwNywxMSBAQCBjb25maWcgTUFSVkVMTF84OFgyMjIyX1BIWQo+ICAJICBTdXBwb3J0
IGZvciB0aGUgTWFydmVsbCA4OFgyMjIyIER1YWwtcG9ydCBNdWx0aS1zcGVlZCBFdGhlcm5ldAo+
ICAJICBUcmFuc2NlaXZlci4KPgo+ICtjb25maWcgTUVESUFURUtfUEhZCj4gKwl0cmlzdGF0ZSAi
TWVkaWFUZWsgUEhZcyIKPiArCWhlbHAKPiArCSAgU3VwcG9ydHMgdGhlIE1lZGlhVGVrIHN3aXRj
aCBpbnRlZ3JhdGVkIFBIWXMuCj4gKwo+ICBjb25maWcgTUlDUkVMX1BIWQo+ICAJdHJpc3RhdGUg
Ik1pY3JlbCBQSFlzIgo+ICAJaGVscAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9waHkvTWFr
ZWZpbGUgYi9kcml2ZXJzL25ldC9waHkvTWFrZWZpbGUKPiBpbmRleCBkZTY4M2UzYWJlNjMuLjll
ZDdkYmFiNzc3MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9waHkvTWFrZWZpbGUKPiArKysg
Yi9kcml2ZXJzL25ldC9waHkvTWFrZWZpbGUKPiBAQCAtNjQsNiArNjQsNyBAQCBvYmotJChDT05G
SUdfTFhUX1BIWSkJCSs9IGx4dC5vCj4gIG9iai0kKENPTkZJR19NQVJWRUxMXzEwR19QSFkpCSs9
IG1hcnZlbGwxMGcubwo+ICBvYmotJChDT05GSUdfTUFSVkVMTF9QSFkpCSs9IG1hcnZlbGwubwo+
ICBvYmotJChDT05GSUdfTUFSVkVMTF84OFgyMjIyX1BIWSkJKz0gbWFydmVsbC04OHgyMjIyLm8K
PiArb2JqLSQoQ09ORklHX01FRElBVEVLX1BIWSkJKz0gbWVkaWF0ZWsubwo+ICBvYmotJChDT05G
SUdfTUVTT05fR1hMX1BIWSkJKz0gbWVzb24tZ3hsLm8KPiAgb2JqLSQoQ09ORklHX01JQ1JFTF9L
Uzg5OTVNQSkJKz0gc3BpX2tzODk5NS5vCj4gIG9iai0kKENPTkZJR19NSUNSRUxfUEhZKQkrPSBt
aWNyZWwubwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9waHkvbWVkaWF0ZWsuYyBiL2RyaXZl
cnMvbmV0L3BoeS9tZWRpYXRlay5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjE2MjdiN2MwNDM0NQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL25l
dC9waHkvbWVkaWF0ZWsuYwo+IEBAIC0wLDAgKzEsMTExIEBACj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wKwo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNs
dWRlIDxsaW51eC9waHkuaD4KPiArCj4gKyNkZWZpbmUgTVRLX0VYVF9QQUdFX0FDQ0VTUwkJMHgx
Zgo+ICsjZGVmaW5lIE1US19QSFlfUEFHRV9TVEFOREFSRAkJMHgwMDAwCj4gKyNkZWZpbmUgTVRL
X1BIWV9QQUdFX0VYVEVOREVECQkweDAwMDEKPiArI2RlZmluZSBNVEtfUEhZX1BBR0VfRVhURU5E
RURfMgkJMHgwMDAyCj4gKyNkZWZpbmUgTVRLX1BIWV9QQUdFX0VYVEVOREVEXzMJCTB4MDAwMwo+
ICsjZGVmaW5lIE1US19QSFlfUEFHRV9FWFRFTkRFRF8yQTMwCTB4MmEzMAo+ICsjZGVmaW5lIE1U
S19QSFlfUEFHRV9FWFRFTkRFRF81MkI1CTB4NTJiNQo+ICsKPiArc3RhdGljIGludCBtdGtfcGh5
X3JlYWRfcGFnZShzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+ICt7Cj4gKwlyZXR1cm4gX19w
aHlfcmVhZChwaHlkZXYsIE1US19FWFRfUEFHRV9BQ0NFU1MpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW50IG10a19waHlfd3JpdGVfcGFnZShzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2LCBpbnQgcGFn
ZSkKPiArewo+ICsJcmV0dXJuIF9fcGh5X3dyaXRlKHBoeWRldiwgTVRLX0VYVF9QQUdFX0FDQ0VT
UywgcGFnZSk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIG10a19waHlfY29uZmlnX2luaXQoc3Ry
dWN0IHBoeV9kZXZpY2UgKnBoeWRldikKPiArewo+ICsJLyogRGlzYWJsZSBFRUUgKi8KPiArCXBo
eV93cml0ZV9tbWQocGh5ZGV2LCBNRElPX01NRF9BTiwgTURJT19BTl9FRUVfQURWLCAwKTsKCkZv
ciBteSBFRUUgcGF0Y2ggSSBjaGFuZ2VkIHRoaXMgbGluZSB0bzoKCmdlbnBoeV9jb25maWdfZWVl
X2FkdmVydChwaHlkZXYpOwoKU28gUEhZIEVFRSBwYXJ0IGlzIHNldHVwIHByb3Blcmx5IGF0IGJv
b3QsIGluc3RlYWQgZW5hYmxlIGl0IG1hbnVhbCAgCnZpYSBldGh0b29sLgpUaGlzIGZ1bmN0aW9u
IGFsc28gdGFrZXMgdGhlIERUUyBwYXJhbWV0ZXJzICJlZWUtYnJva2VuLXh4eHgiIGluIHRvICAK
YWNjb3VudCB3aGlsZQpzZXR0aW5nLXVwIHRoZSBQSFkuCgo+ICsKPiArCS8qIEVuYWJsZSBIVyBh
dXRvIGRvd25zaGlmdCAqLwo+ICsJcGh5X21vZGlmeV9wYWdlZChwaHlkZXYsIE1US19QSFlfUEFH
RV9FWFRFTkRFRCwgMHgxNCwgMCwgQklUKDQpKTsKPiArCj4gKwkvKiBJbmNyZWFzZSBTbHZEUFNy
ZWFkeSB0aW1lICovCj4gKwlwaHlfc2VsZWN0X3BhZ2UocGh5ZGV2LCBNVEtfUEhZX1BBR0VfRVhU
RU5ERURfNTJCNSk7Cj4gKwlfX3BoeV93cml0ZShwaHlkZXYsIDB4MTAsIDB4YWZhZSk7Cj4gKwlf
X3BoeV93cml0ZShwaHlkZXYsIDB4MTIsIDB4MmYpOwo+ICsJX19waHlfd3JpdGUocGh5ZGV2LCAw
eDEwLCAweDhmYWUpOwo+ICsJcGh5X3Jlc3RvcmVfcGFnZShwaHlkZXYsIE1US19QSFlfUEFHRV9T
VEFOREFSRCwgMCk7Cj4gKwo+ICsJLyogQWRqdXN0IDEwMF9tc2VfdGhyZXNob2xkICovCj4gKwlw
aHlfd3JpdGVfbW1kKHBoeWRldiwgTURJT19NTURfVkVORDEsIDB4MTIzLCAweGZmZmYpOwo+ICsK
PiArCS8qIERpc2FibGUgbWNjICovCj4gKwlwaHlfd3JpdGVfbW1kKHBoeWRldiwgTURJT19NTURf
VkVORDEsIDB4YTYsIDB4MzAwKTsKPiArfQo+ICsKCkdyZWF0cywKClJlbsOpCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
