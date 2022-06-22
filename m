Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167BCC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 02:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1KX4+p8iBggfx0SYfzxdE5bSp/3OvfynA/bVjI+ipI=; b=u4KYdLY/vkAV737jh6dyw8So6l
	IBZdW26XLU5QLekp0P6Di9jY6I9KOcNpL26HZAoJAniN3f2L4IH9sFqS0T0EnBwdTkoUjgYJ2WjSP
	bL67csMbbRmZ/DFXd0YX847S6b43laWZQQUm6rbJAgDjc1IYJJY2kMmlYafRrVta034F1A4oBcmVb
	5n1W1gflnMvLLl+bfuJrN/3Lcgqmvixus3J8ztxPGul+60pqCozB0GbcREYVCc8YKrKQq8bCvaNvc
	AakOavVGm88fk9WEPmDWDGT7kWztgbjsEKSgnH8z7NpUqlOLNEtTzycivF/4Xx6QMJ9U2WVsKgJ6p
	YD6yVuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pk9-0086qS-4l; Wed, 22 Jun 2022 02:05:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pjx-0086nF-Cm; Wed, 22 Jun 2022 02:05:11 +0000
X-UUID: 059daad02ac849dd9eb7390cf5c6dddd-20220621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=r1KX4+p8iBggfx0SYfzxdE5bSp/3OvfynA/bVjI+ipI=;
	b=syyFqcB8AHlhb3gdQpIrTdmm2LTYjMJN33DSs8VGkbwMbMTMDB2Z/b2O55vlk8pFOVjaHNqzCguJtEXxS0dBLaqE8gER/UUaR/oC/xG/SG+gnyb4gupVZApDnvkIsrb+HW5SJu2OJx1PZaJ2pCROH3q83Yef+s7FKrasD4wMP/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:914f4e5f-ad21-4a6b-bbbc-4fb7720af72e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:0daf1d38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 059daad02ac849dd9eb7390cf5c6dddd-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 926287279; Tue, 21 Jun 2022 19:05:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 18:57:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 09:57:16 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 09:57:13 +0800
Message-ID: <ba6cccfa05aed087d14f5adc6db06496547a5094.camel@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	"Wenbin Mei" <wenbin.mei@mediatek.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <kernel@collabora.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>
Date: Wed, 22 Jun 2022 09:57:12 +0800
In-Reply-To: <afae6179-3681-f5c6-4615-3228f16f1271@linaro.org>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
	 <20220617222916.2435618-3-nfraprado@collabora.com>
	 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
	 <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
	 <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
	 <af50210b95d0cd8b2e3103b3d4a9702aeeba9452.camel@mediatek.com>
	 <a24c24e6-fdee-df79-fd2f-6a71540bd9b3@linaro.org>
	 <20220620155057.a6qilnhm7snzhapa@notapiano>
	 <afae6179-3681-f5c6-4615-3228f16f1271@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_190509_488301_C94422CE 
X-CRM114-Status: GOOD (  52.99  )
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

