Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4477CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 11:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2A160F21
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 11:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C2A160F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMmAeSUIWKzxpSoiC0+rX7tblhmuFtWpjC9odF8sjIc=; b=T+SRaGXNlVy+x+
	yluRhfavi5dmlM9EGwoDXlhOF2+/k5EEo7ewKwYk9ZSH6zPHWkyZfs2hAxcUZV5I7DZc/swNzDlA1
	7obtT/eDvXhMGXudkzK4WBnHv9LYAYKXRSjYvCVTTrz+huLs1OQO8Hel4SgdDJ6yh53feMcFfJkUh
	ppwU7qGULTdNIp/HysiCTl3xf9/HzabNosPGTOw3YBLczmr7ASgA99Ur99aHGmPY2b4SsawW9CMTK
	uhYRjgRfpBqZiaWngp63bYd993l0Zo/fwzipJSwzgE0r7OmPq0x6NBp5lJ4SKUlyVGvnAGpFr5Vkd
	BggL/9LwvKevLwoqF3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfL0p-001hBn-5B; Tue, 26 Oct 2021 11:53:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfL0b-001h8z-3V; Tue, 26 Oct 2021 11:52:52 +0000
X-UUID: bb01b352cd654ec6810886721240e19c-20211026
X-UUID: bb01b352cd654ec6810886721240e19c-20211026
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1832746973; Tue, 26 Oct 2021 04:52:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 04:52:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Oct 2021 19:52:41 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 26 Oct 2021 19:52:41 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <rdunlap@infradead.org>, <sumit.semwal@linaro.org>,
 <wsd_upstream@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date: Tue, 26 Oct 2021 19:52:48 +0800
