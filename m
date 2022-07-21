Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F8AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHuJXmTpqhwdibp5b+htSdMsPiihelGEPSrREJlvTKo=; b=JJOF+k5k8RB0vuYoFh6H7mKWNI
	yvZ2IFSNpEt59E8vbs9/+0c9gWhdIAkNum9omE1hLsai+gVNjUnSzAy42ETGl0iubJsHfVVr0x7IZ
	Im9tw5g/51WgRT5qCiwYCBFM0XTclVXoSncYIizHMTJMdpdkS5YuweTPWoTvszCJParED6OokW7EG
	KJHCt3L5U5p6BO6LPmkPYmP+xBcipoQf9FGgROSWSkPurGa3Qxquo040Lfu0VYNQT4BCOPcWecMMK
	e/Anh6sSKZriRuoP5XxEbzs63h5BVC/Q4VfWuG0hTOgR8oJPBvi8aHw11EPl77jHT0/YfMyNbdz4h
	6Ik7lgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES7K-002y3T-6k; Thu, 21 Jul 2022 09:05:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES74-002xox-Jk; Thu, 21 Jul 2022 09:04:57 +0000
X-UUID: 34309de67e3a4345939a5a006d37dabe-20220721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=fHuJXmTpqhwdibp5b+htSdMsPiihelGEPSrREJlvTKo=;
	b=K5x6aP+H+5usYo8v72Wex2BBvZJ3BATFltpjSvwZAWcmPRhD5kk32B9BriC7GEozqNyb2ku7VG52DKwnc8Dh2ADzLz3Ad9EwuMQ9VbradZ+NUR61y0wbI7AAFJbSx8s4NBdEa6OQ9cSuhSI7RD7f7/2V2miLnnE1o+Rr9obzf0o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6c4081ef-d5cc-4227-8623-0ffca96e9fca,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:8b1d17d8-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 34309de67e3a4345939a5a006d37dabe-20220721
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1850906533; Thu, 21 Jul 2022 02:04:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 21 Jul 2022 16:44:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jul 2022 16:44:08 +0800
Message-ID: <0f02af3abf6895ae89f735d849a1873e61ca502a.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: PCI: mediatek-gen3: Add new clock name
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>, <Rex-BC.Chen@mediatek.com>,
	<TingHan.Shen@mediatek.com>, <Liju-clr.Chen@mediatek.com>,
	<Jian.Yang@mediatek.com>
Date: Thu, 21 Jul 2022 16:44:08 +0800
In-Reply-To: <20220720222448.GA4083816-robh@kernel.org>
References: <20220716074349.28655-1-jianjun.wang@mediatek.com>
	 <20220716074349.28655-3-jianjun.wang@mediatek.com>
	 <20220720222448.GA4083816-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_020454_713525_A74F3ADA 
