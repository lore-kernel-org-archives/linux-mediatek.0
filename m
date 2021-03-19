Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D07C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 10:29:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82AC264F6B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 10:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82AC264F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdTKi7mToU+aXcLIoU5nouRwQHc9Qa5nY0hJOKqPRmo=; b=OYPKCnWL+QOmUjdu9kqvho9eV
	AztltqxzSW2DV+gUseQ/D/W8nYNKaNuXURv779rZIzuMsS5annYfCj4/+B9s2BAN90Tew2Ojt5Fbq
	6m2kcdEj0m5DIYxMf5/TYiUYCoDqHY3zAKlNGptvOJ+4Sny9m+G59Hh6oym6lIj/UqY+NHh4dOPfD
	PvHoo7Mzme2Sh4iQIlsrZv0bwwud5nIGepwtCCkRR1C1WrB2v88R4lguQdqYafJgnS43RebFekSvF
	roywXnPISBbPw8OWpVdqwvhxMQIeTDI+dxAMq6bKOPCn+mTQl5NxUIKPzCCkLpzsTNORpjUChvQjv
	h7Xs8pKfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNCO0-0079zs-SP; Fri, 19 Mar 2021 10:29:45 +0000
Received: from mx.i2x.nl ([5.2.79.48])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lNCKU-0078kw-Od; Fri, 19 Mar 2021 10:26:14 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id 24E975FB12;
 Fri, 19 Mar 2021 11:25:56 +0100 (CET)
Authentication-Results: mx.i2x.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="D239ADue"; 
 dkim-atps=neutral
