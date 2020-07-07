Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D26C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 00:47:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D67C206E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 00:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+rf2S+w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eIPP6Cei"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D67C206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pEv5we/olnUvXG5V1zphiQPmCV/B4boUhBNpJbZJSXI=; b=b+rf2S+wuRJlxfArtGmw1LZFO
	yRnYClMvP+/msNqf+9/LANgtsjQpOBvF8EIsvNCFIyyuX1JWGzQRRZI1R8ByjjXF1aJQ5mj5xGVJp
	piGYspX6QTPcJ9wVjMww+RplMyzgv6iRuZkkXCh4aOX/mdtyWRPsrQkvTF4rKlTQ7EQ0fLwBh0FDp
	4aM7WHD40op9EQCFrlpzAsu8leKHy3iSlev74Nv6Ky8YJ1mUEVdZKMgW3pqpBBZ+xFpBBTsxLj02w
	ffgvurYD7zH6v79c+xxhvxmzstREN41bzxHGmNnpAoPaiDpc26i2w5TQ4xK85elNJSpsQfQR7owX+
	j5W+F7wbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsblK-0003uN-6P; Tue, 07 Jul 2020 00:47:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsblD-0003su-Pr; Tue, 07 Jul 2020 00:47:01 +0000
X-UUID: f122e6fb274a4e45a6f2dc4261ed89f2-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9+BgWtK/CBgwcVCXkyOr08QW0zYWgf+PY9UfH+ilC/c=; 
 b=eIPP6CeiBqUY3MjxsvcdUxAs793McOfqwrkR5JxDCrg3o98h9IItrFvmUKFC1606+Bc+midpjM4qzR2uwPyIwwYFbWPmUZXh0oIa/AoeEQcl6gK81ba1ml83xRwRK3D1Lfc+ZXVw9ErpObBAUeVzDnctKjjW/mJ2ty1y/gMRMOs=;
X-UUID: f122e6fb274a4e45a6f2dc4261ed89f2-20200706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1451584018; Mon, 06 Jul 2020 16:46:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 17:46:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 08:46:39 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 08:46:39 +0800
Message-ID: <1594082800.24876.0.camel@mtkswgap22>
Subject: Re: [PATCH v2 8/8] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Jul 2020 08:46:40 +0800
In-Reply-To: <CAAOTY_-5um+X=cS3rkuN7YHycK2AyJsovumCQ4t+dbwXw62uAQ@mail.gmail.com>
References: <1593931715-32761-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1593931715-32761-9-git-send-email-dennis-yc.hsieh@mediatek.com>
 <CAAOTY_-5um+X=cS3rkuN7YHycK2AyJsovumCQ4t+dbwXw62uAQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_204700_047764_179549B2 
