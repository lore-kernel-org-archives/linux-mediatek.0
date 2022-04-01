Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 07:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhNs1mYZBf9cPgBDcYWYg1oEa7Eyj2YW/QedRYpHG3Y=; b=vRZzDnkhrwm40S
	EOxQ2ku/XT+eUValaAVXEJME/JF+qywaeqrBeFU+wYU3O8SmobEIGO5uNPUyhWc90evvjNL2z4x8d
	GinxD4o8Y13I/KC6KSV9HTjaLtXMtZNWzE85nLuXc2Z4PG0HPk60dO91OSxcxJSLWj8qbrfv4UOQq
	3Uip2oV0lnAIPxfKnQC6zU64WRwActPuPL0sUuh4kw0OMhFE+72kBsmG7r4ieANyQ0hsZvXXnl/c6
	iwXzs+npwWN4/qQH0c8nXNbbADiterEDU5emVXjtolETUc0KGXOmRwakj3tof/re+QO6IWks5EOQ0
	sH/Dx9AfwiuwPDQeDBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naBT6-004jrn-2k; Fri, 01 Apr 2022 07:13:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naBT1-004jr0-SK; Fri, 01 Apr 2022 07:13:10 +0000
X-UUID: 50b2bfec061748a38fb8d2b2d86de15b-20220401
X-UUID: 50b2bfec061748a38fb8d2b2d86de15b-20220401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1318625615; Fri, 01 Apr 2022 00:13:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 00:07:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 15:07:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Apr 2022 15:07:31 +0800
Message-ID: <d16a032de75b5629553e5f3cd7ec32bf491089d8.camel@mediatek.com>
Subject: Re: [PATCH v4 02/22] arm64: dts: mt8192: Add spmi node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Fri, 1 Apr 2022 15:07:31 +0800
In-Reply-To: <701a4568d50ca60747731f6ccb1d7d14882d11b7.camel@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-3-allen-kh.cheng@mediatek.com>
 <8e482005-8f44-3502-3bca-0824f3e2dd7a@gmail.com>
 <701a4568d50ca60747731f6ccb1d7d14882d11b7.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_001307_957275_B18F7C35 
X-CRM114-Status: GOOD (  19.34  )
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

