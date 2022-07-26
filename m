Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1B3C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNfmXnERXdQ1wg5WOE/s1hkmzCHfSm7u7p1V21HeOK0=; b=HsjPwGibgLZvuY9iJ2NlSvA5xG
	NQVkWPu65seshTLTlJkIcWqfoDTkRRFPbDEXaiqIVIcg6JmvRBnNCBl/hJD5lTg4KpRT+YfDcyODW
	kk6rq8pZijmXJRTFZCF2nXCakv4lfzHb7lHsWoZu6u8Jb0Ikq/hhPm7Xz5Lqx+cZiD8p2BHpv2I6P
	oh6GwhpROqWAgbO+7mR3fprxzf6YKq/TNqEdgicsAiwyagmgcyiGDwHj8UIJ1hzI8+8eitdDY4/+b
	IzbMEGdtWkMVpd7dB8L6dhlwPfTpvH1Um5Gd9OmoAwJuBOPV1uSSlG0ccb3bQYfZW2+t5x6+W85T3
	gNIezgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGIpu-00G1PJ-0D; Tue, 26 Jul 2022 11:34:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGIpq-00G1A6-Nj; Tue, 26 Jul 2022 11:34:48 +0000
X-UUID: 302eaa689c2549d2a94461aa181f1957-20220726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jNfmXnERXdQ1wg5WOE/s1hkmzCHfSm7u7p1V21HeOK0=;
	b=KB1nZvj+BU3fJDtBMvDiOeZ5gV1mldr4Bdb0Wx84LPYQAFHjU546C05FxVnA95TeB//7lT4wfwya+rHrPXnFdYkfTlwlXbU7+wcgZhikR025Oz7wkoI3hhYoF4PbDOKpaKGuhQSzUXJuZ+n19mQSq9PRt/gTz5ItqVa5Q4oP30g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:047cf041-4314-4967-a57f-0d7ff601a0f8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:947c8ab3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 302eaa689c2549d2a94461aa181f1957-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1722728670; Tue, 26 Jul 2022 04:34:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 19:34:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jul 2022 19:34:37 +0800
Message-ID: <6be179889a53bd7f5c281cb4ab0c4dd2e7306143.camel@mediatek.com>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Add mt8188 decoder's chip
 name
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Irui Wang
	<irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 26 Jul 2022 19:34:37 +0800
In-Reply-To: <CAGXv+5FdYKNqG6TQawWpiH29oSAPdZFAy1wHM=qkqDDSbs2CUw@mail.gmail.com>
References: <20220726040155.17206-1-yunfei.dong@mediatek.com>
	 <20220726040155.17206-3-yunfei.dong@mediatek.com>
	 <CAGXv+5FdYKNqG6TQawWpiH29oSAPdZFAy1wHM=qkqDDSbs2CUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_043446_803006_50E1B053 
X-CRM114-Status: GOOD (  19.17  )
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

SGkgQ2hlbi1ZdSwNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQoNCkkgd2lsbCBtZXJn
ZSBwYXRjaCAzIGFuZCAyIGludG8gb25lIHBhdGNoIGluIHYyLg0KDQpCZXN0IFJlZ2FyZHMsDQpZ
dW5mZWkgRE9uZw0KT24gVHVlLCAyMDIyLTA3LTI2IGF0IDE2OjI4ICswODAwLCBDaGVuLVl1IFRz
YWkgd3JvdGU6DQo+IE9uIFR1ZSwgSnVsIDI2LCAyMDIyIGF0IDEyOjAyIFBNIFl1bmZlaSBEb25n
IDwNCj4geXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiANCj4gPiBHZXR0aW5n
IG10ODE4OCdzIGNoaXAgbmFtZSBhY2NvcmRpbmcgdG8gZGVjb2RlciBjb21wYXRpYmxlIG5hbWUu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlh
dGVrLmNvbT4NCj4gDQo+IFRoaXMgc2hvdWxkIGJlIHNxdWFzaGVkIHdpdGggdGhlIHByZXZpb3Vz
IHBhdGNoIGFkZGluZyB0aGUgY29tcGF0aWJsZQ0KPiB0byB0aGUgZHJpdmVyLg0KPiANCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2Rl
Y19kZWMuYyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL210a192Y29kZWNfZGVjLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjLmMNCj4gPiBpbmRleCA3ZDE5NGE0NzY3MTMuLjY0
MWY1MzNjNDE3ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWMuYw0KPiA+IEBAIC0yMjcsNiArMjI3
LDggQEAgc3RhdGljIGludCBtdGtfdmNvZGVjX2RlY19nZXRfY2hpcF9uYW1lKHZvaWQNCj4gPiAq
cHJpdikNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDgxOTU7DQo+ID4gICAgICAgICBlbHNl
IGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShkZXYtPm9mX25vZGUsDQo+ID4gIm1lZGlhdGVr
LG10ODE4Ni12Y29kZWMtZGVjIikpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiA4MTg2Ow0K
PiA+ICsgICAgICAgZWxzZSBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2Rl
LA0KPiA+ICJtZWRpYXRlayxtdDgxODgtdmNvZGVjLWRlYyIpKQ0KPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gODE4ODsNCj4gPiAgICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDgxNzM7DQo+ID4gIH0NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+IA0K


