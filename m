Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A24EC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 12:13:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09849206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 12:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLTo6idK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cxIlhD2g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09849206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F8xVvWeRcJ3KmNwOurH72i/kuMd3VXugMy04NYBJ2tk=; b=dLTo6idKbGS15QuwMCf2ZPYcY
	6uquwqLOG9mO9PiUxtZJZahsZ3/9kVQoCfgJOwGyENHQ5A1urboT8lVrGAiSjw8boWqicFhZzS8dO
	nld7HOzXtN1Vcf07jEgSExbsdasaZlkXjbO4M4ST4VA5KeYt+OSstBk5o0s6qEULQOAaMUETpriiK
	oDEL5rHyLu0VXGarrZsoK8YNfIx4cFReH/EMax8ypkIJm9y6UfY4GrRegjbA7bWlvGF5wMsFucmNI
	5j9Ry9FUeFFYacv/mk1kys5iogv4SAM+wwKEZj8N2LksJeLyzH6406P6n9AJ5rhhhNL55x3Dt/VXN
	70SJxRWFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k56fj-0000Dc-1H; Mon, 10 Aug 2020 12:12:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k56fe-0000Ck-6u; Mon, 10 Aug 2020 12:12:55 +0000
X-UUID: c632ff2f4a2f4327be3afb77f8e640f5-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=85XI0r8gSm4pXV6KLRTXENKU7LoA4RXMZocUnSqxJRc=; 
 b=cxIlhD2g5Qs6z62b8bTlSgu5/XQHLgDcdKdIfOke5gSemEonWspbZ+Jrhi8Db709r6KBPFFf17lsJWKBSKZxdyQkjhS9af8r+ymKVIbHP5YbKBMMaTWADX+UhAsbIwKNOEyez/x10MgRKDFQW+S8e99GP3kVwEuy3jJXuB0n3D4=;
X-UUID: c632ff2f4a2f4327be3afb77f8e640f5-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 275296191; Mon, 10 Aug 2020 04:12:32 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 05:12:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 20:12:32 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 20:12:32 +0800
Message-ID: <1597061554.13160.17.camel@mtksdccf07>
Subject: Re: [PATCH 0/5] kasan: add workqueue and timer stack for generic KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Qian Cai <cai@lca.pw>
Date: Mon, 10 Aug 2020 20:12:34 +0800
In-Reply-To: <1597060257.13160.11.camel@mtksdccf07>
References: <20200810072115.429-1-walter-zh.wu@mediatek.com>
 <B873B364-FF03-4819-8F9C-79F3C4EF47CE@lca.pw>
 <1597060257.13160.11.camel@mtksdccf07>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_081254_408024_7D6309D2 