CkhpIE1hdHRoaWFzLAoKT24gV2VkLCAyMDIyLTAzLTMwIGF0IDE1OjIxICswODAwLCBhbGxlbi1r
aC5jaGVuZyB3cm90ZToKPiBIaSBNYXRoaWFzLAo+IAo+IE9uIFdlZCwgMjAyMi0wMy0yMyBhdCAx
ODoxNiArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiA+IAo+ID4gT24gMTgvMDMvMjAy
MiAxNTo0NSwgQWxsZW4tS0ggQ2hlbmcgd3JvdGU6Cj4gPiA+IEFkZCBzcG1pIG5vZGUgZm9yIG10
ODE5MiBTb0MuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8YWxs
ZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTog
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPAo+ID4gPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLmR0c2kgfCAxNyArKysrKysrKysrKysrKysrKwo+ID4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gPiBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+ID4gaW5kZXggNzY0Mjg1OTk0NDRlLi4w
ZjlmMjExY2E5ODYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLmR0c2kKPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTIuZHRzaQo+ID4gPiBAQCAtNTM1LDYgKzUzNSwyMyBAQAo+ID4gPiAgIAkJCWFzc2lnbmVk
LWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuCj4gPiA+IENMS19UT1BfT1NDX0QxMD47Cj4gPiA+
ICAgCQl9Owo+ID4gPiAgIAo+ID4gPiArCQlzcG1pOiBzcG1pQDEwMDI3MDAwIHsKPiA+ID4gKwkJ
CWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2ODczLXNwbWkiOwo+ID4gPiArCQkJcmVnID0gPDAg
MHgxMDAyNzAwMCAwIDB4MDAwZTAwPiwKPiA+ID4gKwkJCSAgICAgIDwwIDB4MTAwMjkwMDAgMCAw
eDAwMDEwMD47Cj4gPiA+ICsJCQlyZWctbmFtZXMgPSAicG1pZiIsICJzcG1pbXN0IjsKPiA+ID4g
KwkJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BNSUNfQVA+LAo+ID4gPiArCQkJCSA8
JmluZnJhY2ZnIENMS19JTkZSQV9QTUlDX1RNUj4sCj4gPiA+ICsJCQkJIDwmdG9wY2tnZW4gQ0xL
X1RPUF9TUE1JX01TVF9TRUw+Owo+ID4gPiArCQkJY2xvY2stbmFtZXMgPSAicG1pZl9zeXNfY2si
LAo+ID4gPiArCQkJCSAgICAgICJwbWlmX3Rtcl9jayIsCj4gPiA+ICsJCQkJICAgICAgInNwbWlt
c3RfY2xrX211eCI7Cj4gPiA+ICsJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuCj4gPiA+
IENMS19UT1BfUFdSQVBfVUxQT1NDX1NFTD47Cj4gPiA+ICsJCQlhc3NpZ25lZC1jbG9jay1wYXJl
bnRzID0gPCZ0b3Bja2dlbgo+ID4gPiBDTEtfVE9QX09TQ19EMTA+Owo+ID4gPiArCQkJI2FkZHJl
c3MtY2VsbHMgPSA8Mj47Cj4gPiA+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiA+IAo+ID4gV2hh
dCBkbyB3ZSBuZWVkIHRoZSBhZGRyZXNzLWNlbGxzIGFuZCBzaXplLWNlbGxzIGZvcj8KPiA+IAo+
ID4gUmVnYXJkcywKPiA+IE1hdHRoaWFzCj4gPiAKPiAKPiBXZSB3aWlsIGFkZCB0d28gcmVndWxh
dG9ycyBmb3IgYm9hcmQgbGV2ZWwgKG10ODE5Mi1hc3VyYWRhLmR0c2kpLgo+IAo+IEFkcmVzcy1j
ZWxscyBhbmQgc2l6ZS1jZWxscyBhcmUgdXNlZCB0byBkZW50aWZ5IHJlZ3VsYXRvci4KPiAKPiAm
c3BtaSB7Cj4gICAgICAgICBncnBpZCA9IDwxMT47Cj4gCj4gICAgICAgICBtdDYzMTVfNjogcG1p
Y0A2IHsKPiAgICAgICAgICAgICAgICAKPiBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjMxNS1y
ZWd1bGF0b3IiOwo+ICAgICAgICAgICAgICAgICByZWcgPSA8MHg2IDA+Owo+IAo+IAkJLi4uLgo+
ICAgICAgICAgfTsKPiAKPiAgICAgICAgIG10NjMxNV83OiBwbWljQDcgewo+ICAgICAgICAgICAg
ICAgIAo+IGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzE1LXJlZ3VsYXRvciI7Cj4gICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDcgMD47Cj4gCj4gCQkuLi4uCj4gICAgICAgICB9Owo+IH07Cj4g
Cj4gVGhhbmtzLAo+IEFsbGVuCj4gCgpJIGp1c3Qgd2FudG8gdG8gY29uZmlybSB3aXRoIHlvdS4K
CklzIHRoaXMgd2F5IG9rPwoKQmVzdCByZWdhcmRzLApBbGxlbgoKPiA+ID4gKwo+ID4gPiAgIAkJ
c2NwX2Fkc3A6IGNsb2NrLWNvbnRyb2xsZXJAMTA3MjAwMDAgewo+ID4gPiAgIAkJCWNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTkyLQo+ID4gPiBzY3BfYWRzcCI7Cj4gPiA+ICAgCQkJcmVnID0g
PDAgMHgxMDcyMDAwMCAwIDB4MTAwMD47Cj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
