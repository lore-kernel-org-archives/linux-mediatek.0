Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87122C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 06:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/LVpIkhzyU1GM2u2BeToY18Ecaozs4VH3T2WPG/xQA=; b=YNIDbTMoO9mFR4
	NqIAZWVw3CYIXipYumnGLjRScrSuaPeK/fgqZRTRPuewjMEXleAg7dJd3GAkMLSdtywXIkPYYBy4I
	/s2Ft8RJCz0ojafTUl4FUzS8/s/XV1Hs4HDPf6UUy/uOp+DzgoyloRvI8QlpoBRheFDF7EPicQgVt
	pHsTXP/J/6OCuXY2TrsjULK04dDe/P2co53DPqgNz4COY83wzeSGRQP09uxut0FOQVeGyzpeTY+0h
	uVBVCiG2QSjX6EabxNWdHbpVjssfhIg/8+b7eNErmb4q7upa6CSuMY14H+/ko3jzPBf4HO6cqPvqm
	Yk1a+pxrAHWu9Yv5B2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWuSy-00CqPF-J7; Wed, 23 Mar 2022 06:27:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWuSs-00CqOX-Cz; Wed, 23 Mar 2022 06:27:29 +0000
X-UUID: 4473e2e000434c3f80c55c9bb76abe5c-20220322
X-UUID: 4473e2e000434c3f80c55c9bb76abe5c-20220322
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1054108041; Tue, 22 Mar 2022 23:27:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 23:27:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Mar 2022 14:27:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 14:27:00 +0800
Message-ID: <17bc30c64db3f3280993669a39edf3a11f76fb68.camel@mediatek.com>
Subject: Re: [PATCH v4 08/22] arm64: dts: mt8192: Add infracfg_rst node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Wed, 23 Mar 2022 14:27:00 +0800
In-Reply-To: <20220322215754.j2hzutm775hvr25n@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-9-allen-kh.cheng@mediatek.com>
 <20220322215754.j2hzutm775hvr25n@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_232726_466151_CF1F3C7E 
X-CRM114-Status: GOOD (  25.26  )
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

