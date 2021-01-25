Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B166C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 06:30:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDF2206D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 06:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDF2206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yAqsPYIWMO13UwicAYN/HUlkoUTmtYqiFgwjpBSGocw=; b=ozhbLtjUNisngNzq3EEKEN4gl
	HK4USfO1tQ+1CrckFzbfpyNJ/lzZ6rPA4QQ4n2gqIg1WGYdY7QWLgYbG3palK9K8nDodP/P4f61IU
	CkQXotVqPQD7VqLZ80W+2d6/+VaKYvmowEac66qutuvPDG2Ix07LwkhtkjFKiXYnYIOnCVqKRGpIh
	lLJYBuv3jQ3lDbLpUrjqC6c+BSPG3FeO024/zLg9XEc/1BRzbgWRZROLRgOgZp36hrE5WbEm63Epd
	G0SaDcW4PwpRvxGCPOJNfxUqM7aLcljYZlC8E7a/Fn+gDWAL6NKv8eXYcMsyOWST4K0EJ1q8oYXUM
	5jfqFKAwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3vOV-0001es-Ll; Mon, 25 Jan 2021 06:30:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3vOT-0001eB-Fy; Mon, 25 Jan 2021 06:30:34 +0000
X-UUID: d879885b058542538306b9f6fdd4a335-20210124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RkBjNee7qodbBjXWytdsq3tw/Ruzw7CJns/vlQiqKFU=; 
 b=dGpOYdpYECfL8LZ64VOtCBZ+JPffM3Yau77hC7XAdz0QSDcg8G0M42c8dfj4z9ORACCfKdFQPvZmZXJULKeCzcQD2Vk3WYzUGhZBivSeL6oR6Rri6KRNf//gdVQKLXhwFWMLLKYfr4uQCQsrsujB7sCJFqLB1GLq9gdvBPzcJu8=;
X-UUID: d879885b058542538306b9f6fdd4a335-20210124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 23982719; Sun, 24 Jan 2021 22:30:30 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Jan 2021 22:21:52 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Jan 2021 14:21:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Jan 2021 14:21:48 +0800
Message-ID: <1611555708.3905.5.camel@mhfsdcap03>
Subject: Re: [PATCH next v2 03/17] dt-bindings: phy: mediatek: dsi-phy:
 modify compatible dependence
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 25 Jan 2021 14:21:48 +0800
In-Reply-To: <CAAOTY_8X35EpvLiSOuNdj4dVu7KBocw9mhaKG4TJy24LizvHNg@mail.gmail.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
 <20210122120323.4337-3-chunfeng.yun@mediatek.com>
 <CAAOTY__O=z-AOo1RCRGfJYuSsXs1cUZgWFaTQz_3W_Tj=CeFBQ@mail.gmail.com>
 <CAAOTY_8X35EpvLiSOuNdj4dVu7KBocw9mhaKG4TJy24LizvHNg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 33DF050E4937CAA986E03A517E71BC2F5B0404FC0D6422DC1121661C8FF5150C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_013033_689825_75D03F9D 
