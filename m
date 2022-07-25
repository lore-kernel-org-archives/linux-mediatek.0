Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC0CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 03:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWTILc94ods/oANcg7kONkBgDo5S4G22sIvfzjbx0/I=; b=ZB+v1WzIy2aAmMO4w+bhq58YKD
	mpoqVNaTvy0XAZi/zS0BUxRuUkJEmuul+6ai5H7rNzezL2m/CsX88aStw/ByvGAkcMip5odVFUucU
	DrTVrt41/uIo63bAF8Xc4N8h7gBzyTLp7AZjMcTf/ccgawFal7Pi1UN45EzeKLwPcFgXfLqy0SOZE
	zZAE8JaV5hs+dMQ1Mh++pOdJkc5PhnT9bqAVGNNjMpSryUueaN/UH3VPusxo1yK0ZnggFsqn+1uJi
	WpQ2No/ZFgMQuzMlNKW28TtERh651GvdCC1Ttf9gxTOnWbTnrQ6AB8/lhQnc9RWfWpStoVjPesLHQ
	FWDePo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFodb-002PnS-MM; Mon, 25 Jul 2022 03:20:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFodQ-002PHr-QE; Mon, 25 Jul 2022 03:19:58 +0000
X-UUID: 986fd2aef4554fe6abe5168d5865f460-20220724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pWTILc94ods/oANcg7kONkBgDo5S4G22sIvfzjbx0/I=;
	b=oehAMcMETaxnG1NzcBtumbR3pkeCTeath4Zzq9uI8ueOcMQ/WdYf1pgcWiDnzbnA8+iqaPNhurxQDHH/ACNV81+1BYGYX9SOjbqDjQpQSp3hj6Pnt+JV0337mdFV6TMGZjjElUzMSK9lYkET09VbA3qisLWHnI6m4uOUyO/jFdA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cb9c7c45-4117-473f-906b-ff204f589c58,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:a2acd3d3-912a-458b-a623-74f605a77e93,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 986fd2aef4554fe6abe5168d5865f460-20220724
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 504917379; Sun, 24 Jul 2022 20:19:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 10:19:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Jul 2022 10:19:06 +0800
Message-ID: <ba44d9198639f47e52f4fff8d8ae98dcd6dd99be.camel@mediatek.com>
Subject: Re: [V5,6/8] media: mtk-jpegdec: add output pic reorder interface
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Irui
 Wang <irui.wang@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Mon, 25 Jul 2022 10:19:06 +0800
In-Reply-To: <737fbc8c-8890-c4e0-c7f6-e2c4c1cb9725@collabora.com>
References: <20220716093408.29734-1-irui.wang@mediatek.com>
	 <20220716093408.29734-7-irui.wang@mediatek.com>
	 <737fbc8c-8890-c4e0-c7f6-e2c4c1cb9725@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_201956_878500_D5418ABB 
X-CRM114-Status: GOOD (  18.39  )
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

