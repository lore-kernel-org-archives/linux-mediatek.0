Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CB2C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT2VRt0Lu3QKmOImKnGNGq6w0WOgi+zeB9rkjsUPqZs=; b=zFoM+aGQ0lzTp5
	mREA9+dcHKc7zZ5039ZPnenFTMwVBjaDrPP1nf4I5CHO+n4g3bqxQGHIo5MYngtuq5FM2PI/Oe6MI
	09Tqa70mZmZYiNBTTo8toH6hWSFiW+rIJ5NP3tw6e5V6P9FEs0MJfFQX8bzS7I9HPZgfXsJ6vt0pu
	Ba3iecMnFr9Wr1cagLSO/gTT9suyW61vgrUyUPFEN5ht3OS2A89nal0qQ3zV0pfEbIjFX/Bg3aAYZ
	Gt1VFN98VGkRcvTTuFp/8vaSIs5F38eOO8ltIOEpdYKFrzexcW3iHombGaUDkQOUwEYLEKCBM6XM2
	6DMukUm64+Zy8nDDkq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmbjU-00G5ux-Hm; Thu, 05 May 2022 13:41:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmbjD-00G5oe-MQ; Thu, 05 May 2022 13:41:16 +0000
X-UUID: 1e6f754ddd2344e19bad38028b3f3643-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:09ac74fe-0a10-45fa-b2f6-236f795c42f2, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:a3c75316-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1e6f754ddd2344e19bad38028b3f3643-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1424349680; Thu, 05 May 2022 06:41:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 06:41:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 21:41:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 5 May 2022 21:41:04 +0800
Message-ID: <656a7ffad36c55abd321594da909000ce54f52a1.camel@mediatek.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8192: Add vcodec lat and core nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado"
 <nfraprado@collabora.com>
Date: Thu, 5 May 2022 21:41:04 +0800
In-Reply-To: <20220413152903.3pk3ed5a5lgtiyf4@notapiano>
References: <20220408104124.31395-1-allen-kh.cheng@mediatek.com>
 <20220408104124.31395-2-allen-kh.cheng@mediatek.com>
 <20220412230819.vnbdv6wpsg73eqzi@notapiano>
 <649d747ceddc7fbd3f226f4448874665231ae744.camel@mediatek.com>
 <20220413152903.3pk3ed5a5lgtiyf4@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_064111_798892_A44BB752 
X-CRM114-Status: GOOD (  25.94  )
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

