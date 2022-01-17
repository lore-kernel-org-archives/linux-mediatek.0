Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nBELJGdVrcOZzUZ1vAPVsjy+lqBLABHu2OOBINcQvgI=; b=gLDzgCUa0D5NKW
	9sPhZ8Mnzt5T2BIyE5FT57Z3wyB/2h3GtvZGL3Vjdvf1Msx6HWn7Lj6MRL2Qii7XzRcwbUvE0gBFU
	Dw/VD+yiPuK0Yl9ZqQYdZ2xI6G+SsO265ggVoTS6WBLA1weOcO5a+AOvvmYADyHDdI211OqOeaadd
	qzvI7fFiW6hJACxSmNp+XTFvPiRLI7CzBPqUBd4La4cTQvzSHkHcm/XU+cqAy/XStcKOESSnXx1vp
	ISmg3g4DV+NlqJUKFyHB8L03potwVhU+obNdPLUgOEbTiNMkJtc4NRc2MKYQuNG2ieTkRGjhtITfP
	sB009Hh7Nl+sVuFOewcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9LP8-00DemS-WE; Mon, 17 Jan 2022 06:22:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9LOv-00Dekq-VU; Mon, 17 Jan 2022 06:21:59 +0000
X-UUID: 1e36295554584edf9dde9bed9313e21c-20220116
X-UUID: 1e36295554584edf9dde9bed9313e21c-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 826744067; Sun, 16 Jan 2022 23:21:50 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 22:21:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 14:21:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 14:21:46 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Chen-Yu Tsai <wenst@chromium.org>, Kevin Hilman
 <khilman@baylibre.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v15 0/2] mtk: add ADSP mailbox controller support for MT8195
