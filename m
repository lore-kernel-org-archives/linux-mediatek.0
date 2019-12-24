Return-Path: <SRS0=Ncyn=2O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DB9C2D0CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 06:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1283620706
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 06:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mH59/uYS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vHhuFcaP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1283620706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+gzdP0YRTsrM+FLeIK1MZ5Nm0s9PhkKg5uf0DL61yk=; b=mH59/uYSD5JOF/
	a0roVPpGDH4Ud7hbOTL1ypwaQr35cOSYZNtMQDktAOQz3vaIAZfq5MId5EMar8IHFM8HGMwErgQq3
	y8SUUO0pQpYyF4d+jKh+/vCD9Pdkz6zaZLVdqGnbb7LQ+kkO/eUCqf9WUB8EhjEBfTlO+x2Nv/NkK
	tOV7C6T78x1st8ffXcKBR7i18xVxpb2FlY317iGUUb7xnvgFBrNAkBA3Lyl/mtVTjBPtNY+K6ELAw
	0yIH78Tf/0DBMH0vKXVm0cNAtf529M8M1OOV6q+q75yA6J8fyXvFL0tOGWPnkHQjdcY1CXdpwuc2d
	LHcY9fHOpJOwGhxEeu6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ije6q-0002Am-2l; Tue, 24 Dec 2019 06:56:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ije6m-0002AO-5h
 for linux-mediatek@lists.infradead.org; Tue, 24 Dec 2019 06:55:57 +0000
X-UUID: 5eef02ab80fe4d338f6d63722ff96cc5-20191223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=do9D8AlCvPhD0SmX2gVAgc7Wbg5LH00onuMFoimiBbE=; 
 b=vHhuFcaPFF6+/N5fRgSYHgRaHkaFB5XGHzjYuj0vYwi4r8wv0RDyeMiF4+kvfold+daEHrVlWDiYS2DKL3A4WZ+Q9LVeBxvZkpxoWGzk1RiI1d+eb2z1+4IeAmrOh5y/OUUlUK9sGkm0mZA/FINIfLW0rN6DY8ySDK69tJpYJWg=;
X-UUID: 5eef02ab80fe4d338f6d63722ff96cc5-20191223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1643649323; Mon, 23 Dec 2019 22:55:49 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 22:46:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Dec 2019 14:45:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 24 Dec 2019 14:44:48 +0800
Message-ID: <1577169946.4959.4.camel@mtkswgap22>
Subject: Re: [PATCH] mm/page_owner: print largest memory consumer when OOM
 panic occurs
From: Miles Chen <miles.chen@mediatek.com>
To: Qian Cai <cai@lca.pw>
Date: Tue, 24 Dec 2019 14:45:46 +0800
In-Reply-To: <2B938D94-FFBB-4A3D-AD07-D7D04A4D4161@lca.pw>
References: <20191223113326.13828-1-miles.chen@mediatek.com>
 <2B938D94-FFBB-4A3D-AD07-D7D04A4D4161@lca.pw>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_225556_225127_75661967 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDE5LTEyLTIzIGF0IDA3OjMyIC0wNTAwLCBRaWFuIENhaSB3cm90ZToNCj4gDQo+
