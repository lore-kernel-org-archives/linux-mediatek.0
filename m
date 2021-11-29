Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F303C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pofAH/5lzrKYuj/FZSMJHgS/FuGY2i5NqEI1WnXmORQ=; b=cBOAbOUV6krjDo
	l5qxy7a02UJk04MVkOBE80k+DfHPSMVpZDqtseVNHcc6XOaYtBrEsne/gIZlTrPIJRoEXm9oWOood
	Nb0jaFbkhLz4AONeqeqwdNZhz1yyGQlSKbJYqfOeURY8rfJsygsZJu/iHjyJq0uyLQCLoAMtntEAa
	Vzi0snFLv+UbgwIoqaFyeUDFwM4O7sArEYUk70fG8SD5+Y7vFCFdZuxdxIfUMa7Sb9mzcZuNwKWpB
	hnHMr+zhuT/FYfwK4B6f+UGnk6LRvlKL4BbEk3Gtt0EPAg19VMfY9/N5Bn3JkoWp5nUEjKywNaR1I
	gsBSJxzQ3n2ql+dzPZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdm0-000NPS-22; Mon, 29 Nov 2021 10:20:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdlO-000NG4-Ad; Mon, 29 Nov 2021 10:20:01 +0000
X-UUID: 27aa9f2ec9d14225b74fb5513c8b94da-20211129
X-UUID: 27aa9f2ec9d14225b74fb5513c8b94da-20211129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 245936500; Mon, 29 Nov 2021 03:19:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 02:19:49 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 29 Nov 2021 18:19:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 18:19:47 +0800
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
Subject: [PATCH v8 0/3] This patches provide ADSP IPC support for MT8195
Date: Mon, 29 Nov 2021 18:19:42 +0800
Message-ID: <20211129101946.6008-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_021958_395926_8AC22C36 
X-CRM114-Status: GOOD (  11.50  )
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
ZXMgc2luY2Ugdjc6Ci0gYWRkIG10ayBwcmVmaXggZm9yIGFkc3AgaXBjIGZ1bmN0aW9ucwotIHJl
bmFtZSBhZHNwX21ib3hfY2hfaW5mbyB0byBtdGtfYWRzcF9tYm94X2NoX2luZm8KLSByZW5hbWUg
YWRzcF9tYm94X2NoYW5fb3BzIHRvIG10a19hZHNwX21ib3hfY2hhbl9vcHMKLSByZW1vdmUgaW5j
b3JyZWN0IHJldmlld2VycyBpbiBjb21taXQgbWVzc2FnZQoKY2hhbmdlcyBzaW5jZSB2NjoKLSBk
dC1iaW5kaW5nczogY2hhbmdlIGV4YW1wbGUgZHRzaSBub2RlLgotIHJlbmFtZSBjb25maWcgTVRL
X0FEU1BfSVBDX01CT1ggdG8gTVRLX0FEU1BfTUJPWAotIHJlbW92ZSB1bnVzZWQgdmFyaWFibGUK
LSBhZGQgcmV2aWV3ZXJzCgpjaGFuZ2VzIHNpbmNlIHY1OgotIHJlbW92ZSBzb21lIHJlZHVuZGFu
dCBjb2RlCgpjaGFuZ2VzIHNpbmNlIHY0OgotIHVzZSBzd2l0Y2ggLi4uIGNhc2UgaW4gYWRzcF9p
cGNfcmVjdgotIGFkZCBlcnJvciBoYW5kbGluZyBwYXRoIGZvciBjaGFuX25hbWUgcG9pbnRlcgot
IHJlZmluZSBzb21lIGNvZGUgdG8gYmUgY29uY2lzZQoKY2hhbmdlcyBzaW5jZSB2MzoKLSByZW9y
ZGVyIE1US19BRFNQX0lQQ19NQk9YIGNvbmZpZwotIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2Rl
Ci0gcmVtb3ZlIGxvY2sgaW4gbXRrLWFkc3AtbWFpbGJveAoKY2hhbmdlcyBzaW5jZSB2MjoKLSBz
ZXBhcmF0ZSBhZHNwX21haWxib3ggaW50byB0d28gaW5zdGFuY2VzCgpjaGFuZ2VzIHNpbmNlIHYx
OgotIGZpeCBkdF9iaW5kaW5nX2NoZWNrIGVycm9yCgpBbGxlbi1LSCBDaGVuZyAoMyk6CiAgZHQt
YmluZGluZ3M6IG1lZGlhdGVrOiBhZGQgYWRzcC1tYm94IGRvY3VtZW50CiAgZmlybXdhcmU6IG1l
ZGlhdGVrOiBhZGQgYWRzcCBpcGMgcHJvdG9jb2wgaW50ZXJmYWNlCiAgbWFpbGJveDogbWVkaWF0
ZWs6IGFkZCBzdXBwb3J0IGZvciBhZHNwIG1haWxib3ggY29udHJvbGxlcgoKIC4uLi9iaW5kaW5n
cy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbCAgICAgICB8ICA1MiArKysrKysKIGRyaXZlcnMv
ZmlybXdhcmUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2Zp
cm13YXJlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9maXJt
d2FyZS9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgIHwgICA5ICsKIGRyaXZlcnMvZmlybXdh
cmUvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2Zpcm13YXJl
L21lZGlhdGVrL210ay1hZHNwLWlwYy5jICAgICAgfCAxMzggKysrKysrKysrKysrKysKIGRyaXZl
cnMvbWFpbGJveC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBkcml2ZXJz
L21haWxib3gvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9t
YWlsYm94L210ay1hZHNwLW1haWxib3guYyAgICAgICAgICAgIHwgMTc1ICsrKysrKysrKysrKysr
KysrKwogLi4uL2xpbnV4L2Zpcm13YXJlL21lZGlhdGVrL210ay1hZHNwLWlwYy5oICAgIHwgIDcw
ICsrKysrKysKIDEwIGZpbGVzIGNoYW5nZWQsIDQ1NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLGFk
c3AtbWJveC55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9tZWRpYXRl
ay9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9N
YWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvbXRr
LWFkc3AtaXBjLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbXRrLWFkc3At
bWFpbGJveC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZWRp
YXRlay9tdGstYWRzcC1pcGMuaAoKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
