Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66182C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 03:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c0dmuAjCOBHNSVgO2+lZzv/ijOKi1glI43NRUPpM4c=; b=u52j5gepg5/Ej+
	NZ4M/fD2SwWX0TcdN5hd9+v9Q9S08vYWAXR6uvgZGcrOX2dQO8lOYcDvE8OISv9NMQ8YCkbE7s04S
	Ryd0/UKNtF5bpTHe0K1hajTJkCOXUNEMmMHGhL9FO+aoU8snrcXCGUShaMavbsHaWc6PN/bQP2zfV
	cfrZOUOMXPJ61YPKgkOl8LxpbqLdQ0Nyi5jslkqdSltZkgzbJzunlfFTyXCUurIE5arK0+cBQcyMi
	WB1ktVqHwBv0FLVpnqqtWg9rAJlGlCR9QvfTd38U31g0sSz/X+rEx53D5s60icgyVEzvvCUEfqSBz
	zRsj4q1bjaQg4mEg6svQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWVMV-009tp5-BG; Tue, 22 Mar 2022 03:39:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWVMR-009tno-Kb; Tue, 22 Mar 2022 03:39:09 +0000
X-UUID: 5445bfdc89524e1b9a6602c1b0b15f6d-20220321
X-UUID: 5445bfdc89524e1b9a6602c1b0b15f6d-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1340005734; Mon, 21 Mar 2022 20:38:58 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 20:38:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 11:38:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 11:38:54 +0800
Message-ID: <e05dba37499ce74563c077d62424875aaa9c6b17.camel@mediatek.com>
Subject: Re: [PATCH v4 13/22] arm64: dts: mt8192: Add mipi_tx node
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
Date: Tue, 22 Mar 2022 11:38:55 +0800
In-Reply-To: <20220321224133.jjodvrurv6kvrouf@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-14-allen-kh.cheng@mediatek.com>
 <20220321224133.jjodvrurv6kvrouf@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_203907_699758_8F74B566 
X-CRM114-Status: GOOD (  17.04  )
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

T24gTW9uLCAyMDIyLTAzLTIxIGF0IDE4OjQxIC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIE1hciAxOCwgMjAyMiBhdCAxMDo0NToyNVBNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCBtaXBpX3R4IG5vZGUgZm9yIG10ODE5MiBTb0MuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRp
YXRlay5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi5kdHNpIHwgMTAgKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5Mi5kdHNpCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kK
PiA+IGluZGV4IDI2NDhmMjg0Nzk5My4uNmI3NjlmYTViNDI3IDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gQEAgLTExMTAsNiArMTExMCwxNiBA
QAo+ID4gIAkJCX07Cj4gPiAgCQl9Owo+ID4gIAo+ID4gKwkJbWlwaV90eDA6IGRzaS1kcGh5QDEx
ZTUwMDAwIHsKPiAKPiBUeXBvIGhlcmUsIHNob3VsZCBiZSBkc2ktcGh5LCBub3QgZHNpLWRwaHku
Cj4gCj4gT3RoZXIgdGhhbiB0aGF0LAo+IAo+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBB
LiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpIaSBOw61jb2xhcwoKVGhhbmtzIGZv
ciByZW1pbmRpbmcgbWUuIAoKSSB3aWxsIHBheSBhdHRlbnRpb24gbmV4dCB0aW1lIGFuZCB1cGRh
dGUgaW4gdjUuCgpCZXN0IHJlZ2FyZHMsCkFsbGVuCgo+IAo+ID4gKwkJCWNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTgzLW1pcGktdHgiOwo+ID4gKwkJCXJlZyA9IDwwIDB4MTFlNTAwMDAgMCAw
eDEwMDA+Owo+ID4gKwkJCWNsb2NrcyA9IDwmYXBtaXhlZHN5cyBDTEtfQVBNSVhFRF9NSVBJRDI2
TT47Cj4gPiArCQkJI2Nsb2NrLWNlbGxzID0gPDA+Owo+ID4gKwkJCSNwaHktY2VsbHMgPSA8MD47
Cj4gPiArCQkJY2xvY2stb3V0cHV0LW5hbWVzID0gIm1pcGlfdHgwX3BsbCI7Cj4gPiArCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKPiA+ICsJCX07Cj4gPiArCj4gPiAgCQlpMmMwOiBpMmNAMTFmMDAw
MDAgewo+ID4gIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWkyYyI7Cj4gPiAgCQkJ
cmVnID0gPDAgMHgxMWYwMDAwMCAwIDB4MTAwMD4sCj4gPiAtLSAKPiA+IDIuMTguMAo+ID4gCj4g
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
