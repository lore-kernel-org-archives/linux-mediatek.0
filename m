Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80576C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 01:50:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E636121F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 01:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24E636121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcjgZaiZnkJQiPcQO3/AwGMxDcd1kO2JveUsT8cmMW4=; b=viRTczojZKaVYl
	v+zUkPqQvs52E6SFaAhMrn1spYMVPHYp4+JS9nBH6I+704s6l+pTDQ9mWD7wZ03tK/oPuMRyTXKQP
	+gJZtVH0zQTcF6wppBGmT66AgxIXmhdUlOIRAii1RsCGva0jCNwfHDOOwf7exY0j98ER5njjC48GV
	bikiVVa4OZaFHCfuvCTImQAHgi78ImGnOjfZ/s52pgSyUBQTOMIIGamnVj2wyFrIyq7erwbKRpxhk
	z70HSWMO1p/SGXeDTL6ivhG9zgGQ3kQ0VS2jP9nhwgWihOPs9smwBWAqjl3Ay8ukPG8pCsA91DLFW
	BGgnh8gbieuOBVOYqyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYf1G-001DH0-Iv; Fri, 08 Oct 2021 01:49:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYf11-001DFH-UM; Fri, 08 Oct 2021 01:49:43 +0000
X-UUID: 0ea306c7fe6544fd8dd1d2bb01973899-20211007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RXg5SyzGWaODYUYPctmtd3WXwSdZOkNg8UWT/TCg6JQ=; 
 b=S2hm3VaZ5iQxaI++FjAJ886APA9nu1IRGmWO+Ap5uyk+yznTe+Z37RVA5T3xGpdzRizMrmKyCdzBDfSZHy/zSDigh7OsQhWFqOUwdCO+mWynSAYcRfwnPwPOPTQL/C4P88E2E4+6c30ffCIa4eLQZF9yfwmDRkwmy8srm4KG9N0=;
X-UUID: 0ea306c7fe6544fd8dd1d2bb01973899-20211007
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1848149025; Thu, 07 Oct 2021 18:49:36 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 18:49:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Oct 2021 09:49:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 09:49:32 +0800
Message-ID: <ffe2d4aaf4f884c4de2d2a157d08087cef3e6a0f.camel@mediatek.com>
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
Date: Fri, 8 Oct 2021 09:49:35 +0800
In-Reply-To: <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
References: <20210930131850.21202-1-yongqiang.niu@mediatek.com>
 <20210930131850.21202-2-yongqiang.niu@mediatek.com>
 <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_184941_423092_571644D6 
X-CRM114-Status: GOOD (  21.86  )
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

