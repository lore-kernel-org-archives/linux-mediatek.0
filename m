Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ED7C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nYO/sjQU/RUAOaFCIXJtrIKCPvcXwi3Je+sYdFBDcI=; b=NrY1bimY9TxHgXbyCezfBD2Ngw
	jKRt0amsu/+muDhplIkbvBmc0gOwm0adJ8j5F+KUG92/4i4088Z322DO/f0iz1oMsl16MSZiERDo6
	AYSFM/50M5kMo/xD3c8YjjCGv/7CsIAOS+SUkaXsVvOnF7sIDpAMmoTXZn9aP+eYF4q7S7fSQER2V
	C24DpUpUb838GW/f11GUv3Z2/5pGhXJvmk+TdBPnJnd6yQIUvqCq8KZuuXtzJ971NYih1XOOxUeeo
	B1pTJtBy26YaMlj6HGj2J+KQ2oq8efDspIyDLZajyw7CtBSW/TVBr6c663IUdzWm50IFu2n7qoGrl
	3wRkzrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RTI-00EFPM-Bf; Wed, 15 Jun 2022 11:46:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RT7-00EFNQ-HD; Wed, 15 Jun 2022 11:45:55 +0000
X-UUID: c3ca8da6b380485b85d924172815face-20220615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/nYO/sjQU/RUAOaFCIXJtrIKCPvcXwi3Je+sYdFBDcI=;
	b=vGo6VJWejIfXEwPtkXtOJgRLiOT94/5+OhCo/jfYwFfHcCDf1KzTpUz5WL3I7wTycs57GazTgfZCZPnIQrJV5oVk/tzvfWV2F8cP+XJka+FAoOnSX/PUcZkAY0puWlQPp/8D//TI8pGYRx0n9QGbmeqY+MG/dU2eoAkx+5s0b4c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:7cddc96f-be76-43f3-8192-4b03fbb7913b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:ab0f9948-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c3ca8da6b380485b85d924172815face-20220615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 449449712; Wed, 15 Jun 2022 04:45:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 04:43:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Jun 2022 19:43:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 15 Jun 2022 19:43:25 +0800
Message-ID: <3e084cf745e1425084186368c867f54b54c91ce6.camel@mediatek.com>
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
Date: Wed, 15 Jun 2022 19:43:25 +0800
In-Reply-To: <5316234cef174e49110f949991ef71c578a3478e.camel@ndufresne.ca>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
	 <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
	 <5316234cef174e49110f949991ef71c578a3478e.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_044553_618372_39364F11 
X-CRM114-Status: GOOD (  26.67  )
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

SGkgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KT24gVHVlLCAyMDIyLTA2
LTE0IGF0IDEzOjQ2IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3RlOg0KPiBMZSBsdW5kaSAx
MyBqdWluIDIwMjIgw6AgMTY6MTAgLTA0MDAsIE5pY29sYXMgRHVmcmVzbmUgYSDDqWNyaXQgOg0K
PiA+IExlIGpldWRpIDEyIG1haSAyMDIyIMOgIDExOjQ2ICswODAwLCBZdW5mZWkgRG9uZyBhIMOp
Y3JpdCA6DQo+ID4gPiBGaXJzdGx5LCBhZGQgbXQ4MTg2IGNvbXBhdGlibGUgYW5kIHByaXZhdGUg
ZGF0YSwgdGhlbiBhZGQNCj4gPiA+IGRvY3VtZW50IGZvcg0KPiA+ID4gY29tcGF0aWJsZSAibWVk
aWF0ZWssbXQ4MTg2LXZjb2RlYy1kZWMiLiBGb3IgbXQ4MTg2IGlzIHNpbmdsZQ0KPiA+ID4gY29y
ZQ0KPiA+ID4gYXJjaGl0ZWN0dXJlLCBuZWVkIHRvIGFkZCBuZXcgaW50ZXJmYWNlIGZvciBoMjY0
IGhhcmR3YXJlDQo+ID4gPiBkZWNvZGVyLg0KPiA+IA0KPiA+IFdvdWxkIGJlIG5pY2UgdG8gdGFr
ZSB0aGUgaGFiaXQgb2Ygc2hhcmluZyBmbHVzdGVyIHNjb3JlIGZvciB0aGlzDQo+ID4gbmV3IEhX
LCBJDQo+ID4gd291bGQgZXhwZWN0IG5vIGxlc3MgdGhlbiB3aGF0IHRoZSBudW1iZXJzIHlvdSdk
IGdldCBmcm9tIHJ1bm5pbmcNCj4gPiBvdmVyIE1UODE5NSBvcg0KPiA+IDkyLCByZW1haW5zIG5p
Y2UgdG8gZGVtb25zdHJhdGUgdGhhdCB0aGlzIHdhcyB0ZXN0ZWQgYW5kIGRvY3VtZW50DQo+ID4g
YW55IG9vcHMgYWxvbmcNCj4gPiB0aGUgd2F5Lg0KPiA+ID4gDQo+ID4gPiBQYXRjaGUgMSBhZGQg
bXQ4MTg2IGNvbXBhdGlibGUgYW5kIHByaXZhdGUgZGF0YS4NCj4gPiA+IFBhdGNoZSAyIGFkZCBt
dDgxODYgY29tcGF0aWJsZSBkb2N1bWVudC4NCj4gPiA+IFBhdGNoZSAzIGFkZCBoMjY0IHNpbmds
ZSBjb3JlIGRyaXZlci4NCj4gPiA+IC0tLQ0KPiA+ID4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uICJz
dXBwb3J0IGZvciBNVDgxOTIgZGVjb2RlciJbMV0NCj4gPiA+IA0KPiA+ID4gWzFdICANCj4gPiA+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9jb3Zl
ci8yMDIyMDUxMjAyMTk1MC4yOTA4Ny0xLXl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbS8NCj4gDQo+
IEkgZm9yZ290IGVhcmxpZXIsIGJ1dCBJIHN1cHBvc2UgdGhpcyB3aWxsIGFsc28gZGVwZW5kcyBv
biBhbiBzY3AuaW1nDQo+IGZpcm13YXJlID8NCj4gSWYgc28sIGFueSBsaW51eC1maXJtd2FyZSBz
dWJtaXNzaW9uIHRvIGxpbmsgdG8gPw0KPiANCkZvciB0aGUgdGFzdC9jdHMvZ3RzIHRlc3QgYXJl
IGNvbWluZyB0byB0aGUgZW5kLCBhZnRlciBhbGwgZWMgcGF0Y2hlcw0KYXJlIG1lcmdlZCwgSSB3
aWxsIHVwc3RyZWFtIHNjcC5pbWcNCg0KQmVzdCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCj4gPiA+
IC0tLQ0KPiA+ID4gY2hhbmdlZCB3aXRoIHYzOg0KPiA+ID4gLSBmaXggX19pb21lbSBub3QgcmVh
c29uYWJsZSwgYWxpZ24gc2hhcmUgbWVtb3J5IHRvIGRyYW0uDQo+ID4gPiBjaGFuZ2VkIHdpdGgg
djI6DQo+ID4gPiAtIGZpeCBzcGFyc2UgYW5kIHNtYXRjaCBjaGVjayBmYWlsIGZvciBwYXRjaCAz
DQo+ID4gPiBjaGFuZ2VkIHdpdGggdjE6DQo+ID4gPiAtIHJlYmFzZSBkcml2ZXIgdG8gdGhlIGxh
dGVzdCBtZWRpYV9zdGFnZS4NCj4gPiA+IC0tLQ0KPiA+ID4gWXVuZmVpIERvbmcgKDMpOg0KPiA+
ID4gICBkdC1iaW5kaW5nczogbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IEFkZHMgZGVjb2RlciBk
dC1iaW5kaW5ncw0KPiA+ID4gZm9yDQo+ID4gPiAgICAgbXQ4MTg2DQo+ID4gPiAgIG1lZGlhOiBt
ZWRpYXRlazogdmNvZGVjOiBTdXBwb3J0IE1UODE4Ng0KPiA+ID4gICBtZWRpYTogbWVkaWF0ZWs6
IHZjb2RlYzogYWRkIGgyNjQgZGVjb2RlciBkcml2ZXIgZm9yIG10ODE4Ng0KPiA+ID4gDQo+ID4g
PiAgLi4uL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sIHwgICA0ICst
DQo+ID4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5oIHwg
ICAxICsNCj4gPiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jICAg
ICAgfCAgIDQgKw0KPiA+ID4gIC4uLi92Y29kZWMvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMg
ICAgICAgICB8ICAxOSArKw0KPiA+ID4gIC4uLi92Y29kZWMvdmRlYy92ZGVjX2gyNjRfcmVxX211
bHRpX2lmLmMgICAgICB8IDE3Nw0KPiA+ID4gKysrKysrKysrKysrKysrKystDQo+ID4gPiAgNSBm
aWxlcyBjaGFuZ2VkLCAyMDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+IA0K
PiANCj4gDQo=


