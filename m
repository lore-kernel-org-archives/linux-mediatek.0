Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED64CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkoIdRVMX8SxE0Snd0446EtprJYy7cw6qIVy+3b/MfA=; b=q4lHejm0vu/E6HXEOdKvJGAMhf
	s4/9cnofyTwGC2SmQAhhxiDW6PNDNCdftyKtsTqaZy7Pynz4DxVLcuGNnomvX+PfgmFueFc2jQ9/B
	y/D0VwiXg+S71IWWSEXj6AtwjaO7URqhDc65rq2LcQAXswYZIz75J+tKOyPHn+lykvhE5qvR1Nl8g
	Tj26iqUBiboozMc+HSg4uzwhZeuz4GcNVXZu3uxnVfoxWvDkSxSMelcq3Smeu/Oq6bkDVEAQve4tU
	IX9+fOop4GUSvxwk6NBR0OBCsF7LfxN6XclAPh+580DO6fZAUBetwWgjCgN6Dc2mkvRQLT5reaIFo
	qv8O5u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kZU-0030D5-5G; Fri, 08 Jul 2022 09:46:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kZQ-0030BS-IJ; Fri, 08 Jul 2022 09:46:46 +0000
X-UUID: e0ec93b4339e4921a5838ee123afd265-20220708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pkoIdRVMX8SxE0Snd0446EtprJYy7cw6qIVy+3b/MfA=;
	b=TZyriPEBKLzCfe4mel3CQ3YH6xHFn4652tT04T/+xP4CewqpR0TUL1qR3O5QOu0vuIbeVmoQItaH67Pra3/DPbkOiutpgzRCi+ahnfsJJCjNe6Tw+ZZdTe/X1hzXzUef5Wqojnvw7RBcggC3anv/CecU3whMMYZdWOMKaz1+LOE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5fbcd5d5-64ce-4c96-a8a2-1e43b1a9d757,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:0ad2f7d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e0ec93b4339e4921a5838ee123afd265-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1107116232; Fri, 08 Jul 2022 02:46:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 17:46:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 17:46:17 +0800
Message-ID: <410b8c62ea399b51c11021c4838bd6a62d542703.camel@mediatek.com>
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
Date: Fri, 8 Jul 2022 17:46:17 +0800
In-Reply-To: <14bf5e6b-4230-fffc-4134-c3015cf4d262@gmail.com>
References: <20220708083937.27334-1-biao.huang@mediatek.com>
	 <20220708083937.27334-2-biao.huang@mediatek.com>
	 <14bf5e6b-4230-fffc-4134-c3015cf4d262@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_024644_650991_4BC2FDE5 
X-CRM114-Status: GOOD (  28.23  )
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

