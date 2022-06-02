Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B3CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 10:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JT3VPrbNHnhZQb3D0eqJHpHtWgXIlLWjWwA7szTJVM=; b=qLV9r/DdaAdbj0
	Ha2lsUlj/PN7NcqG+3+Zngg0CuO5uKn7pa+/jvs5ouX3TBBNQBD1kvWXtZJSIf6TO7IUY10FqZ5HF
	2UXTEmk7WqqIXR2U2xI5HIHQ5IbYx75pAZys4i8R55K/kKHqx+khlT3ar26eZl70MWr0agWmEyuK5
	VCz9m441WYDR2zs1ZkuDsciT6vlRlRMQceoJxzopUhQOdIZedwwJfleL5KSWy9XDOZ1EpsgRb++pE
	in0Ajct95qOuJW7fh3ZvLA63aR87mHDCsgmem2uSSj5lGYNYsC8AnOm4/sdJiYdwC98EhhT7TjQXw
	52SfT94s5oO3/nDNs3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhcu-002cH0-3I; Thu, 02 Jun 2022 10:00:24 +0000
Received: from smtp-42af.mail.infomaniak.ch ([2001:1600:3:17::42af])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhcq-002cFZ-DF
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 10:00:22 +0000
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4LDM2S0hckzMqVZ1;
	Thu,  2 Jun 2022 12:00:16 +0200 (CEST)
Received: from [10.0.0.141] (unknown [31.10.206.125])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4LDM2R1hVrzljk0H;
	Thu,  2 Jun 2022 12:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
	s=20220412; t=1654164016;
	bh=6clftNNkW5b/aLVfOs7w8oDA4IjZgT0jJnfYalkyXtc=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=MpfhxnUiBgc+nT3XyFNggIH4DEYXpuPFvnua6h7NJWilzYTT4MomXlytP5wDq6uDj
	 lP3sLe/hjP4cDifzRVZiBGxdxaZ7YA99O+wL3SUKgDsOPJqSKmqd1p6tvJs6nj47Az
	 BGEAbuMmyRoRhgzAiPemv/lhoB+iIXufekVl5a7M=
Message-ID: <75b5f888b2e23f52aabce54ff38ddc70d1ad6a34.camel@pschenker.ch>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
From: Philippe Schenker <dev@pschenker.ch>
To: Deren Wu <deren.wu@mediatek.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
 linux@leemhuis.info, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi83@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, YN
 Chen <YN.Chen@mediatek.com>,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org,  regressions@lists.linux.dev
