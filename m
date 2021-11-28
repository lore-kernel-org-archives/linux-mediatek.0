Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC4C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ih0t/kd42gqas3c7kiD8h9ZYOWa50cRyDnYKqBPJDyM=; b=HIrNGHUneLipUR
	fazzueeIgfiZ37FAy2gxfTZEn5eZhNtjIlTUh72Dhi2hfLP062Yvol8npm5oT7LWeX6a9zRYlraO1
	R/Ppgf5ApbUYeP6Jy/AOXupV84hQ69+HOb/Fm8PH3Cw4d76154paZJ0O4VPdt8ONDZ9+/C7xhrPCF
	pH1bAodYGXw/uUCIEJTu4xG/r7fUDhF3Zpyvbv1yZAiB/cR8DG1CUAKOn/xyfIwbPjmlCETVLGws3
	srPqMhwQw28XwTnmJSXeKBr5E2PPxNk0Fmu3H/+DpAHlertIw1HLYXnNcbX15XkbxZwVI2ZmxIUvS
	wi8d6t4bk8DaubqYWBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMID-00G5oe-PC; Sun, 28 Nov 2021 15:40:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMI0-00G5mr-Em; Sun, 28 Nov 2021 15:40:29 +0000
X-UUID: a4b9499fae5140c9b3bcc781040537ab-20211128
X-UUID: a4b9499fae5140c9b3bcc781040537ab-20211128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 514197333; Sun, 28 Nov 2021 08:40:23 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 07:40:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 28 Nov 2021 23:40:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 28 Nov 2021 23:40:08 +0800
Message-ID: <8670ab73cf64f9e8e5c533587437c53f2c557463.camel@mediatek.com>
Subject: Re: [PATCH 2/3] mailbox: add cmdq_mbox_flush to clear all task
 before suspend
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fei
 Shao" <fshao@chromium.org>, <tzungbi@google.com>, Nancy Lin
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sun, 28 Nov 2021 23:40:08 +0800
In-Reply-To: <CAAOTY_-Ws7BmYr-87rb=MWYyGwSCCvv0AoPV10J7d+7TU+7OCA@mail.gmail.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-3-jason-jh.lin@mediatek.com>
 <CAAOTY_-Ws7BmYr-87rb=MWYyGwSCCvv0AoPV10J7d+7TU+7OCA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_074028_509377_2EB9EAC2 
X-CRM114-Status: GOOD (  31.67  )
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

