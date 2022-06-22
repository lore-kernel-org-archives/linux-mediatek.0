Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B07DCCA473
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 01:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF6njo0rxZBdFTdT2Hlk9bVVouOdMdVuKTFLpdF2198=; b=G7HKl7+mPFdsUft/bU/H91YZnX
	6H9MyuVPMOdyOeAJLAUeLIHIxsurc3ddFnaRwdkydH/ZaLg2kL/svXDSdJSD0IqBf+KFGC+Oail9A
	0CgGv0YeI8CD5MEUdsRbucz9zQER2fKme2yIz2QuMxvn7Kbl0omMN8AVVVHH7ZX1U+MFtIpjXtdlB
	QXFT3R/9fYkogV6x4+TXB0dMgpn3EIZEqsUeRxaK73m2MDnRzvIRiTEQRRKvOSDzDUUM3xEkgYhiu
	Bvl1R6ycjsYtVS9Wbb5+yQ1u23HoXRCJ+uIJJD9J8ivoO/eq3PCiTemfP2lMyieSKy4MEcFXbjwix
	xHM7t6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pU7-0083Cq-Jk; Wed, 22 Jun 2022 01:48:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pTl-00835I-6r; Wed, 22 Jun 2022 01:48:26 +0000
X-UUID: 86a0703af9d3428a942178a521a88ef9-20220621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vF6njo0rxZBdFTdT2Hlk9bVVouOdMdVuKTFLpdF2198=;
	b=ozLLF5LzdlecjtfL4vXW2x3aQBtQu1OLoW6U66qfXqk7zNO5ACLJsDWrTKUuTMSALz0WN0G/xKmf+5E94XSQzXQLKFFpnauWSlYIlX/WkQtCJmNZacYigRovFfnqsoym7VPcqQroGQzHuCUx55TzG8yz/DQbaz91rLa1PrYI6qY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:eac40c69-42be-46f7-a0dd-4e48365888c1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:9f271d38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 86a0703af9d3428a942178a521a88ef9-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1748332446; Tue, 21 Jun 2022 18:48:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 18:42:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 09:42:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 09:42:47 +0800
Message-ID: <6ad2fd7b3fc961f7018e189e2f11219bf7216757.camel@mediatek.com>
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
Date: Wed, 22 Jun 2022 09:42:47 +0800
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
X-CRM114-CacheID: sfid-20220621_184825_287268_EEAD52C6 
X-CRM114-Status: GOOD (  26.88  )
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
dWJtaXNzaW9uIHRvIGxpbmsgdG8gPw0KPiANClllcywgbmVlZCBzY3AuaW1nIHRvIHRlc3QgbXQ4
MTg2Lg0KQnV0IG5vdCBhbGwgcGF0Y2hlcyBhcmUgbWVyZ2VkIG5vdywgd2UgYXJlIHRlc3Rpbmcg
dGhlIGRyaXZlciwgd2lsbA0Kc2VuZCBzY3AuaW1nIGluIHRoZSBtaWRkbGUgb2YganVseS4NCg0K
QmVzdCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCj4gPiA+IC0tLQ0KPiA+ID4gY2hhbmdlZCB3aXRo
IHYzOg0KPiA+ID4gLSBmaXggX19pb21lbSBub3QgcmVhc29uYWJsZSwgYWxpZ24gc2hhcmUgbWVt
b3J5IHRvIGRyYW0uDQo+ID4gPiBjaGFuZ2VkIHdpdGggdjI6DQo+ID4gPiAtIGZpeCBzcGFyc2Ug
YW5kIHNtYXRjaCBjaGVjayBmYWlsIGZvciBwYXRjaCAzDQo+ID4gPiBjaGFuZ2VkIHdpdGggdjE6
DQo+ID4gPiAtIHJlYmFzZSBkcml2ZXIgdG8gdGhlIGxhdGVzdCBtZWRpYV9zdGFnZS4NCj4gPiA+
IC0tLQ0KPiA+ID4gWXVuZmVpIERvbmcgKDMpOg0KPiA+ID4gICBkdC1iaW5kaW5nczogbWVkaWE6
IG1lZGlhdGVrOiB2Y29kZWM6IEFkZHMgZGVjb2RlciBkdC1iaW5kaW5ncw0KPiA+ID4gZm9yDQo+
ID4gPiAgICAgbXQ4MTg2DQo+ID4gPiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBTdXBwb3J0
IE1UODE4Ng0KPiA+ID4gICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogYWRkIGgyNjQgZGVjb2Rl
ciBkcml2ZXIgZm9yIG10ODE4Ng0KPiA+ID4gDQo+ID4gPiAgLi4uL21lZGlhL21lZGlhdGVrLHZj
b2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sIHwgICA0ICstDQo+ID4gPiAgLi4uL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5oIHwgICAxICsNCj4gPiA+ICAuLi4vbWVkaWF0
ZWsvdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jICAgICAgfCAgIDQgKw0KPiA+ID4gIC4uLi92
Y29kZWMvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMgICAgICAgICB8ICAxOSArKw0KPiA+ID4g
IC4uLi92Y29kZWMvdmRlYy92ZGVjX2gyNjRfcmVxX211bHRpX2lmLmMgICAgICB8IDE3Nw0KPiA+
ID4gKysrKysrKysrKysrKysrKystDQo+ID4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAyMDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiANCj4gDQo=