Date: Thu, 02 Jun 2022 12:00:14 +0200
In-Reply-To: <da79fa2a94c435a308ea763efc557fc352d0245c.camel@mediatek.com>
References: <20220412090415.17541-1-dev@pschenker.ch>
	 <87y20aod5d.fsf@kernel.org>
	 <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
	 <e93aef5c9f8a97efe23cfb5892f78f919ce328e7.camel@pschenker.ch>
	 <87mtewoj4e.fsf@kernel.org>
	 <da79fa2a94c435a308ea763efc557fc352d0245c.camel@mediatek.com>
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_030020_923430_1DD7A5D4 
X-CRM114-Status: GOOD (  32.63  )
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
Reply-To: dev@pschenker.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIyLTA2LTAyIGF0IDAwOjU1ICswODAwLCBEZXJlbiBXdSB3cm90ZToKPiBPbiBX
ZWQsIDIwMjItMDYtMDEgYXQgMTE6NTggKzAzMDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4gPiBQaGls
aXBwZSBTY2hlbmtlciA8ZGV2QHBzY2hlbmtlci5jaD4gd3JpdGVzOgo+ID4gCj4gPiA+IE9uIFR1
ZSwgMjAyMi0wNC0xMiBhdCAxOTowNiArMDgwMCwgRGVyZW4gV3Ugd3JvdGU6Cj4gPiA+ID4gT24g
VHVlLCAyMDIyLTA0LTEyIGF0IDEyOjM3ICswMzAwLCBLYWxsZSBWYWxvIHdyb3RlOgo+ID4gPiA+
ID4gUGhpbGlwcGUgU2NoZW5rZXIgPGRldkBwc2NoZW5rZXIuY2g+IHdyaXRlczoKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0Cj4gPiA+ID4gPiA+IGJmMzc0N2FlMmUy
NWRkYTZhOWU2YzQ2NGE3MTdjNjYxMThjNTg4YzguCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBU
aGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgcmVncmVzc2lvbiBvbiBzb21lIHN5c3RlbXMgd2hlcmUK
PiA+ID4gPiA+ID4gdGhlCj4gPiA+ID4gPiA+IGtlcm5lbCBpcwo+ID4gPiA+ID4gPiBjcmFzaGlu
ZyBpbiBkaWZmZXJlbnQgbG9jYXRpb25zIGFmdGVyIGEgcmVib290IHdhcyBpc3N1ZWQuCj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGlzIGlzc3VlIHdhcyBiaXNlY3RlZCBvbiBhIFRoaW5rcGFk
IFAxNHMgR2VuMiAoQU1EKSB3aXRoCj4gPiA+ID4gPiA+IGxhdGVzdAo+ID4gPiA+ID4gPiBmaXJt
d2FyZS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IExpbms6IAo+ID4gPiA+ID4gPiAKPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtd2ly
ZWxlc3MvNTA3N2E5NTM0ODcyNzU4MzdlODFiZGYxODA4ZGVkMDBiOTY3NmY5Zi5jYW1lbEBwc2No
ZW5rZXIuY2gvX187ISFDVFJOS0E5d01nMEFSYnchMDl0anlhUWxNY2kzZlZJM3lpTmlESktVV19x
d05BX0NiVmhvQXJhZUlYOTZCOTlRMTRKNGlEeWNXQTljcTM2WSQKPiA+ID4gPiA+ID4gwqAKPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgU2NoZW5rZXIgPGRldkBwc2NoZW5rZXIu
Y2g+Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IENhbiBJIHRha2UgdGhpcyB0byB3aXJlbGVzcyB0cmVl
PyBGZWxpeCwgYWNrPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJJ2xsIGFsc28gYWRkOgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBGaXhlczogYmYzNzQ3YWUyZTI1ICgibXQ3NjogbXQ3OTIxOiBlbmFibGUg
YXNwbSBieSBkZWZhdWx0IikKPiA+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEhpIEthbGxlLAo+
ID4gPiA+IAo+ID4gPiA+IFdlIGhhdmUgYSBwYXRjaCBmb3IgYSBzaW1pbGFyIHByb2JsZW0uIENh
biB5b3Ugd2FpdCBmb3IgdGhlCj4gPiA+ID4gdmVyaWZpY2F0aW9uIGJ5IFBoaWxpcHBlPwo+ID4g
PiA+IENvbW1pdCA2MDJjYzBjOTYxOGE4MSAoIm10NzY6IG10NzkyMWU6IGZpeCBwb3NzaWJsZSBw
cm9iZQo+ID4gPiA+IGZhaWx1cmUKPiA+ID4gPiBhZnRlcgo+ID4gPiA+IHJlYm9vdCIpCj4gPiA+
ID4gTGluazogCj4gPiA+ID4gCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC9jb21taXQvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Nj9pZD02MDJjYzBjOTYx
OGE4MTlhYjAwZWEzYzk0MDA3NDJhMGNhMzE4MzgwX187ISFDVFJOS0E5d01nMEFSYnchekNZeURj
dWZKLU9McVFWNmxlQ2VnQTVTa05PT1ZqQUlvLWp6VEhUazZIVVdUOUdqdC1idlN6OGxyODFadjk1
dSQKPiA+ID4gPiDCoAo+ID4gPiA+IAo+ID4gPiA+IEkgY2FuIHJlcHJvZHVjZSB0aGUgcHJvYmxl
bSBpbiBteSB2NS4xNi1yYzUgZGVza3RvcC4gQW5kIHRoZQo+ID4gPiA+IGlzc3VlIGNhbgo+ID4g
PiA+IGJlIGZpeGVkIHdoZW4gdGhlIHBhdGNoIGFwcGxpZWQuCj4gPiA+ID4gCj4gPiA+ID4gCj4g
PiA+ID4gSGkgUGhpbGlwcGUsCj4gPiA+ID4gCj4gPiA+ID4gQ2FuIHlvdSBwbGVhc2UgaGVscCB0
byBjaGVjayB0aGUgcGF0Y2ggaW4geW91ciBwbGF0Zm9ybT8KPiA+ID4gCj4gPiA+IEhpIEthbGxl
IGFuZCBEZXJlbiwKPiA+ID4gCj4gPiA+IEkganVzdCBub3RpY2VkIG9uIG15IHN5c3RlbSBhbmQg
bWFpbmxpbmUgdjUuMTggcmVib290cyBkbyBub3cgd29yawo+ID4gPiBob3dldmVyIEJsdWV0b290
aCBpcyBubyBsb25nZXIgYWNjZXNzaWJsZSBhZnRlciBhIHJlYm9vdC4KPiA+ID4gCj4gPiA+IFJl
dmVydGluZyBjb21taXQgYmYzNzQ3YWUyZTI1ZGRhNmE5ZTZjNDY0YTcxN2M2NjExOGM1ODhjOCBv
biB0b3AKPiA+ID4gb2YKPiA+ID4gdjUuMTggc29sdmVzIHRoaXMgcHJvYmxlbSBmb3IgbWUuCj4g
PiA+IAo+ID4gPiBARGVyZW4gYXJlIHlvdSBhd2FyZSBvZiB0aGlzIGJ1Zz8KPiA+ID4gQEthbGxl
IElzIHRoZXJlIGEgYnVndHJhY2tlciBzb21ld2hlcmUgSSBjYW4gc3VibWl0IHRoaXM/Cj4gPiAK
PiA+IEZvciByZWdyZXNzaW9ucyB0aGUgYmVzdCBpcyB0byBzdWJtaXQgaXQgdG8gdGhlIHJlZ3Jl
c3Npb25zIGxpc3QsCj4gPiBDQ2VkCj4gPiBpdCBub3cuCj4gPiAKPiBIaSBQaGlsaXBwZSwKPiAK
PiBUcmllZCB5b3VyIHRlc3Qgd2l0aCB2NS4xOC4wIG9uIG15IGRlc2t0b3AgYW5kIGJvdGggd2lm
aS9idCBhcmUgc3RpbGwKPiBhdmFpYmxlIGFmdGVyIHJlYm9vdC4gVGhlIG9ubHkgcHJvYmxlbSBp
cyBJIG5lZWQgdG8gaW5zZXJ0IGJ0dXNiCj4gbW9kdWxlCj4gYnkgY29tbWFuZCAibW9kcHJvYmUg
YnR1c2IiIHRvIG1ha2UgQlQgd29ya2FibGUuCj4gCj4gSSB3aWxsIGNoZWNrIHRoZSBpc3N1ZSBv
biBkaWZmZXJlbnQgcGxhdGZvcm1zLiBJZiB0aGVyZSBhcmUgYW55Cj4gZmluZGluZywgSSB3aWxs
IGxldCB5b3Uga25vdy4KClRoYW5rcyBmb3IgeW91ciB0ZXN0cywgSSBkaWQgdGVzdCBhZ2FpbiBv
biBteSBwbGF0Zm9ybS4gVGhpcyB0aW1lIHdpdGggYQpoYW5kLWJ1aWx0IHY1LjE4IHN0cmFpZ2h0
IGZyb20gdG9ydmFsZHMvbGludXguIEFuZCBJIGNhbiBjb25maXJtIG15CmZpbmRpbmdzIEkgZXZl
biBsb2FkZWQgYnR1c2IgKHJlbW92ZWQgYW5kIHJlbG9hZGVkKSBub3RoaW5nIGhlbHBlZC4gSQph
bHdheXMgZ2V0IHRoZSBtZXNzYWdlCgpObyBkZWZhdWx0IGNvbnRyb2xsZXIgYXZhaWxhYmxlCgpJ
biB0aGlzIGNhc2UgSSBndWVzcyBpdCBjb3VsZCBiZSByYXRoZXIgYSBCSU9TIGlzc3VlLiBJbiB0
aGlzIHRlc3RpbmcKcm91bmQgYWxzbyBzb21lIFVTQiBwb3J0cyBkaWQgbm90IHdvcmsuCgpJZiBp
dCBoZWxwcyBhbnkgbXkgc3lzdGVtIGlzIGEgTGVub3ZvIFAxNHMgR2VuMi4gSSBiZWxpZXZlIHRo
ZW4gdGhlCmRyaXZlciBpcyBnb29kLgoKUmVnYXJkcywKUGhpbGlwcGUKCj4gCj4gUmVnYXJkcywK
PiBEZXJlbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
