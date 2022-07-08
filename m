Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D0FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppHySCe2sLg9rKFk8bAZJe4j5Z4WWp/w+FfVREegsO0=; b=iIQ3/x2qkDVs8F0poeTpg5wSCD
	/Bdb7U1D680zPeekGUpIvXhmJpd3fd3sQCqClVUmVOdxzuwaHBEViHVjuR4YTzJHNP6ZzfY4mqKwK
	8BDJq5MrkHaPjOmrEOI4yVmL+zBmL8QfIzrktfhqXDlrE0XefYQHt7k5y3+mFpufyuAYsHd80kpiY
	hCq4UZpTditdP5mErmEii9wtrm1MPr2PlXmYhpKyu/DC2dHloNPhcPr4vOQfYu+DDFoN5njGCsswQ
	RRsXw+bsdYZulztyzHMnC9wFF8KaUGWEXNX+HQ0+Aa3NkAA7/QPufhxTr2IbcAFAcMncIM2R3FfKm
	SbofUsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9gye-001tE6-MF; Fri, 08 Jul 2022 05:56:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9gyb-001tB6-EX
	for linux-mediatek@lists.infradead.org; Fri, 08 Jul 2022 05:56:31 +0000
X-UUID: 4b4b790ec2cb4f3790bfb1fed31a4796-20220707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ppHySCe2sLg9rKFk8bAZJe4j5Z4WWp/w+FfVREegsO0=;
	b=jIL7L5TH7/ciotCHozIuiY2uUTCw62c8yRRKqzmFg44GrNN1iKVgmeQoQPRPHVu/xIYKeyoLO9/e1l2/LyVm9v0fOPsxanL7MkULnh+wXPQoJ/epAGziCtmTlwX79h6pFegrrPG+c84LT9rc+THAajC+SokzJwsZ41Fbij6EZiI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:130f2d45-d5bf-4b2d-948b-51908aeabed4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:875ff1d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4b4b790ec2cb4f3790bfb1fed31a4796-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1305879079; Thu, 07 Jul 2022 22:56:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 13:35:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 13:35:42 +0800
Message-ID: <42c0fd8acfb5a99fd33cb5245a54ed9037124f4f.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 for each instance
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
Date: Fri, 8 Jul 2022 13:35:42 +0800
In-Reply-To: <20220704084930.1625768-1-wenst@chromium.org>
References: <20220704084930.1625768-1-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_225629_539330_EE9607C0 
X-CRM114-Status: GOOD (  21.60  )
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

