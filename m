Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157FBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEBFwLx40tY5g83YOKhosC0PcSAf6CJhj6VRWuiUUYw=; b=jukbvr8suDjsHYiLCZyENB+pd6
	B8st6YzMSUzDgH9kBb1HdVaA2oKzKrFDNTYGsqHLuo8o3azUl2PuwWmhrzlmgcyf6xDz+/RoFPeSw
	l8ADgNVp1dcfeDdeYkSEeWJyAd7kzfCGvd19X7Q9UtwbFM4Ey5+E8WYltB7LEvNjz/DU6C02cRHYb
	Bg2/XhK1dkkAkIJhXJlFHAZWI0HvU63JqEgjR8PSr4M20KAG360OSMRnyeGP/Pwoz+MT+BYbWkD3A
	s012Q/TA+Vfrmcg8MNk+V2rEA8vzgs11CU7/XsFGborAq/9VsZwaQsJ3xbICK2nlDhUPMQ5Cns74e
	uYzpTdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDP0C-00CrEj-FY; Mon, 18 Jul 2022 11:33:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDP08-00Cr8k-IS; Mon, 18 Jul 2022 11:33:26 +0000
X-UUID: 80281e48f4fc48568e082518b68be410-20220718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xEBFwLx40tY5g83YOKhosC0PcSAf6CJhj6VRWuiUUYw=;
	b=G+trTfss2P6kmCla4XheuL3vselzbVtSuwXnH4dJzvL1ghxgJk4UY3fpg317KkeS2s1fco9VGq4cNqPQySnM6EA53UZAqQeTHY4cb7um1/rSdFCYgPZ6IiKZrwUeWQ+1Opt7oU+5sDsPQglNWxwhGxUkIrVzbtLtZHaeShqankE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:75d39871-bbf7-46bb-be43-bc61b903839c,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:86589864-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 80281e48f4fc48568e082518b68be410-20220718
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 840318231; Mon, 18 Jul 2022 04:33:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 18 Jul 2022 19:32:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 18 Jul 2022 19:32:35 +0800
Message-ID: <bc6d59fcaa117b2058e2ce394a839e8ad3a51f93.camel@mediatek.com>
Subject: Re: [PATCH 2/5] dt-bindings: media: mediatek: vcodec: Add encoder
 dt-bindings for mt8188
From: Irui Wang <irui.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
CC: Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 18 Jul 2022 19:32:34 +0800
In-Reply-To: <9e1b51df-6d4e-5767-3111-dd1232ad22ad@collabora.com>
References: <20220716093808.29894-1-irui.wang@mediatek.com>
	 <20220716093808.29894-3-irui.wang@mediatek.com>
	 <9e1b51df-6d4e-5767-3111-dd1232ad22ad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_043324_642763_8170BAB7 
X-CRM114-Status: GOOD (  14.97  )
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

T24gTW9uLCAyMDIyLTA3LTE4IGF0IDExOjUxICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTYvMDcvMjIgMTE6MzgsIElydWkgV2FuZyBoYSBzY3JpdHRvOg0K
PiA+IEFkZCBlbmNvZGVyIGR0LWJpbmRpbmdzIGZvciBtdDgxODguDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVu
Y29kZXIueWFtbCAgICAgICB8IDEgKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMt
DQo+ID4gZW5jb2Rlci55YW1sDQo+ID4gaW5kZXggZDM2ZmNjYTA0Y2JjLi42NjkwMTExOGQzNDYg
MTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L21lZGlhdGVrLHZjb2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVuY29k
ZXIueWFtbA0KPiA+IEBAIC0yMiw2ICsyMiw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAt
IG1lZGlhdGVrLG10ODE4My12Y29kZWMtZW5jDQo+IA0KPiBQbGVhc2Uga2VlcCBhbHBoYWJldGlj
YWwgb3JkZXIuDQo+IEFkZCBpdCBoZXJlIGluc3RlYWQuDQpGaXggaXQgaW4gbmV4dCB2ZXJzaW9u
Lg0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcw0KPiANCj4gPiAgICAgICAgIC0gbWVkaWF0ZWssbXQ4
MTkyLXZjb2RlYy1lbmMNCj4gPiAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1LXZjb2RlYy1lbmMN
Cj4gPiArICAgICAgLSBtZWRpYXRlayxtdDgxODgtdmNvZGVjLWVuYw0KPiA+ICAgDQo+ID4gICAg
IHJlZzoNCj4gPiAgICAgICBtYXhJdGVtczogMQ0K


