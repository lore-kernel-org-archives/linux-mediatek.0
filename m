Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36116C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFZLY6/jB5A/0wTzmKkZ6PjQ0KCNBCYgjqXIbOqJxJA=; b=SIOc2Qp3Kl3fuu
	2rtBxqvBDXIFdavAaNlocrJrEllu0sKUcmahDml3zzFdWvCM1psJxBd9IngPLYnrBs7Ki+U0soaVh
	oHaWmGBz4G8QJJRZ4I5QMXPy69I83/HVS5x1L11F5Jh3wjdlsQg1u1SHvmlGTEiTHI+qzQGIFUuFk
	TkpGOCcbvnmNFtmrpcqPuz/qWiZVbmf7v7Z7Wi1HfHveyAN65Vy+bgBlJVM0WQCcn6TyCkmTHUUx7
	oKBdtAysE/Uwaj3hepjZ2LmChvziv/z1E4qPRqvSi4A+oBLwvLyeDcBPD1QY4jHEcp2sTbIbSxZhq
	uF/98GeXBP+/dHik0fkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXJu-00HNYx-6f; Wed, 13 Apr 2022 07:21:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXJr-00HNXX-9r; Wed, 13 Apr 2022 07:21:40 +0000
X-UUID: 0756b71bc8b14b429c03c1cee57fd1b2-20220413
X-UUID: 0756b71bc8b14b429c03c1cee57fd1b2-20220413
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 642922908; Wed, 13 Apr 2022 00:21:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 00:21:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 15:21:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 15:21:29 +0800
Message-ID: <649d747ceddc7fbd3f226f4448874665231ae744.camel@mediatek.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8192: Add vcodec lat and core nodes
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
Date: Wed, 13 Apr 2022 15:21:29 +0800
In-Reply-To: <20220412230819.vnbdv6wpsg73eqzi@notapiano>
References: <20220408104124.31395-1-allen-kh.cheng@mediatek.com>
 <20220408104124.31395-2-allen-kh.cheng@mediatek.com>
 <20220412230819.vnbdv6wpsg73eqzi@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_002139_386170_9A662E32 
X-CRM114-Status: GOOD (  19.89  )
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

