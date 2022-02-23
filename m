Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F896C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ku16DGAb1dSc7NIXMZLlVgdYmUWb7hmI6jdMmWIA1k=; b=YRtDyaKDYUV1hK
	L2Nx2LqrpcbD+Wo6MYb2NQMnc6+DhLy/CqHH90euHFP8DOCEVnAGDaIRp6s5gKoeUosVNLImtyMQC
	baxqlE8cipCSwReNsFzKj5umyYFdLXGR7mEteJEWkeJ8pPZFYo7Zr81ZEougZhn+VB8MTtWAnBLo3
	1ZcwtZ09V0aFaI+FMpmo9EAQMwN1FTUjEiCITobm/ISwu09/8BmHPcIipny95/lvNGJdJ0kyHM8+g
	m0+IDnRtRaa2CdDuozvC3ZknXlx3UHVvxiYqO93Eepci1+f+1+WZgK27i3JzcFlWt1a75ee7AayFl
	hp19Z5Yj+kcinyuhBmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrsL-00EYSI-0i; Wed, 23 Feb 2022 13:40:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrs2-00EYN0-EP; Wed, 23 Feb 2022 13:39:56 +0000
X-UUID: 6de6068aefc44b6fa1b854185f2f9a7f-20220223
X-UUID: 6de6068aefc44b6fa1b854185f2f9a7f-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1113838071; Wed, 23 Feb 2022 06:39:50 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:39:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 21:39:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:39:39 +0800
Message-ID: <1c9ceae8eccbc17e43bdf5b44def09cea618dce4.camel@mediatek.com>
Subject: Re: [PATCH v2 17/23] arm64: dts: mt8192: Add vcodec lat and core nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:39:39 +0800
In-Reply-To: <20220222223355.o4o6v7yxozsnkz33@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-18-allen-kh.cheng@mediatek.com>
 <20220222223355.o4o6v7yxozsnkz33@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_053954_515444_47500D3B 
X-CRM114-Status: GOOD (  21.02  )
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