SGkgQ2hlbi1ZdSwNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KDQpSZXZpZXdlZC1ieTogWXVu
ZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4NCg0KQmVzdCBSZWdhcmRzLA0KWXVu
ZmVpIERvbmcNCg0KT24gTW9uLCAyMDIyLTA3LTA0IGF0IDE2OjQ5ICswODAwLCBDaGVuLVl1IFRz
YWkgd3JvdGU6DQo+IFRoZSBkZWNvZGVyIHBhcmFtZXRlcnMgYXJlIHN0b3JlZCBpbiBlYWNoIGlu
c3RhbmNlJ3MgY29udGV4dCBkYXRhLg0KPiBUaGlzDQo+IG5lZWRzIHRvIGJlIGluaXRpYWxpemVk
IHBlci1pbnN0YW5jZSwgYnV0IGEgcHJldmlvdXMgZml4IGluY29ycmVjdGx5DQo+IGNoYW5nZWQg
aXQgdG8gb25seSBiZSBpbml0aWFsaXplZCBmb3IgdGhlIGZpcnN0IG9wZW5lZCBpbnN0YW5jZS4g
VGhpcw0KPiByZXN1bHRlZCBpbiBzdWJzZXF1ZW50IGluc3RhbmNlcyBub3QgY29ycmVjdGx5IHNp
Z25hbGluZyB0aGUNCj4gcmVxdWlyZW1lbnQNCj4gZm9yIHRoZSBSZXF1ZXN0cyBBUEkuDQo+IA0K
PiBGaXggdGhpcyBieSBjYWxsaW5nIHRoZSBpbml0aWFsaXppbmcgZnVuY3Rpb24gb3V0c2lkZSBv
ZiB0aGUNCj4gdjRsMl9maF9pc19zaW5ndWxhcigpIGNvbmRpdGlvbmFsIGJsb2NrLg0KPiANCj4g
Rml4ZXM6IGZhZGRhYTczNWMyMCAoIm1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBJbml0aWFsaXpl
IGRlY29kZXINCj4gcGFyYW1ldGVycyBhZnRlciBnZXR0aW5nIGRlY19jYXBhYmlsaXR5IikNCj4g
U2lnbmVkLW9mZi1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+DQo+IC0tLQ0K
PiBUaGlzIHdhcyBmb3VuZCBkdXJpbmcgYmFja3BvcnQgb2YgbXRrLXZjb2RlYyBwYXRjaGVzIG9u
dG8gdGhlDQo+IENocm9tZU9TDQo+IHY1LjEwIGtlcm5lbCwgd2hpY2ggY2F1c2VkIG9uZSBvZiBv
dXIgdGVzdHMgdGhhdCBkb2VzIG11bHRpcGxlDQo+IGNvbmN1cnJlbnQNCj4gZGVjb2RlcyB0byBm
YWlsLCBhcyBzb21lIGRlY29kZXIgaW5zdGFuY2VzIGRpZG4ndCBoYXZlIHRoZWlyDQo+IHJlcXVp
cmVzX3JlcXVlc3RzIGFuZCBzdXBwb3J0c19yZXF1ZXN0cyBmbGFncyBtYXJrZWQgY29ycmVjdGx5
Lg0KPiBFdmlkZW50bHkgbXkgcHJldmlvdXMgdGVzdGluZyBvZiBjdWxwcml0IHBhdGNoIHdhcyBu
b3QgdGhvcm91Z2gNCj4gZW5vdWdoLg0KPiANCj4gVGhpcyBmaXhlcyBjb21taXQgZmFkZGFhNzM1
YzIwICgibWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IEluaXRpYWxpemUNCj4gZGVjb2Rlcg0KPiBw
YXJhbWV0ZXJzIGFmdGVyIGdldHRpbmcgZGVjX2NhcGFiaWxpdHkiKSBpbiB0aGUgbWVkaWEgc3Rh
Z2UgcmVwby4NCj4gVGhpcw0KPiBjb3VsZCBlaXRoZXIgYmUgcXVldWVkIHVwIGFmdGVyIGl0LCBv
ciBzcXVhc2hlZCBpbnRvIGl0Lg0KPiANCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQNCj4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYu
Yw0KPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNf
ZGVjX2Rydi5jDQo+IGluZGV4IDU1ZGZmYjYxZTU4Yy4uZTBiNmFlOWQ2Y2FhIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2Rl
Y19kcnYuYw0KPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9t
dGtfdmNvZGVjX2RlY19kcnYuYw0KPiBAQCAtMjA4LDExICsyMDgsMTIgQEAgc3RhdGljIGludCBm
b3BzX3Zjb2RlY19vcGVuKHN0cnVjdCBmaWxlICpmaWxlKQ0KPiAgDQo+ICAJCWRldi0+ZGVjX2Nh
cGFiaWxpdHkgPQ0KPiAgCQkJbXRrX3Zjb2RlY19md19nZXRfdmRlY19jYXBhKGRldi0+ZndfaGFu
ZGxlcik7DQo+IC0JCWN0eC0+ZGV2LT52ZGVjX3BkYXRhLT5pbml0X3ZkZWNfcGFyYW1zKGN0eCk7
DQo+ICANCj4gIAkJbXRrX3Y0bDJfZGVidWcoMCwgImRlY29kZXIgY2FwYWJpbGl0eSAleCIsIGRl
di0NCj4gPmRlY19jYXBhYmlsaXR5KTsNCj4gIAl9DQo+ICANCj4gKwljdHgtPmRldi0+dmRlY19w
ZGF0YS0+aW5pdF92ZGVjX3BhcmFtcyhjdHgpOw0KPiArDQo+ICAJbGlzdF9hZGQoJmN0eC0+bGlz
dCwgJmRldi0+Y3R4X2xpc3QpOw0KPiAgDQo+ICAJbXV0ZXhfdW5sb2NrKCZkZXYtPmRldl9tdXRl
eCk7DQo=


