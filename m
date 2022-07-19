Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A65C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 16:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzzqhn2kxIB5V/vIa6aWnalB5AgOKW17azKMrZrF9UE=; b=EGDCMbzGYINoyf+NvnSc/StfDh
	Q76YywfISLHNBUreEp8o/bJrPvuDuE9xXREKFhFHxVx+9CKNLHbzSLrZbF9+cdVAay9kQDpR8BEBa
	swVgK/3de/y2AUPaRMFMLDudLtuVfztm8P/mlxr5zSJZIZosag6r0YqBDMazFV+GIscf9Co6CCwP1
	XLrWG/G8aOpIK5JNOxvinkqdc2Qy8XIr/Mx8cXAdZkVO8KaalUVVKa8ZX++z9CqL1EfXz5y+9CXTw
	tDiTx8B2+pRndNyVJiSjXp5wWrbBHsawzXRKP4Wg2iT6NqoqLnrjdZDMtFZPnzey7BIq1re5bmJLQ
	x79Ka6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDqQV-00AbPj-1i; Tue, 19 Jul 2022 16:50:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDqQR-00AbMg-4C; Tue, 19 Jul 2022 16:50:26 +0000
X-UUID: 89eee7a2116d4305825facd2aca6a704-20220719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mzzqhn2kxIB5V/vIa6aWnalB5AgOKW17azKMrZrF9UE=;
	b=tl3SlnEermNvqLBLDXlaBFp/boo+lzWtuVNee8tU72jl+fRQV01xOw71RDa9UuZqN836Fp7tzC8VfZw79IrHA5OS6MA/ZuQ1TWYjBIyEAwHHeGnJVWbGeImHgWttSgqZsz2u7C+DSXp2cGHv854D/R5NsHmbOWjtjYz+4gtv/lI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:803e8db4-f0c2-49f4-915d-a36aa6309bf6,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:87896733-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 89eee7a2116d4305825facd2aca6a704-20220719
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 379854511; Tue, 19 Jul 2022 09:50:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 20 Jul 2022 00:19:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 20 Jul 2022 00:19:42 +0800
Message-ID: <9686bb9f16cf2a5f236b98b2467345465097cede.camel@mediatek.com>
Subject: Re: [PATCH v2] USB: mtu3: tracing: Use the new __vstring() helper
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Date: Wed, 20 Jul 2022 00:19:42 +0800
In-Reply-To: <20220719112719.17e796c6@gandalf.local.home>
References: <20220719112719.17e796c6@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_095023_199679_84F87945 
X-CRM114-Status: GOOD (  17.99  )
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

T24gVHVlLCAyMDIyLTA3LTE5IGF0IDExOjI3IC0wNDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToN
Cj4gRnJvbTogIlN0ZXZlbiBSb3N0ZWR0IChHb29nbGUpIiA8cm9zdGVkdEBnb29kbWlzLm9yZz4N
Cj4gDQo+IEluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgYSBfX2R5bmFtaWNfYXJyYXkoKSB3aXRoIGEg
Zml4ZWQgbGVuZ3RoICh3aGljaA0KPiBkZWZlYXRzIHRoZSBwdXJwb3NlIG9mIHRoZSBkeW5hbWlj
IGFycmF5IGluIHRoZSBmaXJzdCBwbGFjZSkuIFVzZSB0aGUNCj4gbmV3DQo+IF9fdnN0cmluZygp
IGhlbHBlciB0aGF0IHdpbGwgdXNlIGEgdmFfbGlzdCBhbmQgb25seSB3cml0ZSBlbm91Z2ggb2YN
Cj4gdGhlDQo+IHN0cmluZyBpbnRvIHRoZSByaW5nIGJ1ZmZlciB0aGF0IGlzIG5lZWRlZC4NCj4g
DQo+IENjOiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+IENjOiBJ
bmdvIE1vbG5hciA8bWluZ29Aa2VybmVsLm9yZz4NCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1A
bGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+
IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQWNrZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBS
b3N0ZWR0IChHb29nbGUpIDxyb3N0ZWR0QGdvb2RtaXMub3JnPg0KPiAtLS0NCj4gQ2hhbmdlcyBz
aW5jZSB2MTogDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xrbWwua2Vy
bmVsLm9yZy9yLzIwMjIwNzA1MjI0NzUwLjM1NDkyNjUzNUBnb29kbWlzLm9yZ19fOyEhQ1RSTktB
OXdNZzBBUmJ3IXc0SzY2SllrUktTR1ctZW01cTJMNkZKNllJX1o4MVBBbm5USnJCSmF5VzZwZl8t
SlZkNS1CNWRhR3RvX2ZyZHRCSmN6JA0KPiAgDQo+IA0KPiAgLSBSZW1vdmVkIE1UVTNfTVNHX01B
WCBkZWZpbmUuIChDaHVuZmVuZyBZdW4pDQo+IA0KPiAgZHJpdmVycy91c2IvbXR1My9tdHUzX3Ry
YWNlLmggfCA2ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJh
Y2UuaA0KPiBiL2RyaXZlcnMvdXNiL210dTMvbXR1M190cmFjZS5oDQo+IGluZGV4IDFiODk3NjM2
ZGFmMi4uYTk4ZmEwMTJiNzI5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210dTNf
dHJhY2UuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuaA0KPiBAQCAtMTgs
MTggKzE4LDE2IEBADQo+ICANCj4gICNpbmNsdWRlICJtdHUzLmgiDQo+ICANCj4gLSNkZWZpbmUg
TVRVM19NU0dfTUFYCTI1Ng0KPiAtDQo+ICBUUkFDRV9FVkVOVChtdHUzX2xvZywNCj4gIAlUUF9Q
Uk9UTyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB2YV9mb3JtYXQgKnZhZiksDQo+ICAJVFBf
QVJHUyhkZXYsIHZhZiksDQo+ICAJVFBfU1RSVUNUX19lbnRyeSgNCj4gIAkJX19zdHJpbmcobmFt
ZSwgZGV2X25hbWUoZGV2KSkNCj4gLQkJX19keW5hbWljX2FycmF5KGNoYXIsIG1zZywgTVRVM19N
U0dfTUFYKQ0KPiArCQlfX3ZzdHJpbmcobXNnLCB2YWYtPmZtdCwgdmFmLT52YSkNCj4gIAkpLA0K
PiAgCVRQX2Zhc3RfYXNzaWduKA0KPiAgCQlfX2Fzc2lnbl9zdHIobmFtZSwgZGV2X25hbWUoZGV2
KSk7DQo+IC0JCXZzbnByaW50ZihfX2dldF9zdHIobXNnKSwgTVRVM19NU0dfTUFYLCB2YWYtPmZt
dCwgKnZhZi0NCj4gPnZhKTsNCj4gKwkJX19hc3NpZ25fdnN0cihtc2csIHZhZi0+Zm10LCB2YWYt
PnZhKTsNCj4gIAkpLA0KPiAgCVRQX3ByaW50aygiJXM6ICVzIiwgX19nZXRfc3RyKG5hbWUpLCBf
X2dldF9zdHIobXNnKSkNCj4gICk7DQpUZXN0ZWQtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcu
eXVuQG1lZGlhdGVrLmNvbT4NCg0KVGhhbmtzIGEgbG90DQo=


