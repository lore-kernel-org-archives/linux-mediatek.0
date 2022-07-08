Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBB3C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjmdkJt0XBwFjxApvFIOatFCLhZ6yOKc/HqJ/ZTnn6M=; b=KspcTZyd+LKWiWPkYUZm6eN2f1
	i0VUwAn1zkazZqYfP5lQojqvkqSCEx63H71zTQ3LWzobk7Ex/ZuwDU2E12r9WIfEtVCte1Cax4Xdq
	5pU5XzC4pDif9zW2LU9Oz8vBXNFtobK3NyjG82DEwOZZryoH4YmqFwZCpMv5rcsOXlkSAbIk3Rd8R
	TWG8bIvJmh8Zf4OXygUJTz04RR/Jcc1TWMIZi1Ysb5zJH5X7ET3Q195W1F9gmOx9uZm0oJXvANo82
	2rCSlDXs4MAO+ikjFNFpDLwQbCPC7xHxQ/NvLLEpqAzl4QqpupU+cZi+19yMc3AcNaZTNQ09OoFe1
	1H1tbTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lib-003K53-Jl; Fri, 08 Jul 2022 11:00:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9liY-003K2c-OP; Fri, 08 Jul 2022 11:00:16 +0000
X-UUID: 64e3f0c76ae14878b6106cc681132254-20220708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VjmdkJt0XBwFjxApvFIOatFCLhZ6yOKc/HqJ/ZTnn6M=;
	b=uDHYEFAlXF5fSVtpPRtaXw8EyK5WYGx97cvGZxnqejBtY12BwFngU5ea+zD5ml+YNTlug/H22YQN6gjgNp5fhx4YteHXs5pNiWDUjobT51zeMXTfEX+2XkfbqMoEnGM0d5JONGhlF9Dx/ujq1CRINEkFarpRsl+z/mzNZxD0/9w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5eb31563-b9ac-4a9b-a613-85b1f13a4911,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:cb29c763-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 64e3f0c76ae14878b6106cc681132254-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1305093034; Fri, 08 Jul 2022 04:00:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 18:19:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 8 Jul 2022 18:19:29 +0800
Message-ID: <503a71aa95b8e4b75eb7e9e5de03a013f5155036.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhongjun Tan <hbut_tan@163.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.c>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
	<tanzhongjun@coolpad.com>, <colin.king@intel.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 8 Jul 2022 18:19:29 +0800
In-Reply-To: <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
References: <20220708024651.42999-1-hbut_tan@163.com>
	 <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_040014_835263_94A0FCE3 
X-CRM114-Status: GOOD (  17.10  )
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

T24gRnJpLCAyMDIyLTA3LTA4IGF0IDEwOjAxICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMDgvMDcvMjIgMDQ6NDYsIFpob25nanVuIFRhbiBoYSBzY3JpdHRv
Og0KPiA+IEZyb206IFpob25nanVuIFRhbiA8dGFuemhvbmdqdW5AY29vbHBhZC5jb20+DQo+ID4g
DQo+ID4gUmVtb3ZlIGNvbmRpdGlvbiB3aXRoIG5vIGVmZmVjdA0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFpob25nanVuIFRhbiA8dGFuemhvbmdqdW5AY29vbHBhZC5jb20+DQo+ID4gLS0tDQo+
ID4gICBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTg2L210ODE4Ni1kYWktYWRkYS5jIHwgMiAtLQ0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxODYvbXQ4MTg2LWRhaS1hZGRhLmMNCj4gPiBiL3Nv
dW5kL3NvYy9tZWRpYXRlay9tdDgxODYvbXQ4MTg2LWRhaS1hZGRhLmMNCj4gPiBpbmRleCBkYjcx
YjAzMjc3MGQuLjZiZTZkNGYzYjU4NSAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvbWVkaWF0
ZWsvbXQ4MTg2L210ODE4Ni1kYWktYWRkYS5jDQo+ID4gKysrIGIvc291bmQvc29jL21lZGlhdGVr
L210ODE4Ni9tdDgxODYtZGFpLWFkZGEuYw0KPiA+IEBAIC0yOTUsOCArMjk1LDYgQEAgc3RhdGlj
IGludCBtdGtfYWRkYV9wYWRfdG9wX2V2ZW50KHN0cnVjdA0KPiA+IHNuZF9zb2NfZGFwbV93aWRn
ZXQgKncsDQo+ID4gICAJY2FzZSBTTkRfU09DX0RBUE1fUFJFX1BNVToNCj4gPiAgIAkJaWYgKGFm
ZV9wcml2LT5tdGthaWZfcHJvdG9jb2wgPT0NCj4gPiBNVEtBSUZfUFJPVE9DT0xfMl9DTEtfUDIp
DQo+ID4gICAJCQlyZWdtYXBfd3JpdGUoYWZlLT5yZWdtYXAsIEFGRV9BVURfUEFEX1RPUCwNCj4g
PiAweDM5KTsNCj4gPiAtCQllbHNlIGlmIChhZmVfcHJpdi0+bXRrYWlmX3Byb3RvY29sID09DQo+
ID4gTVRLQUlGX1BST1RPQ09MXzIpDQo+ID4gLQkJCXJlZ21hcF93cml0ZShhZmUtPnJlZ21hcCwg
QUZFX0FVRF9QQURfVE9QLA0KPiA+IDB4MzEpOw0KPiANCj4gSSB0aGluayB0aGF0IHRoaXMgbmVl
ZHMgc29tZSBjbGFyaWZpY2F0aW9uIGZyb20gTWVkaWFUZWs6IHdhcyAweDMxIGENCj4gdHlwbyBo
ZXJlPw0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQo+IA0KSGkgQW5nZWxvLA0KDQpUaGlzIHBh
dGNoIGNhbiBiZSBhY2NlcHRlZC4gVGhlIDB4MzEgaXMgbm90IHR5cG8sIHRoZSBsb2dpYyBvZiB0
aGlzDQpjb2RlIGlzIG5vdCBjb25jaXNlIGVub3VnaC4NCg0KVGhhbmtzLA0KSmlheGluLll1DQoN
Cj4gPiAgIAkJZWxzZQ0KPiA+ICAgCQkJcmVnbWFwX3dyaXRlKGFmZS0+cmVnbWFwLCBBRkVfQVVE
X1BBRF9UT1AsDQo+ID4gMHgzMSk7DQo+ID4gICAJCWJyZWFrOw0KPiANCj4gDQo=