SGkgTsOtY29sYXMsCgpPbiBUdWUsIDIwMjItMDQtMTIgYXQgMTk6MDggLTA0MDAsIE7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvIHdyb3RlOgo+IEhpIEFsbGVuLAo+IAo+IE9uIEZyaSwgQXByIDA4LCAy
MDIyIGF0IDA2OjQxOjI0UE0gKzA4MDAsIEFsbGVuLUtIIENoZW5nIHdyb3RlOgo+ID4gQWRkIHZj
b2RlYyBsYXQgYW5kIGNvcmUgbm9kZXMgZm9yIG10ODE5MiBTb0MuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPAo+ID4gYW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSB8IDYwCj4gPiArKysrKysrKysrKysrKysrKysrKysr
KysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBpbmRleCAxOGE1ODIzOWQ2
ZjEuLmM3ZjRiMmZiYjMxNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTkyLmR0c2kKPiA+IEBAIC0xMTIwLDYgKzExMjAsNjYgQEAKPiA+ICAJCQlwb3dlci1kb21h
aW5zID0gPCZzcG0KPiA+IE1UODE5Ml9QT1dFUl9ET01BSU5fSVNQMj47Cj4gPiAgCQl9Owo+ID4g
IAo+ID4gKwkJdmNvZGVjX2RlYzogdmNvZGVjLWRlY0AxNjAwMDAwMCB7Cj4gPiArCQkJY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItdmNvZGVjLWRlYyI7Cj4gPiArCQkJcmVnID0gPDAgMHgx
NjAwMDAwMCAwIDB4MTAwMD47Cj4gPiArCQkJbWVkaWF0ZWssc2NwID0gPCZzY3A+Owo+ID4gKwkJ
CWlvbW11cyA9IDwmaW9tbXUwIE00VV9QT1JUX0w0X1ZERUNfTUNfRVhUPjsKPiA+ICsJCQlkbWEt
cmFuZ2VzID0gPDB4MSAweDAgMHgwIDB4NDAwMDAwMDAgMHgwCj4gPiAweGZmZjAwMDAwPjsKPiA+
ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICsJCQkjc2l6ZS1jZWxscyA9IDwyPjsKPiAK
PiBUaGUgZHQtYmluZGluZyBzYXlzIGFkZHJlc3MtY2VsbHMgYW5kIHNpemUtY2VsbHMgc2hvdWxk
IGJlIDEuIFRoZW4KPiBtb3N0IG9mIHRoZQo+IGV4dHJhIDBzIGNhbiBiZSBkcm9wcGVkIGZyb20g
cmFuZ2VzIGFuZCB0aGUgY2hpbGRyZW4ncyByZWdzLgo+IAo+IE90aGVyIHRoYW4gdGhhdCwKPiAK
PiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJv
cmEuY29tPgo+IAo+IFRoYW5rcywKPiBOw61jb2xhcwo+IAoKSSBoYXZlIGNoZWNrZWQgdGhlIGRl
c2NyaXB0aW9uIGluIG1lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sCgphZGRyZXNz
LWNlbGxzIGFuZCBzaXplLWNlbGxzIGFyZSB0d28gYWZ0ZXIgdGhlIGJlbG93IGNvbW1pdCBpcyBt
ZXJnZWQuCgptZWRpYTogbWVkaWF0ZWssdmNvZGVjOiBGaXggYWRkcmVzc2luZyBjZWxsIHNpemVz
CmxpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdApjb21taXQvaWQ9YTUwZTQzMWJi
YzZmYzU3NjhlZDI2YmU1ZmFiNWIxNDliN2I4YjFmZQoKQ29ycmVjdCBtZSBpZiBJIGdvdCB0aGlz
IHdyb25nLgoKVGhhbmtzLApBbGxlbgoKPiA+ICsJCQlyYW5nZXMgPSA8MCAwIDAgMHgxNjAwMDAw
MCAwIDB4MjYwMDA+Owo+ID4gKwo+ID4gKwkJCXZjb2RlY19sYXQ6IHZjb2RlYy1sYXRAMTAwMDAg
ewo+ID4gKwkJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ay12Y29kZWMtbGF0IjsKPiA+ICsJ
CQkJcmVnID0gPDB4MCAweDEwMDAwIDAgMHg4MDA+Owo+ID4gKwkJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNDI2Cj4gPiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Owo+ID4gKwkJCQlpb21tdXMgPSA8
JmlvbW11MAo+ID4gTTRVX1BPUlRfTDVfVkRFQ19MQVQwX1ZMRF9FWFQ+LAo+ID4gKwkJCQkJIDwm
aW9tbXUwCj4gPiBNNFVfUE9SVF9MNV9WREVDX0xBVDBfVkxEMl9FWFQ+LAo+ID4gKwkJCQkJIDwm
aW9tbXUwCj4gPiBNNFVfUE9SVF9MNV9WREVDX0xBVDBfQVZDX01WX0VYVD4sCj4gPiArCQkJCQkg
PCZpb21tdTAKPiA+IE00VV9QT1JUX0w1X1ZERUNfTEFUMF9QUkVEX1JEX0VYVD4sCj4gPiArCQkJ
CQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0w1X1ZERUNfTEFUMF9USUxFX0VYVD4sCj4gPiArCQkJ
CQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0w1X1ZERUNfTEFUMF9XRE1BX0VYVD4sCj4gPiArCQkJ
CQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0w1X1ZERUNfTEFUMF9SR19DVFJMX0RNQV9FWFQ+LAo+
ID4gKwkJCQkJIDwmaW9tbXUwCj4gPiBNNFVfUE9SVF9MNV9WREVDX1VGT19FTkNfRVhUPjsKPiA+
ICsJCQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1ZERUNfU0VMPiwKPiA+ICsJCQkJCSA8
JnZkZWNzeXNfc29jCj4gPiBDTEtfVkRFQ19TT0NfVkRFQz4sCj4gPiArCQkJCQkgPCZ2ZGVjc3lz
X3NvYwo+ID4gQ0xLX1ZERUNfU09DX0xBVD4sCj4gPiArCQkJCQkgPCZ2ZGVjc3lzX3NvYwo+ID4g
Q0xLX1ZERUNfU09DX0xBUkIxPiwKPiA+ICsJCQkJCSA8JnRvcGNrZ2VuCj4gPiBDTEtfVE9QX01B
SU5QTExfRDQ+Owo+ID4gKwkJCQljbG9jay1uYW1lcyA9ICJzZWwiLCAic29jLXZkZWMiLCAic29j
LQo+ID4gbGF0IiwgInZkZWMiLCAidG9wIjsKPiA+ICsJCQkJYXNzaWduZWQtY2xvY2tzID0gPCZ0
b3Bja2dlbgo+ID4gQ0xLX1RPUF9WREVDX1NFTD47Cj4gPiArCQkJCWFzc2lnbmVkLWNsb2NrLXBh
cmVudHMgPSA8JnRvcGNrZ2VuCj4gPiBDTEtfVE9QX01BSU5QTExfRDQ+Owo+ID4gKwkJCQlwb3dl
ci1kb21haW5zID0gPCZzcG0KPiA+IE1UODE5Ml9QT1dFUl9ET01BSU5fVkRFQz47Cj4gPiArCQkJ
fTsKPiA+ICsKPiA+ICsJCQl2Y29kZWNfY29yZTogdmNvZGVjLWNvcmVAMjUwMDAgewo+ID4gKwkJ
CQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ay12Y29kZWMtCj4gPiBjb3JlIjsKPiA+ICsJCQkJ
cmVnID0gPDAgMHgyNTAwMCAwIDB4MTAwMD47Cj4gPiArCQkJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSA0MjUKPiA+IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Cj4gPiArCQkJCWlvbW11cyA9IDwmaW9t
bXUwCj4gPiBNNFVfUE9SVF9MNF9WREVDX01DX0VYVD4sCj4gPiArCQkJCQkgPCZpb21tdTAKPiA+
IE00VV9QT1JUX0w0X1ZERUNfVUZPX0VYVD4sCj4gPiArCQkJCQkgPCZpb21tdTAKPiA+IE00VV9Q
T1JUX0w0X1ZERUNfUFBfRVhUPiwKPiA+ICsJCQkJCSA8JmlvbW11MAo+ID4gTTRVX1BPUlRfTDRf
VkRFQ19QUkVEX1JEX0VYVD4sCj4gPiArCQkJCQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0w0X1ZE
RUNfUFJFRF9XUl9FWFQ+LAo+ID4gKwkJCQkJIDwmaW9tbXUwCj4gPiBNNFVfUE9SVF9MNF9WREVD
X1BQV1JBUF9FWFQ+LAo+ID4gKwkJCQkJIDwmaW9tbXUwCj4gPiBNNFVfUE9SVF9MNF9WREVDX1RJ
TEVfRVhUPiwKPiA+ICsJCQkJCSA8JmlvbW11MAo+ID4gTTRVX1BPUlRfTDRfVkRFQ19WTERfRVhU
PiwKPiA+ICsJCQkJCSA8JmlvbW11MAo+ID4gTTRVX1BPUlRfTDRfVkRFQ19WTEQyX0VYVD4sCj4g
PiArCQkJCQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0w0X1ZERUNfQVZDX01WX0VYVD4sCj4gPiAr
CQkJCQkgPCZpb21tdTAKPiA+IE00VV9QT1JUX0w0X1ZERUNfUkdfQ1RSTF9ETUFfRVhUPjsKPiA+
ICsJCQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1ZERUNfU0VMPiwKPiA+ICsJCQkJCSA8
JnZkZWNzeXMgQ0xLX1ZERUNfVkRFQz4sCj4gPiArCQkJCQkgPCZ2ZGVjc3lzIENMS19WREVDX0xB
VD4sCj4gPiArCQkJCQkgPCZ2ZGVjc3lzIENMS19WREVDX0xBUkIxPiwKPiA+ICsJCQkJCSA8JnRv
cGNrZ2VuCj4gPiBDTEtfVE9QX01BSU5QTExfRDQ+Owo+ID4gKwkJCQljbG9jay1uYW1lcyA9ICJz
ZWwiLCAic29jLXZkZWMiLCAic29jLQo+ID4gbGF0IiwgInZkZWMiLCAidG9wIjsKPiA+ICsJCQkJ
YXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bja2dlbgo+ID4gQ0xLX1RPUF9WREVDX1NFTD47Cj4gPiAr
CQkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuCj4gPiBDTEtfVE9QX01BSU5Q
TExfRDQ+Owo+ID4gKwkJCQlwb3dlci1kb21haW5zID0gPCZzcG0KPiA+IE1UODE5Ml9QT1dFUl9E
T01BSU5fVkRFQzI+Owo+ID4gKwkJCX07Cj4gPiArCQl9Owo+ID4gKwo+ID4gIAkJbGFyYjU6IGxh
cmJAMTYwMGQwMDAgewo+ID4gIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXNtaS1s
YXJiIjsKPiA+ICAJCQlyZWcgPSA8MCAweDE2MDBkMDAwIDAgMHgxMDAwPjsKPiA+IC0tIAo+ID4g
Mi4xOC4wCj4gPiAKPiA+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
