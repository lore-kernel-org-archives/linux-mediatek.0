Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2737CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 06:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB692065F
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 06:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ReYU2tGL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFB692065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sGRFNzUg5C6bbWbFYFeK4TdxUsMm+ncBdJu34D/zRc=; b=ReYU2tGLsk1hHw
	La0HQU9xu/KPIMZHKlLnhZOw/u9FDYxp/2iaUaZtNhBmJddwbq4OLapS7wt/L8mw3WndWCSkT6vlm
	Yku/Rp1iagJcttmqn1+1s77NFvLe6JeLEeWkQoY0eV5ITtKxEmdjFSQICPvhPuZBARAo38Ln5mdOo
	+HqrZBjr+rK8lalWVLO08HIREJvRMTrBuudEG/d8WYupt+GiX0KTZJntjsOfuYsgCREOT6G4s7lD1
	VUQaZMngeiYLnBzRzhkA4s8uBWwsvJ/E47qI0+xdwdD+/S0ctVNerFbRVhRT8Ytl/J4+NfaR17zxl
	NH8G3kckrftCMm/TEOaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbIdy-0002no-Ko; Wed, 20 May 2020 06:55:58 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbIdl-0002d2-W2; Wed, 20 May 2020 06:55:48 +0000
Received: from dggemi403-hub.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 95C145F520C0C3C105A5;
 Wed, 20 May 2020 14:55:28 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.191]) by
 dggemi403-hub.china.huawei.com ([10.3.17.136]) with mapi id 14.03.0487.000;
 Wed, 20 May 2020 14:55:23 +0800
From: Song Bao Hua <song.bao.hua@hisilicon.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Lecopzer Chen <lecopzer@gmail.com>
Subject: RE: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
Thread-Topic: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
Thread-Index: AQHWK4CVzuSk3r9OTUuU9MOLmvQA7qis0jIAgAALFQCAAEh6AIAACRWAgANe+vA=
Date: Wed, 20 May 2020 06:55:22 +0000
Message-ID: <B926444035E5E2439431908E3842AFD24B1D3C@DGGEMI525-MBS.china.huawei.com>
References: <20200516124857.75004-1-lecopzer@gmail.com>
 <CAFA6WYNwp+_ENiS8QDao5+RXyt5ofJZyq6c5CKG_d0CNEmBNYg@mail.gmail.com>
 <CANr2M19unLW8n0P2DiOYEZ=GZcaD-L2ygPht_5HNtNZ6e4h6xQ@mail.gmail.com>
 <20200518104524.GA1224@C02TD0UTHF1T.local>
 <a9002b5e-aec5-b6e0-7174-87b93351d60c@arm.com>
In-Reply-To: <a9002b5e-aec5-b6e0-7174-87b93351d60c@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.16]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_235546_422854_839EA6E3 
X-CRM114-Status: GOOD (  27.45  )
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
Cc: Sumit Garg <sumit.garg@linaro.org>, "jolsa@redhat.com" <jolsa@redhat.com>,
 Jian-Lin Chen <lecopzer.chen@mediatek.com>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "yj.chiang@mediatek.com" <yj.chiang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "acme@kernel.org" <acme@kernel.org>, Linuxarm <linuxarm@huawei.com>, Peter
 Zijlstra <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "julien.thierry.kdev@gmail.com" <julien.thierry.kdev@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "namhyung@kernel.org" <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiANCj4gT24gNS8xOC8yMCAxMTo0NSBBTSwgTWFyayBSdXRsYW5kIHdyb3RlOg0KPiA+IEhpIGFs
