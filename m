Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58862C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 02:12:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB4E20792
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 02:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1hSnTtrK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lz5xpKJ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB4E20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n+0i8HVD8+jOB5HF1k7qSukhhS7fV7hz3TxQT5OxKds=; b=1hSnTtrKoKhVpjBzCDSqAS9ed
	pjXouWWNBqzSbi+tB+7ZfJvPEdXjQVZplm7eSDdEV0x3Q3dkHjqwenLCBBRea3XN0zCBcA5WTOYeT
	YCsB1+ChiD40n+ggKrQDMdfSiFHZd/h96+bSDmMDS02JTSx8J3F+J8TtG2rIvYS0ZQ+CWnAqfPdwr
	j9cyQEkmKhP6p98bMebj8+GlonjuDC3OaCOnI+jgjj7OFiH2Jg4KiHc4A5aX3Pwp64ATYlOwTwjNm
	2jvtbBbC5kw4QP21F0MJe98CxT0QtaQpCere1inT82IBCmQlSSKMTs+1BT/N5D0qA0ZqdaoQ3+iw6
	k2G5qarug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2mQz-0003eX-UW; Tue, 04 Aug 2020 02:12:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2mQs-0003cV-Nl; Tue, 04 Aug 2020 02:12:04 +0000
X-UUID: acda04c4535442bca6864117289901d7-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fgyIQ7DsULlTTKIxA3Jlyx2v6bU2W2sQc//rLVyQcYE=; 
 b=Lz5xpKJ+f85TAWAFi4aRa830BUJDuzh8wcnYLAHoehkgjDIyPbSoTJSqau/rRx2gorfIAbBs6dsz4ISHxViTXhjLl2Wj++dUERIj3thL9kkne97EF2iJzvV1i0kzBvRAxaa0EnQxcvWgiiWgKe5OATdx6sCy4EpOS9029R13peM=;
X-UUID: acda04c4535442bca6864117289901d7-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1788138996; Mon, 03 Aug 2020 18:11:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 19:08:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 10:08:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 10:08:13 +0800
Message-ID: <1596506892.17917.2.camel@mtkswgap22>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 10:08:12 +0800
In-Reply-To: <CAAOTY__VPXMGcR9w8EdnGbJyVbxbLQY+SRAqLbOcTy0D_WLM0w@mail.gmail.com>
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8aw=6E7bMJwz5jDLXUxYHpy9_Avbwc90osQGckzANNcg@mail.gmail.com>
 <1596427295.22971.20.camel@mtkswgap22>
 <CAAOTY__VPXMGcR9w8EdnGbJyVbxbLQY+SRAqLbOcTy0D_WLM0w@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A1D2B56BE3B7D7DFFE750BB73D1DE48D8AD510E630AE667407D111F587BA25032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_221202_913822_6D2ABDB7 
