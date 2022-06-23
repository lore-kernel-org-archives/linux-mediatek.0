Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71857C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 02:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGGRqcgwS+LxOK6gOaMp4/oVXpHYi1OCGNbHBCXp1yQ=; b=gJpetDBFipZYe//7qAujNB9PG4
	mgOqTfuvla5Q9INR/F8+19ZYFAqsQX7fd3hl2FbML42Mq31kChc8xM+i8D29EqquYgP9DTzrCdjDi
	lm9DzsrzNYG+o1XkDCjJLCyz7gjFcLHgPaUBuUHv5ApgWWD0Trz+BAkG0z5SyfEeelTMjX9A/1XiZ
	CFGNzJ0WC5PrRYZfNEOcnWI+QIOHNduZ02oynJSpQCtCjsAm8lPNXG40bSRaJh1Z8Bun2wuuUNLRR
	ouaDKGLGkncpXbVkgQCS6UrJaF8jWsJ2GRr3rV6RUrsy68hOAzWsLZMrL4bdFfOI4Uw0UnBRc5e5k
	clQYGbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4CMJ-00Cu6e-V1; Thu, 23 Jun 2022 02:14:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4C3j-00Clfc-DR; Thu, 23 Jun 2022 01:55:04 +0000
X-UUID: df9ad2601bbe47b390da506d2f215e8a-20220622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rGGRqcgwS+LxOK6gOaMp4/oVXpHYi1OCGNbHBCXp1yQ=;
	b=J9qYVAPxGdpNg50Cv7efLDXDGRO3O+9eWM9s9yf2eQtl3n66AzuOONTzpObNUQG1tgL4+YjST3kPkJabwqu58M1ks4mHkinxr09441NegtmDGa3x7xAdtnu4gXgE88KBnuZNxvUIc5QfIaAFyUICnaPrDqg4ejP2w/mbjhB131Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ad8ec62a-8038-405b-80f6-4957b352adb7,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:4233cc2d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: df9ad2601bbe47b390da506d2f215e8a-20220622
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 503366178; Wed, 22 Jun 2022 18:54:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 18:54:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 23 Jun 2022 09:54:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 23 Jun 2022 09:54:44 +0800
Message-ID: <a53c4a4d9922c9a3fc774976494dea6da1bd8daa.camel@mediatek.com>
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Add error path for loop of
 mm_dts_parse
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Date: Thu, 23 Jun 2022 09:54:44 +0800
In-Reply-To: <521ed82e-f213-f635-6f5e-3e35ff8cc020@arm.com>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
	 <20220616054203.11365-3-yong.wu@mediatek.com>
	 <e2091397-b6e2-7296-1378-dc10b24c6ef4@arm.com>
	 <b2ea919315d0084adb465378e6970dbfa4f0829e.camel@mediatek.com>
	 <521ed82e-f213-f635-6f5e-3e35ff8cc020@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_185503_523361_F36FC809 
X-CRM114-Status: GOOD (  26.72  )
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

