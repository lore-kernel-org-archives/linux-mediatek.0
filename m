Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F45EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 05:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZYZ+KMM2LfQuvGO6fyjPZS1dwgLBfViY4qfCF+Nx7o=; b=Gf5LXA/gzfbiwI
	y4Jvn2fw1dJdFSiZGIF71F8AzwwPEJBb/q49BBZTrCHxHqbsVFi1Tllz0MX2VosKwbk1B0Ix4mBAT
	zml8V7Z2yn+4slY5Re4rHPzuv8P7BeFo2vRPHQYtOX30nSHEeQviglg1vP567chCujIfmMyTOamBK
	zQULZGgsIXgJJgVYpDk3IorBpkXk0mgg0phlBOSaEWO2yM0AfRsoLOGnmcz1Cu+bkV74sWA8lraVn
	qdXP7RC5eN7KzlA+9OSZKkw+eLm4ynTbSzDoNMtHy29vL7r7EVH49nrBvI9IsSMGL+zDkeS2NtNA2
	NpbgZEE/vLwQ5xbdGIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntjtB-00A0GE-L8; Wed, 25 May 2022 05:48:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntjsq-00A0Cw-EC; Wed, 25 May 2022 05:48:39 +0000
X-UUID: c318cd9ea0e44664b8c4530872fd701d-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:6e3aa34e-1968-47cd-b722-3b6d6534d9e7, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:6e316147-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: c318cd9ea0e44664b8c4530872fd701d-20220524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 57035083; Tue, 24 May 2022 22:48:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 22:47:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 13:47:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 May 2022 13:47:41 +0800
Message-ID: <eaed852506a753629d0d76334664c51d98477d14.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>
Date: Wed, 25 May 2022 13:47:41 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_224836_523290_730E46B2 
X-CRM114-Status: GOOD (  28.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEd1aWxsYXVtZToKCk9uIE1vbiwgMjAyMi0wNS0yMyBhdCAxMjo0NyArMDIwMCwgR3VpbGxh
dW1lIFJhbnF1ZXQgd3JvdGU6Cj4gRnJvbTogTWFya3VzIFNjaG5laWRlci1QYXJnbWFubiA8bXNw
QGJheWxpYnJlLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSBEaXNwbGF5UG9ydCBkcml2ZXIg
Zm9yIHRoZSBNZWRpYXRlayBtdDgxOTUgU29DLgo+IAo+IEl0IHN1cHBvcnRzIHRoZSBtdDgxOTUs
IHRoZSBlbWJlZGRlZCBEaXNwbGF5UG9ydCB1bml0cy4gSXQgb2ZmZXJzCj4gRGlzcGxheVBvcnQg
MS40IHdpdGggdXAgdG8gNCBsYW5lcy4KPiAKPiBUaGUgZHJpdmVyIGNyZWF0ZXMgYSBjaGlsZCBk
ZXZpY2UgZm9yIHRoZSBwaHkuIFRoZSBjaGlsZCBkZXZpY2Ugd2lsbAo+IG5ldmVyIGV4aXN0IHdp
dGhvdXQgdGhlIHBhcmVudCBiZWluZyBhY3RpdmUuIEFzIHRoZXkgYXJlIHNoYXJpbmcgYQo+IHJl
Z2lzdGVyIHJhbmdlLCB0aGUgcGFyZW50IHBhc3NlcyBhIHJlZ21hcCBwb2ludGVyIHRvIHRoZSBj
aGlsZCBzbwo+IHRoYXQKPiBib3RoIGNhbiB3b3JrIHdpdGggdGhlIHNhbWUgcmVnaXN0ZXIgcmFu
Z2UuIFRoZSBwaHkgZHJpdmVyIHNldHMKPiBkZXZpY2UKPiBkYXRhIHRoYXQgaXMgcmVhZCBieSB0
aGUgcGFyZW50IHRvIGdldCB0aGUgcGh5IGRldmljZSB0aGF0IGNhbiBiZQo+IHVzZWQKPiB0byBj
b250cm9sIHRoZSBwaHkgcHJvcGVydGllcy4KPiAKPiBUaGlzIGRyaXZlciBpcyBiYXNlZCBvbiBh
biBpbml0aWFsIHZlcnNpb24gYnkKPiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20+Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBTY2huZWlkZXItUGFyZ21hbm4gPG1z
cEBiYXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJhbnF1ZXQgPGdyYW5x
dWV0QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgCgpbc25pcF0KCj4gKwo+ICtzdGF0aWMgaXJxcmV0
dXJuX3QgbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoaW50IGhwZCwgdm9pZCAqZGV2KQoKSSBkb24n
dCBoYXZlIGEgRFAgc3BlYy4gSSBmaW5kIG9uZSBpbiBbMV0gYnV0IEknbSBub3Qgc3VyZSBpdCdz
IHJlYWwKc3BlYyBvciBub3QuIElmIGl0J3MgcmVhbCwgaW4gc2VjdGlvbiAzLjEuMy4yLCBpdCBk
ZXNjcmliZToKCjMuMS4zLjIgSG90IFBsdWcvVW5wbHVnIERldGVjdGlvbgpPbmUgc2lnbmFsIChI
UEQpIGlzIHVzZWQgYnkgYSBkZXZpY2UgKGFuIFVwc3RyZWFtIGRldmljZSkgdG8gZGV0ZWN0CnRo
YXQgYSBEb3duc3RyZWFtIHBvcnQgb24gdGhlIGRldmljZSBoYXMgYmVlbiBjb25uZWN0ZWQgdG8g
YW5vdGhlcgpkZXZpY2UgKHRoZSBEb3duc3RyZWFtIGRldmljZSkuIEltcGxlbWVudGF0aW9uIG9m
IEhQRCBpcyBvcHRpb25hbCBmb3IKYW4gZW1iZWRkZWQgbGluayBjb25maWd1cmF0aW9uLiBBdCBs
ZWFzdCBhIOKAnHRyaWNrbGUgcG93ZXLigJ0gbXVzdCBiZQpwcmVzZW50IGJvdGggaW4gdGhlIFVw
c3RyZWFtIGFuZCBEb3duc3RyZWFtIGRldmljZXMgZm9yIGEgSG90IFBsdWcKZXZlbnQgdG8gYmUg
ZGV0ZWN0ZWQuIAoKSSBmb2N1cyBvbiB0aGUgc3RhdGVtZW50ICJJbXBsZW1lbnRhdGlvbiBvZiBI
UEQgaXMgb3B0aW9uYWwgZm9yIGFuCmVtYmVkZGVkIGxpbmsgY29uZmlndXJhdGlvbiIuIEknbSBu
b3Qgc3VyZSB3aGF0IGRvZXMgJ29wdGlvbmFsJyBtZWFuLgpEb2VzIGl0IG1lYW4gZURQIHBhbmVs
IHdpdGhvdXQgSFBEIHNpZ25hbCBpcyBwb3NzaWJsZT8gSWYgc28sIEkgdGhpbmsKZHJpdmVyIHNo
b3VsZCBzdXBwb3J0IGVEUCBwYW5lbCB3aXRob3V0IEhQRCBzaWduYWwuIE1heWJlIEkKbWlzdW5k
ZXJzdGFuZGluZyB0aGlzIHNwZWMuIFBsZWFzZSBleHBsYWluIGZvciBtZS4KClJlZ2FyZHMsCkNL
CgoKWzFdIGh0dHBzOi8vZ2xlbndpbmcuZ2l0aHViLmlvL2RvY3MvRFAtMS4yLnBkZgoKPiArewo+
ICsJc3RydWN0IG10a19kcCAqbXRrX2RwID0gZGV2Owo+ICsJaW50IGV2ZW50Owo+ICsJdTggYnVm
W0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSA9IHt9Owo+ICsKPiArCWV2ZW50ID0gbXRrX2RwX3BsdWdf
c3RhdGUobXRrX2RwKSA/IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkCj4gOgo+ICsJCQkJCQkg
IGNvbm5lY3Rvcl9zdGF0dXNfZGlzYwo+IG9ubmVjdGVkOwo+ICsKPiArCWlmIChldmVudCA8IDAp
Cj4gKwkJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICsKPiArCWlmIChtdGtfZHAtPmRybV9kZXYpIHsK
PiArCQlkZXZfaW5mbyhtdGtfZHAtPmRldiwgImRybV9oZWxwZXJfaHBkX2lycV9ldmVudFxuIik7
Cj4gKwkJZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KG10a19kcC0+YnJpZGdlLmRldik7Cj4gKwl9
Cj4gKwo+ICsJaWYgKG10a19kcC0+dHJhaW5faW5mby5jYWJsZV9zdGF0ZV9jaGFuZ2UpIHsKPiAr
CQltdGtfZHAtPnRyYWluX2luZm8uY2FibGVfc3RhdGVfY2hhbmdlID0gZmFsc2U7Cj4gKwo+ICsJ
CW10a19kcC0+dHJhaW5fc3RhdGUgPSBNVEtfRFBfVFJBSU5fU1RBVEVfU1RBUlRVUDsKPiArCj4g
KwkJaWYgKCFtdGtfZHAtPnRyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbiB8fAo+ICsJCSAgICAh
bXRrX2RwX3BsdWdfc3RhdGUobXRrX2RwKSkgewo+ICsJCQltdGtfZHBfdmlkZW9fbXV0ZShtdGtf
ZHAsIHRydWUpOwo+ICsKPiArCQkJbXRrX2RwX2luaXRpYWxpemVfcHJpdl9kYXRhKG10a19kcCk7
Cj4gKwkJCW10a19kcF9zZXRfaWRsZV9wYXR0ZXJuKG10a19kcCwgdHJ1ZSk7Cj4gKwkJCWlmICht
dGtfZHAtPmhhc19mZWMpCj4gKwkJCQltdGtfZHBfZmVjX2VuYWJsZShtdGtfZHAsIGZhbHNlKTsK
PiArCj4gKwkJCW10a19kcF91cGRhdGVfYml0cyhtdGtfZHAsCj4gTVRLX0RQX1RPUF9QV1JfU1RB
VEUsCj4gKwkJCQkJICAgRFBfUFdSX1NUQVRFX0JBTkRHQVBfVFBMTCwKPiArCQkJCQkgICBEUF9Q
V1JfU1RBVEVfTUFTSyk7Cj4gKwkJfSBlbHNlIHsKPiArCQkJbXRrX2RwX3VwZGF0ZV9iaXRzKG10
a19kcCwKPiBNVEtfRFBfVE9QX1BXUl9TVEFURSwKPiArCQkJCQkgICBEUF9QV1JfU1RBVEVfQkFO
REdBUF9UUExMX0xBCj4gTkUsCj4gKwkJCQkJICAgRFBfUFdSX1NUQVRFX01BU0spOwo+ICsJCQlk
cm1fZHBfcmVhZF9kcGNkX2NhcHMoJm10a19kcC0+YXV4LCBidWYpOwo+ICsJCQltdGtfZHAtPnRy
YWluX2luZm8ubGlua19yYXRlID0KPiArCQkJCW1pbl90KGludCwgbXRrX2RwLT5tYXhfbGlua3Jh
dGUsCj4gKwkJCQkgICAgICBidWZbbXRrX2RwLT5tYXhfbGlua3JhdGVdKTsKPiArCQkJbXRrX2Rw
LT50cmFpbl9pbmZvLmxhbmVfY291bnQgPQo+ICsJCQkJbWluX3QoaW50LCBtdGtfZHAtPm1heF9s
YW5lcywKPiArCQkJCSAgICAgIGRybV9kcF9tYXhfbGFuZV9jb3VudChidWYpKTsKPiArCQl9Cj4g
Kwl9Cj4gKwo+ICsJaWYgKG10a19kcC0+dHJhaW5faW5mby5pcnFfc3RhdHVzICYgTVRLX0RQX0hQ
RF9JTlRFUlJVUFQpIHsKPiArCQlkZXZfZGJnKG10a19kcC0+ZGV2LCAiTVRLX0RQX0hQRF9JTlRF
UlJVUFRcbiIpOwo+ICsJCW10a19kcC0+dHJhaW5faW5mby5pcnFfc3RhdHVzICY9IH5NVEtfRFBf
SFBEX0lOVEVSUlVQVDsKPiArCQltdGtfZHBfaHBkX3NpbmtfZXZlbnQobXRrX2RwKTsKPiArCX0K
PiArCj4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gK30KPiArCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
