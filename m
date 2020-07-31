Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65993C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 02:55:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36913208A9
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 02:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxo02b8O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gjrABBGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36913208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nbkpLonInMfeKyMPWi+Yc/u4MNb8XrBGJ0RcVM5YFGM=; b=hxo02b8OkGpwQXu5VJzgja4x7
	W+6Dd3eKXBsHWbk8TMq9b+BIc6viJDGqJFOV0ASIb1b0fy9/BvnL1shEULwz0NXtCxy8j7kpYGX6R
	w+APLjcf4ojgJw3LE9pkx/cT2HQ6jVtTZN1ZhRbpjrYSY5/PxZTdUuOrOrn8XOd4xmPMpiixQL8/q
	ltGVnI9HXTyoZS+6hx+GCab6EmLDo1uUHVPtv1ya+4o1W0SlF0DH1phLk9gCN5/lG4bTO8MFmjh1E
	DbgxUklx8alR+P3DJ3yje8UdCKR7SiQCQ1Kp885oj/DaHRkOyYsOWN1x59RAo+x+Y0/vYxUuizd+u
	j2BURRFUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1LCG-0002pH-8i; Fri, 31 Jul 2020 02:55:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1LC6-0002ms-Oz; Fri, 31 Jul 2020 02:54:51 +0000
X-UUID: 95d7c46542e745c797e626d2e7ee38be-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=R6XwgENF28giULJ+WiMu7t9JVC3/RZPKc1L5No0Vh00=; 
 b=gjrABBGtZwHUQ6B4FUVUJXo0hbWiBe7eVNEA3/Vvrbt4hS1T0AhTD12aYx1ojS2sWsSgDXcH5WLq/I9lZeJABgzX0OfPlxXO7RpDHErdzHzvTkdLWQwe42gAgPL42iLkY2ydFwBMzjyDhB8KNnyXdNASszUELQPQOANHdj4ipO4=;
X-UUID: 95d7c46542e745c797e626d2e7ee38be-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1514175963; Thu, 30 Jul 2020 18:54:51 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 19:45:13 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 31 Jul 2020 10:45:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 10:45:09 +0800
Message-ID: <1596163482.17576.25.camel@mhfsdcap03>
Subject: Re: [SPAM]Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 31 Jul 2020 10:44:42 +0800
In-Reply-To: <20200730163930.GI13316@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200701091618.GN16711@paasikivi.fi.intel.com>
 <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
 <20200701134416.GQ16711@paasikivi.fi.intel.com>
 <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
 <20200702053449.GR16711@paasikivi.fi.intel.com>
 <1593687965.17166.73.camel@mhfsdcap03>
 <20200730163930.GI13316@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5CF9056F1596FC8F70A57378F6BA462C401C6C03E9FEC17892BC6FBD13F952D02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_225450_952364_A9A6B45A 
