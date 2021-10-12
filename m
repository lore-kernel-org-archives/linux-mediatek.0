Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBBDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 09:13:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E8961078
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 09:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92E8961078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kz15U/l2+Q3t4uz8GU32fcF8IPtoM3fByxmoY0BqKUU=; b=u1wEkIv4C76oTw
	SQSNp9cbYO5arVIH6rP8k/9WJYYcsNMQyGOKfMOj0MNfwOTGksDGem2fakbwqsxevpn3azI5TME1w
	0p2lvEpGFk8IUwcnHyNOL8kvtAsjipE8SxHwHSCm1eYTQJoIT28erREx5zgop+6Kw/diKbMcA/Gpi
	KiFsKix6S96oKKyzaHvHrnnkbvYrAFbjUOIC9lmLTwh3RIYsdJwQkkEvCMaIIojARbZNyBrIyBkMH
	FYAo4BxlKnMQ976A1e2e/TXzwPWeYoqVWuGPghTzx/lkoD/xLhc+WgVfgu4wuiW9ylEAR5qYkKe4i
	umpkBA/0mkkqIKsx7C4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maDqg-00CBx0-F0; Tue, 12 Oct 2021 09:13:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maDq8-00CBmC-Cs; Tue, 12 Oct 2021 09:12:55 +0000
X-UUID: 2bbae8c247e74f049f2c498d22188896-20211012
X-UUID: 2bbae8c247e74f049f2c498d22188896-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1875655665; Tue, 12 Oct 2021 02:12:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 02:06:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Oct 2021 17:06:03 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 12 Oct 2021 17:06:02 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: acquire name lock before read/write
 dma_buf.name
Date: Tue, 12 Oct 2021 17:07:55 +0800
Message-ID: <20211012090755.177441-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
References: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_021252_469338_B8EAB566 
X-CRM114-Status: GOOD (  15.79  )
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

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+Cgo+IEFtIDA4
LjEwLjIxIHVtIDA5OjU0IHNjaHJpZWIgZ3VhbmdtaW5nLmNhb0BtZWRpYXRlay5jb206Cj4gPiBG
cm9tOiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPiA+Cj4gPiBC
ZWNhdXNlIGRtYS1idWYubmFtZSBjYW4gYmUgZnJlZWQgaW4gZnVuYzogImRtYV9idWZfc2V0X25h
bWUiLAo+ID4gc28sIHdlIG5lZWQgdG8gYWNxdWlyZSBsb2NrIGZpcnN0IGJlZm9yZSB3ZSByZWFk
L3dyaXRlIGRtYV9idWYubmFtZQo+ID4gdG8gcHJldmVudCBVc2UgQWZ0ZXIgRnJlZShVQUYpIGlz
c3VlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1YW5nbWluZyBDYW8gPEd1YW5nbWluZy5DYW9A
bWVkaWF0ZWsuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gCj4gR29pbmcgdG8gcHVzaCB0aGF0IHVwc3RyZWFtIGlmIG5v
Ym9keSBlbHNlIG9iamVjdHMuCj4gCj4gVGhhbmtzLAo+IENocmlzdGlhbi4KCkknbSBzb3JyeSB0
byBkaXN0dXJiIHlvdSwgYWN0dWFsbHkgSSBuZWVkIHRoaXMgcGF0Y2ggdG8gc29sdmUgb3VyIGlz
c3Vlcy4KSXMgdGhlcmUgYW55IHF1ZXN0aW9uIGFib3V0IGl0PyBzZWVtcyBpdCBoYXNuJ3QgYmVl
biBtZXJnZWQgaW50byBtYWlubGluZS4KClRoYW5rcywKR3VhbmdtaW5nLgo+IAo+ID4gLS0tCj4g
PiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAzICsrKwo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gPiBpbmRleCA1MTFmZTBkMjE3
YTAuLmE3ZjZmZDEzYTYzNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiA+IEBAIC0xMzcyLDYgKzEz
NzIsOCBAQCBzdGF0aWMgaW50IGRtYV9idWZfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMs
IHZvaWQgKnVudXNlZCkKPiA+ICAgCQlpZiAocmV0KQo+ID4gICAJCQlnb3RvIGVycm9yX3VubG9j
azsKPiA+ICAgCj4gPiArCj4gPiArCQlzcGluX2xvY2soJmJ1Zl9vYmotPm5hbWVfbG9jayk7Cj4g
PiAgIAkJc2VxX3ByaW50ZihzLCAiJTA4enVcdCUwOHhcdCUwOHhcdCUwOGxkXHQlc1x0JTA4bHVc
dCVzXG4iLAo+ID4gICAJCQkJYnVmX29iai0+c2l6ZSwKPiA+ICAgCQkJCWJ1Zl9vYmotPmZpbGUt
PmZfZmxhZ3MsIGJ1Zl9vYmotPmZpbGUtPmZfbW9kZSwKPiA+IEBAIC0xMzc5LDYgKzEzODEsNyBA
QCBzdGF0aWMgaW50IGRtYV9idWZfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQg
KnVudXNlZCkKPiA+ICAgCQkJCWJ1Zl9vYmotPmV4cF9uYW1lLAo+ID4gICAJCQkJZmlsZV9pbm9k
ZShidWZfb2JqLT5maWxlKS0+aV9pbm8sCj4gPiAgIAkJCQlidWZfb2JqLT5uYW1lID86ICIiKTsK
PiA+ICsJCXNwaW5fdW5sb2NrKCZidWZfb2JqLT5uYW1lX2xvY2spOwo+ID4gICAKPiA+ICAgCQly
b2JqID0gYnVmX29iai0+cmVzdjsKPiA+ICAgCQlmZW5jZSA9IGRtYV9yZXN2X2V4Y2xfZmVuY2Uo
cm9iaik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
