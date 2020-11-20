Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C878FC63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:32:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0FD22267
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y1LWFZcg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IbRoqygE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0FD22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WWL8T9tXhFH5hk7BXxXf9sy7A5zjCT8r5gNEw3qhiyI=; b=y1LWFZcgFgX6pxNJJkL5X+qCc
	qEUuLPS7ZCOPO/nT17GTNn311ZZmbpuOBN9xtroxonndwDTQUw0tUB+ESCFGQevhrscgiVmlIW2WO
	bG2rG0TVoW5p9YkuuEgMatUFbkLvWncAP4TyIIzuG5aiRgjh4dv7k7MuR12XsTY52/aWnsJKJ84S4
	617Pnd50n3Q+YFAnJDhhwPhQ7TyJEKFtJqo0dEWskN3ES1lUL8QVkKDvKczfdWVoDbZUMos/i1P9e
	OJlE2l7XvXKP4N4hVTCuGUMxZ6DSfvojFF91YVv+DRif0Sc1mFgZSBvgf7WB32AjwmIgT3UFhG6V9
	tkoZOr0jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfwEJ-0005ec-3I; Fri, 20 Nov 2020 02:32:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfwEG-0005dZ-2t; Fri, 20 Nov 2020 02:32:53 +0000
X-UUID: 1aaad086aefe4bb99489df8d5d93a6d4-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=n/aNWIenGoXWcckC883otYqC5MohkTpPEmWjEeDmBgo=; 
 b=IbRoqygE08srJCd7OTKZutOHbRtLB36/UvRW5XQj91sbWHC+UAVj1RxDDpsys6F+OFW1BEIitlnr5kBnfzyHAS0gahcUApqMQUlsowSsUHxPT7hI39l0RiaFXfNxMF2abz2NuCs+ODjaRD8wIMgSJ/XsvZnXI3kfZtjIdTjm660=;
X-UUID: 1aaad086aefe4bb99489df8d5d93a6d4-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1162484477; Thu, 19 Nov 2020 18:32:46 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 18:22:46 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 20 Nov 2020 10:22:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 10:22:35 +0800
Message-ID: <1605838955.31607.43.camel@mhfsdcap03>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: convert MIP DSI PHY binding
 to YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 20 Nov 2020 10:22:35 +0800
In-Reply-To: <CAAOTY_81uZ7MY1ZyfsyYL_62wkNvG2VCT3+G4Zr1bZBG9_Yg1w@mail.gmail.com>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-7-chunfeng.yun@mediatek.com>
 <CAAOTY_81uZ7MY1ZyfsyYL_62wkNvG2VCT3+G4Zr1bZBG9_Yg1w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 68FF507287B0184E20B752119AB5D2D9DF0D46B75813DAA2C10B3A66426E71782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_213252_451972_08B72813 
X-CRM114-Status: GOOD (  25.37  )
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
Cc: DTML <devicetree@vger.kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Kishon
 Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, "David S .
 Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIwLTExLTIwIGF0IDA3OjM4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bmZlbmc6DQo+IA0KPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+IOaWvCAyMDIw5bm0MTHmnIgxOOaXpSDpgLHkuIkg5LiL5Y2INDoyMeWvq+mBk++8mg0K
