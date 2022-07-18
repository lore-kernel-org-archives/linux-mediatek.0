Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA661C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eva0NwlnqNZPZwrwNf1a9kwaYA+ria+JQyV4sg1wSSU=; b=GCvoeVjNQ8kEdoclemzjT4oIrL
	CjQv0bv5m1pvfCYFxDfr0x0xN6rarZuWcxTgKP8uw0j6IgmRz2EFLN15/Wfr58njLqcao1Ufda6Bu
	30NeILALmJXGzrcE/bmkoBXBkH9Augm/qvi3k6oz6Q2ZWMm+1fTNDlYWVphJavZfAWAZYw6vDm0ne
	dYBHFCWATzkMQldqpwQJ1HQ0BStZuCpHvMTRMBxqGtgbhKkw6Oi8GrpGNSbhZPFe/DxMNTdaBbhI3
	l8XUrPG7Tv3EoyD+eHunEt49UJ6ua4pnYb6nGprjM3RE7wdLA87qTK7KF9+pTHdSTeO8C8mywYuMN
	wbkd9KzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMje-00C0Wj-Nm; Mon, 18 Jul 2022 09:08:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMjY-00C0Ug-2A; Mon, 18 Jul 2022 09:08:09 +0000
X-UUID: 3d420ac4791743af9c876107649a2874-20220718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eva0NwlnqNZPZwrwNf1a9kwaYA+ria+JQyV4sg1wSSU=;
	b=Yj+/Suzpo6da48ULqbqci/xCcyaD2EXwO5Csb5XNqOrNanfAEKEK/2jd5QUa80jdmYK1BBJMAXIlQvCeNjxv3x4u6njWnD+6B3df5l30f8KdSv7g1VfVauBRZBSYGsUHxj9FSYlb2IIMTA9ptNz75ziqyh6N+Ff/B+Jf9LRK8R4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:17ee6708-6401-4edf-b563-dbd5d47c10c4,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:6e93c7d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3d420ac4791743af9c876107649a2874-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 992349097; Mon, 18 Jul 2022 02:08:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 18 Jul 2022 16:27:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 18 Jul 2022 16:27:27 +0800
Message-ID: <c9ca42e886bd15ca8b61203d028fe034cfe70b08.camel@mediatek.com>
Subject: Re: [V5,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Irui Wang <irui.wang@mediatek.com>
CC: <wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>, Tomasz
 Figa <tfiga@chromium.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, <xia.jiang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<nicolas.dufresne@collabora.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<linux-kernel@vger.kernel.org>, <maoguang.meng@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	<srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Mon, 18 Jul 2022 16:27:27 +0800
In-Reply-To: <1658108601.891612.1667781.nullmailer@robh.at.kernel.org>
References: <20220716093408.29734-1-irui.wang@mediatek.com>
	 <20220716093408.29734-2-irui.wang@mediatek.com>
	 <1658108601.891612.1667781.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_020808_142496_31A6DA91 
X-CRM114-Status: GOOD (  20.30  )
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

T24gU3VuLCAyMDIyLTA3LTE3IGF0IDE5OjQzIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gU2F0LCAxNiBKdWwgMjAyMiAxNzozNDowMSArMDgwMCwgSXJ1aSBXYW5nIHdyb3RlOg0KPiA+
IEZyb206IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRkIG1l
ZGlhdGVrLG10ODE5NS1qcGdkZWMgY29tcGF0aWJsZSB0byBiaW5kaW5nIGRvY3VtZW50Lg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogaXJ1aSB3YW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+
IA0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWEvbWVkaWF0ZWssbXQ4MTk1LWpwZWdkZWMueWFtbCAg
ICAgICAgfCAxNjANCj4gPiArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDE2MCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxOTUtDQo+ID4ganBl
Z2RlYy55YW1sDQo+ID4gDQo+IA0KPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2Ug
RFRfQ0hFQ0tFUl9GTEFHUz0tbQ0KPiBkdF9iaW5kaW5nX2NoZWNrJw0KPiBvbiB5b3VyIHBhdGNo
IChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6DQo+IA0KPiB5YW1sbGludCB3YXJu
aW5ncy9lcnJvcnM6DQo+IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L21lZGlhdGVrLG10ODE5NS0NCj4ganBlZ2RlYy55YW1sOjk4OjU6IFt3YXJuaW5nXSB3cm9uZyBp
bmRlbnRhdGlvbjogZXhwZWN0ZWQgMiBidXQgZm91bmQNCj4gNCAoaW5kZW50YXRpb24pDQo+IC4v
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0N
Cj4ganBlZ2RlYy55YW1sOjEwMjo5OiBbZXJyb3JdIHN5bnRheCBlcnJvcjogZXhwZWN0ZWQgPGJs
b2NrIGVuZD4sIGJ1dA0KPiBmb3VuZCAnPHNjYWxhcj4nIChzeW50YXgpDQo+IC4vRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4ganBlZ2Rl
Yy55YW1sOjExMzoxNzogW3dhcm5pbmddIHdyb25nIGluZGVudGF0aW9uOiBleHBlY3RlZCAwIGJ1
dA0KPiBmb3VuZCAxNiAoaW5kZW50YXRpb24pDQo+IA0KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3Mv
ZXJyb3JzOg0KPiBtYWtlWzFdOiAqKiogRGVsZXRpbmcgZmlsZQ0KPiAnRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4ganBlZ2RlYy5leGFt
cGxlLmR0cycNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLG10ODE5NS0NCj4ganBlZ2RlYy55YW1sOjEwMjo5OiBkaWQgbm90IGZpbmQgZXhwZWN0ZWQg
a2V5DQo+IG1ha2VbMV06ICoqKiBbRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL01h
a2VmaWxlOjI2Og0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVk
aWF0ZWssbXQ4MTk1LQ0KPiBqcGVnZGVjLmV4YW1wbGUuZHRzXSBFcnJvciAxDQo+IG1ha2VbMV06
ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQo+IC4vRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4ganBlZ2RlYy55YW1s
OjEwMjo5OiBkaWQgbm90IGZpbmQgZXhwZWN0ZWQga2V5DQo+IC9idWlsZHMvcm9iaGVycmluZy9s
aW51eC1kdC0NCj4gcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlayxtdDgxOTUtDQo+IGpwZWdkZWMueWFtbDogaWdub3JpbmcsIGVycm9yIHBhcnNp
bmcgZmlsZQ0KPiBtYWtlOiAqKiogW01ha2VmaWxlOjE0MDQ6IGR0X2JpbmRpbmdfY2hlY2tdIEVy
cm9yIDINCj4gDQo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6DQo+
IA0KPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8NCj4gDQo+IFRoaXMg
Y2hlY2sgY2FuIGZhaWwgaWYgdGhlcmUgYXJlIGFueSBkZXBlbmRlbmNpZXMuIFRoZSBiYXNlIGZv
ciBhDQo+IHBhdGNoDQo+IHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIG1vc3QgcmVjZW50IHJjMS4N
Cj4gDQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlk
bid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcg
aXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXANCj4gdG8NCj4gZGF0ZToNCj4gDQo+IHBp
cDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUNCj4gDQo+IFBsZWFzZSBjaGVjayBhbmQgcmUt
c3VibWl0Lg0KPiANCkhpIFJvYiwNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCkFmdGVyIHVw
ZGF0ZWQgZHRzY2hlbWEsIEkgbWV0IHRoZSBlcnJvcnMgeW91IHNob3duIGFib3ZlLA0KSSB3aWxs
IGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUu
DQo=


