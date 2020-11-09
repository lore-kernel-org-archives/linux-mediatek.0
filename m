Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F317C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:55:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20EE206D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="srRiFmtL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b3LUwCcc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20EE206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2590dmPlksuW8fKXfUTt+37df9JNrxcWrBz4AqxtFRw=; b=srRiFmtLAgfaZFX0Ak4K84fGH
	BJq1wHMGk7pacr7AMrvmte0eoxWwhrdlshxF5EPiLfEcggBlunWxCczNSTznzN+TswIm738so9XBz
	hqrFms8DdwS07xRAPYS4XKTbFFR+Xv+BSmV1K4l/KlvREWhQD0Zkc8HhzKIp0j+B1DpdwqO8qHol6
	9PNn1QGrwaBow6PStv9htqJjJD2scrM8yExlRYjIorPs5/KiAGU4FhUL+jKSyVLM+SuVb971xY7pf
	X+/RUSo6D7UMxtF7oduDELCXo5n8mAqEY14ss7rrlANZuLGZeevy2G/6CqCbFKrEUN3itraQTMrUz
	2n67Ox5Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbxKo-0006o3-K3; Mon, 09 Nov 2020 02:55:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbxKc-0006ji-S4; Mon, 09 Nov 2020 02:55:00 +0000
X-UUID: 578e8ca62cac4729854d7b279c01086e-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DVy3OJusU0Te+Te3wB8eaGJ4YgyB4I5WYq+v3KWwg3I=; 
 b=b3LUwCccP8CL0qzSrO0CACnc/q0ySI0NqR9NUlv7VY/ri+8kilJWEbA9uHanM88lF/ATTmp0hz6DSWVmgOTvFzM93ey78sg3gvekIiKyUT2KNL3cF9qWpk7wz8LUcJOOQH6yx4IjdG4/N7S08xvafEwTX0iQcKwQ/VEr5BX2MQ8=;
