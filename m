Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAB9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9U13bJJRG2fly7ECVXQ/4zcGo6CBKBqX+Zk3WNMfPY=; b=vR6cq4njnP5anC
	wENMgt76gNdXtNMmEHVfF1bV0l1megblzYUVHmv1FlDzAxOUgZNzyX7UPc/f+q8g5oQAXERcfNtUf
	PMdbc9SKal2M/59ux0TPmCRL/F56/cFIzFjf8vdK/y7biXz+EHtYPiO1JmSxKIFmEIxP6pI4jd37+
	PA83ZDlWadBY7QpTXMGZxrRXNW6Pb30QexzP7RZ+5zJSTssSp387Il+KU9exom9jBn36HirEJdOSg
	hZ0DnA/h0tdkq3KminZ8c3WX7afdZTY3zy+y//FHE7GbaSTLC43HdZ1uIr1G72SjSiFM0HQlDLuuD
	ePfk9Dl/kAhxOMt3cR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMsrB-00EnMF-3N; Wed, 23 Feb 2022 14:43:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMryh-00EaZ0-4k; Wed, 23 Feb 2022 13:46:48 +0000
X-UUID: da3abaace3d9441a8cb4859f18d0356d-20220223
X-UUID: da3abaace3d9441a8cb4859f18d0356d-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 744604918; Wed, 23 Feb 2022 06:46:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:36:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Feb 2022 21:36:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:36:39 +0800
Message-ID: <519e46cafce580219e722ed05a0164b04257937e.camel@mediatek.com>
Subject: Re: [PATCH v2 16/23] arm64: dts: mt8192: Add H264 venc device node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:36:39 +0800
In-Reply-To: <20220222221321.q5zhe7kbwf6xzafr@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-17-allen-kh.cheng@mediatek.com>
 <20220222221321.q5zhe7kbwf6xzafr@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054647_268508_D1AF5F42 
X-CRM114-Status: GOOD (  16.81  )
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

