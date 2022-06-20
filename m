Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0937CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 06:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drsO6ekGiCxRU6Xi7gdEMtxWIHgrV/FQxECJ7+Xc6sQ=; b=UqGoVT2tWlgF/TrQwgQIoBJTao
	ma17xMTuwfUcGmy2gJfxVJpIpPzT38pmGHEVEGkFmtf9XI2YMHpJb+g31auRTRfhuGKvfDHz0yITU
	SHvL7aHjDYH0CjiSDtc79SgcuCOgHfPbpf0JIkczbJON7ueOJ/w0+cK3pVOPiKglh78qua6AqJVAH
	2Lx/FzTh6XB8Ry7cpENARLG9S74RzmQeuXWj1GDMTI/BYSVy/EJocrYXJET+cZGzDXEwkHmpd7nbl
	kDPChgLcRTSe3tfuI82BukvhgmFyLB/uCjktzTCOwsC9/Sg2ZiFdjkgmXsNCWj5m1ia8lOJZwaXeZ
	7vsQIBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3B1H-00GRyl-Gb; Mon, 20 Jun 2022 06:36:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3B16-00GRxW-Rf; Mon, 20 Jun 2022 06:36:10 +0000
X-UUID: efc6b25c3cae4909b75d7246468f420c-20220619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=drsO6ekGiCxRU6Xi7gdEMtxWIHgrV/FQxECJ7+Xc6sQ=;
	b=YMEJPM+Vco3F7BbqxgZmRZE7COq44hdWEQN8iPaUnpr/dRAgCQOM8Nj3c3UGRPFpfmdIc0EPuDZd4sQnb5PGZajT+Uc2dR4T/6Bzqp3biAfyg2tNUOXlJ3aT1gVasW5RW233xnfaJhA7y+JIJ8PXSCFJwCwr167MV7WSYDAUJT0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:a72d2f93-2b54-4c7b-be91-663a96836647,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:a7ef822d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: efc6b25c3cae4909b75d7246468f420c-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1383870956; Sun, 19 Jun 2022 23:36:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 23:31:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 14:31:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 14:31:27 +0800
Message-ID: <1b01b9a12d8ffe19aa37e23c644204203ff2db25.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Nicolas Dufresne <nicolas@ndufresne.ca>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, George Sun
	<george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, "Irui
 Wang" <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 20 Jun 2022 14:31:27 +0800
In-Reply-To: <CAGXv+5E2wULkB7_u_H7jFAi6Jk2AvUcfOJdzOp_5m2b4n3shww@mail.gmail.com>
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
	 <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
	 <CAGXv+5E2wULkB7_u_H7jFAi6Jk2AvUcfOJdzOp_5m2b4n3shww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_233608_944573_6043FBFC 
X-CRM114-Status: GOOD (  20.42  )
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

SGkgQ2hlbi1ZdSwNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQpPbiBNb24sIDIwMjIt
MDYtMjAgYXQgMTM6MjUgKzA4MDAsIENoZW4tWXUgVHNhaSB3cm90ZToNCj4gT24gTW9uLCBKdW4g
MjAsIDIwMjIgYXQgMTI6NTQgUE0gQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+DQo+
IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFNhdCwgSnVuIDE4LCAyMDIyIGF0IDM6MjkgUE0gWXVuZmVp
IERvbmcgPA0KPiA+IHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPiANCj4g
PiA+IE5lZWQgdG8gZ2V0IGRlY19jYXBhYmlsaXR5IGZyb20gc2NwIGZpcnN0LCB0aGVuIGluaXRp
YWxpemUNCj4gPiA+IGRlY29kZXINCj4gPiA+IHN1cHBvcnRlZCBmb3JtYXQgYW5kIG90aGVyIHBh
cmFtZXRlcnMgYWNjb3JkaW5nIHRvIGRlY19jYXBhYmlsaXR5DQo+ID4gPiB2YWx1ZS4NCj4gPiA+
IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVr
LmNvbT4NCj4gPiANCj4gPiBSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1
bS5vcmc+DQo+ID4gVGVzdGVkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4N
Cj4gPiANCj4gPiBUZXN0ZWQgb24gTVQ4MTgzIG9uIG1haW5saW5lIDIwMjIwNjE3LW5leHQgd2l0
aCB0aGUgdmNvZGVjLWRlYyBEVA0KPiA+IG5vZGUNCj4gPiBjb3BpZWQgZnJvbSB0aGUgQ2hyb21l
T1MgdjUuMTAga2VybmVsLg0KPiA+IA0KPiA+IFRoaXMgZml4ZXMgYW4gaXNzdWUgd2hlcmUgdGhl
IGZpcnN0IGF0dGVtcHQgdG8gZW51bWVyYXRlIGZvcm1hdHMgb24NCj4gPiB0aGUNCj4gPiBkZXZp
Y2UgcmlnaHQgYWZ0ZXIgYm9vdCByZXR1cm5zIGFuIGVtcHR5IGxpc3QuDQo+IA0KPiBCVFcsIHRo
aXMgc2hvdWxkIGhhdmUgYSBGaXhlcyB0YWcuDQo+IA0KPiBFaXRoZXINCj4gDQo+IEZpeGVzOiA3
YTdhZTI2ZmQ0NTggKCJtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogc3VwcG9ydCBzdGF0ZWxlc3Mg
VlA4DQo+IGRlY29kaW5nIikNCj4gDQo+IHdoaWNoIGxvb2tzIGxpa2UgdGhlIGZpcnN0IGluc3Rh
bmNlIG9mIHdoZW4gZmlybXdhcmUgY2FwYWJpbGl0eQ0KPiByZWFsbHkgaXMNCj4gY29uc2lkZXJl
ZCwgb3INCj4gDQo+IEZpeGVzOiBmZDAwZDkwMzMwZDEgKCJtZWRpYTogbXRrLXZjb2RlYzogdmRl
YzogbW92ZSBzdGF0ZWZ1bCBvcHMgaW50bw0KPiB0aGVpciBvd24gZmlsZSIpDQo+IA0KPiB3aGlj
aCBtYXRjaGVzIHdoZW4gY3R4LT5kZXYtPnZkZWNfcGRhdGEtPmluaXRfdmRlY19wYXJhbXMoY3R4
KSB3YXMNCj4gZmlyc3QgYWRkZWQuDQo+IA0KPiANCj4gQ2hlbll1DQoNCkkgd2lsbCBmaXggdGhl
IHBhdGNoIGluIHYyLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0K


