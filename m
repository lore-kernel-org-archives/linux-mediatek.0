Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3104C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hrnQGZitzgQsPbsfooTeiAugENVY/SVqa0P4RJt1WQ=; b=3AcB2nOYsI4xSH
	KDqcmj6JwIRS/JtfJPs7HeQH3FGs3pPv/FvNWl4HbjKawudmbvDDY9+uEu4sECBzFncXYnfvHcGo/
	4nAQbvRk6OZ+QglfKeU+SFR11sUuP8GhEYjO2cjEZqix3dYQT0TSA+7Fjp9ptAoCPTI15Xt+3X5VZ
	RbreVipVg3we6Nbzqh2nhtIkoQ8bF3tA7gc4V2yhe7W9PonYJPrHjGUbTCPge8TLspvHUlJJ8nZY1
	V8FxlhWU+8zWaW99XtwquxnIKlelPp5/6A++jQDSwM1Dc+LxQaNZdQrztL/gRdOleLYz6kWh/xTQx
	Igbq5PWJ7rTB0Hk/Pd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZu9N-002GIw-02; Thu, 31 Mar 2022 12:43:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZu9J-002GI0-Ku; Thu, 31 Mar 2022 12:43:39 +0000
X-UUID: 6d1a7fc7524340fab45a8c185e82d0a7-20220331
X-UUID: 6d1a7fc7524340fab45a8c185e82d0a7-20220331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1579509697; Thu, 31 Mar 2022 05:43:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 05:33:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 20:33:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 20:33:25 +0800
Message-ID: <03d8084c903207a3559d80ba06953502ec641ce9.camel@mediatek.com>
Subject: Re: [PATCH v5 1/4] arm64: dts: mt8192: Add PCIe node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Thu, 31 Mar 2022 20:33:25 +0800
In-Reply-To: <06a53ed1-63a8-50c1-7eb0-58ccecce624e@gmail.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
 <20220330133816.30806-2-allen-kh.cheng@mediatek.com>
 <06a53ed1-63a8-50c1-7eb0-58ccecce624e@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_054337_729664_AD2668B5 
X-CRM114-Status: GOOD (  22.80  )
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

