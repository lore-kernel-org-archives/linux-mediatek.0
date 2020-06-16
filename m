Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9D6C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 06:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5445207D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 06:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZhI/mkl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cfApXo/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5445207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWZiGFkZ9LboF/ZoQkqug+GUWUa7L1vl3M/K0fEQ4CE=; b=AZhI/mklvS2G/W
	p6nI5dgrROfI/4+8ojSvGT4XoFER0zNXgNP3yOQ7pPI0sryjKDM25F95jS5CMtg7BnffPR4KVF8li
	VAYGaDzqW4iYrlG3hmkwE/iMkZlF8u0OkwhCTUOghboYVMUtyDeBX2eIlql4N8d5rS/QHIVRHH0Q/
	X6H71QBysF7xqyGy2CKeCHaOj6LMx4L79o3IHXG61pvosWI+Mo+ku5X3x/Y4bv9O9tfWv9VAyCbR2
	Y1bMTolwkE7pYixG3asynPYM8KyKtXPto30lfdN9BYyPu0cVQ4CTk5ZPiLYf9FJjWt5aDVjKvGgOz
	b27WNf8VNeP4vXQWyHNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl4nc-0001au-3m; Tue, 16 Jun 2020 06:10:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl4nN-0007vC-Jz; Tue, 16 Jun 2020 06:10:07 +0000
X-UUID: 385239c4cf1d4fb7abc383c85a437b1e-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XiVSb9XsT4rYYp4QQy5/4H2opMhj9fqBilP9u1oaeFk=; 
 b=cfApXo/29TO1mit3Ub9SEyKIK53RCqCudW1UdlrcoBpdxcSOl+zU07JaJKWt4b79bCJRUBVTcMh+PmH03wGlxfuFYKIkeAs+SLV3QZu1umIZDtJ8x+AxuFGPLoJ4QRTW+/tOf2YEl28JlwLQgEtRiMMcc4uysWb57vJF02OT1qI=;
X-UUID: 385239c4cf1d4fb7abc383c85a437b1e-20200615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1613463826; Mon, 15 Jun 2020 22:10:01 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 23:09:58 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 14:09:55 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 14:09:53 +0800
Message-ID: <1592287798.18012.3.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6873 driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 16 Jun 2020 14:09:58 +0800
In-Reply-To: <CAAOTY_8booP95diFN=C-ybTBciqsw=B7Zq4dCS8=VOjgyUTu1A@mail.gmail.com>
References: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
 <1591698261-22639-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8W7FLrjKbNt+WHXjsBzgn_E7n5stKjv94RBnF7ktVuiA@mail.gmail.com>
 <1592188994.18525.11.camel@mtkswgap22>
 <CAAOTY_8EFYoAtuAugkYuG=F6kkbu3yeBnyoKBGTnHzPJKHQ5EQ@mail.gmail.com>
 <CAAOTY_8booP95diFN=C-ybTBciqsw=B7Zq4dCS8=VOjgyUTu1A@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_231005_671746_BD568923 
