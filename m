Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD14C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuyAXEoWyaSnBGeQ+yV0FD2UOXO3RckBBsbZU3M5vyw=; b=QcDKNNpvdsdwg3
	V6N00qGnx1LHxE9pFjYRFMTd2NepwObsDzWoGweebDqGtXK6pX4WWe536IA0jQS8pN2JXr4AaO4i9
	WsPBZ3cv41stwuRloPTIQxM36A0em4o1VXdLG7kjVty3laPV9r++RMEpEogeoc8uK7mjDwXnQGM11
	BC2JWR1su8WXgHF0hEiJrc6Eg2zb8F5IpvpXd3d1IShlkNsWrR6346jjfZT78Zu+ijH6iAj9BZrPv
	igq3mHOLsU8qZP+y9WZ+kl2LAElOKf7vsFcsjHXhHORbN27WnPNMwI6OGZ2ZUVOnE5BryALFRtxlR
	lNRR/C3gRoK1H+o/t4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8LKS-0092iF-Nv; Fri, 14 Jan 2022 12:05:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8LKF-0092eR-TG; Fri, 14 Jan 2022 12:05:01 +0000
X-UUID: abec9419f1e841618a689d410fabf75c-20220114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/2iIkgtIjwSDLI6UIzaBSALAnicxzF/I/Ip7vGZ1i50=; 
 b=LMzyBKOGxT/LNhE+NcgO86vbW0hzMAHmKWu2gnWhkSbFEZCOWxN8HXAlXlW7tk6XmO5OP/W0AffxlIRRw9Flljcvw9roipOt4uttwjoHLwJbbzF0AH2is6/MiYbd3Ts8gxoeEcxzzM2dR3mDNWPhRiAqxRXqyOYvbOl3QvLayGc=;
X-UUID: abec9419f1e841618a689d410fabf75c-20220114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 683043033; Fri, 14 Jan 2022 05:04:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 04:04:54 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 20:04:53 +0800
Received: from mszswglt01 (10.16.20.20) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 20:04:52 +0800
Message-ID: <82faa62f1bc946cf2f9ee2f7d15c567162238eab.camel@mediatek.com>
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
From: Guangming.Cao <guangming.cao@mediatek.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "John
 Stultz" <john.stultz@linaro.org>
CC: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "wsd_upstream@mediatek.com"
 <wsd_upstream@mediatek.com>, "libo.kang@mediatek.com"
 <libo.kang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "yf.wang@mediatek.com"
 <yf.wang@mediatek.com>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "lmark@codeaurora.org"
 <lmark@codeaurora.org>, "benjamin.gaignard@linaro.org"
 <benjamin.gaignard@linaro.org>, "bo.song@mediatek.com"
 <bo.song@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "labbott@redhat.com" <labbott@redhat.com>, "mingyuan.ma@mediatek.com"
 <mingyuan.ma@mediatek.com>, "jianjiao.zeng@mediatek.com"
 <jianjiao.zeng@mediatek.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Date: Fri, 14 Jan 2022 20:05:48 +0800
In-Reply-To: <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
 <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
 <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_040459_983072_DC91144C 
X-CRM114-Status: GOOD (  41.37  )
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

