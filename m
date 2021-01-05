Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46219C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 06:46:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB23B22838
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 06:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB23B22838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wscQwwULRoTNq3jAfjqQ2da4oCXl4dObIlOZz96nud4=; b=rZX3ivizwVK4756gLRKkTjOOzX
	eeWcZbCl4fgm51oo9QWJLV3upagsHE+dh+ZuTRQmGkFwa2ypDlp7RQk8outku832nXPtpXiQ1eFxM
	WhCNAHnvFJpPL96vHvVWmoH5ZOmL7voVi6RppE8XoC8dkZdRh5V8yVn65tr26c6InK6tKSCC8/lly
	uUbc9kv1D1H2SIseJrAOICO4CjuLMfNBqB6P7ney0u20OjdayezBxWgPGigLD4Dg6bYaplRy00Tt9
	yqNiMpNTNYaSZuy/2psk3a9ny/ql++WOuFvNi0Q7u3MZD7GhB5v3wow1fe4voN2UeIktEMFsLj1qt
	OuDm2Dxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwg6z-0003sy-2s; Tue, 05 Jan 2021 06:46:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwg6v-0003rr-Bc; Tue, 05 Jan 2021 06:46:30 +0000
X-UUID: d9b76b84f9284c12a012c1ecff6899ef-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=uOuUrNyJqVyw+bf7rxjNIRMo6y7sN/EKdL9L1mBNcBM=; 
 b=Dsm7tE5WYgtwk/A0DKeC10JG19MeF1DPvYHW5zG4IpeDdWXBpNdYC/BA04AGyJkWd27fRPSgW9t+Of2moK2rolsXEdweN0nM811xk3kceP9mHNsVZnVQeOjz1Myt3HUsoY6t/bDKCVMv8W9F7GKPJ7OE+hFuP01eyNGi21vOVFg=;
X-UUID: d9b76b84f9284c12a012c1ecff6899ef-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1279024349; Mon, 04 Jan 2021 22:46:22 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 22:36:20 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Jan 2021 14:36:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 14:36:17 +0800
Message-ID: <1609828577.1574.5.camel@mhfsdcap03>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 Jan 2021 14:36:17 +0800
In-Reply-To: <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
 <1607647514.12750.5.camel@mhfsdcap03>
 <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_014629_597006_083C3BFC 
