Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C50EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 06:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/seK9qEhmsGBx6B12ZWo45Qgesn38tl7pmC7/AiDfGg=; b=2DgTvITZ5Zf0aD
	qdfwA72BkgnZzEubzenzr/XcthdQQUYhZ4uProdWsWaz4ekFNhxvp3YT+TjE9osfhM3GMVsdPe5uA
	DVQIPiUjG1GUr7GmucAQEzyPMBjBb8sJewizm14rnszqXrmJ6s5TLzs798aPWYCbe+2AsNosDOYW3
	AItOQPddfk/UxAdK0W4KdFP2LdK/kxOa4X3dh7uJYtVV4By2Nh/kxfnkEY/i6MmQ6gnwo2v/9p90c
	7R2520l/JaMySvpQHZXJkYH1tVJWaytlKQ6TSvQyb3kkEDLReXuxURZ2mejud50CqUiy0fAwHMe2x
	YU0M4Jn9tNS+myjK2YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWXnv-00A7YY-2B; Tue, 22 Mar 2022 06:15:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWXnr-00A7Xj-P8; Tue, 22 Mar 2022 06:15:37 +0000
X-UUID: c27a9c3927df4dccaa52b5198fb5c065-20220321
X-UUID: c27a9c3927df4dccaa52b5198fb5c065-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 229256097; Mon, 21 Mar 2022 23:15:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 23:15:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 14:15:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 14:15:28 +0800
Message-ID: <28c6f778b312b53ec22aec536dadfb3d7d85c35e.camel@mediatek.com>
Subject: Re: [PATCH v4 18/22] arm64: dts: mt8192: Add display nodes
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
Date: Tue, 22 Mar 2022 14:15:28 +0800
In-Reply-To: <20220321232657.6z2g3p2aflixzamp@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-19-allen-kh.cheng@mediatek.com>
 <20220321232657.6z2g3p2aflixzamp@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_231535_845829_DAC85EC3 
X-CRM114-Status: GOOD (  19.82  )
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