SGkgTWF0dGhpYXMsCgpEbyB5b3UgaGF2ZSBhbnkgY29tbWVudHMgb24gdGhpcyBQQVRDSD8KClRo
YW5rcywKQWxsZW4KCk9uIFdlZCwgMjAyMi0wNC0xMyBhdCAxMToyOSAtMDQwMCwgTsOtY29sYXMg
Ri4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gT24gV2VkLCBBcHIgMTMsIDIwMjIgYXQgMDM6MjE6MjlQ
TSArMDgwMCwgYWxsZW4ta2guY2hlbmcgd3JvdGU6Cj4gPiBIaSBOw61jb2xhcywKPiA+IAo+ID4g
T24gVHVlLCAyMDIyLTA0LTEyIGF0IDE5OjA4IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiA+ID4gSGkgQWxsZW4sCj4gPiA+IAo+ID4gPiBPbiBGcmksIEFwciAwOCwgMjAy
MiBhdCAwNjo0MToyNFBNICswODAwLCBBbGxlbi1LSCBDaGVuZyB3cm90ZToKPiA+ID4gPiBBZGQg
dmNvZGVjIGxhdCBhbmQgY29yZSBub2RlcyBmb3IgbXQ4MTkyIFNvQy4KPiA+ID4gPiAKPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsu
Y29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8Cj4g
PiA+ID4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4gPiA+IC0t
LQo+ID4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgNjAK
PiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDYwIGluc2VydGlvbnMoKykKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gPiA+IGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gPiA+IGluZGV4IDE4YTU4MjM5ZDZmMS4uYzdm
NGIyZmJiMzE1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLmR0c2kKPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5Mi5kdHNpCj4gPiA+ID4gQEAgLTExMjAsNiArMTEyMCw2NiBAQAo+ID4gPiA+ICAJCQlw
b3dlci1kb21haW5zID0gPCZzcG0KPiA+ID4gPiBNVDgxOTJfUE9XRVJfRE9NQUlOX0lTUDI+Owo+
ID4gPiA+ICAJCX07Cj4gPiA+ID4gIAo+ID4gPiA+ICsJCXZjb2RlY19kZWM6IHZjb2RlYy1kZWNA
MTYwMDAwMDAgewo+ID4gPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi12Y29k
ZWMtCj4gPiA+ID4gZGVjIjsKPiA+ID4gPiArCQkJcmVnID0gPDAgMHgxNjAwMDAwMCAwIDB4MTAw
MD47Cj4gPiA+ID4gKwkJCW1lZGlhdGVrLHNjcCA9IDwmc2NwPjsKPiA+ID4gPiArCQkJaW9tbXVz
ID0gPCZpb21tdTAKPiA+ID4gPiBNNFVfUE9SVF9MNF9WREVDX01DX0VYVD47Cj4gPiA+ID4gKwkJ
CWRtYS1yYW5nZXMgPSA8MHgxIDB4MCAweDAgMHg0MDAwMDAwMAo+ID4gPiA+IDB4MAo+ID4gPiA+
IDB4ZmZmMDAwMDA+Owo+ID4gPiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ID4gPiAr
CQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4gPiA+IAo+ID4gPiBUaGUgZHQtYmluZGluZyBzYXlzIGFk
ZHJlc3MtY2VsbHMgYW5kIHNpemUtY2VsbHMgc2hvdWxkIGJlIDEuCj4gPiA+IFRoZW4KPiA+ID4g
bW9zdCBvZiB0aGUKPiA+ID4gZXh0cmEgMHMgY2FuIGJlIGRyb3BwZWQgZnJvbSByYW5nZXMgYW5k
IHRoZSBjaGlsZHJlbidzIHJlZ3MuCj4gPiA+IAo+ID4gPiBPdGhlciB0aGFuIHRoYXQsCj4gPiA+
IAo+ID4gPiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bj
b2xsYWJvcmEuY29tPgo+ID4gPiAKPiA+ID4gVGhhbmtzLAo+ID4gPiBOw61jb2xhcwo+ID4gPiAK
PiA+IAo+ID4gSSBoYXZlIGNoZWNrZWQgdGhlIGRlc2NyaXB0aW9uIGluIG1lZGlhdGVrLHZjb2Rl
Yy1zdWJkZXYtCj4gPiBkZWNvZGVyLnlhbWwKPiA+IAo+ID4gYWRkcmVzcy1jZWxscyBhbmQgc2l6
ZS1jZWxscyBhcmUgdHdvIGFmdGVyIHRoZSBiZWxvdyBjb21taXQgaXMKPiA+IG1lcmdlZC4KPiA+
IAo+ID4gbWVkaWE6IG1lZGlhdGVrLHZjb2RlYzogRml4IGFkZHJlc3NpbmcgY2VsbCBzaXplcwo+
ID4gbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0Cj4gPiBjb21taXQvaWQ9YTUw
ZTQzMWJiYzZmYzU3NjhlZDI2YmU1ZmFiNWIxNDliN2I4YjFmZQo+IAo+IEhpIEFsbGVuLAo+IAo+
IHllcywgeW91J3JlIHJpZ2h0LiBJIG1pc3NlZCB0aGF0IGNvbW1pdCwgc29ycnkuIFRoaXMgcGF0
Y2ggaXMKPiBwZXJmZWN0bHkgZmluZQo+IGFzIGl0IGlzIHRoZW4uCj4gCj4gVGhhbmtzLAo+IE7D
rWNvbGFzCj4gCj4gPiAKPiA+IENvcnJlY3QgbWUgaWYgSSBnb3QgdGhpcyB3cm9uZy4KPiA+IAo+
ID4gVGhhbmtzLAo+ID4gQWxsZW4KPiA+IAo+ID4gPiA+ICsJCQlyYW5nZXMgPSA8MCAwIDAgMHgx
NjAwMDAwMCAwIDB4MjYwMDA+Owo+ID4gPiA+ICsKPiA+ID4gPiArCQkJdmNvZGVjX2xhdDogdmNv
ZGVjLWxhdEAxMDAwMCB7Cj4gPiA+ID4gKwkJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ay0K
PiA+ID4gPiB2Y29kZWMtbGF0IjsKPiA+ID4gPiArCQkJCXJlZyA9IDwweDAgMHgxMDAwMCAwIDB4
ODAwPjsKPiA+ID4gPiArCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA0MjYKPiA+ID4gPiBJUlFf
VFlQRV9MRVZFTF9ISUdIIDA+Owo+ID4gPiA+ICsJCQkJaW9tbXVzID0gPCZpb21tdTAKPiA+ID4g
PiBNNFVfUE9SVF9MNV9WREVDX0xBVDBfVkxEX0VYVD4sCj4gPiA+ID4gKwkJCQkJIDwmaW9tbXUw
Cj4gPiA+ID4gTTRVX1BPUlRfTDVfVkRFQ19MQVQwX1ZMRDJfRVhUPiwKPiA+ID4gPiArCQkJCQkg
PCZpb21tdTAKPiA+ID4gPiBNNFVfUE9SVF9MNV9WREVDX0xBVDBfQVZDX01WX0VYVD4sCj4gPiA+
ID4gKwkJCQkJIDwmaW9tbXUwCj4gPiA+ID4gTTRVX1BPUlRfTDVfVkRFQ19MQVQwX1BSRURfUkRf
RVhUPiwKPiA+ID4gPiArCQkJCQkgPCZpb21tdTAKPiA+ID4gPiBNNFVfUE9SVF9MNV9WREVDX0xB
VDBfVElMRV9FWFQ+LAo+ID4gPiA+ICsJCQkJCSA8JmlvbW11MAo+ID4gPiA+IE00VV9QT1JUX0w1
X1ZERUNfTEFUMF9XRE1BX0VYVD4sCj4gPiA+ID4gKwkJCQkJIDwmaW9tbXUwCj4gPiA+ID4gTTRV
X1BPUlRfTDVfVkRFQ19MQVQwX1JHX0NUUkxfRE1BX0VYVD4sCj4gPiA+ID4gKwkJCQkJIDwmaW9t
bXUwCj4gPiA+ID4gTTRVX1BPUlRfTDVfVkRFQ19VRk9fRU5DX0VYVD47Cj4gPiA+ID4gKwkJCQlj
bG9ja3MgPSA8JnRvcGNrZ2VuCj4gPiA+ID4gQ0xLX1RPUF9WREVDX1NFTD4sCj4gPiA+ID4gKwkJ
CQkJIDwmdmRlY3N5c19zb2MKPiA+ID4gPiBDTEtfVkRFQ19TT0NfVkRFQz4sCj4gPiA+ID4gKwkJ
CQkJIDwmdmRlY3N5c19zb2MKPiA+ID4gPiBDTEtfVkRFQ19TT0NfTEFUPiwKPiA+ID4gPiArCQkJ
CQkgPCZ2ZGVjc3lzX3NvYwo+ID4gPiA+IENMS19WREVDX1NPQ19MQVJCMT4sCj4gPiA+ID4gKwkJ
CQkJIDwmdG9wY2tnZW4KPiA+ID4gPiBDTEtfVE9QX01BSU5QTExfRDQ+Owo+ID4gPiA+ICsJCQkJ
Y2xvY2stbmFtZXMgPSAic2VsIiwgInNvYy0KPiA+ID4gPiB2ZGVjIiwgInNvYy0KPiA+ID4gPiBs
YXQiLCAidmRlYyIsICJ0b3AiOwo+ID4gPiA+ICsJCQkJYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bj
a2dlbgo+ID4gPiA+IENMS19UT1BfVkRFQ19TRUw+Owo+ID4gPiA+ICsJCQkJYXNzaWduZWQtY2xv
Y2stcGFyZW50cyA9Cj4gPiA+ID4gPCZ0b3Bja2dlbgo+ID4gPiA+IENMS19UT1BfTUFJTlBMTF9E
ND47Cj4gPiA+ID4gKwkJCQlwb3dlci1kb21haW5zID0gPCZzcG0KPiA+ID4gPiBNVDgxOTJfUE9X
RVJfRE9NQUlOX1ZERUM+Owo+ID4gPiA+ICsJCQl9Owo+ID4gPiA+ICsKPiA+ID4gPiArCQkJdmNv
ZGVjX2NvcmU6IHZjb2RlYy1jb3JlQDI1MDAwIHsKPiA+ID4gPiArCQkJCWNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXRrLQo+ID4gPiA+IHZjb2RlYy0KPiA+ID4gPiBjb3JlIjsKPiA+ID4gPiArCQkJ
CXJlZyA9IDwwIDB4MjUwMDAgMCAweDEwMDA+Owo+ID4gPiA+ICsJCQkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDQyNQo+ID4gPiA+IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Cj4gPiA+ID4gKwkJCQlp
b21tdXMgPSA8JmlvbW11MAo+ID4gPiA+IE00VV9QT1JUX0w0X1ZERUNfTUNfRVhUPiwKPiA+ID4g
PiArCQkJCQkgPCZpb21tdTAKPiA+ID4gPiBNNFVfUE9SVF9MNF9WREVDX1VGT19FWFQ+LAo+ID4g
PiA+ICsJCQkJCSA8JmlvbW11MAo+ID4gPiA+IE00VV9QT1JUX0w0X1ZERUNfUFBfRVhUPiwKPiA+
ID4gPiArCQkJCQkgPCZpb21tdTAKPiA+ID4gPiBNNFVfUE9SVF9MNF9WREVDX1BSRURfUkRfRVhU
PiwKPiA+ID4gPiArCQkJCQkgPCZpb21tdTAKPiA+ID4gPiBNNFVfUE9SVF9MNF9WREVDX1BSRURf
V1JfRVhUPiwKPiA+ID4gPiArCQkJCQkgPCZpb21tdTAKPiA+ID4gPiBNNFVfUE9SVF9MNF9WREVD
X1BQV1JBUF9FWFQ+LAo+ID4gPiA+ICsJCQkJCSA8JmlvbW11MAo+ID4gPiA+IE00VV9QT1JUX0w0
X1ZERUNfVElMRV9FWFQ+LAo+ID4gPiA+ICsJCQkJCSA8JmlvbW11MAo+ID4gPiA+IE00VV9QT1JU
X0w0X1ZERUNfVkxEX0VYVD4sCj4gPiA+ID4gKwkJCQkJIDwmaW9tbXUwCj4gPiA+ID4gTTRVX1BP
UlRfTDRfVkRFQ19WTEQyX0VYVD4sCj4gPiA+ID4gKwkJCQkJIDwmaW9tbXUwCj4gPiA+ID4gTTRV
X1BPUlRfTDRfVkRFQ19BVkNfTVZfRVhUPiwKPiA+ID4gPiArCQkJCQkgPCZpb21tdTAKPiA+ID4g
PiBNNFVfUE9SVF9MNF9WREVDX1JHX0NUUkxfRE1BX0VYVD47Cj4gPiA+ID4gKwkJCQljbG9ja3Mg
PSA8JnRvcGNrZ2VuCj4gPiA+ID4gQ0xLX1RPUF9WREVDX1NFTD4sCj4gPiA+ID4gKwkJCQkJIDwm
dmRlY3N5cwo+ID4gPiA+IENMS19WREVDX1ZERUM+LAo+ID4gPiA+ICsJCQkJCSA8JnZkZWNzeXMK
PiA+ID4gPiBDTEtfVkRFQ19MQVQ+LAo+ID4gPiA+ICsJCQkJCSA8JnZkZWNzeXMKPiA+ID4gPiBD
TEtfVkRFQ19MQVJCMT4sCj4gPiA+ID4gKwkJCQkJIDwmdG9wY2tnZW4KPiA+ID4gPiBDTEtfVE9Q
X01BSU5QTExfRDQ+Owo+ID4gPiA+ICsJCQkJY2xvY2stbmFtZXMgPSAic2VsIiwgInNvYy0KPiA+
ID4gPiB2ZGVjIiwgInNvYy0KPiA+ID4gPiBsYXQiLCAidmRlYyIsICJ0b3AiOwo+ID4gPiA+ICsJ
CQkJYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bja2dlbgo+ID4gPiA+IENMS19UT1BfVkRFQ19TRUw+
Owo+ID4gPiA+ICsJCQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9Cj4gPiA+ID4gPCZ0b3Bja2dl
bgo+ID4gPiA+IENMS19UT1BfTUFJTlBMTF9END47Cj4gPiA+ID4gKwkJCQlwb3dlci1kb21haW5z
ID0gPCZzcG0KPiA+ID4gPiBNVDgxOTJfUE9XRVJfRE9NQUlOX1ZERUMyPjsKPiA+ID4gPiArCQkJ
fTsKPiA+ID4gPiArCQl9Owo+ID4gPiA+ICsKPiA+ID4gPiAgCQlsYXJiNTogbGFyYkAxNjAwZDAw
MCB7Cj4gPiA+ID4gIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXNtaS0KPiA+ID4g
PiBsYXJiIjsKPiA+ID4gPiAgCQkJcmVnID0gPDAgMHgxNjAwZDAwMCAwIDB4MTAwMD47Cj4gPiA+
ID4gLS0gCj4gPiA+ID4gMi4xOC4wCj4gPiA+ID4gCj4gPiA+ID4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