SGkgTsOtY29sYXMsCgpPbiBUdWUsIDIwMjItMDMtMjIgYXQgMTc6NTcgLTA0MDAsIE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvIHdyb3RlOgo+IEhpIEFsbGVuLAo+IAo+IHBsZWFzZSBzZWUgbXkgY29t
bWVudCBiZWxvdy4KPiAKPiBPbiBGcmksIE1hciAxOCwgMjAyMiBhdCAxMDo0NToyMFBNICswODAw
LCBBbGxlbi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCBpbmZyYWNmZ19yc3Qgbm9kZSBmb3IgbXQ4
MTkyIFNvQy4KPiA+ICAtIEFkZCBzaW1wbGUtbWZkIHRvIGFsbG93IHByb2JpbmcgdGhlIHRpLHN5
c2Nvbi1yZXNldCBub2RlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8
YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIDwKPiA+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0
c2kgfCAxOCArKysrKysrKysrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gaW5kZXggNDBjZjZkYWNjYTNlLi44MmRlMWFmM2Y2YWEg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNp
Cj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBA
QCAtMTIsNiArMTIsNyBAQAo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL210ODE5
Mi1waW5mdW5jLmg+Cj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BoeS9waHkuaD4KPiA+ICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvbXQ4MTkyLXBvd2VyLmg+Cj4gPiArI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL3Jlc2V0L3RpLXN5c2Nvbi5oPgo+ID4gIAo+ID4gIC8gewo+ID4gIAljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE5MiI7Cj4gPiBAQCAtMjY3LDEwICsyNjgsMjMgQEAKPiA+
ICAJCQkjY2xvY2stY2VsbHMgPSA8MT47Cj4gPiAgCQl9Owo+ID4gIAo+ID4gLQkJaW5mcmFjZmc6
IHN5c2NvbkAxMDAwMTAwMCB7Cj4gPiAtCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTIt
aW5mcmFjZmciLAo+ID4gInN5c2NvbiI7Cj4gPiArCQlpbmZyYWNmZzogaW5mcmFjZmdAMTAwMDEw
MDAgewo+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWluZnJhY2ZnIiwKPiA+
ICJzeXNjb24iLCAic2ltcGxlLW1mZCI7Cj4gPiAgCQkJcmVnID0gPDAgMHgxMDAwMTAwMCAwIDB4
MTAwMD47Cj4gPiAgCQkJI2Nsb2NrLWNlbGxzID0gPDE+Owo+ID4gKwo+ID4gKwkJCWluZnJhY2Zn
X3JzdDogcmVzZXQtY29udHJvbGxlciB7Cj4gPiArCQkJCWNvbXBhdGlibGUgPSAidGksc3lzY29u
LXJlc2V0IjsKPiA+ICsJCQkJI3Jlc2V0LWNlbGxzID0gPDE+Owo+ID4gKwo+ID4gKwkJCQl0aSxy
ZXNldC1iaXRzID0gPAo+ID4gKwkJCQkJMHgxMjAgMCAweDEyNCAwIDAgMAkoQVNTRVJUX1NFVAo+
ID4gfCBERUFTU0VSVF9TRVQgfCBTVEFUVVNfTk9ORSkgLyogMDogbHZ0c19hcCAqLwo+ID4gKwkJ
CQkJMHg3MzAgMTIgMHg3MzQgMTIgMCAwCShBUwo+ID4gU0VSVF9TRVQgfCBERUFTU0VSVF9TRVQg
fCBTVEFUVVNfTk9ORSkgLyogMTogbHZ0c19tY3UgKi8KPiA+ICsJCQkJCTB4MTQwIDE1IDB4MTQ0
IDE1IDAgMAkoQVMKPiA+IFNFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwgU1RBVFVTX05PTkUpIC8q
IDI6IHBjaWUgcGh5ICovCj4gPiArCQkJCQkweDczMCAxIDB4NzM0IDEgMCAwCShBU1NFUlRfU0VU
Cj4gPiB8IERFQVNTRVJUX1NFVCB8IFNUQVRVU19OT05FKSAvKiAzOiBwY2llIHRvcCAqLwo+ID4g
KwkJCQkJMHgxNTAgNSAweDE1NCA1IDAgMAkoQVNTRVJUX1NFVAo+ID4gfCBERUFTU0VSVF9TRVQg
fCBTVEFUVVNfTk9ORSkgLyogNDogc3ZzICovCj4gPiArCQkJCT47Cj4gCj4gSWYgeW91IHNlZSBb
MV0sIFJvYiBoYXMgcHJldmlvdXNseSBzYWlkIHRoYXQgdGhlcmUgc2hvdWxkbid0IGJlIG5ldwo+
IHVzZXJzIG9mIHRoZQo+IHRpLHJlc2V0LWJpdHMgcHJvcGVydHkuIEkgc3VnZ2VzdCBkb2luZyBs
aWtlIHByb3Bvc2VkIG9uIFsyXTogbW92aW5nCj4gdGhlc2UgYml0Cj4gZGVmaW5pdGlvbnMgdG8g
dGhlIHJlc2V0LXRpLXN5c2NvbiBkcml2ZXIsIGFuZCBoYXZlIHRoZW0gc2VsZWN0ZWQKPiB0aHJv
dWdoIHRoZQo+IGNvbXBhdGlibGUuIFlvdSdkIG5lZWQgdG8gYWRkIGEgbXQ4MTkyIHNwZWNpZmlj
IGNvbXBhdGlibGUgaGVyZSB0b28KPiBmb3IgdGhhdC4KPiAKPiBbMV0gCj4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUxfSnNxSnE2Z3Fv
WHR2RzFVN1VEc09RcHo3b01MTXVuWkhxMm5qTjZudlByOFBaTUFAbWFpbC5nbWFpbC5jb20vX187
ISFDVFJOS0E5d01nMEFSYnchMXdRQWhIbnU4YkF4ZTJPNTFYWjYxb1dWUVU3RUZFWmNnbHV6d2dQ
NHg0VkhSeHRiNmtBeVN2c0tDR3p2OGNzOEl6VmphbkROekJRdk9hX1k0T0FCZFJWT3pnJAo+ICAK
PiBbMl0gCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9DQUFUZFFnQTVwS2hqT2Y1Z3hvKmg3Y3M3a0N0czNEZUtHVTVheGVYMnQqT2FKRkh5
QmdAbWFpbC5nbWFpbC5jb20vX187S3lzISFDVFJOS0E5d01nMEFSYnchMXdRQWhIbnU4YkF4ZTJP
NTFYWjYxb1dWUVU3RUZFWmNnbHV6d2dQNHg0VkhSeHRiNmtBeVN2c0tDR3p2OGNzOEl6VmphbkRO
ekJRdk9hX1k0T0JMdk9ZbHlRJAo+ICAKPiAKPiBUaGFua3MsCj4gTsOtY29sYXMKPiAKClRoYW5r
cyBmb3IgeW91ciBjb21tZW50LgoKRm9yIG5mcmFjZmdfcnN0IG5vZGUsIEkgcHJlZmVyIHJlbW92
ZSBpdCBmcm9tIHRoaXMgc2VyaWVzIGFuZApzZW5kIGFub3RoZXIgcGF0Y2ggc2VyaWVzKGR0cyBh
bmQgZHJpdmVyKS4KCkJhc2VkIG9uIFsyXSwgaXMgaXQgb2sgdGhhdCB3ZSBjYW4gYWRkIG10ODE5
MiBjb21wYXRpYmxlIGluIHJlc2V0LXRpCnN5c2NvbiBkcml2ZXI/IChldmVuIGlmIG10ODE5MiBp
cyBhIG1lZGlhdGVrIHBsYXRmb3JtKQoKYmVzdCByZWdhcmRzLApBbGxlbgoKPiA+ICsJCQl9Owo+
ID4gIAkJfTsKPiA+ICAKPiA+ICAJCXBlcmljZmc6IHN5c2NvbkAxMDAwMzAwMCB7Cj4gPiAtLSAK
PiA+IDIuMTguMAo+ID4gCj4gPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
