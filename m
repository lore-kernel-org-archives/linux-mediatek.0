Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD2C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 23:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QE4eytkZSBFk8y0/R7L/Gkjc2fD5ByR1b/iKNGtjGLk=; b=swTZ7yTMuafR51aHeJxzQtWqsx
	Y8MDhQO57qi1KMrb9zIgJ6jkGndT/juQT62Aw6WYW5jM1MlZfG/SNpRKBUVdjolmJiEEV7MuIaL/y
	2tc9e3exzpksH1VlY+s+4eslIEM4dvrMCPMRWJOpX1fuk/+2uFpRquR/hVMMq9J2lv+bPaeJWS4vM
	sT3hdUGWwTXKZru1lc8mv7r/2g5YlxtIDoD5HDznj22ASojyEExrszCUKPDs+4YBsZY0VZNNQO4Qv
	6X9SVBlqjZOFyQwUu6tEA3osuQilOmzYQO2rOd4gopMQDtfuPf6YHY108r7T0QMsfdHypfFuG1vZN
	Rnr+B1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrPQ-008J4w-5Z; Mon, 13 Mar 2023 23:16:52 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrPE-008J0I-Pm
	for linux-mediatek@lists.infradead.org; Mon, 13 Mar 2023 23:16:43 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-180-8ouOqbSxPl2e6lYMDXaiTw-1; Mon, 13 Mar 2023 23:16:33 +0000
X-MC-Unique: 8ouOqbSxPl2e6lYMDXaiTw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.47; Mon, 13 Mar
 2023 23:16:31 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.047; Mon, 13 Mar 2023 23:16:31 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Laurent Pinchart' <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>
CC: "tfiga@chromium.org" <tfiga@chromium.org>, "m.szyprowski@samsung.com"
	<m.szyprowski@samsung.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"ming.qian@nxp.com" <ming.qian@nxp.com>, "shijie.qin@nxp.com"
	<shijie.qin@nxp.com>, "eagle.zhou@nxp.com" <eagle.zhou@nxp.com>,
	"bin.liu@mediatek.com" <bin.liu@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "tiffany.lin@mediatek.com"
	<tiffany.lin@mediatek.com>, "andrew-ct.chen@mediatek.com"
	<andrew-ct.chen@mediatek.com>, "yunfei.dong@mediatek.com"
	<yunfei.dong@mediatek.com>, "stanimir.k.varbanov@gmail.com"
	<stanimir.k.varbanov@gmail.com>, "quic_vgarodia@quicinc.com"
	<quic_vgarodia@quicinc.com>, "agross@kernel.org" <agross@kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>, "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>, "ezequiel@vanguardiasur.com.ar"
	<ezequiel@vanguardiasur.com.ar>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "daniel.almeida@collabora.com"
	<daniel.almeida@collabora.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jerbel@kernel.org" <jerbel@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: RE: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Thread-Topic: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Thread-Index: AQHZVddlMXgQQm2s8UOyg8hXE6z+xq75Vx6A
Date: Mon, 13 Mar 2023 23:16:31 +0000
Message-ID: <86df05244d974416903e919d387a0a0b@AcuMS.aculab.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
 <20230313135916.862852-3-benjamin.gaignard@collabora.com>
 <20230313181155.GC22646@pendragon.ideasonboard.com>
In-Reply-To: <20230313181155.GC22646@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_161641_152673_158C3209 
X-CRM114-Status: GOOD (  11.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTGF1cmVudCBQaW5jaGFydA0KPiBTZW50OiAxMyBNYXJjaCAyMDIzIDE4OjEyDQo+IA0K
PiBIaSBCZW5qYW1pbiwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24g
TW9uLCBNYXIgMTMsIDIwMjMgYXQgMDI6NTk6MTRQTSArMDEwMCwgQmVuamFtaW4gR2FpZ25hcmQg
d3JvdGU6DQo+ID4gUmVwbGFjaW5nIGJ1ZnMgYXJyYXkgYnkgYSBsaXN0IGFsbG93cyB0byByZW1v
dmUgdGhlIDMyIGJ1ZmZlcnMNCj4gPiBsaW1pdCBwZXIgcXVldWUuDQoNCklzIHRoZSBsaW1pdCBh
Y3R1YWxseSBhIHByb2JsZW0/DQpBcnJheXMgb2YgcG9pbnRlcnMgaGF2ZSBsb2NraW5nIGFuZCBj
YWNoaW5nIGFkdmFudGFnZXMgb3Zlcg0KbGlua2VkIGxpc3RzLg0KDQouLi4NCj4gPiBAQCAtMTIz
OSw4ICsxMjQyLDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB2YjJfY2xlYXJfbGFzdF9idWZmZXJf
ZGVxdWV1ZWQoc3RydWN0IHZiMl9xdWV1ZSAqcSkNCj4gPiAgc3RhdGljIGlubGluZSBzdHJ1Y3Qg
dmIyX2J1ZmZlciAqdmIyX2dldF9idWZmZXIoc3RydWN0IHZiMl9xdWV1ZSAqcSwNCj4gPiAgCQkJ
CQkJdW5zaWduZWQgaW50IGluZGV4KQ0KPiA+ICB7DQo+ID4gLQlpZiAoaW5kZXggPCBxLT5udW1f
YnVmZmVycykNCj4gPiAtCQlyZXR1cm4gcS0+YnVmc1tpbmRleF07DQo+ID4gKwlzdHJ1Y3QgdmIy
X2J1ZmZlciAqdmI7DQo+ID4gKw0KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeSh2YiwgJnEtPmFs
bG9jYXRlZF9idWZzLCBhbGxvY2F0ZWRfZW50cnkpDQo+ID4gKwkJaWYgKHZiLT5pbmRleCA9PSBp
bmRleCkNCj4gPiArCQkJcmV0dXJuIHZiOw0KPiA+ICsNCj4gPiAgCXJldHVybiBOVUxMOw0KDQpZ
b3UgcmVhbGx5IGRvbid0IHdhbnQgdG8gYmUgZG9pbmcgdGhhdC4uLi4NCg0KVGhlcmUgYXJlIHNj
aGVtZXMgZm9yIHVuYm91bmRlZCBhcnJheXMuDQpTY2FubmluZyBhIGxpbmtlZCBsaXN0IGlzbid0
IGEgdmVyeSBnb29kIG9uZS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtl
c2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBV
Sw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==


