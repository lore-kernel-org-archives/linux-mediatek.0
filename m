Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11854C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7BVn8vixNm1V0AxZn0d56CLbff2mxtnI1+IVWUX7gQ=; b=Lgx4iHRcpz8T7aaiOgz2qzC1pc
	QOzp0haBBiQgntdmZLiiI3NJJFaDx2ZSQ5y4OgVRHd38EfeuUJep2Wxm1rK4zOVnHHFVynKE4jIDB
	UvvEsoGubC6djAgVZ3rMfaznpJ2bMWVc5Cd4nOVXmilmqZbkesEpLcAeEiVlrancPBF/G6qmPkB9G
	ymrreMxPnENZ4FzHo9U4W5NbJb/QaRt9R3x5IgSPxMPAJPHYSly0+Hil+4IsYAq61rVzUNys8w1wZ
	2TuMzIKqESrePBKD6YLg5qnOqdsx8WYp3UrkKyecwaGl5XxjaEhg8cYsZ9eMX0BZQZa79+QROBQRl
	1zwlzM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2jj-009Igq-Am; Thu, 28 Jul 2022 12:35:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2jg-009Ieh-1i
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 12:35:30 +0000
X-UUID: fe6ac3978ff74475a6135861bb09d451-20220728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=N7BVn8vixNm1V0AxZn0d56CLbff2mxtnI1+IVWUX7gQ=;
	b=Loc5OTXJfedIkWILmqruFj5lX1ylMtDZ88iOph3o9QGq++5/XFbRHxs9VDr2+0zb89tY4uq2caz0oEO+weLPuztsZDisbzqfH83QbaC31ehFvA7w+LFCahnib4lBu/1/fYaVc45HI0vNDSjxxgvgNrkQEh+NCIp6D3YfQ3B2bwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8ebc5098-4d77-4b98-9d3c-e81df3efb73b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:f5aea6cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fe6ac3978ff74475a6135861bb09d451-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <hui.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 459449597; Thu, 28 Jul 2022 05:35:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Jul 2022 20:13:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 20:13:06 +0800
Message-ID: <cf77d9230797b0f0bc6a678895ecd9cd482c18b4.camel@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: Add support for
 mt8188
From: hui.liu <hui.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jianguo.zhang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 28 Jul 2022 20:13:05 +0800
In-Reply-To: <caa39600-d56f-9748-9a93-aa9be2f88924@collabora.com>
References: <20220728084951.22102-1-hui.liu@mediatek.com>
	 <20220728084951.22102-2-hui.liu@mediatek.com>
	 <caa39600-d56f-9748-9a93-aa9be2f88924@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_053528_126599_6C791DCE 
X-CRM114-Status: GOOD (  12.35  )
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

T24gVGh1LCAyMDIyLTA3LTI4IGF0IDEyOjQ3ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRlayBNVDgxODggUGluIENvbnRy
b2xsZXINCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gSHVpIExpdSA8aHVpLmxp
dUBtZWRpYXRlay5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZSBN
ZWRpYVRlaydzIE1UODE4OCBQaW4gY29udHJvbGxlciBpcyB1c2VkIHRvIGNvbnRyb2wgU29DDQo+
ID4gcGlucy4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4g
PiArICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxODgtcGluY3RybA0KPiA+ICsNCj4gPiArICBncGlv
LWNvbnRyb2xsZXI6IHRydWUNCj4gPiArDQo+ID4gKyAgJyNncGlvLWNlbGxzJzoNCj4gPiArICAg
IGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgIE51bWJlciBvZiBjZWxscyBpbiBHUElPIHNwZWNp
Zmllciwgc2hvdWxkIGJlIHR3by4gVGhlIGZpcnN0DQo+ID4gY2VsbA0KPiA+ICsgICAgICBpcyB0
aGUgcGluIG51bWJlciwgdGhlIHNlY29uZCBjZWxsIGlzIHVzZWQgdG8gc3BlY2lmeQ0KPiA+IG9w
dGlvbmFsDQo+ID4gKyAgICAgIHBhcmFtZXRlcnMgd2hpY2ggYXJlIGRlZmluZWQgaW4gPGR0LWJp
bmRpbmdzL2dwaW8vZ3Bpby5oPi4NCj4gPiArICAgIGNvbnN0OiAyDQo+ID4gKw0KPiA+ICsgIGdw
aW8tcmFuZ2VzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+IA0KPiBQbGVhc2UgYWxs
b3cgdG8gc3BlY2lmeSBncGlvIG5hbWVzDQo+IA0KPiAgICBncGlvLWxpbmUtbmFtZXM6IHRydWUN
Cj4gDQo+IGFmdGVyIHdoaWNoOg0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IA0K
DQpIaSBBbmdlbG8sDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50LCBJIHdpbGwgYWRkIGdwaW8t
bGluZS1uYW1lcyBpbiBuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMsDQogIEh1aQ0KDQo=


