Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC73C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLML3yUdu7WMZuVGtHO1Vj277dTcWps565dKcCfaBY8=; b=x+KngTd1bSq5rxttPXxVY6n0xu
	4ouwtbgmAHbzOh5r6VfIP/uc7BIWbaSzpB7myIk5CooApl23ggyA/owK7XLjeu9ADeWd2joRfB0nC
	xuYvnluMfc/8nPNgudm8Ys48XctwZytHoAHWOvxBhW9axP8sfsj1gwHJEylNpGoBLuey7WOpf2OiY
	fZd2lSGFNotcY+NvUh2j/Qu692Ti185qNVrr9QACe+io0E+GclP/GM9cwAczNdxGXUB1mI4QXAGVa
	FeNJRb7Z6nutMOlE0mlue/F9pTR8/EZ71hEu7iSsLhXgOe0Zi0vFkbR5Vfrx1TGSKSiOOgRFJgJeQ
	OOgHM5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ59-006Tm0-F4; Fri, 15 Jul 2022 11:02:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ55-006Tjx-VI; Fri, 15 Jul 2022 11:02:01 +0000
X-UUID: fae1eebebb2f47d1878afd711cb5ab6f-20220715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wLML3yUdu7WMZuVGtHO1Vj277dTcWps565dKcCfaBY8=;
	b=dHSHpnu3pO/Xu4lolZZYtVbKYFCw1lW8UBKUpeUOcpzcthrf2RIPiPXZ319fJJK47XpLn1OYdu/+340gMRtmOcP6LmkTHjA6aE891spEcPqMJuLu+PfW0ZnQnS9yBWKHmr5TqSQHPsr8hidTi2sjp0Y6R1rib5jFRixig0OQ9+4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:882a39a1-595d-4414-a708-931b854b9ffb,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:d0b86664-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fae1eebebb2f47d1878afd711cb5ab6f-20220715
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 704011714; Fri, 15 Jul 2022 04:01:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 15 Jul 2022 18:01:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 15 Jul 2022 18:01:44 +0800
Message-ID: <962e59c25e981676014157cd111db9e16e237339.camel@mediatek.com>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>, <linux-kernel@vger.kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Date: Fri, 15 Jul 2022 18:01:44 +0800
In-Reply-To: <20220714164330.311734558@goodmis.org>
References: <20220714164256.403842845@goodmis.org>
	 <20220714164330.311734558@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_040200_037392_E16C5D3B 
X-CRM114-Status: GOOD (  16.00  )
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

