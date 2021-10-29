Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F16C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 02:26:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27DD961157
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 02:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27DD961157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIkP0giEPpOfDayXyQQaboomJvC3BxrKUiu4MH7UWxs=; b=o/UaIMgbqFOFSg
	ecse/63uX8jZ1lyQkAYFaNK8FmeDabR5j3+sHTaJHfYY3nsV3Af1WEUpCJATx51/Vt1rkCpiQHUCP
	3on/7SLXrak4ouCdhbYIEE2ImBFF6eR0OzfsMTFWfvfmCsOkvysRV+jt32n3aJ95WfrohJZ6uMcsK
	7UlHP1vn/choV8+HmkSPYJkOwiGxomPvwjHjlQ4k3xmcSMsLHj3w3BNioW15CS3WqN9YHi4DcvdrT
	iKTDS96Y1xq8o0zZlG82N9GEEzrJ4o1o5zfAbHB0fe15T4pNejWSDRTgeHTWRdWC6LdgZqhiZU9s0
	f8/nbK/dJeWkjrWzfcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgHae-009aAD-RF; Fri, 29 Oct 2021 02:25:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgHaP-009a7q-1s; Fri, 29 Oct 2021 02:25:44 +0000
X-UUID: 6effa1014f284bcfbe1afff045439ab9-20211028
X-UUID: 6effa1014f284bcfbe1afff045439ab9-20211028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 620054716; Thu, 28 Oct 2021 19:25:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 19:15:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 29 Oct 2021 10:15:33 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 29 Oct 2021 10:15:33 +0800
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
Date: Fri, 29 Oct 2021 10:15:41 +0800
Message-ID: <20211029021541.101157-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
References: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_192541_104399_A3E30DC9 
X-CRM114-Status: GOOD (  16.59  )
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

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+CgpPbiBGcmks
IDIwMjEtMTAtMDggYXQgMTI6MjQgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0g
MDguMTAuMjEgdW0gMDk6NTQgc2NocmllYiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbToKPiA+
IEZyb206IEd1YW5nbWluZyBDYW8gPEd1YW5nbWluZy5DYW9AbWVkaWF0ZWsuY29tPgo+ID4gCj4g
PiBCZWNhdXNlIGRtYS1idWYubmFtZSBjYW4gYmUgZnJlZWQgaW4gZnVuYzogImRtYV9idWZfc2V0
X25hbWUiLAo+ID4gc28sIHdlIG5lZWQgdG8gYWNxdWlyZSBsb2NrIGZpcnN0IGJlZm9yZSB3ZSBy
ZWFkL3dyaXRlIGRtYV9idWYubmFtZQo+ID4gdG8gcHJldmVudCBVc2UgQWZ0ZXIgRnJlZShVQUYp
IGlzc3VlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcu
Q2FvQG1lZGlhdGVrLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IAo+IEdvaW5nIHRvIHB1c2ggdGhhdCB1cHN0cmVhbSBp
ZiBub2JvZHkgZWxzZSBvYmplY3RzLgo+IAo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCgpKdXN0IGEg
Z2VudGxlIHBpbmcgZm9yIHRoaXMgcGF0Y2gsIHBsZWFzZSBraW5kbHkgbGV0IG1lIGtub3cgaG93
IGlzIGl0IGdvaW5nLgoKPiAKPiA+IC0tLQo+ID4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5j
IHwgMyArKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtYnVmLmMKPiA+IGluZGV4IDUxMWZlMGQyMTdhMC4uYTdmNmZkMTNhNjM1IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ID4gKysrIGIvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYwo+ID4gQEAgLTEzNzIsNiArMTM3Miw4IEBAIHN0YXRpYyBpbnQgZG1hX2J1Zl9k
ZWJ1Z19zaG93KHN0cnVjdCBzZXFfZmlsZQo+ID4gKnMsIHZvaWQgKnVudXNlZCkKPiA+ICAgCQlp
ZiAocmV0KQo+ID4gICAJCQlnb3RvIGVycm9yX3VubG9jazsKPiA+ICAgCj4gPiArCj4gPiArCQlz
cGluX2xvY2soJmJ1Zl9vYmotPm5hbWVfbG9jayk7Cj4gPiAgIAkJc2VxX3ByaW50ZihzLAo+ID4g
IiUwOHp1XHQlMDh4XHQlMDh4XHQlMDhsZFx0JXNcdCUwOGx1XHQlc1xuIiwKPiA+ICAgCQkJCWJ1
Zl9vYmotPnNpemUsCj4gPiAgIAkJCQlidWZfb2JqLT5maWxlLT5mX2ZsYWdzLCBidWZfb2JqLT5m
aWxlLQo+ID4gPmZfbW9kZSwKPiA+IEBAIC0xMzc5LDYgKzEzODEsNyBAQCBzdGF0aWMgaW50IGRt
YV9idWZfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUKPiA+ICpzLCB2b2lkICp1bnVzZWQpCj4g
PiAgIAkJCQlidWZfb2JqLT5leHBfbmFtZSwKPiA+ICAgCQkJCWZpbGVfaW5vZGUoYnVmX29iai0+
ZmlsZSktPmlfaW5vLAo+ID4gICAJCQkJYnVmX29iai0+bmFtZSA/OiAiIik7Cj4gPiArCQlzcGlu
X3VubG9jaygmYnVmX29iai0+bmFtZV9sb2NrKTsKPiA+ICAgCj4gPiAgIAkJcm9iaiA9IGJ1Zl9v
YmotPnJlc3Y7Cj4gPiAgIAkJZmVuY2UgPSBkbWFfcmVzdl9leGNsX2ZlbmNlKHJvYmopOwo+IAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