X-UUID: 578e8ca62cac4729854d7b279c01086e-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 112455483; Sun, 08 Nov 2020 18:54:54 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:48:48 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 10:48:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:48:46 +0800
Message-ID: <1604890126.8050.5.camel@mhfsdcap03>
Subject: Re: [PATCH v7 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 9 Nov 2020 10:48:46 +0800
In-Reply-To: <20201102161931.GA3985668@bogus>
References: <20201029081513.10562-1-chuanjia.liu@mediatek.com>
 <20201029081513.10562-2-chuanjia.liu@mediatek.com>
 <20201102161931.GA3985668@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 160B908C483B3CEA25F25AC0ED72F9B72602719CC011202B11B06C5B5B71DFB02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_215459_197967_BD6221DD 
X-CRM114-Status: GOOD (  29.63  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTExLTAyIGF0IDEwOjE5IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMDQ6MTU6MTBQTSArMDgwMCwgQ2h1YW5qaWEgTGl1IHdy
b3RlOg0KPiA+IFNwbGl0IHRoZSBQQ0llIG5vZGUgYW5kIGFkZCBwY2llY2ZnIG5vZGUgdG8gZml4
IE1TSSBpc3N1ZS4NCj4gDQo+IEkgc3RpbGwgdGhpbmsgaWYgeW91IGFyZSBjaGFuZ2luZyB0aGUg
YmluZGluZyB0aGlzIG11Y2gsIHRoZW4gZnVydGhlciANCj4gd29yayBzaG91bGQgYmUgZG9uZSBy
ZW1vdmluZyB0aGUgc2xvdCBub2Rlcy4NCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1
YW5qaWEgTGl1IDxjaHVhbmppYS5saXVAbWVkaWF0ZWsuY29tPg0KPiA+IEFja2VkLWJ5OiBSeWRl
ciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5n
cy9wY2kvbWVkaWF0ZWstcGNpZS1jZmcueWFtbCAgICAgICB8ICAzOSArKysrKysNCj4gPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvcGNpL21lZGlhdGVrLXBjaWUudHh0IHwgMTI5ICsrKysrKysr
KysrLS0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExOCBpbnNlcnRpb25zKCspLCA1MCBk
ZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wY2kvbWVkaWF0ZWstcGNpZS1jZmcueWFtbA0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL21lZGlhdGVrLXBj
aWUtY2ZnLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL21lZGlh
dGVrLXBjaWUtY2ZnLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uZDNlY2JjZDAzMmEyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbWVkaWF0ZWstcGNpZS1jZmcueWFt
bA0KPiA+IEBAIC0wLDAgKzEsMzkgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQ0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGNpL21lZGlhdGVrLXBjaWUt
Y2ZnLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IE1lZGlhdGVrIFBDSUVDRkcgY29udHJv
bGxlcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBDaHVhbmppYSBMaXUgPGNo
dWFuamlhLmxpdUBtZWRpYXRlay5jb20+DQo+ID4gKyAgLSBKaWFuanVuIFdhbmcgPGppYW5qdW4u
d2FuZ0BtZWRpYXRlay5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRo
ZSBNZWRpYVRlayBQQ0lFQ0ZHIGNvbnRyb2xsZXIgY29udHJvbHMgc29tZSBmZWF0dXJlIGFib3V0
DQo+ID4gKyAgTFRTU00sIEFTUE0gYW5kIHNvIG9uLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoN
Cj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICBpdGVtczoNCj4gPiArICAgICAgICAtIGVu
dW06DQo+ID4gKyAgICAgICAgICAgIC0gbWVkaWF0ZWssZ2VuZXJpYy1wY2llY2ZnDQo+ID4gKyAg
ICAgICAgLSBjb25zdDogc3lzY29uDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0
ZW1zOiAxDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiAr
ICAtIHJlZw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0K
PiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIHBjaWVjZmc6IHBjaWVjZmdAMWEx
NDAwMDAgew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssZ2VuZXJpYy1wY2ll
Y2ZnIiwgInN5c2NvbiI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MWExNDAwMDAgMHgxMDAwPjsN
Cj4gPiArICAgIH07DQo+ID4gKy4uLg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGNpL21lZGlhdGVrLXBjaWUudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9tZWRpYXRlay1wY2llLnR4dA0KPiA+IGluZGV4IDc0Njhk
NjY2NzYzYS4uYzE0YTI3NDVkZTM3IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9wY2kvbWVkaWF0ZWstcGNpZS50eHQNCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL21lZGlhdGVrLXBjaWUudHh0DQo+ID4gQEAg
LTgsNyArOCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gIAkibWVkaWF0ZWssbXQ3NjIz
LXBjaWUiDQo+ID4gIAkibWVkaWF0ZWssbXQ3NjI5LXBjaWUiDQo+ID4gIC0gZGV2aWNlX3R5cGU6
IE11c3QgYmUgInBjaSINCj4gPiAtLSByZWc6IEJhc2UgYWRkcmVzc2VzIGFuZCBsZW5ndGhzIG9m
IHRoZSBQQ0llIHN1YnN5cyBhbmQgcm9vdCBwb3J0cy4NCj4gPiArLSByZWc6IEJhc2UgYWRkcmVz
c2VzIGFuZCBsZW5ndGhzIG9mIHRoZSByb290IHBvcnRzLg0KPiA+ICAtIHJlZy1uYW1lczogTmFt
ZXMgb2YgdGhlIGFib3ZlIGFyZWFzIHRvIHVzZSBkdXJpbmcgcmVzb3VyY2UgbG9va3VwLg0KPiA+
ICAtICNhZGRyZXNzLWNlbGxzOiBBZGRyZXNzIHJlcHJlc2VudGF0aW9uIGZvciByb290IHBvcnRz
IChtdXN0IGJlIDMpDQo+ID4gIC0gI3NpemUtY2VsbHM6IFNpemUgcmVwcmVzZW50YXRpb24gZm9y
IHJvb3QgcG9ydHMgKG11c3QgYmUgMikNCj4gPiBAQCAtMTQzLDU2ICsxNDMsNzEgQEAgRXhhbXBs
ZXMgZm9yIE1UNzYyMzoNCj4gPiAgDQo+ID4gIEV4YW1wbGVzIGZvciBNVDI3MTI6DQo+ID4gIA0K
PiA+IC0JcGNpZTogcGNpZUAxMTcwMDAwMCB7DQo+ID4gKwlwY2llMTogcGNpZUAxMTJmZjAwMCB7
DQo+ID4gIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItcGNpZSI7DQo+ID4gIAkJZGV2
aWNlX3R5cGUgPSAicGNpIjsNCj4gPiAtCQlyZWcgPSA8MCAweDExNzAwMDAwIDAgMHgxMDAwPiwN
Cj4gPiAtCQkgICAgICA8MCAweDExMmZmMDAwIDAgMHgxMDAwPjsNCj4gPiAtCQlyZWctbmFtZXMg
PSAicG9ydDAiLCAicG9ydDEiOw0KPiA+ICsJCXJlZyA9IDwwIDB4MTEyZmYwMDAgMCAweDEwMDA+
Ow0KPiA+ICsJCXJlZy1uYW1lcyA9ICJwb3J0MSI7DQo+ID4gIAkJI2FkZHJlc3MtY2VsbHMgPSA8
Mz47DQo+ID4gIAkJI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gLQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDExNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiAtCQkJICAgICA8R0lDX1NQSSAxMTcg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gLQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9Q
X1BFMl9NQUNfUDBfU0VMPiwNCj4gPiAtCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9QRTJfTUFDX1Ax
X1NFTD4sDQo+ID4gLQkJCSA8JnBlcmljZmcgQ0xLX1BFUklfUENJRTA+LA0KPiA+ICsJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSAxMTcgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKwkJaW50ZXJy
dXB0LW5hbWVzID0gInBjaWVfaXJxIjsNCj4gPiArCQljbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19U
T1BfUEUyX01BQ19QMV9TRUw+LA0KPiA+ICAJCQkgPCZwZXJpY2ZnIENMS19QRVJJX1BDSUUxPjsN
Cj4gPiAtCQljbG9jay1uYW1lcyA9ICJzeXNfY2swIiwgInN5c19jazEiLCAiYWhiX2NrMCIsICJh
aGJfY2sxIjsNCj4gPiAtCQlwaHlzID0gPCZwY2llMF9waHkgUEhZX1RZUEVfUENJRT4sIDwmcGNp
ZTFfcGh5IFBIWV9UWVBFX1BDSUU+Ow0KPiA+IC0JCXBoeS1uYW1lcyA9ICJwY2llLXBoeTAiLCAi
cGNpZS1waHkxIjsNCj4gPiArCQljbG9jay1uYW1lcyA9ICJzeXNfY2sxIiwgImFoYl9jazEiOw0K
PiA+ICsJCXBoeXMgPSA8JnUzcG9ydDEgUEhZX1RZUEVfUENJRT47DQo+ID4gKwkJcGh5LW5hbWVz
ID0gInBjaWUtcGh5MSI7DQo+ID4gIAkJYnVzLXJhbmdlID0gPDB4MDAgMHhmZj47DQo+ID4gLQkJ
cmFuZ2VzID0gPDB4ODIwMDAwMDAgMCAweDIwMDAwMDAwICAweDAgMHgyMDAwMDAwMCAgMCAweDEw
MDAwMDAwPjsNCj4gPiArCQlyYW5nZXMgPSA8MHg4MjAwMDAwMCAwIDB4MTE0MDAwMDAgIDB4MCAw
eDExNDAwMDAwICAwIDB4MzAwMDAwPjsNCj4gPiAgDQo+ID4gLQkJcGNpZTA6IHBjaWVAMCwwIHsN
Cj4gPiAtCQkJcmVnID0gPDB4MDAwMCAwIDAgMCAwPjsNCj4gPiArCQlzbG90MTogcGNpZUAxLDAg
ew0KPiANCj4gRG9lcyB0aGUgZHJpdmVyIHN0aWxsIHdvcmsgaWYgdGhpcyBpcyBkZXZmbiAwIGlu
c3RlYWQgb2YgMSAob3Igc3dhcCAwIA0KPiBhbmQgMSBzbG90cyk/IEknbGwgYmV0IGl0IGRvZXMu
IA0KPiANClRoZSBkcml2ZXIgc3RpbGwgd29yayB3aGVuIGRldmZuIDAgaW5zdGVhZCBvZiAx77yM
YnV0IHRoZSBkcml2ZXIgYW5kIGR0c2kNCm5lZWQgc29tZSBjaGFuZ2UuQmVjYXVzZSBzb21lIHNl
dHRpbmcgaW4gdGhlIGRyaXZlciBpcyBiYXNlZCBvbiBzbG90DQpudW1iZXIgdG8gZGV0ZXJtaW5l
IG9mZnNldC4NCj4gVGhlIHJlYXNvbiBiZWluZyBpcyB0aGF0IEFGQUlDVCwgdGhlIE1lZGlhdGVr
IFBDSSBjb250cm9sbGVyIGlzIA0KPiBEZXNpZ253YXJlIGJhc2VkLiBUaGUgcmVnaXN0ZXJzIGF0
IDB4NzBjIGFuZCAweDczYyBhcmUgRFdDICdwb3J0IGxvZ2ljJyANCj4gcmVnaXN0ZXJzLiBUaGUg
RFdDIFJDIGFsc28gaGFzIGEgcXVpcmsgdGhhdCBpdCBkb2Vzbid0IGZpbHRlciBjb25maWcgDQo+
IGFjY2Vzc2VzIHRvIG9ubHkgZGV2Zm4gMCAoc2VlIHBjaV9kd192YWxpZF9kZXZpY2UoKSksIHNv
IHlvdXIgY29uZmlnIA0KPiBhY2Nlc3NlcyB0byB0aGUgUlAgc2hvdWxkIHdvcmsgbm8gbWF0dGVy
IHdoYXQgZGV2Zm4geW91IHVzZS4gWW91J2xsIGhhdmUgDQo+IHRvIGdldCByaWQgb2YgdGhlIHBv
cnRzIGxpc3QgYW5kIGp1c3QgZ2V0IHRoZSBtdGtfcGNpZV9wb3J0IGZyb20gDQo+IGJ1cy0+c3lz
ZGF0YSBpbnN0ZWFkLg0KSSBkb27igJl0IHVuZGVyc3RhbmQgd2h5IG11c3QgZ2V0IHJpZCBvZiB0
aGUgcG9ydHMgbGlzdCBhbmQgZ2V0IHRoZQ0KbXRrX3BjaWVfcG9ydCBmcm9tIGJ1cy0+c3lzZGF0
YSBpbnN0ZWFkLiBQb3J0cyBsaXN0IHdhcyByZXRhaW5lZCBmb3INCmNvbXBhdGliaWxpdHkgd2l0
aCB0aGUgb2xkIERUUyBmb3JtYXQuIEFuZCBpbiBwY2ktdGVncmEuYyBhbmQNCnBjaS1tdmVidS5j
ICx0aGV5IGFsc28gaGF2ZSBwb3J0cyBsaXN0IGFuZCBkZXZmbiBkb2Vzbid0IHN0YXJ0IGF0DQow
LihlLmc6dGVncmEyMTAuZHRzaSwgYXJtYWRhLTM4NS5kdHNpKS4NCj4gDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