X-CRM114-Status: GOOD (  19.22  )
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
Cc: DTML <devicetree@vger.kernel.org>, Min Guo <min.guo@mediatek.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIxLTAxLTI0IGF0IDEyOjU2ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bmZlbmc6DQo+IA0KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVs
Lm9yZz4g5pa8IDIwMjHlubQx5pyIMjTml6Ug6YCx5pelIOS4i+WNiDEyOjQ35a+r6YGT77yaDQo+
ID4NCj4gPiBIaSwgQ2h1bmZlbmc6DQo+ID4NCj4gPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1
bkBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0MeaciDIy5pelIOmAseS6lCDkuIvljYg4OjA05a+r
6YGT77yaDQo+ID4gPg0KPiA+ID4gVGhlIGNvbXBhdGlsYmUgIm1lZGlhdGVrLG10NzYyMy1taXBp
LXR4IiBpcyBub3Qgc3VwcG9ydGVkIGluIGRyaXZlciwNCj4gPiA+IGFuZCBpbiBmYWN0IHVzZXMg
Im1lZGlhdGVrLG10MjcwMS1taXBpLXR4IiBpbnN0ZWFkIG9uIE1UNzYyMywgc28gY2hhbmdlcw0K
PiA+ID4gdGhlIGNvbXBhdGlibGUgaXRlbXMgdG8gbWFrZSBkZXBlbmRlbmNlIGNsZWFyLg0KPiA+
DQo+ID4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
Pg0KPiANCj4gU29ycnksIHBsZWFzZSByZW1vdmUgbXkgcmV2aWV3ZWQtYnkgdGFnLiBXZSBzaG91
bGQgbm90IGRlZmluZSB0aGUNCj4gYmluZGluZyBkb2N1bWVudCBhY2NvcmRpbmcgdG8gdGhlIGlt
cGxlbWVudGF0aW9uIG9mIGRyaXZlci4gV2UgZGVmaW5lDQo+IHRoZSBiaW5kaW5nIGRvY3VtZW50
IGFjY29yZGluZyB0byB0aGUgaGFyZHdhcmUuIFNvIHRoZSBkZXNjcmlwdGlvbg0KPiBzaG91bGQg
YmUgbGlrZSAibXQ3NjIzLW1pcGktdHggaXMgY29tcGF0aWJsZSB0byBtdDI3MDEtbWlwaS10eCIu
DQpPaywgd2lsbCBtYWtlIHRoZSBkZXNjcmlwdGlvbiBjbGVhcmVyDQoNCj4gDQo+IFJlZ2FyZHMs
DQo+IENodW4tS3VhbmcuDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4gQ2M6IENodW4tS3VhbmcgSHUg
PGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0KPiA+ID4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFi
ZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNo
dW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IHYyOiBzZXBhcmF0ZSB0
d28gcGF0Y2hlcyBzdWdnZXN0ZWQgYnkgQ0sNCj4gPiA+IC0tLQ0KPiA+ID4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwgICB8IDEzICsrKysrKysrLS0t
LS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQo+ID4gPiBpbmRleCA3MWQ0YWNl
YTFmNjYuLjZlNGQ3OTVmOWIwMiAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQo+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFt
bA0KPiA+ID4gQEAgLTE5LDExICsxOSwxNCBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICBwYXR0
ZXJuOiAiXmRzaS1waHlAWzAtOWEtZl0rJCINCj4gPiA+DQo+ID4gPiAgICBjb21wYXRpYmxlOg0K
PiA+ID4gLSAgICBlbnVtOg0KPiA+ID4gLSAgICAgIC0gbWVkaWF0ZWssbXQyNzAxLW1pcGktdHgN
Cj4gPiA+IC0gICAgICAtIG1lZGlhdGVrLG10NzYyMy1taXBpLXR4DQo+ID4gPiAtICAgICAgLSBt
ZWRpYXRlayxtdDgxNzMtbWlwaS10eA0KPiA+ID4gLSAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLW1p
cGktdHgNCj4gPiA+ICsgICAgb25lT2Y6DQo+ID4gPiArICAgICAgLSBpdGVtczoNCj4gPiA+ICsg
ICAgICAgICAgLSBlbnVtOg0KPiA+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDc2MjMt
bWlwaS10eA0KPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDI3MDEtbWlwaS10
eA0KPiA+ID4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10MjcwMS1taXBpLXR4DQo+ID4gPiAr
ICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTczLW1pcGktdHgNCj4gPiA+ICsgICAgICAtIGNv
bnN0OiBtZWRpYXRlayxtdDgxODMtbWlwaS10eA0KPiA+ID4NCj4gPiA+ICAgIHJlZzoNCj4gPiA+
ICAgICAgbWF4SXRlbXM6IDENCj4gPiA+IC0tDQo+ID4gPiAyLjE4LjANCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
