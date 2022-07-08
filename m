Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118B1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdO1G3yYQcK9cK1x6UJXyoTaFefzh9uYttWkrC8q3uA=; b=g40n4OEOS8dFa+AzZyR/l1Advk
	rG9dG70/oxRY2RBDgqXi1FlCPFj1/x4qrSkuF8C2mCLomvc+E/A/iKgWZ2wi6vJufK6tC6v+KsZvm
	Yw97JORFvD6wSRfBCWjhRdoNxWJjULsb61Z8VfdvOJnG42YEz7YqwHJGvf6izch7IY2hnW1495F4q
	z7LkU1sLY0MDzCsCmXAFlC9uNhwujqrml+2CgplSIAEnTCBc0Qzd1z1r00ln6MtGpNg522hyid4+J
	CfvXpi3z/ECOkiSb5PXUb28koF1YdpCPKkhq7udt9dEGCfeeMnxXHKzoJKwur8af9i8eyXgWU0r28
	znUDEdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jtt-002ke6-MP; Fri, 08 Jul 2022 09:03:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jtp-002kbf-EH; Fri, 08 Jul 2022 09:03:47 +0000
X-UUID: 5f1a9121d7b84ff3a2808c4a6d6f9c5c-20220708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=gdO1G3yYQcK9cK1x6UJXyoTaFefzh9uYttWkrC8q3uA=;
	b=T3Z01VJ4qYwpbxxWaCiv+JYXPOqDCkFv7A7WkvhuoEL5CPJVFK+E+wSLFRmdMMlwxGzdQ1jrZRROkllW/K4rTGZs/9bTxhV4v6lXFBF8b+JuhUkkOlltmJFSzSUaYhLites1u+LyuWsCS4npxH5HSpNJcErSAsRaLNbblEhsA/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3420a570-09fa-462c-8e6b-638701cdf088,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:8bb7f6d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5f1a9121d7b84ff3a2808c4a6d6f9c5c-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1940098994; Fri, 08 Jul 2022 02:03:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 16:32:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 16:32:56 +0800
Message-ID: <a748f941c39d46f749dfcd17e881b07242f5bfaf.camel@mediatek.com>
Subject: Re: [PATCH net v2] stmmac: dwmac-mediatek: fix clock issue
From: Biao Huang <biao.huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, David Miller
	<davem@davemloft.net>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>
Date: Fri, 8 Jul 2022 16:32:57 +0800
In-Reply-To: <c088f936-00a1-4a7b-c995-dd49b011494f@gmail.com>
References: <20220708075622.26342-1-biao.huang@mediatek.com>
	 <20220708075622.26342-2-biao.huang@mediatek.com>
	 <c088f936-00a1-4a7b-c995-dd49b011494f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_020345_554213_4EB882C7 
X-CRM114-Status: GOOD (  23.14  )
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

