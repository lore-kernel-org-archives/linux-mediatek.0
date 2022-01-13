Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GmhZ5ga9EQgZtoxCJ3koO3BKnO8mgtjeo2iAYsfXKh4=; b=P3hv4LohQpIz4F
	iGRdn5l4HWSI+U1nB/NWxDz9ruE3rszbTMgJFdlK9IgouHM+REZVJKbtvd1mlhILFFHUv0OiRmn3M
	Q8ek23GMqtfLdCwixn1xWwalxNZiCgMuSoVjyvtBXU2TPMOvjUKANNJ+d93sw5z5pikvG/1G/r2Xz
	1YWqgrpxzIuFmaTHXz/S/fg7lI9KrBhDSz9qDmLD03SEoeoeXQGZWLabYUpzwv1dNK7Fji6GPeqZO
	L1LroJgYEq19T1M6n95Wdw7HGj4RaVzplRmllX35cmO0Hb8PzMH84daAcEAGC89WXjwuVXxp/HYdl
	X6/us2Ksb2YGy4wGGFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7vM9-0054xm-VY; Thu, 13 Jan 2022 08:21:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7vM7-0054xM-Nk; Thu, 13 Jan 2022 08:21:13 +0000
X-UUID: e4aa1b1743ad48e7b22120415cb7f3f8-20220113
X-UUID: e4aa1b1743ad48e7b22120415cb7f3f8-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1498095169; Thu, 13 Jan 2022 01:21:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 00:21:06 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 13 Jan 2022 16:21:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Jan 2022 16:21:04 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v13 0/2] Mediatek ADSP mailbox controller support for MT8195
Date: Thu, 13 Jan 2022 16:21:01 +0800
Message-ID: <20220113082103.27911-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_002111_826113_00EDA0A8 
X-CRM114-Status: GOOD (  11.12  )
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