Received: from www (unknown [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id D3ED5B17AE5;
 Fri, 19 Mar 2021 11:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com D3ED5B17AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1616149555;
 bh=ANu+7V/Eez3ob22Ix7TLB1GB0Pyn7ZUcUF5mBZmRflI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D239ADueBEbxTpKgW1tWeevvifzhBeWXZ5vjOLSY8JL5A0XJ1wCmT3k2GUXoVF53a
 x/kw+7T8XYClp3mFpP+XlaidYpYe8DDTxyh4qcunpyuH4OmMWq4Mevj7NrjB5X1ONF
 PKYymWJtuoleV7AQwDUxid1li/+OqEnnZgdzkiphRJlEwWS9LoKtEf2RaXCjGbX6ec
 B+oeuoisuWZY9SnmDn4KaOeEZMoofRttBj3AenQnApJ/4I/JKR6t60Atka/jajh8Sx
 UYHYspNbDT+LkTRHdne2mrf8RR6ME7nrSXCinCm/9yneoqA4TAGy/Aaik2VG3+/wD6
 7lgVOaVhYqRtQ==
Received: from 2a02-a453-deab-1-caf8-57c0-c865-5881.fixed6.kpn.net
 (2a02-a453-deab-1-caf8-57c0-c865-5881.fixed6.kpn.net
 [2a02:a453:deab:1:caf8:57c0:c865:5881]) by www.vdorst.com (Horde Framework)
 with HTTPS; Fri, 19 Mar 2021 10:25:55 +0000
Date: Fri, 19 Mar 2021 10:25:55 +0000
Message-ID: <20210319102555.Horde.jeA-oYm4tfkVqKj-gnqxRoo@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell
 King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, sander@svanheule.net,
 tsbogend@alpha.franken.de, john@phrozen.org, Frank Wunderlich
 <frank-w@public-files.de>
Subject: Re: [PATCH net,v2] net: dsa: mt7530: setup core clock even in
 TRGMII mode
References: <20210311012108.7190-1-ilya.lipnitskiy@gmail.com>
 <20210312080703.63281-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210312080703.63281-1-ilya.lipnitskiy@gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_102607_816641_CB82EE91 
X-CRM114-Status: GOOD (  24.50  )
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

UXVvdGluZyBJbHlhIExpcG5pdHNraXkgPGlseWEubGlwbml0c2tpeUBnbWFpbC5jb20+OgoKPiBB
IHJlY2VudCBjaGFuZ2UgdG8gTUlQUyByYWxpbmsgcmVzZXQgbG9naWMgbWFkZSBpdCBzbyBtdDc1
MzAgYWN0dWFsbHkKPiByZXNldHMgdGhlIHN3aXRjaCBvbiBwbGF0Zm9ybXMgc3VjaCBhcyBtdDc2
MjEgKHdoZXJlIGJpdCAyIGlzIHRoZSByZXNldAo+IGxpbmUgZm9yIHRoZSBzd2l0Y2gpLiBUaGF0
IGV4cG9zZWQgYW4gaXNzdWUgd2hlcmUgdGhlIHN3aXRjaCB3b3VsZCBub3QKPiBmdW5jdGlvbiBw
cm9wZXJseSBpbiBUUkdNSUkgbW9kZSBhZnRlciBhIHJlc2V0Lgo+Cj4gUmVjb25maWd1cmUgY29y
ZSBjbG9jayBpbiBUUkdNSUkgbW9kZSB0byBmaXggdGhlIGlzc3VlLgo+Cj4gVGVzdGVkIG9uIFVi
aXF1aXRpIEVSLVggKE1UNzYyMSkgd2l0aCBUUkdNSUkgbW9kZSBlbmFibGVkLgo+Cj4gRml4ZXM6
IDNmOWVmNzc4NWE5YyAoIk1JUFM6IHJhbGluazogbWFuYWdlIGxvdyByZXNldCBsaW5lcyIpCj4g
U2lnbmVkLW9mZi1ieTogSWx5YSBMaXBuaXRza2l5IDxpbHlhLmxpcG5pdHNraXlAZ21haWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgfCA1MiArKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCAyNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9kc2EvbXQ3
NTMwLmMgYi9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKPiBpbmRleCBmMDZmNWZhMmY4OTguLjk4
NzFkN2NmZjkzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKPiArKysg
Yi9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKPiBAQCAtNDM2LDM0ICs0MzYsMzIgQEAgbXQ3NTMw
X3BhZF9jbGtfc2V0dXAoc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCAgCj4gcGh5X2ludGVyZmFjZV90
IGludGVyZmFjZSkKPiAgCQkJICAgICBURF9ETV9EUlZQKDgpIHwgVERfRE1fRFJWTig4KSk7Cj4K
PiAgCS8qIFNldHVwIGNvcmUgY2xvY2sgZm9yIE1UNzUzMCAqLwo+IC0JaWYgKCF0cmdpbnQpIHsK
PiAtCQkvKiBEaXNhYmxlIE1UNzUzMCBjb3JlIGNsb2NrICovCj4gLQkJY29yZV9jbGVhcihwcml2
LCBDT1JFX1RSR01JSV9HU1dfQ0xLX0NHLCBSRUdfR1NXQ0tfRU4pOwo+IC0KPiAtCQkvKiBEaXNh
YmxlIFBMTCwgc2luY2UgcGh5X2RldmljZSBoYXMgbm90IHlldCBiZWVuIGNyZWF0ZWQKPiAtCQkg
KiBwcm92aWRlZCBmb3IgcGh5X1tyZWFkLHdyaXRlXV9tbWRfaW5kaXJlY3QgaXMgY2FsbGVkLCB3
ZQo+IC0JCSAqIHByb3ZpZGUgb3VyIG93biBjb3JlX3dyaXRlX21tZF9pbmRpcmVjdCB0byBjb21w
bGV0ZSB0aGlzCj4gLQkJICogZnVuY3Rpb24uCj4gLQkJICovCj4gLQkJY29yZV93cml0ZV9tbWRf
aW5kaXJlY3QocHJpdiwKPiAtCQkJCQlDT1JFX0dTV1BMTF9HUlAxLAo+IC0JCQkJCU1ESU9fTU1E
X1ZFTkQyLAo+IC0JCQkJCTApOwo+IC0KPiAtCQkvKiBTZXQgY29yZSBjbG9jayBpbnRvIDUwME1o
eiAqLwo+IC0JCWNvcmVfd3JpdGUocHJpdiwgQ09SRV9HU1dQTExfR1JQMiwKPiAtCQkJICAgUkdf
R1NXUExMX1BPU0RJVl81MDBNKDEpIHwKPiAtCQkJICAgUkdfR1NXUExMX0ZCS0RJVl81MDBNKDI1
KSk7Cj4gKwkvKiBEaXNhYmxlIE1UNzUzMCBjb3JlIGNsb2NrICovCj4gKwljb3JlX2NsZWFyKHBy
aXYsIENPUkVfVFJHTUlJX0dTV19DTEtfQ0csIFJFR19HU1dDS19FTik7Cj4KPiAtCQkvKiBFbmFi
bGUgUExMICovCj4gLQkJY29yZV93cml0ZShwcml2LCBDT1JFX0dTV1BMTF9HUlAxLAo+IC0JCQkg
ICBSR19HU1dQTExfRU5fUFJFIHwKPiAtCQkJICAgUkdfR1NXUExMX1BPU0RJVl8yMDBNKDIpIHwK
PiAtCQkJICAgUkdfR1NXUExMX0ZCS0RJVl8yMDBNKDMyKSk7Cj4gLQo+IC0JCS8qIEVuYWJsZSBN
VDc1MzAgY29yZSBjbG9jayAqLwo+IC0JCWNvcmVfc2V0KHByaXYsIENPUkVfVFJHTUlJX0dTV19D
TEtfQ0csIFJFR19HU1dDS19FTik7Cj4gLQl9Cj4gKwkvKiBEaXNhYmxlIFBMTCwgc2luY2UgcGh5
X2RldmljZSBoYXMgbm90IHlldCBiZWVuIGNyZWF0ZWQKPiArCSAqIHByb3ZpZGVkIGZvciBwaHlf
W3JlYWQsd3JpdGVdX21tZF9pbmRpcmVjdCBpcyBjYWxsZWQsIHdlCj4gKwkgKiBwcm92aWRlIG91
ciBvd24gY29yZV93cml0ZV9tbWRfaW5kaXJlY3QgdG8gY29tcGxldGUgdGhpcwo+ICsJICogZnVu
Y3Rpb24uCj4gKwkgKi8KPiArCWNvcmVfd3JpdGVfbW1kX2luZGlyZWN0KHByaXYsCj4gKwkJCQlD
T1JFX0dTV1BMTF9HUlAxLAo+ICsJCQkJTURJT19NTURfVkVORDIsCj4gKwkJCQkwKTsKPiArCj4g
KwkvKiBTZXQgY29yZSBjbG9jayBpbnRvIDUwME1oeiAqLwo+ICsJY29yZV93cml0ZShwcml2LCBD
T1JFX0dTV1BMTF9HUlAyLAo+ICsJCSAgIFJHX0dTV1BMTF9QT1NESVZfNTAwTSgxKSB8Cj4gKwkJ
ICAgUkdfR1NXUExMX0ZCS0RJVl81MDBNKDI1KSk7Cj4gKwo+ICsJLyogRW5hYmxlIFBMTCAqLwo+
ICsJY29yZV93cml0ZShwcml2LCBDT1JFX0dTV1BMTF9HUlAxLAo+ICsJCSAgIFJHX0dTV1BMTF9F
Tl9QUkUgfAo+ICsJCSAgIFJHX0dTV1BMTF9QT1NESVZfMjAwTSgyKSB8Cj4gKwkJICAgUkdfR1NX
UExMX0ZCS0RJVl8yMDBNKDMyKSk7Cj4gKwo+ICsJLyogRW5hYmxlIE1UNzUzMCBjb3JlIGNsb2Nr
ICovCj4gKwljb3JlX3NldChwcml2LCBDT1JFX1RSR01JSV9HU1dfQ0xLX0NHLCBSRUdfR1NXQ0tf
RU4pOwo+Cj4gIAkvKiBTZXR1cCB0aGUgTVQ3NTMwIFRSR01JSSBUeCBDbG9jayAqLwo+ICAJY29y
ZV9zZXQocHJpdiwgQ09SRV9UUkdNSUlfR1NXX0NMS19DRywgUkVHX0dTV0NLX0VOKTsKPiAtLQo+
IDIuMzAuMgoKSGkgSWx5YSwKClRoYW5rcyBmb3IgZml4aW5nIHRoaXMgaXNzdWUuCgpJIHJlbWVt
YmVyIHRoYXQgRnJhbmsgYWxzbyBoYWQgYW4gaXNzdWUgd2l0aCBUUkdNSUkgb24gaGlzIE1UNzYy
MyBBUk0gYm9hcmQuCkkgbmV2ZXIgZm91bmQgd2h5IGl0IGRpZCBub3Qgd29yayBidXQgdGhpcyBt
YXkgYmUgYWxzbyBmaXggaGlzIGlzc3VlICAKb24gdGhlIE1UNzYyMyBkZXZpY2VzLgoKQWRkZWQg
RnJhbmsgdG8gQ0MuCgpUZXN0ZWQgb24gVWJpcXVpdGkgRVItWC1TRlAgKE1UNzYyMSkgd2l0aCBh
bmQgd2l0aG91dCBUUkdNSUkgbW9kZSBlbmFibGVkLgoKVGVzdGVkLWJ5OiBSZW7DqSB2YW4gRG9y
c3QgPG9wZW5zb3VyY2VAdmRvcnN0LmNvbT4KCkdyZWF0cywKClJlbsOpCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
