Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B239EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 12:01:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C06F2070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 12:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYBMFf2P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G86wgHW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C06F2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hY8X+NSjU5IVxFtoEDmY5DjvwFIaFJTNKpwGIv7IYRY=; b=DYBMFf2PWxj+ycxrwn++lZz6D
	P0l00rI+k57mlzJyAcENFE0srhmoFSLH2YE+TNLg/582O2l0+iSBUGiiCTzVkZzbWXwhbP3fhRSsD
	ac+T+kdA1bKN+FITdHkqc3ER6QJmvDFQTeKefHGjbDGwVrEw3FPiLH9jyFeME1Y6TwnNnuIcuOBLT
	gIX7WufI7TujOUL/dKekn7synFJ90tfWN4D60fQeOg+a4EkC6dSrq2E9D287+S54hl/af/WtF0L49
	pG8qyQuZ6VGTfNjKVgyaBnD2CSAmJOAGVuPeiu3BDnxzDFRMQqgewgy1zM/ZLTUBG8v7sctXbOLbX
	vmAtp9lxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k56Uk-0007rr-AE; Mon, 10 Aug 2020 12:01:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k56Ug-0007qz-CX; Mon, 10 Aug 2020 12:01:35 +0000
X-UUID: 88de519f531b4a9b9f19099854ea3e7e-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XMYSeVf6j/BMh7fB37Fqh8Fu4b2tHaEyT8hlJ40JRlg=; 
 b=G86wgHW3CAX1jcYFa7bMIfyLAHXxNb9u5QwcOF6AscgEBw3w8y9uj9Ij6kFqe19QcFruxn/S45sW4+c8o+jTXvxoSyV9kUXSiIr5vj9u/7kuQzrj+BhbaOQxqcQBZjqdZ0BISjggYIl4/B7LjXL+bvpYd9hVSybaC1qr0V8SqiM=;
X-UUID: 88de519f531b4a9b9f19099854ea3e7e-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 872879438; Mon, 10 Aug 2020 04:00:55 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 04:51:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 19:50:55 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 19:50:57 +0800
Message-ID: <1597060257.13160.11.camel@mtksdccf07>
Subject: Re: [PATCH 0/5] kasan: add workqueue and timer stack for generic KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Qian Cai <cai@lca.pw>
Date: Mon, 10 Aug 2020 19:50:57 +0800
In-Reply-To: <B873B364-FF03-4819-8F9C-79F3C4EF47CE@lca.pw>
References: <20200810072115.429-1-walter-zh.wu@mediatek.com>
 <B873B364-FF03-4819-8F9C-79F3C4EF47CE@lca.pw>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_080134_662199_81312F5D 
X-CRM114-Status: GOOD (  28.03  )
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