bCwNCj4gPg0KPiA+IE9uIE1vbiwgTWF5IDE4LCAyMDIwIGF0IDAyOjI2OjAwUE0gKzA4MDAsIExl
Y29wemVyIENoZW4gd3JvdGU6DQo+ID4+IEhJIFN1bWl0LA0KPiA+Pg0KPiA+PiBUaGFua3MgZm9y
IHlvdXIgaW5mb3JtYXRpb24uDQo+ID4+DQo+ID4+IEkndmUgYWxyZWFkeSBpbXBsZW1lbnRlZCBJ
UEkgKHNhbWUgYXMgeW91IGRpZCBbMV0sIGxpdHRsZSBkaWZmZXJlbmNlDQo+ID4+IGluIGRldGFp
bCksIGhhcmRsb2NrdXAgZGV0ZWN0b3IgYW5kIHBlcmYgaW4gbGFzdCB5ZWFyKDIwMTkpIGZvcg0K
PiA+PiBkZWJ1Z2dhYmlsaXR5Lg0KPiA+PiBBbmQgbm93IHdlIHRlbmQgdG8gdXBzdHJlYW0gdG8g
cmVkdWNlIGtlcm5lbCBtYWludGFpbmluZyBlZmZvcnQuDQo+ID4+IEknbSBnbGFkIGlmIHNvbWVv
bmUgaW4gQVJNIGNhbiBkbyB0aGlzIHdvcmsgOikNCj4gPj4NCj4gPj4gSGkgSnVsaWVuLA0KPiA+
Pg0KPiA+PiBEb2VzIGFueSBBcm0gbWFpbnRhaW5lcnMgY2FuIHByb2NlZWQgdGhpcyBhY3Rpb24/
DQo+ID4gQWxleGFuZHJ1IChDYydkKSBoYXMgYmVlbiByZWJhc2luZyBhbmQgcmV3b3JraW5nIEp1
bGllbidzIHBhdGNoZXMsDQo+ID4gd2hpY2ggaXMgbXkgcHJlZmVycmVkIGFwcHJvYWNoLg0KPiA+
DQo+ID4gSSB1bmRlcnN0YW5kIHRoYXQncyBub3QgcXVpdGUgcmVhZHkgZm9yIHBvc3Rpbmcgc2lu
Y2UgaGUncw0KPiA+IGludmVzdGlnYXRpbmcgc29tZSBvZiB0aGUgbmFzdGllciBzdWJ0bGV0aWVz
IChlLmcuIG11dHVhbCBleGNsdXNpb24NCj4gPiB3aXRoIHRoZSBOTUkpLCBidXQgbWF5YmUgd2Ug
Y2FuIHB1dCB0aGUgd29yay1pbi1wcm9ncmVzcyBwYXRjaGVzDQo+ID4gc29tZXdoZXJlIGluIHRo
ZSBtZWFuIHRpbWUuDQo+ID4NCj4gPiBBbGV4YW5kcnUsIGRvIHlvdSBoYXZlIGFuIGlkZWEgb2Yg
d2hhdCBuZWVkcyB0byBiZSBkb25lLCBhbmQvb3Igd2hlbg0KPiA+IHlvdSBleHBlY3QgeW91IGNv
dWxkIHBvc3QgdGhhdD8NCj4gDQo+IEknbSBjdXJyZW50bHkgd29ya2luZyBvbiByZWJhc2luZyB0
aGUgcGF0Y2hlcyBvbiB0b3Agb2YgNS43LXJjNSwgd2hlbiBJIGhhdmUNCj4gc29tZXRoaW5nIHVz
YWJsZSBJJ2xsIHBvc3QgYSBsaW5rIChzaG91bGQgYmUgYSBjb3VwbGUgb2YgZGF5cykuIEFmdGVy
IHRoYXQgSSB3aWxsDQo+IGFkZHJlc3MgdGhlIHJldmlldyBjb21tZW50cywgYW5kIEkgcGxhbiB0
byBkbyBhIHRob3JvdWdoIHRlc3RpbmcgYmVjYXVzZSBJJ20NCj4gbm90IDEwMCUgY29uZmlkZW50
IHRoYXQgc29tZSBvZiB0aGUgYXNzdW1wdGlvbnMgYXJvdW5kIHRoZSBsb2NrcyB0aGF0IHdlcmUN
Cj4gcmVtb3ZlZCBhcmUgY29ycmVjdC4gTXkgZ3Vlc3MgaXMgdGhpcyB3aWxsIHRha2UgYSBmZXcg
d2Vla3MuDQoNCisxDQpJIHdvdWxkIGJlIGF3ZXNvbWUgaWYgcGVyZiBOTUkgcGF0Y2hlcyBjb3Vs
ZCBiZSByZS1hY3RpdmF0ZWQuIFJpZ2h0IG5vdywgaXQgc2VlbXMgaXQgaXMgaGFyZCB0bw0KZG8g
InBlcmYgYW5ub3RhdGUiIG9uIGEga2VybmVsIGZ1bmN0aW9uIHdpdGggbG9jYWxfaXJxIGRpc2Fi
bGVkLg0KDQpmdW5jKCkNCnsNCmxvY2FsX2lycV9zYXZlKCk7DQouLi4uLg0KLi4uLg0KbG9jYWxf
aXJxX3Jlc3RvcmUoKTsNCnJldHVybjsNCn0NCg0KUGVyZiB3aWxsIHJlcG9ydCBhbGwgY3ljbGVz
IGFyZSB1c2VkIGJ5IHRoZSBsYXN0IG1vbWVudCBvZiB0aGUgZnVuYygpLg0KDQpUaGFua3MsDQpC
YXJyeQ0KDQo+IA0KPiBUaGFua3MsDQo+IEFsZXgNCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBNYXJr
Lg0KPiA+DQo+ID4+IFRoaXMgaXMgcmVhbGx5IHVzZWZ1bCBpbiBkZWJ1Z2dpbmcuDQo+ID4+IFRo
YW5rIHlvdSEhDQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IFsxXSBodHRwczovL2xrbWwub3JnL2xr
bWwvMjAyMC80LzI0LzMyOA0KPiA+Pg0KPiA+Pg0KPiA+PiBMZWNvcHplcg0KPiA+Pg0KPiA+PiBT
dW1pdCBHYXJnIDxzdW1pdC5nYXJnQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0NeaciDE45pelIOmA
seS4gCDkuIvljYgNCj4gMTo0NuWvq+mBk++8mg0KPiA+Pj4gKyBKdWxpZW4NCj4gPj4+DQo+ID4+
PiBIaSBMZWNvcHplciwNCj4gPj4+DQo+ID4+PiBPbiBTYXQsIDE2IE1heSAyMDIwIGF0IDE4OjIw
LCBMZWNvcHplciBDaGVuIDxsZWNvcHplckBnbWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+Pj4+IFRo
ZXNlIHNlcmllcyBpbXBsZW1lbnQgUGVyZiBOTUkgZnVueHRpb25hbGl0eSBhbmQgZGVwZW5kcyBv
biBQc2V1ZG8NCj4gPj4+PiBOTUkgWzFdIHdoaWNoIGhhcyBiZWVuIHVwc3RyZWFtZWQuDQo+ID4+
Pj4NCj4gPj4+PiBJbiBhcm02NCB3aXRoIEdJQ3YzLCBQc2V1ZG8gTk1JIHdhcyBpbXBsZW1lbnRl
ZCBmb3IgTk1JLWxpa2UNCj4gaW50ZXJydXRzLg0KPiA+Pj4+IFRoYXQgY2FuIGJlIGV4dGVuZGVk
IHRvIFBlcmYgTk1JIHdoaWNoIGlzIHRoZSBwcmVyZXF1aXNpdGUgZm9yDQo+ID4+Pj4gaGFyZC1s
b2NrdXAgZGV0ZWN0b3Igd2hpY2ggaGFkIGFscmVhZHkgYSBzdGFuZGFyZCBpbnRlcmZhY2UgaW5z
aWRlIExpbnV4Lg0KPiA+Pj4+DQo+ID4+Pj4gVGh1cyB0aGUgZmlyc3Qgc3RlcCB3ZSBuZWVkIHRv
IGltcGxlbWVudCBwZXJmIE5NSSBpbnRlcmZhY2UgYW5kDQo+ID4+Pj4gbWFrZSBzdXJlIGl0IHdv
cmtzIGZpbmUuDQo+ID4+Pj4NCj4gPj4+IFRoaXMgaXMgc29tZXRoaW5nIHRoYXQgaXMgYWxyZWFk
eSBpbXBsZW1lbnRlZCB2aWEgSnVsaWVuJ3MgcGF0Y2gtc2V0DQo+ID4+PiBbMV0uIEl0cyB2NCBo
YXMgYmVlbiBmbG9hdGluZyBzaW5jZSBKdWx5LCAyMDE5IGFuZCBJIGNvdWxkbid0IGZpbmQNCj4g
Pj4+IGFueSBtYWpvciBibG9ja2luZyBjb21tZW50cyBidXQgbm90IHN1cmUgd2h5IHRoaW5ncyBo
YXZlbid0DQo+ID4+PiBwcm9ncmVzc2VkIGZ1cnRoZXIuDQo+ID4+Pg0KPiA+Pj4gTWF5YmUgSnVs
aWVuIG9yIEFybSBtYWludGFpbmVycyBjYW4gcHJvdmlkZSB1cGRhdGVzIG9uIGV4aXN0aW5nDQo+
ID4+PiBwYXRjaC1zZXQgWzFdIGFuZCBob3cgd2Ugc2hvdWxkIHByb2NlZWQgZnVydGhlciB3aXRo
IHRoaXMNCj4gPj4+IGludGVyZXN0aW5nIGZlYXR1cmUuDQo+ID4+Pg0KPiA+Pj4gQW5kIHJlZ2Fy
ZGluZyBoYXJkLWxvY2t1cCBkZXRlY3Rpb24sIEkgaGF2ZSBiZWVuIGFibGUgdG8gZW5hYmxlIGl0
DQo+ID4+PiBiYXNlZCBvbiBwZXJmIE5NSSBldmVudHMgdXNpbmcgSnVsaWVuJ3MgcGVyZiBwYXRj
aC1zZXQgWzFdLiBIYXZlIGENCj4gPj4+IGxvb2sgYXQgdGhlIHBhdGNoIGhlcmUgWzJdLg0KPiA+
Pj4NCj4gPj4+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExMDQ3NDA3
Lw0KPiA+Pj4gWzJdDQo+ID4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwv
bGludXgtYXJtLWtlcm5lbC8yMDIwLU1heS83MzIyMg0KPiA+Pj4gNy5odG1sDQo+ID4+Pg0KPiA+
Pj4gLVN1bWl0DQo+ID4+Pg0KPiA+Pj4+IFBlcmYgTk1JIGhhcyBiZWVuIHRlc3QgYnkgZGQgaWY9
L2Rldi91cmFuZG9tIG9mPS9kZXYvbnVsbCBsaWtlIHRoZQ0KPiA+Pj4+IGxpbmsgWzJdIGRpZC4N
Cj4gPj4+Pg0KPiA+Pj4+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xLzMxLzUzNQ0K
PiA+Pj4+IFsyXSBodHRwczovL3d3dy5saW5hcm8ub3JnL2Jsb2cvZGVidWdnaW5nLWFybS1rZXJu
ZWxzLXVzaW5nLW5taWZpcQ0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBMZWNvcHplciBDaGVuICgz
KToNCj4gPj4+PiAgIGFybV9wbXU6IEFkZCBzdXBwb3J0IGZvciBwZXJmIE5NSSBpbnRlcnJ1cHRz
IHJlZ2lzdHJhdGlvbg0KPiA+Pj4+ICAgYXJtNjQ6IHBlcmY6IFN1cHBvcnQgTk1JIGNvbnRleHQg
Zm9yIHBlcmYgZXZlbnQgSVNSDQo+ID4+Pj4gICBhcm02NDogS2NvbmZpZzogQWRkIHN1cHBvcnQg
Zm9yIHRoZSBQZXJmIE5NSQ0KPiA+Pj4+DQo+ID4+Pj4gIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAg
ICAgICAgICB8IDEwICsrKysrKysNCj4gPj4+PiAgYXJjaC9hcm02NC9rZXJuZWwvcGVyZl9ldmVu
dC5jIHwgMzYgKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ID4+Pj4gIGRyaXZlcnMvcGVyZi9h
cm1fcG11LmMgICAgICAgICB8IDUxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0NCj4gPj4+PiAgaW5jbHVkZS9saW51eC9wZXJmL2FybV9wbXUuaCAgIHwgIDYgKysrKw0KPiA+
Pj4+ICA0IGZpbGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0K
PiA+Pj4+DQo+ID4+Pj4gLS0NCj4gPj4+PiAyLjI1LjENCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
