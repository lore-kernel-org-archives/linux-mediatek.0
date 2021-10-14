Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68918C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:36:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30959610D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30959610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQqHzjsmSmMmx6lU6iowSnsl4Y6pWZWm/wdwzGTrK7M=; b=fvbxUcdKtoIRIF
	2PxXj/nNQboY+UkoR71Fqj6GghDoOnctad+0qkf3pzA0mmaQ2yZ9HjzCc0izVV1bPrfvBWedZfo69
	v91H28oqmLflt8WGq8w6PnFIA+whqrS7/Ju2EcCdiVATtwqX/M+dYbJ0795vroNsxjVR8B9pKz0KH
	YdYLQtDQLf87SvpLvtDC+p3Yjs4ZkFXjFtCYtNjiaUsroJObotZNLhqX+JC+3rtWPSd1uOc5GSdAS
	0PrzoFmHalNYhvSzEQU0Ya67D58L0vhHBbFAiFVlHZ87BKoSjqxg2Co+s28Av9OkzZm+Yfu14bcEf
	2CApjK8B/OTeAlgFtn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1may5z-002ca2-FD; Thu, 14 Oct 2021 10:36:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1may5D-002cLa-7C; Thu, 14 Oct 2021 10:35:33 +0000
X-UUID: 16949c3b441f475b8c0fea7ee63149fd-20211014
X-UUID: 16949c3b441f475b8c0fea7ee63149fd-20211014
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1085354477; Thu, 14 Oct 2021 03:35:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 03:35:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Oct 2021 18:35:25 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 14 Oct 2021 18:35:24 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>, <sumit.semwal@linaro.org>
CC: <guangming.cao@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <rdunlap@infradead.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date: Thu, 14 Oct 2021 18:35:24 +0800
Message-ID: <20211014103524.55368-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211014102551.54983-1-guangming.cao@mediatek.com>
References: <20211014102551.54983-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_033531_283480_C277CC79 
X-CRM114-Status: GOOD (  47.44  )
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

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+CgpPbiBXZWQs
IDIwMjEtMTAtMTMgYXQgMTQ6MjAgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0g
MTMuMTAuMjEgdW0gMDE6NTYgc2NocmllYiBTdW1pdCBTZW13YWw6Cj4gPiBIZWxsbyBHdWFuZ21p
bmcsIENocmlzdGlhbiwKPiA+IAo+ID4gCj4gPiAKPiA+IE9uIFR1ZSwgMTIgT2N0IDIwMjEsIDE0
OjA5ICwgPGd1YW5nbWluZy5jYW9AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+ID4gRnJvbTogR3Vh
bmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+Cj4gPiA+IAo+ID4gPiA+IEFt
IDA5LjEwLjIxIHVtIDA3OjU1IHNjaHJpZWIgZ3VhbmdtaW5nLmNhb0BtZWRpYXRlay5jb206Cj4g
PiA+ID4gRnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gSWYgZG1hLWJ1ZiBkb24ndCB3YW50IHVzZXJzcGFjZSB1c2VycyB0
byB0b3VjaCB0aGUgZG1hYnVmCj4gPiA+IGJ1ZmZlciwKPiA+ID4gPiA+IGl0IHNlZW1zIHdlIHNo
b3VsZCBhZGQgdGhpcyByZXN0cmljdGlvbiBpbnRvCj4gPiA+IGRtYV9idWZfb3BzLm1tYXAsCj4g
PiA+ID4gPiBub3QgaW4gdGhpcyBJT0NUTDpETUFfQlVGX1NFVF9OQU1FLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFdpdGggdGhpcyByZXN0cmljdGlvbiwgd2UgY2FuIG9ubHkga25vdyB0aGUga2VybmVs
IHVzZXJzIG9mCj4gPiA+IHRoZSBkbWFidWYKPiA+ID4gPiA+IGJ5IGF0dGFjaG1lbnRzLgo+ID4g
PiA+ID4gSG93ZXZlciwgZm9yIG1hbnkgdXNlcnNwYWNlIHVzZXJzLCBzdWNoIGFzIHVzZXJwc2Fj
ZSB1c2VycyBvZgo+ID4gPiBkbWFfaGVhcCwKPiA+ID4gPiA+IHRoZXkgYWxzbyBuZWVkIHRvIG1h
cmsgdGhlIHVzYWdlIG9mIGRtYS1idWYsIGFuZCB0aGV5IGRvbid0Cj4gPiA+IGNhcmUgYWJvdXQK
PiA+ID4gPiA+IHdobyBhdHRhY2hlZCB0byB0aGlzIGRtYWJ1ZiwgYW5kIHNlZW1zIGl0J3Mgbm8g
bWVhbmluZyB0byBiZQo+ID4gPiB3YWl0aW5nIGZvcgo+ID4gPiA+ID4gSU9DVEw6RE1BX0JVRl9T
RVRfTkFNRSByYXRoZXIgdGhhbiBtbWFwLgo+ID4gPiA+IAo+ID4gPiA+IFNvdW5kcyB2YWxpZCB0
byBtZSwgYnV0IEkgaGF2ZSBubyBpZGVhIHdoeSB0aGlzIHJlc3RyaWN0aW9uIHdhcwo+ID4gPiBh
ZGRlZCBpbiAKPiA+ID4gPiB0aGUgZmlyc3QgcGxhY2UuCj4gPiA+ID4gCj4gPiA+ID4gQ2FuIHlv
dSBkb3VibGUgY2hlY2sgdGhlIGdpdCBoaXN0b3J5IGFuZCBtYXliZSBpZGVudGlmeSB3aGVuCj4g
PiA+IHRoYXQgd2FzIAo+ID4gPiA+IGFkZGVkPyBNZW50aW9uaW5nIHRoaXMgY2hhbmdlIGluIHRo
ZSBjb21taXQgbWVzc2FnZSB0aGVuIG1pZ2h0Cj4gPiA+IG1ha2UgCj4gPiA+ID4gdGhpbmdzIGEg
Yml0IGVhc2llciB0byB1bmRlcnN0YW5kLgo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcywKPiA+ID4g
PiBDaHJpc3RpYW4uCj4gPiA+IEl0IHdhcyBhZGQgaW4gdGhpcyBwYXRjaDogCj4gPiA+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMTAzNDkvLgo+ID4gPiBIb3dldmVy
LCB0aGVyZSBpcyBubyBpbGx1c3RyYXRpb24gYWJvdXQgaXQuCj4gPiA+IEkgZ3Vlc3MgaXQgd2Fu
dHMgdXNlcnMgdG8gc2V0X25hbWUgd2hlbiBubyBhdHRhY2htZW50cyBvbiB0aGUKPiA+ID4gZG1h
YnVmLAo+ID4gPiBmb3IgY2FzZSB3aXRoIGF0dGFjaG1lbnRzLCB3ZSBjYW4gZmluZCBvd25lciBi
eSBkZXZpY2UgaW4KPiA+ID4gYXR0YWNobWVudHMuCj4gPiA+IEJ1dCBqdXN0IEkgc2FpZCBpbiBj
b21taXQgbWVzc2FnZSwgdGhpcyBpcyBtaWdodCBub3QgYSBnb29kIGlkZWEuCj4gPiA+IAo+ID4g
PiBEbyB5b3UgaGF2ZSBhbnkgaWRlYT8KPiA+ID4gCj4gPiAKPiA+IEZvciB0aGUgb3JpZ2luYWwg
c2VyaWVzLCB0aGUgaWRlYSB3YXMgdGhhdCBhbGxvd2luZyBuYW1lIGNoYW5nZQo+ID4gbWlkLXVz
ZSBjb3VsZCBjb25mdXNlIHRoZSB1c2VycyBhYm91dCB0aGUgZG1hLWJ1Zi4gSG93ZXZlciwgdGhl
Cj4gPiByZXN0IG9mIHRoZSBzZXJpZXMgYWxzbyBtYWtlcyBzdXJlIGVhY2ggZG1hLWJ1ZiBoYXZl
IGEgdW5pcXVlCj4gPiBpbm9kZSwgYW5kIGFueSBhY2NvdW50aW5nIHNob3VsZCBwcm9iYWJseSB1
c2UgdGhhdCwgd2l0aG91dCByZWx5aW5nCj4gPiBvbiB0aGUgbmFtZSBhcyBtdWNoLgo+ID4gU28g
SSBkb24ndCBoYXZlIGFuIG9iamVjdGlvbiB0byB0aGlzIGNoYW5nZS4KPiAgCj4gSSBzdWdnZXN0
IHRvIGFkZCB0aGF0IGV4cGxhbmF0aW9uIGFuZCB0aGUgb3JpZ2luYWwgY29tbWl0IGlkIGludG8g
dGhlCj4gY29tbWl0IG1lc3NhZ2UuCj4gCj4gV2l0aCB0aGF0IGNoYW5nZWQgdGhlIHBhdGNoIGhh
cyBteSByYiBhcyB3ZWxsLgo+IAo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+CnVwZGF0ZWQsIHRo
YW5rcyEKR3VhbmdtaW5nLgoKPiA+IEJlc3QsCj4gPiBTdW1pdC4KPiA+ID4gPiAKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1l
ZGlhdGVrLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gICBkcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jIHwgMTQgKystLS0tLS0tLS0tLS0KPiA+ID4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLQo+
ID4gPiBidWYuYwo+ID4gPiA+ID4gaW5kZXggNTExZmUwZDIxN2EwLi5kYjJmNGVmZGVjMzIgMTAw
NjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPiA+ID4gPiBAQCAtMzI1LDEwICszMjUs
OCBAQCBzdGF0aWMgX19wb2xsX3QgZG1hX2J1Zl9wb2xsKHN0cnVjdCBmaWxlCj4gPiA+ICpmaWxl
LCBwb2xsX3RhYmxlICpwb2xsKQo+ID4gPiA+ID4gICAKPiA+ID4gPiA+ICAgLyoqCj4gPiA+ID4g
PiAgICAqIGRtYV9idWZfc2V0X25hbWUgLSBTZXQgYSBuYW1lIHRvIGEgc3BlY2lmaWMgZG1hX2J1
ZiB0bwo+ID4gPiB0cmFjayB0aGUgdXNhZ2UuCj4gPiA+ID4gPiAtICogVGhlIG5hbWUgb2YgdGhl
IGRtYS1idWYgYnVmZmVyIGNhbiBvbmx5IGJlIHNldCB3aGVuIHRoZQo+ID4gPiBkbWEtYnVmIGlz
IG5vdAo+ID4gPiA+ID4gLSAqIGF0dGFjaGVkIHRvIGFueSBkZXZpY2VzLiBJdCBjb3VsZCB0aGVv
cml0aWNhbGx5IHN1cHBvcnQKPiA+ID4gY2hhbmdpbmcgdGhlCj4gPiA+ID4gPiAtICogbmFtZSBv
ZiB0aGUgZG1hLWJ1ZiBpZiB0aGUgc2FtZSBwaWVjZSBvZiBtZW1vcnkgaXMgdXNlZAo+ID4gPiBm
b3IgbXVsdGlwbGUKPiA+ID4gPiA+IC0gKiBwdXJwb3NlIGJldHdlZW4gZGlmZmVyZW50IGRldmlj
ZXMuCj4gPiA+ID4gPiArICogSXQgY291bGQgdGhlb3JldGljYWxseSBzdXBwb3J0IGNoYW5naW5n
IHRoZSBuYW1lIG9mIHRoZQo+ID4gPiBkbWEtYnVmIGlmIHRoZSBzYW1lCj4gPiA+ID4gPiArICog
cGllY2Ugb2YgbWVtb3J5IGlzIHVzZWQgZm9yIG11bHRpcGxlIHB1cnBvc2UgYmV0d2Vlbgo+ID4g
PiBkaWZmZXJlbnQgZGV2aWNlcy4KPiA+ID4gPiA+ICAgICoKPiA+ID4gPiA+ICAgICogQGRtYWJ1
ZjogW2luXSAgICAgZG1hYnVmIGJ1ZmZlciB0aGF0IHdpbGwgYmUgcmVuYW1lZC4KPiA+ID4gPiA+
ICAgICogQGJ1ZjogICAgW2luXSAgICAgQSBwaWVjZSBvZiB1c2Vyc3BhY2UgbWVtb3J5IHRoYXQK
PiA+ID4gY29udGFpbnMgdGhlIG5hbWUgb2YKPiA+ID4gPiA+IEBAIC0zNDYsMTkgKzM0NCwxMSBA
QCBzdGF0aWMgbG9uZyBkbWFfYnVmX3NldF9uYW1lKHN0cnVjdAo+ID4gPiBkbWFfYnVmICpkbWFi
dWYsIGNvbnN0IGNoYXIgX191c2VyICpidWYpCj4gPiA+ID4gPiAgICAgaWYgKElTX0VSUihuYW1l
KSkKPiA+ID4gPiA+ICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKG5hbWUpOwo+ID4gPiA+ID4g
ICAKPiA+ID4gPiA+IC0gICBkbWFfcmVzdl9sb2NrKGRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gPiA+
ID4gPiAtICAgaWYgKCFsaXN0X2VtcHR5KCZkbWFidWYtPmF0dGFjaG1lbnRzKSkgewo+ID4gPiA+
ID4gLSAgICAgICAgICAgcmV0ID0gLUVCVVNZOwo+ID4gPiA+ID4gLSAgICAgICAgICAga2ZyZWUo
bmFtZSk7Cj4gPiA+ID4gPiAtICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7Cj4gPiA+ID4gPiAt
ICAgfQo+ID4gPiA+ID4gICAgIHNwaW5fbG9jaygmZG1hYnVmLT5uYW1lX2xvY2spOwo+ID4gPiA+
ID4gICAgIGtmcmVlKGRtYWJ1Zi0+bmFtZSk7Cj4gPiA+ID4gPiAgICAgZG1hYnVmLT5uYW1lID0g
bmFtZTsKPiA+ID4gPiA+ICAgICBzcGluX3VubG9jaygmZG1hYnVmLT5uYW1lX2xvY2spOwo+ID4g
PiA+ID4gICAKPiA+ID4gPiA+IC1vdXRfdW5sb2NrOgo+ID4gPiA+ID4gLSAgIGRtYV9yZXN2X3Vu
bG9jayhkbWFidWYtPnJlc3YpOwo+ID4gPiA+ID4gICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gPiAg
IH0KPiA+ID4gPiA+ICAgCj4gPiA+IAo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