SGkgTWF0dGhpYXMsCgpPbiBUaHUsIDIwMjItMDMtMzEgYXQgMTM6NTYgKzAyMDAsIE1hdHRoaWFz
IEJydWdnZXIgd3JvdGU6Cj4gCj4gT24gMzAvMDMvMjAyMiAxNTozOCwgQWxsZW4tS0ggQ2hlbmcg
d3JvdGU6Cj4gPiBBZGQgUENJZSBub2RlIGZvciBtdDgxOTIgU29DLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPgo+ID4g
UmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3Jh
LmNvbT4KPiAKPiBJIHdvbmRlciB3aHkgeW91IGxlZnQgTmljb2xhcyBSZXZpZXdlZC1ieSBidXQg
bm90IHRoZSBvbmUgZnJvbQo+IEFuZ2Vsby4gQW55d2F5IAo+IHdoZW4gc2VuZGluZyBhIG5ldyB2
ZXJzaW9uLCBiZSBzdXJlIHRvIGRyb3AgdGhlIHJldmlld2VkLWJ5IHRhZ3MgaWYKPiB0aGVyZSBh
cmUgCj4gc3Vic3RhbnRpYWwgY2hhbmdlcyBpbiB0aGUgcGF0Y2guIFdlIGNhbiBhcmd1ZSBpZiBj
aGFuZ2luZyB0aGUgY2xvY2sKPiBuYW1lcyBpcyBhIAo+IHN1YnN0YW50aWFsIGNoYW5nZSBvciBu
b3QuIE1heWJlIHRoYXQncyB3aHkgeW91IGxlZnQganVzdCBvbmUKPiByZXZpZXdlZC1ieSB0YWcg
OykKPiBJJ20ganVzdCBqb2tpbmcsIEknbGwgYWRkIHRoZSBvdGhlciB0YWcgbXlzZWxmLgo+IAo+
IEFwcGxpZWQgdGhhbmtzLgo+IAoKVGhpcyBpcyBteSBjYXJlbGVzc25lc3MuCgpJIGRvbid0IG5v
dGljZSBBbmdlbG8ncyByZXBseS4KCkknbGwgcGF5IG1vcmUgYXR0ZW50aW9uIHRvIHRoYXQgbmV4
dCB0aW1lLgoKQmVzdCByZWdhcmRzLApBbGxlbgoKPiA+IC0tLQo+ID4gICBhcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgMzUKPiA+ICsrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBpbmRleCA1NzlhYmJm
NDQ4OGUuLjY5ZThkMTkzNGQ1MyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLmR0c2kKPiA+IEBAIC03MTYsNiArNzE2LDQxIEBACj4gPiAgIAkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7Cj4gPiAgIAkJfTsKPiA+ICAgCj4gPiArCQlwY2llOiBwY2llQDExMjMwMDAw
IHsKPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1wY2llIjsKPiA+ICsJCQlk
ZXZpY2VfdHlwZSA9ICJwY2kiOwo+ID4gKwkJCXJlZyA9IDwwIDB4MTEyMzAwMDAgMCAweDIwMDA+
Owo+ID4gKwkJCXJlZy1uYW1lcyA9ICJwY2llLW1hYyI7Cj4gPiArCQkJI2FkZHJlc3MtY2VsbHMg
PSA8Mz47Cj4gPiArCQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4gPiArCQkJY2xvY2tzID0gPCZpbmZy
YWNmZyBDTEtfSU5GUkFfUENJRV9QTF9QXzI1ME0+LAo+ID4gKwkJCQkgPCZpbmZyYWNmZyBDTEtf
SU5GUkFfUENJRV9UTF8yNk0+LAo+ID4gKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUENJRV9U
TF85Nk0+LAo+ID4gKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUENJRV9UTF8zMks+LAo+ID4g
KwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUENJRV9QRVJJXzI2TT4sCj4gPiArCQkJCSA8Jmlu
ZnJhY2ZnIENMS19JTkZSQV9QQ0lFX1RPUF9IXzEzM00+Owo+ID4gKwkJCWNsb2NrLW5hbWVzID0g
InBsXzI1MG0iLCAidGxfMjZtIiwgInRsXzk2bSIsCj4gPiArCQkJCSAgICAgICJ0bF8zMmsiLCAi
cGVyaV8yNm0iLCAidG9wXzEzM20iOwo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tn
ZW4gQ0xLX1RPUF9UTF9TRUw+Owo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRv
cGNrZ2VuCj4gPiBDTEtfVE9QX01BSU5QTExfRDZfRDQ+Owo+ID4gKwkJCWludGVycnVwdHMgPSA8
R0lDX1NQSSAyNTEgSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4gMD47Cj4gPiArCQkJYnVzLXJhbmdl
ID0gPDB4MDAgMHhmZj47Cj4gPiArCQkJcmFuZ2VzID0gPDB4ODIwMDAwMDAgMCAweDEyMDAwMDAw
IDB4MAo+ID4gMHgxMjAwMDAwMCAwIDB4MDgwMDAwMD4sCj4gPiArCQkJCSA8MHg4MTAwMDAwMCAw
IDB4MTI4MDAwMDAgMHgwCj4gPiAweDEyODAwMDAwIDAgMHgwODAwMDAwPjsKPiA+ICsJCQkjaW50
ZXJydXB0LWNlbGxzID0gPDE+Owo+ID4gKwkJCWludGVycnVwdC1tYXAtbWFzayA9IDwwIDAgMCA3
PjsKPiA+ICsJCQlpbnRlcnJ1cHQtbWFwID0gPDAgMCAwIDEgJnBjaWVfaW50YzAgMD4sCj4gPiAr
CQkJCQk8MCAwIDAgMiAmcGNpZV9pbnRjMCAxPiwKPiA+ICsJCQkJCTwwIDAgMCAzICZwY2llX2lu
dGMwIDI+LAo+ID4gKwkJCQkJPDAgMCAwIDQgJnBjaWVfaW50YzAgMz47Cj4gPiArCj4gPiArCQkJ
cGNpZV9pbnRjMDogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ID4gKwkJCQlpbnRlcnJ1cHQtY29u
dHJvbGxlcjsKPiA+ICsJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MD47Cj4gPiArCQkJCSNpbnRlcnJ1
cHQtY2VsbHMgPSA8MT47Cj4gPiArCQkJfTsKPiA+ICsJCX07Cj4gPiArCj4gPiAgIAkJbm9yX2Zs
YXNoOiBzcGlAMTEyMzQwMDAgewo+ID4gICAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5
Mi1ub3IiOwo+ID4gICAJCQlyZWcgPSA8MCAweDExMjM0MDAwIDAgMHhlMD47CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