RnJvbTogQWxsZW4tS0ggQ2hlbmcgPEFsbGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KCk1lZGlh
dGVrIEFEU1AgSVBDIGlzIHVzZWQgdG8gc2VuZCBub3RpZmljYXRpb24gb3Igc2hvcnQgbWVzc2Fn
ZSBiZXR3ZWVuIHByb2Nlc3NvcnMgd2l0aCBkc3AuwrcKCkl0IHdpbGwgcGxhY2UgdGhlIG1lc3Nh
Z2UgdG8gdGhlIHNoYXJlIGJ1ZmZlciBhbmQgd2lsbCBhY2Nlc3MgdGhlIEFEU1AgbWFpbGJveCBy
ZWdpc3RlcnMgdG8ga2ljayBkc3AuCgpUd28gbWFpbGJveGVzIHVzZWQgdG8gc2VuZCBub3RpZmlj
YXRpb24gb3Igc2hvcnQgbWVzc2FnZSBiZXR3ZWVuIHByb2Nlc3NvcnMgd2l0aCBkc3AKCmNoYW5n
ZXMgc2luY2UgdjEyOgotIHJlbW92ZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEgcHRyIGNoZWNr
OgogIG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpIHdpbGwgbmV2ZXIgZ29pbmcgdG8gcmV0
dXJuIE5VTEwuCiAgZHJpdmVyIHByb2JlIHdpdGggY29tcGF0aWJsZSBtZWRpYXRlayxtdDgxOTUt
YWRzcC1tYm94LgoKY2hhbmdlcyBzaW5jZSB2MTE6Ci0gcmVtb3ZlIHVudXNlZnVsIE1PRFVMRV9M
SUNFTlNFCgpjaGFuZ2VzIHNpbmNlIHYxMDoKLSBzcGxpdCB1cCB2OSBpbnRvIHR3byBzZXBhcmF0
ZSBzdWJtaXNzaW9ucwogIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9wYXRjaC8yMDIyMDExMTA3MTAxMS41OTY0LTEtYWxsZW4ta2guY2hlbmdAbWVk
aWF0ZWsuY29tLwoKY2hhbmdlcyBzaW5jZSB2OToKLSByZW5hbWUgYWRzcF9tYm94X2NoYW5fb3Bz
IHRvIG10a19hZHNwX21ib3hfY2hhbl9vcHMKCmNoYW5nZXMgc2luY2Ugdjg6Ci0gcmVtb3ZlIHN0
cnVjdCBhZHNwX21ib3hfY2hfaW5mbwotIGFkZCBnZXRfbXRrX2Fkc3BfbWJveF9wcml2Ci0gdXNl
IG10a19hZHNwX21ib3hfcHJpdiB2YV9tYm94cmVnIGFkZHJlc3MgaW4gYWRzcCBtYm94IGRyaXZl
cgotIGFkZCBzdHJ1Y3QgbXRrX2Fkc3BfbWJveF9jZmcgZm9yIERTUCBtYm94IHJlZ2lzdGVyIG9m
ZnNldAotIHJlbW92ZSBhZHNwIG1ib3ggcmVnaXN0ZXIgb2Zmc2V0IGhhcmQgY29kZSBkZWZpbmUK
LSByZW1vdmUgbXRrLWFkc3AtaXBjLmggcmVmZXJlbmNlIGluIGFkc3AgbWJveCBkcml2ZXIKCmNo
YW5nZXMgc2luY2Ugdjc6Ci0gYWRkIG10ayBwcmVmaXggZm9yIGFkc3AgaXBjIGZ1bmN0aW9ucwot
IHJlbmFtZSBhZHNwX21ib3hfY2hfaW5mbyB0byBtdGtfYWRzcF9tYm94X2NoX2luZm8KLSByZW1v
dmUgaW5jb3JyZWN0IHJldmlld2VycyBpbiBjb21taXQgbWVzc2FnZQoKY2hhbmdlcyBzaW5jZSB2
NjoKLSBkdC1iaW5kaW5nczogY2hhbmdlIGV4YW1wbGUgZHRzaSBub2RlLgotIHJlbmFtZSBjb25m
aWcgTVRLX0FEU1BfSVBDX01CT1ggdG8gTVRLX0FEU1BfTUJPWAotIHJlbW92ZSB1bnVzZWQgdmFy
aWFibGUKLSBhZGQgcmV2aWV3ZXJzCgpjaGFuZ2VzIHNpbmNlIHY1OgotIHJlbW92ZSBzb21lIHJl
ZHVuZGFudCBjb2RlCgpjaGFuZ2VzIHNpbmNlIHY0OgotIHVzZSBzd2l0Y2ggLi4uIGNhc2UgaW4g
YWRzcF9pcGNfcmVjdgotIGFkZCBlcnJvciBoYW5kbGluZyBwYXRoIGZvciBjaGFuX25hbWUgcG9p
bnRlcgotIHJlZmluZSBzb21lIGNvZGUgdG8gYmUgY29uY2lzZQoKY2hhbmdlcyBzaW5jZSB2MzoK
LSByZW9yZGVyIE1US19BRFNQX0lQQ19NQk9YIGNvbmZpZwotIHJlbW92ZSBzb21lIHJlZHVuZGFu
dCBjb2RlCi0gcmVtb3ZlIGxvY2sgaW4gbXRrLWFkc3AtbWFpbGJveAoKY2hhbmdlcyBzaW5jZSB2
MjoKLSBzZXBhcmF0ZSBhZHNwX21haWxib3ggaW50byB0d28gaW5zdGFuY2VzCgpjaGFuZ2VzIHNp
bmNlIHYxOgotIGZpeCBkdF9iaW5kaW5nX2NoZWNrIGVycm9yCgoKQWxsZW4tS0ggQ2hlbmcgKDIp
OgogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIGFkc3AtbWJveCBkb2N1bWVudAogIG1haWxi
b3g6IG1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3IgYWRzcCBtYWlsYm94IGNvbnRyb2xsZXIKCiAu
Li4vYmluZGluZ3MvbWFpbGJveC9tdGssYWRzcC1tYm94LnlhbWwgICAgICAgfCAgNTIgKysrKysr
CiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwog
ZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRy
aXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMgICAgICAgICAgICB8IDE3MiArKysrKysr
KysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjMzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tdGss
YWRzcC1tYm94LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbXRrLWFk
c3AtbWFpbGJveC5jCgotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