T24gTW9uLCAyMDIyLTA3LTE4IGF0IDEyOjM2ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTYvMDcvMjIgMTE6MzQsIElydWkgV2FuZyBoYSBzY3JpdHRvOg0K
PiA+IEZyb206IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gYWRk
IG91dHB1dCByZW9yZGVyIGZ1bmMgdG8gcmVvcmRlciB0aGUgb3V0cHV0IGltYWdlcw0KPiA+IHRv
IGVuc3VyZSB0aGUgb3V0cHV0IHBpYyBpcyBjb25zaXN0ZW50IHdpdGggdGhlIGlucHV0IGltYWdl
cy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBreXJpZSB3dSA8a3lyaWUud3VAbWVkaWF0ZWsu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IGlydWkgd2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiANCj4gPiAtLS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2RlY19ody5jICB8IDQ5DQo+ID4gKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19k
ZWNfaHcuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2RlY19ody5jDQo+ID4gaW5kZXggNTkwMzAwMTA4YmZmLi5jMDQ2OGNmOTZkNzQgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2RlY19ody5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVn
L210a19qcGVnX2RlY19ody5jDQo+ID4gQEAgLTQ0MCw2ICs0NDAsNTEgQEAgdm9pZCBtdGtfanBl
Z19kZWNfc2V0X2NvbmZpZyh2b2lkIF9faW9tZW0NCj4gPiAqYmFzZSwNCj4gPiAgIH0NCj4gPiAg
IEVYUE9SVF9TWU1CT0xfR1BMKG10a19qcGVnX2RlY19zZXRfY29uZmlnKTsNCj4gPiAgIA0KPiA+
ICtzdGF0aWMgdm9pZCBtdGtfanBlZ2RlY19wdXRfYnVmKHN0cnVjdCBtdGtfanBlZ2RlY19jb21w
X2RldiAqanBlZykNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19qcGVnX3NyY19idWYgKmRzdF9k
b25lX2J1ZiwgKnRtcF9kc3RfZG9uZV9idWY7DQo+ID4gKwlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVy
ICpkc3RfYnVmZmVyOw0KPiA+ICsJc3RydWN0IGxpc3RfaGVhZCAqdGVtcF9lbnRyeTsNCj4gPiAr
CXN0cnVjdCBsaXN0X2hlYWQgKnBvcyA9IE5VTEw7DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdfY3R4
ICpjdHg7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICsNCj4gPiArCWN0eCA9IGpw
ZWctPmh3X3BhcmFtLmN1cnJfY3R4Ow0KPiA+ICsJaWYgKHVubGlrZWx5KCFjdHgpKSB7DQo+ID4g
KwkJZGV2X2VycihqcGVnLT5kZXYsICJjb21wX2pwZWcgY3R4IGZhaWwgISEhXG4iKTsNCj4gPiAr
CQlyZXR1cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZHN0X2J1ZmZlciA9IGpwZWctPmh3X3Bh
cmFtLmRzdF9idWZmZXI7DQo+ID4gKwlpZiAoIWRzdF9idWZmZXIpIHsNCj4gPiArCQlkZXZfZXJy
KGpwZWctPmRldiwgImNvbXBfanBlZyBkc3RfYnVmZmVyIGZhaWwgISEhXG4iKTsNCj4gPiArCQly
ZXR1cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZHN0X2RvbmVfYnVmID0gY29udGFpbmVyX29m
KGRzdF9idWZmZXIsIHN0cnVjdA0KPiA+IG10a19qcGVnX3NyY19idWYsIGIpOw0KPiA+ICsNCj4g
PiArCXNwaW5fbG9ja19pcnFzYXZlKCZjdHgtPmRvbmVfcXVldWVfbG9jaywgZmxhZ3MpOw0KPiA+
ICsJbGlzdF9hZGRfdGFpbCgmZHN0X2RvbmVfYnVmLT5saXN0LCAmY3R4LT5kc3RfZG9uZV9xdWV1
ZSk7DQo+ID4gKwl3aGlsZSAoIWxpc3RfZW1wdHkoJmN0eC0+ZHN0X2RvbmVfcXVldWUpICYmDQo+
ID4gKwkgICAgICAgKHBvcyAhPSAmY3R4LT5kc3RfZG9uZV9xdWV1ZSkpIHsNCj4gPiArCQlsaXN0
X2Zvcl9lYWNoX3ByZXZfc2FmZShwb3MsDQo+ID4gKwkJCQkJdGVtcF9lbnRyeSwNCj4gPiArCQkJ
CQkoJmN0eC0+ZHN0X2RvbmVfcXVldWUpKSB7DQo+IA0KPiBUaGlzIGZpdHMgaW4gb25lIGxpbmUs
IGFzIGl0IHJlc3VsdHMgaW4gYmVpbmcgODEgY29sdW1ucyBsb25nLCBhbmQNCj4gcGFyZW50aGVz
aXMNCj4gYXJlIHJlZHVuZGFudCBmb3IgZHN0X2RvbmVfcXVldWUuDQo+IA0KPiBFdmVyeXRoaW5n
IGVsc2UgbG9va3Mgb2sgdG8gbWUuDQo+IA0KPiBSZWdhcmRzLA0KPiBBbmdlbG8NCg0KSGkgQW5n
ZWxvLA0KVGhhbmtzLiBJIHdpbGwgZml4IHRoaXMgcHJvYmxlbS4NCg0KUmVnYXJkcywNCkt5cmll
Lg0K


