Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A253C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 03:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQujE0mJhDOAqmC5aFZJSf8/KRw73dR+KQxVl5DSlck=; b=BF4iM3gQLSwerMqeZjri7xnDHe
	l9rIGoUDWqXxQtlQKI+B381nWFJVhpnTtPjHB6fjtoUAxvaFgOxodYQpxBTweFtoQIfsVrqAULb2c
	CG0ApabB4u68AusEYPaNgRPqFOFTIq5HmQW1lBDk55O52c3dhxd0ABBAjGvEDRdAah7H7YfvAeJL/
	zlIycx/gMOOrl1WSN+YFzYaTkIYU6kz/g5NFXRlDn6pUNEJWP7msJjKdjBCIaDtReczVsQVh4MsBN
	uqVdrShyx9bvoOhNgyGbHJF1s+XI3+W3EfGRuCtVhTBp8GtGkKSQZeMBHC8EbF26Gh7oW/zAib2LJ
	HnCj8LbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4whk-004WnD-FO; Sat, 25 Jun 2022 03:43:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4whX-004WjC-EI; Sat, 25 Jun 2022 03:43:17 +0000
X-UUID: 38de8f18154341eb82d4f9913131e65f-20220624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=aQujE0mJhDOAqmC5aFZJSf8/KRw73dR+KQxVl5DSlck=;
	b=GmMkqAAL1dIp3IVjsTgwOj6s+jxBsVZDHYleTj16OJgDSbDxibacPyUPT8ONw/F+i8X9PCPHFzHQO0Hyeh4I/Ls2LkHLLA/kRxgsGqwBx4is/t94Hzd8eg7EWAuAUwTigeCXyWGoBCM69JNrJEi/0/4Nl1/I8h2VIto7Btsjiq4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:0e693efe-e7f1-402f-a7a3-e039744cdac9,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:bed4002e-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 38de8f18154341eb82d4f9913131e65f-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1823671640; Fri, 24 Jun 2022 20:43:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 20:42:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 25 Jun 2022 11:42:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 25 Jun 2022 11:42:57 +0800
Message-ID: <4efb47b5323891c72dd0341f911ced74f39bfb07.camel@mediatek.com>
Subject: Re: [PATCH] usb: gadget: f_uac1: add IAD descriptor
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Felipe Balbi <balbi@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pavel Hofman <pavel.hofman@ivitera.com>, "Julian
 Scheel" <julian@jusst.de>, xin lin <xin.lin@mediatek.com>, Yunhao Tian
	<t123yh.xyz@gmail.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Eddie Hung <eddie.hung@mediatek.com>
Date: Sat, 25 Jun 2022 11:42:57 +0800
In-Reply-To: <YrWif4oeelZrctmr@kroah.com>
References: <20220622085757.23437-1-chunfeng.yun@mediatek.com>
	 <YrWif4oeelZrctmr@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_204315_531841_EFE6DBD8 
X-CRM114-Status: GOOD (  27.09  )
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

