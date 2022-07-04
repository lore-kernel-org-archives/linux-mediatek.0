Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4914FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 07:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Zp0wkX0HDhXeldC/3PpTd3funpHUh49reOH1i8TQEw=; b=B8V7Novb4SaS9DgFZ6OuOmqoiq
	h+hmjjfl2aIAlG6Vq3NCD84Ic15l+JzXW7DLFz+NWQBu8ds6v8eo+pGoWx/LWGGGDk3qGVwyACQXk
	6hvDM8202LeZos8MnapDAF1YS5AHAqktrWrzPXkvzPmwkLPstlk4ab9+4INf68s5r8TUyuUGslkl6
	uFgvwoKELsxFfZh/StqwB3Fg96yMMFy8fS4lqU9z67v6KUqmAm3lpTT24G4SvMCcUHstVjtwEg99U
	7lGNpXAH/FXqUACxVV+DmsYGSXCqf6YW5iX/apJAVclevt2I6GldPhVi8s5Dd5U1RL+3AZkRPp+ex
	5QWDL6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Gto-005r38-B4; Mon, 04 Jul 2022 07:53:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Gtk-005r0K-0T; Mon, 04 Jul 2022 07:53:38 +0000
X-UUID: 672c553628e149c2854320ca41dd620b-20220704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=5Zp0wkX0HDhXeldC/3PpTd3funpHUh49reOH1i8TQEw=;
	b=dhTZ3zoVnEdqhpOBh/HVh5Iq0lrc+hN5la2kBbqQsWVkvQvk5HTkyFejGNAPKm6qjgcaGVVV63QpCpLnydQdlOx0K43ZrFmQeWvkWXKtE5WwXVlsM2UWjMNc4G8MHZNzVktJR8iWMrBHfY0AkCkOQx4d6eRqYcz6xzperATNtDU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f7f53703-0c6e-4a53-8c27-41d0efecf3cb,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:15c789d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 672c553628e149c2854320ca41dd620b-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 920322840; Mon, 04 Jul 2022 00:53:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 4 Jul 2022 15:32:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Jul 2022 15:32:49 +0800
Message-ID: <10de0f13ef5a8423760f13c5a3649ca334e6392b.camel@mediatek.com>
Subject: Re: [PATCH v10 0/2] phy: mediatek: Add PCIe PHY driver
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
	<randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
	<chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
	<jian.yang@mediatek.com>
Date: Mon, 4 Jul 2022 15:32:49 +0800
In-Reply-To: <20220617070246.20142-1-jianjun.wang@mediatek.com>
References: <20220617070246.20142-1-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_005336_102929_04FB97F6 
X-CRM114-Status: GOOD (  20.10  )
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

