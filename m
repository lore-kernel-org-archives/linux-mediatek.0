Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76249C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 16:07:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3DF821D1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 16:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ci9okRRT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="okCl/Bpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3DF821D1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t+OH6D6k6ZcwCZ9PpFyxQ1CXlC+7KTUWXSux51yDZv8=; b=ci9okRRTbIPHgHU1YFi7wAou3
	Kf9lnv3LdVmtJi33sTXrX4/XHQwshnYlcJk569id4b72U2WiRyTBndL2OFPgusWvV1HgxB+rCWN/h
	0bFE1FbGlSYmkkRDguJ08x4vYuk8f9bwVMCHMAUjeArwdwzmZDSZLmt815AVQ4LMBHbRatv+FGAZv
	qyVbzAcUXh/C9vBHuuOEfMaEa4wbqBewbxTLfuoYtTWANKc8LZmnr+DdjFilBS15Vq4JwdLfGP1Xh
	u/xUmAYlEyAR2mDmuGr0aE7XDk4H9FmVgENYj+ua1frt4t4YylS9MSvtn1GEdSI2EK7lx/bg9DzLP
	FHhacdBRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIDTv-0003Tx-L1; Tue, 15 Sep 2020 16:07:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDTr-0003QZ-Ke; Tue, 15 Sep 2020 16:06:57 +0000
X-UUID: e00aac46bf59470da6920be1d383f77d-20200915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dyxC8WhaSmjgvfJJHFnp0NhjfIxeFwAQsy17LIoKHDE=; 
 b=okCl/BpoI4zaLm7y2txl5nZL/FPxPNeyYeq9pieiCYrQr5+blJiVqqVGlN57GHPR2kIF5T0C6o+uG7H2zXjq6alu5lN6oe4nvJjAdp6WQ0fXAJte/sXK9G1xv1L+M/yY64gdRPodcXv1t/RRFi997Bo/1Y9tQWZS9LTZb0SxROo=;
X-UUID: e00aac46bf59470da6920be1d383f77d-20200915
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 928730112; Tue, 15 Sep 2020 08:06:45 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 09:06:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Sep 2020 00:06:39 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Sep 2020 00:06:39 +0800
Message-ID: <1600186001.25944.3.camel@mtksdccf07>
Subject: Re: [PATCH v3 0/6] kasan: add workqueue and timer stack for generic
 KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Konovalov <andreyknvl@google.com>, Dmitry Vyukov
 <dvyukov@google.com>
Date: Wed, 16 Sep 2020 00:06:41 +0800
In-Reply-To: <CAAeHK+xONO0NDWvernDXH72E+oyMtJr8JpWfok9wGRDVZ518iQ@mail.gmail.com>
References: <20200825015654.27781-1-walter-zh.wu@mediatek.com>
 <CANpmjNOvj+=v7VDVDXpsUNZ9o0+KoJVJs0MjLhwr0XpYcYQZ5g@mail.gmail.com>
 <CAAeHK+yVShDPCxVKDsO_5SwoM2ZG7x7byUJ74PtB7ekY61L2YQ@mail.gmail.com>
 <CACT4Y+b1OimWNQCx-rGvSgC1RheLAv9mv2xzRnwkn98AsdTgXA@mail.gmail.com>
 <CAAeHK+xONO0NDWvernDXH72E+oyMtJr8JpWfok9wGRDVZ518iQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AA21E673224F89C2DF2907E0064F3C128B0F5B7C7AFF54C00B058CC4AFE9D2992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_120656_723654_848C74A8 
