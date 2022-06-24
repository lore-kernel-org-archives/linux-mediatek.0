Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF49C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 02:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAOKPWnVxf0WaSuIRBsR7uD1/FIUPAAkcsQY4hx9SHw=; b=4AbjLYoUb99+CbHVJ1gvf6sq4V
	8d7jSdwy7Nj7whcRMCdWROB7kS8WH7acjXgNxpXf3KkFC86oL+4BSRzisPjinIwIqxF7+4v8slVkJ
	HxCDFEDTc3qU7OKf9Wgo7PcaAUZQnprA+tFeEeQ5WyGxKidEiqVkdPYLqYvHUlBPosqMYgV9ZUDVR
	O2WwKzVJbqozGh1dZb19dSk5kD3HenNaar+lLsJX+cG/2RPDxLv3USwghW8lnDUnAKlnCIZNditGU
	fjZakLWGupf4Pxffhl2KtNU0J/NA85sOFpc5JgxgfCATfJ/B1wESnFpteDcVgN9/r4ouV6JY5gtHD
	xG6P+IYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Ypa-00HQ2W-Gh; Fri, 24 Jun 2022 02:13:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4YpP-00HPzR-A2; Fri, 24 Jun 2022 02:13:49 +0000
X-UUID: ef99a76534464e2b99c46c7a87d16862-20220623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FAOKPWnVxf0WaSuIRBsR7uD1/FIUPAAkcsQY4hx9SHw=;
	b=mILQRWYPu9fDDYUljAoMEWrBTvy4HvyEz06R2usc07Hjc68gZQZ3Y65W26enP/WabgQvOS8nAhSodZP/eghF9o5MKoARJXIoRH6jRzS6faP3CasiJJI+zOaQeTyXcyQZMkRakR+tLP0T1P67dk68aytZAcUu0miGo555JNj6PFI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ed07a15a-1b01-4c0d-b2f9-e16d9c2215e8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:8e365538-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ef99a76534464e2b99c46c7a87d16862-20220623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <wenbin.mei@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1628999447; Thu, 23 Jun 2022 19:13:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 19:13:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 24 Jun 2022 10:13:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 24 Jun 2022 10:13:32 +0800
Message-ID: <e34b886c276805f4778d8eb5cd2fe7314efc08f9.camel@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: mtk-sd: Set clocks based on
 compatible
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	"Ulf Hansson" <ulf.hansson@linaro.org>
CC: <kernel@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chaotian Jing
	<chaotian.jing@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mmc@vger.kernel.org>
Date: Fri, 24 Jun 2022 10:13:31 +0800
In-Reply-To: <20220623154038.771874-1-nfraprado@collabora.com>
References: <20220623154038.771874-1-nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_191347_402518_5175044E 
X-CRM114-Status: GOOD (  21.80  )
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