X-CRM114-Status: GOOD (  29.19  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDIyOjU0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMeaXpSDpgLHkupQg5LiK5Y2IODo0NeWvq+mBk++8
mg0KPiA+DQo+ID4gT24gVGh1LCAyMDIwLTEyLTEwIGF0IDIzOjUwICswODAwLCBDaHVuLUt1YW5n
IEh1IHdyb3RlOg0KPiA+ID4gSGksIFlvbmdxaWFuZzoNCj4gPiA+DQo+ID4gPiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQxMuaciDEw5pelIOmA
seWbmyDkuIvljYg1OjA45a+r6YGT77yaDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRk
IFJETUEgZmlmbyBzaXplIGVycm9yIGhhbmRsZQ0KPiA+ID4gPiByZG1hIGZpZm8gc2l6ZSB3aWxs
IG5vdCBhbHdheXMgYmlnZ2VyIHRoYW4gdGhlIGNhbGN1bGF0ZWQgdGhyZXNob2xkDQo+ID4gPiA+
IGlmIHRoYXQgY2FzZSBoYXBwZW5lZCwgd2UgbmVlZCBzZXQgZmlmbyBzaXplIGFzIHRoZSB0aHJl
c2hvbGQNCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyB8IDQgKysrKw0KPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gPiA+ID4gaW5kZXggNzk0YWNjNS4uMDUwODM5
MiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X3JkbWEuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
cmRtYS5jDQo+ID4gPiA+IEBAIC0xNTEsNiArMTUxLDEwIEBAIHN0YXRpYyB2b2lkIG10a19yZG1h
X2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgd2lkdGgsDQo+
ID4gPiA+ICAgICAgICAgICogYWNjb3VudCBmb3IgYmxhbmtpbmcsIGFuZCB3aXRoIGEgcGl4ZWwg
ZGVwdGggb2YgNCBieXRlczoNCj4gPiA+ID4gICAgICAgICAgKi8NCj4gPiA+ID4gICAgICAgICB0
aHJlc2hvbGQgPSB3aWR0aCAqIGhlaWdodCAqIHZyZWZyZXNoICogNCAqIDcgLyAxMDAwMDAwOw0K
PiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgaWYgKHRocmVzaG9sZCA+IHJkbWFfZmlmb19zaXpl
KQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgdGhyZXNob2xkID0gcmRtYV9maWZvX3NpemU7DQo+
ID4gPg0KPiA+ID4gSWYgdGhlIGZvcm11bGEgaXMgbm90IGNvcnJlY3QsIHlvdSBzaG91bGQgZml4
IHRoZSBmb3JtdWxhIG5vdCB3b3JrIGFyb3VuZC4NCj4gPiA+DQo+ID4gPiBSZWdhcmRzLA0KPiA+
ID4gQ2h1bi1LdWFuZy4NCj4gPg0KPiA+IGhvdyBhYm91dCB0aGlzOg0KPiA+IHRocmVzaG9sZCA9
IG1heCh3aWR0aCAqIGhlaWdodCAqIHZyZWZyZXNoICogNCAqIDcgLyAxMDAwMDAwLA0KPiA+IHJk
bWFfZmlmb19zaXplKTsNCj4gDQo+IFdoZW4gSSB1c2Ugd2lkdGggPSAxOTIwLCBoZWlnaHQgPSAx
MDgwLCB2cmVmcmVzaCA9IDYwIHRvIGNhbGN1bGF0ZSwgSQ0KPiBnZXQgdGhyZXNob2xkID0gMjk4
NS4NCj4gU28gSSB0aGluayBzZXQgdGhyZXNob2xkIHRvIGhhbGYgb2YgZmlmbyBzaXplIGlzIE9L
IGZvciBNQVhfV0lEVEgsDQo+IE1BWF9IRUlHSFQsIE1BWF9WUkVGUkVTSCAodGhlc2UgdGhyZWUg
bWF5IGJlIGRpZmZlcmVudCBpbiBlYWNoIFNvQykNCj4gDQo+IHRocmVzaG9sZCA9IFJETUFfRklG
T19QU0VVRE9fU0laRShyZG1hX2ZpZm9fc2l6ZSkgLyAyOw0KPiANCj4gQnV0IEkgd29ycnkgaGFs
ZiBmaWZvIHNpemUgaXMgdG9vIGJpZyBmb3Igc21hbGwgcmVzb2x1dGlvbiBhbmQgbGV0DQo+IHNt
YWxsIHJlc29sdXRpb24gdG9vIGVhc3kgdG8gdHJpZ2dlciBidXJzdCByZWFkIERSQU0uIFNvIGxl
dCB0aGUNCj4gZm9ybXVsYSB0byBiZSB0aGlzOg0KPiANCj4gdGhyZXNob2xkID0gUkRNQV9GSUZP
X1BTRVVET19TSVpFKHJkbWFfZmlmb19zaXplKSAqIHdpZHRoICogaGVpZ2h0ICoNCj4gdnJlZnJl
c2ggLyAyIC8gTUFYX1dJRFRIIC8gTUFYX0hFSUdIVCAvIE1BWF9WUkVGUkVTSDsNCj4gDQo+IEhv
dyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcz8NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3Vhbmcu
DQoNCmhvdyBhYm91dCByZW1vdmUgdGhpcyBmb3JtdWxhLCBhbmQgc2V0IHRocmVzaG9sZCA9IHJk
bWFfZmlmb19zaXplDQo+IA0KPiA+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiAgICAgICAgIHJlZyA9
IFJETUFfRklGT19VTkRFUkZMT1dfRU4gfA0KPiA+ID4gPiAgICAgICAgICAgICAgIFJETUFfRklG
T19QU0VVRE9fU0laRShyZG1hX2ZpZm9fc2l6ZSkgfA0KPiA+ID4gPiAgICAgICAgICAgICAgIFJE
TUFfT1VUUFVUX1ZBTElEX0ZJRk9fVEhSRVNIT0xEKHRocmVzaG9sZCk7DQo+ID4gPiA+IC0tDQo+
ID4gPiA+IDEuOC4xLjEuZGlydHkNCj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiA+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
DQo+ID4gPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiA+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0K
PiA+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