SGkgQ2h1bi1LdWFuZywKClRoYW5rcyBmb3IgdGhlIHJldmlld3MuCgpPbiBGcmksIDIwMjEtMTEt
MTkgYXQgMDg6MDEgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gSGksIEphc29uOgo+IAo+
IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQxMeac
iDE35pelIOmAseS4iSDkuIvljYgyOjQy5a+r6YGT77yaCj4gPiAKPiA+IENNRFEgZHJpdmVyIHdp
bGwgb2NjdXB5IEdDRSBjbG9jayB0byBleGVjdXRlIHRoZSB0YXNrIGluIEdDRQo+ID4gdGhyZWFk
Lgo+ID4gCj4gPiBTbyBjYWxsIGNtZHFfbWJveF9mbHVzaCB0byBjbGVhciBhbGwgdGFzayBpbiBH
Q0UgdGhyZWFkIGJlZm9yZQo+ID4gQ01EUSBzdXNwZW5kLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIHwgOSArKystLS0tLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYwo+ID4gYi9kcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gPiBpbmRleCAwM2Y5ZWQ0YzUxMzEuLjI4Y2Fk
ZmMwMDkxYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmMKPiA+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiA+IEBAIC00
ODQsMjEgKzQ4NCwxOCBAQCBzdGF0aWMgaW50IGNtZHFfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gPiAgICAgICAgIHN0cnVjdCBjbWRxICpjbWRxID0gZGV2X2dldF9kcnZkYXRhKGRldik7
Cj4gPiAgICAgICAgIHN0cnVjdCBjbWRxX3RocmVhZCAqdGhyZWFkOwo+ID4gICAgICAgICBpbnQg
aTsKPiA+IC0gICAgICAgYm9vbCB0YXNrX3J1bm5pbmcgPSBmYWxzZTsKPiA+IAo+ID4gICAgICAg
ICBjbWRxLT5zdXNwZW5kZWQgPSB0cnVlOwo+ID4gCj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkg
PCBjbWRxLT50aHJlYWRfbnI7IGkrKykgewo+ID4gICAgICAgICAgICAgICAgIHRocmVhZCA9ICZj
bWRxLT50aHJlYWRbaV07Cj4gPiAgICAgICAgICAgICAgICAgaWYgKCFsaXN0X2VtcHR5KCZ0aHJl
YWQtPnRhc2tfYnVzeV9saXN0KSkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgdGFza19y
dW5uaW5nID0gdHJ1ZTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgLyogdHJ5IHRvIGNsZWFyIGFsbCB0YXNrIGluIHRoaXMgdGhy
ZWFkICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbWRxX21ib3hfZmx1c2godGhyZWFk
LT5jaGFuLCAyMDAwKTsKPiAKPiBJIHdvdWxkIGxpa2UgdGhlIG5vcm1hbCBjb250cm9sIGZsb3cg
cmF0aGVyIHRoYW4gZXJyb3IgaGFuZGxpbmcuIFNvCj4gdGhlIG5vcm1hbCBjb250cm9sIGZsb3cg
aXM6Cj4gCj4gMS4gQ2xpZW50IGRyaXZlciBzdXNwZW5kOiBGbHVzaCBjb21tYW5kLgo+IDIuIENN
RFEgZHJpdmVyIHN1c3BlbmQ6IFRoZXJlIGlzIG5vIGNvbW1hbmQgdG8gZmx1c2guIElmIHRoZXJl
IGFyZQo+IGNvbW1hbmQsIHNob3cgZXJyb3IgbWVzc2FnZSBhbmQgZGVidWcgdGhlIGNsaWVudCBk
cml2ZXIuCj4gCj4gVGhlIGVycm9yIGhhbmRsaW5nIGZsb3c6Cj4gCj4gMS4gQ2xpZW50IGRyaXZl
ciBzdXNwZW5kOiBEb2VzIG5vdCBmbHVzaCBjb21tYW5kLgo+IDIuIENNRFEgZHJpdmVyIHN1c3Bl
bmQ6IEZsdXNoIGNvbW1hbmQgYW5kIGNhbGxiYWNrIHRvIGNsaWVudCBkcml2ZXIuCj4gQ2xpZW50
IGRyaXZlciBwcm9jZXNzIHRoZXNlIGNhbGxiYWNrIGFzIGVycm9yIGhhbmRsaW5nLgo+IAo+IFRo
ZSBjbGllbnQgZHJpdmVyIG1heSBpbnRlZ3JhdGUgbXVsdGlwbGUgZHJpdmVyLiBJbiB0aGUgc3Vz
cGVuZCBmbG93LAo+IGl0IG1heSBuZWVkIHRvIHN0b3AgdGhlc2UgZHJpdmVyIGluIGEgc2VxdWVu
Y2Ugc3VjaCBhcy4KPiAKPiAxLiBTdG9wIGRyaXZlciAxCj4gMi4gU3RvcCBkcml2ZXIgMgo+IDMu
IFN0b3AgZHJpdmVyIDMgKGNtZHEpCj4gNC4gU3RvcCBkcml2ZXIgNAo+IDUuIFN0b3AgZHJpdmVy
IDUuCj4gCj4gSW4gdGhlIG5vcm1hbCBmbG93LCBjbGllbnQgZHJpdmVyIGNvdWxkIGNvbnRyb2wg
dGhlIHN0b3AgZmxvdy4gSW4gdGhlCj4gZXJyb3IgaGFuZGxpbmcgZmxvdywgaXQgZG9lcyBub3Qg
bWF0Y2ggdGhlIHN0b3AgZmxvdy4KPiAKPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4gCgpJIGhh
dmUgdHJpZWQgdGhlIG5vcm1hbCBmbG93OgoxLiBDbGllbnQgZHJpdmVyIHN1c3BlbmQ6IEZsdXNo
IGNvbW1hbmQuCjIuIENNRFEgZHJpdmVyIHN1c3BlbmQ6IFRoZXJlIGlzIG5vIGNvbW1hbmQgdG8g
Zmx1c2guIElmIHRoZXJlIGFyZQpjb21tYW5kLCBzaG93IGVycm9yIG1lc3NhZ2UgYW5kIGRlYnVn
IHRoZSBjbGllbnQgZHJpdmVyLgoKVGhlbiBJIGZvdW5kIHRoZSBjbWRxIHRhc2sgb2YgY3J0Y18x
IGlzIHN0aWxsIGV4ZWN1dGluZyB3aGVuCmNtZHFfc3VzcGVuZCBzb21ldGltZXMuIEkgdGhpbmsg
aXQgaXMgdGhlIGxhdGVzdCBhc3luYyBjbWQgc2VudCBpbgptdGtfZHJtX2NydGNfZGlzYWJsZS4K
U28gSSdsbCB0cnkgdG8gY2hhbmdlIGl0IHRvIGJsb2NraW5nIGNtZCBhbmQgc2VlIHRoZSBpc3N1
ZSBpcyBzdGlsbApoYXBwZW5lZCBvciBub3QuCgpJZiBpdCB3b3JrcywgdGhlbiBJJ2xsIHJldmVy
dCB0aGlzIHBhdGNoIGFuZCBzZW5kIGFkZCBibG9ja2luZyBjbWQgaW4KbXRrX2RybV9jcnRjX2Rp
c2FibGUgYXQgdGhlIG5leHQgdmVyc2lvbi4KClJlZ2FyZHMsCkphc29uLUpILkxpbgoKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGRldl93YXJuKGRldiwgInRocmVhZFslZF0gZXhpc3QgcnVu
bmluZwo+ID4gdGFzayhzKSBpbiBzdXNwZW5kXG4iLCBpKTsKPiA+ICAgICAgICAgICAgICAgICB9
Cj4gPiAgICAgICAgIH0KPiA+IAo+ID4gLSAgICAgICBpZiAodGFza19ydW5uaW5nKQo+ID4gLSAg
ICAgICAgICAgICAgIGRldl93YXJuKGRldiwgImV4aXN0IHJ1bm5pbmcgdGFzayhzKSBpbgo+ID4g
c3VzcGVuZFxuIik7Cj4gPiAtCj4gPiAgICAgICAgIGNsa19idWxrX3VucHJlcGFyZShjbWRxLT5n
Y2VfbnVtLCBjbWRxLT5jbG9ja3MpOwo+ID4gCj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gLS0K
PiA+IDIuMTguMAo+ID4gCi0tIApKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
