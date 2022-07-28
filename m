Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B1EC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksA/v8cJ5sJDoIZkM5kyMNtB/qn710LRk4asNJBjvBs=; b=WCI6VfT3sJ3tNiemfU8vnZgN8s
	XamFr3qdPsmJZqpvgz7YLtEOIE/9d/Z/OEiLf9fsqfCWV/yXQSj1fXdpTz2/f5cc/Z/R6MrD81x3k
	VGsj91IKv4ot8Qu23ONl7AewsB6Xli7M5EROiXqy69KVjxRixZXte6/DgWOiOGqYGh5Hd/OlbdX4m
	laK2ZwZhO9boSaXpkw3VKjEzW9TsbjQeMskETRh9uC2G11HwQESeQmfyFMi78Ucsouc6Mqq3zGHE2
	oRWeETeU8mL30NKfZ++/EB+4NpbXKNUZylCO9NgFk1WmTwFW/vLYeL1BpnDGF1VFO4tzEcxUu3PnM
	4TF+WSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyTC-005bt0-P4; Thu, 28 Jul 2022 08:02:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyT7-005bqZ-U2
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 08:02:08 +0000
X-UUID: be6baa500eb24fdc945b2514738a38f5-20220728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ksA/v8cJ5sJDoIZkM5kyMNtB/qn710LRk4asNJBjvBs=;
	b=adnce5qbM+bP8EXiCmA/jsDQDtHgpDeg6zrosfPFohDLNiqKzDWkiToqRaAZKPujNJJ/VHjBxf/xgiJt/AfAe4++eAUAJextYYHvxBqf8rYWtDhrHqH+ZQ+OpyO5TcOY7Lxx5wMzm+z3MnGcaX3i4lpqGQXihempPJwkxLLA1tU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3816d774-0911-4bda-8045-1b788da03f00,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:435190d0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: be6baa500eb24fdc945b2514738a38f5-20220728
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <hui.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1728119220; Thu, 28 Jul 2022 01:01:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 28 Jul 2022 16:01:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 16:01:20 +0800
Message-ID: <2588215844090b8f66165d21a9fb812971a94d80.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: add support for MediaTek
 mt8188
From: hui.liu <hui.liu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jianguo.zhang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 28 Jul 2022 16:01:20 +0800
In-Reply-To: <3ebd6dad-038d-eb96-3fed-8735de0cee2e@linaro.org>
References: <20220727102140.6676-1-hui.liu@mediatek.com>
	 <20220727102140.6676-2-hui.liu@mediatek.com>
	 <3ebd6dad-038d-eb96-3fed-8735de0cee2e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_010205_982298_D15B8931 
X-CRM114-Status: GOOD (  16.23  )
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

T24gV2VkLCAyMDIyLTA3LTI3IGF0IDEyOjMwICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAyNy8wNy8yMDIyIDEyOjIxLCBIdWkgTGl1IHdyb3RlOg0KPiA+IEZyb206ICJI
dWkuTGl1IiA8aHVpLmxpdUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRkIHBpbmN0cmwgZnVu
Y3Rpb24gaGVhZGVyIGZpbGUgYW5kIGJpbmRpbmcgZG9jdW1lbnQgZm9yIG10ODE4OC4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIdWkuTGl1IDxodWkubGl1QG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uL3BpbmN0cmwvbWVkaWF0ZWssbXQ4MTg4LXBpbmN0cmwueWFtbCAgICAgIHwg
IDIzOCArKysNCj4gPiAgLi4uL3BpbmN0cmwvbWVkaWF0ZWssbXQ4MTg4LXBpbmZ1bmMuaCAgICAg
ICAgIHwgMTI4MA0KPiA+ICsrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MTUxOCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10ODE4OC0NCj4gPiBw
aW5jdHJsLnlhbWwNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3Mv
cGluY3RybC9tZWRpYXRlayxtdDgxODgtDQo+ID4gcGluZnVuYy5oDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVk
aWF0ZWssbXQ4MTg4LQ0KPiA+IHBpbmN0cmwueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ4MTg4LQ0KPiA+IHBpbmN0cmwueWFt
bA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5hOWQ1
ZTllZWMzNWQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ4MTg4LQ0KPiA+IHBpbmN0cmwueWFt
bA0KPiA+IEBAIC0wLDAgKzEsMjM4IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0t
DQo+ID4gKyRpZDogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvcGluY3RybC1tdDgxODgueWFtbCpfXztJdyEhQ1RS
TktBOXdNZzBBUmJ3IXl1SDRaTDlod1UtTERlRUJoOWVodXBRRmZfcmNhcXFSTE1GckQ4cnc0TGRE
dFlkc1RpUVFRaC1lT0RKVTVKVSQNCj4gPiAgDQo+IA0KPiBEb2VzIG5vdCBsb29rIGxpa2UgeW91
IHRlc3RlZCB0aGUgYmluZGluZ3MuIFBsZWFzZSBydW4gYG1ha2UNCj4gZHRfYmluZGluZ19jaGVj
a2AgKHNlZQ0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1zY2hl
bWEucnN0IGZvcg0KPiBpbnN0cnVjdGlvbnMpLg0KPiANCkhpIEtyenlzenRvZiwNCg0KSSB3aWxs
IHJ1biBkdF9iaW5nZGluZ19jaGVjaywgYW5kIHNlbmQgdjMgcGF0Y2ggYWZ0ZXIgY2hlY2tpbmcg
cGFzcy4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==