X-CRM114-Status: GOOD (  26.58  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, wsd_upstream <wsd_upstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ0ssDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50Lg0KDQpPbiBUdWUsIDIwMjAtMDctMDcg
YXQgMDc6NDYgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBEZW5uaXM6DQo+IA0K
PiBEZW5uaXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2llaEBtZWRpYXRlay5jb20+IOaWvCAyMDIw
5bm0N+aciDbml6Ug6YCx5LiAIOS4i+WNiDM6MjDlr6vpgZPvvJoNCj4gPg0KPiA+IEFkZCBjbGVh
ciBwYXJhbWV0ZXIgdG8gbGV0IGNsaWVudCBkZWNpZGUgaWYNCj4gPiBldmVudCBzaG91bGQgYmUg
Y2xlYXIgdG8gMCBhZnRlciBHQ0UgcmVjZWl2ZSBpdC4NCj4gPg0KPiA+IEZpeGVzOiAyZjk2NWJl
N2Y5MDA4ICgiZHJtL21lZGlhdGVrOiBhcHBseSBDTURRIGNvbnRyb2wgZmxvdyIpDQo+IA0KPiBJ
IHRoaW5rIHRoaXMgcGF0Y2ggaW5jbHVkZSB0d28gdGhpbmdzLCBvbmUgaXMgYnVnIGZpeCwgYW5v
dGhlciBpcw0KPiBjaGFuZ2luZyBpbnRlcmZhY2UuDQo+IGJlbG93IGlzIHRoZSBidWcgZml4IHBh
cnQuDQo+IA0KPiAtI2RlZmluZSBDTURRX1dGRV9PUFRJT04gICAgICAgICAgICAgICAgICAgICAg
ICAoQ01EUV9XRkVfVVBEQVRFIHwNCj4gQ01EUV9XRkVfV0FJVCB8IFwNCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIENNRFFfV0ZFX1dBSVRfVkFMVUUpDQo+ICsjZGVm
aW5lIENNRFFfV0ZFX09QVElPTiAgICAgICAgICAgICAgICAgICAgICAgIChDTURRX1dGRV9XQUlU
IHwNCj4gQ01EUV9XRkVfV0FJVF9WQUxVRSkNCj4gDQo+IHRoZSBvdGhlciBpcyBjaGFuZ2luZyBp
bnRlcmZhY2UgcGFydC4gU28gdGhpcyBwYXRjaCBzaG91bGQgYmUgYnJva2VuDQo+IGludG8gdHdv
IHBhdGNoZXMuDQoNCm9rIEknbGwgYnJlYWsgaW50byB0d28gcGF0Y2hlcw0KDQoNClJlZ2FyZHMs
DQpEZW5uaXMNCg0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogRGVubmlzIFlDIEhzaWVoIDxkZW5uaXMteWMuaHNpZWhAbWVkaWF0ZWsuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgIHwgICAgMiArLQ0KPiA+
ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyAgIHwgICAgNSArKystLQ0K
PiA+ICBpbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIHwgICAgMyArLS0N
Cj4gPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCAgICB8ICAgIDUgKysr
LS0NCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gaW5k
ZXggZWM2YzlmZmJmMzVlLi5iYTZjZjk1NmIyMzkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gQEAgLTQ5MCw3ICs0OTAsNyBAQCBzdGF0aWMg
dm9pZCBtdGtfZHJtX2NydGNfaHdfY29uZmlnKHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRj
KQ0KPiA+ICAgICAgICAgICAgICAgICBtYm94X2ZsdXNoKG10a19jcnRjLT5jbWRxX2NsaWVudC0+
Y2hhbiwgMjAwMCk7DQo+ID4gICAgICAgICAgICAgICAgIGNtZHFfaGFuZGxlID0gY21kcV9wa3Rf
Y3JlYXRlKG10a19jcnRjLT5jbWRxX2NsaWVudCwgUEFHRV9TSVpFKTsNCj4gPiAgICAgICAgICAg
ICAgICAgY21kcV9wa3RfY2xlYXJfZXZlbnQoY21kcV9oYW5kbGUsIG10a19jcnRjLT5jbWRxX2V2
ZW50KTsNCj4gPiAtICAgICAgICAgICAgICAgY21kcV9wa3Rfd2ZlKGNtZHFfaGFuZGxlLCBtdGtf
Y3J0Yy0+Y21kcV9ldmVudCk7DQo+ID4gKyAgICAgICAgICAgICAgIGNtZHFfcGt0X3dmZShjbWRx
X2hhbmRsZSwgbXRrX2NydGMtPmNtZHFfZXZlbnQsIGZhbHNlKTsNCj4gPiAgICAgICAgICAgICAg
ICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRjLCBjbWRxX2hhbmRsZSk7DQo+ID4gICAgICAgICAg
ICAgICAgIGNtZHFfcGt0X2ZpbmFsaXplKGNtZHFfaGFuZGxlKTsNCj4gPiAgICAgICAgICAgICAg
ICAgY21kcV9wa3RfZmx1c2hfYXN5bmMoY21kcV9oYW5kbGUsIGRkcF9jbWRxX2NiLCBjbWRxX2hh
bmRsZSk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhl
bHBlci5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gPiBpbmRl
eCBkNTVkYzMyOTYxMDUuLjUwNTY1MWIwZDcxNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ay1jbWRxLWhlbHBlci5jDQo+ID4gQEAgLTMxNiwxNSArMzE2LDE2IEBAIGludCBjbWRx
X3BrdF93cml0ZV9zX21hc2tfdmFsdWUoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IGhpZ2hfYWRk
cl9yZWdfaWR4LA0KPiA+ICB9DQo+ID4gIEVYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfc19t
YXNrX3ZhbHVlKTsNCj4gPg0KPiA+IC1pbnQgY21kcV9wa3Rfd2ZlKHN0cnVjdCBjbWRxX3BrdCAq
cGt0LCB1MTYgZXZlbnQpDQo+ID4gK2ludCBjbWRxX3BrdF93ZmUoc3RydWN0IGNtZHFfcGt0ICpw
a3QsIHUxNiBldmVudCwgYm9vbCBjbGVhcikNCj4gPiAgew0KPiA+ICAgICAgICAgc3RydWN0IGNt
ZHFfaW5zdHJ1Y3Rpb24gaW5zdCA9IHsgezB9IH07DQo+ID4gKyAgICAgICB1MzIgY2xlYXJfb3B0
aW9uID0gY2xlYXIgPyBDTURRX1dGRV9VUERBVEUgOiAwOw0KPiA+DQo+ID4gICAgICAgICBpZiAo
ZXZlbnQgPj0gQ01EUV9NQVhfRVZFTlQpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiA+DQo+ID4gICAgICAgICBpbnN0Lm9wID0gQ01EUV9DT0RFX1dGRTsNCj4gPiAtICAg
ICAgIGluc3QudmFsdWUgPSBDTURRX1dGRV9PUFRJT047DQo+ID4gKyAgICAgICBpbnN0LnZhbHVl
ID0gQ01EUV9XRkVfT1BUSU9OIHwgY2xlYXJfb3B0aW9uOw0KPiA+ICAgICAgICAgaW5zdC5ldmVu
dCA9IGV2ZW50Ow0KPiA+DQo+ID4gICAgICAgICByZXR1cm4gY21kcV9wa3RfYXBwZW5kX2NvbW1h
bmQocGt0LCBpbnN0KTsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tYWlsYm94L210
ay1jbWRxLW1haWxib3guaCBiL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmgNCj4gPiBpbmRleCBlZmJkOGE5ZWIyZDEuLmQ1YTk4M2Q2NWYwNSAxMDA2NDQNCj4gPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQo+ID4gKysrIGIvaW5j
bHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaA0KPiA+IEBAIC0yOCw4ICsyOCw3
IEBADQo+ID4gICAqIGJpdCAxNi0yNzogdXBkYXRlIHZhbHVlDQo+ID4gICAqIGJpdCAzMTogMSAt
IHVwZGF0ZSwgMCAtIG5vIHVwZGF0ZQ0KPiA+ICAgKi8NCj4gPiAtI2RlZmluZSBDTURRX1dGRV9P
UFRJT04gICAgICAgICAgICAgICAgICAgICAgICAoQ01EUV9XRkVfVVBEQVRFIHwgQ01EUV9XRkVf
V0FJVCB8IFwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ01E
UV9XRkVfV0FJVF9WQUxVRSkNCj4gPiArI2RlZmluZSBDTURRX1dGRV9PUFRJT04gICAgICAgICAg
ICAgICAgICAgICAgICAoQ01EUV9XRkVfV0FJVCB8IENNRFFfV0ZFX1dBSVRfVkFMVUUpDQo+ID4N
Cj4gPiAgLyoqIGNtZHEgZXZlbnQgbWF4aW11bSAqLw0KPiA+ICAjZGVmaW5lIENNRFFfTUFYX0VW
RU5UICAgICAgICAgICAgICAgICAweDNmZg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3NvYy9tZWRpYXRlay9tdGstY21kcS5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LWNtZHEuaA0KPiA+IGluZGV4IDM0MzU0ZTk1MmY2MC4uOTYwNzA0ZDc1OTk0IDEwMDY0NA0KPiA+
IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgNCj4gPiArKysgYi9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQo+ID4gQEAgLTE4MiwxMSArMTgy
LDEyIEBAIGludCBjbWRxX3BrdF93cml0ZV9zX21hc2tfdmFsdWUoc3RydWN0IGNtZHFfcGt0ICpw
a3QsIHU4IGhpZ2hfYWRkcl9yZWdfaWR4LA0KPiA+ICAvKioNCj4gPiAgICogY21kcV9wa3Rfd2Zl
KCkgLSBhcHBlbmQgd2FpdCBmb3IgZXZlbnQgY29tbWFuZCB0byB0aGUgQ01EUSBwYWNrZXQNCj4g
PiAgICogQHBrdDogICAgICAgdGhlIENNRFEgcGFja2V0DQo+ID4gLSAqIEBldmVudDogICAgIHRo
ZSBkZXNpcmVkIGV2ZW50IHR5cGUgdG8gIndhaXQgYW5kIENMRUFSIg0KPiA+ICsgKiBAZXZlbnQ6
ICAgICB0aGUgZGVzaXJlZCBldmVudCB0eXBlIHRvIHdhaXQNCj4gPiArICogQGNsZWFyOiAgICAg
Y2xlYXIgZXZlbnQgb3Igbm90IGFmdGVyIGV2ZW50IGFycml2ZQ0KPiA+ICAgKg0KPiA+ICAgKiBS
ZXR1cm46IDAgZm9yIHN1Y2Nlc3M7IGVsc2UgdGhlIGVycm9yIGNvZGUgaXMgcmV0dXJuZWQNCj4g
PiAgICovDQo+ID4gLWludCBjbWRxX3BrdF93ZmUoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHUxNiBl
dmVudCk7DQo+ID4gK2ludCBjbWRxX3BrdF93ZmUoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHUxNiBl
dmVudCwgYm9vbCBjbGVhcik7DQo+ID4NCj4gPiAgLyoqDQo+ID4gICAqIGNtZHFfcGt0X2NsZWFy
X2V2ZW50KCkgLSBhcHBlbmQgY2xlYXIgZXZlbnQgY29tbWFuZCB0byB0aGUgQ01EUSBwYWNrZXQN
Cj4gPiAtLQ0KPiA+IDEuNy45LjUNCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
X187ISFDVFJOS0E5d01nMEFSYnchd24wS1BpWWFHSnhmWjNPczJMZWF2dXZCWHRoM0hVZWpuMXNO
aGk4X1duVmdSX2pUeWZtTGdvX2tCYkdIcFRGMFVxb0RRUSQgDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
