Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C828FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zZRJS1iNTzSxiU1n3EStTe8Y5Wy1P+9JliEXzflTTg=; b=jmvo7RZXCdJzLn
	+9IYXSNeY4isBFNj4qeu6gXfjJpZZMpQ8MWMPuqfrHSIJ1Ae4fPZYtJ88G7bOxSy9786Kjabmw9TI
	uKvtdq72X2IrrY7sxjysldNn4jAKv3Aup/+FCuegyleyNZlY9iUxI01u9kC+IVtQaVep4tewauV5S
	oMbPnmL+njhJVKND0VVaJ0TrGjmhIMbxTzMr9zcqyDN6P+rIFY4hgsjUS4yoGwodHA2V/dZGYLFQo
	oZvuervpPZTsEI3b84V4TBjCoeEdDAkJPyBSeCzY34LXF6QCNUbSkQiOGlk7CoJvCCUl0/Eeg/1M3
	JYhQnOFX91Yu4L6B/BAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fiF-00Arl9-NA; Tue, 04 Jan 2022 09:02:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fa0-00ApOb-QI; Tue, 04 Jan 2022 08:54:06 +0000
X-UUID: 5188e470bc0d4014a24debdc1fb1dfb5-20220104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=brhqIFFMdcfEWAvou5K8NfEO+QOlRwYJuECfooyXFss=; 
 b=QglWHIfF5DzU4rm42cdWiROi/EDnoTwxodrvwnXZge80xDIHb1/6HTObVfzCN4AttdlFygCryjqO3C9pB+XSVDpxwK+yYbnAJix+eBGb/fpI9bs7prlIkr68Of4ttWIIuwhLjEbpHZ59HCUC8ZeZTOWBk3MDFoZp1RZBpHiI7CE=;
X-UUID: 5188e470bc0d4014a24debdc1fb1dfb5-20220104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 237531630; Tue, 04 Jan 2022 01:54:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 00:43:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 4 Jan 2022 16:43:56 +0800
Received: from mszswglt01 (10.16.20.20) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Jan 2022 16:43:55 +0800
Message-ID: <ae7c424a02b5b0ef30239ca65bd58086f13bc42b.camel@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
From: Guangming.Cao <guangming.cao@mediatek.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "John
 Stultz" <john.stultz@linaro.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, "Laura
 Abbott" <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, "open list:DMA-BUF HEAPS FRAMEWORK"
 <linux-media@vger.kernel.org>, "open list:DMA-BUF HEAPS FRAMEWORK"
 <dri-devel@lists.freedesktop.org>, "moderated list:DMA-BUF HEAPS FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Bo Song
 <bo.song@mediatek.com>, Libo Kang <libo.kang@mediatek.com>, jianjiao zeng
 <jianjiao.zeng@mediatek.com>, mingyuan ma <mingyuan.ma@mediatek.com>, "Yunfei
 Wang" <yf.wang@mediatek.com>, <wsd_upstream@mediatek.com>
Date: Tue, 4 Jan 2022 16:44:45 +0800
In-Reply-To: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
References: <20211217094104.24977-1-guangming.cao@mediatek.com>
 <20211227095102.6054-1-guangming.cao@mediatek.com>
 <CALAqxLVA4jUk-2o28RZobrPDUnuXfV1xN77Pt8Pu1o27V3aUQQ@mail.gmail.com>
 <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_005404_898626_062AE0B2 
X-CRM114-Status: GOOD (  33.83  )
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

