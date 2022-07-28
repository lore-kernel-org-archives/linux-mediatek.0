Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DE9C19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7z+BoeZxA5/RtK35nDbdV8lkbXOLcvOzRTTSwugUvU=; b=ioenUEZDAojNKuEDzmgpP1AaTe
	nsn2TW14U4vW/bfZ+YZSGiIL2EdYfPj1PHnXA3NOdeJZ9vVsC8lxXAkTA+IGOpiDLq4Lc305Y34nu
	3hgpFDk+jO3W69/a94TH+Wx+7Nw+TCE3wBWoFVkmzGWCRdyMjYHy/Ld38SCn+9JA//A9hh8ttEwtV
	wo/R4rdjKWSTX33IY84rtcfv0RO4zhbtMyB941PbSolYNzlulP28USv9eQimpTEMLI1qXKE5HDhi3
	ySQMP4vXBfe34FKAFJSCzKMKQVTPRbCvNg66JQi75S5VBuLqTfPka53f4Bgfe766DvnczXvQ782v1
	FKfoQBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxMw-005D5t-C6; Thu, 28 Jul 2022 06:51:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxMs-005D3r-Qq; Thu, 28 Jul 2022 06:51:36 +0000
X-UUID: f84a8a72aba740389370b2c279f286e1-20220727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=p7z+BoeZxA5/RtK35nDbdV8lkbXOLcvOzRTTSwugUvU=;
	b=Z1KyUSFQI3oF6wEQsRsRC/mqW4Y/0j9Qs6mOHzdoAdV9EwOOn4Hx/013cwBXJcqbBnWw0zYWSJTcjKqxBTmYpE+t29R5u+1Oe3GIvLZhqlPuzxQ0815AoxlVv6wgnikp2Dxx2aFCIkwB4/tTFC63hmDLJNtw40rBf9pXCkIhm7U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cbc5cb5a-9d27-4a09-bc9f-3cbcd18c68f8,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:1e249724-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f84a8a72aba740389370b2c279f286e1-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1373426679; Wed, 27 Jul 2022 23:51:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Jul 2022 14:00:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 14:00:50 +0800
Message-ID: <b00f7bf2614b411fe275d1533f962d4d34ab6071.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pmic: mt6366: add binding document
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
	<tinghan.shen@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
	<sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 28 Jul 2022 14:00:50 +0800
In-Reply-To: <ece7675a-a386-0a16-a087-2469758917f7@linaro.org>
References: <20220510064603.15920-1-zhiyong.tao@mediatek.com>
	 <20220510064603.15920-2-zhiyong.tao@mediatek.com>
	 <ece7675a-a386-0a16-a087-2469758917f7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_235134_904699_33D34E01 