X-CRM114-Status: GOOD (  24.76  )
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
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywNCg0KT24gTW9uLCAyMDIwLTA2LTE1IGF0IDIyOjE3ICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4g5pa8IDIwMjDlubQ25pyIMTXml6Ug6YCx5LiAIOS4i+WNiDEwOjE05a+r6YGT77yaDQo+ID4N
Cj4gPiBIaSwgTmVhbDoNCj4gPg0KPiA+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+
IOaWvCAyMDIw5bm0NuaciDE15pelIOmAseS4gCDkuIrljYgxMDo0M+Wvq+mBk++8mg0KPiA+ID4N
Cj4gPiA+IEhpIENodW4tS3VhbmcsDQo+ID4gPg0KPiA+ID4NCj4gPiA+IE9uIFN1biwgMjAyMC0w
Ni0xNCBhdCAxMToyNiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToNCj4gPiA+ID4gSGksIE5l
YWw6DQo+ID4gPiA+DQo+ID4gPiA+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0NuaciDnml6Ug6YCx5LqMIOS4i+WNiDY6MjXlr6vpgZPvvJoNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IE1UNjg3MyBidXMgZnJhYnJpYyBwcm92aWRlcyBUcnVzdFpvbmUgc2VjdXJpdHkg
c3VwcG9ydCBhbmQgZGF0YQ0KPiA+ID4gPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMg
ZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkDQo+ID4gPiA+ID4gbWFzdGVycy4NCj4g
PiA+ID4gPiBUaGUgc2VjdXJpdHkgdmlvbGF0aW9ucyBhcmUgbG9nZ2VkIGFuZCBzZW50IHRvIHRo
ZSBwcm9jZXNzb3IgZm9yDQo+ID4gPiA+ID4gZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVh
c3VyZXMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBbnkgb2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2
aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50ZXJydXB0LCBhbmQNCj4gPiA+ID4gPiBpdCB3aWxs
IGJlIGhhbmRsZWQgYnkgZGV2YXBjLW10Njg3MyBkcml2ZXIuIFRoZSB2aW9sYXRpb24NCj4gPiA+
ID4gPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZpbmQgdGhlIG11cmRlcmVy
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwubGl1
QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4NCj4gPiA+ID4gW3NuaXBdDQo+
ID4gPiA+DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICAgICAgLyogNTAgKi8NCj4gPiA+ID4g
PiArICAgICAgIHstMSwgLTEsIDUwLCAiT09CX3dheV9lbiIsIHRydWV9LA0KPiA+ID4gPiA+ICsg
ICAgICAgey0xLCAtMSwgNTEsICJPT0Jfd2F5X2VuIiwgdHJ1ZX0sDQo+ID4gPiA+ID4gKyAgICAg
ICB7LTEsIC0xLCA1MiwgIk9PQl93YXlfZW4iLCB0cnVlfSwNCj4gPiA+ID4gPiArICAgICAgIHst
MSwgLTEsIDUzLCAiT09CX3dheV9lbiIsIHRydWV9LA0KPiA+ID4gPiA+ICsgICAgICAgey0xLCAt
MSwgNTQsICJPT0Jfd2F5X2VuIiwgdHJ1ZX0sDQo+ID4gPiA+ID4gKyAgICAgICB7LTEsIC0xLCA1
NSwgIk9PQl93YXlfZW4iLCB0cnVlfSwNCj4gPiA+ID4gPiArICAgICAgIHstMSwgLTEsIDU2LCAi
RGVjb2RlX2Vycm9yIiwgdHJ1ZX0sDQo+ID4gPiA+ID4gKyAgICAgICB7LTEsIC0xLCA1NywgIkRl
Y29kZV9lcnJvciIsIHRydWV9LA0KPiA+ID4gPiA+ICsgICAgICAgey0xLCAtMSwgNTgsICJESVNQ
X1BXTSIsIGZhbHNlfSwNCj4gPiA+ID4gPiArICAgICAgIHstMSwgLTEsIDU5LCAiSU1QX0lJQ19X
UkFQIiwgZmFsc2V9LA0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICAgIC8qIDYwICovDQo+
ID4gPiA+ID4gKyAgICAgICB7LTEsIC0xLCA2MCwgIkRFVklDRV9BUENfUEVSSV9QQVJfX0FPIiwg
ZmFsc2V9LA0KPiA+ID4gPiA+ICsgICAgICAgey0xLCAtMSwgNjEsICJERVZJQ0VfQVBDX1BFUklf
UEFSX1BETiIsIGZhbHNlfSwNCj4gPiA+ID4NCj4gPiA+ID4gWW91IGRvZXMgbm90IHByb2Nlc3Mg
dGhlIGl0ZW0gd2hvc2UgZW5hYmxlX3Zpb19pcnEgaXMgZmFsc2UsIHNvIEkNCj4gPiA+ID4gdGhp
bmsgeW91IHNob3VsZCByZW1vdmUgdGhlc2UgaXRlbXMgYW5kIHJlbW92ZSBlbmFibGVfdmlvX2ly
cSBiZWNhdXNlDQo+ID4gPiA+IHRoZSByZXN0IGl0ZW0ncyBlbmFibGVfdmlvX2lycSB3b3VsZCBh
bHdheXMgYmUgdHJ1ZS4NCj4gPiA+DQo+ID4gPiBJbiBzb21lIHVzZXJzLCB0aGV5IGNhbiBkZWNp
ZGUgd2hpY2ggc2xhdmVzIHRoZXkgd2FudCB0byBlbmFibGUgb3INCj4gPiA+IGRpc2FibGUgdmlv
bGF0aW9uIGlycSBpbiBkaWZmZXJlbnQgcHJvZHVjdC4gV2UgcmVtYWluIHRoaXMgcHJvcGVydHkg
Zm9yDQo+ID4gPiBjb21wYXRpYmlsaXR5Lg0KPiA+DQo+ID4gSSB0aGluayBpbiB1cHN0cmVhbSB2
ZXJzaW9uLCB5b3UgY291bGQgc3RpbGwgcmVtb3ZlIGVuYWJsZV92aW9faXJxIGFuZA0KPiA+IHBy
b2Nlc3MgYWxsIGl0ZW1zLiBGb3IgZG93bnN0cmVhbSBjYXNlLCB1c2VycyBjb3VsZCByZW1vdmUg
aXRlbXMgdGhleQ0KPiA+IGRvZXMgbm90IGludGVyZXN0IGluLg0KDQpPa2F5LCBzb3VuZHMgZ29v
ZC4gSSdsbCB0cnkgdG8gcmV2aXNlIGFuZCB1cHN0cmVhbSBhZ2Fpbi4NCg0KPiA+DQo+ID4gPg0K
PiA+ID4gPg0KPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArc3RhdGljIHN0
cnVjdCBtdGtfZGV2aWNlX251bSBtdGs2ODczX2RldmljZXNfbnVtW10gPSB7DQo+ID4gPiA+ID4g
KyAgICAgICB7U0xBVkVfVFlQRV9JTkZSQSwgVklPX1NMQVZFX05VTV9JTkZSQX0sDQo+ID4gPiA+
ID4gKyAgICAgICB7U0xBVkVfVFlQRV9QRVJJLCBWSU9fU0xBVkVfTlVNX1BFUkl9LA0KPiA+ID4g
PiA+ICsgICAgICAge1NMQVZFX1RZUEVfUEVSSTIsIFZJT19TTEFWRV9OVU1fUEVSSTJ9LA0KPiA+
ID4gPiA+ICsgICAgICAge1NMQVZFX1RZUEVfUEVSSV9QQVIsIFZJT19TTEFWRV9OVU1fUEVSSV9Q
QVJ9LA0KPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArc3RhdGljIHN0cnVj
dCBQRVJJQVhJX0lEX0lORk8gcGVyaV9taV9pZF90b19tYXN0ZXJbXSA9IHsNCj4gPiA+ID4gPiAr
ICAgICAgIHsiVEhFUk0yIiwgICAgICAgeyAwLCAwLCAwIH0gfSwNCj4gPiA+ID4gPiArICAgICAg
IHsiU1BNIiwgICAgICAgICAgeyAwLCAxLCAwIH0gfSwNCj4gPiA+ID4gPiArICAgICAgIHsiQ0NV
IiwgICAgICAgICAgeyAwLCAwLCAxIH0gfSwNCj4gPiA+ID4gPiArICAgICAgIHsiVEhFUk0iLCAg
ICAgICAgeyAwLCAxLCAxIH0gfSwNCj4gPiA+ID4gPiArICAgICAgIHsiU1BNX0RSQU1DIiwgICAg
eyAxLCAxLCAwIH0gfSwNCj4gPiA+ID4NCj4gPiA+ID4gVGhlIGJpdHMgeyAxLCAxLCAwIH0gZXF1
YWwgdG8gYSBudW1iZXIgMHgzLCBJIHRoaWluayB5b3Ugc2hvdWxkIHVzZSBhDQo+ID4gPiA+IG51
bWJlciBpbnN0ZWFkIG9mIGJpdHMgYW5kIGV2ZXJ5dGhpbmcgd291bGQgYmUgbW9yZSBlYXN5Lg0K
PiA+ID4NCj4gPiA+IFdlIHdvdWxkIGxpa2UgdG8ga2VlcCBpdCBiZWNhdXNlIHRoZSBiaXQgdmFs
dWUgY29udGFpbnMgbW9yZSB0aGFuIDAvMSwNCj4gPiA+IGl0IG1pZ2h0IGJlICcyJyBpbiBzb21l
IGNhc2VzLiAnMicgbWVhbnMgaXQgY2FuIGJlIDAgb3IgMS4gVGhpcyB0b3RhbGx5DQo+ID4gPiBi
eSBoYXJkd2FyZSBkZXNpZ24gJiBpbXBsZW1lbnRhdGlvbi4NCj4gPg0KPiA+IFVwc3RyZWFtIHRo
ZSBwYXRjaCB0aGF0IGhhcyBkb250LWNhcmUtYml0cywgb3RoZXJ3aXNlLCB1c2UgYSBudW1iZXIg
Zm9yIHRoaXMuDQo+ID4gRXZlbiB0aGVyZSBpcyBkb250LWNhcmUtYml0cywgSSBoYXZlIGEgYmV0
dGVyIHdheSB0byBwcm9jZXNzIGl0LiBIZXJlDQo+ID4gaXMgYW4gZXhhbXBsZSB0aGF0IGhhcyBk
b250LWNhcmUtYml0czoNCj4gPg0KPiA+ICsgeyJUaW55c3lzIiwgICAgICAgICB7IDAsIDEsIDAs
IDAsIDIsIDIsIDIsIDIsIDIsIDIsIDAsIDAsIDAsIDAgfSB9LA0KPiA+DQo+ID4gSSBjb3VsZCB1
c2UgYSB7IHZhbHVlLCBtYXNrIH0gcGFpciBmb3IgdGhpcyBjYXNlLA0KPiA+DQo+ID4gdmFsdWUg
PSAweDAwMDI7IC8qIHZhbHVlIGZvciBjYXJlIGJpdHMgKi8NCj4gPiBtYXNrID0gMHgzYzAyOyAv
KiBtYXNrIGZvciBjYXJlIGJpdHMgKi8NCj4gDQo+IFNvcnJ5LCB0aGlzIHdvdWxkIGJlDQo+IA0K
PiBtYXNrID0gMHgzYzBmOyAvKiBtYXNrIGZvciBjYXJlIGJpdHMgKi8NCj4gDQo+ID4NCj4gPiBT
byB0aGUgY29tcGFyZSBzdGF0ZW1lbnQgd291bGQgYmUNCj4gPg0KPiA+IGlmICgoYnVzX2lkICYg
bWFzaykgPT0gdmFsdWUpDQo+ID4NCj4gPiBTbyB5b3UgY291bGQgZ2V0IHJpZCBvZiB0aGUgc2Vj
b25kIGZvci1sb29wIGFuZCByZWR1Y2UgdGhlIHByb2Nlc3NpbmcNCj4gPiB0aW1lIGluIGlycSBo
YW5kbGVyLg0KPiA+DQoNCkdyZWF0IGlkZWEhIEknbGwgdHJ5IHRvIHJldmlzZSBhbmQgdXBzdHJl
YW0gYWdhaW4uDQoNCj4gPiBSZWdhcmRzLA0KPiA+IENodW4tS3VhbmcuDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
