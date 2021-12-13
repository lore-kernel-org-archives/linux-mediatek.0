Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699B9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 05:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqHm1954SNvDxLV0tqG4p8d/iaMkB64fGKoVIKhZszo=; b=1nFR4VlaAMNnv1
	Ymz5nThTz6y8rwlOE/Oo/2MgXeMjuCS6PwaggQa3LBVm/V844ce8jqUpIUGpSzLAHZcWUGW2nBg9S
	jgGKxw2EwrCFu5PAbV5FQ+MePUI83D4U8J9B7KVg88vXpvz1sbyfZ82nB2/EozW4TaTWmPutC6hVY
	v+MaZdo2lR+PvGNWNRldLRSsP5LVLYSdzNrbTDmTulR9oeuYWOjlEf9UsbJag2sFS/s5aPzJcRyj6
	hdSUZaF5KZw77kB6vxNfzFb/CBXBXcoykrGzc/smjvmAl5Ceq76HGykbeAd2met9o+lt5G1FJFLpT
	NX79gs32EMn1i/gM7ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwdx5-007puk-S9; Mon, 13 Dec 2021 05:32:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwdwo-007psx-JD; Mon, 13 Dec 2021 05:32:30 +0000
X-UUID: 349d6ef23e7a420798ba82d03234971d-20211212
X-UUID: 349d6ef23e7a420798ba82d03234971d-20211212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 417151988; Sun, 12 Dec 2021 22:32:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Dec 2021 21:32:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 13 Dec 2021 13:32:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 13:32:18 +0800
Message-ID: <a565a6b831521df69ec35c60a02887ae1ee5cbf0.camel@mediatek.com>
Subject: Re: [PATCH] mailbox: add control_by_sw for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <tzungbi@google.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Nancy Lin
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Mon, 13 Dec 2021 13:32:18 +0800
In-Reply-To: <CAAOTY_-dO9hXaPCEhJymrCDYU-P-wOvS0YLYQ-gyYX1_morteg@mail.gmail.com>
References: <20211210061138.9943-1-jason-jh.lin@mediatek.com>
 <CAAOTY_-dO9hXaPCEhJymrCDYU-P-wOvS0YLYQ-gyYX1_morteg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_213226_665263_D78C79FD 
X-CRM114-Status: GOOD (  21.69  )
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

SGkgQ2h1bi1LdWFuZywKClRoYW5rcyBmb3IgdGhlIHJldmlld3MuCgpPbiBGcmksIDIwMjEtMTIt
MTAgYXQgMjM6NDQgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gSGksIEphc29uOgo+IAo+
IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQxMuac
iDEw5pelIOmAseS6lCDkuIvljYgyOjEx5a+r6YGT77yaCj4gPiAKPiA+IFRvIG1ha2Ugc3VyZSB0
aGUgR0NFIHJlcXVlc3Qgc2lnbmFsIHRvIFNQTSBpcyBub3QgdHJpZ2dlciBieQo+ID4gb3RoZXIg
SFcgbW9kdWxlcyBhbmQgY2F1c2Ugc3VzcGVuZCBwcmVtYXR1cmUgd2FrZS4KPiA+IAo+ID4gU2V0
IDB4NyAodGhlIGJpdCAwfjIgYXMgMSkgdG8gR0NFX0dDVExfVkFMVUUsIHRvIGNvbmZpZ3VyZSB0
aGUKPiA+IHJlcXVlc3Qgc2lnbmFsIGNvbnRyb2wgYnkgU1cgYW5kIHJlbGVhc2UgdGhlIHJlcXVl
c3QgdG8gU1BNLgo+IAo+IEhvdyBkb2VzIG10ODE3MywgbXQ4MTgzLCBhbmQgbXQ2Nzc5IHByZXZl
bnQgdGhpcz8gT3IgdGhlc2UgU29DcyBjb3VsZAo+IG5vdCBwcmV2ZW50IHRoaXM/Cj4gCj4gUmVn
YXJkcywKPiBDaHVuLUt1YW5nLgo+IApEZXNpZ25lciBpcyBub3Qgc3VyZSBhYm91dCB0aGUgcHJl
dmlvdXMgU29Dcywgc3VjaCBhcyBtdDY3NzksIG10ODE3MwphbmQgbXQ4MTgzIHdob3NlIGdjZSBp
cyBpbiBtbXN5cywgaGF2ZSB0aGUgc2FtZSBpc3N1ZSBvciBub3Q/CgpTbyB3ZSBqdXN0IGFkZCB0
aGlzIGNvbmZpZ3VyYXRpb24gZm9yIG10ODE5NSB3aG9zZSBnY2UgaXMgaW4gaW5mcmEuCgpSZWdh
cmRzLApKYXNvbi1KSC5MaW4uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8
amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbWFpbGJveC9t
dGstY21kcS1tYWlsYm94LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gv
bXRrLWNtZHEtbWFpbGJveC5jCj4gPiBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmMKPiA+IGluZGV4IGE4ODQ1YjE2MmRiZi4uMzQyYjkxZjE2ZTY1IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYwo+ID4gKysrIGIvZHJpdmVycy9tYWls
Ym94L210ay1jbWRxLW1haWxib3guYwo+ID4gQEAgLTY2NCw3ICs2NjQsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGdjZV9wbGF0IGdjZV9wbGF0X3Y1ID0gewo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZ2NlX3BsYXQgZ2NlX3BsYXRfdjYgPSB7Cj4gPiAgICAgICAgIC50aHJlYWRfbnIgPSAyNCwK
PiA+ICAgICAgICAgLnNoaWZ0ID0gMywKPiA+IC0gICAgICAgLmNvbnRyb2xfYnlfc3cgPSBmYWxz
ZSwKPiA+ICsgICAgICAgLmNvbnRyb2xfYnlfc3cgPSB0cnVlLAo+ID4gICAgICAgICAuZ2NlX251
bSA9IDIKPiA+ICB9Owo+ID4gCj4gPiAtLQo+ID4gMi4xOC4wCj4gPiAKLS0gCkphc29uLUpIIExp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