PiA+DQo+ID4gQ29udmVydCBNSVBJIERTSSBQSFkgYmluZGluZyB0byBZQU1MIHNjaGVtYSBtZWRp
YXRlayxkc2ktcGh5LnlhbWwNCj4gPg0KPiA+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5n
Lnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gdjM6IG5ldyBwYXRjaA0KPiA+IC0tLQ0K
PiA+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0ICAgICAgICAgfCAxOCAr
LS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sICAgICAgICB8
IDgzICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQNCj4gPiBpbmRleCBmMDZm
MjRkNDA1YTUuLjgyMzhhODY2ODZiZSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0DQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZHNpLnR4dA0KPiA+IEBAIC0yMiwyMyArMjIsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0
aWVzOg0KPiA+ICBNSVBJIFRYIENvbmZpZ3VyYXRpb24gTW9kdWxlDQo+ID4gID09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NCj4gPg0KPiA+IC1UaGUgTUlQSSBUWCBjb25maWd1cmF0aW9uIG1v
ZHVsZSBjb250cm9scyB0aGUgTUlQSSBELVBIWS4NCj4gPiAtDQo+ID4gLVJlcXVpcmVkIHByb3Bl
cnRpZXM6DQo+ID4gLS0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1taXBpLXR4Ig0KPiA+
IC0tIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTczIGFuZCBtdDgx
ODMuDQo+ID4gLS0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUg
Y29udHJvbGxlcidzIHJlZ2lzdGVycw0KPiA+IC0tIGNsb2NrczogUExMIHJlZmVyZW5jZSBjbG9j
aw0KPiA+IC0tIGNsb2NrLW91dHB1dC1uYW1lczogbmFtZSBvZiB0aGUgb3V0cHV0IGNsb2NrIGxp
bmUgdG8gdGhlIERTSSBlbmNvZGVyDQo+ID4gLS0gI2Nsb2NrLWNlbGxzOiBtdXN0IGJlIDwwPjsN
Cj4gPiAtLSAjcGh5LWNlbGxzOiBtdXN0IGJlIDwwPi4NCj4gPiAtDQo+ID4gLU9wdGlvbmFsIHBy
b3BlcnRpZXM6DQo+ID4gLS0gZHJpdmUtc3RyZW5ndGgtbWljcm9hbXA6IGFkanVzdCBkcml2aW5n
IGN1cnJlbnQsIHNob3VsZCBiZSAzMDAwIH4gNjAwMC4gQW5kDQo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGhlIHN0ZXAgaXMgMjAwLg0KPiA+
IC0tIG52bWVtLWNlbGxzOiBBIHBoYW5kbGUgdG8gdGhlIGNhbGlicmF0aW9uIGRhdGEgcHJvdmlk
ZWQgYnkgYSBudm1lbSBkZXZpY2UuIElmDQo+ID4gLSAgICAgICAgICAgICAgIHVuc3BlY2lmaWVk
IGRlZmF1bHQgdmFsdWVzIHNoYWxsIGJlIHVzZWQuDQo+ID4gLS0gbnZtZW0tY2VsbC1uYW1lczog
U2hvdWxkIGJlICJjYWxpYnJhdGlvbi1kYXRhIg0KPiA+ICtTZWUgcGh5L21lZGlhdGVrLGRzaS1w
aHkueWFtbA0KPiA+DQo+ID4gIEV4YW1wbGU6DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFt
bA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44N2Y4
ZGYyNTFhYjANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwNCj4gPiBAQCAtMCwwICsx
LDgzIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKQ0KPiA+ICsjIENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlaw0KPiA+ICsl
WUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogTWVk
aWFUZWsgTUlQSSBEaXNwbGF5IFNlcmlhbCBJbnRlcmZhY2UgKERTSSkgUEhZIGJpbmRpbmcNCj4g
PiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+DQo+ID4gKyAgLSBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRp
YXRlay5jb20+DQo+IA0KPiBQbGVhc2UgYWRkIFBoaWxpcHAgWmFiZWwgYmVjYXVzZSBoZSBpcyBN
ZWRpYXRlayBEUk0gZHJpdmVyIG1haW50YWluZXIuDQpPaw0KPiANCj4gRFJNIERSSVZFUlMgRk9S
IE1FRElBVEVLDQo+IE06IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0K
PiBNOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBMOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFM6IFN1cHBvcnRlZA0KPiBGOiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay8NCj4gDQo+ID4gKw0KPiA+
ICtkZXNjcmlwdGlvbjogVGhlIE1JUEkgRFNJIFBIWSBzdXBwb3J0cyB1cCB0byA0LWxhbmUgb3V0
cHV0Lg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICAkbm9kZW5hbWU6DQo+ID4gKyAg
ICBwYXR0ZXJuOiAiXmRzaS1waHlAWzAtOWEtZl0rJCINCj4gPiArDQo+ID4gKyAgY29tcGF0aWJs
ZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQyNzAxLW1pcGktdHgN
Cj4gPiArICAgICAgLSBtZWRpYXRlayxtdDc2MjMtbWlwaS10eA0KPiA+ICsgICAgICAtIG1lZGlh
dGVrLG10ODE3My1taXBpLXR4DQo+IA0KPiBBZGQgbWVkaWF0ZWssbXQ4MTgzLW1pcGktdHgNCk9r
LCB3aWxsIGFkZCBpdA0KDQpUaGFua3MNCg0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4N
Cj4gDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+
ICsgIGNsb2NrczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBQ
TEwgcmVmZXJlbmNlIGNsb2NrDQo+ID4gKw0KPiA+ICsgIGNsb2NrLW91dHB1dC1uYW1lczoNCj4g
PiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgICIjcGh5LWNlbGxzIjoNCj4gPiArICAg
IGNvbnN0OiAwDQo+ID4gKw0KPiA+ICsgICIjY2xvY2stY2VsbHMiOg0KPiA+ICsgICAgY29uc3Q6
IDANCj4gPiArDQo+ID4gKyAgbnZtZW0tY2VsbHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+
ICsgICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSB0byB0aGUgY2FsaWJyYXRpb24gZGF0YSBwcm92
aWRlZCBieSBhIG52bWVtIGRldmljZSwNCj4gPiArICAgICAgaWYgdW5zcGVjaWZpZWQsIGRlZmF1
bHQgdmFsdWVzIHNoYWxsIGJlIHVzZWQuDQo+ID4gKw0KPiA+ICsgIG52bWVtLWNlbGwtbmFtZXM6
DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogY2FsaWJyYXRpb24tZGF0YQ0K
PiA+ICsNCj4gPiArICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcDoNCj4gPiArICAgIGRlc2NyaXB0
aW9uOiBhZGp1c3QgZHJpdmluZyBjdXJyZW50LCB0aGUgc3RlcCBpcyAyMDAuDQo+ID4gKyAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgIG1p
bmltdW06IDIwMDANCj4gPiArICAgIG1heGltdW06IDYwMDANCj4gPiArICAgIGRlZmF1bHQ6IDQ2
MDANCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0g
cmVnDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIGNsb2NrLW91dHB1dC1uYW1lcw0KPiA+ICsg
IC0gIiNwaHktY2VsbHMiDQo+ID4gKyAgLSAiI2Nsb2NrLWNlbGxzIg0KPiA+ICsNCj4gPiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAt
IHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDgxNzMtY2xrLmg+DQo+
ID4gKyAgICBkc2ktcGh5QDEwMjE1MDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE3My1taXBpLXR4IjsNCj4gPiArICAgICAgICByZWcgPSA8MHgxMDIxNTAwMCAw
eDEwMDA+Ow0KPiA+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrMjZtPjsNCj4gPiArICAgICAgICBj
bG9jay1vdXRwdXQtbmFtZXMgPSAibWlwaV90eDBfcGxsIjsNCj4gPiArICAgICAgICBkcml2ZS1z
dHJlbmd0aC1taWNyb2FtcCA9IDw0MDAwPjsNCj4gPiArICAgICAgICBudm1lbS1jZWxscz0gPCZt
aXBpX3R4X2NhbGlicmF0aW9uPjsNCj4gPiArICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gImNh
bGlicmF0aW9uLWRhdGEiOw0KPiA+ICsgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsNCj4gPiAr
ICAgICAgICAjcGh5LWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgfTsNCj4gPiArDQo+ID4gKy4uLg0K
PiA+IC0tDQo+ID4gMi4xOC4wDQo+ID4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