T24gVGh1LCAyMDIyLTA3LTE0IGF0IDEyOjQzIC0wNDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToN
Cj4gRnJvbTogIlN0ZXZlbiBSb3N0ZWR0IChHb29nbGUpIiA8cm9zdGVkdEBnb29kbWlzLm9yZz4N
Cj4gDQo+IEluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgYSBfX2R5bmFtaWNfYXJyYXkoKSB3aXRoIGEg
Zml4ZWQgbGVuZ3RoICh3aGljaA0KPiBkZWZlYXRzIHRoZSBwdXJwb3NlIG9mIHRoZSBkeW5hbWlj
IGFycmF5IGluIHRoZSBmaXJzdCBwbGFjZSkuIFVzZSB0aGUNCj4gbmV3DQo+IF9fdnN0cmluZygp
IGhlbHBlciB0aGF0IHdpbGwgdXNlIGEgdmFfbGlzdCBhbmQgb25seSB3cml0ZSBlbm91Z2ggb2YN
Cj4gdGhlDQo+IHN0cmluZyBpbnRvIHRoZSByaW5nIGJ1ZmZlciB0aGF0IGlzIG5lZWRlZC4NCj4g
DQo+IExpbms6IA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sa21sLmtl
cm5lbC5vcmcvci8yMDIyMDcwNTIyNDc1MC4zNTQ5MjY1MzVAZ29vZG1pcy5vcmdfXzshIUNUUk5L
QTl3TWcwQVJidyF3OG54NjZCS0RUdHl1c3A1aTJweXpPR05iLVF5eElBV2pvWndtU1FZMHp6b3Jf
cnF2QmdVbTVfX3ZLSzk4QXBLY0RpYyQNCj4gIA0KPiANCj4gQ2M6IENodW5mZW5nIFl1biA8Y2h1
bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwu
b3JnPg0KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4NCj4g
Q2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZw0KPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
Zw0KPiBBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFJvc3RlZHQgKEdvb2dsZSkgPHJvc3RlZHRA
Z29vZG1pcy5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNlLmggfCA0
ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNlLmgNCj4gYi9k
cml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuaA0KPiBpbmRleCAxYjg5NzYzNmRhZjIuLmVmM2Mx
N2UyZjhhNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNlLmgNCj4g
KysrIGIvZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNlLmgNCj4gQEAgLTI1LDExICsyNSwxMSBA
QCBUUkFDRV9FVkVOVChtdHUzX2xvZywNCj4gIAlUUF9BUkdTKGRldiwgdmFmKSwNCj4gIAlUUF9T
VFJVQ1RfX2VudHJ5KA0KPiAgCQlfX3N0cmluZyhuYW1lLCBkZXZfbmFtZShkZXYpKQ0KPiAtCQlf
X2R5bmFtaWNfYXJyYXkoY2hhciwgbXNnLCBNVFUzX01TR19NQVgpDQo+ICsJCV9fdnN0cmluZyht
c2csIHZhZi0+Zm10LCB2YWYtPnZhKQ0KPiAgCSksDQo+ICAJVFBfZmFzdF9hc3NpZ24oDQo+ICAJ
CV9fYXNzaWduX3N0cihuYW1lLCBkZXZfbmFtZShkZXYpKTsNCj4gLQkJdnNucHJpbnRmKF9fZ2V0
X3N0cihtc2cpLCBNVFUzX01TR19NQVgsIHZhZi0+Zm10LCAqdmFmLQ0KPiA+dmEpOw0KPiArCQlf
X2Fzc2lnbl92c3RyKG1zZywgdmFmLT5mbXQsIHZhZi0+dmEpOw0KPiAgCSksDQo+ICAJVFBfcHJp
bnRrKCIlczogJXMiLCBfX2dldF9zdHIobmFtZSksIF9fZ2V0X3N0cihtc2cpKQ0KPiAgKTsNCg0K
QWZ0ZXIgYXBwbHkgdGhpcyBwYXRjaCwgZW5jb3VudGVyIGFuIGlzc3VlLCBwbGVhc2UgY2hlY2sg
aXQNCg0KIGlycS8yNTQtMTEyMDEwMC0xMzcgICAgIFswMDBdIGQuLjEuICAgMjY2LjU0OTQ3Mzog
bXR1M191Ml9jb21tb25faXNyOg0KKDAwMDAwMDA0KSAgIFJFU0VUDQogaXJxLzI1NC0xMTIwMTAw
LTEzNyAgICAgWzAwMF0gZC4uMS4gICAyNjYuNjI5Mzk5OiBtdHUzX2xvZzoNCjExMjAxMDAwLnVz
YjogbGluayBzcGVlZCBzdXBlci1zcGVlZA0KIGlycS8yNTQtMTEyMDEwMC0xMzcgICAgIFswMDBd
IGQuLjEuICAgMjY2LjYyOTY2MjogbXR1M19sb2c6DQoxMTIwMTAwMC51c2I6IGVwMF9zdGF0ZSBT
RVRVUHItc3BlZWQNCiBpcnEvMjU0LTExMjAxMDAtMTM3ICAgICBbMDAwXSBkLi4xLiAgIDI2Ni42
Mjk2Njg6IG10dTNfaGFuZGxlX3NldHVwOg0Kc2V0dXAgLSAwMCAwNSAwMDFjIDAwMDAgMDAwMA0K
IGlycS8yNTQtMTEyMDEwMC0xMzcgICAgIFswMDBdIGQuLjEuICAgMjY2LjYyOTcyMjogbXR1M19s
b2c6DQoxMTIwMTAwMC51c2I6IGVwMF9zdGF0ZSBTRVRVUHItc3BlZWQNCg0Kd2l0aG91dCB0aGlz
IHBhdGNoOg0KIGlycS8yNTQtMTEyMDEwMC0xMzUgICAgIFswMDBdIGQuLjEuICAxNDA3LjQyNTU1
MDogbXR1M191Ml9jb21tb25faXNyOg0KKDAwMDAwMDA0KSAgIFJFU0VUDQogaXJxLzI1NC0xMTIw
MTAwLTEzNSAgICAgWzAwMF0gZC4uMS4gIDE0MDcuNDc1Mjk1OiBtdHUzX2xvZzoNCjExMjAxMDAw
LnVzYjogbGluayBzcGVlZCBzdXBlci1zcGVlZA0KIGlycS8yNTQtMTEyMDEwMC0xMzUgICAgIFsw
MDBdIGQuLjEuICAxNDA3LjQ3NzQ2OTogbXR1M19sb2c6DQoxMTIwMTAwMC51c2I6IGVwMF9zdGF0
ZSBTRVRVUA0KIGlycS8yNTQtMTEyMDEwMC0xMzUgICAgIFswMDBdIGQuLjEuICAxNDA3LjQ3NzQ3
NjogbXR1M19oYW5kbGVfc2V0dXA6DQpzZXR1cCAtIDAwIDA1IDAwMWYgMDAwMCAwMDAwDQogaXJx
LzI1NC0xMTIwMTAwLTEzNSAgICAgWzAwMF0gZC4uMS4gIDE0MDcuNDc3NTE4OiBtdHUzX2xvZzoN
CjExMjAxMDAwLnVzYjogZXAwX3N0YXRlIFNFVFVQDQoNCnRoZSBzZWNvbmQgYW5kIHRoaXJkIGxp
bmVzIHdpdGggdGhpcyBwYXRjaDoNCiBpcnEvMjU0LTExMjAxMDAtMTM3ICAgICBbMDAwXSBkLi4x
LiAgIDI2Ni42MjkzOTk6IG10dTNfbG9nOg0KMTEyMDEwMDAudXNiOiBsaW5rIHNwZWVkIHN1cGVy
LXNwZWVkDQoNCiBpcnEvMjU0LTExMjAxMDAtMTM3ICAgICBbMDAwXSBkLi4xLiAgIDI2Ni42Mjk2
NjI6IG10dTNfbG9nOg0KMTEyMDEwMDAudXNiOiBlcDBfc3RhdGUgU0VUVVByLXNwZWVkDQoNCiJy
LXNwZWVkIiBzZWVtcyB0aGUgcmVtYWluIG9mIGxhc3QgbG9nOw0KDQoNCg0KDQo=


