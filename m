Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D7FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLKyFCJzv2g5vSYMkhQieGyHcIEcdbrC+0kA7RqT8R8=; b=YsC9fl3rA2MmI+
	BSVWSQR5tj4Iq0etGxq2KNe2rZWUMXwhJ8h+jKzsAWIB5AzKl0/wau4Yn6MUPTy72dl9hGgsb7cyl
	jYC08g/zF1UNgVSpYjm8vctbP99DRAJG89NX5fxnWPjzrPIE/7/43ZG6Asb16lWmjCIFpX2IuSg09
	+RhcIQrHgHUdGNiGvt+NOcB2J+9H9kUuHoAkQhTMgtiskwOBdyhIki3ZKf2XW5Mg6eXcMVeBchfw1
	D+SkvccZq9yZlFz7c5dn5yhMoiniKJgunzDecKTVq2D5dzBO1j5yoXDtoCnBgEFmiWBmcD5GmCd06
	azcPte5PP8gzXNxBbHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrmt-00EWe4-8V; Wed, 23 Feb 2022 13:34:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrme-00EWZH-CK; Wed, 23 Feb 2022 13:34:22 +0000
X-UUID: 6949911f269c4571ab72d50bae958ef5-20220223
X-UUID: 6949911f269c4571ab72d50bae958ef5-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1343886854; Wed, 23 Feb 2022 06:34:16 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:24:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 21:24:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:24:12 +0800
Message-ID: <ef364c56deef3cc20d7d7d9ca6c568c0612c7a2a.camel@mediatek.com>
Subject: Re: [PATCH v2 06/23] arm64: dts: mt8192: Add usb-phy node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:24:12 +0800
In-Reply-To: <20220222201034.pb36pfrgujushsge@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-7-allen-kh.cheng@mediatek.com>
 <20220222201034.pb36pfrgujushsge@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_053420_447430_E04492F2 
X-CRM114-Status: GOOD (  19.50  )
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

T24gVHVlLCAyMDIyLTAyLTIyIGF0IDE1OjEwIC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjoxNlBNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCB4aGNpIG5vZGUgZm9yIG10ODE5MiBTb0MuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRl
ay5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5k
dHNpIHwgMjUKPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLmR0c2kKPiA+IGluZGV4IDYxYWFkZDdiZDM5Ny4uY2UxOGQ2OTIxNzVmIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gQEAgLTg3
NSw2ICs4NzUsMzEgQEAKPiA+ICAJCQkjY2xvY2stY2VsbHMgPSA8MT47Cj4gPiAgCQl9Owo+ID4g
IAo+ID4gKwkJdTNwaHkwOiB1c2ItcGh5QDExZTQwMDAwIHsKPiAKPiBBY2NvcmRpbmcgdG8KPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLHRwaHkueWFtbCwg
dGhpcyBub2RlCj4gc2hvdWxkIGJlIGNhbGxlZCB0LXBoeS4gT25seSB0aGUgY2hpbGQgbm9kZXMg
c2hvdWxkIGJlIHVzYi1waHkuCj4gCkhpIE7DrWNvbGFzLAoKSSB0aGluayBpdCBzaG91bGQgYmUg
InUzcGh5MDogdC1waHlAMTFlNDAwMDAiLiBhbSBJIHJpZ2h0PwoKTWFueSB0aGFua3MsCkFsbGVu
Cgo+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXRwaHkiLAo+ID4gKwkJCQkg
ICAgICJtZWRpYXRlayxnZW5lcmljLXRwaHktdjIiOwo+ID4gKwkJCSNhZGRyZXNzLWNlbGxzID0g
PDI+Owo+ID4gKwkJCSNzaXplLWNlbGxzID0gPDI+Owo+ID4gKwkJCXJhbmdlczsKPiA+ICsJCQlz
dGF0dXMgPSAib2theSI7Cj4gCj4gIm9rYXkiIGlzIGFscmVhZHkgdGhlIGRlZmF1bHQgc3RhdHVz
LCBzbyB5b3UgY2FuIGRyb3AgdGhpcyBsaW5lLCBhcwo+IHdlbGwgYXMgdGhlCj4gb25lcyBvbiB0
aGUgY2hpbGQgbm9kZXMgYmVsb3cuCj4gCj4gPiArCj4gPiArCQkJdTJwb3J0MDogdXNiLXBoeUAx
MWU0MDAwMCB7Cj4gPiArCQkJCXJlZyA9IDwwIDB4MTFlNDAwMDAgMCAweDcwMD47Cj4gPiArCQkJ
CWNsb2NrcyA9IDwmY2xrMjZtPjsKPiA+ICsJCQkJY2xvY2stbmFtZXMgPSAicmVmIjsKPiA+ICsJ
CQkJI3BoeS1jZWxscyA9IDwxPjsKPiA+ICsJCQkJc3RhdHVzID0gIm9rYXkiOwo+ID4gKwkJCX07
Cj4gPiArCj4gPiArCQkJdTNwb3J0MDogdXNiLXBoeUAxMWU0MDcwMCB7Cj4gPiArCQkJCXJlZyA9
IDwwIDB4MTFlNDA3MDAgMCAweDkwMD47Cj4gPiArCQkJCWNsb2NrcyA9IDwmY2xrMjZtPjsKPiA+
ICsJCQkJY2xvY2stbmFtZXMgPSAicmVmIjsKPiA+ICsJCQkJI3BoeS1jZWxscyA9IDwxPjsKPiA+
ICsJCQkJc3RhdHVzID0gIm9rYXkiOwo+ID4gKwkJCX07Cj4gPiArCQl9Owo+ID4gKwo+ID4gIAkJ
aTJjMDogaTJjQDExZjAwMDAwIHsKPiA+ICAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5
Mi1pMmMiOwo+ID4gIAkJCXJlZyA9IDwwIDB4MTFmMDAwMDAgMCAweDEwMDA+LAo+ID4gLS0gCj4g
PiAyLjE4LjAKPiA+IAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
