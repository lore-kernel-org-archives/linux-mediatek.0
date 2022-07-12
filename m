Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B567C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 01:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWPbILDVE4N6Fngp4xBfamwXBpIUEdCe8pGQU7X27rs=; b=p7+n7sfTM8s8lhtIHuDzp0AR/C
	s2zPKUVTwxSvPyy7RA8K+qPSQvRl63/oe2/5iM2kxHKtVZaMmXajGYTrk3qJuBhFAVbPY35hu9eKC
	yjEdBUNh10ZOqXrJgvTkH9IxLqFXrXe5ZPJMdcz32/+4Th64SeAjCSdqQs+F7KLJPpeugQWb3TeAF
	eIBR/JNoKAlKHKCklaihQdV7HRuGN0VQAZmuj7Vwm+blVkhWyzjuNk/ubmaKPYcqEMmiuKOgookGh
	+LaOpX8z0O/B/BLbN4eUQAdS36BnAbeSAf9NP4Jo21OINIILj7KfOquAFtqaiopVFx34OidtutoVC
	sXqC0r0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB53s-006ZNI-MY; Tue, 12 Jul 2022 01:51:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB53o-006ZLr-V9; Tue, 12 Jul 2022 01:51:38 +0000
X-UUID: 24b3ddc3e4f84ba49a9b49088e061cf9-20220711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nWPbILDVE4N6Fngp4xBfamwXBpIUEdCe8pGQU7X27rs=;
	b=LhkuY+yPDIFdAc2pBnLrpIHGPJp79Kij2RHbzSr5oYGwKC5x4yxV0w8hc8ylA7tky/iB9FsiQdEfZRjgiwtF6ASyhTtQQwDJ0zDDevR6/CuVyIu0jVKqkv8S9VZv3M+EFyQVqj1/S9a0jdZeyAn3op/Z+35BgVko1usQQVXh6GM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ebdfd1e0-bde5-4721-b3aa-1293e1d6f28e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:a74335d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 24b3ddc3e4f84ba49a9b49088e061cf9-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1537953957; Mon, 11 Jul 2022 18:51:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 12 Jul 2022 09:10:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 09:10:53 +0800
Message-ID: <5b0a5dca4605dcebb01d38494f1b413038bcb169.camel@mediatek.com>
Subject: Re: [PATCH net v3] stmmac: dwmac-mediatek: fix clock issue
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
Date: Tue, 12 Jul 2022 09:10:53 +0800
In-Reply-To: <78beb398-01ed-400e-e79c-0bcdcbc279d0@gmail.com>
References: <20220708083937.27334-1-biao.huang@mediatek.com>
	 <20220708083937.27334-2-biao.huang@mediatek.com>
	 <14bf5e6b-4230-fffc-4134-c3015cf4d262@gmail.com>
	 <410b8c62ea399b51c11021c4838bd6a62d542703.camel@mediatek.com>
	 <78beb398-01ed-400e-e79c-0bcdcbc279d0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_185137_036810_A69EFC03 
X-CRM114-Status: GOOD (  43.81  )
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

