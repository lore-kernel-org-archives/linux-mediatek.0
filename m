Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF20C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/LfmfqvV6IeC2mL9C7ugjv5ZCnuOSEOFBUManlkPeY=; b=gjtMNFkln65dx/h5T7DQWUszZe
	K97EyqK4OsfRrSRidRy9ksQ5P1xPkN9y0crJYY9/XmqQT0tO564kyCGbyvEv4Xl0pZBOhcp1glAZS
	c8jN2rltmSvHMW0TXRUxZVVsbSR5s/mm+Z7tqCb9+hs2HFWIgkTqa9v1Vi2NoZVB2MO45fxX0pY7y
	GMLXE1Fob83VxWkUIORzMENb4XMG//ycENc60ZN6fswGCO9aQ6Ih9noQtqtGGBdD8rMyYoSDkH8f0
	95UsLsPKebTkon//L0qpltXSa/EpWnYSyOC48drDyY+gdYRABv3XUexmKbzZANIrX0Hw/ihgcaDwn
	uHK/TuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8GJK-005caQ-E9; Mon, 04 Jul 2022 07:15:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8GJG-005cW1-L2; Mon, 04 Jul 2022 07:15:57 +0000
X-UUID: 51b915b83a4e49cea873fad1fdcaaad2-20220704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=R/LfmfqvV6IeC2mL9C7ugjv5ZCnuOSEOFBUManlkPeY=;
	b=hC490d39FcYEBvNH0ZGfLyTfi2L4lvT9rqOXGVHmqA+RGcn4H4Xhu+0Ey7K1+7fULTbmW1N62yVElByKF0WlIEVgEN6NPE2++LCK0Q/4YmCKcqTrYwbM9V/k+dBr9nE1FBPedrnTPPkmuSA6bL72OpTls16SbvFkVr3aBntiKxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:73e33e6f-a6f7-4b10-a239-2cc9ebb43356,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:44eb7886-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 51b915b83a4e49cea873fad1fdcaaad2-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1446093395; Mon, 04 Jul 2022 00:15:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 4 Jul 2022 14:35:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 4 Jul 2022 14:35:01 +0800
Message-ID: <94c3037c0d70c855a8b78b9ab4f9db76f42c4b46.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mediatek: Add assigned clock
 property and axi clock in example
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Mon, 4 Jul 2022 14:35:01 +0800
In-Reply-To: <42b8bf2c-c343-8fd4-17fd-f22ed83d5d0d@linaro.org>
References: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
	 <20220630090157.29486-3-xiangsheng.hou@mediatek.com>
	 <42b8bf2c-c343-8fd4-17fd-f22ed83d5d0d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_001554_738009_0B6BFE8E 
X-CRM114-Status: GOOD (  16.32  )
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

T24gVGh1LCAyMDIyLTA2LTMwIGF0IDIwOjQxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAzMC8wNi8yMDIyIDExOjAxLCBYaWFuZ3NoZW5nIEhvdSB3cm90ZToNCj4gPiBG
b3IgbXQ4MTczLCBpdCBpcyBuZWVkZWQgdG8gYWRkIHRoZSBheGkgY2xvY2sgZm9yIGRtYSBtb2Rl
Lg0KPiA+IEFuZCBpdCBpcyBtYXkgbmVlZGVkIHRvIGFkanVzdCBkZWZhdWx0IHNwaSBmcmVxdWVu
Y3kuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWGlhbmdzaGVuZyBIb3UgPHhpYW5nc2hlbmcu
aG91QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3BpL21lZGlhdGVrLHNwaS1tdGstbm9yLnlhbWwgIHwgMTANCj4gPiArKysrKysrKy0tDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWVk
aWF0ZWssc3BpLQ0KPiA+IG10ay1ub3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zcGkvbWVkaWF0ZWssc3BpLQ0KPiA+IG10ay1ub3IueWFtbA0KPiA+IGluZGV4IDQx
ZTYwZmU0YjA5Zi4uNzUyM2Q5OTJhNjE0IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWssc3BpLW10ay0NCj4gPiBub3IueWFtbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWss
c3BpLW10ay0NCj4gPiBub3IueWFtbA0KPiA+IEBAIC02MSw2ICs2MSwxMiBAQCBwcm9wZXJ0aWVz
Og0KPiA+ICAgICAgICAtIGNvbnN0OiBheGkNCj4gPiAgICAgICAgLSBjb25zdDogYXhpX3MNCj4g
PiAgDQo+ID4gKyAgYXNzaWduZWQtY2xvY2tzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiAr
DQo+ID4gKyAgYXNzaWduZWQtY2xvY2stcGFyZW50czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+
ID4gKw0KPiANCj4gVGhlcmUgaXMgdXN1YWxseSBubyByZWFzb24gdG8gcHV0IHRoaXMgaW4gdGhl
IGJpbmRpbmdzLiANCj4gDQpXaWxsIGJlIHJlbW92ZSBpbiBuZXh0IHBhdGNoLg0K