X-CRM114-Status: GOOD (  20.76  )
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

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDEyOjE0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxMC8wNS8yMDIyIDA4OjQ2LCBaaGl5b25nIFRhbyB3cm90ZToNCj4gPiBGcm9t
OiAiWmhpeW9uZy5UYW8iIDx6aGl5b25nLnRhb0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gVGhl
IGNvbW1pdCBhZGRzIG10NjM2NiBiaW5kaW5nIGRvY3VtZW50Lg0KPiANCj4gDQpodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92NS4xNy4xL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nl
c3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMOTUNCj4gDQo9PT4NCkhpIEtyenlzenRvZiwNCg0K
d2Ugd2lsbCBmaXggaXQgaW4gdjIuDQoNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGl5b25n
LlRhbyA8emhpeW9uZy50YW9AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGlu
Z3MvcmVndWxhdG9yL210NjM2Ni1yZWd1bGF0b3IueWFtbCAgfCA0MDUNCj4gPiArKysrKysrKysr
KysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQwNSBpbnNlcnRpb25zKCspDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZWd1bGF0b3IvbXQ2MzY2LXJlZ3VsYXRvci55YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXQ2MzY2LQ0KPiA+IHJl
Z3VsYXRvci55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVn
dWxhdG9yL210NjM2Ni1yZWd1bGF0b3IueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4xZjEyNWY1YmE4NjANCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tdDYz
NjYtDQo+ID4gcmVndWxhdG9yLnlhbWwNCj4gDQo+IEZpbGVuYW1lIHdpdGggdmVuZG9yLCBzbyAi
bWVkaWF0ZWssbXQ2MzY2LXJlZ3VsYXRvci55YW1sIg0KPiANCj4gPiBAQCAtMCwwICsxLDQwNSBA
QA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1
c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiANCj4gPiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9yZWd1bGF0b3IvbXQ2MzY2LXJlZ3VsYXRvci55YW1sIw0KPiA+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMN
Cj4gPiArDQo+ID4gK3RpdGxlOiBNVDYzNjYgUmVndWxhdG9yIGZyb20gTWVkaWFUZWsgSW50ZWdy
YXRlZA0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBIc2luLUhzaXVuZyBXYW5n
IDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9u
OiB8DQo+ID4gKyAgTGlzdCBvZiByZWd1bGF0b3JzIHByb3ZpZGVkIGJ5IHRoaXMgY29udHJvbGxl
ci4gSXQgaXMgbmFtZWQNCj4gPiArICBhY2NvcmRpbmcgdG8gaXRzIHJlZ3VsYXRvciB0eXBlLCBi
dWNrXzxuYW1lPiBhbmQgbGRvXzxuYW1lPi4NCj4gPiArICBNVDYzNjYgcmVndWxhdG9ycyBub2Rl
IHNob3VsZCBiZSBzdWIgbm9kZSBvZiB0aGUgTVQ2Mzk3IE1GRA0KPiA+IG5vZGUuDQo+ID4gKw0K
PiANCj4gTWlzc2luZyBwcm9wZXJ0aWVzIG5vZGUsIG1pc3NpbmcgY29tcGF0aWJsZS4gSG93IGlz
IGl0IHN1cHBvc2VkIHRvDQo+IG1hdGNoPyBJZiB5b3UgcGxhbiB0byB1c2UgaXQgYXMgcGFydCBv
ZiBvdGhlciBiaW5kaW5nLCBwbGVhc2Ugc2VuZA0KPiBlbnRpcmUgcGF0Y2hzZXQgKGluY2x1ZGlu
ZyB0aGUgYmluZGluZyB3aGljaCB1c2VzIHRoaXMgb25lKS4NCj4gDQo+IEluIGN1cnJlbnQgZm9y
bSB0aGlzIGxvb2tzIHVudGVzdGFibGUsIHVudXNhYmxlLg0KPT0+V2Ugd2lsbCAgYWRkIHByb3Bl
cnRpZXMgbm9kZSBhbmQgY29tcGF0aWJsZWluIHYyLg0KPiANCj4gPiArcGF0dGVyblByb3BlcnRp
ZXM6DQo+ID4gKyAgIl5idWNrX3YoZHJhbTF8Y29yZXxwYXxwcm9jMTF8cHJvYzEyfGdwdXxzMnxt
b2RlbXxzMSkkIjoNCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgJHJlZjogInJlZ3Vs
YXRvci55YW1sIyINCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICByZWd1
bGF0b3ItbmFtZToNCj4gPiArICAgICAgICBwYXR0ZXJuOg0KPiA+ICJedihkcmFtMXxjb3JlfHBh
fHByb2MxMXxwcm9jMTJ8Z3B1fHMyfG1vZGVtfHMxKSQiDQo+ID4gKw0KPiA+ICsgICAgdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiANCj4gUHV0IHRoaXMgb25lIGFmdGVyICRyZWYgKG90
aGVyIHBsYWNlcyBhcyB3ZWxsKS4gTWFrZXMgaXQgbW9yZQ0KPiByZWFkYWJsZS4NCj09PndlIHdp
bGwgZml4IGl0IGluIHYyLg0KPiANCj4gPiArDQo+ID4gKyAgIl5sZG9fdihpYnJ8cmYxMnx1c2J8
Y2FtaW98ZWZ1c2V8eG8yMikkIjoNCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgJHJl
ZjogInJlZ3VsYXRvci55YW1sIyINCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsg
ICAgICByZWd1bGF0b3ItbmFtZToNCj4gPiArICAgICAgICBwYXR0ZXJuOiAiXnYoaWJyfHJmMTJ8
dXNifGNhbWlvfGVmdXNlfHhvMjIpJCINCj4gPiArDQo+ID4gKyAgICB1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICsgICJebGRvX3YocmZja3xlbWN8YTEyfGEwOXx1ZnN8
YmJjaykkIjoNCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgJHJlZjogInJlZ3VsYXRv
ci55YW1sIyINCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICByZWd1bGF0
b3ItbmFtZToNCj4gPiArICAgICAgICBwYXR0ZXJuOiAiXnYocmZja3xlbWN8YTEyfGEwOXx1ZnN8
YmJjaykkIg0KPiA+ICsNCj4gPiArICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4g
PiArDQo+ID4gKyAgIl5sZG9fdmNuKDE4fDEzfDMzXzFfYnR8MTNfMV93aWZpfDMzXzJfYnR8MzNf
Ml93aWZpKSQiOg0KPiANCj4gTm8gdW5kZXJzY29yZXMgaW4gbm9kZSBuYW1lcy4NCj09PndlIHdp
bGwgZml4IGl0IGluIHYyLg0KPiANCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgJHJl
ZjogInJlZ3VsYXRvci55YW1sIyINCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsg
ICAgICByZWd1bGF0b3ItbmFtZToNCj4gPiArICAgICAgICBwYXR0ZXJuOg0KPiA+ICJedmNuKDE4
fDEzfDMzXzFfYnR8MTNfMV93aWZpfDMzXzJfYnR8MzNfMl93aWZpKSQiDQo+ID4gKw0KPiA+ICsg
ICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArICAiXmxkb192c3Jh
bV8ocHJvYzJ8b3RoZXJzfG1kfHByb2MxfG90aGVyc19zc2h1YikkIjoNCj4gDQo+IE5vIHVuZGVy
c2NvcmVzIGluIG5vZGUgbmFtZXMsIGluIGFsbCBwbGFjZXMuDQo9PT53ZSB3aWxsIGZpeCBpdCBp
biB2Mi4NClRoYW5rcy4NCj4gDQo+ID4gKyAgICB0eXBlOiBvYmplY3QNCj4gPiArICAgICRyZWY6
ICJyZWd1bGF0b3IueWFtbCMiDQo+ID4gKw0KPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiArICAg
ICAgcmVndWxhdG9yLW5hbWU6DQo+ID4gKyAgICAgICAgcGF0dGVybjogIl52c3JhbV8ocHJvYzJ8
b3RoZXJzfG1kfHByb2MxfG90aGVyc19zc2h1YikkIg0KPiA+ICsNCj4gPiArICAgIHVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0K