RGVhciBNYXR0aGlhcywNCglUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQoNCk9uIEZyaSwgMjAy
Mi0wNy0wOCBhdCAxMzozNyArMDIwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToNCj4gSGkgQmlh
byBIdWFuZywNCj4gDQo+IE9uIDA4LzA3LzIwMjIgMTE6NDYsIEJpYW8gSHVhbmcgd3JvdGU6DQo+
ID4gRGVhciBNYXR0aWFzLA0KPiA+IAlUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQo+ID4gDQo+
ID4gT24gRnJpLCAyMDIyLTA3LTA4IGF0IDExOjIyICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdy
b3RlOg0KPiA+ID4gDQo+ID4gPiBPbiAwOC8wNy8yMDIyIDEwOjM5LCBCaWFvIEh1YW5nIHdyb3Rl
Og0KPiA+ID4gPiBTaW5jZSBjbG9ja3MgYXJlIGhhbmRsZWQgaW4gbWVkaWF0ZWtfZHdtYWNfY2xr
c19jb25maWcoKSwNCj4gPiA+ID4gcmVtb3ZlIHRoZSBjbG9ja3MgY29uZmlndXJhdGlvbiBpbiBp
bml0KCkvZXhpdCgpLCBhbmQNCj4gPiA+ID4gaW52b2tlIG1lZGlhdGVrX2R3bWFjX2Nsa3NfY29u
ZmlnIGluc3RlYWQuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGlzc3VlIGlzIGZvdW5kIGluIHN1
c3BlbmQvcmVzdW1lIHRlc3QuDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBDb21taXQgbWVzc2Fn
ZSBpcyByYXRoZXIgY29uZnVzaW5nLiBCYXNpY2FsbHkgeW91IGFyZSBtb3ZpbmcgdGhlDQo+ID4g
PiBjbG9jayBlbmFibGUNCj4gPiA+IGludG8gcHJvYmUgaW5zdGVhZCBvZiBpbml0IGFuZCByZW1v
dmUgaXQgZnJvbSBleGl0LiBUaGF0IG1lYW5zLA0KPiA+ID4gY2xvY2tzIGdldA0KPiA+ID4gZW5h
YmxlZCBlYXJsaWVyIGFuZCBkb24ndCBnZXQgZGlzYWJsZWQgaWYgdGhlIG1vZHVsZSBnZXRzDQo+
ID4gPiB1bmxvYWRlZC4NCj4gPiA+IFRoYXQgZG9lc24ndA0KPiA+ID4gc291bmQgY29ycmVjdCwg
SSB0aGluayB3ZSB3b3VsZCBhdCBsZWFzdCBuZWVkIHRvIGRpc2FibGUgdGhlDQo+ID4gPiBjbG9j
a3MNCj4gPiA+IGluIHJlbW92ZQ0KPiA+ID4gZnVuY3Rpb24uDQo+ID4gDQo+ID4gdGhlcmUgaXMg
cG1fcnVudGltZSBzdXBwb3J0IGluIGRyaXZlciwgYW5kIGNsb2NrcyB3aWxsIGJlDQo+ID4gZGlz
YWJsZWQvZW5hYmxlZCBpbiBzdG1tYWNfcnVudGltZV9zdXNwZW5kL3N0bW1hY19ydW50aW1lX3Jl
c3VtZS4NCj4gPiANCj4gPiBzdG1tYWNfZHZyX3Byb2JlKCkgaW52b2tlIHBtX3J1bnRpbWVfcHV0
KGRldmljZSkgYXQgdGhlIGVuZCwgYW5kDQo+ID4gZGlzYWJsZSBjbG9ja3MsIGJ1dCBubyBjbG9j
ayBlbmFibGUgYXQgdGhlIGJlZ2lubmluZy4NCj4gPiBzbyB2ZW5kb3IncyBwcm9iZSBlbnRyeSBz
aG91bGQgZW5hYmxlIGNsb2NrcyB0byBlbnN1cmUgbm9ybWFsDQo+ID4gYmVoYXZpb3IuDQo+ID4g
DQo+ID4gQXMgdG8gY2xvY2tzIGluIHJlbW92ZSBmdW5jdGlvbiwgd2UgZGlkIG5vdCB0ZXN0IGl0
DQo+ID4gV2Ugc2hvdWxkIGltcGxlbWVudCBhIHZlbmRvciBzcGVjaWZpZWQgcmVtb3ZlIGZ1bmN0
aW9uIHdobyB3aWxsDQo+ID4gdGFrZQ0KPiA+IGNhcmUgb2YgY2xvY2tzIHJhdGhlciB0aGFuIGlu
dm9rZSBzdG1tYWNfcGx0ZnJfcmVtb3ZlIGRpcmVjdGx5Lg0KPiA+IA0KPiA+IEFueXdheSwgd2Ug
bWlzcyB0aGUgY2xvY2sgaGFuZGxpbmcgY2FzZSBpbiByZW1vdmUgZnVuY3Rpb24sDQo+ID4gYW5k
IHdpbGwNCj4gPiB0ZXN0IGl0IGFuZCBmZWVkIGJhY2suDQo+IA0KPiBSaWdodCwgc29ycnkgSSdt
IG5vdCBmYW1pbGlhciB3aXRoIHRoZSBzdG1tYWMgZHJpdmVyIHN0YWNrLCB5ZXMNCj4gc3VzcGVu
ZC9yZXN1bWUgDQo+IGlzIGZpbmUuIFRoYW5rcyBmb3IgY2xhcmlmaWNhdGlvbi4NCj4gDQo+IHN0
bW1hY19wbHRmcl9yZW1vdmUgd2lsbCBkaXNhYmxlIHN0bW1hY19jbGsgYW5kIHBjbGsgYnV0IG5v
dCB0aGUgcmVzdA0KPiBvZiB0aGUgDQo+IGNsb2Nrcy4gU28gSSB0aGluayB5b3Ugd2lsbCBuZWVk
IHRvIGhhdmUgc3BlY2lmaWMgcmVtb3ZlIGZ1bmN0aW9uIHRvDQo+IGRpc2FibGUgdGhlbS4NClll
cywgSSdsbCByZXdyaXRlIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGVzdCByZW1vdmUgZnVuY3Rp
b24sDQppZiBuZWVkIGFueSBtb2RpZmljYXRpb24sIHdpbGwgYWRkIHRoZW0gaW4gbmV4dCBzZW5k
Lg0KDQpCZXN0IFJlZ2FyZHMhDQpCaWFvDQo+IA0KPiA+ID4gDQo+ID4gPiBJIHN1cHBvc2UgdGhh
dCBzdXNwZW5kIGNhbGxzIGV4aXQgYW5kIHRoYXQgdGhlcmUgd2FzIGEgcHJvYmxlbQ0KPiA+ID4g
d2hlbg0KPiA+ID4gd2UgZGlzYWJsZQ0KPiA+ID4gdGhlIGNsb2NrcyB0aGVyZS4gSXMgdGhpcyBh
IEhXIGlzc3VlIHRoYXQgaGFzIG5vIG90aGVyIHBvc3NpYmxlDQo+ID4gPiBmaXg/DQo+ID4gDQo+
ID4gTm90IGEgSFcgaXNzdWUuIHN1c3BlbmQvcmVzdW1lIHdpbGwgZGlzYWJsZS9lbmFibGUgY2xv
Y2tzIGJ5DQo+ID4gaW52b2tpbmcNCj4gPiBzdG1tYWNfcGx0ZnJfbm9pcnFfc3VzcGVuZC9zdG1t
YWNfcGx0ZnJfbm9pcnFfcmVzdW1lIC0tPg0KPiA+IHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZC9w
bV9ydW50aW1lX2ZvcmNlX3Jlc3VtZS0tPg0KPiA+IG1lZGlhdGVrX2R3bWFjX2Nsa3NfY29uZmln
LCBzbyBvbGQgY2xvY2sgaGFuZGxpbmcgaW4gaW5pdC9leGl0IGlzDQo+ID4gbm8NCj4gPiBsb25n
ZXIgYSBwcm9wZXIgY2hvaWNlLg0KPiA+IA0KPiANCj4gR290IGl0LCB0aGFua3MgZm9yIGNsYXJp
ZmljYXRpb24uDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IE1hdHRoaWFzDQo+IA0KPiA+IEJlc3Qg
UmVnYXJkcyENCj4gPiBCaWFvDQo+ID4gDQo+ID4gPiANCj4gPiA+IFJlZ2FyZHMsDQo+ID4gPiBN
YXR0aGlhcw0KPiA+ID4gDQo+ID4gPiA+IEZpeGVzOiAzMTg2YmRhZDk3ZDUgKCJzdG1tYWM6IGR3
bWFjLW1lZGlhdGVrOiBhZGQgcGxhdGZvcm0NCj4gPiA+ID4gbGV2ZWwNCj4gPiA+ID4gY2xvY2tz
IG1hbmFnZW1lbnQiKQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWFvIEh1YW5nIDxiaWFvLmh1
YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAgIC4uLi9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jICB8IDM2ICsrKysrLS0NCj4gPiA+ID4gLS0t
LS0tLQ0KPiA+ID4gPiAtLS0tLQ0KPiA+ID4gPiAgICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy0NCj4gPiA+ID4gbWVkaWF0
ZWsuYw0KPiA+ID4gPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LW1lZGlhdGVrLmMNCj4gPiA+ID4gaW5kZXggNmZmODhkZjU4NzY3Li5lODZmM2UxMjVjYjQgMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLW1lZGlhdGVrLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYw0KPiA+ID4gPiBAQCAtNTc2LDMyICs1NzYsNyBAQCBz
dGF0aWMgaW50IG1lZGlhdGVrX2R3bWFjX2luaXQoc3RydWN0DQo+ID4gPiA+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldiwgdm9pZCAqcHJpdikNCj4gPiA+ID4gICAgCQl9DQo+ID4gPiA+ICAgIAl9DQo+
ID4gPiA+ICAgIA0KPiA+ID4gPiAtCXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKHZhcmlh
bnQtPm51bV9jbGtzLCBwbGF0LQ0KPiA+ID4gPiA+Y2xrcyk7DQo+ID4gPiA+IC0JaWYgKHJldCkg
ew0KPiA+ID4gPiAtCQlkZXZfZXJyKHBsYXQtPmRldiwgImZhaWxlZCB0byBlbmFibGUgY2xrcywg
ZXJyDQo+ID4gPiA+ID0gJWRcbiIsDQo+ID4gPiA+IHJldCk7DQo+ID4gPiA+IC0JCXJldHVybiBy
ZXQ7DQo+ID4gPiA+IC0JfQ0KPiA+ID4gPiAtDQo+ID4gPiA+IC0JcmV0ID0gY2xrX3ByZXBhcmVf
ZW5hYmxlKHBsYXQtPnJtaWlfaW50ZXJuYWxfY2xrKTsNCj4gPiA+ID4gLQlpZiAocmV0KSB7DQo+
ID4gPiA+IC0JCWRldl9lcnIocGxhdC0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBybWlpDQo+ID4g
PiA+IGludGVybmFsIGNsaywNCj4gPiA+ID4gZXJyID0gJWRcbiIsIHJldCk7DQo+ID4gPiA+IC0J
CWdvdG8gZXJyX2NsazsNCj4gPiA+ID4gLQl9DQo+ID4gPiA+IC0NCj4gPiA+ID4gICAgCXJldHVy
biAwOw0KPiA+ID4gPiAtDQo+ID4gPiA+IC1lcnJfY2xrOg0KPiA+ID4gPiAtCWNsa19idWxrX2Rp
c2FibGVfdW5wcmVwYXJlKHZhcmlhbnQtPm51bV9jbGtzLCBwbGF0LQ0KPiA+ID4gPiA+Y2xrcyk7
DQo+ID4gPiA+IC0JcmV0dXJuIHJldDsNCj4gPiA+ID4gLX0NCj4gPiA+ID4gLQ0KPiA+ID4gPiAt
c3RhdGljIHZvaWQgbWVkaWF0ZWtfZHdtYWNfZXhpdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LA0KPiA+ID4gPiB2b2lkDQo+ID4gPiA+ICpwcml2KQ0KPiA+ID4gPiAtew0KPiA+ID4gPiAt
CXN0cnVjdCBtZWRpYXRla19kd21hY19wbGF0X2RhdGEgKnBsYXQgPSBwcml2Ow0KPiA+ID4gPiAt
CWNvbnN0IHN0cnVjdCBtZWRpYXRla19kd21hY192YXJpYW50ICp2YXJpYW50ID0gcGxhdC0NCj4g
PiA+ID4gPnZhcmlhbnQ7DQo+ID4gPiA+IC0NCj4gPiA+ID4gLQljbGtfZGlzYWJsZV91bnByZXBh
cmUocGxhdC0+cm1paV9pbnRlcm5hbF9jbGspOw0KPiA+ID4gPiAtCWNsa19idWxrX2Rpc2FibGVf
dW5wcmVwYXJlKHZhcmlhbnQtPm51bV9jbGtzLCBwbGF0LQ0KPiA+ID4gPiA+Y2xrcyk7DQo+ID4g
PiA+ICAgIH0NCj4gPiA+ID4gICAgDQo+ID4gPiA+ICAgIHN0YXRpYyBpbnQgbWVkaWF0ZWtfZHdt
YWNfY2xrc19jb25maWcodm9pZCAqcHJpdiwgYm9vbA0KPiA+ID4gPiBlbmFibGVkKQ0KPiA+ID4g
PiBAQCAtNjQzLDcgKzYxOCw2IEBAIHN0YXRpYyBpbnQNCj4gPiA+ID4gbWVkaWF0ZWtfZHdtYWNf
Y29tbW9uX2RhdGEoc3RydWN0DQo+ID4gPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiA+
ID4gICAgCXBsYXQtPmFkZHI2NCA9IHByaXZfcGxhdC0+dmFyaWFudC0+ZG1hX2JpdF9tYXNrOw0K
PiA+ID4gPiAgICAJcGxhdC0+YnNwX3ByaXYgPSBwcml2X3BsYXQ7DQo+ID4gPiA+ICAgIAlwbGF0
LT5pbml0ID0gbWVkaWF0ZWtfZHdtYWNfaW5pdDsNCj4gPiA+ID4gLQlwbGF0LT5leGl0ID0gbWVk
aWF0ZWtfZHdtYWNfZXhpdDsNCj4gPiA+ID4gICAgCXBsYXQtPmNsa3NfY29uZmlnID0gbWVkaWF0
ZWtfZHdtYWNfY2xrc19jb25maWc7DQo+ID4gPiA+ICAgIAlpZiAocHJpdl9wbGF0LT52YXJpYW50
LT5kd21hY19maXhfbWFjX3NwZWVkKQ0KPiA+ID4gPiAgICAJCXBsYXQtPmZpeF9tYWNfc3BlZWQg
PSBwcml2X3BsYXQtPnZhcmlhbnQtDQo+ID4gPiA+ID4gZHdtYWNfZml4X21hY19zcGVlZDsNCj4g
PiA+ID4gDQo+ID4gPiA+IEBAIC03MTIsMTMgKzY4NiwyMSBAQCBzdGF0aWMgaW50IG1lZGlhdGVr
X2R3bWFjX3Byb2JlKHN0cnVjdA0KPiA+ID4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4g
PiA+ICAgIAltZWRpYXRla19kd21hY19jb21tb25fZGF0YShwZGV2LCBwbGF0X2RhdCwgcHJpdl9w
bGF0KTsNCj4gPiA+ID4gICAgCW1lZGlhdGVrX2R3bWFjX2luaXQocGRldiwgcHJpdl9wbGF0KTsN
Cj4gPiA+ID4gICAgDQo+ID4gPiA+ICsJcmV0ID0gbWVkaWF0ZWtfZHdtYWNfY2xrc19jb25maWco
cHJpdl9wbGF0LCB0cnVlKTsNCj4gPiA+ID4gKwlpZiAocmV0KQ0KPiA+ID4gPiArCQlyZXR1cm4g
cmV0Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICAgIAlyZXQgPSBzdG1tYWNfZHZyX3Byb2JlKCZwZGV2
LT5kZXYsIHBsYXRfZGF0LA0KPiA+ID4gPiAmc3RtbWFjX3Jlcyk7DQo+ID4gPiA+ICAgIAlpZiAo
cmV0KSB7DQo+ID4gPiA+ICAgIAkJc3RtbWFjX3JlbW92ZV9jb25maWdfZHQocGRldiwgcGxhdF9k
YXQpOw0KPiA+ID4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArCQlnb3RvIGVycl9kcnZfcHJv
YmU7DQo+ID4gPiA+ICAgIAl9DQo+ID4gPiA+ICAgIA0KPiA+ID4gPiAgICAJcmV0dXJuIDA7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gK2Vycl9kcnZfcHJvYmU6DQo+ID4gPiA+ICsJbWVkaWF0ZWtfZHdt
YWNfY2xrc19jb25maWcocHJpdl9wbGF0LCBmYWxzZSk7DQo+ID4gPiA+ICsJcmV0dXJuIHJldDsN
Cj4gPiA+ID4gICAgfQ0KPiA+ID4gPiAgICANCj4gPiA+ID4gICAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbWVkaWF0ZWtfZHdtYWNfbWF0Y2hbXSA9IHsNCg==