X-CRM114-Status: GOOD (  30.96  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mm@kvack.org, Stephen
 Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Tejun
 Heo <tj@kernel.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTA4LTEwIGF0IDE5OjUwICswODAwLCBXYWx0ZXIgV3Ugd3JvdGU6DQo+IE9u
IE1vbiwgMjAyMC0wOC0xMCBhdCAwNzoxOSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6DQo+ID4gDQo+
ID4gPiBPbiBBdWcgMTAsIDIwMjAsIGF0IDM6MjEgQU0sIFdhbHRlciBXdSA8d2FsdGVyLXpoLnd1
QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IO+7v1N5emJvdCByZXBvcnRzIG1h
bnkgVUFGIGlzc3VlcyBmb3Igd29ya3F1ZXVlIG9yIHRpbWVyLCBzZWUgWzFdIGFuZCBbMl0uDQo+
ID4gPiBJbiBzb21lIG9mIHRoZXNlIGFjY2Vzcy9hbGxvY2F0aW9uIGhhcHBlbmVkIGluIHByb2Nl
c3Nfb25lX3dvcmsoKSwNCj4gPiA+IHdlIHNlZSB0aGUgZnJlZSBzdGFjayBpcyB1c2VsZXNzIGlu
IEtBU0FOIHJlcG9ydCwgaXQgZG9lc24ndCBoZWxwDQo+ID4gPiBwcm9ncmFtbWVycyB0byBzb2x2
ZSBVQUYgb24gd29ya3F1ZXVlLiBUaGUgc2FtZSBtYXkgc3RhbmQgZm9yIHRpbWVzLg0KPiA+ID4g
DQo+ID4gPiBUaGlzIHBhdGNoc2V0IGltcHJvdmVzIEtBU0FOIHJlcG9ydHMgYnkgbWFraW5nIHRo
ZW0gdG8gaGF2ZSB3b3JrcXVldWUNCj4gPiA+IHF1ZXVlaW5nIHN0YWNrIGFuZCB0aW1lciBxdWV1
ZWluZyBzdGFjayBpbmZvcm1hdGlvbi4gSXQgaXMgdXNlZnVsIGZvcg0KPiA+ID4gcHJvZ3JhbW1l
cnMgdG8gc29sdmUgdXNlLWFmdGVyLWZyZWUgb3IgZG91YmxlLWZyZWUgbWVtb3J5IGlzc3VlLg0K
PiA+ID4gDQo+ID4gPiBHZW5lcmljIEtBU0FOIHdpbGwgcmVjb3JkIHRoZSBsYXN0IHR3byB3b3Jr
cXVldWUgYW5kIHRpbWVyIHN0YWNrcywNCj4gPiA+IHByaW50IHRoZW0gaW4gS0FTQU4gcmVwb3J0
LiBJdCBpcyBvbmx5IHN1aXRhYmxlIGZvciBnZW5lcmljIEtBU0FOLg0KPiA+ID4gDQo+ID4gPiBJ
biBvcmRlciB0byBwcmludCB0aGUgbGFzdCB0d28gd29ya3F1ZXVlIGFuZCB0aW1lciBzdGFja3Ms
IHNvIHRoYXQNCj4gPiA+IHdlIGFkZCBuZXcgbWVtYmVycyBpbiBzdHJ1Y3Qga2FzYW5fYWxsb2Nf
bWV0YS4NCj4gPiA+IC0gdHdvIHdvcmtxdWV1ZSBxdWV1ZWluZyB3b3JrIHN0YWNrcywgdG90YWwg
c2l6ZSBpcyA4IGJ5dGVzLg0KPiA+ID4gLSB0d28gdGltZXIgcXVldWVpbmcgc3RhY2tzLCB0b3Rh
bCBzaXplIGlzIDggYnl0ZXMuDQo+ID4gPiANCj4gPiA+IE9yaWduaWFsIHN0cnVjdCBrYXNhbl9h
bGxvY19tZXRhIHNpemUgaXMgMTYgYnl0ZXMuIEFmdGVyIGFkZCBuZXcNCj4gPiA+IG1lbWJlcnMs
IHRoZW4gdGhlIHN0cnVjdCBrYXNhbl9hbGxvY19tZXRhIHRvdGFsIHNpemUgaXMgMzIgYnl0ZXMs
DQo+ID4gPiBJdCBpcyBhIGdvb2QgbnVtYmVyIG9mIGFsaWdubWVudC4gTGV0IGl0IGdldCBiZXR0
ZXIgbWVtb3J5IGNvbnN1bXB0aW9uLg0KPiA+IA0KPiA+IEdldHRpbmcgZGVidWdnaW5nIHRvb2xz
IGNvbXBsaWNhdGVkIHN1cmVseSBpcyB0aGUgYmVzdCB3YXkgdG8ga2lsbCBpdC4gSSB3b3VsZCBh
cmd1ZSB0aGF0IGl0IG9ubHkgbWFrZSBzZW5zZSB0byBjb21wbGljYXRlIGl0IGlmIGl0IGlzIHVz
ZWZ1bCBtb3N0IG9mIHRoZSB0aW1lIHdoaWNoIEkgbmV2ZXIgZmVlbCBvciBoZWFyIHRoYXQgaXMg
dGhlIGNhc2UuIFRoaXMgcmVtaW5kcyBtZSB5b3VyIHJlY2VudCBjYWxsX3JjdSgpIHN0YWNrcyB0
aGF0IG1vc3Qgb2YgdGltZSBqdXN0IG1ha2VzIHBhcnNpbmcgdGhlIHJlcG9ydCBjdW1iZXJzb21l
LiBUaHVzLCBJIHVyZ2UgdGhpcyBleGVyY2lzZSB0byBvdmVyLWVuZ2luZWVyIG9uIHNwZWNpYWwg
Y2FzZXMgbmVlZCB0byBzdG9wIGVudGlyZWx5Lg0KPiA+IA0KPiANCj4gQSBnb29kIGRlYnVnIHRv
b2wgaXMgdG8gaGF2ZSBjb21wbGV0ZSBpbmZvcm1hdGlvbiBpbiBvcmRlciB0byBzb2x2ZQ0KPiBp
c3N1ZS4gV2Ugc2hvdWxkIGZvY3VzIG9uIGlmIEtBU0FOIHJlcG9ydHMgYWx3YXlzIHNob3cgdGhp
cyBkZWJ1Zw0KPiBpbmZvcm1hdGlvbiBvciBjcmVhdGUgYSBvcHRpb24gdG8gZGVjaWRlIGlmIHNo
b3cgaXQuIEJlY2F1c2UgdGhpcw0KPiBmZWF0dXJlIGlzIERtaXRyeSdzIHN1Z2dlc3Rpb24uIHNl
ZSBbMV0uIFNvIEkgdGhpbmsgaXQgbmVlZCB0byBiZQ0KPiBpbXBsZW1lbnRlZC4gTWF5YmUgd2Ug
Y2FuIHdhaXQgaGlzIHJlc3BvbnNlLiANCj4gDQo+IFsxXWh0dHBzOi8vbGttbC5vcmcvbGttbC8y
MDIwLzYvMjMvMjU2DQo+IA0KPiBUaGFua3MuDQo+IA0KDQpGaXggbmFtZSB0eXBvLiBJIGFtIHNv
cnJ5IHRvIGhpbS4NCkFuZCBhZGQgYSBidWd6aWxsYSB0byBzaG93IHdoeSBuZWVkIHRvIGRvIGl0
LiBwbGVhc2Ugc2VlIFsxXS4NCg0KWzFdIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTk4NDM3DQoNCj4gPiA+IA0KPiA+ID4gWzFdaHR0cHM6Ly9ncm91cHMuZ29v
Z2xlLmNvbS9nL3N5emthbGxlci1idWdzL3NlYXJjaD9xPSUyMnVzZS1hZnRlci1mcmVlJTIyK3By
b2Nlc3Nfb25lX3dvcmsNCj4gPiA+IFsyXWh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZy9zeXpr
YWxsZXItYnVncy9zZWFyY2g/cT0lMjJ1c2UtYWZ0ZXItZnJlZSUyMiUyMGV4cGlyZV90aW1lcnMN
Cj4gPiA+IFszXWh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk4
NDM3DQo+ID4gPiANCj4gPiA+IFdhbHRlciBXdSAoNSk6DQo+ID4gPiB0aW1lcjoga2FzYW46IHJl
Y29yZCBhbmQgcHJpbnQgdGltZXIgc3RhY2sNCj4gPiA+IHdvcmtxdWV1ZToga2FzYW46IHJlY29y
ZCBhbmQgcHJpbnQgd29ya3F1ZXVlIHN0YWNrDQo+ID4gPiBsaWIvdGVzdF9rYXNhbi5jOiBhZGQg
dGltZXIgdGVzdCBjYXNlDQo+ID4gPiBsaWIvdGVzdF9rYXNhbi5jOiBhZGQgd29ya3F1ZXVlIHRl
c3QgY2FzZQ0KPiA+ID4ga2FzYW46IHVwZGF0ZSBkb2N1bWVudGF0aW9uIGZvciBnZW5lcmljIGth
c2FuDQo+ID4gPiANCj4gPiA+IERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2thc2FuLnJzdCB8ICA0
ICsrLS0NCj4gPiA+IGluY2x1ZGUvbGludXgva2FzYW4uaCAgICAgICAgICAgICB8ICA0ICsrKysN
Cj4gPiA+IGtlcm5lbC90aW1lL3RpbWVyLmMgICAgICAgICAgICAgICB8ICAyICsrDQo+ID4gPiBr
ZXJuZWwvd29ya3F1ZXVlLmMgICAgICAgICAgICAgICAgfCAgMyArKysNCj4gPiA+IGxpYi90ZXN0
X2thc2FuLmMgICAgICAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gbW0va2FzYW4vZ2VuZXJpYy5jICAg
ICAgICAgICAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gPiBtbS9rYXNhbi9rYXNhbi5oICAgICAgICAgICAgICAgICAgfCAgNiArKysrKy0N
Cj4gPiA+IG1tL2thc2FuL3JlcG9ydC5jICAgICAgICAgICAgICAgICB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysNCj4gPiA+IDggZmlsZXMgY2hhbmdlZCwgMTM0IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IC0tIA0KPiA+ID4gWW91IHJlY2VpdmVkIHRoaXMg
bWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAi
a2FzYW4tZGV2IiBncm91cC4NCj4gPiA+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBh
bmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8ga2FzYW4t
ZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uDQo+ID4gPiBUbyB2aWV3IHRoaXMgZGlz
Y3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dp
ZC9rYXNhbi1kZXYvMjAyMDA4MTAwNzIxMTUuNDI5LTEtd2FsdGVyLXpoLnd1JTQwbWVkaWF0ZWsu
Y29tLg0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