T24gVGh1LCAyMDIyLTA2LTIzIGF0IDExOjQwIC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gVGhlIGJpbmRpbmcgd2FzIGRlc2NyaWJpbmcgYSBzaW5nbGUgY2xvY2sgbGlz
dCBmb3IgYWxsIHBsYXRmb3JtcywgYnV0DQo+IHRoYXQncyBub3QgcmVhbGx5IHN1aXRhYmxlOiBt
dDI3MTIgcmVxdWlyZXMgYW4gZXh0cmEgJ2J1c19jbGsnIG9uDQo+IHNvbWUNCj4gb2YgaXRzIGNv
bnRyb2xsZXJzLCB3aGlsZSBtdDgxOTIgcmVxdWlyZXMgZm91ciBkaWZmZXJlbnQgZXh0cmENCj4g
Y2xvY2tzLg0KPiBUaGUgcmVzdCBvZiB0aGUgcGxhdGZvcm1zIGNhbiBzaGFyZSB0aGUgc2FtZSAz
IGNsb2Nrcywgd2l0aCB0aGUgdGhpcmQNCj4gYmVpbmcgb3B0aW9uYWwgYXMgaXQncyBub3QgcHJl
c2VudCBvbiBhbGwgcGxhdGZvcm1zLg0KPiANCj4gTW92ZSB0aGUgY2xvY2sgZGVmaW5pdGlvbnMg
aW5zaWRlIGlmIGJsb2NrcyB0aGF0IG1hdGNoIG9uIHRoZQ0KPiBjb21wYXRpYmxlcy4gSW4gcHJh
Y3RpY2UgdGhpcyBnZXRzIHJpZCBvZiBkdGJzX2NoZWNrIHdhcm5pbmdzIG9uDQo+IG10ODE5MiwN
Cj4gc2luY2UgdGhlICdidXNfY2xrJyBjbG9jayBmcm9tIG10MjcxMiBpcyBubyBsb25nZXIgZXhw
ZWN0ZWQgb24gdGhpcw0KPiBwbGF0Zm9ybS4NCj4gDQo+IEZpeGVzOiA1OWEyMzM5NWQ4YWEgKCJk
dC1iaW5kaW5nczogbW1jOiBBZGQgc3VwcG9ydCBmb3IgTVQ4MTkyIFNvQyIpDQo+IFNpZ25lZC1v
ZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4N
Cj4gDQoNClJldmlld2VkLWJ5OiBXZW5iaW4gTWVpIDx3ZW5iaW4ubWVpQG1lZGlhdGVrLmNvbT4N
Cg0KPiAtLS0NCj4gdjE6IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA2MTcy
MzAxMTQuMjQzODg3NS0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tDQo+IA0KPiBDaGFuZ2VzIGlu
IHYyOg0KPiAtIEtlcHQgd2lkZXN0IG1pbkl0ZW1zL21heEl0ZW1zIG91dHNpZGUgdGhlIGlmIGJs
b2Nrcw0KPiANCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QueWFtbCAgICAg
ICB8IDExMSArKysrKysrKysrKysrLS0tDQo+IC0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgODEgaW5z
ZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QueWFtbA0KPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbXRrLXNkLnlhbWwNCj4gaW5kZXggMmEyZTlmYThj
MTg4Li41ZTczMjE4ZDJlNmUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tbWMvbXRrLXNkLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21tYy9tdGstc2QueWFtbA0KPiBAQCAtMTAsOSArMTAsNiBAQCBtYWludGFp
bmVyczoNCj4gICAgLSBDaGFvdGlhbiBKaW5nIDxjaGFvdGlhbi5qaW5nQG1lZGlhdGVrLmNvbT4N
Cj4gICAgLSBXZW5iaW4gTWVpIDx3ZW5iaW4ubWVpQG1lZGlhdGVrLmNvbT4NCj4gIA0KPiAtYWxs
T2Y6DQo+IC0gIC0gJHJlZjogbW1jLWNvbnRyb2xsZXIueWFtbCMNCj4gLQ0KPiAgcHJvcGVydGll
czoNCj4gICAgY29tcGF0aWJsZToNCj4gICAgICBvbmVPZjoNCj4gQEAgLTQ5LDI3ICs0NiwxMSBA
QCBwcm9wZXJ0aWVzOg0KPiAgICAgIGRlc2NyaXB0aW9uOg0KPiAgICAgICAgU2hvdWxkIGNvbnRh
aW4gcGhhbmRsZSBmb3IgdGhlIGNsb2NrIGZlZWRpbmcgdGhlIE1NQw0KPiBjb250cm9sbGVyLg0K
PiAgICAgIG1pbkl0ZW1zOiAyDQo+IC0gICAgaXRlbXM6DQo+IC0gICAgICAtIGRlc2NyaXB0aW9u
OiBzb3VyY2UgY2xvY2sgKHJlcXVpcmVkKS4NCj4gLSAgICAgIC0gZGVzY3JpcHRpb246IEhDTEsg
d2hpY2ggdXNlZCBmb3IgaG9zdCAocmVxdWlyZWQpLg0KPiAtICAgICAgLSBkZXNjcmlwdGlvbjog
aW5kZXBlbmRlbnQgc291cmNlIGNsb2NrIGdhdGUgKHJlcXVpcmVkIGZvcg0KPiBNVDI3MTIpLg0K
PiAtICAgICAgLSBkZXNjcmlwdGlvbjogYnVzIGNsb2NrIHVzZWQgZm9yIGludGVybmFsIHJlZ2lz
dGVyIGFjY2Vzcw0KPiAocmVxdWlyZWQgZm9yIE1UMjcxMiBNU0RDMC8zKS4NCj4gLSAgICAgIC0g
ZGVzY3JpcHRpb246IG1zZGMgc3Vic3lzIGNsb2NrIGdhdGUgKHJlcXVpcmVkIGZvciBNVDgxOTIp
Lg0KPiAtICAgICAgLSBkZXNjcmlwdGlvbjogcGVyaXBoZXJhbCBidXMgY2xvY2sgZ2F0ZSAocmVx
dWlyZWQgZm9yDQo+IE1UODE5MikuDQo+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBBWEkgYnVzIGNs
b2NrIGdhdGUgKHJlcXVpcmVkIGZvciBNVDgxOTIpLg0KPiAtICAgICAgLSBkZXNjcmlwdGlvbjog
QUhCIGJ1cyBjbG9jayBnYXRlIChyZXF1aXJlZCBmb3IgTVQ4MTkyKS4NCj4gKyAgICBtYXhJdGVt
czogNw0KPiAgDQo+ICAgIGNsb2NrLW5hbWVzOg0KPiAgICAgIG1pbkl0ZW1zOiAyDQo+IC0gICAg
aXRlbXM6DQo+IC0gICAgICAtIGNvbnN0OiBzb3VyY2UNCj4gLSAgICAgIC0gY29uc3Q6IGhjbGsN
Cj4gLSAgICAgIC0gY29uc3Q6IHNvdXJjZV9jZw0KPiAtICAgICAgLSBjb25zdDogYnVzX2Nsaw0K
PiAtICAgICAgLSBjb25zdDogc3lzX2NnDQo+IC0gICAgICAtIGNvbnN0OiBwY2xrX2NnDQo+IC0g
ICAgICAtIGNvbnN0OiBheGlfY2cNCj4gLSAgICAgIC0gY29uc3Q6IGFoYl9jZw0KPiArICAgIG1h
eEl0ZW1zOiA3DQo+ICANCj4gICAgaW50ZXJydXB0czoNCj4gICAgICBtYXhJdGVtczogMQ0KPiBA
QCAtMTcxLDE1ICsxNTIsODUgQEAgcmVxdWlyZWQ6DQo+ICAgIC0gdm1tYy1zdXBwbHkNCj4gICAg
LSB2cW1tYy1zdXBwbHkNCj4gIA0KPiAtaWY6DQo+IC0gIHByb3BlcnRpZXM6DQo+IC0gICAgY29t
cGF0aWJsZToNCj4gLSAgICAgIGNvbnRhaW5zOg0KPiAtICAgICAgICBjb25zdDogbWVkaWF0ZWss
bXQ4MTgzLW1tYw0KPiAtdGhlbjoNCj4gLSAgcHJvcGVydGllczoNCj4gLSAgICByZWc6DQo+IC0g
ICAgICBtaW5JdGVtczogMg0KPiArYWxsT2Y6DQo+ICsgIC0gJHJlZjogbW1jLWNvbnRyb2xsZXIu
eWFtbCMNCj4gKyAgLSBpZjoNCj4gKyAgICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICAgIGNvbXBh
dGlibGU6DQo+ICsgICAgICAgICAgY29udGFpbnM6DQo+ICsgICAgICAgICAgICBjb25zdDogbWVk
aWF0ZWssbXQ4MTgzLW1tYw0KPiArICAgIHRoZW46DQo+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiAr
ICAgICAgICByZWc6DQo+ICsgICAgICAgICAgbWluSXRlbXM6IDINCj4gKyAgLSBpZjoNCj4gKyAg
ICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ICsgICAgICAgICAgY29u
dGFpbnM6DQo+ICsgICAgICAgICAgICBjb25zdDogbWVkaWF0ZWssbXQ4MTkyLW1tYw0KPiArICAg
IHRoZW46DQo+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiArICAgICAgICBjbG9ja3M6DQo+ICsgICAg
ICAgICAgaXRlbXM6DQo+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBzb3VyY2UgY2xvY2sN
Cj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEhDTEsgd2hpY2ggdXNlZCBmb3IgaG9zdA0K
PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogaW5kZXBlbmRlbnQgc291cmNlIGNsb2NrIGdh
dGUNCj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IG1zZGMgc3Vic3lzIGNsb2NrIGdhdGUN
Cj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IHBlcmlwaGVyYWwgYnVzIGNsb2NrIGdhdGUN
Cj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEFYSSBidXMgY2xvY2sgZ2F0ZQ0KPiArICAg
ICAgICAgICAgLSBkZXNjcmlwdGlvbjogQUhCIGJ1cyBjbG9jayBnYXRlDQo+ICsgICAgICAgIGNs
b2NrLW5hbWVzOg0KPiArICAgICAgICAgIGl0ZW1zOg0KPiArICAgICAgICAgICAgLSBjb25zdDog
c291cmNlDQo+ICsgICAgICAgICAgICAtIGNvbnN0OiBoY2xrDQo+ICsgICAgICAgICAgICAtIGNv
bnN0OiBzb3VyY2VfY2cNCj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHN5c19jZw0KPiArICAgICAg
ICAgICAgLSBjb25zdDogcGNsa19jZw0KPiArICAgICAgICAgICAgLSBjb25zdDogYXhpX2NnDQo+
ICsgICAgICAgICAgICAtIGNvbnN0OiBhaGJfY2cNCj4gKyAgLSBpZjoNCj4gKyAgICAgIHByb3Bl
cnRpZXM6DQo+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ICsgICAgICAgICAgY29udGFpbnM6DQo+
ICsgICAgICAgICAgICBjb25zdDogbWVkaWF0ZWssbXQyNzEyLW1tYw0KPiArICAgIHRoZW46DQo+
ICsgICAgICBwcm9wZXJ0aWVzOg0KPiArICAgICAgICBjbG9ja3M6DQo+ICsgICAgICAgICAgbWlu
SXRlbXM6IDMNCj4gKyAgICAgICAgICBpdGVtczoNCj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRp
b246IHNvdXJjZSBjbG9jaw0KPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogSENMSyB3aGlj
aCB1c2VkIGZvciBob3N0DQo+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBpbmRlcGVuZGVu
dCBzb3VyY2UgY2xvY2sgZ2F0ZQ0KPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogYnVzIGNs
b2NrIHVzZWQgZm9yIGludGVybmFsIHJlZ2lzdGVyDQo+IGFjY2VzcyAocmVxdWlyZWQgZm9yIE1T
REMwLzMpLg0KPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gKyAgICAgICAgICBtaW5JdGVtczog
Mw0KPiArICAgICAgICAgIGl0ZW1zOg0KPiArICAgICAgICAgICAgLSBjb25zdDogc291cmNlDQo+
ICsgICAgICAgICAgICAtIGNvbnN0OiBoY2xrDQo+ICsgICAgICAgICAgICAtIGNvbnN0OiBzb3Vy
Y2VfY2cNCj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGJ1c19jbGsNCj4gKyAgLSBpZjoNCj4gKyAg
ICAgIG5vdDoNCj4gKyAgICAgICAgcHJvcGVydGllczoNCj4gKyAgICAgICAgICBjb21wYXRpYmxl
Og0KPiArICAgICAgICAgICAgY29udGFpbnM6DQo+ICsgICAgICAgICAgICAgIGVudW06DQo+ICsg
ICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDI3MTItbW1jDQo+ICsgICAgICAgICAgICAgICAg
LSBtZWRpYXRlayxtdDgxOTItbW1jDQo+ICsgICAgdGhlbjoNCj4gKyAgICAgIHByb3BlcnRpZXM6
DQo+ICsgICAgICAgIGNsb2NrczoNCj4gKyAgICAgICAgICBtaW5JdGVtczogMg0KPiArICAgICAg
ICAgIGl0ZW1zOg0KPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogc291cmNlIGNsb2NrDQo+
ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBIQ0xLIHdoaWNoIHVzZWQgZm9yIGhvc3QNCj4g
KyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IGluZGVwZW5kZW50IHNvdXJjZSBjbG9jayBnYXRl
DQo+ICsgICAgICAgIGNsb2NrLW5hbWVzOg0KPiArICAgICAgICAgIG1pbkl0ZW1zOiAyDQo+ICsg
ICAgICAgICAgaXRlbXM6DQo+ICsgICAgICAgICAgICAtIGNvbnN0OiBzb3VyY2UNCj4gKyAgICAg
ICAgICAgIC0gY29uc3Q6IGhjbGsNCj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHNvdXJjZV9jZw0K
PiAgDQo+ICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ICANCg==