X-CRM114-Status: GOOD (  29.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIwLTA4LTA0IGF0IDAwOjA0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgTmVhbDoNCj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaWvCAy
MDIw5bm0OOaciDPml6Ug6YCx5LiAIOS4i+WNiDEyOjAx5a+r6YGT77yaDQo+ID4NCj4gPiBIaSBD
aHVuLUt1YW5nLA0KPiA+DQo+ID4gT24gU2F0LCAyMDIwLTA4LTAxIGF0IDA4OjEyICswODAwLCBD
aHVuLUt1YW5nIEh1IHdyb3RlOg0KPiA+ID4gSGksIE5lYWw6DQo+ID4gPg0KPiA+ID4gVGhpcyBw
YXRjaCBpcyBmb3IgIm1lZGlhdGVrLG10Njc3OS1kZXZhcGMiLCBzbyBJIHRoaW5rIGNvbW1pdCB0
aXRsZQ0KPiA+ID4gc2hvdWxkIHNob3cgdGhlIFNvQyBJRC4NCj4gPg0KPiA+IE9rYXksIEknbGwg
Y2hhbmdlIHRpdGxlIHRvICdzb2M6bWVkaWF0ZWs6IGFkZCBtdDY3NzkgZGV2YXBjIGRyaXZlcicu
DQo+ID4NCj4gPiA+DQo+ID4gPiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMOW5tDfmnIgyOeaXpSDpgLHkuIkg5LiL5Y2INDoyOeWvq+mBk++8mg0KPiA+ID4gPg0KPiA+
ID4gPiBNZWRpYVRlayBidXMgZmFicmljIHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBw
b3J0IGFuZCBkYXRhDQo+ID4gPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBi
ZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkDQo+ID4gPiA+IG1hc3RlcnMuDQo+ID4gPiA+IFRo
ZSBzZWN1cml0eSB2aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRvIHRoZSBwcm9jZXNzb3Ig
Zm9yDQo+ID4gPiA+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLg0KPiA+ID4g
Pg0KPiA+ID4gPiBBbnkgb2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFp
c2UgYW4gaW50ZXJydXB0LCBhbmQNCj4gPiA+ID4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1k
ZXZhcGMgZHJpdmVyLiBUaGUgdmlvbGF0aW9uDQo+ID4gPiA+IGluZm9ybWF0aW9uIGlzIHByaW50
ZWQgaW4gb3JkZXIgdG8gZmluZCB0aGUgbXVyZGVyZXIuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+DQo+ID4gPiA+IC0tLQ0K
PiA+ID4NCj4gPiA+IFtzbmlwXQ0KPiA+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RydWN0IG10
a19kZXZhcGNfY29udGV4dCB7DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Ow0K
PiA+ID4gPiArICAgICAgIHUzMiB2aW9faWR4X251bTsNCj4gPiA+ID4gKyAgICAgICB2b2lkIF9f
aW9tZW0gKmRldmFwY19wZF9iYXNlOw0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBtdGtfZGV2YXBj
X3Zpb19pbmZvICp2aW9faW5mbzsNCj4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2Rl
dmFwY19wZF9vZmZzZXQgKm9mZnNldDsNCj4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRr
X2RldmFwY192aW9fZGJncyAqdmlvX2RiZ3M7DQo+ID4gPiA+ICt9Ow0KPiA+ID4NCj4gPiA+IEkg
dGhpbmsgdGhpcyBzdHJ1Y3R1cmUgc2hvdWxkIHNlcGFyYXRlIHRoZSBjb25zdGFudCBwYXJ0LiBU
aGUgY29uc3RhbnQgcGFydCBpczoNCj4gPiA+DQo+ID4gPiBzdHJ1Y3QgbXRrX2RldmFwY19kYXRh
IHsNCj4gPiA+ICAgICBjb25zdCB1MzIgdmlvX2lkeF9udW07DQo+ID4gPiAgICAgY29uc3Qgc3Ry
dWN0IG10a19kZXZhcGNfcGRfb2Zmc2V0ICpvZmZzZXQ7IC8qIEkgd291bGQgbGlrZSB0bw0KPiA+
ID4gcmVtb3ZlIHN0cnVjdCBtdGtfZGV2YXBjX3BkX29mZnNldCBhbmQgZGlyZWN0bHkgcHV0IGl0
cyBtZW1iZXIgaW50bw0KPiA+ID4gdGhpcyBzdHJ1Y3R1cmUgKi8NCj4gPiA+ICAgICBjb25zdCBz
dHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncyAqdmlvX2RiZ3M7IC8qIFRoaXMgbWF5IGRpc2FwcGVh
ciAqLw0KPiA+ID4gfTsNCj4gPiA+DQo+ID4gPiBBbmQgdGhlIGNvbnRleHQgaXM6DQo+ID4gPg0K
PiA+ID4gc3RydWN0IG10a19kZXZhcGNfY29udGV4dCB7DQo+ID4gPiAgICAgc3RydWN0IGRldmlj
ZSAqZGV2Ow0KPiA+ID4gICAgIHZvaWQgX19pb21lbSAqZGV2YXBjX3BkX2Jhc2U7DQo+ID4gPiAg
ICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNfZGF0YSAqZGF0YTsNCj4gPiA+IH07DQo+ID4gPg0K
PiA+ID4gU28gd2hlbiB5b3UgZGVmaW5lIHRoaXMsIHlvdSB3b3VsZCBub3Qgd2FzdGUgbWVtb3J5
IHRvIHN0b3JlIG5vbi1jb25zdGFudCBkYXRhLg0KPiA+ID4NCj4gPiA+IHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2RldmFwY19kYXRhIGRldmFwY19tdDY3NzkgPSB7DQo+ID4gPiAgLnZpb19pZHhf
bnVtID0gNTEwLA0KPiA+ID4gIC5vZmZzZXQgPSAmbXQ2Nzc5X3BkX29mZnNldCwNCj4gPiA+ICAu
dmlvX2RiZ3MgPSAmbXQ2Nzc5X3Zpb19kYmdzLA0KPiA+ID4gfTsNCj4gPiA+DQo+ID4NCj4gPiBT
b3JyeSwgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIHJlZmFjdG9yaW5nIHdpbGwg
bm90IHdhc3RlDQo+ID4gbWVtb3J5IHRvIHN0b3JlIG5vbi1jb25zdGFudCBkYXRhLiBDb3VsZCB5
b3UgZXhwbGFpbiBtb3JlIGRldGFpbHM/DQo+ID4gVG8gbXkgdW5kZXJzdGFuZGluZywgd2Ugc3Rp
bGwgYWxzbyBoYXZlIHRvIGFsbG9jYXRlIG1lbW9yeSB0byBzdG9yZSBkZXYNCj4gPiAmIGRldmFw
Y19wZF9iYXNlLg0KPiANCj4gSW4gc29tZSBzaXR1YXRpb24sIGl0IGlzLiBZb3UgbWFrZSB0aGUg
bm9uLWNvbnN0YW50IGRhdGEgYSBnbG9iYWwNCj4gdmFyaWFibGUuIEkgdGhpbmsgdGhlIGNvbnRl
eHQgZGF0YSBzaG91bGQgYmUgZHluYW1pYyBhbGxvY2F0ZWQuIElmDQo+IHRoaXMgZHJpdmVyIGlz
IG5vdCBwcm9iZWQsIHRoZSBub24tY29uc3RhbnQgZGF0YSBvY2N1cHkgdGhlIG1lbW9yeS4NCj4g
DQoNCkkgZ290IHlvdXIgcG9pbnQhIEluIHRoaXMgY2FzZSwgd2UgY2FuIHNhdmUgdGhlc2UgMiBk
YXRhIHN0cnVjdHVyZQ0Kc3BhY2UsIHJpZ2h0Pw0KDQpzdHJ1Y3QgZGV2aWNlICpkZXY7DQp2b2lk
IF9faW9tZW0gKmRldmFwY19wZF9iYXNlOw0KDQpJJ2xsIHJlZmFjdG9yaW5nIHRoaXMgZGF0YSBz
dHJ1Y3R1cmVzIG9uIG5leHQgcGF0Y2guIFRoYW5rcyAhDQoNCj4gUmVnYXJkcywNCj4gQ2h1bi1L
dWFuZy4NCj4gDQo+ID4NCj4gPiA+IFJlZ2FyZHMsDQo+ID4gPiBDaHVuLUt1YW5nLg0KPiA+ID4N
Cj4gPiA+ID4gKw0KPiA+ID4gPiArI2VuZGlmIC8qIF9fTVRLX0RFVkFQQ19IX18gKi8NCj4gPiA+
ID4gLS0NCj4gPiA+ID4gMS43LjkuNQ0KPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiA+ID4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QNCj4gPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+ID4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
DQo+ID4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