T24gTW9uLCAyMDIyLTAzLTIxIGF0IDE5OjI2IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBIaSBBbGxlbiwKPiAKPiBwbGVhc2Ugc2VlIG15IGNvbW1lbnQgYmVsb3cuCj4g
Cj4gT24gRnJpLCBNYXIgMTgsIDIwMjIgYXQgMTA6NDU6MzBQTSArMDgwMCwgQWxsZW4tS0ggQ2hl
bmcgd3JvdGU6Cj4gPiBBZGQgZGlzcGxheSBub2RlcyBmb3IgbXQ4MTkyIFNvQy4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hlbmcgPGFsbGVuLWtoLmNoZW5nQG1lZGlhdGVrLmNv
bT4KPiA+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8Cj4gPiBhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgMTExCj4gPiArKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+
ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBpbmRleCBh
NzdkNDA1ZGQ1MDguLjU5MTgzZmI2YzgwYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+IEBAIC0xMjA1LDYgKzEyMDUsMTMgQEAKPiA+ICAJCQkj
Y2xvY2stY2VsbHMgPSA8MT47Cj4gPiAgCQl9Owo+ID4gIAo+ID4gKwkJbXV0ZXg6IG11dGV4QDE0
MDAxMDAwIHsKPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kaXNwLW11dGV4
IjsKPiA+ICsJCQlyZWcgPSA8MCAweDE0MDAxMDAwIDAgMHgxMDAwPjsKPiA+ICsJCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMjUyIElSUV9UWVBFX0xFVkVMX0hJR0gKPiA+IDA+Owo+ID4gKwkJCWNs
b2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfTVVURVgwPjsKPiA+ICsJCX07Cj4gPiArCj4gPiAg
CQlzbWlfY29tbW9uOiBzbWlAMTQwMDIwMDAgewo+ID4gIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTkyLXNtaS1jb21tb24iOwo+ID4gIAkJCXJlZyA9IDwwIDB4MTQwMDIwMDAgMCAweDEw
MDA+Owo+ID4gQEAgLTEyMzYsNiArMTI0MywxMTAgQEAKPiA+ICAJCQlwb3dlci1kb21haW5zID0g
PCZzcG0KPiA+IE1UODE5Ml9QT1dFUl9ET01BSU5fRElTUD47Cj4gPiAgCQl9Owo+ID4gIAo+ID4g
KwkJb3ZsMDogb3ZsQDE0MDA1MDAwIHsKPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5Mi1kaXNwLW92bCI7Cj4gPiArCQkJcmVnID0gPDAgMHgxNDAwNTAwMCAwIDB4MTAwMD47Cj4g
PiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1NCBJUlFfVFlQRV9MRVZFTF9ISUdICj4gPiAw
PjsKPiA+ICsJCQljbG9ja3MgPSA8Jm1tc3lzIENMS19NTV9ESVNQX09WTDA+Owo+ID4gKwkJCWlv
bW11cyA9IDwmaW9tbXUwIE00VV9QT1JUX0wwX09WTF9SRE1BMD4sCj4gPiArCQkJCSA8JmlvbW11
MCBNNFVfUE9SVF9MMF9PVkxfUkRNQTBfSERSPjsKPiA+ICsJCQlwb3dlci1kb21haW5zID0gPCZz
cG0KPiA+IE1UODE5Ml9QT1dFUl9ET01BSU5fRElTUD47Cj4gPiArCQl9Owo+ID4gKwo+ID4gKwkJ
b3ZsXzJsMDogb3ZsQDE0MDA2MDAwIHsKPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5Mi1kaXNwLW92bC0ybCI7Cj4gPiArCQkJcmVnID0gPDAgMHgxNDAwNjAwMCAwIDB4MTAwMD47
Cj4gPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1NSBJUlFfVFlQRV9MRVZFTF9ISUdICj4g
PiAwPjsKPiA+ICsJCQlwb3dlci1kb21haW5zID0gPCZzcG0KPiA+IE1UODE5Ml9QT1dFUl9ET01B
SU5fRElTUD47Cj4gPiArCQkJY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRElTUF9PVkwwXzJMPjsK
PiA+ICsJCQlpb21tdXMgPSA8JmlvbW11MCBNNFVfUE9SVF9MMV9PVkxfMkxfUkRNQTA+LAo+ID4g
KwkJCQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0wxX09WTF8yTF9SRE1BMF9IRFI+Owo+ID4gKwkJ
fTsKPiA+ICsKPiA+ICsJCXJkbWEwOiByZG1hQDE0MDA3MDAwIHsKPiA+ICsJCQljb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE5Mi1kaXNwLXJkbWEiOwo+ID4gKwkJCXJlZyA9IDwwIDB4MTQwMDcw
MDAgMCAweDEwMDA+Owo+ID4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNTYgSVJRX1RZUEVf
TEVWRUxfSElHSAo+ID4gMD47Cj4gPiArCQkJY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRElTUF9S
RE1BMD47Cj4gPiArCQkJaW9tbXVzID0gPCZpb21tdTAgTTRVX1BPUlRfTDBfRElTUF9SRE1BMD47
Cj4gPiArCQkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjA+Owo+ID4gKwkJCW1lZGlhdGVrLHJkbWEt
Zmlmby1zaXplID0gPDUxMjA+Owo+ID4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnNwbQo+ID4gTVQ4
MTkyX1BPV0VSX0RPTUFJTl9ESVNQPjsKPiA+ICsJCX07Cj4gPiArCj4gPiArCQljb2xvcjA6IGNv
bG9yQDE0MDA5MDAwIHsKPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kaXNw
LWNvbG9yIiwKPiA+ICsJCQkJICAgICAibWVkaWF0ZWssbXQ4MTczLWRpc3AtY29sb3IiOwo+ID4g
KwkJCXJlZyA9IDwwIDB4MTQwMDkwMDAgMCAweDEwMDA+Owo+ID4gKwkJCWludGVycnVwdHMgPSA8
R0lDX1NQSSAyNTggSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4gMD47Cj4gPiArCQkJcG93ZXItZG9t
YWlucyA9IDwmc3BtCj4gPiBNVDgxOTJfUE9XRVJfRE9NQUlOX0RJU1A+Owo+ID4gKwkJCWNsb2Nr
cyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfQ09MT1IwPjsKPiA+ICsJCX07Cj4gPiArCj4gPiArCQlj
Y29ycjA6IGNjb3JyQDE0MDBhMDAwIHsKPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5Mi1kaXNwLWNjb3JyIjsKPiA+ICsJCQlyZWcgPSA8MCAweDE0MDBhMDAwIDAgMHgxMDAwPjsK
PiA+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjU5IElSUV9UWVBFX0xFVkVMX0hJR0gKPiA+
IDA+Owo+ID4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnNwbQo+ID4gTVQ4MTkyX1BPV0VSX0RPTUFJ
Tl9ESVNQPjsKPiA+ICsJCQljbG9ja3MgPSA8Jm1tc3lzIENMS19NTV9ESVNQX0NDT1JSMD47Cj4g
PiArCQl9Owo+ID4gKwo+ID4gKwkJYWFsMDogYWFsQDE0MDBiMDAwIHsKPiA+ICsJCQljb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kaXNwLWFhbCIsCj4gPiArCQkJCSAgICAgIm1lZGlhdGVr
LG10ODE5My1kaXNwLWFhbCI7Cj4gCj4gVHlwbzogIm1lZGlhdGVrLG10ODE5My1kaXNwLWFhbCIg
c2hvdWxkIGJlICJtZWRpYXRlayxtdDgxNzMtZGlzcC0KPiBhYWwiLCBvdGhlcndpc2UgCj4gdGhl
IGRybSBkcml2ZXIgZG9lc24ndCBldmVuIHByb2JlLiBUeXBvcyBoYXBwZW4sIGp1c3QgcGxlYXNl
IG1ha2UKPiBzdXJlIHlvdSdyZQo+IHRlc3RpbmcgYmVmb3JlIHNlbmRpbmcgdG8gdGhlIGxpc3Qg
c28gdGhlc2Uga2luZCBvZiBpc3N1ZXMgY2FuIGJlCj4gY2F1Z2h0Cj4gZWFybGllci4KPiAKPiBU
aGFua3MsCj4gTsOtY29sYXMKPiAKSGkgTsOtY29sYXMsCgpUaGFua3MgZm9yIHlvdXIga2luZGx5
IHJlbWluZGVyLgoKVGhlcmUgYXJlIHR3byBjb21wYXRpYmxlcyBpbiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMKKG1lZGlhdGVrLG10ODE3My1kaXNwLWFhbCBhZG4gbWVk
aWF0ZWssbXQ4MTgzLWRpc3AtYWFsKQoKSW4gODE5MiwgV2Ugc2hvdWxkIHVzZSBtZWRpYXRlayxt
dDgxODMtZGlzcC1hYWwgYmVjYXVzZSBvZiBkZXNpZ24uCgpEbyBJIG5lZWQgdG8gYWRkIHNvbWUg
aW5mb3JtYXRpb24gZm9yIHRoaXMgaW4gbWVkaWF0ZWssZGlzcC50eHQ/CgpCZXN0IHJlZ2FyZHMs
CkFsbGVuCgo+ID4gKwkJCXJlZyA9IDwwIDB4MTQwMGIwMDAgMCAweDEwMDA+Owo+ID4gKwkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAyNjAgSVJRX1RZUEVfTEVWRUxfSElHSAo+ID4gMD47Cj4gPiAr
CQkJcG93ZXItZG9tYWlucyA9IDwmc3BtCj4gPiBNVDgxOTJfUE9XRVJfRE9NQUlOX0RJU1A+Owo+
ID4gKwkJCWNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfQUFMMD47Cj4gPiArCQl9OwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
