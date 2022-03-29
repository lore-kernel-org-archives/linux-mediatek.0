Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66180C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 03:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHWL3g5q6xngM0zx3/r7E2gzT1B6CJxD9i7Oz0pMwXw=; b=17Gm+kh4ILLbvX
	bbyawJ6xw9m7Y2vQEaiChSRxjAZiqRhA26O5+SajDJenNQ279Br7x1rhI3eslDVE38+BbMMNgexVG
	2MSRZW+M9Un5kqErF3w/E1aURZ1pAQbWt6nJR+cMpIs2pHNFWpDMqJVKMOhbOSFNRliyDAlYTOS/3
	Fy2ci/qFWXN9PiDo0UcvIavGhNTbGIe1UNYkYRTOASgrru7K5T2hfFbgPA64vzkJU3vT+1c29Udz2
	mTMqV+YvTNc3AqWcIm6t/JnE3Uiu0LTZ0U3DuT8ZETJekzda3p5q9TeWBUUB2KJEbNr1W9oS7YU+3
	h5j56vSg7sPMQBsCa2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ2Oz-00Ap9b-Bq; Tue, 29 Mar 2022 03:20:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ2Ov-00Ap5H-FO; Tue, 29 Mar 2022 03:20:11 +0000
X-UUID: 1cfec0f8ffe644d6b26060b936cb0ed7-20220328
X-UUID: 1cfec0f8ffe644d6b26060b936cb0ed7-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1117059924; Mon, 28 Mar 2022 20:20:04 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 20:10:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 11:10:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 11:10:00 +0800
Message-ID: <6eeb1f7ac3934186ea5431651c6be16e26f4594e.camel@mediatek.com>
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
 <hui.liu@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 29 Mar 2022 11:10:00 +0800
In-Reply-To: <20220324135750.652j2qwjz5lkwejs@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-9-allen-kh.cheng@mediatek.com>
 <20220322215754.j2hzutm775hvr25n@notapiano>
 <17bc30c64db3f3280993669a39edf3a11f76fb68.camel@mediatek.com>
 <20220324135750.652j2qwjz5lkwejs@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_202009_554775_B48E2216 
X-CRM114-Status: GOOD (  36.30  )
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