ID4gT24gRGVjIDIzLCAyMDE5LCBhdCA2OjMzIEFNLCBNaWxlcyBDaGVuIDxtaWxlcy5jaGVuQG1l
ZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gTW90aXZhdGlvbjoNCj4gPiAtLS0tLS0tLS0t
LQ0KPiA+IA0KPiA+IFdoZW4gZGVidWcgd2l0aCBhIE9PTSBrZXJuZWwgcGFuaWMsIGl0IGlzIGRp
ZmZpY3VsdCB0byBrbm93IHRoZQ0KPiA+IG1lbW9yeSBhbGxvY2F0ZWQgYnkga2VybmVsIGRyaXZl
cnMgb2Ygdm1hbGxvYygpIGJ5IGNoZWNraW5nIHRoZQ0KPiA+IE1lbS1JbmZvIG9yIE5vZGUvWm9u
ZSBpbmZvLiBGb3IgZXhhbXBsZToNCj4gPiANCj4gPiAgTWVtLUluZm86DQo+ID4gIGFjdGl2ZV9h
bm9uOjUxNDQgaW5hY3RpdmVfYW5vbjoxNjEyMCBpc29sYXRlZF9hbm9uOjANCj4gPiAgIGFjdGl2
ZV9maWxlOjAgaW5hY3RpdmVfZmlsZTowIGlzb2xhdGVkX2ZpbGU6MA0KPiA+ICAgdW5ldmljdGFi
bGU6MCBkaXJ0eTowIHdyaXRlYmFjazowIHVuc3RhYmxlOjANCj4gPiAgIHNsYWJfcmVjbGFpbWFi
bGU6NzM5IHNsYWJfdW5yZWNsYWltYWJsZTo0NDI0NjkNCj4gPiAgIG1hcHBlZDo1MzQgc2htZW06
MjEwNTAgcGFnZXRhYmxlczoyMSBib3VuY2U6MA0KPiA+ICAgZnJlZToxNDgwOCBmcmVlX3BjcDoz
Mzg5IGZyZWVfY21hOjgxMjgNCj4gPiANCj4gPiAgTm9kZSAwIGFjdGl2ZV9hbm9uOjIwNTc2a0Ig
aW5hY3RpdmVfYW5vbjo2NDQ4MGtCIGFjdGl2ZV9maWxlOjBrQg0KPiA+ICBpbmFjdGl2ZV9maWxl
OjBrQiB1bmV2aWN0YWJsZTowa0IgaXNvbGF0ZWQoYW5vbik6MGtCIGlzb2xhdGVkKGZpbGUpOjBr
Qg0KPiA+ICBtYXBwZWQ6MjEzNmtCIGRpcnR5OjBrQiB3cml0ZWJhY2s6MGtCIHNobWVtOjg0MjAw
a0Igc2htZW1fdGhwOiAwa0INCj4gPiAgc2htZW1fcG1kbWFwcGVkOiAwa0IgYW5vbl90aHA6IDBr
QiB3cml0ZWJhY2tfdG1wOjBrQiB1bnN0YWJsZTowa0INCj4gPiAgYWxsX3VuciBlY2xhaW1hYmxl
PyB5ZXMNCj4gPiANCj4gPiAgTm9kZSAwIERNQSBmcmVlOjE0NDc2a0IgbWluOjIxNTEya0IgbG93
OjI2ODg4a0IgaGlnaDozMjI2NGtCDQo+ID4gIHJlc2VydmVkX2hpZ2hhdG9taWM6MEtCIGFjdGl2
ZV9hbm9uOjBrQiBpbmFjdGl2ZV9hbm9uOjBrQg0KPiA+ICBhY3RpdmVfZmlsZTogMGtCIGluYWN0
aXZlX2ZpbGU6MGtCIHVuZXZpY3RhYmxlOjBrQiB3cml0ZXBlbmRpbmc6MGtCDQo+ID4gIHByZXNl
bnQ6MTA0ODU3NmtCIG1hbmFnZWQ6OTUyNzM2a0IgbWxvY2tlZDowa0Iga2VybmVsX3N0YWNrOjBr
Qg0KPiA+ICBwYWdldGFibGVzOjBrQiBib3VuY2U6MGtCIGZyZWVfcGNwOjI3MTZrQiBsb2NhbF9w
Y3A6MGtCIGZyZWVfY21hOjBrQg0KPiA+IA0KPiA+IFRoZSBpbmZvcm1hdGlvbiBhYm92ZSB0ZWxs
cyB1cyB0aGUgbWVtb3J5IHVzYWdlIG9mIHRoZSBrbm93biBtZW1vcnkNCj4gPiBjYXRlZ29yaWVz
IGFuZCB3ZSBjYW4gY2hlY2sgdGhlIGFibm9ybWFsIGxhcmdlIG51bWJlcnMuIEhvd2V2ZXIsIGlm
IGENCj4gPiBtZW1vcnkgbGVha2FnZSBjYW5ub3QgYmUgb2JzZXJ2ZWQgaW4gdGhlIGNhdGVnb3Jp
ZXMgYWJvdmUsIHdlIG5lZWQgdG8NCj4gPiByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGggQ09ORklH
X1BBR0VfT1dORVIuDQo+ID4gDQo+ID4gSXQgaXMgcG9zc2libGUgdG8gcmVhZCB0aGUgcGFnZSBv
d25lciBpbmZvcm1hdGlvbiBmcm9tIGNvcmVkdW1wIGZpbGVzLg0KPiA+IEhvd2V2ZXIsIGNvcmVk
dW1wIGZpbGVzIG1heSBub3QgYWx3YXlzIGJlIGF2YWlsYWJsZSwgc28gbXkgYXBwcm9hY2ggaXMN
Cj4gPiB0byBwcmludCBvdXQgdGhlIGxhcmdlc3QgcGFnZSBjb25zdW1lciB3aGVuIE9PTSBrZXJu
ZWwgcGFuaWMgb2NjdXJzLg0KPiANCj4gTWFueSBvZiB0aG9zZSBwYXRjaGVzIGhlbHBpbmcgZGVi
dWdnaW5nIHNwZWNpYWwgY2FzZXMgaGFkIGJlZW4gc2hvdCBkb3duIGluIHRoZSBwYXN0LiBJIGRv
buKAmXQgc2VlIG11Y2ggZGlmZmVyZW5jZSB0aGlzIHRpbWUuIElmIHlvdSB3b3JyeSBhYm91dCBt
ZW1vcnkgbGVhaywgZW5hYmxlIGttZW1sZWFrIGFuZCB0aGVuIHRvIHJlcHJvZHVjZS4gT3RoZXJ3
aXNlLCB3ZSB3aWxsIGVuZCB1cCB3aXRoIHRvbyBtYW55IGhldXJpc3RpY3MganVzdCBmb3IgZGVi
dWdnaW5nLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuDQoNCldlIHVzZSBrbWVtbGVh
ayB0b28sIGJ1dCBhIG1lbW9yeSBsZWFrYWdlIHdoaWNoIGlzIGNhdXNlZCBieQ0KYWxsb2NfcGFn
ZXMoKSBpbiBhIGtlcm5lbCBkZXZpY2UgZHJpdmVyIGNhbm5vdCBiZSBjYXVnaHQgYnkga21lbWxl
YWsuDQpXZSBoYXZlIGZvdWdodCBhZ2FpbnN0IHRoaXMga2luZCBvZiByZWFsIHByb2JsZW1zIGZv
ciBhIGZldyB5ZWFycyBhbmQgDQpmaW5kIGEgd2F5IHRvIG1ha2UgdGhlIGRlYnVnZ2luZyBlYXNp
ZXIuDQoNCldlIGN1cnJlbnRseSBoYXZlIGluZm9ybWF0aW9uIGR1cmluZyBPT006IHByb2Nlc3Mg
Tm9kZSwgem9uZSwgc3dhcCwgDQpwcm9jZXNzIChwaWQsIHJzcywgbmFtZSksIHNsYWIgdXNhZ2Us
IGFuZCB0aGUgYmFja3RyYWNlLCBvcmRlciwgYW5kDQpnZnAgZmxhZ3Mgb2YgdGhlIE9PTSBiYWNr
dHJhY2UuIA0KV2UgY2FuIHRlbGwgbWFueSBkaWZmZXJlbnQgdHlwZXMgb2YgT09NIHByb2JsZW1z
IGJ5IHRoZSBpbmZvcm1hdGlvbg0KYWJvdmUgZXhjZXB0IHRoZSBhbGxvY19wYWdlcygpIGxlYWth
Z2UuDQoNClRoZSBwYXRjaCBkb2VzIHdvcmsgYW5kIHNhdmUgYSBsb3Qgb2YgZGVidWdnaW5nIHRp
bWUuDQpDb3VsZCB3ZSBjb25zaWRlciB0aGUgImdyZWF0ZXN0IG1lbW9yeSBjb25zdW1lciIgYXMg
YW5vdGhlciB1c2VmdWwgDQpPT00gaW5mb3JtYXRpb24/DQoNCg0KTWlsZXMNCj4gPiANCj4gPiBU
aGUgaGV1cmlzdGljIGFwcHJvYWNoIGFzc3VtZXMgdGhhdCB0aGUgT09NIGtlcm5lbCBwYW5pYyBp
cyBjYXVzZWQgYnkNCj4gPiBhIHNpbmdsZSBiYWNrdHJhY2UuIFRoZSBhc3N1bXB0aW9uIGlzIG5v
dCBhbHdheXMgdHJ1ZSBidXQgaXQgd29ya3MgaW4NCj4gPiBtYW55IGNhc2VzIGR1cmluZyBvdXIg
dGVzdC4NCj4gPiANCj4gPiBXZSBoYXZlIHRlc3RlZCB0aGlzIGhldXJpc3RpYyBhcHByb2FjaCBz
aW5jZSAyMDE5LzUgb24gYW5kcm9pZCBkZXZpY2VzLg0KPiA+IEluIDM4IGludGVybmFsIE9PTSBr
ZXJuZWwgcGFuaWMgcmVwb3J0czoNCj4gPiANCj4gPiAzMS8zODogY2FuIGJlIGFuYWx5emVkIGJ5
IHVzaW5nIGV4aXN0aW5nIGluZm9ybWF0aW9uDQo+ID4gNy8zODogbmVlZCBwYWdlIG93bmVyIGZv
cm1hdGlubyBhbmQgdGhlIGhldXJpc3RpYyBhcHByb2FjaCBpbiB0aGlzIHBhdGNoDQo+ID4gcHJp
bnRzIHRoZSBjb3JyZWN0IGJhY2t0cmFjZXMgb2YgYWJub3JtYWwgbWVtb3J5IGFsbG9jYXRpb25z
LiBObyBuZWVkIHRvDQo+ID4gcmVwcm9kdWNlIHRoZSBpc3N1ZXMuDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
