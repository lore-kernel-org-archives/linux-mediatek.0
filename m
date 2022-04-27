Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C107C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9TGSNVgnsMEl6aXbwTDKnlMZzXU0d/hXZaPRLt6dMY=; b=31A7DWvTuQbmEj
	hKCUCSQ3v+X9fEMNhFlSxmG12mt3XFxFKmtWTxyJhiOiri7vmwkMw1YOCPPLnGXT9W/IUUSP0Qr+x
	jpPAh253TixpChK6eiz3tmlwN70C85m8NA18KEC32Si0iztCebJS56Tl8e168zlJCBZt2W+gGqJPg
	wLceFV9gCTTeJm+5boZSwmfFKNq7+Gp1rSpVx2zye+xqZRmXr+CfAFQnHHP2Iu5aLgF+hFLi4GPgS
	Cpn86/4N6rSvyyLX9EBm3OEIhQarLbqJOR/WbAN17XFINF7K+aZnPGhyt4jRSgaJjNh5yKi7lT562
	YGg87XR1I3mulZmgKBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcbT-000SSJ-4g; Wed, 27 Apr 2022 08:00:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcaz-000SEa-5S; Wed, 27 Apr 2022 08:00:23 +0000
X-UUID: d1c3935269d3461eb02e1a66ebb611ee-20220427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KeqOWdB9IVSsD5vjr7pKiXbKhbNheOChe8jyjk8N2TQ=; 
 b=jc6N0U2is2IJYoMiIFumQLwNgVdo3iK1Qj5M+dnU8a7AM8E0QYkuu5Ao9gqkDcx+g9F0ikFrGO5wwiTbEenvOK1LeWn8Ni52NHBTXR//ZgNpdupmiWtH7uSB+w34LbyNm6d4kqqLaHmcpablkmIdEfuZl2b86exrKySWFShRQRE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:39395287-fd9b-42f5-9a96-5850ec06e9ad, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:5e9ca7c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d1c3935269d3461eb02e1a66ebb611ee-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1200244022; Wed, 27 Apr 2022 01:00:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 01:00:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 16:00:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 16:00:05 +0800
Message-ID: <ec53cb218ab313cc6bd76660c9bd5c0ac46ad5d9.camel@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: media: mtk-vcodec: Adds encoder power
 domain property
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yunfei Dong <yunfei.dong@mediatek.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
 <longfei.wang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Apr 2022 16:00:05 +0800
In-Reply-To: <98a01f46-7fb0-6201-c9db-14e15d7e30c4@xs4all.nl>
References: <20220427033130.18497-1-irui.wang@mediatek.com>
 <98a01f46-7fb0-6201-c9db-14e15d7e30c4@xs4all.nl>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_010021_273380_D452CB79 
