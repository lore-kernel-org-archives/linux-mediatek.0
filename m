Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3424CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 07:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHVLAEztesvEEc5KFRcQrEHbG5HkrI9HRZWvQtOH914=; b=3DXwXZPt4blZzTC744VkEdfXun
	nLeoWHBqxPtKy8n0Jqu1QQ2d8eYvDCKGIGAWx3D3REdNDIy2We2Sbbjs72Q10//ZXgm0aOzFnti9i
	GE5DmPKHxhV8v9tmHTi8WO5HidsZVSyw3NFounTR+wjD0KEhiqfURKpti3EiBWrw7XeG/kl7wKIeF
	WGEf6+KNzpypfdeLVUGnZKuj1Bsh0nWws6gDzygzeIpIDi/3aoOmT3GFDrCod+DgnwhBj2lkGBQxu
	tnN7P+fkqBcfwt+9JRr/3HXX1kVCGxyabnVenP0H7T08QP5dMLJFThvD95QguIkL1i62/o7s8OYom
	VakSjryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2pdh-00DVBj-LA; Sun, 19 Jun 2022 07:46:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2pdW-00DV8C-2j; Sun, 19 Jun 2022 07:46:23 +0000
X-UUID: 9e403746d2c34878bb64bd4a133b96d5-20220619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NHVLAEztesvEEc5KFRcQrEHbG5HkrI9HRZWvQtOH914=;
	b=tR2foEmwb5bLvvui4vcV5j82E4znYlCoV2fHhs9IVDAr+Y9HM+qOr85HCGiD6GvzICHjr31JWBvICyu3ujf7QB5iojvrkXlNGPEDyDBg6OUX1+moXRdTPGWmcaBNO2livuZpjcfo2vSCQrBVxwh//wKcvtmoWAgBwLOudryfLHM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6ec81cca-5149-4275-9541-1054ebc2c3aa,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:3ee1caf6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9e403746d2c34878bb64bd4a133b96d5-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1667138795; Sun, 19 Jun 2022 00:46:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 00:46:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 19 Jun 2022 15:46:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 19 Jun 2022 15:46:12 +0800
Message-ID: <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-usb@vger.kernel.org>
Date: Sun, 19 Jun 2022 15:46:12 +0800
In-Reply-To: <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
	 <20220617222916.2435618-3-nfraprado@collabora.com>
	 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_004622_172207_3B241A40 
X-CRM114-Status: GOOD (  25.04  )
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

T24gRnJpLCAyMDIyLTA2LTE3IGF0IDE4OjI1IC0wNzAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxNy8wNi8yMDIyIDE1OjI5LCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90
ZToNCj4gPiBUaGUgY3VycmVudCBjbG9jayBsaXN0IGluIHRoZSBiaW5kaW5nIGRvZXNuJ3QgYWxs
b3cgZm9yIG9uZSBvZiB0aGUNCj4gPiBvcHRpb25hbCBjbG9ja3MgdG8gYmUgbWlzc2luZyBhbmQg
YSBzdWJzZXF1ZW50IGNsb2NrIHRvIGJlIHByZXNlbnQuDQo+ID4gQW4NCj4gPiBleGFtcGxlIHdo
ZXJlIHRoaXMgaXMgYW4gaXNzdWUgaXMgaW4gbXQ4MTkyLmR0c2ksIHdoaWNoIGhhcw0KPiA+ICJz
eXNfY2siLA0KPiA+ICJyZWZfY2siLCAieGhjaV9jayIgYW5kIHdvdWxkIGNhdXNlIGR0YnNfY2hl
Y2sgd2FybmluZ3MuDQo+ID4gDQo+ID4gQ2hhbmdlIHRoZSBjbG9jayBsaXN0IGluIGEgd2F5IHRo
YXQgYWxsb3dzIHRoZSBtaWRkbGUgb3B0aW9uYWwNCj4gPiBjbG9ja3MgdG8NCj4gPiBiZSBtaXNz
aW5nLCB3aGlsZSBzdGlsbCBndWFyYW50ZWVpbmcgYSBmaXhlZCBvcmRlci4gVGhlICJyZWZfY2si
IGlzDQo+ID4ga2VwdA0KPiA+IGFzIGEgY29uc3QgZXZlbiB0aG91Z2ggaXQgaXMgb3B0aW9uYWwg
Zm9yIHNpbXBsaWNpdHksIHNpbmNlIGl0IGlzDQo+ID4gcHJlc2VudCBpbiBhbGwgY3VycmVudCBk
dHMgZmlsZXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiA+IC0tLQ0KPiA+IA0KPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRrLXhoY2kueWFtbCAgICAgICB8IDkNCj4g
PiArKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4geGhjaS55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4geGhjaS55YW1sDQo+
ID4gaW5kZXggNjNjYmMyYjYyZDE4Li45OWExYjIzM2VjOTAgMTAwNjQ0DQo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1s
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRl
ayxtdGsteGhjaS55YW1sDQo+ID4gQEAgLTgwLDggKzgwLDEzIEBAIHByb3BlcnRpZXM6DQo+ID4g
ICAgICBpdGVtczoNCj4gPiAgICAgICAgLSBjb25zdDogc3lzX2NrICAjIHJlcXVpcmVkLCB0aGUg
Zm9sbG93aW5nIG9uZXMgYXJlIG9wdGlvbmFsDQo+ID4gICAgICAgIC0gY29uc3Q6IHJlZl9jaw0K
PiA+IC0gICAgICAtIGNvbnN0OiBtY3VfY2sNCj4gPiAtICAgICAgLSBjb25zdDogZG1hX2NrDQo+
ID4gKyAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0gbWN1X2NrDQo+ID4gKyAgICAgICAg
ICAtIGRtYV9jaw0KPiA+ICsgICAgICAgICAgLSB4aGNpX2NrDQo+ID4gKyAgICAgIC0gZW51bToN
Cj4gPiArICAgICAgICAgIC0gZG1hX2NrDQo+ID4gKyAgICAgICAgICAtIHhoY2lfY2sNCj4gPiAg
ICAgICAgLSBjb25zdDogeGhjaV9jaw0KPiANCj4gWW91IGFsbG93IG5vdyBhbG1vc3QgYW55IG9y
ZGVyIGhlcmUsIGluY2x1ZGluZyBpbmNvcnJlY3QgbGlrZQ0KPiBzeXMscmVmLHhoY2kseGhjaSx4
aGNpLg0KPiANCj4gVGhlIG9yZGVyIG9mIGNsb2NrcyBoYXMgdG8gYmUgZml4ZWQgYW5kIHdlIGNh
bm5vdCBhbGxvdyBmbGV4aWJpbGl0eS4NCj4gQXJlDQo+IHlvdSBzdXJlIHRoYXQgdGhlc2UgY2xv
Y2tzIGFyZSBhY3R1YWxseSBvcHRpb25hbCAobm90IHdpcmVkIHRvIHRoZQ0KPiBkZXZpY2UpPw0K
SW4gZmFjdCwgdGhlc2Ugb3B0aW9uYWwgY2xvY2tzIGFyZSBmaXhlZCwgZHVlIHRvIG5vIGdhdGVz
IGFyZSBwcm92aWRlZCwNClNXIGNhbid0IGNvbnRyb2wgdGhlbSBieSBDQ0Y7DQpJbiB0aGlzIGNh
c2UsIEkgdXN1YWxseSB1c2UgYSBmaXhlZCBjbG9jaywgb3IgaWdub3JlIGl0Lg0KDQo+IA0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==


