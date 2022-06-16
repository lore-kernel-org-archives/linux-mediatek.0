Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BB7C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc7ZjCqlSwjKYi36N9Sb01F4H4kh2tqOLB5lPnzwvlg=; b=BKVeQ7b9kfpk8AQSrscd7seglH
	H6FB6wqjEWIMepv72ySFb+Vq6vwPC778Tc6U7V5aWfO5WDffkaNDWcE0+qKacA/l9TJ7VgxwUCLpo
	3+GZWTdxdvCs/XTkaW9Uf1vMI6n1+1x4J6/cM5itAvxDc6fZC+RkJ1MTCbGbfHvIsbU7oGT7HIA4N
	KZi4A1AnGyBdMgYuqn4/lnGeVYlk0fnqKlEwsFuFbgc3XTIGgqOKopcb4S+S/Tnz1w/KAQ9Zexc5W
	0hKguaVSrrOb5P2JC/57BIvWUkA9MkAeYEUzukj6v0oPC5iGVGgLkyzFB6E2E/mzH0/HXJ7NppJ98
	LiuxdUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mQU-001oU4-3S; Thu, 16 Jun 2022 10:08:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mQR-001oT6-B2; Thu, 16 Jun 2022 10:08:33 +0000
X-UUID: 868fbef203c64989b3c80b222cc076f5-20220616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=sc7ZjCqlSwjKYi36N9Sb01F4H4kh2tqOLB5lPnzwvlg=;
	b=Ocg2xwza4DfO2Y5g8pDGOWWx9QFIl2//BUD98YGmZK8foatTNBDBeIdy8Z1AgIuZ1nQdlXXRZGZQSWcKz2LEMEDkgg7kNDaMBiKvkH0VJPKeXqiv8gxnDLfyYFIc/EWxf5pYOVPExaLf51bUwSAigbr5cSFw+P4g4BXWRAADxrg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:809838eb-f98d-469a-85a0-f9cd5cae6903,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:3166be48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 868fbef203c64989b3c80b222cc076f5-20220616
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2089657705; Thu, 16 Jun 2022 03:08:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 03:08:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 18:08:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 18:08:21 +0800
Message-ID: <b2ea919315d0084adb465378e6970dbfa4f0829e.camel@mediatek.com>
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Add error path for loop of
 mm_dts_parse
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Date: Thu, 16 Jun 2022 18:08:21 +0800
In-Reply-To: <e2091397-b6e2-7296-1378-dc10b24c6ef4@arm.com>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
	 <20220616054203.11365-3-yong.wu@mediatek.com>
	 <e2091397-b6e2-7296-1378-dc10b24c6ef4@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_030831_429902_D77C359B 
X-CRM114-Status: GOOD (  25.06  )
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