SGVsbG8gTWFpbnRhaW5lcnMsDQoNCkdlbnRsZSBwaW5nIGZvciB0aGlzIHBhdGNoIHNlcmllcywg
aWYgdGhlcmUgaXMgYW55dGhpbmcgSSBjYW4gZG8gdG8gZ2V0DQp0aGVzZSBwYXRjaGVzIG1lcmdl
ZCwgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQpUaGFua3MuDQoNCk9uIEZyaSwgMjAyMi0wNi0xNyBh
dCAxNTowMiArMDgwMCwgSmlhbmp1biBXYW5nIHdyb3RlOg0KPiBUaGVzZSBzZXJpZXMgcGF0Y2hl
cyBhZGQgc3VwcG9ydCBmb3IgUENJZSBQSFkgZHJpdmVyIG9uIE1lZGlhVGVrDQo+IGNoaXBzZXRz
Lg0KPiANCj4gQ2hhbmdlcyBpbiB2MTA6DQo+IDEuIFNvcnQgdGhlIG9yZGVyIGluIEtjb25maWcg
YW5kIE1ha2VmaWxlLg0KPiANCj4gQ2hhbmdlcyBpbiB2OToNCj4gMS4gQ2hlY2sgaWYgdGhlIHJl
dHVybiB2YWx1ZSBpcyAtRU5PTUVNIHdoZW4gcmVhZGluZyBlZnVzZSBkYXRhDQo+IGZhaWxzLg0K
PiANCj4gQ2hhbmdlcyBpbiB2ODoNCj4gMS4gVXNlICJkZXZpY2VfcHJvcGVydHlfcHJlc2VudCgp
IiB0byBpbmNyZWFzZSBodW1hbiByZWFkYWJpbGl0eTsNCj4gMi4gVXNlICJHUEwiIGFzIHJlY29t
bWVuZGVkIGluIGNvbW1pdCBiZjdmYmVlYWU2ZGIgKCJtb2R1bGU6IEN1cmUNCj4gICAgdGhlIE1P
RFVMRV9MSUNFTlNFICJHUEwiIHZzLiAiR1BMIHYyIiBib2dvc2l0eSIpLg0KPiANCj4gQ2hhbmdl
cyBpbiB2NzoNCj4gMS4gQWRkIGJpdGZpZWxkLmggaGVhZGVyIHRvIGZpeCB0aGUgYnVpbGQgZXJy
b3Igb24gbm9uLWFybTY0DQo+IHBsYXRmb3Jtcy4NCj4gDQo+IENoYW5nZXMgaW4gdjY6DQo+IDEu
IFJlbW92ZSB1bm5lY2Vzc2FyeSBoZWFkZXIgZmlsZXM7DQo+IDIuIFVzZSBGSUxFTERfUFJFUCBp
biBiaXRmaWVsZC5oIHRvIHNldCB2YWx1ZS4NCj4gDQo+IENoYW5nZXMgaW4gdjU6DQo+IDEuIEZp
eCB0eXBvIGluIGtlcm5lbGRvYzogImVGdWVzIiA9PiAiZUZ1c2UiLg0KPiANCj4gQ2hhbmdlcyBp
biB2NDoNCj4gMS4gRml4IG5vIHJldHVybiB3aGVuIGNhbGxpbmcgZGV2X2Vycl9wcm9iZS4NCj4g
DQo+IENoYW5nZXMgaW4gdjM6DQo+IDEuIEFkZCBpbnRyb2R1Y3Rpb25zIGZvciBzdHJ1Y3R1cmUg
bWVtYmVyczsNCj4gMi4gQWRkIFNvQyBkZXBlbmRlbnQgZGF0YTsNCj4gMy4gRHluYW1pY2FsbHkg
YWxsb2NhdGUgZWZ1c2UgZGF0YTsNCj4gNC4gQ2hlY2sgcmV0dXJuIHZhbHVlIGlmIGl0J3MgYW4g
LUVQUk9CRV9ERUZFUi4NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IDEuIEFkZCBzcGVjaWZpYyBj
b21wYXRpYmxlIG5hbWU7DQo+IDIuIFJlYWQgTlZNRU0gZGF0YSBhdCBwcm9iZSB0aW1lOw0KPiAz
LiBGaXggdHlwb3MuDQo+IA0KPiBKaWFuanVuIFdhbmcgKDIpOg0KPiAgIGR0LWJpbmRpbmdzOiBw
aHk6IG1lZGlhdGVrOiBBZGQgWUFNTCBzY2hlbWEgZm9yIFBDSWUgUEhZDQo+ICAgcGh5OiBtZWRp
YXRlazogQWRkIFBDSWUgUEhZIGRyaXZlcg0KPiANCj4gIC4uLi9iaW5kaW5ncy9waHkvbWVkaWF0
ZWsscGNpZS1waHkueWFtbCAgICAgICB8ICA3NSArKysrKw0KPiAgZHJpdmVycy9waHkvbWVkaWF0
ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDExICsNCj4gIGRyaXZlcnMvcGh5L21lZGlh
dGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3BoeS9tZWRp
YXRlay9waHktbXRrLXBjaWUuYyAgICAgICAgICAgfCAyNjcNCj4gKysrKysrKysrKysrKysrKysr
DQo+ICA0IGZpbGVzIGNoYW5nZWQsIDM1NCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxw
Y2llLXBoeS55YW1sDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waHkvbWVkaWF0ZWsv
cGh5LW10ay1wY2llLmMNCj4gDQo=