Date: Mon, 17 Jan 2022 14:21:43 +0800
Message-ID: <20220117062145.9929-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_222158_050879_3DEFBAA8 
X-CRM114-Status: GOOD (  12.81  )
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
ZXMgc2luY2UgdjE0OgotIGFkZCBpbmxpbmUgZm9yIGdldF9tdGtfYWRzcF9tYm94X3ByaXYKCmNo
YW5nZXMgc2luY2UgdjEzOgotIHJlYmFzZSBvbiB2NS4xNi1yYzgKLSBhZGQgYmFjayBwdHIgY2hl
Y2sgZnJvbSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEKCmNoYW5nZXMgc2luY2UgdjEyOgotIHJl
bW92ZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEgcHRyIGNoZWNrOgogIG9mX2RldmljZV9nZXRf
bWF0Y2hfZGF0YShkZXYpIHdpbGwgbmV2ZXIgZ29pbmcgdG8gcmV0dXJuIE5VTEwuCiAgZHJpdmVy
IHByb2JlIHdpdGggY29tcGF0aWJsZSBtZWRpYXRlayxtdDgxOTUtYWRzcC1tYm94LgoKY2hhbmdl
cyBzaW5jZSB2MTE6Ci0gcmVtb3ZlIHVudXNlZnVsIE1PRFVMRV9MSUNFTlNFCgpjaGFuZ2VzIHNp
bmNlIHYxMDoKLSBzcGxpdCB1cCB2OSBpbnRvIHR3byBzZXBhcmF0ZSBzdWJtaXNzaW9ucwogIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8y
MDIyMDExMTA3MTAxMS41OTY0LTEtYWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tLwoKY2hhbmdl
cyBzaW5jZSB2OToKLSByZW5hbWUgYWRzcF9tYm94X2NoYW5fb3BzIHRvIG10a19hZHNwX21ib3hf
Y2hhbl9vcHMKCmNoYW5nZXMgc2luY2Ugdjg6Ci0gcmVtb3ZlIHN0cnVjdCBhZHNwX21ib3hfY2hf
aW5mbwotIGFkZCBnZXRfbXRrX2Fkc3BfbWJveF9wcml2Ci0gdXNlIG10a19hZHNwX21ib3hfcHJp
diB2YV9tYm94cmVnIGFkZHJlc3MgaW4gYWRzcCBtYm94IGRyaXZlcgotIGFkZCBzdHJ1Y3QgbXRr
X2Fkc3BfbWJveF9jZmcgZm9yIERTUCBtYm94IHJlZ2lzdGVyIG9mZnNldAotIHJlbW92ZSBhZHNw
IG1ib3ggcmVnaXN0ZXIgb2Zmc2V0IGhhcmQgY29kZSBkZWZpbmUKLSByZW1vdmUgbXRrLWFkc3At
aXBjLmggcmVmZXJlbmNlIGluIGFkc3AgbWJveCBkcml2ZXIKCmNoYW5nZXMgc2luY2Ugdjc6Ci0g
YWRkIG10ayBwcmVmaXggZm9yIGFkc3AgaXBjIGZ1bmN0aW9ucwotIHJlbmFtZSBhZHNwX21ib3hf
Y2hfaW5mbyB0byBtdGtfYWRzcF9tYm94X2NoX2luZm8KLSByZW1vdmUgaW5jb3JyZWN0IHJldmll
d2VycyBpbiBjb21taXQgbWVzc2FnZQoKY2hhbmdlcyBzaW5jZSB2NjoKLSBkdC1iaW5kaW5nczog
Y2hhbmdlIGV4YW1wbGUgZHRzaSBub2RlLgotIHJlbmFtZSBjb25maWcgTVRLX0FEU1BfSVBDX01C
T1ggdG8gTVRLX0FEU1BfTUJPWAotIHJlbW92ZSB1bnVzZWQgdmFyaWFibGUKLSBhZGQgcmV2aWV3
ZXJzCgpjaGFuZ2VzIHNpbmNlIHY1OgotIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCgpjaGFu
Z2VzIHNpbmNlIHY0OgotIHVzZSBzd2l0Y2ggLi4uIGNhc2UgaW4gYWRzcF9pcGNfcmVjdgotIGFk
ZCBlcnJvciBoYW5kbGluZyBwYXRoIGZvciBjaGFuX25hbWUgcG9pbnRlcgotIHJlZmluZSBzb21l
IGNvZGUgdG8gYmUgY29uY2lzZQoKY2hhbmdlcyBzaW5jZSB2MzoKLSByZW9yZGVyIE1US19BRFNQ
X0lQQ19NQk9YIGNvbmZpZwotIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCi0gcmVtb3ZlIGxv
Y2sgaW4gbXRrLWFkc3AtbWFpbGJveAoKY2hhbmdlcyBzaW5jZSB2MjoKLSBzZXBhcmF0ZSBhZHNw
X21haWxib3ggaW50byB0d28gaW5zdGFuY2VzCgpjaGFuZ2VzIHNpbmNlIHYxOgotIGZpeCBkdF9i
aW5kaW5nX2NoZWNrIGVycm9yCgoKQWxsZW4tS0ggQ2hlbmcgKDIpOgogIGR0LWJpbmRpbmdzOiBt
ZWRpYXRlazogYWRkIGFkc3AtbWJveCBkb2N1bWVudAogIG1haWxib3g6IG1lZGlhdGVrOiBhZGQg
c3VwcG9ydCBmb3IgYWRzcCBtYWlsYm94IGNvbnRyb2xsZXIKCiAuLi4vYmluZGluZ3MvbWFpbGJv
eC9tdGssYWRzcC1tYm94LnlhbWwgICAgICAgfCAgNTIgKysrKysrCiBkcml2ZXJzL21haWxib3gv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9tYWlsYm94L01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tdGst
YWRzcC1tYWlsYm94LmMgICAgICAgICAgICB8IDE3NSArKysrKysrKysrKysrKysrKysKIDQgZmls
ZXMgY2hhbmdlZCwgMjM2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tdGssYWRzcC1tYm94LnlhbWwKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbXRrLWFkc3AtbWFpbGJveC5jCgotLSAK
Mi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