SGkKT24gVHVlLCAyMDIyLTAyLTIyIGF0IDE3OjEzIC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjoyNlBNICswODAwLCBB
bGxlbi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZHMgSDI2NCB2ZW5jIG5vZGUgZm9yIG10ODE5MiBT
b0MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVu
Z0BtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5Mi5kdHNpIHwgMjMKPiA+ICsrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+IGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gaW5kZXggNDA4ODcxMjBmZGIzLi45MzZhYTc4ODY2
NGYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5k
dHNpCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4g
PiBAQCAtMTM0Miw2ICsxMzQyLDI5IEBACj4gPiAgCQkJcG93ZXItZG9tYWlucyA9IDwmc3BtCj4g
PiBNVDgxOTJfUE9XRVJfRE9NQUlOX1ZFTkM+Owo+ID4gIAkJfTsKPiA+ICAKPiA+ICsJCXZjb2Rl
Y19lbmM6IHZjb2RlY0AweDE3MDIwMDAwIHsKPiAKPiBUaGUgbm9kZSBhZGRyZXNzIHNob3VsZG4n
dCBoYXZlIHRoZSAnMHgnIHByZWZpeC4gUGxlYXNlIGRyb3AgaXQuCj4gCk9LCgo+ID4gKwkJCWNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXZjb2RlYy1lbmMiOwo+ID4gKwkJCXJlZyA9IDww
IDB4MTcwMjAwMDAgMCAweDIwMDA+Owo+ID4gKwkJCWlvbW11cyA9IDwmaW9tbXUwIE00VV9QT1JU
X0w3X1ZFTkNfUkNQVT4sCj4gPiArCQkJCTwmaW9tbXUwIE00VV9QT1JUX0w3X1ZFTkNfUkVDPiwK
PiA+ICsJCQkJPCZpb21tdTAgTTRVX1BPUlRfTDdfVkVOQ19CU0RNQT4sCj4gPiArCQkJCTwmaW9t
bXUwIE00VV9QT1JUX0w3X1ZFTkNfU1ZfQ09NVj4sCj4gPiArCQkJCTwmaW9tbXUwIE00VV9QT1JU
X0w3X1ZFTkNfUkRfQ09NVj4sCj4gPiArCQkJCTwmaW9tbXUwIE00VV9QT1JUX0w3X1ZFTkNfQ1VS
X0xVTUE+LAo+ID4gKwkJCQk8JmlvbW11MCBNNFVfUE9SVF9MN19WRU5DX0NVUl9DSFJPTUE+LAo+
ID4gKwkJCQk8JmlvbW11MCBNNFVfUE9SVF9MN19WRU5DX1JFRl9MVU1BPiwKPiA+ICsJCQkJPCZp
b21tdTAgTTRVX1BPUlRfTDdfVkVOQ19SRUZfQ0hST01BPiwKPiA+ICsJCQkJPCZpb21tdTAgTTRV
X1BPUlRfTDdfVkVOQ19TVUJfUl9MVU1BPiwKPiA+ICsJCQkJPCZpb21tdTAgTTRVX1BPUlRfTDdf
VkVOQ19TVUJfV19MVU1BPjsKPiAKPiBQbGVhc2UgZml4IGluZGVudGF0aW9uOgo+IAkJCWlvbW11
cyA9IDwmaW9tbXUwIE00VV9QT1JUX0w3X1ZFTkNfUkNQVT4sCj4gCQkJCSA8JmlvbW11MCBNNFVf
UE9SVF9MN19WRU5DX1JFQz4sCj4gCQkJCSA8JmlvbW11MCBNNFVfUE9SVF9MN19WRU5DX0JTRE1B
PiwKPiAJCQkJIDwmaW9tbXUwIE00VV9QT1JUX0w3X1ZFTkNfU1ZfQ09NVj4sCj4gCQkJCSA8Jmlv
bW11MCBNNFVfUE9SVF9MN19WRU5DX1JEX0NPTVY+LAo+IAkJCQkgPCZpb21tdTAgTTRVX1BPUlRf
TDdfVkVOQ19DVVJfTFVNQT4sCj4gCQkJCSA8JmlvbW11MCBNNFVfUE9SVF9MN19WRU5DX0NVUl9D
SFJPTUE+LAo+IAkJCQkgPCZpb21tdTAgTTRVX1BPUlRfTDdfVkVOQ19SRUZfTFVNQT4sCj4gCQkJ
CSA8JmlvbW11MCBNNFVfUE9SVF9MN19WRU5DX1JFRl9DSFJPTUE+LAo+IAkJCQkgPCZpb21tdTAg
TTRVX1BPUlRfTDdfVkVOQ19TVUJfUl9MVU1BPiwKPiAJCQkJIDwmaW9tbXUwIE00VV9QT1JUX0w3
X1ZFTkNfU1VCX1dfTFVNQT47Cj4gCkkgd2lsbCBmaXggdGhpcy4KClRoYW5rcywgCkFsbGVuCgo+
ID4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMDkgSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4g
MD47Cj4gPiArCQkJbWVkaWF0ZWssc2NwID0gPCZzY3A+Owo+ID4gKwkJCXBvd2VyLWRvbWFpbnMg
PSA8JnNwbQo+ID4gTVQ4MTkyX1BPV0VSX0RPTUFJTl9WRU5DPjsKPiA+ICsJCQljbG9ja3MgPSA8
JnZlbmNzeXMgQ0xLX1ZFTkNfU0VUMV9WRU5DPjsKPiA+ICsJCQljbG9jay1uYW1lcyA9ICJ2ZW5j
LXNldDEiOwo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9WRU5D
X1NFTD47Cj4gPiArCQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmdG9wY2tnZW4KPiA+IENM
S19UT1BfVU5JVlBMTF9END47Cj4gPiArCQl9Owo+ID4gKwo+ID4gIAkJY2Ftc3lzOiBjbG9jay1j
b250cm9sbGVyQDFhMDAwMDAwIHsKPiA+ICAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5
Mi1jYW1zeXMiOwo+ID4gIAkJCXJlZyA9IDwwIDB4MWEwMDAwMDAgMCAweDEwMDA+Owo+ID4gLS0g
Cj4gPiAyLjE4LjAKPiA+IAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