T24gVHVlLCAyMDIyLTAyLTIyIGF0IDE3OjMzIC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjoyN1BNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCB2Y29kZWMgbGF0IGFuZCBjb3JlIG5vZGVzIGZvciBt
dDgxOTIgU29DLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8YWxsZW4t
a2guY2hlbmdAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTIuZHRzaSB8IDU4Cj4gPiArKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBpbmRleCA5MzZhYTc4ODY2NGYuLjU0
M2E4MDI1MmNlNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTkyLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTky
LmR0c2kKPiA+IEBAIC0xMjkxLDYgKzEyOTEsNjQgQEAKPiA+ICAJCQlwb3dlci1kb21haW5zID0g
PCZzcG0KPiA+IE1UODE5Ml9QT1dFUl9ET01BSU5fSVNQMj47Cj4gPiAgCQl9Owo+ID4gIAo+ID4g
KwkJdmNvZGVjX2RlYzogdmNvZGVjX2RlY0AxNjAwMDAwMCB7Cj4gCj4gSXQncyB1c3VhbGx5IHBy
ZWZlcnJlZCB0byB1c2UgJy0nIGluc3RlYWQgb2YgJ18nIGluIHRoZSBub2RlIG5hbWUsCj4gbGlr
ZToKPiAKPiAJCXZjb2RlY19kZWM6IHZjb2RlYy1kZWNAMTYwMDAwMDAgewo+IAo+IFNhbWUgdGhp
bmcgZm9yIHRoZSBvdGhlciB2Y29kZWMgbm9kZXMgYmVsb3cuCj4gCj4gQnV0IG1vcmUgaW1wb3J0
YW50bHksIHRoZQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRp
YXRlayx2Y29kZWMtc3ViZGV2LQo+IGRlY29kZXIueWFtbAo+IGR0LWJpbmRpbmcgc2hvd3MgdGhl
IG10ay12Y29kZWMtbGF0IGFuZCBtdGstdmNvZGVjLWNvcmUgYXMgc3Vibm9kZXMKPiBvZgo+IHZj
b2RlYy1kZWMuIFNvIEkgd291bGQgZm9sbG93IHRoYXQgc2FtZSBzdHJ1Y3R1cmUgaGVyZS4gVW5s
ZXNzIGl0Cj4gZG9lcyBtYWtlIG1vcmUKPiBzZW5zZSB0byBoYXZlIHRoZSBub2RlcyBzZXBhcmF0
ZSBsaWtlIHRoaXMsIGJ1dCBpbiB0aGF0IGNhc2UgdGhlIGR0LQo+IGJpbmRpbmcKPiBzaG91bGQg
YmUgdXBkYXRlZC4KPiAKSGkgTsOtY29sYXMKCkkgdGhpbmsgaXQncyBvayBzZXQgbXRrLXZjb2Rl
Yy1sYXQgYW5kIG10ay12Y29kZWMtY29yZSBhcyBzdWJub2RlcyBvZgp2Y29kZWMtZGVjLgoKSSB3
aWxsIHJldGVzdCBpbiBtdDgxOTIgcHJvZHVjdCBhbmQgbWFrZSBzdXJlIHRoaXMgd29ya3MuCgpN
YW55IHRoYW5rcywKQWxsZW4KCj4gPiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTIt
dmNvZGVjLWRlYyI7Cj4gPiArCQkJcmVnID0gPDAgMHgxNjAwMDAwMCAwIDB4MTAwMD47CQkvKgo+
ID4gVkRFQ19TWVMgKi8KPiA+ICsJCQltZWRpYXRlayxzY3AgPSA8JnNjcD47Cj4gPiArCQkJaW9t
bXVzID0gPCZpb21tdTAgTTRVX1BPUlRfTDRfVkRFQ19NQ19FWFQ+Owo+ID4gKwkJfTsKPiA+ICsK
PiA+ICsJCXZjb2RlY19sYXQ6IHZjb2RlY19sYXRAMHgxNjAxMDAwMCB7Cj4gCj4gQWdhaW4sIHBs
ZWFzZSBkcm9wIHRoZSAnMHgnIHByZWZpeC4KPiAKPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ay12Y29kZWMtbGF0IjsKPiA+ICsJCQlyZWcgPSA8MCAweDE2MDEwMDAwIDAgMHg4MDA+
OwkJLyoKPiA+IFZERUNfTUlTQyAqLwo+ID4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA0MjYg
SVJRX1RZUEVfTEVWRUxfSElHSAo+ID4gMD47Cj4gPiArCQkJaW9tbXVzID0gPCZpb21tdTAKPiA+
IE00VV9QT1JUX0w1X1ZERUNfTEFUMF9WTERfRVhUPiwKPiA+ICsJCQkJPCZpb21tdTAKPiA+IE00
VV9QT1JUX0w1X1ZERUNfTEFUMF9WTEQyX0VYVD4sCj4gPiArCQkJCTwmaW9tbXUwCj4gPiBNNFVf
UE9SVF9MNV9WREVDX0xBVDBfQVZDX01WX0VYVD4sCj4gPiArCQkJCTwmaW9tbXUwCj4gPiBNNFVf
UE9SVF9MNV9WREVDX0xBVDBfUFJFRF9SRF9FWFQ+LAo+ID4gKwkJCQk8JmlvbW11MAo+ID4gTTRV
X1BPUlRfTDVfVkRFQ19MQVQwX1RJTEVfRVhUPiwKPiA+ICsJCQkJPCZpb21tdTAKPiA+IE00VV9Q
T1JUX0w1X1ZERUNfTEFUMF9XRE1BX0VYVD4sCj4gPiArCQkJCTwmaW9tbXUwCj4gPiBNNFVfUE9S
VF9MNV9WREVDX0xBVDBfUkdfQ1RSTF9ETUFfRVhUPiwKPiA+ICsJCQkJPCZpb21tdTAgTTRVX1BP
UlRfTDVfVkRFQ19VRk9fRU5DX0VYVD47Cj4gPiArCQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtf
VE9QX1ZERUNfU0VMPiwKPiA+ICsJCQkJIDwmdmRlY3N5c19zb2MgQ0xLX1ZERUNfU09DX1ZERUM+
LAo+ID4gKwkJCQkgPCZ2ZGVjc3lzX3NvYyBDTEtfVkRFQ19TT0NfTEFUPiwKPiA+ICsJCQkJIDwm
dmRlY3N5c19zb2MgQ0xLX1ZERUNfU09DX0xBUkIxPiwKPiA+ICsJCQkJIDwmdG9wY2tnZW4gQ0xL
X1RPUF9NQUlOUExMX0Q0PjsKPiA+ICsJCQljbG9jay1uYW1lcyA9ICJ2ZGVjLXNlbCIsICJ2ZGVj
LXNvYy12ZGVjIiwKPiA+ICJ2ZGVjLXNvYy1sYXQiLCAidmRlYy12ZGVjIiwKPiA+ICsJCQkJICAg
ICAgInZkZWMtdG9wIjsKPiA+ICsJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19U
T1BfVkRFQ19TRUw+Owo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2Vu
Cj4gPiBDTEtfVE9QX01BSU5QTExfRDQ+Owo+ID4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnNwbQo+
ID4gTVQ4MTkyX1BPV0VSX0RPTUFJTl9WREVDPjsKPiA+ICsJCX07Cj4gPiArCj4gPiArCQl2Y29k
ZWNfY29yZTogdmNvZGVjX2NvcmVAMHgxNjAyNTAwMCB7Cj4gCj4gRGl0dG8uCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