T24gRnJpLCAyMDIyLTAxLTE0IGF0IDA4OjE2ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAxNC4wMS4yMiB1bSAwMDoyNiBzY2hyaWViIEpvaG4gU3R1bHR6Og0KPiA+IE9uIFRo
dSwgSmFuIDEzLCAyMDIyIGF0IDU6MDUgQU0gQ2hyaXN0aWFuIEvDtm5pZw0KPiA+IDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPiA+ID4gQW0gMTMuMDEuMjIgdW0gMTQ6MDAgc2No
cmllYiBSdWhsLCBNaWNoYWVsIEo6DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+ID4gPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24NCj4gPiA+ID4gPiBCZWhhbGYgT2YNCj4gPiA+ID4gPiBSdWhsLCBN
aWNoYWVsIEoNCj4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+
ID4gPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4NCj4gPiA+ID4gPiA+IE9uIEJlaGFsZiBPZg0KPiA+ID4gPiA+ID4gZ3VhbmdtaW5nLmNh
b0BtZWRpYXRlay5jb20NCj4gPiA+ID4gPiA+ICsgICAvKg0KPiA+ID4gPiA+ID4gKyAgICAqIElu
dmFsaWQgc2l6ZSBjaGVjay4gVGhlICJsZW4iIHNob3VsZCBiZSBsZXNzIHRoYW4NCj4gPiA+ID4g
PiA+IHRvdGFscmFtLg0KPiA+ID4gPiA+ID4gKyAgICAqDQo+ID4gPiA+ID4gPiArICAgICogV2l0
aG91dCB0aGlzIGNoZWNrLCBvbmNlIHRoZSBpbnZhbGlkIHNpemUgYWxsb2NhdGlvbg0KPiA+ID4g
PiA+ID4gcnVucyBvbiBhIHByb2Nlc3MNCj4gPiA+ID4gPiA+IHRoYXQNCj4gPiA+ID4gPiA+ICsg
ICAgKiBjYW4ndCBiZSBraWxsZWQgYnkgT09NIGZsb3coc3VjaCBhcyAiZ3JhbGxvYyIgb24NCj4g
PiA+ID4gPiA+IEFuZHJvaWQgZGV2aWNlcyksIGl0DQo+ID4gPiA+ID4gPiB3aWxsDQo+ID4gPiA+
ID4gPiArICAgICogY2F1c2UgYSBrZXJuZWwgZXhjZXB0aW9uLCBhbmQgdG8gbWFrZSBtYXR0ZXJz
IHdvcnNlLA0KPiA+ID4gPiA+ID4gd2UgY2FuJ3QgZmluZA0KPiA+ID4gPiA+ID4gd2hvIGFyZSB1
c2luZw0KPiA+ID4gPiA+ID4gKyAgICAqIHNvIG1hbnkgbWVtb3J5IHdpdGggImRtYV9idWZfZGVi
dWdfc2hvdyIgc2luY2UgdGhlDQo+ID4gPiA+ID4gPiByZWxldmFudA0KPiA+ID4gPiA+ID4gZG1h
LWJ1ZiBoYXNuJ3QgZXhwb3J0ZWQuDQo+ID4gPiA+ID4gPiArICAgICovDQo+ID4gPiA+ID4gPiAr
ICAgaWYgKGxlbiA+PiBQQUdFX1NISUZUID4gdG90YWxyYW1fcGFnZXMoKSkNCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBJZiB5b3VyICJoZWFwIiBpcyBmcm9tIGNtYSwgaXMgdGhpcyBzdGlsbCBhIHZh
bGlkIGNoZWNrPw0KPiA+ID4gPiANCj4gPiA+ID4gQW5kIHRoaW5raW5nIGEgYml0IGZ1cnRoZXIs
IGlmIEkgY3JlYXRlIGEgaGVhcCBmcm9tIHNvbWV0aGluZw0KPiA+ID4gPiBlbHNlIChzYXkgZGV2
aWNlIG1lbW9yeSksDQo+ID4gPiA+IHlvdSB3aWxsIG5lZWQgdG8gYmUgYWJsZSB0byBmaWd1cmUg
b3V0IHRoZSBtYXhpbXVtIGFsbG93YWJsZQ0KPiA+ID4gPiBjaGVjayBmb3IgdGhlIHNwZWNpZmlj
DQo+ID4gPiA+IGhlYXAuDQo+ID4gPiA+IA0KPiA+ID4gPiBNYXliZSB0aGUgaGVhcCBuZWVkcyBh
IGNhbGxiYWNrIGZvciBtYXggc2l6ZT8NClllcywgSSBhZ3JlZSB3aXRoIHRoaXMgc29sdXRpb24u
DQpJZiBkbWEtaGVhcCBmcmFtZXdvcmsgc3VwcG9ydCB0aGlzIHZpYSBhZGRpbmcgYSBjYWxsYmFj
ayB0byBzdXBwb3J0IGl0LA0Kc2VlbXMgaXQncyBtb3JlIGNsZWFyIHRoYW4gYWRkaW5nIGEgbGlt
aXRhdGlvbiBpbiBkbWEtaGVhcCBmcmFtZXdvcmsNCnNpbmNlIGVhY2ggaGVhcCBtYXliZSBoYXMg
ZGlmZmVyZW50IGxpbWl0YXRpb24uDQpJZiB5b3UgcHJlZmVyIGFkZGluZyBjYWxsYmFjaywgSSBj
YW4gdXBkYXRlIHRoaXMgcGF0Y2ggYW5kIGFkZCB0b3RhbHJhbQ0KbGltaXRhdGlvbiB0byBzeXN0
ZW0gZG1hLWhlYXAuDQoNClRoYW5rcyENCkd1YW5nbWluZw0KPiA+ID4gDQo+ID4gPiBXZWxsIHdl
IGN1cnJlbnRseSBtYWludGFpbiBhIHNlcGFyYXRlIGFsbG9jYXRvciBhbmQgZG9uJ3QgdXNlDQo+
ID4gPiBkbWEtaGVhcCwNCj4gPiA+IGJ1dCB5ZXMgd2UgaGF2ZSBzeXN0ZW1zIHdpdGggMTZHaUIg
ZGV2aWNlIGFuZCBvbmx5IDhHaUIgc3lzdGVtDQo+ID4gPiBtZW1vcnkgc28NCj4gPiA+IHRoYXQg
Y2hlY2sgaGVyZSBpcyBjZXJ0YWlubHkgbm90IGNvcnJlY3QuDQo+ID4gDQo+ID4gR29vZCBwb2lu
dC4NCj4gPiANCj4gPiA+IEluIGdlbmVyYWwgSSB3b3VsZCByYXRoZXIgbGV0IHRoZSBzeXN0ZW0g
cnVuIGludG8gLUVOT01FTSBvcg0KPiA+ID4gLUVJTlZBTA0KPiA+ID4gZnJvbSB0aGUgYWxsb2Nh
dG9yIGluc3RlYWQuDQoNCkZvciBzeXN0ZW0gZG1hLWhlYXAsIGl0IGRvZXNuJ3Qga25vdyBob3cg
bWVtb3J5IGlzIGF2YWxpYWJsZSB3aGVuDQphbGxvY2F0aW5nIG1lbW9yeSwgc28sIHVzZSB0b3Rh
bHJhbV9wYWdlcygpIGp1c3QgdG8gcHJldmVudCBjYXNlcyB3aGljaA0Kd2lsbCBjYXVzZSBvb20g
ZGVmaW5pdGVseS4NCg0KSnVzdCBsaWtlIFBBR0UgYWxpZ24sIHRoaXMgY2hlY2sgaXMgY2FuIGJl
IHVzZWQgZm9yIGFsbCBoZWFwcyBzaW5jZQ0KdGhlcmUgaXMgbm8gZG1hLWhlYXAgY2FuIGFsbG9j
IG1lbW9yeSBsYXJnZXIgdGhhbiB0b3RhbHJhbS4gRnV0aGVybW9yZSwNCmlmIHZlbmRvcnMgaW1w
bGVtZW50IGEgdmFyaWV0eSBvZiBkbWEtaGVhcCBsaWtlIHN5c3RlbSBoZWFwIGZvciBzcGVjaWFs
DQp1c2FnZXMsIHNlZW1zIG5lZWQgdG8gYWRkIHRoaXMgY2hlY2sgdG8gZWFjaCBkbWEtaGVhcCwg
YW5kIEkgdGhpbmsgdGhpcw0KaXMgdW5uZWNlc3NhcnkuDQpJZiB0aGUgZG1hLWhlYXAgaGFzIGl0
J3Mgb3duIHNwZWNpYWwgbGltaXRhdGlvbnMgZm9yIHNpemUsIGFuZCBhZGQgaXQNCmludG8gaGVh
cCBpbXBsZW1lbnRhdGlvbiBpcyBnb29kLg0KDQpUaGFua3MhDQpHdWFuZ21pbmcNCj4gPiANCj4g
PiBQcm9iYWJseSB0aGUgc2ltcGxlciBzb2x1dGlvbiBpcyB0byBwdXNoIHRoZSBhbGxvY2F0aW9u
IGNoZWNrIHRvDQo+ID4gdGhlDQo+ID4gaGVhcCBkcml2ZXIsIHJhdGhlciB0aGFuIGRvaW5nIGl0
IGF0IHRoZSB0b3AgbGV2ZWwgaGVyZS4NCj4gPiANCj4gPiBGb3IgQ01BIG9yIG90aGVyIGNvbnRp
Z3VvdXMgaGVhcHMsIGxldHRpbmcgdGhlIGFsbG9jYXRvciBmYWlsIGlzDQo+ID4gZmFzdA0KPiA+
IGVub3VnaC4gRm9yIG5vbmNvbnRpZ3VvdXMgYnVmZmVycywgbGlrZSB0aGUgc3lzdGVtIGhlYXAs
IHRoZQ0KPiA+IGFsbG9jYXRpb24gY2FuIGJ1cm4gYSBsb3Qgb2YgdGltZSBhbmQgY29uc3VtZSBh
IGxvdCBvZiBtZW1vcnkNCj4gPiAoY2F1c2luZw0KPiA+IG90aGVyIHRyb3VibGUpIGJlZm9yZSBh
IGxhcmdlIGFsbG9jYXRpb24gbWlnaHQgbmF0dXJhbGx5IGZhaWwuDQo+IA0KPiBZZWFoLCBsZXR0
aW5nIGEgYWxsb2NfcGFnZSgpIGxvb3AgcnVuIGZvciBhIHdoaWxlIGlzIHVzdWFsbHkgbm90IG5p
Y2UNCj4gYXQgDQo+IGFsbCA6KQ0KPiANCj4gWW91IGNhbiBzdGlsbCBkbyBhIHNhbml0eSBjaGVj
ayBoZXJlLCBlLmcuIHRoZSBzaXplIHNob3VsZCBuZXZlcg0KPiBoYXZlIA0KPiB0aGUgbW9zdCBz
aWduaWZpY2FudCBiaXQgc2V0IGZvciBleGFtcGxlLg0KPiANClllcywgdGhpcyBpcyBhIGdvb2Qg
c29sdXRpb24uIEJ1dCBpZiB0aGlzIGEgcG9zaXRpdmUgdmFsdWUsIGxhcmdlciB0aGFuDQp0b3Rh
bHJhbSwgaXQgY2FuIGFsc28gcGFzcyB0aGlzIGNoZWNrLCBhbmQgY2F1c2UgT09NIGFmdGVyIHNv
bWUgdGltZS4NCg0KRnJvbSBkaWN1c3Npb24gYWJvdmUsIHNlZW1zIGZpbmRpbmcgYSBwcm9wZXIg
c29sdXRpb24gdGhhdCBjYW4ganVkZ2UNCnRoZSBzaXplIGlzIHZhbGlkIG9yIG5vdCBmb3IgZWFj
aCBkbWEtaGVhcCBpcyBtb3JlIGltcG9ydGFudC4NCg0KVGhhbmtzIQ0KR3VhbmdtaW5nDQoNCj4g
UmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPiANCj4gPiANCj4gPiB0aGFua3MNCj4gPiAtam9obg0K
PiANCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
