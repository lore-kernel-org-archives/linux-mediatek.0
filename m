Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D078AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 07:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92FE861266
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 07:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92FE861266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tR4iTCuQ4uJcFf9XVfLHUBUkb/ei9EGKd2Y/uxN2EHY=; b=z5tFimw+wVQRhp
	+pRuLDJ+clKCo4kvbLPq0MdBVUFjsOAmlNIbNZ+Luz6IaxexF1CAtIJ+g9CnVtAu7mPH6usS8/8EI
	wr1riECxcK6L4sHCec+8efAZdgtTdcrLaVx7fgmONxKMljkncSJkgmbxtM1Fz/EP7j52hUOLxc9c0
	aqRppRcEdneTJ8yZVEDBhWnQ4aeH+E3/xlnwEKdjhLSKToJICDcgWwTgps0xvBxFjdMq52/uodN7X
	kJHd2FhFnH1u9sUUYCeqBA2b9ZXn4yc8bWppa9LkQ9/nNAGiY5blYOdspHmxgvcR6B9PHVPeGiIuY
	jW+CWDYk8zfrl20hSmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFbd-003qZl-F3; Wed, 17 Nov 2021 07:43:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFbP-003qWP-OC; Wed, 17 Nov 2021 07:43:33 +0000
X-UUID: 9eb8826687d144d2884ef28a13aea32a-20211117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=X3bIeS3Z/0BzYf5jDamSICI7AYymSKxCG9LklXxvROs=; 
 b=YB8p1urC1QjrruAJbccsDVhmAB2eTZsFS2t4swNF86HtT466EFnAyHy95Jyg58uEwbfilNYz6WPGlEm6ZqqPd5rkvrqe+dDAezgOEyJFxiBllXg5HOVyy7C9hpMsXPJ9jDJt1sC/Pp5iGvUtCkMakEduUiULFmL9Wd4n7KA6wZ0=;
X-UUID: 9eb8826687d144d2884ef28a13aea32a-20211117
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 729833572; Wed, 17 Nov 2021 00:43:26 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 23:43:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 Nov 2021 15:43:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Nov 2021 15:43:22 +0800
Message-ID: <c0d4ebd1c550384fbd21609ab93f1e573c7044d9.camel@mediatek.com>
Subject: Re: [PATCH v2, 1/1] mailbox: cmdq: add instruction time-out
 interrupt support
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Date: Wed, 17 Nov 2021 15:43:21 +0800
In-Reply-To: <CAAOTY_9xhga5yP7OVB6npPesTHc8UR3WydwOvY=Fvo-CCawxLg@mail.gmail.com>
References: <20210930131850.21202-1-yongqiang.niu@mediatek.com>
 <20210930131850.21202-2-yongqiang.niu@mediatek.com>
 <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
 <ffe2d4aaf4f884c4de2d2a157d08087cef3e6a0f.camel@mediatek.com>
 <CAAOTY_9xhga5yP7OVB6npPesTHc8UR3WydwOvY=Fvo-CCawxLg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_234331_816504_D6E97DCF 
X-CRM114-Status: GOOD (  37.03  )
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