T24gVHVlLCAyMDIyLTA2LTIxIGF0IDA5OjE0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAyMC8wNi8yMDIyIDE3OjUwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90
ZToNCj4gPiBPbiBNb24sIEp1biAyMCwgMjAyMiBhdCAxMDo1MDo1N0FNICswMjAwLCBLcnp5c3p0
b2YgS296bG93c2tpDQo+ID4gd3JvdGU6DQo+ID4gPiBPbiAyMC8wNi8yMDIyIDA4OjU5LCBDaHVu
ZmVuZyBZdW4gd3JvdGU6DQo+ID4gPiA+IE9uIFN1biwgMjAyMi0wNi0xOSBhdCAxNDowNSArMDIw
MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+ID4gPiBPbiAxOS8wNi8yMDIyIDA5
OjQ2LCBDaHVuZmVuZyBZdW4gd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBGcmksIDIwMjItMDYtMTcg
YXQgMTg6MjUgLTA3MDAsIEtyenlzenRvZiBLb3psb3dza2kNCj4gPiA+ID4gPiA+IHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiBPbiAxNy8wNi8yMDIyIDE1OjI5LCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBUaGUgY3VycmVudCBjbG9jayBsaXN0IGluIHRoZSBi
aW5kaW5nIGRvZXNuJ3QgYWxsb3cgZm9yDQo+ID4gPiA+ID4gPiA+ID4gb25lIG9mDQo+ID4gPiA+
ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gPiA+ID4gb3B0aW9uYWwgY2xvY2tzIHRvIGJlIG1pc3Np
bmcgYW5kIGEgc3Vic2VxdWVudCBjbG9jayB0bw0KPiA+ID4gPiA+ID4gPiA+IGJlDQo+ID4gPiA+
ID4gPiA+ID4gcHJlc2VudC4NCj4gPiA+ID4gPiA+ID4gPiBBbg0KPiA+ID4gPiA+ID4gPiA+IGV4
YW1wbGUgd2hlcmUgdGhpcyBpcyBhbiBpc3N1ZSBpcyBpbiBtdDgxOTIuZHRzaSwgd2hpY2gNCj4g
PiA+ID4gPiA+ID4gPiBoYXMNCj4gPiA+ID4gPiA+ID4gPiAic3lzX2NrIiwNCj4gPiA+ID4gPiA+
ID4gPiAicmVmX2NrIiwgInhoY2lfY2siIGFuZCB3b3VsZCBjYXVzZSBkdGJzX2NoZWNrDQo+ID4g
PiA+ID4gPiA+ID4gd2FybmluZ3MuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4g
Q2hhbmdlIHRoZSBjbG9jayBsaXN0IGluIGEgd2F5IHRoYXQgYWxsb3dzIHRoZSBtaWRkbGUNCj4g
PiA+ID4gPiA+ID4gPiBvcHRpb25hbA0KPiA+ID4gPiA+ID4gPiA+IGNsb2NrcyB0bw0KPiA+ID4g
PiA+ID4gPiA+IGJlIG1pc3NpbmcsIHdoaWxlIHN0aWxsIGd1YXJhbnRlZWluZyBhIGZpeGVkIG9y
ZGVyLiBUaGUNCj4gPiA+ID4gPiA+ID4gPiAicmVmX2NrIiBpcw0KPiA+ID4gPiA+ID4gPiA+IGtl
cHQNCj4gPiA+ID4gPiA+ID4gPiBhcyBhIGNvbnN0IGV2ZW4gdGhvdWdoIGl0IGlzIG9wdGlvbmFs
IGZvciBzaW1wbGljaXR5LA0KPiA+ID4gPiA+ID4gPiA+IHNpbmNlIGl0DQo+ID4gPiA+ID4gPiA+
ID4gaXMNCj4gPiA+ID4gPiA+ID4gPiBwcmVzZW50IGluIGFsbCBjdXJyZW50IGR0cyBmaWxlcy4N
Cj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xh
cyBGLiBSLiBBLiBQcmFkbyA8DQo+ID4gPiA+ID4gPiA+ID4gbmZyYXByYWRvQGNvbGxhYm9yYS5j
b20+DQo+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4gPiA+ID4g
PiA+ID4geGhjaS55YW1sICAgICAgIHwgOQ0KPiA+ID4gPiA+ID4gPiA+ICsrKysrKystLQ0KPiA+
ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+
ID4gPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0
ZWssbXRrLQ0KPiA+ID4gPiA+ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiA+ID4gPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4gPiA+
ID4gPiA+ID4geGhjaS55YW1sDQo+ID4gPiA+ID4gPiA+ID4gaW5kZXggNjNjYmMyYjYyZDE4Li45
OWExYjIzM2VjOTAgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4g
PiA+ID4gPiA+ID4gPiB4aGNpLnlhbWwNCj4gPiA+ID4gPiA+ID4gPiArKysNCj4gPiA+ID4gPiA+
ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRr
LQ0KPiA+ID4gPiA+ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiA+ID4gPiA+IEBAIC04MCw4ICs4
MCwxMyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+ID4gPiA+ICAgICAgaXRlbXM6DQo+ID4gPiA+
ID4gPiA+ID4gICAgICAgIC0gY29uc3Q6IHN5c19jayAgIyByZXF1aXJlZCwgdGhlIGZvbGxvd2lu
ZyBvbmVzDQo+ID4gPiA+ID4gPiA+ID4gYXJlDQo+ID4gPiA+ID4gPiA+ID4gb3B0aW9uYWwNCj4g
PiA+ID4gPiA+ID4gPiAgICAgICAgLSBjb25zdDogcmVmX2NrDQo+ID4gPiA+ID4gPiA+ID4gLSAg
ICAgIC0gY29uc3Q6IG1jdV9jaw0KPiA+ID4gPiA+ID4gPiA+IC0gICAgICAtIGNvbnN0OiBkbWFf
Y2sNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgLSBlbnVtOg0KPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgLSBtY3VfY2sNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgIC0gZG1hX2NrDQo+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAtIHhoY2lfY2sNCj4gPiA+ID4gPiA+ID4gPiArICAgICAg
LSBlbnVtOg0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgLSBkbWFfY2sNCj4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgIC0geGhjaV9jaw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAtIGNvbnN0
OiB4aGNpX2NrDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBZb3UgYWxsb3cgbm93IGFs
bW9zdCBhbnkgb3JkZXIgaGVyZSwgaW5jbHVkaW5nIGluY29ycmVjdA0KPiA+ID4gPiA+ID4gPiBs
aWtlDQo+ID4gPiA+ID4gPiA+IHN5cyxyZWYseGhjaSx4aGNpLHhoY2kuDQo+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiBUaGUgb3JkZXIgb2YgY2xvY2tzIGhhcyB0byBiZSBmaXhlZCBhbmQg
d2UgY2Fubm90IGFsbG93DQo+ID4gPiA+ID4gPiA+IGZsZXhpYmlsaXR5Lg0KPiA+ID4gPiA+ID4g
PiBBcmUNCj4gPiA+ID4gPiA+ID4geW91IHN1cmUgdGhhdCB0aGVzZSBjbG9ja3MgYXJlIGFjdHVh
bGx5IG9wdGlvbmFsIChub3QNCj4gPiA+ID4gPiA+ID4gd2lyZWQgdG8NCj4gPiA+ID4gPiA+ID4g
dGhlDQo+ID4gPiA+ID4gPiA+IGRldmljZSk/DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IElu
IGZhY3QsIHRoZXNlIG9wdGlvbmFsIGNsb2NrcyBhcmUgZml4ZWQsIGR1ZSB0byBubyBnYXRlcw0K
PiA+ID4gPiA+ID4gYXJlDQo+ID4gPiA+ID4gPiBwcm92aWRlZCwNCj4gPiA+ID4gPiA+IFNXIGNh
bid0IGNvbnRyb2wgdGhlbSBieSBDQ0Y7DQo+ID4gPiA+ID4gPiBJbiB0aGlzIGNhc2UsIEkgdXN1
YWxseSB1c2UgYSBmaXhlZCBjbG9jaywgb3IgaWdub3JlIGl0Lg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IEJ1dCBpbiBzb21lIHZlcnNpb25zIHRoZXNlIGNsb2NrcyBhcmUgY29udHJvbGxhYmxlIG9y
IG5vdD8NCj4gPiA+ID4gDQo+ID4gPiA+IFNvbWUgU29DcyBhcmUgY29udHJvbGxhYmxlLCBzb21l
IG9uZXMgYXJlIG5vdCAoZml4ZWQgY2xvY2spLg0KPiA+ID4gDQo+ID4gPiBUaGFua3MgZm9yIGNv
bmZpcm1pbmcuIFRoZW4gSSB3b3VsZCBwcmVmZXIgdG8gbWFrZSB0aGVzZSBjbG9ja3MNCj4gPiA+
IHJlcXVpcmVkDQo+ID4gPiAobm90IG9wdGlvbmFsKSBhbmQgYWx3YXlzIHByb3ZpZGUgdGhlbSAt
IHZpYSBjb21tb24gY2xvY2sNCj4gPiA+IGZyYW1ld29yayBvcg0KPiA+ID4gZml4ZWQtY2xvY2su
DQo+ID4gDQo+ID4gSGkgS3J6eXN6dG9mIGFuZCBDaHVuZmVuZywNCj4gPiANCj4gPiB0aGFuayB5
b3UgYm90aCBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+IA0KPiA+IFNpbmNlIHRoZSBzb2x1dGlvbiBJ
IHByb3Bvc2VkIGluIHRoaXMgcGF0Y2ggaXMgbm90IGFjY2VwdGFibGUgSSBzZWUNCj4gPiB0d28g
b3B0aW9uczoNCj4gPiAxLiBTcGxpdCB0aGUgY2xvY2tzIGluIHNldmVyYWwgaWYgYmxvY2tzIG1h
dGNoZWQgYnkgY29tcGF0aWJsZXMNCj4gPiAyLiBNYWtlIHRoZSBjbG9ja3MgcmVxdWlyZWQgYW5k
IHVzZSBmaXhlZC1jbG9jayBub2RlcyBmb3IgdGhlDQo+ID4gbWlzc2luZyBjbG9ja3MgaW4NCj4g
PiAgICB0aGUgRFQNCj4gPiANCj4gPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgMSBpcyB0aGUg
ZGVzaXJhYmxlIHNvbHV0aW9uIGlmIHRoZSBjbG9jaw0KPiA+IGlzIHJlYWxseQ0KPiA+IG1pc3Np
bmcgaW4gc29tZSBoYXJkd2FyZSB2YXJpYW50cywgd2hpbGUgMiBpcyBkZXNpcmFibGUgaWYgYWxs
DQo+ID4gaGFyZHdhcmUgdmFyaWFudHMNCj4gPiByZWFsbHkgcmVjZWl2ZSBhbGwgdGhlIGNsb2Nr
cywgb25seSB0aGF0IG9uIHNvbWUgdmFyaWFudHMgdGhleSdyZQ0KPiA+IGZpeGVkIGFuZCBub3QN
Cj4gPiBjb250cm9sYWJsZSBieSBTVy4NCj4gPiANCj4gPiBGcm9tIHdoYXQgSSdtIHJlYWRpbmcg
b2YgdGhpcyBkaXNjdXNzaW9uIGl0IHNlZW1zIHRoYXQgdGhlIGxhdHRlcg0KPiA+IGlzIHRoZSBj
YXNlDQo+ID4gaGVyZSBhbmQgdGh1cyB3ZSBzaG91bGQgZ28gZm9yIDIuIElzIHRoaXMgY29ycmVj
dD8NCj4gDQo+IFRoaXMgaXMgaG93IEkgdW5kZXJzdG9vZCBpdCBhcyB3ZWxsLCBzbyBjb3JyZWN0
IGZyb20gbXkgc2lkZS4NCkFsc28gcmlnaHQgZm9yIG1lLg0KDQo+IA0KPiA+IA0KPiA+IEFsc28g
Q2h1bmZlbmcsIGRvIHlvdSBoYXZlIGluZm9ybWF0aW9uIG9uIHdoZXRoZXIgdGhlIHNhbWUgaXMg
dHJ1ZQ0KPiA+IGZvciB0aGUgTU1DDQo+ID4gSFcgYmxvY2s/IEkgcmVjZW50bHkgc3VibWl0dGVk
IHNvbWUgY2hhbmdlcyB0byB0aGF0IGJpbmRpbmcgWzFdIGJ1dA0KPiA+IEkgZm9sbG93ZWQNCj4g
PiBhcHByb2FjaCAxIHRoZXJlIGluc3RlYWQuIEhvd2V2ZXIgaWYgYWxsIHRoZSBjbG9ja3MgYXJl
IHByZXNlbnQgaW4NCj4gPiB0aGUgSFcgbGV2ZWwNCj4gPiB0aGVyZSBhcyB3ZWxsIGl0IHdvdWxk
IG1ha2UgbW9yZSBzZW5zZSBmb3IgbWUgdG8gY2hhbmdlIGl0IHRvDQo+ID4gZm9sbG93IGFwcHJv
YWNoIDIuDQoNCkkgZGlzY3Vzc2VkIGl0IHdpdGggV2VuYmluLCBNTUMgc2VlbXMgYSBsaXR0bGUg
ZGlmZmVyZW50IHdpdGggVVNCLA0KDQpIaSBXZW5iaW4sDQoNCiAgIFBsZWFzZSBnaXZlIHNvbWUg
Y29tbWVudHMgYWJvdXQgTU1DLCB0aGFua3MNCg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBOw61j
b2xhcw0KPiA+IA0KPiA+IFsxXSANCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MjA2MTcyMzAxMTQuMjQzODg3NS0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tDQo+IA0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==


