Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E272C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5nx/xHPOxkhWurApPerJRomf2j7yjMDiQzZyqVYuqM=; b=bs2ehilxCJkpu4
	AcpDZ/c2RUri1rf8gsQHJRmRUb8KsFw4N4cDHKvRoD+bhahltA0FJpjUkmjEbF3/jBFpkEqWy1Rwc
	16BpFDULUz456vuC4JepIVGYo0Q8mi1uB+HlZlgXiTUrYRcRn4IGsIPNhfT6A56rb9HUReBDudPz4
	jwtfxWmro4UYULmNs9GwQmyx2C2SIofCoDEE9dllrGwR2WTTWFtrEpJUGa6+MO0PlVTiUY3HwPG+l
	qMAjdsLRN1nvg7c2/D4xiEzzkjqBrepCRsSghLBru8X7MVS9wDQDKWlOuNSTYkfDMDL9KIZbCq82h
	Mdo3XssIIrn80TG4tPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n50Ir-00DyYA-U2; Wed, 05 Jan 2022 07:01:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n500m-00Dr4K-C8; Wed, 05 Jan 2022 06:43:07 +0000
X-UUID: 7a6912595be4424aa272b4f94d4aa2a0-20220104
X-UUID: 7a6912595be4424aa272b4f94d4aa2a0-20220104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 50297983; Tue, 04 Jan 2022 23:43:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 22:35:56 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 5 Jan 2022 14:35:54 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 5 Jan 2022 14:35:53 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
 <bo.song@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <guangming.cao@mediatek.com>, <jianjiao.zeng@mediatek.com>,
 <john.stultz@linaro.org>, <labbott@redhat.com>, <libo.kang@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <mingyuan.ma@mediatek.com>,
 <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>,
 <yf.wang@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
Date: Wed, 5 Jan 2022 14:36:43 +0800
Message-ID: <20220105063643.119874-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
References: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_224304_467153_0BD2549F 
X-CRM114-Status: GOOD (  33.10  )
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