X-CRM114-Status: GOOD (  22.77  )
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
Cc: Marco Elver <elver@google.com>, John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Tejun Heo <tj@kernel.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTA5LTE0IGF0IDE0OjI1ICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3Rl
Og0KPiBPbiBTdW4sIFNlcCAxMywgMjAyMCBhdCAxMjoxNyBQTSBEbWl0cnkgVnl1a292IDxkdnl1
a292QGdvb2dsZS5jb20+DQo+IHdyb3RlOg0KPiANCj4gICAgICAgICBPbiBXZWQsIEF1ZyAyNiwg
MjAyMCBhdCAyOjMwIFBNICdBbmRyZXkgS29ub3ZhbG92JyB2aWENCj4gICAgICAgICBrYXNhbi1k
ZXYNCj4gICAgICAgICA8a2FzYW4tZGV2QGdvb2dsZWdyb3Vwcy5jb20+IHdyb3RlOg0KPiAgICAg
ICAgID4NCj4gICAgICAgICA+IE9uIFR1ZSwgQXVnIDI1LCAyMDIwIGF0IDEwOjI2IEFNICdNYXJj
byBFbHZlcicgdmlhIGthc2FuLWRldg0KPiAgICAgICAgID4gPGthc2FuLWRldkBnb29nbGVncm91
cHMuY29tPiB3cm90ZToNCj4gICAgICAgICA+ID4NCj4gICAgICAgICA+ID4gT24gVHVlLCAyNSBB
dWcgMjAyMCBhdCAwMzo1NywgV2FsdGVyIFd1DQo+ICAgICAgICAgPHdhbHRlci16aC53dUBtZWRp
YXRlay5jb20+IHdyb3RlOg0KPiAgICAgICAgID4gPiA+DQo+ICAgICAgICAgPiA+ID4gU3l6Ym90
IHJlcG9ydHMgbWFueSBVQUYgaXNzdWVzIGZvciB3b3JrcXVldWUgb3IgdGltZXIsDQo+ICAgICAg
ICAgc2VlIFsxXSBhbmQgWzJdLg0KPiAgICAgICAgID4gPiA+IEluIHNvbWUgb2YgdGhlc2UgYWNj
ZXNzL2FsbG9jYXRpb24gaGFwcGVuZWQgaW4NCj4gICAgICAgICBwcm9jZXNzX29uZV93b3JrKCks
DQo+ICAgICAgICAgPiA+ID4gd2Ugc2VlIHRoZSBmcmVlIHN0YWNrIGlzIHVzZWxlc3MgaW4gS0FT
QU4gcmVwb3J0LCBpdA0KPiAgICAgICAgIGRvZXNuJ3QgaGVscA0KPiAgICAgICAgID4gPiA+IHBy
b2dyYW1tZXJzIHRvIHNvbHZlIFVBRiBvbiB3b3JrcXVldWUuIFRoZSBzYW1lIG1heQ0KPiAgICAg
ICAgIHN0YW5kIGZvciB0aW1lcy4NCj4gICAgICAgICA+ID4gPg0KPiAgICAgICAgID4gPiA+IFRo
aXMgcGF0Y2hzZXQgaW1wcm92ZXMgS0FTQU4gcmVwb3J0cyBieSBtYWtpbmcgdGhlbSB0bw0KPiAg
ICAgICAgIGhhdmUgd29ya3F1ZXVlDQo+ICAgICAgICAgPiA+ID4gcXVldWVpbmcgc3RhY2sgYW5k
IHRpbWVyIHN0YWNrIGluZm9ybWF0aW9uLiBJdCBpcyB1c2VmdWwNCj4gICAgICAgICBmb3IgcHJv
Z3JhbW1lcnMNCj4gICAgICAgICA+ID4gPiB0byBzb2x2ZSB1c2UtYWZ0ZXItZnJlZSBvciBkb3Vi
bGUtZnJlZSBtZW1vcnkgaXNzdWUuDQo+ICAgICAgICAgPiA+ID4NCj4gICAgICAgICA+ID4gPiBH
ZW5lcmljIEtBU0FOIGFsc28gcmVjb3JkcyB0aGUgbGFzdCB0d28gd29ya3F1ZXVlIGFuZA0KPiAg
ICAgICAgIHRpbWVyIHN0YWNrcyBhbmQNCj4gICAgICAgICA+ID4gPiBwcmludHMgdGhlbSBpbiBL
QVNBTiByZXBvcnQuIEl0IGlzIG9ubHkgc3VpdGFibGUgZm9yDQo+ICAgICAgICAgZ2VuZXJpYyBL
QVNBTi4NCj4gICAgICAgICA+ID4gPg0KPiAgICAgICAgID4gPiA+IFsxXWh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vZy9zeXprYWxsZXItYnVncy9zZWFyY2g/cT0lDQo+ICAgICAgICAgMjJ1c2Ut
YWZ0ZXItZnJlZSUyMitwcm9jZXNzX29uZV93b3JrDQo+ICAgICAgICAgPiA+ID4gWzJdaHR0cHM6
Ly9ncm91cHMuZ29vZ2xlLmNvbS9nL3N5emthbGxlci1idWdzL3NlYXJjaD9xPSUNCj4gICAgICAg
ICAyMnVzZS1hZnRlci1mcmVlJTIyJTIwZXhwaXJlX3RpbWVycw0KPiAgICAgICAgID4gPiA+IFsz
XWh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk4NDM3DQo+ICAg
ICAgICAgPiA+ID4NCj4gICAgICAgICA+ID4gPiBXYWx0ZXIgV3UgKDYpOg0KPiAgICAgICAgID4g
PiA+IHRpbWVyOiBrYXNhbjogcmVjb3JkIHRpbWVyIHN0YWNrDQo+ICAgICAgICAgPiA+ID4gd29y
a3F1ZXVlOiBrYXNhbjogcmVjb3JkIHdvcmtxdWV1ZSBzdGFjaw0KPiAgICAgICAgID4gPiA+IGth
c2FuOiBwcmludCB0aW1lciBhbmQgd29ya3F1ZXVlIHN0YWNrDQo+ICAgICAgICAgPiA+ID4gbGli
L3Rlc3Rfa2FzYW4uYzogYWRkIHRpbWVyIHRlc3QgY2FzZQ0KPiAgICAgICAgID4gPiA+IGxpYi90
ZXN0X2thc2FuLmM6IGFkZCB3b3JrcXVldWUgdGVzdCBjYXNlDQo+ICAgICAgICAgPiA+ID4ga2Fz
YW46IHVwZGF0ZSBkb2N1bWVudGF0aW9uIGZvciBnZW5lcmljIGthc2FuDQo+ICAgICAgICAgPiA+
DQo+ICAgICAgICAgPiA+IEFja2VkLWJ5OiBNYXJjbyBFbHZlciA8ZWx2ZXJAZ29vZ2xlLmNvbT4N
Cj4gICAgICAgICA+DQo+ICAgICAgICAgPiBSZXZpZXdlZC1ieTogQW5kcmV5IEtvbm92YWxvdiA8
YW5kcmV5a252bEBnb29nbGUuY29tPg0KPiAgICAgICAgIA0KPiAgICAgICAgIFJldmlld2VkLWJ5
OiBEbWl0cnkgVnl1a292IDxkdnl1a292QGdvb2dsZS5jb20+DQo+ICAgICAgICAgDQo+ICAgICAg
ICAgVGhhbmtzISBUaGUgVUFGIHJlcG9ydHMgd2l0aCBSQ1Ugc3RhY2tzIHRoYXQgSSBzZWUgbm93
IGFyZQ0KPiAgICAgICAgIGp1c3Qg8J+UpfCflKXwn5SlDQo+IA0KPiANCj4gSGkgV2FsdGVyLA0K
PiANCj4gDQo+IFRoaXMgcGF0Y2hzZXQgbmVlZHMgdG8gYmUgcmViYXNlZCBvbnRvIHRoZSBLQVNB
Ti1LVU5JVCBwYXRjaGVzLCB3aGljaA0KPiBqdXN0IHJlY2VudGx5IHdlbnQgaW50byB0aGUgbW0g
dHJlZS4NCj4gDQo+IA0KPiBUaGFua3MhDQoNCkhpIERtaXRyeSwgQW5kcmV5LA0KDQpHb3QgaXQu
IA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCByZW1pbmRlci4NCg0KV2FsdGVyDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