T24gVGh1LCAyMDIyLTA2LTE2IGF0IDA5OjU5ICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6DQo+
IE9uIDIwMjItMDYtMTYgMDY6NDIsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gVGhlIG10a19pb21tdV9t
bV9kdHNfcGFyc2Ugd2lsbCBwYXJzZSB0aGUgc21pIGxhcmJzIG5vZGVzLiBpZiB0aGUNCj4gPiBp
KzENCj4gPiBsYXJiIGlzIHBhcnNlZCBmYWlsKHJldHVybiAtRUlOVkFMKSwgd2Ugc2hvdWxkIG9m
X25vZGVfcHV0IGZvciB0aGUNCj4gPiAwLi5pDQo+ID4gbGFyYnMuIEluIHRoZSBmYWlsIHBhdGgs
IG9uZSBvZl9ub2RlX3B1dCBtYXRjaGVzIHdpdGgNCj4gPiBvZl9wYXJzZV9waGFuZGxlIGluDQo+
ID4gaXQuDQo+ID4gDQo+ID4gRml4ZXM6IGQyZTlhMTEwMmNmYyAoImlvbW11L21lZGlhdGVrOiBD
b250YWluIE1NIElPTU1VIGZsb3cgd2l0aA0KPiA+IHRoZSBNTSBUWVBFIikNCj4gPiBTaWduZWQt
b2ZmLWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRy
aXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgfCAyMSArKysrKysrKysrKysrKysrLS0tLS0NCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L210a19pb21tdS5jIGIvZHJpdmVycy9pb21t
dS9tdGtfaW9tbXUuYw0KPiA+IGluZGV4IDNiMjQ4OWU4YTZkZC4uYWIyNDA3ODkzOGJmIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMNCj4gPiArKysgYi9kcml2ZXJz
L2lvbW11L210a19pb21tdS5jDQo+ID4gQEAgLTEwNzEsMTIgKzEwNzEsMTIgQEAgc3RhdGljIGlu
dCBtdGtfaW9tbXVfbW1fZHRzX3BhcnNlKHN0cnVjdA0KPiA+IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
Y29tcG9uZW50X21hdGNoICoqbQ0KPiA+ICAgDQo+ID4gICAJCXBsYXJiZGV2ID0gb2ZfZmluZF9k
ZXZpY2VfYnlfbm9kZShsYXJibm9kZSk7DQo+ID4gICAJCWlmICghcGxhcmJkZXYpIHsNCj4gPiAt
CQkJb2Zfbm9kZV9wdXQobGFyYm5vZGUpOw0KPiA+IC0JCQlyZXR1cm4gLUVOT0RFVjsNCj4gPiAr
CQkJcmV0ID0gLUVOT0RFVjsNCj4gPiArCQkJZ290byBlcnJfbGFyYm5vZGVfcHV0Ow0KPiA+ICAg
CQl9DQo+ID4gICAJCWlmICghcGxhcmJkZXYtPmRldi5kcml2ZXIpIHsNCj4gPiAtCQkJb2Zfbm9k
ZV9wdXQobGFyYm5vZGUpOw0KPiA+IC0JCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gPiArCQkJ
cmV0ID0gLUVQUk9CRV9ERUZFUjsNCj4gPiArCQkJZ290byBlcnJfbGFyYm5vZGVfcHV0Ow0KPiA+
ICAgCQl9DQo+ID4gICAJCWRhdGEtPmxhcmJfaW11W2lkXS5kZXYgPSAmcGxhcmJkZXYtPmRldjsN
Cj4gPiAgIA0KPiA+IEBAIC0xMTA3LDkgKzExMDcsMjAgQEAgc3RhdGljIGludCBtdGtfaW9tbXVf
bW1fZHRzX3BhcnNlKHN0cnVjdA0KPiA+IGRldmljZSAqZGV2LCBzdHJ1Y3QgY29tcG9uZW50X21h
dGNoICoqbQ0KPiA+ICAgCQkJICAgICAgIERMX0ZMQUdfU1RBVEVMRVNTIHwgRExfRkxBR19QTV9S
VU5USU1FKTsNCj4gPiAgIAlpZiAoIWxpbmspIHsNCj4gPiAgIAkJZGV2X2VycihkZXYsICJVbmFi
bGUgdG8gbGluayAlcy5cbiIsIGRldl9uYW1lKGRhdGEtDQo+ID4gPnNtaWNvbW1fZGV2KSk7DQo+
ID4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gPiArCQlnb3Rv
IGVycl9sYXJibm9kZV9wdXQ7DQo+ID4gICAJfQ0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICsNCj4g
PiArZXJyX2xhcmJub2RlX3B1dDoNCj4gPiArCXdoaWxlIChpLS0pIHsNCj4gPiArCQlsYXJibm9k
ZSA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2LT5vZl9ub2RlLA0KPiA+ICJtZWRpYXRlayxsYXJicyIs
IGkpOw0KPiA+ICsJCWlmIChsYXJibm9kZSAmJiBvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKGxhcmJu
b2RlKSkgew0KPiA+ICsJCQlvZl9ub2RlX3B1dChsYXJibm9kZSk7DQo+ID4gKwkJCW9mX25vZGVf
cHV0KGxhcmJub2RlKTsNCj4gPiArCQl9DQo+IA0KPiBUaGlzIGxvb2tzIGEgYml0IGF3a3dhcmQg
LSBjb3VsZCB3ZSBub3QganVzdCBpdGVyYXRlIHRocm91Z2ggDQo+IGRhdGEtPmxhcmJfaW11IGFu
ZCBwdXQgZGV2LT5vZl9ub2RlIGZvciBlYWNoIHZhbGlkIGRldj8NCg0KSXQgc2hvdWxkIHdvcmsu
IFRoYW5rcyB2ZXJ5IG11Y2guDQoNCj4gDQo+IEFsc28sIG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUo
KSB0YWtlcyBhIHJlZmVyZW5jZSBvbiB0aGUgc3RydWN0DQo+IGRldmljZSANCj4gaXRzZWxmLCBz
byBzdHJpY3RseSB3ZSBzaG91bGQgYmUgZG9pbmcgcHV0X2RldmljZSgpIG9uIHRob3NlIGFzIHdl
bGwNCj4gaWYgd2UncmUgYmFpbGluZyBvdXQuDQoNClRoYW5rcyBmb3IgdGhpcyBoaW50LiBBIG5l
dyByZWZlcmVuY2UgZm9yIG1lLiBJIHdpbGwgYWRkIGl0Lg0KDQo+IA0KPiBSb2Jpbi4NCj4gDQo+
ID4gKwl9DQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gICBzdGF0aWMg
aW50IG10a19pb21tdV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K