RGVhciBNYXR0aGlhcywNCg0KCVRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCg0KQmVzdCBSZWdh
cmRzIQ0KQmlhbw0KT24gRnJpLCAyMDIyLTA3LTA4IGF0IDEwOjE3ICswMjAwLCBNYXR0aGlhcyBC
cnVnZ2VyIHdyb3RlOg0KPiANCj4gT24gMDgvMDcvMjAyMiAwOTo1NiwgQmlhbyBIdWFuZyB3cm90
ZToNCj4gPiBTaW5jZSBjbG9ja3MgYXJlIGhhbmRsZWQgaW4gbWVkaWF0ZWtfZHdtYWNfY2xrc19j
b25maWcoKSwNCj4gPiByZW1vdmUgdGhlIGNsb2NrcyBjb25maWd1cmF0aW9uIGluIGluaXQoKS9l
eGl0KCksIGFuZA0KPiA+IGludm9rZSBtZWRpYXRla19kd21hY19jbGtzX2NvbmZpZyBpbnN0ZWFk
Lg0KPiA+IA0KPiA+IFRoaXMgaXNzdWUgaXMgZm91bmQgaW4gc3VzcGVuZC9yZXN1bWUgdGVzdC4N
Cj4gPiANCj4gPiBGaXhlczogMzE4NmJkYWQ5N2Q1ICgic3RtbWFjOiBkd21hYy1tZWRpYXRlazog
YWRkIHBsYXRmb3JtIGxldmVsDQo+ID4gY2xvY2tzIG1hbmFnZW1lbnQiKQ0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpYW8gSHVhbmcgPGJpYW8uaHVhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgIHwgMzIgKysr
KysrLS0tLS0tDQo+ID4gLS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jDQo+ID4gYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jDQo+ID4gaW5kZXgg
NmZmODhkZjU4NzY3Li42ZDgyY2YyNjU4ZTAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMNCj4gPiBAQCAt
NTc2LDMyICs1NzYsMTIgQEAgc3RhdGljIGludCBtZWRpYXRla19kd21hY19pbml0KHN0cnVjdA0K
PiA+IHBsYXRmb3JtX2RldmljZSAqcGRldiwgdm9pZCAqcHJpdikNCj4gPiAgIAkJfQ0KPiA+ICAg
CX0NCj4gPiAgIA0KPiA+IC0JcmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUodmFyaWFudC0+
bnVtX2Nsa3MsIHBsYXQtPmNsa3MpOw0KPiA+IC0JaWYgKHJldCkgew0KPiA+IC0JCWRldl9lcnIo
cGxhdC0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBjbGtzLCBlcnIgPSAlZFxuIiwNCj4gPiByZXQp
Ow0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JcmV0ID0gY2xrX3By
ZXBhcmVfZW5hYmxlKHBsYXQtPnJtaWlfaW50ZXJuYWxfY2xrKTsNCj4gPiAtCWlmIChyZXQpIHsN
Cj4gPiAtCQlkZXZfZXJyKHBsYXQtPmRldiwgImZhaWxlZCB0byBlbmFibGUgcm1paSBpbnRlcm5h
bCBjbGssDQo+ID4gZXJyID0gJWRcbiIsIHJldCk7DQo+ID4gLQkJZ290byBlcnJfY2xrOw0KPiA+
IC0JfQ0KPiA+IC0NCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiAtDQo+ID4gLWVycl9jbGs6DQo+ID4g
LQljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZSh2YXJpYW50LT5udW1fY2xrcywgcGxhdC0+Y2xr
cyk7DQo+ID4gLQlyZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gICBzdGF0aWMgdm9p
ZCBtZWRpYXRla19kd21hY19leGl0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4g
dm9pZCAqcHJpdikNCj4gPiAgIHsNCj4gPiAtCXN0cnVjdCBtZWRpYXRla19kd21hY19wbGF0X2Rh
dGEgKnBsYXQgPSBwcml2Ow0KPiA+IC0JY29uc3Qgc3RydWN0IG1lZGlhdGVrX2R3bWFjX3Zhcmlh
bnQgKnZhcmlhbnQgPSBwbGF0LT52YXJpYW50Ow0KPiA+IC0NCj4gPiAtCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShwbGF0LT5ybWlpX2ludGVybmFsX2Nsayk7DQo+ID4gLQljbGtfYnVsa19kaXNhYmxl
X3VucHJlcGFyZSh2YXJpYW50LT5udW1fY2xrcywgcGxhdC0+Y2xrcyk7DQo+ID4gKwkvKiBub3Ro
aW5nIHRvIGRvIG5vdyAqLw0KPiANCj4gV2UgY2FuIGp1c3QgbGVhdmUgdGhlIGZ1bmN0aW9uIHBv
aW50ZXIgcG9pbnQgdG8gTlVMTCwgdGhhdCBnZXQNCj4gY2hlY2tlZCBiZWZvcmUgDQo+IGNhbGxp
bmcgZXhpdC4NCk9LLCBJJ2xsIGRlbGV0ZSB0aGlzIGZ1bmN0aW9uLCANCmFuZCBkZWxldGUgdGhl
IGV4aXQgYXNzaWdubWVudDogDQoJcGxhdC0+ZXhpdCA9IG1lZGlhdGVrX2R3bWFjX2V4aXQ7DQpp
dCBzaG91bGQgYmUgb2sgc2luY2UgcGxhdCBpcyBhbGxvY2F0ZWQgYnkgZGV2bV9remFsbG9jLg0K
PiANCj4gUmVnYXJkcywNCj4gTWF0dGhpYXMNCj4gDQo+ID4gICB9DQo+ID4gICANCj4gPiAgIHN0
YXRpYyBpbnQgbWVkaWF0ZWtfZHdtYWNfY2xrc19jb25maWcodm9pZCAqcHJpdiwgYm9vbCBlbmFi
bGVkKQ0KPiA+IEBAIC03MTIsMTMgKzY5MiwyMSBAQCBzdGF0aWMgaW50IG1lZGlhdGVrX2R3bWFj
X3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAltZWRpYXRl
a19kd21hY19jb21tb25fZGF0YShwZGV2LCBwbGF0X2RhdCwgcHJpdl9wbGF0KTsNCj4gPiAgIAlt
ZWRpYXRla19kd21hY19pbml0KHBkZXYsIHByaXZfcGxhdCk7DQo+ID4gICANCj4gPiArCXJldCA9
IG1lZGlhdGVrX2R3bWFjX2Nsa3NfY29uZmlnKHByaXZfcGxhdCwgdHJ1ZSk7DQo+ID4gKwlpZiAo
cmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICAgCXJldCA9IHN0bW1hY19kdnJf
cHJvYmUoJnBkZXYtPmRldiwgcGxhdF9kYXQsICZzdG1tYWNfcmVzKTsNCj4gPiAgIAlpZiAocmV0
KSB7DQo+ID4gICAJCXN0bW1hY19yZW1vdmVfY29uZmlnX2R0KHBkZXYsIHBsYXRfZGF0KTsNCj4g
PiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCWdvdG8gZXJyX2Rydl9wcm9iZTsNCj4gPiAgIAl9DQo+
ID4gICANCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiArDQo+ID4gK2Vycl9kcnZfcHJvYmU6DQo+ID4g
KwltZWRpYXRla19kd21hY19jbGtzX2NvbmZpZyhwcml2X3BsYXQsIGZhbHNlKTsNCj4gPiArCXJl
dHVybiByZXQ7DQo+ID4gICB9DQo+ID4gICANCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG1lZGlhdGVrX2R3bWFjX21hdGNoW10gPSB7DQo=