T24gVHVlLCAyMDIxLTEwLTA1IGF0IDA3OjQxICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIx5bm0OeaciDMw5pelIOmAseWbmyDkuIvljYg5OjE45a+r6YGT77ya
DQo+ID4gDQo+ID4gYWRkIHRpbWUtb3V0IGN5Y2xlIHNldHRpbmcgdG8gbWFrZSBzdXJlIHRpbWUt
b3V0IGludGVycnVwdCBpcnENCj4gPiB3aWxsIGhhcHBlbmVkIHdoZW4gaW5zdHJ1Y3Rpb24gdGlt
ZS1vdXQgZm9yIHdhaXQgYW5kIHBvbGwNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDExICsrKysrKysrKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiBiL2RyaXZlcnMvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmMNCj4gPiBpbmRleCA2NDE3NWE4OTMzMTIuLjE5N2IwMzIyMmY5NCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gKysr
IGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+IEBAIC0zNiw2ICszNiw3
IEBADQo+ID4gICNkZWZpbmUgQ01EUV9USFJfRU5EX0FERFIgICAgICAgICAgICAgIDB4MjQNCj4g
PiAgI2RlZmluZSBDTURRX1RIUl9XQUlUX1RPS0VOICAgICAgICAgICAgMHgzMA0KPiA+ICAjZGVm
aW5lIENNRFFfVEhSX1BSSU9SSVRZICAgICAgICAgICAgICAweDQwDQo+ID4gKyNkZWZpbmUgQ01E
UV9USFJfSU5TVE5fVElNRU9VVF9DWUNMRVMgIDB4NTANCj4gPiANCj4gPiAgI2RlZmluZSBHQ0Vf
R0NUTF9WQUxVRSAgICAgICAgICAgICAgICAgMHg0OA0KPiA+IA0KPiA+IEBAIC01NCw2ICs1NSwx
NSBAQA0KPiA+ICAjZGVmaW5lIENNRFFfSlVNUF9CWV9PRkZTRVQgICAgICAgICAgICAweDEwMDAw
MDAwDQo+ID4gICNkZWZpbmUgQ01EUV9KVU1QX0JZX1BBICAgICAgICAgICAgICAgICAgICAgICAg
MHgxMDAwMDAwMQ0KPiA+IA0KPiA+ICsvKg0KPiA+ICsgKiBpbnN0cnVjdGlvbiB0aW1lLW91dA0K
PiA+ICsgKiBjeWNsZXMgdG8gaXNzdWUgaW5zdHJ1Y3Rpb24gdGltZS1vdXQgaW50ZXJydXB0IGZv
ciB3YWl0IGFuZA0KPiA+IHBvbGwgaW5zdHJ1Y3Rpb25zDQo+ID4gKyAqIEdDRSBheGlfY2xvY2sg
MTU2TUh6DQo+ID4gKyAqIDEgY3ljbGUgPSA2LjQxbnMNCj4gPiArICogaW5zdHJ1Y3Rpb24gdGlt
ZSBvdXQgMl4yMioyKjYuNDFucyA9IDUzbXMNCj4gDQo+IEZvciBkaWZmZXJlbnQgY2xpZW50cywg
dGhlIHRpbWVvdXQgdmFsdWUgd291bGQgYmUgZGlmZmVyZW50LCBhbmQgZWFjaA0KPiBjbGllbnQg
Y291bGQgdXNlIHRpbWVyIHRvIGRldGVjdCB0aW1lb3V0LCBzbyBpdCdzIG5vdCBuZWNlc3Nhcnkg
dG8NCj4gZW5hYmxlIHRpbWVvdXQgaW4gY21kcSBkcml2ZXIuDQo+IA0KPiBSZWdhcmRzLA0KPiBD
aHVuLUt1YW5nLg0KDQppZiB3ZSBkbyBub3Qgc2V0IGNtZHEgaGFyZHdhcmUgdGltZW91dCwgdGhp
cyBjb25kaXRpb24gd2lsbCBuZXZlcg0KaGFwcGVuDQpjbWRxX3RocmVhZF9pcnFfaGFuZGxlcg0K
aWYgKGlycV9mbGFnICYgQ01EUV9USFJfSVJRX0VSUk9SKQ0KCQllcnIgPSB0cnVlOw0KDQphbmQg
bm8gZXJyb3IgY2FsbGJhY2sgDQplbHNlIGlmIChlcnIpIHsNCgkJCWNtZHFfdGFza19leGVjX2Rv
bmUodGFzaywgLUVOT0VYRUMpOw0KCQkJY21kcV90YXNrX2hhbmRsZV9lcnJvcihjdXJyX3Rhc2sp
Ow0KCQkJa2ZyZWUodGFzayk7DQoJCX0NCnRoZSBjbGllbnQgd2lsbCBuZXZlciByZWNlaXZlZCB0
aGUgZXJyb3IgY2FsbGJhY2ssIGNtZHEgaGFyZHdhcmUgd2lsbA0KcG9sbCB0aGUgZXZlbnQgZm9y
IGV2ZXIgYW5kIG5vIHJlcG9ydCB0aW1lb3V0IA0KPiANCj4gPiArICovDQo+ID4gKyNkZWZpbmUg
Q01EUV9JTlNUTl9USU1FT1VUX0NZQ0xFUyAgICAgIDIyDQo+ID4gKw0KPiA+ICBzdHJ1Y3QgY21k
cV90aHJlYWQgew0KPiA+ICAgICAgICAgc3RydWN0IG1ib3hfY2hhbiAgICAgICAgKmNoYW47DQo+
ID4gICAgICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAqYmFzZTsNCj4gPiBAQCAtMzc2LDYg
KzM4Niw3IEBAIHN0YXRpYyBpbnQgY21kcV9tYm94X3NlbmRfZGF0YShzdHJ1Y3QgbWJveF9jaGFu
DQo+ID4gKmNoYW4sIHZvaWQgKmRhdGEpDQo+ID4gICAgICAgICAgICAgICAgIHdyaXRlbCgodGFz
ay0+cGFfYmFzZSArIHBrdC0+Y21kX2J1Zl9zaXplKSA+PiBjbWRxLQ0KPiA+ID5zaGlmdF9wYSwN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgIHRocmVhZC0+YmFzZSArIENNRFFfVEhSX0VORF9B
RERSKTsNCj4gPiANCj4gPiArICAgICAgICAgICAgICAgd3JpdGVsKENNRFFfSU5TVE5fVElNRU9V
VF9DWUNMRVMsIHRocmVhZC0+YmFzZSArDQo+ID4gQ01EUV9USFJfSU5TVE5fVElNRU9VVF9DWUNM
RVMpOw0KPiA+ICAgICAgICAgICAgICAgICB3cml0ZWwodGhyZWFkLT5wcmlvcml0eSwgdGhyZWFk
LT5iYXNlICsNCj4gPiBDTURRX1RIUl9QUklPUklUWSk7DQo+ID4gICAgICAgICAgICAgICAgIHdy
aXRlbChDTURRX1RIUl9JUlFfRU4sIHRocmVhZC0+YmFzZSArDQo+ID4gQ01EUV9USFJfSVJRX0VO
QUJMRSk7DQo+ID4gICAgICAgICAgICAgICAgIHdyaXRlbChDTURRX1RIUl9FTkFCTEVELCB0aHJl
YWQtPmJhc2UgKw0KPiA+IENNRFFfVEhSX0VOQUJMRV9UQVNLKTsNCj4gPiAtLQ0KPiA+IDIuMjUu
MQ0KPiA+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