X-CRM114-Status: GOOD (  21.73  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGVhciBIYW5zLA0KDQpPbiBXZWQsIDIwMjItMDQtMjcgYXQgMDk6NDMgKzAyMDAsIEhhbnMgVmVy
a3VpbCB3cm90ZToNCj4gSGkgSXJ1aSwNCj4gDQo+IEknbSBtZXJnaW5nIHRoaXMgcGF0Y2ggZnJv
bSBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbywgd2hpY2ggaGFzIGFscmVhZHkNCj4gYmVlbiBBY2tl
ZCBieSBSb2I6DQo+IA0KPiANCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3Qv
bGludXgtbWVkaWEvcGF0Y2gvMjAyMjAyMjUyMjU4NTQuODEwMzgtNC1uZnJhcHJhZG9AY29sbGFi
b3JhLmNvbS8NCj4gDQo+IElmIHlvdSBzdGlsbCB3YW50IHRoZSBvdGhlciBjaGFuZ2VzIHlvdSBt
YWRlIGluIHRoaXMgcGF0Y2ggbWVyZ2VkLA0KPiB0aGVuIHBsZWFzZSBtYWtlDQo+IGEgdjMgb24g
dG9wIG9mIE7DrWNvbGFzJyBwYXRjaC4NCg0KVGhhbmtzIGZvciB5b3VyIGluZm9ybWF0aW9uIGFu
ZCBOw61jb2xhcycgcGF0Y2gsIHdlIHdpbGwgY2hlY2sgaXQgYW5kDQp3b3VsZCBzZW5kIGEgdjMg
cGF0Y2ggaWYgbmVlZGVkLg0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcy4NCj4gDQo+IFJlZ2FyZHMs
DQo+IA0KPiAJSGFucw0KPiANCj4gT24gMjcvMDQvMjAyMiAwNTozMSwgSXJ1aSBXYW5nIHdyb3Rl
Og0KPiA+IEFkZHMgZW5jb2RlciBwb3dlciBkb21haW4gcHJvcGVydHkuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+IGNoYW5nZXMgY29tcGFyZWQgd2l0aCB2MToNCj4gPiAtIHNldCAicG93ZXItZG9tYWlucyIg
YXMgYSBub24tcmVxdWlyZWQgcHJvcGVydHkNCj4gPiANCj4gPiBUaGUgJ21ha2UgZHRic19jaGVj
aycgd2FybmluZ3MoJ21lZGlhdGVrLGxhcmInKSBjYW4gYmUgZml4ZWQgYnkNCj4gPiBwYXRjaDoN
Cj4gPiANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9saXN0Lz9zZXJpZXM9NjMzOTkzDQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwgIHwgNg0KPiA+ICsrKysrKw0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVr
LHZjb2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4gZW5jb2Rlci55YW1sDQo+ID4g
aW5kZXggZGViNWI2NTdhMmQ1Li4yZDFlMGM5YmQ2ZWUgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiBl
bmNvZGVyLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVuY29kZXIueWFtbA0KPiA+IEBAIC00MSw2ICs0
MSw5IEBAIHByb3BlcnRpZXM6DQo+ID4gIA0KPiA+ICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHM6
IHRydWUNCj4gPiAgDQo+ID4gKyAgcG93ZXItZG9tYWluczoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICAgIGlvbW11czoNCj4gPiAgICAgIG1pbkl0ZW1zOiAxDQo+ID4gICAgICBt
YXhJdGVtczogMzINCj4gPiBAQCAtMTMyLDYgKzEzNSw3IEBAIGV4YW1wbGVzOg0KPiA+ICAgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsuaD4NCj4gPiAgICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9tZW1vcnkvbXQ4MTczLWxhcmItcG9ydC5oPg0KPiA+ICAgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE3My1wb3dlci5oPg0KPiA+ICANCj4gPiAg
ICAgIHZjb2RlY19lbmNfYXZjOiB2Y29kZWNAMTgwMDIwMDAgew0KPiA+ICAgICAgICBjb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE3My12Y29kZWMtZW5jIjsNCj4gPiBAQCAtMTUzLDYgKzE1Nyw3
IEBAIGV4YW1wbGVzOg0KPiA+ICAgICAgICBjbG9jay1uYW1lcyA9ICJ2ZW5jX3NlbCI7DQo+ID4g
ICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9WRU5DX1NFTD47DQo+
ID4gICAgICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuIENMS19UT1BfVkNP
REVDUExMPjsNCj4gPiArICAgICAgcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE3M19QT1dF
Ul9ET01BSU5fVkVOQz47DQo+ID4gICAgICB9Ow0KPiA+ICANCj4gPiAgICAgIHZjb2RlY19lbmNf
dnA4OiB2Y29kZWNAMTkwMDIwMDAgew0KPiA+IEBAIC0xNzMsNCArMTc4LDUgQEAgZXhhbXBsZXM6
DQo+ID4gICAgICAgIGNsb2NrLW5hbWVzID0gInZlbmNfbHRfc2VsIjsNCj4gPiAgICAgICAgYXNz
aWduZWQtY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1ZFTkNfTFRfU0VMPjsNCj4gPiAgICAg
ICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmdG9wY2tnZW4NCj4gPiBDTEtfVE9QX1ZDT0RF
Q1BMTF8zNzBQNT47DQo+ID4gKyAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxNzNf
UE9XRVJfRE9NQUlOX1ZFTkNfTFQ+Ow0KPiA+ICAgICAgfTsNCj4gDQo+IA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
