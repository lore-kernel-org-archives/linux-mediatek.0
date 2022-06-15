Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E909C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMT9HwkV5Sr3cybdpnf6A2B99Y6v89H++a7JOt9xYvU=; b=gOp0w2AMtnSnTq5d+BwNsLSAT8
	ssemZLen1OS3MUMdqZciZ+9s2La/f9ST32mwgh4qVKqWn4iZRJDT8H57eHMj1SuC9zUnFPKH4q/RL
	NQmzmzhz53/GMJNGq1IVTeX04zCPcJsQlxWUVXgtutDXtrOvjRXFA6SaqDqeIi2ApzhOif9Lcrtpo
	q28Bg0ggaUFTn4/gSjVbPGOAslRCUrw7z8bmjt8lyhlPTK2HMLER4nKKZ7nN92ExMe/XxIKKAeDEt
	wRxcuxDcG6rtLcOQDLKC71mbrG5zAqgLcKjwTBblNUeP786Okvz0ue6WxZm0yAzZjXjYZYfH4cXKB
	FKHGOVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RLa-00EDRf-1l; Wed, 15 Jun 2022 11:38:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RLP-00EDO4-5C; Wed, 15 Jun 2022 11:37:56 +0000
X-UUID: d2e8b360e5cc420ba3bff9919aeb96eb-20220615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NMT9HwkV5Sr3cybdpnf6A2B99Y6v89H++a7JOt9xYvU=;
	b=XBZCdvlb9WM9JGkKT4lBf+Gf0FgPLGg0aKBgIw7Oguh2qaqbU/2ozAScE0hhIlAppUwxZFm6bOyg+Y2vtLEQpyTMfrQcEw58zDnMtrGIMbtNlmToVZkipUCVsATdFZi4Nl6Wic/DHb3IBBRtV7ADu/JKVNUlyT6BdpJzHxfAkrI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:a8f6cda9-5aa8-40df-9630-94ac67f685f7,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:d08655f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d2e8b360e5cc420ba3bff9919aeb96eb-20220615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1345307812; Wed, 15 Jun 2022 04:37:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 04:37:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 15 Jun 2022 19:37:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 15 Jun 2022 19:37:42 +0800
Message-ID: <2ebaa25205d651b2f6a62e3a02c0ccab5199a165.camel@mediatek.com>
Subject: Re: [PATCH v4, 0/3] add h264 decoder driver for mt8186
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Alexandre Courbot
	<acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 15 Jun 2022 19:37:41 +0800
In-Reply-To: <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
	 <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_043755_239137_35E7C313 
X-CRM114-Status: GOOD (  24.20  )
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

SGkgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KT24gTW9uLCAyMDIyLTA2
LTEzIGF0IDE2OjEwIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3RlOg0KPiA+IA0KDQo+IExl
IGpldWRpIDEyIG1haSAyMDIyIMOgIDExOjQ2ICswODAwLCBZdW5mZWkgRG9uZyBhIMOpY3JpdCA6
DQo+ID4gRmlyc3RseSwgYWRkIG10ODE4NiBjb21wYXRpYmxlIGFuZCBwcml2YXRlIGRhdGEsIHRo
ZW4gYWRkIGRvY3VtZW50DQo+ID4gZm9yDQo+ID4gY29tcGF0aWJsZSAibWVkaWF0ZWssbXQ4MTg2
LXZjb2RlYy1kZWMiLiBGb3IgbXQ4MTg2IGlzIHNpbmdsZSBjb3JlDQo+ID4gYXJjaGl0ZWN0dXJl
LCBuZWVkIHRvIGFkZCBuZXcgaW50ZXJmYWNlIGZvciBoMjY0IGhhcmR3YXJlIGRlY29kZXIuDQo+
IA0KPiBXb3VsZCBiZSBuaWNlIHRvIHRha2UgdGhlIGhhYml0IG9mIHNoYXJpbmcgZmx1c3RlciBz
Y29yZSBmb3IgdGhpcyBuZXcNCj4gSFcsIEkNCj4gd291bGQgZXhwZWN0IG5vIGxlc3MgdGhlbiB3
aGF0IHRoZSBudW1iZXJzIHlvdSdkIGdldCBmcm9tIHJ1bm5pbmcNCj4gb3ZlciBNVDgxOTUgb3IN
Cj4gOTIsIHJlbWFpbnMgbmljZSB0byBkZW1vbnN0cmF0ZSB0aGF0IHRoaXMgd2FzIHRlc3RlZCBh
bmQgZG9jdW1lbnQgYW55DQo+IG9vcHMgYWxvbmcNCj4gdGhlIHdheS4NCkZvciB3ZSBkb24ndCBz
ZXR1cCBtdDgxODYgZmx1c3RlciB0ZXN0IGVudmlyb25tZW50LiBTbyBub3QgdG8gcnVuDQpmbHVz
dGVyIGluIG10ODE4Ni4gQWNjb3JkaW5nIHRvIG91ciBwbGFuLCB3ZSB3aWxsIGRvIGZsdXN0ZXIg
dGVzdCBmb3INCmV2ZXJ5IHByb2plY3QgYmVnaW4gZnJvbSBtdDgxODguDQoNCldoZW4gSSdtIGZy
ZWUsIHdlIGNvbnRpbnVlIHRvIHNldHVwIHRoZSBmbHVzdGVyIHRlc3QgZW52aXJvbm1lbnQgZm9y
DQptdDgxODYuDQoNClRoYW5rcywNCll1bmZlaSBEb25nDQo+ID4gUGF0Y2hlIDEgYWRkIG10ODE4
NiBjb21wYXRpYmxlIGFuZCBwcml2YXRlIGRhdGEuDQo+ID4gUGF0Y2hlIDIgYWRkIG10ODE4NiBj
b21wYXRpYmxlIGRvY3VtZW50Lg0KPiA+IFBhdGNoZSAzIGFkZCBoMjY0IHNpbmdsZSBjb3JlIGRy
aXZlci4NCj4gPiAtLS0NCj4gPiBUaGlzIHBhdGNoIGRlcGVuZHMgb24gInN1cHBvcnQgZm9yIE1U
ODE5MiBkZWNvZGVyIlsxXQ0KPiA+IA0KPiA+IFsxXSAgDQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2NvdmVyLzIwMjIwNTEyMDIxOTUwLjI5
MDg3LTEteXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tLw0KPiA+IC0tLQ0KPiA+IGNoYW5nZWQgd2l0
aCB2MzoNCj4gPiAtIGZpeCBfX2lvbWVtIG5vdCByZWFzb25hYmxlLCBhbGlnbiBzaGFyZSBtZW1v
cnkgdG8gZHJhbS4NCj4gPiBjaGFuZ2VkIHdpdGggdjI6DQo+ID4gLSBmaXggc3BhcnNlIGFuZCBz
bWF0Y2ggY2hlY2sgZmFpbCBmb3IgcGF0Y2ggMw0KPiA+IGNoYW5nZWQgd2l0aCB2MToNCj4gPiAt
IHJlYmFzZSBkcml2ZXIgdG8gdGhlIGxhdGVzdCBtZWRpYV9zdGFnZS4NCj4gPiAtLS0NCj4gPiBZ
dW5mZWkgRG9uZyAoMyk6DQo+ID4gICBkdC1iaW5kaW5nczogbWVkaWE6IG1lZGlhdGVrOiB2Y29k
ZWM6IEFkZHMgZGVjb2RlciBkdC1iaW5kaW5ncw0KPiA+IGZvcg0KPiA+ICAgICBtdDgxODYNCj4g
PiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBTdXBwb3J0IE1UODE4Ng0KPiA+ICAgbWVkaWE6
IG1lZGlhdGVrOiB2Y29kZWM6IGFkZCBoMjY0IGRlY29kZXIgZHJpdmVyIGZvciBtdDgxODYNCj4g
PiANCj4gPiAgLi4uL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sIHwg
ICA0ICstDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWMu
aCB8ICAgMSArDQo+ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMg
ICAgICB8ICAgNCArDQo+ID4gIC4uLi92Y29kZWMvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMg
ICAgICAgICB8ICAxOSArKw0KPiA+ICAuLi4vdmNvZGVjL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0
aV9pZi5jICAgICAgfCAxNzcNCj4gPiArKysrKysrKysrKysrKysrKy0NCj4gPiAgNSBmaWxlcyBj
aGFuZ2VkLCAyMDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gDQo+IA0K


