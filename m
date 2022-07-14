Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07530C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhZPYWENQcc8Mxb6WOwNWGraFlghwHpwwtLiP/F4IJ4=; b=Q23hIc6P9QLWsgv5xtEF48pVGm
	6/JGFD0DowdjYFtTbzRQ5Ap7c5NE1Y6VyJQW1WzpAmBZzQoyLw4t20oRb951Rh7y1nOzp3OwLmfLQ
	YVbMwxnsaZ+n+jzdYmOE9UsE9LBogcDKmc1j7ww74ujE98fk0lYVNJuzYpSkHcMZ4g1BJx6loQyj2
	FBwiK4N3eHnfibCS0ycvq2F80mB6DPlOGNOIK5COYAHsI1W/bl2iSgUxzM/A+K2rtGNSmQCfFvU55
	+nVB0cpSJunnP3GiiYpw1LH6qJkY5138GqoDfVaY8x4paev9tnhqQEkzLiA1ESl36qRu9RrK/f3I5
	uoqNBLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0Dl-00FNvQ-Vf; Thu, 14 Jul 2022 14:53:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0Dh-00FNqV-7Y; Thu, 14 Jul 2022 14:53:40 +0000
X-UUID: 736a9c08bb6249fcb031640c913d7691-20220714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=fhZPYWENQcc8Mxb6WOwNWGraFlghwHpwwtLiP/F4IJ4=;
	b=PIqqjuFgAnPdZEiWvbJ6DBEjtG9cDLVUQmvCLErZ6sWX9P6N8I3ax5tU5WTTiSkIdsajMZqUCq/4x7bfAOwzPXgQuI87y1pLhPhq0HgZDi6/MjvjjXscHU087QLev/Tlv2k+RBMVXOUBVPlnpZNx4z4uA6Nt9V6Y1FtoKIayxME=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6b82517e-a17e-4298-abbd-72805a6c204f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:fd7c81d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 736a9c08bb6249fcb031640c913d7691-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1867698422; Thu, 14 Jul 2022 07:53:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 21:52:53 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 21:52:52 +0800
Message-ID: <4ae9195bd52191ffb816c86cf18a38daf7c66f43.camel@mediatek.com>
Subject: Re: [PATCH 1/1] dt-bindings: uart: update bindings for MT8188 SoC
From: Kewei Xu <kewei.xu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
	<qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <david-yh.chiu@mediatek.com>
Date: Thu, 14 Jul 2022 21:52:52 +0800
In-Reply-To: <468507bc-e10d-0d7c-aa77-bab4769efbcf@collabora.com>
References: <20220714104149.23343-1-kewei.xu@mediatek.com>
	 <468507bc-e10d-0d7c-aa77-bab4769efbcf@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_075337_299153_4C2ED9AD 
X-CRM114-Status: GOOD (  15.27  )
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

T24gVGh1LCAyMDIyLTA3LTE0IGF0IDE0OjMwICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTQvMDcvMjIgMTI6NDEsIGtld2VpLnh1QG1lZGlhdGVrLmNvbSBo
YSBzY3JpdHRvOg0KPiA+IEZyb206IEtld2VpIFh1IDxrZXdlaS54dUBtZWRpYXRlay5jb20+DQo+
ID4gDQo+ID4gQWRkIGEgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgTVQ4MTg4IHNv
Yy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXdlaSBYdSA8a2V3ZWkueHVAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gVGhpcyBmaWxlIGRvZXNuJ3QgZXZlbiBleGlzdCBhbnltb3JlLiBJJ3ZlIGNv
bnZlcnRlZCBpdCB0byBqc29uLQ0KPiBzY2hlbWEsIGNoZWNrDQo+IG91dCBjb21taXQgMjJiMTBi
MzNiOWM2ZTc2YmMwOGY2NGU1Mjg2MmU2OGM0ZGM3NjA1Mg0KPiANCj4gUmVnYXJkcywNCj4gQW5n
ZWxvDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseSwgSSdsbCBjb25maXJtIHRoZSBicmFuY2gg
dmVyc2lvbiBhbmQgcmUtcHVzaA0KdGhlIHBhdGNoIGJhc2VkIG9uIHRoZSBsYXRlc3QgY29kZWJh
c2UuDQoNClJlZ2FyZHMsDQpLZXdlaQ0KPiA+IC0tLQ0KPiA+ICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9tdGstdWFydC50eHQgfCAxICsNCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL210ay11YXJ0LnR4dA0KPiA+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9tdGstdWFydC50eHQNCj4gPiBpbmRl
eCAxMTNiNWQ2YTIyNDUuLmU1MDk0ZTFkYjdiNCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL210ay11YXJ0LnR4dA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvbXRrLXVhcnQudHh0DQo+ID4g
QEAgLTIxLDYgKzIxLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAgICAgKiAibWVkaWF0
ZWssbXQ4MTczLXVhcnQiIGZvciBNVDgxNzMgY29tcGF0aWJsZSBVQVJUUw0KPiA+ICAgICAqICJt
ZWRpYXRlayxtdDgxODMtdWFydCIsICJtZWRpYXRlayxtdDY1NzctdWFydCIgZm9yIE1UODE4Mw0K
PiA+IGNvbXBhdGlibGUgVUFSVFMNCj4gPiAgICAgKiAibWVkaWF0ZWssbXQ4MTg2LXVhcnQiLCAi
bWVkaWF0ZWssbXQ2NTc3LXVhcnQiIGZvciBNVDgxODMNCj4gPiBjb21wYXRpYmxlIFVBUlRTDQo+
ID4gKyAgKiAibWVkaWF0ZWssbXQ4MTg4LXVhcnQiLCAibWVkaWF0ZWssbXQ2NTc3LXVhcnQiIGZv
ciBNVDgxODgNCj4gPiBjb21wYXRpYmxlIFVBUlRTDQo+ID4gICAgICogIm1lZGlhdGVrLG10ODE5
Mi11YXJ0IiwgIm1lZGlhdGVrLG10NjU3Ny11YXJ0IiBmb3IgTVQ4MTkyDQo+ID4gY29tcGF0aWJs
ZSBVQVJUUw0KPiA+ICAgICAqICJtZWRpYXRlayxtdDgxOTUtdWFydCIsICJtZWRpYXRlayxtdDY1
NzctdWFydCIgZm9yIE1UODE5NQ0KPiA+IGNvbXBhdGlibGUgVUFSVFMNCj4gPiAgICAgKiAibWVk
aWF0ZWssbXQ4NTE2LXVhcnQiIGZvciBNVDg1MTYgY29tcGF0aWJsZSBVQVJUUw0KPiA+IA0KPiAN
Cj4gDQo=