Message-ID: <20211026115248.9564-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <0e062f12-7e79-5a05-1e7b-10dda8e353b7@amd.com>
References: <0e062f12-7e79-5a05-1e7b-10dda8e353b7@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_045249_177482_54712A43 
X-CRM114-Status: GOOD (  35.28  )
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

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+CgpPbiBUdWUs
IDIwMjEtMTAtMjYgYXQgMTM6MTggKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0g
MTQuMTAuMjEgdW0gMTI6MjUgc2NocmllYiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbToKPiA+
IEZyb206IEd1YW5nbWluZyBDYW8gPEd1YW5nbWluZy5DYW9AbWVkaWF0ZWsuY29tPgo+ID4gCj4g
PiBJbiB0aGlzIHBhdGNoKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8z
MTAzNDkpLAo+ID4gaXQgYWRkIGEgbmV3IElPQ1RMIHRvIHN1cHBvcnQgZG1hLWJ1ZiB1c2VyIHRv
IHNldCBkZWJ1ZyBuYW1lLgo+ID4gCj4gPiBCdXQgaXQgYWxzbyBhZGRlZCBhIGxpbWl0YXRpb24g
b2YgdGhpcyBJT0NUTCwgaXQgbmVlZHMgdGhlCj4gPiBhdHRhY2htZW50cyBvZiBkbWFidWYgc2hv
dWxkIGJlIGVtcHR5LCBvdGhlcndpc2UgaXQgd2lsbCBmYWlsLgo+ID4gCj4gPiBGb3IgdGhlIG9y
aWdpbmFsIHNlcmllcywgdGhlIGlkZWEgd2FzIHRoYXQgYWxsb3dpbmcgbmFtZSBjaGFuZ2UKPiA+
IG1pZC11c2UgY291bGQgY29uZnVzZSB0aGUgdXNlcnMgYWJvdXQgdGhlIGRtYS1idWYuCj4gPiBI
b3dldmVyLCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIGFsc28gbWFrZXMgc3VyZSBlYWNoIGRtYS1i
dWYgaGF2ZSBhCj4gPiB1bmlxdWUKPiA+IGlub2RlKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC8zMTAzODcvKSwgYW5kIGFueQo+ID4gYWNjb3VudGluZwo+ID4gc2hvdWxk
IHByb2JhYmx5IHVzZSB0aGF0LCB3aXRob3V0IHJlbHlpbmcgb24gdGhlIG5hbWUgYXMgbXVjaC4K
PiA+IAo+ID4gU28sIHJlbW92aW5nIHRoaXMgcmVzdHJpY3Rpb24gd2lsbCBsZXQgZG1hLWJ1ZiB1
c2Vyc3BhY2UgdXNlcnMgdG8KPiA+IHVzZSBpdAo+ID4gbW9yZSBjb21mb3J0YWJseSBhbmQgd2l0
aG91dCBhbnkgc2lkZSBlZmZlY3QuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEd1YW5nbWluZyBD
YW8gPEd1YW5nbWluZy5DYW9AbWVkaWF0ZWsuY29tPgo+IAo+IFdlIGNvdWxkIG5vdyBjbGVhbnVw
IHRoZSByZXR1cm4gdmFsdWUgZnJvbSBkbWFfYnVmX3NldF9uYW1lKCkgaW50byBhIAo+IHZvaWQg
c2luY2UgdGhhdCBmdW5jdGlvbiBjYW4ndCBmYWlsIGFueSBtb3JlIGFzIGZhciBhcyBJIGNhbiBz
ZWUuCj4gCj4gQnV0IHRoYXQgaXNuJ3QgbWFuZGF0b3J5IEkgdGhpbmssIHBhdGNoIGlzIFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4KPiBLw7ZuaWcgCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PgoKU28sIGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayByZXR1cm4gdmFsdWUgb2YgJ3N0cm5kdXBf
dXNlcicsCmp1c3QgcmV0dXJuIHdpdGhvdXQgZXJyb3IgY29kZSBpZiB0aGUgYWxtb3N0IGltcG9z
c2libGUgZXJyb3Igb2NjdXJzPwoKR3VhbmdtaW5nLgoKPiBSZWdhcmRzLAo+IENocmlzdGlhbi4K
PiAKPiA+IC0tLQo+ID4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMTcgKysrLS0tLS0t
LS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ID4gaW5kZXggNTExZmUwZDIxN2EwLi41ZmJiM2Ey
MDY4YTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPiArKysg
Yi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPiBAQCAtMzI1LDEwICszMjUsOCBAQCBzdGF0
aWMgX19wb2xsX3QgZG1hX2J1Zl9wb2xsKHN0cnVjdCBmaWxlCj4gPiAqZmlsZSwgcG9sbF90YWJs
ZSAqcG9sbCkKPiA+ICAgCj4gPiAgIC8qKgo+ID4gICAgKiBkbWFfYnVmX3NldF9uYW1lIC0gU2V0
IGEgbmFtZSB0byBhIHNwZWNpZmljIGRtYV9idWYgdG8gdHJhY2sKPiA+IHRoZSB1c2FnZS4KPiA+
IC0gKiBUaGUgbmFtZSBvZiB0aGUgZG1hLWJ1ZiBidWZmZXIgY2FuIG9ubHkgYmUgc2V0IHdoZW4g
dGhlIGRtYS1idWYgCj4gPiBpcyBub3QKPiA+IC0gKiBhdHRhY2hlZCB0byBhbnkgZGV2aWNlcy4g
SXQgY291bGQgdGhlb3JpdGljYWxseSBzdXBwb3J0Cj4gPiBjaGFuZ2luZyB0aGUKPiA+IC0gKiBu
YW1lIG9mIHRoZSBkbWEtYnVmIGlmIHRoZSBzYW1lIHBpZWNlIG9mIG1lbW9yeSBpcyB1c2VkIGZv
cgo+ID4gbXVsdGlwbGUKPiA+IC0gKiBwdXJwb3NlIGJldHdlZW4gZGlmZmVyZW50IGRldmljZXMu
Cj4gPiArICogSXQgY291bGQgc3VwcG9ydCBjaGFuZ2luZyB0aGUgbmFtZSBvZiB0aGUgZG1hLWJ1
ZiBpZiB0aGUgc2FtZQo+ID4gKyAqIHBpZWNlIG9mIG1lbW9yeSBpcyB1c2VkIGZvciBtdWx0aXBs
ZSBwdXJwb3NlIGJldHdlZW4gZGlmZmVyZW50Cj4gPiBkZXZpY2VzLgo+ID4gICAgKgo+ID4gICAg
KiBAZG1hYnVmOiBbaW5dICAgICBkbWFidWYgYnVmZmVyIHRoYXQgd2lsbCBiZSByZW5hbWVkLgo+
ID4gICAgKiBAYnVmOiAgICBbaW5dICAgICBBIHBpZWNlIG9mIHVzZXJzcGFjZSBtZW1vcnkgdGhh
dCBjb250YWlucwo+ID4gdGhlIG5hbWUgb2YKPiA+IEBAIC0zNDEsMjUgKzMzOSwxNiBAQCBzdGF0
aWMgX19wb2xsX3QgZG1hX2J1Zl9wb2xsKHN0cnVjdCBmaWxlCj4gPiAqZmlsZSwgcG9sbF90YWJs
ZSAqcG9sbCkKPiA+ICAgc3RhdGljIGxvbmcgZG1hX2J1Zl9zZXRfbmFtZShzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLCBjb25zdCBjaGFyCj4gPiBfX3VzZXIgKmJ1ZikKPiA+ICAgewo+ID4gICAJY2hh
ciAqbmFtZSA9IHN0cm5kdXBfdXNlcihidWYsIERNQV9CVUZfTkFNRV9MRU4pOwo+ID4gLQlsb25n
IHJldCA9IDA7Cj4gPiAgIAo+ID4gICAJaWYgKElTX0VSUihuYW1lKSkKPiA+ICAgCQlyZXR1cm4g
UFRSX0VSUihuYW1lKTsKPiA+ICAgCj4gPiAtCWRtYV9yZXN2X2xvY2soZG1hYnVmLT5yZXN2LCBO
VUxMKTsKPiA+IC0JaWYgKCFsaXN0X2VtcHR5KCZkbWFidWYtPmF0dGFjaG1lbnRzKSkgewo+ID4g
LQkJcmV0ID0gLUVCVVNZOwo+ID4gLQkJa2ZyZWUobmFtZSk7Cj4gPiAtCQlnb3RvIG91dF91bmxv
Y2s7Cj4gPiAtCX0KPiA+ICAgCXNwaW5fbG9jaygmZG1hYnVmLT5uYW1lX2xvY2spOwo+ID4gICAJ
a2ZyZWUoZG1hYnVmLT5uYW1lKTsKPiA+ICAgCWRtYWJ1Zi0+bmFtZSA9IG5hbWU7Cj4gPiAgIAlz
cGluX3VubG9jaygmZG1hYnVmLT5uYW1lX2xvY2spOwo+ID4gICAKPiA+IC1vdXRfdW5sb2NrOgo+
ID4gLQlkbWFfcmVzdl91bmxvY2soZG1hYnVmLT5yZXN2KTsKPiA+IC0JcmV0dXJuIHJldDsKPiA+
ICsJcmV0dXJuIDA7Cj4gPiAgIH0KPiA+ICAgCj4gPiAgIHN0YXRpYyBsb25nIGRtYV9idWZfaW9j
dGwoc3RydWN0IGZpbGUgKmZpbGUsCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