T24gVGh1LCAyMDIyLTA2LTE2IGF0IDExOjMxICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6DQo+
IE9uIDIwMjItMDYtMTYgMTE6MDgsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gT24gVGh1LCAyMDIyLTA2
LTE2IGF0IDA5OjU5ICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6DQo+ID4gPiBPbiAyMDIyLTA2
LTE2IDA2OjQyLCBZb25nIFd1IHdyb3RlOg0KPiA+ID4gPiBUaGUgbXRrX2lvbW11X21tX2R0c19w
YXJzZSB3aWxsIHBhcnNlIHRoZSBzbWkgbGFyYnMgbm9kZXMuIGlmDQo+ID4gPiA+IHRoZQ0KPiA+
ID4gPiBpKzENCj4gPiA+ID4gbGFyYiBpcyBwYXJzZWQgZmFpbChyZXR1cm4gLUVJTlZBTCksIHdl
IHNob3VsZCBvZl9ub2RlX3B1dCBmb3INCj4gPiA+ID4gdGhlDQo+ID4gPiA+IDAuLmkNCj4gPiA+
ID4gbGFyYnMuIEluIHRoZSBmYWlsIHBhdGgsIG9uZSBvZl9ub2RlX3B1dCBtYXRjaGVzIHdpdGgN
Cj4gPiA+ID4gb2ZfcGFyc2VfcGhhbmRsZSBpbg0KPiA+ID4gPiBpdC4NCj4gPiA+ID4gDQo+ID4g
PiA+IEZpeGVzOiBkMmU5YTExMDJjZmMgKCJpb21tdS9tZWRpYXRlazogQ29udGFpbiBNTSBJT01N
VSBmbG93DQo+ID4gPiA+IHdpdGgNCj4gPiA+ID4gdGhlIE1NIFRZUEUiKQ0KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+
ID4gPiA+ICAgIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgfCAyMSArKysrKysrKysrKysrKysr
LS0tLS0NCj4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pDQoNCltzbmlwLi5dDQoNCj4gPiA+ID4gK2Vycl9sYXJibm9kZV9wdXQ6DQo+ID4g
PiA+ICsJd2hpbGUgKGktLSkgew0KPiA+ID4gPiArCQlsYXJibm9kZSA9IG9mX3BhcnNlX3BoYW5k
bGUoZGV2LT5vZl9ub2RlLA0KPiA+ID4gPiAibWVkaWF0ZWssbGFyYnMiLCBpKTsNCj4gPiA+ID4g
KwkJaWYgKGxhcmJub2RlICYmDQo+ID4gPiA+IG9mX2RldmljZV9pc19hdmFpbGFibGUobGFyYm5v
ZGUpKSB7DQo+ID4gPiA+ICsJCQlvZl9ub2RlX3B1dChsYXJibm9kZSk7DQo+ID4gPiA+ICsJCQlv
Zl9ub2RlX3B1dChsYXJibm9kZSk7DQo+ID4gPiA+ICsJCX0NCj4gPiA+IA0KPiA+ID4gVGhpcyBs
b29rcyBhIGJpdCBhd2t3YXJkIC0gY291bGQgd2Ugbm90IGp1c3QgaXRlcmF0ZSB0aHJvdWdoDQo+
ID4gPiBkYXRhLT5sYXJiX2ltdSBhbmQgcHV0IGRldi0+b2Zfbm9kZSBmb3IgZWFjaCB2YWxpZCBk
ZXY/DQo+ID4gDQo+ID4gSXQgc2hvdWxkIHdvcmsuIFRoYW5rcyB2ZXJ5IG11Y2guDQo+ID4gDQo+
ID4gPiANCj4gPiA+IEFsc28sIG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUoKSB0YWtlcyBhIHJlZmVy
ZW5jZSBvbiB0aGUgc3RydWN0DQo+ID4gPiBkZXZpY2UNCj4gPiA+IGl0c2VsZiwgc28gc3RyaWN0
bHkgd2Ugc2hvdWxkIGJlIGRvaW5nIHB1dF9kZXZpY2UoKSBvbiB0aG9zZSBhcw0KPiA+ID4gd2Vs
bA0KPiA+ID4gaWYgd2UncmUgYmFpbGluZyBvdXQuDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGlz
IGhpbnQuIEEgbmV3IHJlZmVyZW5jZSBmb3IgbWUuIEkgd2lsbCBhZGQgaXQuDQo+IA0KPiBJbiBm
YWN0LCB0aGlua2luZyBhYm91dCBpdCBzb21lIG1vcmUgd2UgbWF5IGFzIHdlbGwgZG8gdGhlDQo+
IG9mX25vZGVfcHV0KCkgDQo+IHVuY29uZGl0aW9uYWxseSBpbW1lZGlhdGVseSBhZnRlciB0aGUg
b2ZfZmluZF9kZXZpY2VfYnlfbm9kZSgpIGNhbGwsIA0KDQpvZl9ub2RlX3B1dCBpcyBjYWxsZWQg
aW4gY29tcG9uZW50X3JlbGVhc2Vfb2YgaW4gdGhlIG5vcm1hbCBjYXNlLCB0aHVzDQp3ZSBzaG91
bGRuJ3QgY2FsbCBvZl9ub2RlX3B1dCB1bmNvbmRpdGlvbmFsbHkuIFJpZ2h0Pw0KDQooU29ycnkg
Zm9yIHJlcGx5IGxhdGUpDQoNCj4gc28gDQo+IHRoZW4gaXQncyAqb25seSogdGhlIGRldmljZSBy
ZWZlcmVuY2VzIHdlJ2QgbmVlZCB0byB3b3JyeSBhYm91dA0KPiBjbGVhbmluZyANCj4gdXAgaW4g
dGhlIGZhaWx1cmUgcGF0aC4NCj4gDQo+IFJvYmluLg0K


