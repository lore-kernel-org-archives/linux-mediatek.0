Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB42C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=erbgcfQp1YslqKDEvLnzCFB756ZqzuZtYzXbelTh1NY=; b=fJCh5f9KpZZG0c
	KsnsyCJKk9bIEYSIYTJ9DuS6dEozC6b/WhL652h55EHruyum9E4dWr63V4T9uSkRHFjsdLK4Nghhz
	E0GVPzsI495DCiueZCcuuDJo19rI/RRyejgxjKRkBx/O3OIx3en7ixpbUl1vpek2f1U2QCFZnl6ju
	feLLDdlKLQTgLo1sn+wpmqVz9NESTc8MFxyqvgUGfGcfSz6/F+i9ho75pFZcD0H0nj6P17NG3keCk
	ym3sQb7JBB4tAVdpx+O9GekDMnC77hzAqvoh/VJsTW0AK730RqUrRzlWIAFgr4/YlzjA+YVm3PC48
	aw4AZisZL89sMzfXCEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7c63-002LPa-L9; Wed, 12 Jan 2022 11:47:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7c5d-002LJV-Mp; Wed, 12 Jan 2022 11:46:55 +0000
X-UUID: 54467f7ce0c14657b85b278e8dd2fa36-20220112
X-UUID: 54467f7ce0c14657b85b278e8dd2fa36-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555348661; Wed, 12 Jan 2022 04:46:51 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 03:37:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 19:37:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 19:37:24 +0800
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
Subject: [PATCH v12 0/2] This patches provide ADSP MBOX support for MT8195
Date: Wed, 12 Jan 2022 19:37:21 +0800
Message-ID: <20220112113723.32041-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_034653_758573_DBF8F864 
X-CRM114-Status: GOOD (  11.94  )
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
ZXMgc2luY2UgdjExOgotIHJlbW92ZSB1bnVzZWZ1bCBNT0RVTEVfTElDRU5TRQoKY2hhbmdlcyBz
aW5jZSB2MTA6Ci0gc3BsaXQgdXAgdjkgaW50byB0d28gc2VwYXJhdGUgc3VibWlzc2lvbnMKICBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gv
MjAyMjAxMTEwNzEwMTEuNTk2NC0xLWFsbGVuLWtoLmNoZW5nQG1lZGlhdGVrLmNvbS8KCmNoYW5n
ZXMgc2luY2Ugdjk6Ci0gcmVuYW1lIGFkc3BfbWJveF9jaGFuX29wcyB0byBtdGtfYWRzcF9tYm94
X2NoYW5fb3BzCgpjaGFuZ2VzIHNpbmNlIHY4OgotIHJlbW92ZSBzdHJ1Y3QgYWRzcF9tYm94X2No
X2luZm8KLSBhZGQgZ2V0X210a19hZHNwX21ib3hfcHJpdgotIHVzZSBtdGtfYWRzcF9tYm94X3By
aXYgdmFfbWJveHJlZyBhZGRyZXNzIGluIGFkc3AgbWJveCBkcml2ZXIKLSBhZGQgc3RydWN0IG10
a19hZHNwX21ib3hfY2ZnIGZvciBEU1AgbWJveCByZWdpc3RlciBvZmZzZXQKLSByZW1vdmUgYWRz
cCBtYm94IHJlZ2lzdGVyIG9mZnNldCBoYXJkIGNvZGUgZGVmaW5lCi0gcmVtb3ZlIG10ay1hZHNw
LWlwYy5oIHJlZmVyZW5jZSBpbiBhZHNwIG1ib3ggZHJpdmVyCgpjaGFuZ2VzIHNpbmNlIHY3Ogot
IGFkZCBtdGsgcHJlZml4IGZvciBhZHNwIGlwYyBmdW5jdGlvbnMKLSByZW5hbWUgYWRzcF9tYm94
X2NoX2luZm8gdG8gbXRrX2Fkc3BfbWJveF9jaF9pbmZvCi0gcmVtb3ZlIGluY29ycmVjdCByZXZp
ZXdlcnMgaW4gY29tbWl0IG1lc3NhZ2UKCmNoYW5nZXMgc2luY2UgdjY6Ci0gZHQtYmluZGluZ3M6
IGNoYW5nZSBleGFtcGxlIGR0c2kgbm9kZS4KLSByZW5hbWUgY29uZmlnIE1US19BRFNQX0lQQ19N
Qk9YIHRvIE1US19BRFNQX01CT1gKLSByZW1vdmUgdW51c2VkIHZhcmlhYmxlCi0gYWRkIHJldmll
d2VycwoKY2hhbmdlcyBzaW5jZSB2NToKLSByZW1vdmUgc29tZSByZWR1bmRhbnQgY29kZQoKY2hh
bmdlcyBzaW5jZSB2NDoKLSB1c2Ugc3dpdGNoIC4uLiBjYXNlIGluIGFkc3BfaXBjX3JlY3YKLSBh
ZGQgZXJyb3IgaGFuZGxpbmcgcGF0aCBmb3IgY2hhbl9uYW1lIHBvaW50ZXIKLSByZWZpbmUgc29t
ZSBjb2RlIHRvIGJlIGNvbmNpc2UKCmNoYW5nZXMgc2luY2UgdjM6Ci0gcmVvcmRlciBNVEtfQURT
UF9JUENfTUJPWCBjb25maWcKLSByZW1vdmUgc29tZSByZWR1bmRhbnQgY29kZQotIHJlbW92ZSBs
b2NrIGluIG10ay1hZHNwLW1haWxib3gKCmNoYW5nZXMgc2luY2UgdjI6Ci0gc2VwYXJhdGUgYWRz
cF9tYWlsYm94IGludG8gdHdvIGluc3RhbmNlcwoKY2hhbmdlcyBzaW5jZSB2MToKLSBmaXggZHRf
YmluZGluZ19jaGVjayBlcnJvcgoKCgpBbGxlbi1LSCBDaGVuZyAoMik6CiAgZHQtYmluZGluZ3M6
IG1lZGlhdGVrOiBhZGQgYWRzcC1tYm94IGRvY3VtZW50CiAgbWFpbGJveDogbWVkaWF0ZWs6IGFk
ZCBzdXBwb3J0IGZvciBhZHNwIG1haWxib3ggY29udHJvbGxlcgoKIC4uLi9iaW5kaW5ncy9tYWls
Ym94L210ayxhZHNwLW1ib3gueWFtbCAgICAgICB8ICA1MiArKysrKysKIGRyaXZlcnMvbWFpbGJv
eC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBkcml2ZXJzL21haWxib3gv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9tYWlsYm94L210
ay1hZHNwLW1haWxib3guYyAgICAgICAgICAgIHwgMTc1ICsrKysrKysrKysrKysrKysrKwogNCBm
aWxlcyBjaGFuZ2VkLCAyMzYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMKCi0t
IAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