T24gVGh1LCAyMDIyLTAzLTI0IGF0IDA5OjU3IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBXZWQsIE1hciAyMywgMjAyMiBhdCAwMjoyNzowMFBNICswODAwLCBhbGxl
bi1raC5jaGVuZyB3cm90ZToKPiA+IEhpIE7DrWNvbGFzLAo+ID4gCj4gPiBPbiBUdWUsIDIwMjIt
MDMtMjIgYXQgMTc6NTcgLTA0MDAsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIHdyb3RlOgo+ID4g
PiBIaSBBbGxlbiwKPiA+ID4gCj4gPiA+IHBsZWFzZSBzZWUgbXkgY29tbWVudCBiZWxvdy4KPiA+
ID4gCj4gPiA+IE9uIEZyaSwgTWFyIDE4LCAyMDIyIGF0IDEwOjQ1OjIwUE0gKzA4MDAsIEFsbGVu
LUtIIENoZW5nIHdyb3RlOgo+ID4gPiA+IEFkZCBpbmZyYWNmZ19yc3Qgbm9kZSBmb3IgbXQ4MTky
IFNvQy4KPiA+ID4gPiAgLSBBZGQgc2ltcGxlLW1mZCB0byBhbGxvdyBwcm9iaW5nIHRoZSB0aSxz
eXNjb24tcmVzZXQgbm9kZS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1L
SCBDaGVuZyA8YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5
OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8Cj4gPiA+ID4gYW5nZWxvZ2lvYWNjaGluby5k
ZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgMTgKPiA+ID4gPiArKysrKysrKysrKysrKysr
LS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLmR0c2kKPiA+ID4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTkyLmR0c2kKPiA+ID4gPiBpbmRleCA0MGNmNmRhY2NhM2UuLjgyZGUxYWYzZjZhYSAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNp
Cj4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+
ID4gPiA+IEBAIC0xMiw2ICsxMiw3IEBACj4gPiA+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
aW5jdHJsL210ODE5Mi1waW5mdW5jLmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
aHkvcGh5Lmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxOTItcG93
ZXIuaD4KPiA+ID4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3RpLXN5c2Nvbi5oPgo+
ID4gPiA+ICAKPiA+ID4gPiAgLyB7Cj4gPiA+ID4gIAljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5MiI7Cj4gPiA+ID4gQEAgLTI2NywxMCArMjY4LDIzIEBACj4gPiA+ID4gIAkJCSNjbG9jay1j
ZWxscyA9IDwxPjsKPiA+ID4gPiAgCQl9Owo+ID4gPiA+ICAKPiA+ID4gPiAtCQlpbmZyYWNmZzog
c3lzY29uQDEwMDAxMDAwIHsKPiA+ID4gPiAtCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
OTItCj4gPiA+ID4gaW5mcmFjZmciLAo+ID4gPiA+ICJzeXNjb24iOwo+ID4gPiA+ICsJCWluZnJh
Y2ZnOiBpbmZyYWNmZ0AxMDAwMTAwMCB7Cj4gPiA+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTkyLQo+ID4gPiA+IGluZnJhY2ZnIiwKPiA+ID4gPiAic3lzY29uIiwgInNpbXBsZS1t
ZmQiOwo+ID4gPiA+ICAJCQlyZWcgPSA8MCAweDEwMDAxMDAwIDAgMHgxMDAwPjsKPiA+ID4gPiAg
CQkJI2Nsb2NrLWNlbGxzID0gPDE+Owo+ID4gPiA+ICsKPiA+ID4gPiArCQkJaW5mcmFjZmdfcnN0
OiByZXNldC1jb250cm9sbGVyIHsKPiA+ID4gPiArCQkJCWNvbXBhdGlibGUgPSAidGksc3lzY29u
LXJlc2V0IjsKPiA+ID4gPiArCQkJCSNyZXNldC1jZWxscyA9IDwxPjsKPiA+ID4gPiArCj4gPiA+
ID4gKwkJCQl0aSxyZXNldC1iaXRzID0gPAo+ID4gPiA+ICsJCQkJCTB4MTIwIDAgMHgxMjQgMCAw
IDAJCj4gPiA+ID4gKEFTU0VSVF9TRVQKPiA+ID4gPiA+IERFQVNTRVJUX1NFVCB8IFNUQVRVU19O
T05FKSAvKiAwOiBsdnRzX2FwICovCj4gPiA+ID4gCj4gPiA+ID4gKwkJCQkJMHg3MzAgMTIgMHg3
MzQgMTIgMCAwCQo+ID4gPiA+IChBUwo+ID4gPiA+IFNFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwg
U1RBVFVTX05PTkUpIC8qIDE6IGx2dHNfbWN1ICovCj4gPiA+ID4gKwkJCQkJMHgxNDAgMTUgMHgx
NDQgMTUgMCAwCQo+ID4gPiA+IChBUwo+ID4gPiA+IFNFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwg
U1RBVFVTX05PTkUpIC8qIDI6IHBjaWUgcGh5ICovCj4gPiA+ID4gKwkJCQkJMHg3MzAgMSAweDcz
NCAxIDAgMAkKPiA+ID4gPiAoQVNTRVJUX1NFVAo+ID4gPiA+ID4gREVBU1NFUlRfU0VUIHwgU1RB
VFVTX05PTkUpIC8qIDM6IHBjaWUgdG9wICovCj4gPiA+ID4gCj4gPiA+ID4gKwkJCQkJMHgxNTAg
NSAweDE1NCA1IDAgMAkKPiA+ID4gPiAoQVNTRVJUX1NFVAo+ID4gPiA+ID4gREVBU1NFUlRfU0VU
IHwgU1RBVFVTX05PTkUpIC8qIDQ6IHN2cyAqLwo+ID4gPiA+IAo+ID4gPiA+ICsJCQkJPjsKPiA+
ID4gCj4gPiA+IElmIHlvdSBzZWUgWzFdLCBSb2IgaGFzIHByZXZpb3VzbHkgc2FpZCB0aGF0IHRo
ZXJlIHNob3VsZG4ndCBiZQo+ID4gPiBuZXcKPiA+ID4gdXNlcnMgb2YgdGhlCj4gPiA+IHRpLHJl
c2V0LWJpdHMgcHJvcGVydHkuIEkgc3VnZ2VzdCBkb2luZyBsaWtlIHByb3Bvc2VkIG9uIFsyXToK
PiA+ID4gbW92aW5nCj4gPiA+IHRoZXNlIGJpdAo+ID4gPiBkZWZpbml0aW9ucyB0byB0aGUgcmVz
ZXQtdGktc3lzY29uIGRyaXZlciwgYW5kIGhhdmUgdGhlbSBzZWxlY3RlZAo+ID4gPiB0aHJvdWdo
IHRoZQo+ID4gPiBjb21wYXRpYmxlLiBZb3UnZCBuZWVkIHRvIGFkZCBhIG10ODE5MiBzcGVjaWZp
YyBjb21wYXRpYmxlIGhlcmUKPiA+ID4gdG9vCj4gPiA+IGZvciB0aGF0Lgo+ID4gPiAKPiA+ID4g
WzFdIAo+ID4gPiAKaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC9DQUxfSnNxSnE2Z3FvWHR2RzFVN1VEc09RcHo3b01MTXVuWkhxMm5qTjZudlBy
OFBaTUFAbWFpbC5nbWFpbC5jb20vX187ISFDVFJOS0E5d01nMEFSYnchMXdRQWhIbnU4YkF4ZTJP
NTFYWjYxb1dWUVU3RUZFWmNnbHV6d2dQNHg0VkhSeHRiNmtBeVN2c0tDR3p2OGNzOEl6VmphbkRO
ekJRdk9hX1k0T0FCZFJWT3pnJAo+ID4gPiAgCj4gPiA+IFsyXSAKPiA+ID4gCmh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FBVGRRZ0E1cEto
ak9mNWd4bypoN2NzN2tDdHMzRGVLR1U1YXhlWDJ0Kk9hSkZIeUJnQG1haWwuZ21haWwuY29tL19f
O0t5cyEhQ1RSTktBOXdNZzBBUmJ3ITF3UUFoSG51OGJBeGUyTzUxWFo2MW9XVlFVN0VGRVpjZ2x1
endnUDR4NFZIUnh0YjZrQXlTdnNLQ0d6djhjczhJelZqYW5ETnpCUXZPYV9ZNE9CTHZPWWx5USQK
PiA+ID4gIAo+ID4gPiAKPiA+ID4gVGhhbmtzLAo+ID4gPiBOw61jb2xhcwo+ID4gPiAKPiA+IAo+
ID4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuCj4gPiAKPiA+IEZvciBuZnJhY2ZnX3JzdCBub2Rl
LCBJIHByZWZlciByZW1vdmUgaXQgZnJvbSB0aGlzIHNlcmllcyBhbmQKPiA+IHNlbmQgYW5vdGhl
ciBwYXRjaCBzZXJpZXMoZHRzIGFuZCBkcml2ZXIpLgo+IAo+IFllcywgdGhhdCBzb3VuZHMgdGhl
IGJlc3QgYXBwcm9hY2ggdG8gbWUgYXMgd2VsbC4KPiAKPiA+IAo+ID4gQmFzZWQgb24gWzJdLCBp
cyBpdCBvayB0aGF0IHdlIGNhbiBhZGQgbXQ4MTkyIGNvbXBhdGlibGUgaW4gcmVzZXQtCj4gPiB0
aQo+ID4gc3lzY29uIGRyaXZlcj8gKGV2ZW4gaWYgbXQ4MTkyIGlzIGEgbWVkaWF0ZWsgcGxhdGZv
cm0pCj4gCj4gQWN0dWFsbHksIEkgdGhpbmsgdGhlcmUncyBhbiBldmVuIGJldHRlciB3YXkgb2Yg
aGFuZGxpbmcgdGhpcy4KPiBJbnN0ZWFkIG9mIHVzaW5nCj4gdGhlIFRJIHN5c2NvbiByZXNldCBj
b250cm9sbGVyLCB5b3UgY291bGQgZ2l2ZSByZXNldCBjb250cm9sbGVyCj4gY2FwYWJpbGl0aWVz
IHRvCj4gdGhlIGluZnJhY2ZnIG5vZGUgZGlyZWN0bHkuIFRoaXMgbWVhbnMgYWRkaW5nIHJlc2V0
IGNvbnRyb2xsZXIKPiBzdXBwb3J0IHRvIHRoZQo+IGNvbW1vbiBtdGsgY2xvY2sgZHJpdmVyIChj
bGstbXRrLmMpIGFuZCByZWdpc3RlcmluZyB0aGUgcmVzZXQKPiBjb250cm9sbGVyIG9uCj4gY2xr
LW10ODE5Mi5jIGZvciBpbmZyYWNmZy4gQnkgbWFraW5nIHRoaXMgY29tbW9uIGNvZGUgeW91J2xs
IGFsc28gYmUKPiBhYmxlIHRvCj4gcmV1c2UgaXQgZm9yIG10ODE5NSBhcyB3ZWxsLiBBbmQgdGhl
cmUgd291bGQgbm8gbG9uZ2VyIGJlIGEKPiBpbmZyYWNmZ19yc3Qgbm9kZS4KPiAKPiBUaGFua3Ms
Cj4gTsOtY29sYXMKPiAKCkhJIE7DrWNvbGFzLAoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24u
CgpXZSB3aWxsIHNlbmQgYW5vdGhlciBwYXRjaCBmb3IgcmVzZXQgY29ucm9sbGVyLgoKCkJlc3Qg
cmVnYXJkcywKQWxsZW5uCgo+ID4gCj4gPiBiZXN0IHJlZ2FyZHMsCj4gPiBBbGxlbgo+ID4gCj4g
PiA+ID4gKwkJCX07Cj4gPiA+ID4gIAkJfTsKPiA+ID4gPiAgCj4gPiA+ID4gIAkJcGVyaWNmZzog
c3lzY29uQDEwMDAzMDAwIHsKPiA+ID4gPiAtLSAKPiA+ID4gPiAyLjE4LjAKPiA+ID4gPiAKPiA+
ID4gPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