T24gRnJpLCAyMDIxLTEwLTA4IGF0IDIyOjU1ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4geW9uZ3FpYW5nLm5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIx5bm0MTDmnIg45pelIOmAseS6lCDkuIrljYg5OjQ55a+r6YGT77ya
DQo+ID4gDQo+ID4gT24gVHVlLCAyMDIxLTEwLTA1IGF0IDA3OjQxICswODAwLCBDaHVuLUt1YW5n
IEh1IHdyb3RlOg0KPiA+ID4gSGksIFlvbmdxaWFuZzoNCj4gPiA+IA0KPiA+ID4gWW9uZ3FpYW5n
IE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0OeaciDMw5pelIOmA
seWbmw0KPiA+ID4g5LiL5Y2IOToxOOWvq+mBk++8mg0KPiA+ID4gPiANCj4gPiA+ID4gYWRkIHRp
bWUtb3V0IGN5Y2xlIHNldHRpbmcgdG8gbWFrZSBzdXJlIHRpbWUtb3V0IGludGVycnVwdCBpcnEN
Cj4gPiA+ID4gd2lsbCBoYXBwZW5lZCB3aGVuIGluc3RydWN0aW9uIHRpbWUtb3V0IGZvciB3YWl0
IGFuZCBwb2xsDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1
IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIHwgMTEgKysrKysrKysrKysNCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+ID4gPiBiL2Ry
aXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiA+ID4gaW5kZXggNjQxNzVhODkz
MzEyLi4xOTdiMDMyMjJmOTQgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9t
dGstY21kcS1tYWlsYm94LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRx
LW1haWxib3guYw0KPiA+ID4gPiBAQCAtMzYsNiArMzYsNyBAQA0KPiA+ID4gPiAgI2RlZmluZSBD
TURRX1RIUl9FTkRfQUREUiAgICAgICAgICAgICAgMHgyNA0KPiA+ID4gPiAgI2RlZmluZSBDTURR
X1RIUl9XQUlUX1RPS0VOICAgICAgICAgICAgMHgzMA0KPiA+ID4gPiAgI2RlZmluZSBDTURRX1RI
Ul9QUklPUklUWSAgICAgICAgICAgICAgMHg0MA0KPiA+ID4gPiArI2RlZmluZSBDTURRX1RIUl9J
TlNUTl9USU1FT1VUX0NZQ0xFUyAgMHg1MA0KPiA+ID4gPiANCj4gPiA+ID4gICNkZWZpbmUgR0NF
X0dDVExfVkFMVUUgICAgICAgICAgICAgICAgIDB4NDgNCj4gPiA+ID4gDQo+ID4gPiA+IEBAIC01
NCw2ICs1NSwxNSBAQA0KPiA+ID4gPiAgI2RlZmluZSBDTURRX0pVTVBfQllfT0ZGU0VUICAgICAg
ICAgICAgMHgxMDAwMDAwMA0KPiA+ID4gPiAgI2RlZmluZSBDTURRX0pVTVBfQllfUEEgICAgICAg
ICAgICAgICAgICAgICAgICAweDEwMDAwMDAxDQo+ID4gPiA+IA0KPiA+ID4gPiArLyoNCj4gPiA+
ID4gKyAqIGluc3RydWN0aW9uIHRpbWUtb3V0DQo+ID4gPiA+ICsgKiBjeWNsZXMgdG8gaXNzdWUg
aW5zdHJ1Y3Rpb24gdGltZS1vdXQgaW50ZXJydXB0IGZvciB3YWl0IGFuZA0KPiA+ID4gPiBwb2xs
IGluc3RydWN0aW9ucw0KPiA+ID4gPiArICogR0NFIGF4aV9jbG9jayAxNTZNSHoNCj4gPiA+ID4g
KyAqIDEgY3ljbGUgPSA2LjQxbnMNCj4gPiA+ID4gKyAqIGluc3RydWN0aW9uIHRpbWUgb3V0IDJe
MjIqMio2LjQxbnMgPSA1M21zDQo+ID4gPiANCj4gPiA+IEZvciBkaWZmZXJlbnQgY2xpZW50cywg
dGhlIHRpbWVvdXQgdmFsdWUgd291bGQgYmUgZGlmZmVyZW50LCBhbmQNCj4gPiA+IGVhY2gNCj4g
PiA+IGNsaWVudCBjb3VsZCB1c2UgdGltZXIgdG8gZGV0ZWN0IHRpbWVvdXQsIHNvIGl0J3Mgbm90
IG5lY2Vzc2FyeQ0KPiA+ID4gdG8NCj4gPiA+IGVuYWJsZSB0aW1lb3V0IGluIGNtZHEgZHJpdmVy
Lg0KPiA+ID4gDQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4gQ2h1bi1LdWFuZy4NCj4gPiANCj4gPiBp
ZiB3ZSBkbyBub3Qgc2V0IGNtZHEgaGFyZHdhcmUgdGltZW91dCwgdGhpcyBjb25kaXRpb24gd2ls
bCBuZXZlcg0KPiA+IGhhcHBlbg0KPiA+IGNtZHFfdGhyZWFkX2lycV9oYW5kbGVyDQo+ID4gaWYg
KGlycV9mbGFnICYgQ01EUV9USFJfSVJRX0VSUk9SKQ0KPiA+ICAgICAgICAgICAgICAgICBlcnIg
PSB0cnVlOw0KPiA+IA0KPiA+IGFuZCBubyBlcnJvciBjYWxsYmFjaw0KPiA+IGVsc2UgaWYgKGVy
cikgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfdGFza19leGVjX2RvbmUodGFz
aywgLUVOT0VYRUMpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfdGFza19oYW5k
bGVfZXJyb3IoY3Vycl90YXNrKTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBrZnJlZSh0
YXNrKTsNCj4gPiAgICAgICAgICAgICAgICAgfQ0KPiA+IHRoZSBjbGllbnQgd2lsbCBuZXZlciBy
ZWNlaXZlZCB0aGUgZXJyb3IgY2FsbGJhY2ssIGNtZHEgaGFyZHdhcmUNCj4gPiB3aWxsDQo+ID4g
cG9sbCB0aGUgZXZlbnQgZm9yIGV2ZXIgYW5kIG5vIHJlcG9ydCB0aW1lb3V0DQo+IA0KPiBJIHRo
aW5rIHRoZXJlIGFyZSB0d28gd2F5IHRvIGltcGxlbWVudCB0aGUgdGltZW91dCBtZWNoYW5pc20u
IFRoZQ0KPiBmaXJzdCB3YXkgaXMgdG8gdXNlIHRoZSBHQ0UgaGFyZHdhcmUgdG8gZGV0ZWN0IHRp
bWVvdXQuIFRoZSBzZWNvbmQNCj4gd2F5DQo+IGlzIHRoYXQgY2xpZW50IGRyaXZlciB1c2UgdGlt
ZXIgdG8gZGV0ZWN0IHRpbWVvdXQsIHdoZW4gaXQncyB0aW1lb3V0LA0KPiB1c2UgbWJveF9mbHVz
aCgpIHRvIGNsZWFuIHVwIHRoZSBwYWNrZXRzIGluIG10ayBjbWRxIGRyaXZlciwgYW5kDQo+IHJl
bW92ZSB0aGUgZXJyb3IgaGFuZGxlIGluIGlycSBoYW5kbGVyLg0KPiBJZiB5b3UgdGhpbmsgdGhl
IGZpcnN0IHdheSBpcyBiZXR0ZXIsIEkgdGhpbmsgeW91IHNob3VsZCBwYXNzIHRoZQ0KPiB0aW1l
b3V0IHZhbHVlIGZyb20gY2xpZW50IGRyaXZlciB0byBjbWRxIGRyaXZlciBiZWNhdXNlIGVhY2gg
Y2xpZW50DQo+IGRyaXZlciBoYXMgZGlmZmVyZW50IHRpbWVvdXQgdmFsdWUuIEFuZCB0aGUgR0NF
IGNsb2NrIG1heSBiZQ0KPiBkaWZmZXJlbnQNCj4gaW4gZWFjaCBTb0MsIHNvIHVzZSBjbGtfZ2V0
X3JhdGUoKSB0byBnZXQgdGhlIGNsb2NrIGZyZXF1ZW5jeSBmb3INCj4gZGlmZmVyZW50IFNvQy4N
Cj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQoNCnRoaXMgcGF0Y2ggb25seSB1c2VkIGZv
ciBtZHAgaW5zdHJ1Y3Rpb24gZXJyb3IgYW5kIGFuZCB0cmlnZ2VyIGh3DQp0aW1lb3V0IGZsb3cs
IGl0IGlzIGZvciBkZWJ1ZywgaSB3aWxsIGFiYW5kb24gdGhpcyBwYXRjaCBhbmQgd2lsbCBub3QN
CnNlbmQgdXBzdHJlYW0gYW55bW9yZS4NCg0KPiANCj4gPiA+IA0KPiA+ID4gPiArICovDQo+ID4g
PiA+ICsjZGVmaW5lIENNRFFfSU5TVE5fVElNRU9VVF9DWUNMRVMgICAgICAyMg0KPiA+ID4gPiAr
DQo+ID4gPiA+ICBzdHJ1Y3QgY21kcV90aHJlYWQgew0KPiA+ID4gPiAgICAgICAgIHN0cnVjdCBt
Ym94X2NoYW4gICAgICAgICpjaGFuOw0KPiA+ID4gPiAgICAgICAgIHZvaWQgX19pb21lbSAgICAg
ICAgICAgICpiYXNlOw0KPiA+ID4gPiBAQCAtMzc2LDYgKzM4Niw3IEBAIHN0YXRpYyBpbnQgY21k
cV9tYm94X3NlbmRfZGF0YShzdHJ1Y3QNCj4gPiA+ID4gbWJveF9jaGFuDQo+ID4gPiA+ICpjaGFu
LCB2b2lkICpkYXRhKQ0KPiA+ID4gPiAgICAgICAgICAgICAgICAgd3JpdGVsKCh0YXNrLT5wYV9i
YXNlICsgcGt0LT5jbWRfYnVmX3NpemUpID4+DQo+ID4gPiA+IGNtZHEtDQo+ID4gPiA+ID4gc2hp
ZnRfcGEsDQo+ID4gPiA+IA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIHRocmVhZC0+
YmFzZSArIENNRFFfVEhSX0VORF9BRERSKTsNCj4gPiA+ID4gDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICB3cml0ZWwoQ01EUV9JTlNUTl9USU1FT1VUX0NZQ0xFUywgdGhyZWFkLT5iYXNlDQo+ID4g
PiA+ICsNCj4gPiA+ID4gQ01EUV9USFJfSU5TVE5fVElNRU9VVF9DWUNMRVMpOw0KPiA+ID4gPiAg
ICAgICAgICAgICAgICAgd3JpdGVsKHRocmVhZC0+cHJpb3JpdHksIHRocmVhZC0+YmFzZSArDQo+
ID4gPiA+IENNRFFfVEhSX1BSSU9SSVRZKTsNCj4gPiA+ID4gICAgICAgICAgICAgICAgIHdyaXRl
bChDTURRX1RIUl9JUlFfRU4sIHRocmVhZC0+YmFzZSArDQo+ID4gPiA+IENNRFFfVEhSX0lSUV9F
TkFCTEUpOw0KPiA+ID4gPiAgICAgICAgICAgICAgICAgd3JpdGVsKENNRFFfVEhSX0VOQUJMRUQs
IHRocmVhZC0+YmFzZSArDQo+ID4gPiA+IENNRFFfVEhSX0VOQUJMRV9UQVNLKTsNCj4gPiA+ID4g
LS0NCj4gPiA+ID4gMi4yNS4xDQo+ID4gPiA+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