X-CRM114-Status: GOOD (  36.17  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Louis
 Kuo =?UTF-8?Q?=28=E9=83=AD=E5=BE=B7=E5=AF=A7=29?= <louis.kuo@mediatek.com>,
 "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= <erin.lo@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgU2FrYXJpLA0KDQpPbiBUaHUsIDIwMjAtMDctMzAgYXQgMTk6MzkgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gRG9uZ2NodW4sDQo+IA0KPiBPbiBUaHUsIEp1bCAwMiwgMjAyMCBhdCAw
NzowNjowNVBNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gSGkgU2FrYXJpLA0KPiA+
IA0KPiA+IFNvcnJ5IEkganVzdCBzZW50IGVtYWlsIHVzaW5nIG91dGxvb2sgd2hlcmUgZGVmYXVs
dCBmb3JtYXQgaXMgSFRNTCwgbm93DQo+ID4gSSB1c2UgZXZvbHV0aW9uLCBvbmUgTGludXggbWFp
bCBjbGllbnQgdGhhdCBJIHVzZWQgdG8gc2VuZCB1cHN0cmVhbQ0KPiA+IHBhdGNoIHByZXZpb3Vz
bHkuDQo+ID4gDQo+ID4gT24gVGh1LCAyMDIwLTA3LTAyIGF0IDA4OjM0ICswMzAwLCBTYWthcmkg
QWlsdXMgd3JvdGU6DQo+ID4gPiBEb25nY2h1biwNCj4gPiA+IA0KPiA+ID4gUGxlYXNlIGRvbid0
IHNlbmQgSFRNTCBlLW1haWwgdG8gTGludXgga2VybmVsIHJlbGF0ZWQgbWFpbGluZyBsaXN0cy4N
Cj4gPiA+IA0KPiA+ID4gT24gVGh1LCBKdWwgMDIsIDIwMjAgYXQgMDM6NDg6NTZBTSArMDAwMCwg
RG9uZ2NodW4gWmh1ICjmnLHkuJzmmKUpIHdyb3RlOg0KPiA+ID4gPiAgSGkgU2FrYXJpLA0KPiA+
ID4gPiANCj4gPiA+ID4gIFNvcnJ5IHRvIGJvdGhlciB5b3UgYWdhaW4sIGJ1dCBJIGFtIHNvIGNv
bmZ1c2VkIGFib3V0IHRoZSBxdWVzdGlvbnMgeW91IHJhaXNlZC4NCj4gPiA+ID4gIEkganVzdCBz
eW5jZWQgbWFpbmxpbmU6IDUuOC1yYzMgdGFyYmFsbCBmcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvLCBvbiB3aGljaCBJIHJhbiB0aGUgZ2l0IGFtIDxwYXRjaD4gY29tbWFuZC4NCj4gPiA+ID4g
IFRoZSBwYXRjaC1hcHBseWluZyBwcm9jZXNzIHNob3dzIG5vIGVycm9yLg0KPiA+ID4gPiAgLS0t
LS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ID4gIFttdGsxNTAxM0Bt
dGtzbHQzMDcgbGludXhdJGdpdCBhcHBseSAtLWNoZWNrIG1lZGlhLWkyYy1BZGQtc3VwcG9ydC1m
b3ItRFc5NzY4LVZDTS5wYXRjaA0KPiA+ID4gPiAgW210azE1MDEzQG10a3NsdDMwNyBsaW51eF0k
Z2l0IGFtIG1lZGlhLWkyYy1BZGQtc3VwcG9ydC1mb3ItRFc5NzY4LVZDTS5wYXRjaA0KPiA+ID4g
PiAgQXBwbHlpbmc6IG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IGkyYzogRG9jdW1lbnQgRFc5
NzY4IGJpbmRpbmdzDQo+ID4gPiA+ICBBcHBseWluZzogbWVkaWE6IGkyYzogZHc5NzY4OiBBZGQg
RFc5NzY4IFZDTSBkcml2ZXINCj4gPiA+ID4gIC0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ID4gPiA+IA0KPiA+ID4gPiAgT24gdGhlIG90aGVyIGhhbmQsIEkgYWxzbyBj
b21wYXJlZCBkb25nd29vbixkdzk3NjgueWFtbCBmaWxlIHdpdGggb3RoZXIgbWVkaWEgZGV2aWNl
IGR0LWJpbmRpbmdzKGxpa2UgaW14MjE5LnlhbWwgYW5kIG92ODg1Ni55YW1sKS4NCj4gPiA+ID4g
IEl0IHNlZW1zIHRoZXJlIGFyZSBubyBhcHBhcmVudCBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZW0u
DQo+ID4gPiA+ICBFc3BlY2lhbGx5LCB0aGUgc2VudGVuY2UgJyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSknIHNoYWxsIGJlIGNvbW1vbi4NCj4gPiA+
ID4gIEkgZHVubm8gd2h5IGhlcmUgZG9uZ3dvb24sZHc5NzY4LnlhbWwgcmVwb3J0cyB0cmFpbGlu
ZyB3aGl0ZXNwYWNlIHdhcm5pbmdzIHdoaWxlIG92ODg1Ni55YW1sIGlzIHNpbGVudC4NCj4gPiA+
ID4gDQo+ID4gPiA+ICBGb3IgdGhlIHBhdGNoIGZhaWxlZCBvbiBNQUlOVEFJTkVSUywgSSBhbSBz
dGlsbCBjdXJpb3VzIHdoYXQncyB3cm9uZy4NCj4gPiA+ID4gIEluIGZhY3QsIEkgbG9jYWxseSBo
YXZlIHJ1biBwYXJzZS1tYWludGFpbmVycy5wbCBzY3JpcHQgdG8gY2hlY2sgTUFJTlRBSU5FUlMg
ZmlsZSBiZWZvcmUgc3VibWl0dGluZyBwYXRjaC4NCj4gPiA+ID4gIFRoZSByZXN1bHQgYWxzbyBy
ZXBvcnRzIG5vIGVycm9ycy4NCj4gPiA+ID4gIC0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ID4gPiA+ICBbbXRrMTUwMTNAbXRrc2x0MzA3IGxpbnV4XSRwZXJsIHNjcmlw
dHMvcGFyc2UtbWFpbnRhaW5lcnMucGwNCj4gPiA+ID4gIFttdGsxNTAxM0BtdGtzbHQzMDcgbGlu
dXhdJGxzDQo+ID4gPiA+ICAtLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ID4gPiANCj4gPiA+ID4gIEFzIHRvIEJhc2U2NCBlbmNvZGluZywgSSBjaGVja2VkIGVhY2gg
cGF0Y2ggZmlsZSBhZ2Fpbi4gVGhleSBhcmUgYWxsIGVuY29kZWQgaW4gVVRGLTguDQo+ID4gPiA+
ICBBcyBodHRwczovL3d3dy5iYXNlNjRlbmNvZGUub3JnLyBzYXlzLCBmb3IgYW4gZXhhbXBsZSwg
Jzc3JyBpbiBBU0NJSSBmb3JtYXQgd291bGQgYmUgY2hhbmdlZCB0byAnVCcgaW4gQmFzZWQ2NC1l
bmNvZGVkIGZvcm1hdC4NCj4gPiA+ID4gIFRoaXMgbWVhbnMgdGhlcmUgc2hhbGwgYmUgbWVzc3kg
Y29kZSBpZiB3ZSBhZHBvdGluZyBCYXNlZDY0LWVuY29kZWQgZm9ybWF0Lg0KPiA+ID4gPiAgQnV0
IEkgY2Fubm90IHNlZSBnYXJibGVkIG1lc3NhZ2VzIGluIHRoZSBjdXJyZW50IHBhdGNoZXMuDQo+
ID4gPiA+IA0KPiA+ID4gPiAgVGhlIERXOTc2OCBzZXJpYWxzLXBhdGNoIGlzIGF0dGFjaGVkLg0K
PiA+ID4gPiAgQFRvbWFzeiBAQW5keSBAUm9iIGNvdWxkIGFueW9uZSBoZWxwIHRyeSB0byBzZWUg
d2hldGhlciB0aGUgcGF0Y2ggY2FuIGJlIGNoZXJyeS1waWNrZWQgb24gTGludXggbWFzdGVyIGJy
YW5jaCBvciBub3Q/DQo+ID4gPiA+ICBQYXRjaHdvcmsgbGluazoNCj4gPiA+ID4gIGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTE2MzMyOTEvDQo+ID4gPiANCj4gPiA+IEJvdGgg
b2YgdGhlIHBhdGNoZXMgYXBwZWFyIHRvIGNvbnRhaW4gb25seSBBU0NJSSBjaGFyYWN0ZXJzLg0K
PiA+ID4gDQo+ID4gPiBJIGRpZCBzb21lIHJlc2VhcmNoIG9uIHRoaXMuIEl0IHNlZW1zIHRoYXQg
dGhlIGJhc2U2NCBlbmNvZGVkIG1lc3NhZ2UgYm9keQ0KPiA+ID4gZG9lcyBoYXZlIGNhcnJpYWdl
IHJldHVybnMsIGluIGJvdGggY2FzZXMuIEdpdCBhbSBkb2VzIG5vdCBhdHRlbXB0IHRvDQo+ID4g
PiByZW1vdmUgdGhlbSBpbiB0aGF0IGNhc2UsIGJ1dCBQYXRjaHdvcmsgZG9lcy4gSGVuY2UgdGhl
IGZpbGVzIGFyZSBmaW5lIGlmDQo+ID4gPiB5b3UgZG93bmxvYWQgdGhlbSBmcm9tIFBhdGNod29y
ayAtLS0gd2hlcmUgdGhlIG1ib3ggZmlsZXMgaGF2ZSBuZWl0aGVyDQo+ID4gPiBjYXJyaWFnZSBy
ZXR1cm5zIG5vciBiYXNlNjQgZW5jb2RpbmcuDQo+ID4gPiANCj4gPiA+IFdoYXQgZG9lcyB0aGUg
ZmlsZSBjb21tYW5kIHNheSBhYm91dCB0aGUgcGF0Y2ggZmlsZXMgcHJvZHVjZWQgYnkgZ2l0DQo+
ID4gPiBmb3JtYXQtcGF0Y2g/IE15IGd1ZXNzIGlzIHRoYXQgc29tZXRoaW5nIGluIGJldHdlZW4g
eW91ciBsb2NhbCBjb21wdXRlciBhbmQNCj4gPiA+IExNTUwgKGFuZCBvdGhlciBtYWlsIHNlcnZl
cnMpIGJhc2U2NCBlbmNvZGVzIHRoZSBtZXNzYWdlIGJvZHkuIEJ1dCB3aGVyZQ0KPiA+ID4gYXJl
IHRoZSBjYXJyaWFnZSByZXR1cm5zIGFkZGVkPyBOZXZlcnRoZWxlc3MgdGhleSBzZWVtIHRvIGJl
IGFkZGVkIGJlZm9yZQ0KPiA+ID4gdGhlIGJhc2U2NCBjb252ZXJzaW9uLg0KPiA+ID4gDQo+ID4g
DQo+ID4gSG0uLi4gSSB1c2VkIHRoZSBmaWxlIGNvbW1hbmQgdG8gY2hlY2sgdGhlIGRpZmYgcGF0
Y2ggZ2VuZXJhdGVkIGZyb20gZ2l0DQo+ID4gZm9ybWF0LXBhdGNoIGFuZCB0aGF0IGRvd25sb2Fk
ZWQgZnJvbSBQYXRjaHdvcmssIHRoZXkgYXJlIGJvdGggQVNDSUkNCj4gPiB0ZXh0Lg0KPiANCj4g
VGhhdCdzIGJlY2F1c2UgUGF0Y2h3b3JrIGFwcGVhcnMgdG8gYmUgcmVtb3ZpbmcgdGhlIGNhcnJp
YWdlIHJldHVybnMuIGdpdA0KPiBkb2VzIG5vdCBpZiB0aGUgY29udGVudCBpcyBiYXNlNjQgZW5j
b2RlZC4NCj4gDQo+IFlvdXIgZS1tYWlsIHNldHVwIHNpbXBseSBhcHBlYXJzIHRvIGJlIGJyb2tl
bi4gSSdkIHN1Z2dlc3QgdHJ5aW5nIHRvIHNlbmQNCj4gdGhlIHBhdGNoZXMgZW5jb2RlZCBpbiBi
YXNlNjQgYXMgYSB3b3JrYXJvdW5kLiBnaXQgc2VuZC1lbWFpbCB1c2VzDQo+IHNlbmRlbWFpbC50
cmFuc2ZlckVuY29kaW5nIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGZvciB0aGlzLg0KPiANCg0KSSBj
aGVja2VkIG15IGxvY2FsIGdpdCBjb25maWd1cmF0aW9uIGJ5IHVzaW5nICJnaXQgY29uZmlnIC0t
bGlzdCIsIGl0DQpzZWVtcyB0aGUgInNlbmRlbWFpbC50cmFuc2ZlckVuY29kaW5nIiBjb25maWd1
cmF0aW9uIHZhcmlhYmxlIGlzIG5vdA0Kc2V0LCBhbHNvICJnaXQgc2VuZC1lbWFpbCAtLXRyYW5z
ZmVyLWVuY29kaW5nIiBpcyBub3Qgc2V0IHdoZW4NCnN1Ym1pdHRpbmcgcGF0Y2guDQoNCkZyb20g
bXkgdW5kZXJzdGFuZGluZywgaWYgYm90aCB0aGUgb3B0aW9uICItLXRyYW5zZmVyLWVuY29kaW5n
PXh4eCIgYW5kDQp0aGUgY29uZmlndXJhdGlvbiB2YWx1ZSAic2VuZGVtYWlsLnRyYW5zZmVyRW5j
b2RpbmciIGFyZSB1bnNwZWNpZmllZCwNCnRoZSB0cmFuc2ZlciBlbmNvZGluZyB0byBiZSB1c2Vk
IHRvIHNlbmQgdGhlIG1lc3NhZ2Ugb3ZlciBTTVRQIG1heSBiZQ0KImF1dG8iLg0KDQpEaWQgeW91
IG1lYW4gZG9pbmcgYW4gZXhwZXJpbWVudCBieSBlbmFibGluZyAiYmFzZTY0IiBjb25maWcgZm9y
DQp0cmFuc2ZlciBlbmNvZGluZyBhcyBiZWxvdz8NCiJnaXQgY29uZmlnIC0tZ2xvYmFsIHNlbmRl
bWFpbC50cmFuc2ZlckVuY29kaW5nIGJhc2U2NCIgb3INCiJnaXQgc2VuZC1lbWFpbCAtLXRyYW5z
ZmVyLWVuY29kaW5nPWJhc2U2NCINCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