RnJvbTogR3VhbmdtaW5nLkNhbyA8Z3VhbmdtaW5nLmNhb0BtZWRpYXRlay5jb20+CgpPbiBUdWUs
IDIwMjItMDEtMDQgYXQgMDg6NDcgKzAxMDAsIENocmlzdGlhbiBL6bCKaWcgd3JvdGU6Cj4gQW0g
MDMuMDEuMjIgdW0gMTk6NTcgc2NocmllYiBKb2huIFN0dWx0ejoKPiA+IE9uIE1vbiwgRGVjIDI3
LCAyMDIxIGF0IDE6NTIgQU0gPGd1YW5nbWluZy5jYW9AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+
ID4gRnJvbTogR3VhbmdtaW5nIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPiA+ID4gCj4g
PiAKPiA+IFRoYW5rcyBmb3Igc3VibWl0dGluZyB0aGlzIQo+ID4gCj4gPiA+IEFkZCBhIHNpemUg
Y2hlY2sgZm9yIGFsbGNhdGlvbiBzaW5jZSB0aGUgYWxsb2NhdGlvbiBzaXplIGlzCj4gPiAKPiA+
IG5pdDogImFsbG9jYXRpb24iIGFib3ZlLgo+ID4gCj4gPiA+IGFsd2F5cyBsZXNzIHRoYW4gdGhl
IHRvdGFsIERSQU0gc2l6ZS4KPiA+IAo+ID4gSW4gZ2VuZXJhbCwgaXQgbWlnaHQgYmUgZ29vZCB0
byBhZGQgbW9yZSBjb250ZXh0IHRvIHRoZSBjb21taXQKPiA+IG1lc3NhZ2UKPiA+IHRvIGJldHRl
ciBhbnN3ZXIgKndoeSogdGhpcyBjaGFuZ2UgaXMgbmVlZGVkIHJhdGhlciB0aGFuIHdoYXQgdGhl
Cj4gPiBjaGFuZ2UgaXMgZG9pbmcuICBpZTogV2hhdCBuZWdhdGl2ZSB0aGluZyBoYXBwZW5zIHdp
dGhvdXQgdGhpcwo+ID4gY2hhbmdlPwo+ID4gQW5kIHNvIGhvdyBkb2VzIHRoaXMgY2hhbmdlIGF2
b2lkIG9yIGltcHJvdmUgdGhpbmdzPwo+IAo+IENvbXBsZXRlbHkgYWdyZWUsIGp1c3Qgb25lIGxp
dHRsZSBhZGRpdGlvbjogQ291bGQgeW91IGFsc28gYWRkIHRoaXMKPiB3aHkgCj4gYXMgY29tbWVu
dCB0byB0aGUgY29kZT8KPiAKPiBXaGVuIHdlIHN0dW1ibGUgb3ZlciB0aGlzIGZpdmUgeWVhcnMg
ZnJvbSBub3cgaXQgaXMgYWJzb2x1dGVseSBub3QgCj4gb2J2aW91cyB3aHkgd2UgZG8gdGhpcy4K
PiAKPiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+IApUaGFua3MgZm9yIHlvdXIgcmVwbHkhCkkgd2ls
bCB1cGRhdGUgdGhlIHJlbGF0ZWQgcmVhc29uIGluIHRoZSBwYXRjaCBsYXRlci4KClRoZSByZWFz
b24gZm9yIGFkZGluZyB0aGlzIGNoZWNrIGlzIHRoYXQgd2UgbWV0IGEgY2FzZSB0aGF0IHRoZSB1
c2VyCnNlbnQgYW4gaW52YWxpZCBzaXplKEl0IHNlZW1zIGl0J3MgYSBuZWdhdGl2ZSB2YWx1ZSwg
TVNCIGlzIDB4ZmYsIGl0J3MKbGFyZ2VyIHRoYW4gRFJBTSBzaXplIGFmdGVyIGNvbnZlcnQgaXQg
dG8gc2l6ZV90KSB0byBkbWEtaGVhcCB0byBhbGxvYwptZW1vcnksIGFuZCB0aGlzIGFsbG9jYXRp
b24gd2FzIHJ1bm5pbmcgb24gYSBwcm9jZXNzKHN1Y2ggYXMgImdyYWxsb2MiCm9uIEFuZHJvaWQg
ZGV2aWNlKSBjYW4ndCBiZSBraWxsZWQgYnkgT09NIGZsb3csIGFuZCB3ZSBhbHNvIGNvdWxkbid0
CmZpbmQgdGhlIHJlbGF0ZWQgZG1hYnVmIGluICJkbWFfYnVmX2RlYnVnX3Nob3ciIGJlY2F1c2Ug
dGhlIHJlbGF0ZWQKZG1hYnVmIHdhcyBub3QgZXhwb3J0ZWQgeWV0IHNpbmNlIHRoZSBhbGxvY2F0
aW9uIGlzIHN0aWxsIG9uIGdvaW5nLgoKU2luY2UgdGhpcyBpbnZhbGlkIGFyZ3VtZW50IGNhc2Ug
Y2FuIGJlIHByZXZlbnRlZCBhdCBkbWEtaGVhcCBzaWRlLCBzbywKSSBhZGRlZCB0aGlzIHNpemUg
Y2hlY2ssIGFuZCBtb3Jlb3ZlciwgdG8gbGV0IGRlYnVnIGl0IGVhc2lseSwgSSBhbHNvCmFkZGVk
IGxvZ3Mgd2hlbiBzaXplIGlzIGJpZ2dlciB0aGFuIGEgdGhyZXNob2xkIHdlIHNldCBpbiBtdGsg
c3lzdGVtCmhlYXAuCklmIHlvdSB0aGluayB0aGF0IHByaW50IGxvZ3MgaW4gZG1hLWhlYXAgZnJh
bWV3b3JrIGlzIGJldHRlciwgSSB3aWxsCnVwZGF0ZSBpdCBpbiBuZXh0IHZlcnNpb24uCgpJZiB5
b3UgaGF2ZSBiZXR0ZXIgc29sdXRpb24oc3VjaCBhcyBkdW1wIHRoZSBzaXplIHVuZGVyIGFsbG9j
YXRpbmcKaW4gImRtYV9idWZfZGVidWdfc2hvdyIsIHdoaWNoIG1heWJlIG5lZWQgYWRkIGdsb2Jh
bCB2YXJpYWJsZSB0byByZWNvcmQKaXQpLCBwbGVhc2Uga2luZGx5IGxldCBtZSBrbm93LgpUaGFu
a3MgOikKR3VhbmdtaW5nCgo+ID4gCj4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VhbmdtaW5n
IDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogamlhbmpp
YW8gemVuZyA8amlhbmppYW8uemVuZ0BtZWRpYXRlay5jb20+Cj4gPiA+IC0tLQo+ID4gPiB2Mjog
MS4gdXBkYXRlIHNpemUgbGltaXRhdGlvbiBhcyB0b3RhbF9kcmFtIHBhZ2Ugc2l6ZS4KPiA+ID4g
ICAgICAyLiB1cGRhdGUgY29tbWl0IG1lc3NhZ2UKPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy9k
bWEtYnVmL2RtYS1oZWFwLmMgfCAyICsrCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVh
cC5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS0KPiA+ID4gaGVhcC5jCj4gPiA+IGluZGV4IDU2YmY1
YWQwMWFkNS4uZTM5ZDJiZTk4ZDY5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYv
ZG1hLWhlYXAuYwo+ID4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwo+ID4gPiBA
QCAtNTUsNiArNTUsOCBAQCBzdGF0aWMgaW50IGRtYV9oZWFwX2J1ZmZlcl9hbGxvYyhzdHJ1Y3QK
PiA+ID4gZG1hX2hlYXAgKmhlYXAsIHNpemVfdCBsZW4sCj4gPiA+ICAgICAgICAgIHN0cnVjdCBk
bWFfYnVmICpkbWFidWY7Cj4gPiA+ICAgICAgICAgIGludCBmZDsKPiA+ID4gCj4gPiA+ICsgICAg
ICAgaWYgKGxlbiAvIFBBR0VfU0laRSA+IHRvdGFscmFtX3BhZ2VzKCkpCj4gPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+IAo+ID4gVGhpcyBzZWVtcyBzYW5lLiBJIGtub3cg
SU9OIHVzZWQgdG8gaGF2ZSBzb21lIDEvMiBvZiBtZW1vcnkgY2FwIHRvCj4gPiBhdm9pZCB1bm5l
Y2Vzc2FyeSBtZW1vcnkgcHJlc3N1cmUgb24gY3JhenkgYWxsb2NhdGlvbnMuCj4gPiAKPiA+IENv
dWxkIHlvdSBzZW5kIGFnYWluIHdpdGggYW4gaW1wcm92ZWQgY29tbWl0IG1lc3NhZ2U/Cj4gPiAK
PiA+IHRoYW5rcwo+ID4gLWpvaG4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
