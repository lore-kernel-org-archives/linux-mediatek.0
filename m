Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAE4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 01:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRznnfiXZBdBqYc3cItl+rLkhEGKyHaB2eDnOIM8Vu8=; b=VXtyH3iwd4n8zOwHaDSUSuvHGp
	hy10V3w5M9sSECuaS0Lt19NERK6QnlXWp2i4IdYcksV23830yvSx4BaOWr3IDjlGpuPOLpxeSHbrK
	xbLJ829ppCxf98xVKT734A8/4TiITA1DbIf1Oh0i735Im34bQl8t04qnas4FdkygtrPxvRJuJDbD+
	+C+Pix0LaFwnrtryS+x5zd4BcX0tAlZJXXHDLs5+qC9v+/BLDO1WhJfESKYVB12I78mACzW6KqsHh
	52sKtWojz2MjFMxwo19nD4zktu1tRuXWdig8D85xbByqrOJ1beF9hBbdJrpKlkBw4el7Yf4OZgUpl
	skw08Fzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pWk-008424-Go; Wed, 22 Jun 2022 01:51:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pWZ-0083zI-0p; Wed, 22 Jun 2022 01:51:20 +0000
X-UUID: 762aeb272c03447bad08b03b17b68822-20220621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=cRznnfiXZBdBqYc3cItl+rLkhEGKyHaB2eDnOIM8Vu8=;
	b=SoL4tSS4v9FdAgE98/stp3oMzMH8m1pbaxFlSRM+shTeQQoWbFg2wUsefaTsrR24PcDGALQuS+pvFPwkrMiBYK8rqIgIuQyc9GMdYbOZs7kpBGrVbXzcMDfTWfVVXAyjCPf4C2OiwaagX0rhWl0AX54a31C0wbIqJViGGCa4l8A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:5817a78c-1658-4d2b-bc00-848773e25b6f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:ec3a1d38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 762aeb272c03447bad08b03b17b68822-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1648381368; Tue, 21 Jun 2022 18:51:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 18:44:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 09:44:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 09:44:32 +0800
Message-ID: <be1069684f0482984234fb4e8509615dca2e602a.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Chen-Yu Tsai
	<wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 22 Jun 2022 09:44:32 +0800
In-Reply-To: <320bf3dd2bef0afec794d610b446d0085dcfe362.camel@ndufresne.ca>
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
	 <320bf3dd2bef0afec794d610b446d0085dcfe362.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_185119_109176_A6E4D9A4 
X-CRM114-Status: GOOD (  23.06  )
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

SGkgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQpJIGFscmVhZHkgc2Vu
dCBwYXRjaCB2MiB0byBhZGQgZml4ZXMgdGFibGUgaW4gSnVuZSAyMC4NCg0KQmVzdCBSZWdhcmRz
LA0KWXVuZmVpIERvbmcNCk9uIFR1ZSwgMjAyMi0wNi0yMSBhdCAxMDoyMCAtMDQwMCwgTmljb2xh
cyBEdWZyZXNuZSB3cm90ZToNCj4gSGkgWXVuZmVpLA0KPiANCj4gTGUgc2FtZWRpIDE4IGp1aW4g
MjAyMiDDoCAxNToyOSArMDgwMCwgWXVuZmVpIERvbmcgYSDDqWNyaXQgOg0KPiA+IE5lZWQgdG8g
Z2V0IGRlY19jYXBhYmlsaXR5IGZyb20gc2NwIGZpcnN0LCB0aGVuIGluaXRpYWxpemUgZGVjb2Rl
cg0KPiA+IHN1cHBvcnRlZCBmb3JtYXQgYW5kIG90aGVyIHBhcmFtZXRlcnMgYWNjb3JkaW5nIHRv
IGRlY19jYXBhYmlsaXR5DQo+ID4gdmFsdWUuDQo+IA0KPiBQZXJoYXBzIHNvbWV0aGluZyB0byBp
bXByb3ZlIGluIHRoZSBmdXR1cmUuIE9uIHRvcCBvZiBkZXNjcmliaW5nIHRoZQ0KPiBmaXgsIGl0
DQo+IGNvdWxkIGJlIHVzZWZ1bCB0byBkZXNjcmliZSB3aGF0IGlzc3VlcyBpcyBiZWluZyBmaXhl
ZCwgYW5kIHdoaWNoDQo+IHBsYXRmb3JtIHdpbGwNCj4gYmVuZWZpdC4NCj4gDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4NCj4g
DQo+IFRvIGFkZCB0byB0aGlzLCB0aGlzIGxvb2tzIGxpa2UgYSBidWcgZml4LCBjYW4geW91IHJl
bGF0ZSBpdCB0byBhbg0KPiBvcmlnaW5hbA0KPiBjb21taXQgYW5kIGFkZCBhIEZpeGVzOiB0YWcg
aGVyZSA/DQo+IA0KPiByZWdhcmRzLA0KPiBOaWNvbGFzDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5jICAgICB8
IDIgLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zj
b2RlY19kZWNfZHJ2LmMgfCAyICsrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjLmMNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjLmMNCj4g
PiBpbmRleCAxNDY1ZGRmZjFjNmIuLjQxNTg5NDcwZGEzMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5jDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19k
ZWMuYw0KPiA+IEBAIC0xMTIsOCArMTEyLDYgQEAgdm9pZCBtdGtfdmNvZGVjX2RlY19zZXRfZGVm
YXVsdF9wYXJhbXMoc3RydWN0DQo+ID4gbXRrX3Zjb2RlY19jdHggKmN0eCkNCj4gPiAgew0KPiA+
ICAJc3RydWN0IG10a19xX2RhdGEgKnFfZGF0YTsNCj4gPiAgDQo+ID4gLQljdHgtPmRldi0+dmRl
Y19wZGF0YS0+aW5pdF92ZGVjX3BhcmFtcyhjdHgpOw0KPiA+IC0NCj4gPiAgCWN0eC0+bTJtX2N0
eC0+cV9sb2NrID0gJmN0eC0+ZGV2LT5kZXZfbXV0ZXg7DQo+ID4gIAljdHgtPmZoLm0ybV9jdHgg
PSBjdHgtPm0ybV9jdHg7DQo+ID4gIAljdHgtPmZoLmN0cmxfaGFuZGxlciA9ICZjdHgtPmN0cmxf
aGRsOw0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+IGluZGV4IDQxMDNk
N2MxYjYzOC4uOTlkN2IxNWYyYjlkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMN
Cj4gPiBAQCAtMjA4LDYgKzIwOCw4IEBAIHN0YXRpYyBpbnQgZm9wc192Y29kZWNfb3BlbihzdHJ1
Y3QgZmlsZSAqZmlsZSkNCj4gPiAgDQo+ID4gIAkJZGV2LT5kZWNfY2FwYWJpbGl0eSA9DQo+ID4g
IAkJCW10a192Y29kZWNfZndfZ2V0X3ZkZWNfY2FwYShkZXYtPmZ3X2hhbmRsZXIpOw0KPiA+ICsJ
CWN0eC0+ZGV2LT52ZGVjX3BkYXRhLT5pbml0X3ZkZWNfcGFyYW1zKGN0eCk7DQo+ID4gKw0KPiA+
ICAJCW10a192NGwyX2RlYnVnKDAsICJkZWNvZGVyIGNhcGFiaWxpdHkgJXgiLCBkZXYtDQo+ID4g
PmRlY19jYXBhYmlsaXR5KTsNCj4gPiAgCX0NCj4gPiAgDQo+IA0KPiANCg==