T24gRnJpLCAyMDIyLTA2LTI0IGF0IDEzOjM5ICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIFdlZCwgSnVuIDIyLCAyMDIyIGF0IDA0OjU3OjU3UE0gKzA4MDAsIENodW5mZW5n
IFl1biB3cm90ZToNCj4gPiBGcm9tOiB4aW4gbGluIDx4aW4ubGluQG1lZGlhdGVrLmNvbT4NCj4g
PiANCj4gPiBXaW4xMCBjYW4gbm90IGVudW1lcmF0ZSBjb21wb3NpdGUgZGV2aWNlIG9mIFVWQytV
QUMxK0FEQiB3aXRob3V0DQo+ID4gSUFEIGRlc2NyaXB0b3INCj4gPiBpbiB1YWMxLjAsIHNvIGFk
ZCBpdC4NCj4gDQo+IEkgZG8gbm90IGtub3cgd2hhdCB0aGlzIG1lYW5zIGF0IGFsbCwgc29ycnku
ICBDYW4geW91IHBsZWFzZSBwcm92aWRlDQo+IGENCj4gYmV0dGVyIGNoYW5nZWxvZyB0ZXh0IHRo
YXQgZGVzY3JpYmVzIHdoYXQgYWxsIG9mIHRoaXMgaXMgaW4gbW9yZQ0KPiBkZXRhaWw/DQpPaywg
d2lsbCBhZGQgaXQgaW4gbmV4dCB2ZXJzaW9uDQoNCj4gDQo+IA0KPiANCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiB4aW4gbGluIDx4aW4ubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX3VhYzEuYyB8IDIxICsrKysrKysrKysr
KysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl91YWMxLmMNCj4g
PiBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX3VhYzEuYw0KPiA+IGluZGV4IDZmMGUx
ZDgwM2RjMi4uODM5MDIwN2JjNTEzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdl
dC9mdW5jdGlvbi9mX3VhYzEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlv
bi9mX3VhYzEuYw0KPiA+IEBAIC03MSw2ICs3MSwxNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBm
X3VhYzFfb3B0cw0KPiA+ICpnX2F1ZGlvX3RvX3VhYzFfb3B0cyhzdHJ1Y3QgZ19hdWRpbyAqYXVk
aW8pDQo+ID4gICAqIEFMU0FfUGxheWJhY2sgLT4gSVRfMyAtPiBPVF80IC0+IFVTQi1JTg0KPiA+
ICAgKi8NCj4gPiAgDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgdXNiX2ludGVyZmFjZV9hc3NvY19kZXNj
cmlwdG9yIGlhZF9kZXNjID0gew0KPiA+ICsJLmJMZW5ndGggPSBzaXplb2YoaWFkX2Rlc2MpLA0K
PiA+ICsJLmJEZXNjcmlwdG9yVHlwZSA9IFVTQl9EVF9JTlRFUkZBQ0VfQVNTT0NJQVRJT04sDQo+
ID4gKw0KPiA+ICsJLmJGaXJzdEludGVyZmFjZSA9IDAsDQo+ID4gKwkuYkludGVyZmFjZUNvdW50
ID0gMywNCj4gPiArCS5iRnVuY3Rpb25DbGFzcyA9IFVTQl9DTEFTU19BVURJTywNCj4gPiArCS5i
RnVuY3Rpb25TdWJDbGFzcyA9IDAsDQo+ID4gKwkuYkZ1bmN0aW9uUHJvdG9jb2wgPSBVQUNfVkVS
U0lPTl8xLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgLyogQi4zLjEgIFN0YW5kYXJkIEFDIEludGVy
ZmFjZSBEZXNjcmlwdG9yICovDQo+ID4gIHN0YXRpYyBzdHJ1Y3QgdXNiX2ludGVyZmFjZV9kZXNj
cmlwdG9yIGFjX2ludGVyZmFjZV9kZXNjID0gew0KPiA+ICAJLmJMZW5ndGggPQkJVVNCX0RUX0lO
VEVSRkFDRV9TSVpFLA0KPiA+IEBAIC0yNTksNiArMjcwLDcgQEAgc3RhdGljIHN0cnVjdCB1YWNf
aXNvX2VuZHBvaW50X2Rlc2NyaXB0b3INCj4gPiBhc19pc29faW5fZGVzYyA9IHsNCj4gPiAgfTsN
Cj4gPiAgDQo+ID4gIHN0YXRpYyBzdHJ1Y3QgdXNiX2Rlc2NyaXB0b3JfaGVhZGVyICpmX2F1ZGlv
X2Rlc2NbXSA9IHsNCj4gPiArCShzdHJ1Y3QgdXNiX2Rlc2NyaXB0b3JfaGVhZGVyICopJmlhZF9k
ZXNjLA0KPiANCj4gV2h5IHB1dCB0aGlzIGZpcnN0PyAgSXMgdGhhdCBhIHJlcXVpcmVtZW50Pw0K
WWVzLCBpdCdzIGEgcmVxdWlyZW1lbnQsDQpJbnRlcmZhY2UgQXNzb2NpYXRpb24gRGVzY3JpcHRv
ciBFQ046DQoiQW4gaW50ZXJmYWNlIGFzc29jaWF0aW9uIGRlc2NyaXB0b3IgbXVzdCBiZSBsb2Nh
dGVkIGJlZm9yZSB0aGUgc2V0IG9mDQppbnRlcmZhY2UgZGVzY3JpcHRvcnMgKGluY2x1ZGluZyBh
bGwgYWx0ZXJuYXRlIHNldHRpbmdzKSBmb3IgdGhlDQppbnRlcmZhY2VzIGl0IGFzc29jaWF0ZXMu
Ig0KDQo+IA0KPiA+ICAJKHN0cnVjdCB1c2JfZGVzY3JpcHRvcl9oZWFkZXIgKikmYWNfaW50ZXJm
YWNlX2Rlc2MsDQo+ID4gIAkoc3RydWN0IHVzYl9kZXNjcmlwdG9yX2hlYWRlciAqKSZhY19oZWFk
ZXJfZGVzYywNCj4gPiAgDQo+ID4gQEAgLTI5Myw2ICszMDUsNyBAQCBzdGF0aWMgc3RydWN0IHVz
Yl9kZXNjcmlwdG9yX2hlYWRlcg0KPiA+ICpmX2F1ZGlvX2Rlc2NbXSA9IHsNCj4gPiAgfTsNCj4g
PiAgDQo+ID4gIGVudW0gew0KPiA+ICsJU1RSX0FTU09DLA0KPiANCj4gQWdhaW4sIHdoeSBmaXJz
dD8NCmZvbGxvdyB1YWMyIGRyaXZlcg0KPiANCj4gPiAgCVNUUl9BQ19JRiwNCj4gPiAgCVNUUl9V
U0JfT1VUX0lULA0KPiA+ICAJU1RSX1VTQl9PVVRfSVRfQ0hfTkFNRVMsDQo+ID4gQEAgLTMxMCw2
ICszMjMsNyBAQCBlbnVtIHsNCj4gPiAgDQo+ID4gIHN0YXRpYyBzdHJ1Y3QgdXNiX3N0cmluZyBz
dHJpbmdzX3VhYzFbXSA9IHsNCj4gPiAgCS8qIFtTVFJfQUNfSUZdLnMgPSBEWU5BTUlDLCAqLw0K
PiA+ICsJW1NUUl9BU1NPQ10ucyA9ICJTb3VyY2UvU2luayIsDQo+ID4gIAlbU1RSX1VTQl9PVVRf
SVRdLnMgPSAiUGxheWJhY2sgSW5wdXQgdGVybWluYWwiLA0KPiA+ICAJW1NUUl9VU0JfT1VUX0lU
X0NIX05BTUVTXS5zID0gIlBsYXliYWNrIENoYW5uZWxzIiwNCj4gPiAgCVtTVFJfSU9fT1VUX09U
XS5zID0gIlBsYXliYWNrIE91dHB1dCB0ZXJtaW5hbCIsDQo+ID4gQEAgLTEwNTgsNiArMTA3Miw3
IEBAIHN0YXRpYyB2b2lkIHNldHVwX2Rlc2NyaXB0b3Ioc3RydWN0DQo+ID4gZl91YWMxX29wdHMg
Km9wdHMpDQo+ID4gIAlhc19vdXRfaGVhZGVyX2Rlc2MuYlRlcm1pbmFsTGluayA9IHVzYl9vdXRf
aXRfZGVzYy5iVGVybWluYWxJRDsNCj4gPiAgCWFzX2luX2hlYWRlcl9kZXNjLmJUZXJtaW5hbExp
bmsgPSB1c2JfaW5fb3RfZGVzYy5iVGVybWluYWxJRDsNCj4gPiAgDQo+ID4gKwlpYWRfZGVzYy5i
SW50ZXJmYWNlQ291bnQgPSAxOw0KPiANCj4gV2h5IHRoaXMgY2hhbmdlPw0KRlMsIEhTIG1heSBi
ZSBkaWZmZXJlbnQsIGNvdW50IHVwIHRoZW0gYWdhaW4uDQoNCj4gDQo+IA0KPiA+ICAJYWNfaGVh
ZGVyX2Rlc2MtPndUb3RhbExlbmd0aCA9IGNwdV90b19sZTE2KGFjX2hlYWRlcl9kZXNjLQ0KPiA+
ID5iTGVuZ3RoKTsNCj4gPiAgDQo+ID4gIAlpZiAoRVBJTl9FTihvcHRzKSkgew0KPiA+IEBAIC0x
MDY4LDYgKzEwODMsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cF9kZXNjcmlwdG9yKHN0cnVjdA0KPiA+
IGZfdWFjMV9vcHRzICpvcHRzKQ0KPiA+ICAJCWlmIChGVUlOX0VOKG9wdHMpKQ0KPiA+ICAJCQls
ZW4gKz0gaW5fZmVhdHVyZV91bml0X2Rlc2MtPmJMZW5ndGg7DQo+ID4gIAkJYWNfaGVhZGVyX2Rl
c2MtPndUb3RhbExlbmd0aCA9IGNwdV90b19sZTE2KGxlbik7DQo+ID4gKwkJaWFkX2Rlc2MuYklu
dGVyZmFjZUNvdW50Kys7DQo+ID4gIAl9DQo+ID4gIAlpZiAoRVBPVVRfRU4ob3B0cykpIHsNCj4g
PiAgCQl1MTYgbGVuID0gbGUxNl90b19jcHUoYWNfaGVhZGVyX2Rlc2MtPndUb3RhbExlbmd0aCk7
DQo+ID4gQEAgLTEwNzcsOSArMTA5MywxMSBAQCBzdGF0aWMgdm9pZCBzZXR1cF9kZXNjcmlwdG9y
KHN0cnVjdA0KPiA+IGZfdWFjMV9vcHRzICpvcHRzKQ0KPiA+ICAJCWlmIChGVU9VVF9FTihvcHRz
KSkNCj4gPiAgCQkJbGVuICs9IG91dF9mZWF0dXJlX3VuaXRfZGVzYy0+Ykxlbmd0aDsNCj4gPiAg
CQlhY19oZWFkZXJfZGVzYy0+d1RvdGFsTGVuZ3RoID0gY3B1X3RvX2xlMTYobGVuKTsNCj4gPiAr
CQlpYWRfZGVzYy5iSW50ZXJmYWNlQ291bnQrKzsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAlpID0g
MDsNCj4gPiArCWZfYXVkaW9fZGVzY1tpKytdID0gVVNCREhEUigmaWFkX2Rlc2MpOw0KPiANCj4g
QWdhaW4sIHdoeSBmaXJzdD8NCkl0IGlzIGEgcmVxdWlyZW1lbnQgYXMgRUNOIHNheXMuDQoNCj4g
DQo+ID4gIAlmX2F1ZGlvX2Rlc2NbaSsrXSA9IFVTQkRIRFIoJmFjX2ludGVyZmFjZV9kZXNjKTsN
Cj4gPiAgCWZfYXVkaW9fZGVzY1tpKytdID0gVVNCREhEUihhY19oZWFkZXJfZGVzYyk7DQo+ID4g
IA0KPiA+IEBAIC0xMjE3LDYgKzEyMzUsNyBAQCBzdGF0aWMgaW50IGZfYXVkaW9fYmluZChzdHJ1
Y3QNCj4gPiB1c2JfY29uZmlndXJhdGlvbiAqYywgc3RydWN0IHVzYl9mdW5jdGlvbiAqZikNCj4g
PiAgCQl9DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICsJaWFkX2Rlc2MuaUZ1bmN0aW9uID0gdXNbU1RS
X0FTU09DXS5pZDsNCj4gPiAgCWFjX2ludGVyZmFjZV9kZXNjLmlJbnRlcmZhY2UgPSB1c1tTVFJf
QUNfSUZdLmlkOw0KPiA+ICAJdXNiX291dF9pdF9kZXNjLmlUZXJtaW5hbCA9IHVzW1NUUl9VU0Jf
T1VUX0lUXS5pZDsNCj4gPiAgCXVzYl9vdXRfaXRfZGVzYy5pQ2hhbm5lbE5hbWVzID0gdXNbU1RS
X1VTQl9PVVRfSVRfQ0hfTkFNRVNdLmlkOw0KPiA+IEBAIC0xMzAyLDYgKzEzMjEsOCBAQCBzdGF0
aWMgaW50IGZfYXVkaW9fYmluZChzdHJ1Y3QNCj4gPiB1c2JfY29uZmlndXJhdGlvbiAqYywgc3Ry
dWN0IHVzYl9mdW5jdGlvbiAqZikNCj4gPiAgCXN0YXR1cyA9IHVzYl9pbnRlcmZhY2VfaWQoYywg
Zik7DQo+ID4gIAlpZiAoc3RhdHVzIDwgMCkNCj4gPiAgCQlnb3RvIGVycl9mcmVlX2Z1Ow0KPiA+
ICsNCj4gPiArCWlhZF9kZXNjLmJGaXJzdEludGVyZmFjZSA9IHN0YXR1czsNCj4gDQo+IFNob3Vs
ZG4ndCB0aGlzIGJlIG5lZWRlZCB3aXRob3V0IHlvdXIgY2hhbmdlPw0KTmVlZCB1cGRhdGUsIGl0
J3Mgbm90IGFsd2F5cyAwLg0KDQpUaGFua3MgYSBsb3QNCg0KPiANCj4gdGhhbmtzLA0KPiANCj4g
Z3JlZyBrLWgNCg==


