Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CAAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3gj+FC1KrVZx3K44HYz6l+SWp03/x7JRxwxeoSiG3U=; b=LsawVl8E3WrZ3fivXWX6igLW8a
	dZWL29YAe7zFeIhhqeBpKYqiWX9nJNauEmRkKiBGaGL26b1+PTaJ3Cg6wJFFYsUuxDhu4svdU28a7
	QGlSdR3XAZL9vmp/gRcgznqMKJ5jyFJaCk+CR7Lpkf6GGJd7O5b5gf8ygWmLN3N/Z7mkvZeZabt2f
	vp+52Lpw0zhIo6yxOa599hDFW4EAkQzr4fp+wgtW8Y/+47OHx3otqxbKl8f5tAaHL4YspN103mPu6
	/kA+2FR4+hp79Lngqn/QWFFQtOAjOjh+ep94ia6kMiz9ZTVVZAyXjp8CoyhPKJlCZSVuyhd449995
	eEaVqEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2pXf-00DUEp-1O; Sun, 19 Jun 2022 07:40:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2pXU-00DUCC-3m; Sun, 19 Jun 2022 07:40:09 +0000
X-UUID: f16aa47ea7e94005b6197df86367653c-20220619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=M3gj+FC1KrVZx3K44HYz6l+SWp03/x7JRxwxeoSiG3U=;
	b=EajiKqRUSfUDwXoHJeiCWOIKEkHYxu07b41CpMazXsEXJbZXuTNbD7FlM/w7IfGP8f3+sh5dafwkOYOXFivCeu+DotArJrCCCZPIYk2YAvk66n4p/4mRKuQcIR3Zl1XAi8Un5eUZQNxl16D6Fe/e8JV7X7g1vgUNBtaA/SXd180=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:de675850-2d81-4532-880f-ad541758212b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:a8cfcaf6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f16aa47ea7e94005b6197df86367653c-20220619
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 663111162; Sun, 19 Jun 2022 00:40:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 00:40:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 19 Jun 2022 15:40:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 19 Jun 2022 15:40:00 +0800
Message-ID: <d95e046262751a7f746fabc5f1d9a39e675730b3.camel@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-usb@vger.kernel.org>
Date: Sun, 19 Jun 2022 15:40:00 +0800
In-Reply-To: <20220617222916.2435618-3-nfraprado@collabora.com>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
	 <20220617222916.2435618-3-nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_004008_215688_5B77BCC4 
X-CRM114-Status: GOOD (  19.99  )
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

T24gRnJpLCAyMDIyLTA2LTE3IGF0IDE4OjI5IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gVGhlIGN1cnJlbnQgY2xvY2sgbGlzdCBpbiB0aGUgYmluZGluZyBkb2Vzbid0
IGFsbG93IGZvciBvbmUgb2YgdGhlDQo+IG9wdGlvbmFsIGNsb2NrcyB0byBiZSBtaXNzaW5nIGFu
ZCBhIHN1YnNlcXVlbnQgY2xvY2sgdG8gYmUgcHJlc2VudC4NCj4gQW4NCj4gZXhhbXBsZSB3aGVy
ZSB0aGlzIGlzIGFuIGlzc3VlIGlzIGluIG10ODE5Mi5kdHNpLCB3aGljaCBoYXMgInN5c19jayIs
DQo+ICJyZWZfY2siLCAieGhjaV9jayIgYW5kIHdvdWxkIGNhdXNlIGR0YnNfY2hlY2sgd2Fybmlu
Z3MuDQpIb3cgYWJvdXQgdXNpbmcgZml4ZWQgY2xvY2sgaW5zdGVhZCB0byBmaXggdGhlIGNoZWNr
IHdhcm5pbmc/DQpVc2luZyBlbnVtIHdheSBzZWVtcyBtYWtlIGl0IG1vcmUgY29tcGxleC4NCg0K
PiANCj4gQ2hhbmdlIHRoZSBjbG9jayBsaXN0IGluIGEgd2F5IHRoYXQgYWxsb3dzIHRoZSBtaWRk
bGUgb3B0aW9uYWwgY2xvY2tzDQo+IHRvDQo+IGJlIG1pc3NpbmcsIHdoaWxlIHN0aWxsIGd1YXJh
bnRlZWluZyBhIGZpeGVkIG9yZGVyLiBUaGUgInJlZl9jayIgaXMNCj4ga2VwdA0KPiBhcyBhIGNv
bnN0IGV2ZW4gdGhvdWdoIGl0IGlzIG9wdGlvbmFsIGZvciBzaW1wbGljaXR5LCBzaW5jZSBpdCBp
cw0KPiBwcmVzZW50IGluIGFsbCBjdXJyZW50IGR0cyBmaWxlcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCj4g
LS0tDQo+IA0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay14aGNp
LnlhbWwgICAgICAgfCA5DQo+ICsrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4geGhjaS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+IHhoY2ku
eWFtbA0KPiBpbmRleCA2M2NiYzJiNjJkMTguLjk5YTFiMjMzZWM5MCAxMDA2NDQNCj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55
YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0
ZWssbXRrLXhoY2kueWFtbA0KPiBAQCAtODAsOCArODAsMTMgQEAgcHJvcGVydGllczoNCj4gICAg
ICBpdGVtczoNCj4gICAgICAgIC0gY29uc3Q6IHN5c19jayAgIyByZXF1aXJlZCwgdGhlIGZvbGxv
d2luZyBvbmVzIGFyZSBvcHRpb25hbA0KPiAgICAgICAgLSBjb25zdDogcmVmX2NrDQo+IC0gICAg
ICAtIGNvbnN0OiBtY3VfY2sNCj4gLSAgICAgIC0gY29uc3Q6IGRtYV9jaw0KPiArICAgICAgLSBl
bnVtOg0KPiArICAgICAgICAgIC0gbWN1X2NrDQo+ICsgICAgICAgICAgLSBkbWFfY2sNCj4gKyAg
ICAgICAgICAtIHhoY2lfY2sNCj4gKyAgICAgIC0gZW51bToNCj4gKyAgICAgICAgICAtIGRtYV9j
aw0KPiArICAgICAgICAgIC0geGhjaV9jaw0KPiAgICAgICAgLSBjb25zdDogeGhjaV9jaw0KPiAg
DQo+ICAgIGFzc2lnbmVkLWNsb2NrczoNCg==