T24gVHVlLCAyMDIyLTAxLTA0IGF0IDA4OjQ3ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAwMy4wMS4yMiB1bSAxOTo1NyBzY2hyaWViIEpvaG4gU3R1bHR6Og0KPiA+IE9uIE1v
biwgRGVjIDI3LCAyMDIxIGF0IDE6NTIgQU0gPGd1YW5nbWluZy5jYW9AbWVkaWF0ZWsuY29tPiB3
cm90ZToNCj4gPiA+IEZyb206IEd1YW5nbWluZyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+
DQo+ID4gPiANCj4gPiANCj4gPiBUaGFua3MgZm9yIHN1Ym1pdHRpbmcgdGhpcyENCj4gPiANCj4g
PiA+IEFkZCBhIHNpemUgY2hlY2sgZm9yIGFsbGNhdGlvbiBzaW5jZSB0aGUgYWxsb2NhdGlvbiBz
aXplIGlzDQo+ID4gDQo+ID4gbml0OiAiYWxsb2NhdGlvbiIgYWJvdmUuDQo+ID4gDQo+ID4gPiBh
bHdheXMgbGVzcyB0aGFuIHRoZSB0b3RhbCBEUkFNIHNpemUuDQo+ID4gDQo+ID4gSW4gZ2VuZXJh
bCwgaXQgbWlnaHQgYmUgZ29vZCB0byBhZGQgbW9yZSBjb250ZXh0IHRvIHRoZSBjb21taXQNCj4g
PiBtZXNzYWdlDQo+ID4gdG8gYmV0dGVyIGFuc3dlciAqd2h5KiB0aGlzIGNoYW5nZSBpcyBuZWVk
ZWQgcmF0aGVyIHRoYW4gd2hhdCB0aGUNCj4gPiBjaGFuZ2UgaXMgZG9pbmcuICBpZTogV2hhdCBu
ZWdhdGl2ZSB0aGluZyBoYXBwZW5zIHdpdGhvdXQgdGhpcw0KPiA+IGNoYW5nZT8NCj4gPiBBbmQg
c28gaG93IGRvZXMgdGhpcyBjaGFuZ2UgYXZvaWQgb3IgaW1wcm92ZSB0aGluZ3M/DQo+IA0KPiBD
b21wbGV0ZWx5IGFncmVlLCBqdXN0IG9uZSBsaXR0bGUgYWRkaXRpb246IENvdWxkIHlvdSBhbHNv
IGFkZCB0aGlzDQo+IHdoeSANCj4gYXMgY29tbWVudCB0byB0aGUgY29kZT8NCj4gDQo+IFdoZW4g
d2Ugc3R1bWJsZSBvdmVyIHRoaXMgZml2ZSB5ZWFycyBmcm9tIG5vdyBpdCBpcyBhYnNvbHV0ZWx5
IG5vdCANCj4gb2J2aW91cyB3aHkgd2UgZG8gdGhpcy4NClRoYW5rcyBmb3IgeW91ciByZXBseSEN
Ckkgd2lsbCB1cGRhdGUgdGhlIHJlbGF0ZWQgcmVhc29uIGluIHRoZSBwYXRjaCBsYXRlci4NCg0K
VGhlIHJlYXNvbiBmb3IgYWRkaW5nIHRoaXMgY2hlY2sgaXMgdGhhdCB3ZSBtZXQgYSBjYXNlIHRo
YXQgdGhlIHVzZXINCnNlbnQgYW4gaW52YWxpZCBzaXplKEl0IHNlZW1zIGl0J3MgYSBuZWdhdGl2
ZSB2YWx1ZSwgTVNCIGlzIDB4ZmYsIGl0J3MNCmxhcmdlciB0aGFuIERSQU0gc2l6ZSBhZnRlciBj
b252ZXJ0IGl0IHRvIHNpemVfdCkgdG8gZG1hLWhlYXAgdG8gYWxsb2MNCm1lbW9yeSwgYW5kIHRo
aXMgYWxsb2NhdGlvbiB3YXMgcnVubmluZyBvbiBhIHByb2Nlc3Moc3VjaCBhcyAiZ3JhbGxvYyIN
Cm9uIEFuZHJvaWQgZGV2aWNlKSBjYW4ndCBiZSBraWxsZWQgYnkgT09NIGZsb3csIGFuZCB3ZSBh
bHNvIGNvdWxkbid0DQpmaW5kIHRoZSByZWxhdGVkIGRtYWJ1ZiBpbiAiZG1hX2J1Zl9kZWJ1Z19z
aG93IiBiZWNhdXNlIHRoZSByZWxhdGVkDQpkbWFidWYgd2FzIG5vdCBleHBvcnRlZCB5ZXQgc2lu
Y2UgdGhlIGFsbG9jYXRpb24gaXMgc3RpbGwgb24gZ29pbmcuDQoNClNpbmNlIHRoaXMgaW52YWxp
ZCBhcmd1bWVudCBjYXNlIGNhbiBiZSBwcmV2ZW50ZWQgYXQgZG1hLWhlYXAgc2lkZSwgc28sDQpJ
IGFkZGVkIHRoaXMgc2l6ZSBjaGVjaywgYW5kIG1vcmVvdmVyLCB0byBsZXQgZGVidWcgaXQgZWFz
aWx5LCBJIGFsc28NCmFkZGVkIGxvZ3Mgd2hlbiBzaXplIGlzIGJpZ2dlciB0aGFuIGEgdGhyZXNo
b2xkIHdlIHNldCBpbiBtdGsgc3lzdGVtDQpoZWFwLg0KSWYgeW91IHRoaW5rIHRoYXQgcHJpbnQg
bG9ncyBpbiBkbWEtaGVhcCBmcmFtZXdvcmsgaXMgYmV0dGVyLCBJIHdpbGwNCnVwZGF0ZSBpdCBp
biBuZXh0IHZlcnNpb24uDQoNCklmIHlvdSBoYXZlIGJldHRlciBzb2x1dGlvbihzdWNoIGFzIGR1
bXAgdGhlIHNpemUgdW5kZXIgYWxsb2NhdGluZw0KaW4gImRtYV9idWZfZGVidWdfc2hvdyIsIHdo
aWNoIG1heWJlIG5lZWQgYWRkIGdsb2JhbCB2YXJpYWJsZSB0byByZWNvcmQNCml0KSwgcGxlYXNl
IGtpbmRseSBsZXQgbWUga25vdywgdGhhbmtzIDopDQoNCj4gDQo+IFRoYW5rcywNCj4gQ2hyaXN0
aWFuLg0KPiANCj4gPiANCj4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1YW5nbWluZyA8R3Vh
bmdtaW5nLkNhb0BtZWRpYXRlay5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBqaWFuamlhbyB6
ZW5nIDxqaWFuamlhby56ZW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjI6IDEu
IHVwZGF0ZSBzaXplIGxpbWl0YXRpb24gYXMgdG90YWxfZHJhbSBwYWdlIHNpemUuDQo+ID4gPiAg
ICAgIDIuIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtaGVhcC5jIHwgMiArKw0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWhlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtDQo+ID4gPiBoZWFwLmMNCj4gPiA+IGluZGV4
IDU2YmY1YWQwMWFkNS4uZTM5ZDJiZTk4ZDY5IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9k
bWEtYnVmL2RtYS1oZWFwLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5j
DQo+ID4gPiBAQCAtNTUsNiArNTUsOCBAQCBzdGF0aWMgaW50IGRtYV9oZWFwX2J1ZmZlcl9hbGxv
YyhzdHJ1Y3QNCj4gPiA+IGRtYV9oZWFwICpoZWFwLCBzaXplX3QgbGVuLA0KPiA+ID4gICAgICAg
ICAgc3RydWN0IGRtYV9idWYgKmRtYWJ1ZjsNCj4gPiA+ICAgICAgICAgIGludCBmZDsNCj4gPiA+
IA0KPiA+ID4gKyAgICAgICBpZiAobGVuIC8gUEFHRV9TSVpFID4gdG90YWxyYW1fcGFnZXMoKSkN
Cj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiANCj4gPiBUaGlzIHNl
ZW1zIHNhbmUuIEkga25vdyBJT04gdXNlZCB0byBoYXZlIHNvbWUgMS8yIG9mIG1lbW9yeSBjYXAg
dG8NCj4gPiBhdm9pZCB1bm5lY2Vzc2FyeSBtZW1vcnkgcHJlc3N1cmUgb24gY3JhenkgYWxsb2Nh
dGlvbnMuDQo+ID4gDQo+ID4gQ291bGQgeW91IHNlbmQgYWdhaW4gd2l0aCBhbiBpbXByb3ZlZCBj
b21taXQgbWVzc2FnZT8NCj4gPiANCj4gPiB0aGFua3MNCj4gPiAtam9obg0KPiANCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
