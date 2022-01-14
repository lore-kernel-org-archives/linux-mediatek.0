Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WTK4YX6DRwp4eKp3wIpWAGcdivGNkippwgIhkZN3r3k=; b=V4Fmz9/aNQXRTZ
	IFyaFeIO8dung/PDVlkrW0Bp5ZPuqcF/MMAeH7QAbXrVPcZDyt0ZHsYuP3TIQBeGh/aXLqVBle3u8
	+7z+fdOPLzF3dSS5dJeSvbNFGkmP7Gnsvv3A20+TnsQIxSBwYmDpvyxCxhsFcjMrnzAsdjHVB37Q9
	/QQ0SsL6moPThjxIIDDOIKYagdkKYYwiOf+nYRSGNcMKriinBPs5DIoMnXaFkAt1e2Tf6ovH9Rsx/
	2MegcVN9zPWVkUz9t3AwVUx2F5UwujY/yojWmmEqx2IhxbLj4buMveHR/Q/KlnOKvo0liwi+EdyQB
	cR4gLn/c4MXO6wFEdSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8L2u-008ycT-ME; Fri, 14 Jan 2022 11:47:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8L2X-008yZF-Nf; Fri, 14 Jan 2022 11:46:44 +0000
X-UUID: bb3a1b65ac5b419597d03efdf4fbb5cd-20220114
X-UUID: bb3a1b65ac5b419597d03efdf4fbb5cd-20220114
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 559798168; Fri, 14 Jan 2022 04:46:37 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 03:46:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 19:46:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Jan 2022 19:46:34 +0800
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
Subject: [PATCH v14 0/2] mtk: add ADSP mailbox controller support for MT8195
Date: Fri, 14 Jan 2022 19:46:31 +0800
Message-ID: <20220114114633.742-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_034641_826483_EAD49B40 
X-CRM114-Status: GOOD (  12.25  )
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
ZXMgc2luY2UgdjEzOgotIHJlYmFzZSBvbiB2NS4xNi1yYzgKLSBhZGQgYmFjayBwdHIgY2hlY2sg
ZnJvbSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEKCmNoYW5nZXMgc2luY2UgdjEyOgotIHJlbW92
ZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEgcHRyIGNoZWNrOgogIG9mX2RldmljZV9nZXRfbWF0
Y2hfZGF0YShkZXYpIHdpbGwgbmV2ZXIgZ29pbmcgdG8gcmV0dXJuIE5VTEwuCiAgZHJpdmVyIHBy
b2JlIHdpdGggY29tcGF0aWJsZSBtZWRpYXRlayxtdDgxOTUtYWRzcC1tYm94LgoKY2hhbmdlcyBz
aW5jZSB2MTE6Ci0gcmVtb3ZlIHVudXNlZnVsIE1PRFVMRV9MSUNFTlNFCgpjaGFuZ2VzIHNpbmNl
IHYxMDoKLSBzcGxpdCB1cCB2OSBpbnRvIHR3byBzZXBhcmF0ZSBzdWJtaXNzaW9ucwogIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIy
MDExMTA3MTAxMS41OTY0LTEtYWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tLwoKY2hhbmdlcyBz
aW5jZSB2OToKLSByZW5hbWUgYWRzcF9tYm94X2NoYW5fb3BzIHRvIG10a19hZHNwX21ib3hfY2hh
bl9vcHMKCmNoYW5nZXMgc2luY2Ugdjg6Ci0gcmVtb3ZlIHN0cnVjdCBhZHNwX21ib3hfY2hfaW5m
bwotIGFkZCBnZXRfbXRrX2Fkc3BfbWJveF9wcml2Ci0gdXNlIG10a19hZHNwX21ib3hfcHJpdiB2
YV9tYm94cmVnIGFkZHJlc3MgaW4gYWRzcCBtYm94IGRyaXZlcgotIGFkZCBzdHJ1Y3QgbXRrX2Fk
c3BfbWJveF9jZmcgZm9yIERTUCBtYm94IHJlZ2lzdGVyIG9mZnNldAotIHJlbW92ZSBhZHNwIG1i
b3ggcmVnaXN0ZXIgb2Zmc2V0IGhhcmQgY29kZSBkZWZpbmUKLSByZW1vdmUgbXRrLWFkc3AtaXBj
LmggcmVmZXJlbmNlIGluIGFkc3AgbWJveCBkcml2ZXIKCmNoYW5nZXMgc2luY2Ugdjc6Ci0gYWRk
IG10ayBwcmVmaXggZm9yIGFkc3AgaXBjIGZ1bmN0aW9ucwotIHJlbmFtZSBhZHNwX21ib3hfY2hf
aW5mbyB0byBtdGtfYWRzcF9tYm94X2NoX2luZm8KLSByZW1vdmUgaW5jb3JyZWN0IHJldmlld2Vy
cyBpbiBjb21taXQgbWVzc2FnZQoKY2hhbmdlcyBzaW5jZSB2NjoKLSBkdC1iaW5kaW5nczogY2hh
bmdlIGV4YW1wbGUgZHRzaSBub2RlLgotIHJlbmFtZSBjb25maWcgTVRLX0FEU1BfSVBDX01CT1gg
dG8gTVRLX0FEU1BfTUJPWAotIHJlbW92ZSB1bnVzZWQgdmFyaWFibGUKLSBhZGQgcmV2aWV3ZXJz
CgpjaGFuZ2VzIHNpbmNlIHY1OgotIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCgpjaGFuZ2Vz
IHNpbmNlIHY0OgotIHVzZSBzd2l0Y2ggLi4uIGNhc2UgaW4gYWRzcF9pcGNfcmVjdgotIGFkZCBl
cnJvciBoYW5kbGluZyBwYXRoIGZvciBjaGFuX25hbWUgcG9pbnRlcgotIHJlZmluZSBzb21lIGNv
ZGUgdG8gYmUgY29uY2lzZQoKY2hhbmdlcyBzaW5jZSB2MzoKLSByZW9yZGVyIE1US19BRFNQX0lQ
Q19NQk9YIGNvbmZpZwotIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCi0gcmVtb3ZlIGxvY2sg
aW4gbXRrLWFkc3AtbWFpbGJveAoKY2hhbmdlcyBzaW5jZSB2MjoKLSBzZXBhcmF0ZSBhZHNwX21h
aWxib3ggaW50byB0d28gaW5zdGFuY2VzCgpjaGFuZ2VzIHNpbmNlIHYxOgotIGZpeCBkdF9iaW5k
aW5nX2NoZWNrIGVycm9yCgpBbGxlbi1LSCBDaGVuZyAoMik6CiAgZHQtYmluZGluZ3M6IG1lZGlh
dGVrOiBhZGQgYWRzcC1tYm94IGRvY3VtZW50CiAgbWFpbGJveDogbWVkaWF0ZWs6IGFkZCBzdXBw
b3J0IGZvciBhZHNwIG1haWxib3ggY29udHJvbGxlcgoKIC4uLi9iaW5kaW5ncy9tYWlsYm94L210
ayxhZHNwLW1ib3gueWFtbCAgICAgICB8ICA1MiArKysrKysKIGRyaXZlcnMvbWFpbGJveC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBkcml2ZXJzL21haWxib3gvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9tYWlsYm94L210ay1hZHNw
LW1haWxib3guYyAgICAgICAgICAgIHwgMTc1ICsrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBj
aGFuZ2VkLCAyMzYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMKCi0tIAoyLjE4
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
