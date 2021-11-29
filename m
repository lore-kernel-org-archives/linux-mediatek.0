Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3423C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eCFlEaCXA3ftjbGJQov+lfe8xp6nf84d/TL01ArAmLM=; b=fizd3dTj2HY6tM
	AIHAiA0SyWJo50P4vVQOTN4vQmjGqZdPjzzLFbUzGcA4ve0SLZ6/dkOAMcYNB0ulzoDG302qp6fJP
	iXuobmVbktrrCwRhazV/8wb3j36kM2e680g91x2ZjzrNaPR4ZTnJjByz4wsFIZiJXMrt6MOyhmxB5
	K36Hs8v6ySqhbpD9FM32caPYz9VRanp7RrMW2d7TjMctsp+UOWfRUY1N7VrqSK2ruon2Gliwh2Esl
	Ub951ENzfQDZ5fljFu0dIyvjUrK6XHR//0zwE65+FU0pTXU5qpHsY79dCR7c2QCKNsFfHgdDWB0mV
	PaVX3VNGtih/m9yBCHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mraKu-00HTDE-1Q; Mon, 29 Nov 2021 06:40:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mraKf-00HTAD-6j; Mon, 29 Nov 2021 06:40:12 +0000
X-UUID: 6a7a1abf5f8a45088cad817b1b996194-20211128
X-UUID: 6a7a1abf5f8a45088cad817b1b996194-20211128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1653550184; Sun, 28 Nov 2021 23:40:04 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 22:40:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 14:40:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 14:40:00 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v7 0/3] This patches provide ADSP IPC support for MT8195
Date: Mon, 29 Nov 2021 14:39:51 +0800
Message-ID: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_224009_298712_3A4D2CBA 
X-CRM114-Status: GOOD (  10.94  )
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
ZSBiZXR3ZWVuCnByb2Nlc3NvcnMgd2l0aCBkc3AuwrcKCkl0IHdpbGwgcGxhY2UgdGhlIG1lc3Nh
Z2UgdG8gdGhlIHNoYXJlIGJ1ZmZlciBhbmQgd2lsbCBhY2Nlc3MgdGhlIEFEU1AgbWFpbGJveApy
ZWdpc3RlcnMgdG8ga2ljayBkc3AuCgpUd28gbWFpbGJveGVzIHVzZWQgdG8gc2VuZCBub3RpZmlj
YXRpb24gb3Igc2hvcnQgbWVzc2FnZSBiZXR3ZWVuIHByb2Nlc3NvcnMgd2l0aApkc3AKCmNoYW5n
ZXMgc2luY2UgdjY6Ci0gZHQtYmluZGluZ3M6IGNoYW5nZSBleGFtcGxlIGR0c2kgbm9kZS4KLSBj
aGFuZ2UgY29uZmlnIE1US19BRFNQX0lQQ19NQk9YIHRvIE1US19BRFNQX01CT1gKLSByZW1vdmUg
dW51c2VkIHZhcmlhYmxlCi0gYWRkIHJldmlld2VycwoKY2hhbmdlcyBzaW5jZSB2NToKLSByZW1v
dmUgc29tZSByZWR1bmRhbnQgY29kZQoKY2hhbmdlcyBzaW5jZSB2NDoKLSB1c2Ugc3dpdGNoIC4u
LiBjYXNlIGluIGFkc3BfaXBjX3JlY3YKLSBhZGQgZXJyb3IgaGFuZGxpbmcgcGF0aCBmb3IgY2hh
bl9uYW1lIHBvaW50ZXIKLSByZWZpbmUgc29tZSBjb2RlIHRvIGJlIGNvbmNpc2UKCmNoYW5nZXMg
c2luY2UgdjM6Ci0gcmVvcmRlciBNVEtfQURTUF9JUENfTUJPWCBjb25maWcKLSByZW1vdmUgc29t
ZSByZWR1bmRhbnQgY29kZQotIHJlbW92ZSBsb2NrIGluIG10ay1hZHNwLW1haWxib3gKCmNoYW5n
ZXMgc2luY2UgdjI6Ci0gc2VwYXJhdGUgYWRzcF9tYWlsYm94IGludG8gdHdvIGluc3RhbmNlcwoK
Y2hhbmdlcyBzaW5jZSB2MToKLSBmaXggZHRfYmluZGluZ19jaGVjayBlcnJvcgoKQWxsZW4tS0gg
Q2hlbmcgKDMpOgogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIGFkc3AtbWJveCBkb2N1bWVu
dAogIGZpcm13YXJlOiBtZWRpYXRlazogYWRkIGFkc3AgaXBjIHByb3RvY29sIGludGVyZmFjZQog
IG1haWxib3g6IG1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3IgYWRzcCBtYWlsYm94IGNvbnRyb2xs
ZXIKCiAuLi4vYmluZGluZ3MvbWFpbGJveC9tdGssYWRzcC1tYm94LnlhbWwgICAgICAgfCAgNTIg
KysrKysrCiBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAx
ICsKIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICB8ICAgOSAr
CiBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgfCAgIDIgKwog
ZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9tdGstYWRzcC1pcGMuYyAgICAgIHwgMTM4ICsrKysr
KysrKysrKysrCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDcgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwg
ICAyICsKIGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMgICAgICAgICAgICB8IDE3
NSArKysrKysrKysrKysrKysrKysKIC4uLi9saW51eC9maXJtd2FyZS9tZWRpYXRlay9tdGstYWRz
cC1pcGMuaCAgICB8ICA3MCArKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCA0NTcgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
ZmlybXdhcmUvbWVkaWF0ZWsvS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmly
bXdhcmUvbWVkaWF0ZWsvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13
YXJlL21lZGlhdGVrL210ay1hZHNwLWlwYy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
YWlsYm94L210ay1hZHNwLW1haWxib3guYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGlu
dXgvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmgKCi0tIAoyLjE4LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