RGVhciBNYXR0aWFzLA0KCVRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCg0KT24gRnJpLCAyMDIy
LTA3LTA4IGF0IDExOjIyICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOg0KPiANCj4gT24g
MDgvMDcvMjAyMiAxMDozOSwgQmlhbyBIdWFuZyB3cm90ZToNCj4gPiBTaW5jZSBjbG9ja3MgYXJl
IGhhbmRsZWQgaW4gbWVkaWF0ZWtfZHdtYWNfY2xrc19jb25maWcoKSwNCj4gPiByZW1vdmUgdGhl
IGNsb2NrcyBjb25maWd1cmF0aW9uIGluIGluaXQoKS9leGl0KCksIGFuZA0KPiA+IGludm9rZSBt
ZWRpYXRla19kd21hY19jbGtzX2NvbmZpZyBpbnN0ZWFkLg0KPiA+IA0KPiA+IFRoaXMgaXNzdWUg
aXMgZm91bmQgaW4gc3VzcGVuZC9yZXN1bWUgdGVzdC4NCj4gPiANCj4gDQo+IENvbW1pdCBtZXNz
YWdlIGlzIHJhdGhlciBjb25mdXNpbmcuIEJhc2ljYWxseSB5b3UgYXJlIG1vdmluZyB0aGUNCj4g
Y2xvY2sgZW5hYmxlIA0KPiBpbnRvIHByb2JlIGluc3RlYWQgb2YgaW5pdCBhbmQgcmVtb3ZlIGl0
IGZyb20gZXhpdC4gVGhhdCBtZWFucywNCj4gY2xvY2tzIGdldCANCj4gZW5hYmxlZCBlYXJsaWVy
IGFuZCBkb24ndCBnZXQgZGlzYWJsZWQgaWYgdGhlIG1vZHVsZSBnZXRzIHVubG9hZGVkLg0KPiBU
aGF0IGRvZXNuJ3QgDQo+IHNvdW5kIGNvcnJlY3QsIEkgdGhpbmsgd2Ugd291bGQgYXQgbGVhc3Qg
bmVlZCB0byBkaXNhYmxlIHRoZSBjbG9ja3MNCj4gaW4gcmVtb3ZlIA0KPiBmdW5jdGlvbi4NCnRo
ZXJlIGlzIHBtX3J1bnRpbWUgc3VwcG9ydCBpbiBkcml2ZXIsIGFuZCBjbG9ja3Mgd2lsbCBiZQ0K
ZGlzYWJsZWQvZW5hYmxlZCBpbiBzdG1tYWNfcnVudGltZV9zdXNwZW5kL3N0bW1hY19ydW50aW1l
X3Jlc3VtZS4NCg0Kc3RtbWFjX2R2cl9wcm9iZSgpIGludm9rZSBwbV9ydW50aW1lX3B1dChkZXZp
Y2UpIGF0IHRoZSBlbmQsIGFuZA0KZGlzYWJsZSBjbG9ja3MsIGJ1dCBubyBjbG9jayBlbmFibGUg
YXQgdGhlIGJlZ2lubmluZy4NCnNvIHZlbmRvcidzIHByb2JlIGVudHJ5IHNob3VsZCBlbmFibGUg
Y2xvY2tzIHRvIGVuc3VyZSBub3JtYWwgYmVoYXZpb3IuDQoNCkFzIHRvIGNsb2NrcyBpbiByZW1v
dmUgZnVuY3Rpb24sIHdlIGRpZCBub3QgdGVzdCBpdA0KV2Ugc2hvdWxkIGltcGxlbWVudCBhIHZl
bmRvciBzcGVjaWZpZWQgcmVtb3ZlIGZ1bmN0aW9uIHdobyB3aWxsIHRha2UNCmNhcmUgb2YgY2xv
Y2tzIHJhdGhlciB0aGFuIGludm9rZSBzdG1tYWNfcGx0ZnJfcmVtb3ZlIGRpcmVjdGx5Lg0KDQpB
bnl3YXksIHdlIG1pc3MgdGhlIGNsb2NrIGhhbmRsaW5nIGNhc2UgaW4gcmVtb3ZlIGZ1bmN0aW9u
LA0KYW5kIHdpbGwNCnRlc3QgaXQgYW5kIGZlZWQgYmFjay4NCj4gDQo+IEkgc3VwcG9zZSB0aGF0
IHN1c3BlbmQgY2FsbHMgZXhpdCBhbmQgdGhhdCB0aGVyZSB3YXMgYSBwcm9ibGVtIHdoZW4NCj4g
d2UgZGlzYWJsZSANCj4gdGhlIGNsb2NrcyB0aGVyZS4gSXMgdGhpcyBhIEhXIGlzc3VlIHRoYXQg
aGFzIG5vIG90aGVyIHBvc3NpYmxlIGZpeD8NCk5vdCBhIEhXIGlzc3VlLiBzdXNwZW5kL3Jlc3Vt
ZSB3aWxsIGRpc2FibGUvZW5hYmxlIGNsb2NrcyBieSBpbnZva2luZyANCnN0bW1hY19wbHRmcl9u
b2lycV9zdXNwZW5kL3N0bW1hY19wbHRmcl9ub2lycV9yZXN1bWUgLS0+IA0KcG1fcnVudGltZV9m
b3JjZV9zdXNwZW5kL3BtX3J1bnRpbWVfZm9yY2VfcmVzdW1lLS0+IA0KbWVkaWF0ZWtfZHdtYWNf
Y2xrc19jb25maWcsIHNvIG9sZCBjbG9jayBoYW5kbGluZyBpbiBpbml0L2V4aXQgaXMgbm8NCmxv
bmdlciBhIHByb3BlciBjaG9pY2UuDQoNCkJlc3QgUmVnYXJkcyENCkJpYW8NCg0KPiANCj4gUmVn
YXJkcywNCj4gTWF0dGhpYXMNCj4gDQo+ID4gRml4ZXM6IDMxODZiZGFkOTdkNSAoInN0bW1hYzog
ZHdtYWMtbWVkaWF0ZWs6IGFkZCBwbGF0Zm9ybSBsZXZlbA0KPiA+IGNsb2NrcyBtYW5hZ2VtZW50
IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWFvIEh1YW5nIDxiaWFvLmh1YW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRp
YXRlay5jICB8IDM2ICsrKysrLS0tLS0tLS0tDQo+ID4gLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5j
DQo+ID4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRl
ay5jDQo+ID4gaW5kZXggNmZmODhkZjU4NzY3Li5lODZmM2UxMjVjYjQgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlh
dGVrLmMNCj4gPiBAQCAtNTc2LDMyICs1NzYsNyBAQCBzdGF0aWMgaW50IG1lZGlhdGVrX2R3bWFj
X2luaXQoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2LCB2b2lkICpwcml2KQ0KPiA+
ICAgCQl9DQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4gLQlyZXQgPSBjbGtfYnVsa19wcmVwYXJlX2Vu
YWJsZSh2YXJpYW50LT5udW1fY2xrcywgcGxhdC0+Y2xrcyk7DQo+ID4gLQlpZiAocmV0KSB7DQo+
ID4gLQkJZGV2X2VycihwbGF0LT5kZXYsICJmYWlsZWQgdG8gZW5hYmxlIGNsa3MsIGVyciA9ICVk
XG4iLA0KPiA+IHJldCk7DQo+ID4gLQkJcmV0dXJuIHJldDsNCj4gPiAtCX0NCj4gPiAtDQo+ID4g
LQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUocGxhdC0+cm1paV9pbnRlcm5hbF9jbGspOw0KPiA+
IC0JaWYgKHJldCkgew0KPiA+IC0JCWRldl9lcnIocGxhdC0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJs
ZSBybWlpIGludGVybmFsIGNsaywNCj4gPiBlcnIgPSAlZFxuIiwgcmV0KTsNCj4gPiAtCQlnb3Rv
IGVycl9jbGs7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+ICAgCXJldHVybiAwOw0KPiA+IC0NCj4gPiAt
ZXJyX2NsazoNCj4gPiAtCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKHZhcmlhbnQtPm51bV9j
bGtzLCBwbGF0LT5jbGtzKTsNCj4gPiAtCXJldHVybiByZXQ7DQo+ID4gLX0NCj4gPiAtDQo+ID4g
LXN0YXRpYyB2b2lkIG1lZGlhdGVrX2R3bWFjX2V4aXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwgdm9pZA0KPiA+ICpwcml2KQ0KPiA+IC17DQo+ID4gLQlzdHJ1Y3QgbWVkaWF0ZWtfZHdt
YWNfcGxhdF9kYXRhICpwbGF0ID0gcHJpdjsNCj4gPiAtCWNvbnN0IHN0cnVjdCBtZWRpYXRla19k
d21hY192YXJpYW50ICp2YXJpYW50ID0gcGxhdC0+dmFyaWFudDsNCj4gPiAtDQo+ID4gLQljbGtf
ZGlzYWJsZV91bnByZXBhcmUocGxhdC0+cm1paV9pbnRlcm5hbF9jbGspOw0KPiA+IC0JY2xrX2J1
bGtfZGlzYWJsZV91bnByZXBhcmUodmFyaWFudC0+bnVtX2Nsa3MsIHBsYXQtPmNsa3MpOw0KPiA+
ICAgfQ0KPiA+ICAgDQo+ID4gICBzdGF0aWMgaW50IG1lZGlhdGVrX2R3bWFjX2Nsa3NfY29uZmln
KHZvaWQgKnByaXYsIGJvb2wgZW5hYmxlZCkNCj4gPiBAQCAtNjQzLDcgKzYxOCw2IEBAIHN0YXRp
YyBpbnQgbWVkaWF0ZWtfZHdtYWNfY29tbW9uX2RhdGEoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2
aWNlICpwZGV2LA0KPiA+ICAgCXBsYXQtPmFkZHI2NCA9IHByaXZfcGxhdC0+dmFyaWFudC0+ZG1h
X2JpdF9tYXNrOw0KPiA+ICAgCXBsYXQtPmJzcF9wcml2ID0gcHJpdl9wbGF0Ow0KPiA+ICAgCXBs
YXQtPmluaXQgPSBtZWRpYXRla19kd21hY19pbml0Ow0KPiA+IC0JcGxhdC0+ZXhpdCA9IG1lZGlh
dGVrX2R3bWFjX2V4aXQ7DQo+ID4gICAJcGxhdC0+Y2xrc19jb25maWcgPSBtZWRpYXRla19kd21h
Y19jbGtzX2NvbmZpZzsNCj4gPiAgIAlpZiAocHJpdl9wbGF0LT52YXJpYW50LT5kd21hY19maXhf
bWFjX3NwZWVkKQ0KPiA+ICAgCQlwbGF0LT5maXhfbWFjX3NwZWVkID0gcHJpdl9wbGF0LT52YXJp
YW50LQ0KPiA+ID5kd21hY19maXhfbWFjX3NwZWVkOw0KPiA+IEBAIC03MTIsMTMgKzY4NiwyMSBA
QCBzdGF0aWMgaW50IG1lZGlhdGVrX2R3bWFjX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgIAltZWRpYXRla19kd21hY19jb21tb25fZGF0YShwZGV2LCBwbGF0
X2RhdCwgcHJpdl9wbGF0KTsNCj4gPiAgIAltZWRpYXRla19kd21hY19pbml0KHBkZXYsIHByaXZf
cGxhdCk7DQo+ID4gICANCj4gPiArCXJldCA9IG1lZGlhdGVrX2R3bWFjX2Nsa3NfY29uZmlnKHBy
aXZfcGxhdCwgdHJ1ZSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4g
Kw0KPiA+ICAgCXJldCA9IHN0bW1hY19kdnJfcHJvYmUoJnBkZXYtPmRldiwgcGxhdF9kYXQsICZz
dG1tYWNfcmVzKTsNCj4gPiAgIAlpZiAocmV0KSB7DQo+ID4gICAJCXN0bW1hY19yZW1vdmVfY29u
ZmlnX2R0KHBkZXYsIHBsYXRfZGF0KTsNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCWdvdG8g
ZXJyX2Rydl9wcm9iZTsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiAr
DQo+ID4gK2Vycl9kcnZfcHJvYmU6DQo+ID4gKwltZWRpYXRla19kd21hY19jbGtzX2NvbmZpZyhw
cml2X3BsYXQsIGZhbHNlKTsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4gICANCj4g
PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lZGlhdGVrX2R3bWFjX21hdGNo
W10gPSB7DQo=