T24gTW9uLCAyMDIwLTA4LTEwIGF0IDA3OjE5IC0wNDAwLCBRaWFuIENhaSB3cm90ZToNCj4gDQo+
ID4gT24gQXVnIDEwLCAyMDIwLCBhdCAzOjIxIEFNLCBXYWx0ZXIgV3UgPHdhbHRlci16aC53dUBt
ZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IO+7v1N5emJvdCByZXBvcnRzIG1hbnkgVUFG
IGlzc3VlcyBmb3Igd29ya3F1ZXVlIG9yIHRpbWVyLCBzZWUgWzFdIGFuZCBbMl0uDQo+ID4gSW4g
c29tZSBvZiB0aGVzZSBhY2Nlc3MvYWxsb2NhdGlvbiBoYXBwZW5lZCBpbiBwcm9jZXNzX29uZV93
b3JrKCksDQo+ID4gd2Ugc2VlIHRoZSBmcmVlIHN0YWNrIGlzIHVzZWxlc3MgaW4gS0FTQU4gcmVw
b3J0LCBpdCBkb2Vzbid0IGhlbHANCj4gPiBwcm9ncmFtbWVycyB0byBzb2x2ZSBVQUYgb24gd29y
a3F1ZXVlLiBUaGUgc2FtZSBtYXkgc3RhbmQgZm9yIHRpbWVzLg0KPiA+IA0KPiA+IFRoaXMgcGF0
Y2hzZXQgaW1wcm92ZXMgS0FTQU4gcmVwb3J0cyBieSBtYWtpbmcgdGhlbSB0byBoYXZlIHdvcmtx
dWV1ZQ0KPiA+IHF1ZXVlaW5nIHN0YWNrIGFuZCB0aW1lciBxdWV1ZWluZyBzdGFjayBpbmZvcm1h
dGlvbi4gSXQgaXMgdXNlZnVsIGZvcg0KPiA+IHByb2dyYW1tZXJzIHRvIHNvbHZlIHVzZS1hZnRl
ci1mcmVlIG9yIGRvdWJsZS1mcmVlIG1lbW9yeSBpc3N1ZS4NCj4gPiANCj4gPiBHZW5lcmljIEtB
U0FOIHdpbGwgcmVjb3JkIHRoZSBsYXN0IHR3byB3b3JrcXVldWUgYW5kIHRpbWVyIHN0YWNrcywN
Cj4gPiBwcmludCB0aGVtIGluIEtBU0FOIHJlcG9ydC4gSXQgaXMgb25seSBzdWl0YWJsZSBmb3Ig
Z2VuZXJpYyBLQVNBTi4NCj4gPiANCj4gPiBJbiBvcmRlciB0byBwcmludCB0aGUgbGFzdCB0d28g
d29ya3F1ZXVlIGFuZCB0aW1lciBzdGFja3MsIHNvIHRoYXQNCj4gPiB3ZSBhZGQgbmV3IG1lbWJl
cnMgaW4gc3RydWN0IGthc2FuX2FsbG9jX21ldGEuDQo+ID4gLSB0d28gd29ya3F1ZXVlIHF1ZXVl
aW5nIHdvcmsgc3RhY2tzLCB0b3RhbCBzaXplIGlzIDggYnl0ZXMuDQo+ID4gLSB0d28gdGltZXIg
cXVldWVpbmcgc3RhY2tzLCB0b3RhbCBzaXplIGlzIDggYnl0ZXMuDQo+ID4gDQo+ID4gT3JpZ25p
YWwgc3RydWN0IGthc2FuX2FsbG9jX21ldGEgc2l6ZSBpcyAxNiBieXRlcy4gQWZ0ZXIgYWRkIG5l
dw0KPiA+IG1lbWJlcnMsIHRoZW4gdGhlIHN0cnVjdCBrYXNhbl9hbGxvY19tZXRhIHRvdGFsIHNp
emUgaXMgMzIgYnl0ZXMsDQo+ID4gSXQgaXMgYSBnb29kIG51bWJlciBvZiBhbGlnbm1lbnQuIExl
dCBpdCBnZXQgYmV0dGVyIG1lbW9yeSBjb25zdW1wdGlvbi4NCj4gDQo+IEdldHRpbmcgZGVidWdn
aW5nIHRvb2xzIGNvbXBsaWNhdGVkIHN1cmVseSBpcyB0aGUgYmVzdCB3YXkgdG8ga2lsbCBpdC4g
SSB3b3VsZCBhcmd1ZSB0aGF0IGl0IG9ubHkgbWFrZSBzZW5zZSB0byBjb21wbGljYXRlIGl0IGlm
IGl0IGlzIHVzZWZ1bCBtb3N0IG9mIHRoZSB0aW1lIHdoaWNoIEkgbmV2ZXIgZmVlbCBvciBoZWFy
IHRoYXQgaXMgdGhlIGNhc2UuIFRoaXMgcmVtaW5kcyBtZSB5b3VyIHJlY2VudCBjYWxsX3JjdSgp
IHN0YWNrcyB0aGF0IG1vc3Qgb2YgdGltZSBqdXN0IG1ha2VzIHBhcnNpbmcgdGhlIHJlcG9ydCBj
dW1iZXJzb21lLiBUaHVzLCBJIHVyZ2UgdGhpcyBleGVyY2lzZSB0byBvdmVyLWVuZ2luZWVyIG9u
IHNwZWNpYWwgY2FzZXMgbmVlZCB0byBzdG9wIGVudGlyZWx5Lg0KPiANCg0KQSBnb29kIGRlYnVn
IHRvb2wgaXMgdG8gaGF2ZSBjb21wbGV0ZSBpbmZvcm1hdGlvbiBpbiBvcmRlciB0byBzb2x2ZQ0K
aXNzdWUuIFdlIHNob3VsZCBmb2N1cyBvbiBpZiBLQVNBTiByZXBvcnRzIGFsd2F5cyBzaG93IHRo
aXMgZGVidWcNCmluZm9ybWF0aW9uIG9yIGNyZWF0ZSBhIG9wdGlvbiB0byBkZWNpZGUgaWYgc2hv
dyBpdC4gQmVjYXVzZSB0aGlzDQpmZWF0dXJlIGlzIERpbWl0cnkncyBzdWdnZXN0aW9uLiBzZWUg
WzFdLiBTbyBJIHRoaW5rIGl0IG5lZWQgdG8gYmUNCmltcGxlbWVudGVkLiBNYXliZSB3ZSBjYW4g
d2FpdCBoaXMgcmVzcG9uc2UuIA0KDQpbMV1odHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC82LzIz
LzI1Ng0KDQpUaGFua3MuDQoNCj4gPiANCj4gPiBbMV1odHRwczovL2dyb3Vwcy5nb29nbGUuY29t
L2cvc3l6a2FsbGVyLWJ1Z3Mvc2VhcmNoP3E9JTIydXNlLWFmdGVyLWZyZWUlMjIrcHJvY2Vzc19v
bmVfd29yaw0KPiA+IFsyXWh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZy9zeXprYWxsZXItYnVn
cy9zZWFyY2g/cT0lMjJ1c2UtYWZ0ZXItZnJlZSUyMiUyMGV4cGlyZV90aW1lcnMNCj4gPiBbM11o
dHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTE5ODQzNw0KPiA+IA0K
PiA+IFdhbHRlciBXdSAoNSk6DQo+ID4gdGltZXI6IGthc2FuOiByZWNvcmQgYW5kIHByaW50IHRp
bWVyIHN0YWNrDQo+ID4gd29ya3F1ZXVlOiBrYXNhbjogcmVjb3JkIGFuZCBwcmludCB3b3JrcXVl
dWUgc3RhY2sNCj4gPiBsaWIvdGVzdF9rYXNhbi5jOiBhZGQgdGltZXIgdGVzdCBjYXNlDQo+ID4g
bGliL3Rlc3Rfa2FzYW4uYzogYWRkIHdvcmtxdWV1ZSB0ZXN0IGNhc2UNCj4gPiBrYXNhbjogdXBk
YXRlIGRvY3VtZW50YXRpb24gZm9yIGdlbmVyaWMga2FzYW4NCj4gPiANCj4gPiBEb2N1bWVudGF0
aW9uL2Rldi10b29scy9rYXNhbi5yc3QgfCAgNCArKy0tDQo+ID4gaW5jbHVkZS9saW51eC9rYXNh
bi5oICAgICAgICAgICAgIHwgIDQgKysrKw0KPiA+IGtlcm5lbC90aW1lL3RpbWVyLmMgICAgICAg
ICAgICAgICB8ICAyICsrDQo+ID4ga2VybmVsL3dvcmtxdWV1ZS5jICAgICAgICAgICAgICAgIHwg
IDMgKysrDQo+ID4gbGliL3Rlc3Rfa2FzYW4uYyAgICAgICAgICAgICAgICAgIHwgNTQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gbW0v
a2FzYW4vZ2VuZXJpYy5jICAgICAgICAgICAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gbW0va2FzYW4va2FzYW4uaCAgICAgICAgICAgICAg
ICAgIHwgIDYgKysrKystDQo+ID4gbW0va2FzYW4vcmVwb3J0LmMgICAgICAgICAgICAgICAgIHwg
MjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiA+IDggZmlsZXMgY2hhbmdlZCwgMTM0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gLS0gDQo+ID4gWW91IHJlY2VpdmVk
IHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdy
b3VwcyAia2FzYW4tZGV2IiBncm91cC4NCj4gPiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3Jv
dXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIGth
c2FuLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLg0KPiA+IFRvIHZpZXcgdGhpcyBk
aXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21z
Z2lkL2thc2FuLWRldi8yMDIwMDgxMDA3MjExNS40MjktMS13YWx0ZXItemgud3UlNDBtZWRpYXRl
ay5jb20uDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