X-CRM114-Status: GOOD (  21.11  )
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

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4NCg0KT24gV2VkLCAyMDIyLTA3LTIw
IGF0IDE2OjI0IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gT24gU2F0LCBKdWwgMTYsIDIw
MjIgYXQgMDM6NDM6NDlQTSArMDgwMCwgSmlhbmp1biBXYW5nIHdyb3RlOg0KPiA+IE1UODE4OCBh
bmQgTVQ4MTk1IHVzZSBjbG9jayAicGVyaV9tZW0iIGluc3RlYWQgb2YgInRvcF8xMzNtIiwgYWRk
DQo+ID4gbmV3DQo+ID4gY2xvY2sgbmFtZSAicGVyaV9tZW0iIGZvciBNVDgxODggYW5kIE1UODE5
NS4NCj4gDQo+IFRoaXMgc2hvdWxkIGJlIHBhcnQgb2YgcGF0Y2ggMS4NCg0KU3VyZSwgSSdsbCBt
ZXJnZSB0aGVzZSB0d28gcGF0Y2hlcyBpbnRvIG9uZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+
IA0KPiBDbG9jayBuYW1lcyBmb3IgSVAgYmxvY2tzIHNob3VsZCBiZSBsb2NhbCB0byB0aGUgSVAg
YmxvY2suIElPVywNCj4gbmFtZWQgDQo+IGFmdGVyIHRoZSBpbnB1dCBuYW1lIGZvciB0aGUgY2xv
Y2tzIG9yIHdoYXQgdGhlaXIgZnVuY3Rpb24gaXMgaWYgeW91IA0KPiBkb24ndCBrbm93IHRoYXQu
IE5laXRoZXIgdGhlIG9sZCBuYW1lcyBub3IgdGhlIG5ldyBuYW1lIHNlZW0gdG8NCj4gZm9sbG93
IA0KPiB0aGlzLiBBdCBsZWFzdCBtYWtlIHRoZSBuZXcgbmFtZSBmb2xsb3cgdGhhdCBjb252ZW50
aW9uLg0KDQpTb3JyeSwgSSdtIG5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHdv
dWxkIHlvdSBtaW5kIHByb3ZpZGluZw0KYW4gZXhhbXBsZSBvZiB0aGlzIGNoYW5nZT8NCg0KVGhh
bmtzLg0KDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYW5qdW4gV2FuZyA8amlhbmp1
bi53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3BjaS9tZWRp
YXRlay1wY2llLWdlbjMueWFtbCAgICAgIHwgNDIgKysrKysrKysrKysrKystDQo+ID4gLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
Y2kvbWVkaWF0ZWstcGNpZS0NCj4gPiBnZW4zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGNpL21lZGlhdGVrLXBjaWUtDQo+ID4gZ2VuMy55YW1sDQo+ID4gaW5kZXgg
NjdkMmJhMjVlMzM2Li4wMzhlMjVhZTBiZTcgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9tZWRpYXRlay1wY2llLWdlbjMueWFtbA0KPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbWVkaWF0ZWstcGNpZS1n
ZW4zLnlhbWwNCj4gPiBAQCAtNDMsOSArNDMsNiBAQCBkZXNjcmlwdGlvbjogfCsNCj4gPiAgICBl
YWNoIHNldCBoYXMgaXRzIG93biBhZGRyZXNzIGZvciBNU0kgbWVzc2FnZSwgYW5kIHN1cHBvcnRz
IDMyDQo+ID4gTVNJIHZlY3RvcnMNCj4gPiAgICB0byBnZW5lcmF0ZSBpbnRlcnJ1cHQuDQo+ID4g
IA0KPiA+IC1hbGxPZjoNCj4gPiAtICAtICRyZWY6IC9zY2hlbWFzL3BjaS9wY2ktYnVzLnlhbWwj
DQo+ID4gLQ0KPiA+ICBwcm9wZXJ0aWVzOg0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gICAgICBv
bmVPZjoNCj4gPiBAQCAtODUsMTMgKzgyLDcgQEAgcHJvcGVydGllczoNCj4gPiAgICAgIG1heEl0
ZW1zOiA2DQo+ID4gIA0KPiA+ICAgIGNsb2NrLW5hbWVzOg0KPiA+IC0gICAgaXRlbXM6DQo+ID4g
LSAgICAgIC0gY29uc3Q6IHBsXzI1MG0NCj4gPiAtICAgICAgLSBjb25zdDogdGxfMjZtDQo+ID4g
LSAgICAgIC0gY29uc3Q6IHRsXzk2bQ0KPiA+IC0gICAgICAtIGNvbnN0OiB0bF8zMmsNCj4gPiAt
ICAgICAgLSBjb25zdDogcGVyaV8yNm0NCj4gPiAtICAgICAgLSBjb25zdDogdG9wXzEzM20NCj4g
PiArICAgIG1heEl0ZW1zOiA2DQo+ID4gIA0KPiA+ICAgIGFzc2lnbmVkLWNsb2NrczoNCj4gPiAg
ICAgIG1heEl0ZW1zOiAxDQo+ID4gQEAgLTEzMyw5ICsxMjQsNDAgQEAgcmVxdWlyZWQ6DQo+ID4g
ICAgLSBpbnRlcnJ1cHRzDQo+ID4gICAgLSByYW5nZXMNCj4gPiAgICAtIGNsb2Nrcw0KPiA+ICsg
IC0gY2xvY2stbmFtZXMNCj4gPiAgICAtICcjaW50ZXJydXB0LWNlbGxzJw0KPiA+ICAgIC0gaW50
ZXJydXB0LWNvbnRyb2xsZXINCj4gPiAgDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogL3Nj
aGVtYXMvcGNpL3BjaS1idXMueWFtbCMNCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0
aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoN
Cj4gPiArICAgICAgICAgICAgZW51bToNCj4gPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10
ODE4OC1wY2llDQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtcGNpZQ0KPiA+
ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9jay1u
YW1lczoNCj4gPiArICAgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBw
bF8yNTBtDQo+ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IHRsXzI2bQ0KPiA+ICsgICAgICAgICAg
ICAtIGNvbnN0OiB0bF85Nm0NCj4gPiArICAgICAgICAgICAgLSBjb25zdDogdGxfMzJrDQo+ID4g
KyAgICAgICAgICAgIC0gY29uc3Q6IHBlcmlfMjZtDQo+ID4gKyAgICAgICAgICAgIC0gY29uc3Q6
IHBlcmlfbWVtDQo+ID4gKyAgICBlbHNlOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsg
ICAgICAgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgICAgICAgaXRlbXM6DQo+ID4gKyAgICAgICAg
ICAgIC0gY29uc3Q6IHBsXzI1MG0NCj4gPiArICAgICAgICAgICAgLSBjb25zdDogdGxfMjZtDQo+
ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IHRsXzk2bQ0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0
OiB0bF8zMmsNCj4gPiArICAgICAgICAgICAgLSBjb25zdDogcGVyaV8yNm0NCj4gPiArICAgICAg
ICAgICAgLSBjb25zdDogdG9wXzEzM20NCj4gPiArDQo+ID4gIHVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UNCj4gPiAgDQo+ID4gIGV4YW1wbGVzOg0KPiA+IC0tIA0KPiA+IDIuMTguMA0KPiA+
IA0KPiA+IA0K


