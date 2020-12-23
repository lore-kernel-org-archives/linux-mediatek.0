Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0322CC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:16:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE83A222BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE83A222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17h1XWkzP+yQ/FcmL7B5f9PcNn/8c98rierymg1vVd8=; b=yywi6qVUl5sIygfjfpeQQOCTtV
	ovkrm7RN0AUgvqCkKxgd8bDWr5H+pD8AlKkcD+FdeNgQG5H5wEGwO0Jr++dQrZDncm75pQ8X/2opH
	laUJ/i0Lov2hk++ounD8Q2rg1Kf1cuSsYtucu6etJKiZsSBFOxJ2RX55wm+Ki/tkh6tS+dRHyJ4js
	O6sfDq3OFzNu20Ffoa6kThctVOrNvCatrwFK/qzZFKRH/t2K+0DWWW4yo4uVQrUnHUveQrGrq6KJ3
	67TvHlKSpK+OdlRCaTZYWfKj6lKGmLgj11uzXLtf06G7mtf1hfJqAShHyUGG0ci+VQfV99Wmyatt1
	qv4v8LYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krslB-0008FK-SA; Wed, 23 Dec 2020 01:16:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krsl6-0008E2-9X; Wed, 23 Dec 2020 01:16:10 +0000
X-UUID: 207f5658c9e7489abadfcfc99663bc98-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=1JreIqPgO/MgWqYvXss3grHwTj5L9rm69LlEytrJzyI=; 
 b=ApMCvFq1c4/t7OSNaV282gBmcWhDTjOjahU8xH/72bco1gWwzDD0r8Bvk+nXElvwdCMl7QGyCDNNIXxlB5V8sXw1/llJZQDBw4QGmS+Sb+Au1DdZ6TizEug4WhyShMJBL44knEsjvqxoUFG2Gw5dJjwvXU48GF96ReM9fKVKLX8=;
X-UUID: 207f5658c9e7489abadfcfc99663bc98-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 476145436; Tue, 22 Dec 2020 17:16:05 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:16:03 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:15:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:15:58 +0800
Message-ID: <1608686161.18252.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 01/17] dt-bindings: mediatek: add description for
 postmask
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:16:01 +0800
In-Reply-To: <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_201608_545065_835C7045 
X-CRM114-Status: GOOD (  19.37  )
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

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDIyOjQ5ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTLlr6vpgZPv
vJoNCj4gPg0KPiA+IGFkZCBkZXNjcmlwdGlvbiBmb3IgcG9zdG1hc2sNCj4gDQo+IFdoYXQgaXMg
cG9zdG1hc2s/IEkgZ29vZ2xlIGl0IGFuZCBmaW5kIGEgcG9zdG1hc2sgRUNPLiBTbyBpdCBpcyBw
b3N0bWFzayBFQ08/DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCg0KaXQgaXMg
dXNlZCBjb250cm9sIHJvdW5kIGNvcm5lciBmb3IgZGlzcGxheSBmcmFtZQ0KDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNw
LnR4dA0KPiA+IGluZGV4IDVjYTY5M2EuLjE5NzJmYTcgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dA0KPiA+IEBAIC0zNyw2ICszNyw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOg0KPiA+ICAgICAgICAgIm1lZGlh
dGVrLDxjaGlwPi1kaXNwLWFhbCIgICAgICAgICAgICAgIC0gYWRhcHRpdmUgYW1iaWVudCBsaWdo
dCBjb250cm9sbGVyDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiICAg
ICAgICAgICAgLSBnYW1tYSBjb3JyZWN0aW9uDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+
LWRpc3AtbWVyZ2UiICAgICAgICAgICAgLSBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJETUEgc291
cmNlcw0KPiA+ICsgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXBvc3RtYXNrIiAgICAgICAg
IC0gcG9zdCBtYXNrDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiICAg
ICAgICAgICAgLSBzcGxpdCBzdHJlYW0gdG8gdHdvIGVuY29kZXJzDQo+ID4gICAgICAgICAibWVk
aWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIgICAgICAgICAgICAgLSBkYXRhIGNvbXByZXNzaW9uIGVu
Z2luZQ0KPiA+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kc2kiICAgICAgICAgICAgICAgICAg
IC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0DQo+ID4gLS0NCj4gPiAxLjgu
MS4xLmRpcnR5DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
