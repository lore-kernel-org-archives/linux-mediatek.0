Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B4BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=67dt9uaWPJd7TgViy28HfeUI9dAL48+DqAzlA3G8D+Q=; b=q+rWcPnYHlPLhv
	s1BCvlMDAehc7RgTwBYCdcbYfkA0DNgxEnufuMb2TK5i3KvR0a8XeBVCZZNTLKAPsP5tAshXhRX4L
	u24WS2SNazj9v9X2WhrlzajjVIg+k/0/UET1SzltQatwjP6k+tvVJU71TqGx2Qi7fxII+GTETzfyq
	g8W1HwYGPMeL21GpxYxoO5V733HiSrXf+mFCm8x/SUQYCEZlkCy26rrgVqsw5a8kLcV46kjUozBhu
	1R5YXOM9NWwT+S9BLR/NgEJcHXR/DNRvYMgyMUmV8TAxHnvAFyiNu5lyRygHFkeocSebACCZrR14b
	ReCAlNfVTZ0GErEC16rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXjd-009kJF-5l; Fri, 26 Nov 2021 09:41:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXia-009jtJ-1F; Fri, 26 Nov 2021 09:40:33 +0000
X-UUID: c8e8522d5d6c4d6685da4d7905c4801f-20211126
X-UUID: c8e8522d5d6c4d6685da4d7905c4801f-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1685449989; Fri, 26 Nov 2021 02:40:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 01:30:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 26 Nov 2021 17:30:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Nov 2021 17:30:23 +0800
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
 <sound-open-firmware@alsa-project.org>, allen-kh.cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v6 0/3] This patches provide ADSP IPC support for MT8195
Date: Fri, 26 Nov 2021 17:30:18 +0800
Message-ID: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014032_101985_B2990D2F 
X-CRM114-Status: GOOD (  11.61  )
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

TWVkaWF0ZWsgQURTUCBJUEMgaXMgdXNlZCB0byBzZW5kIG5vdGlmaWNhdGlvbiBvciBzaG9ydCBt
ZXNzYWdlIGJldHdlZW4KcHJvY2Vzc29ycyB3aXRoIGRzcC7CtwoKSXQgd2lsbCBwbGFjZSB0aGUg
bWVzc2FnZSB0byB0aGUgc2hhcmUgYnVmZmVyIGFuZCB3aWxsIGFjY2VzcyB0aGUgQURTUAptYWls
Ym94IHJlZ2lzdGVycyB0byBraWNrIGRzcC4KClR3byBtYWlsYm94ZXMgdXNlZCB0byBzZW5kIG5v
dGlmaWNhdGlvbiBvciBzaG9ydCBtZXNzYWdlIGJldHdlZW4gcHJvY2Vzc29ycwp3aXRoIGRzcAoK
Y2hhbmdlcyBzaW5jZSB2NToKLSByZW1vdmUgc29tZSByZWR1bmRhbnQgY29kZQoKY2hhbmdlcyBz
aW5jZSB2NDoKLSB1c2Ugc3dpdGNoIC4uLiBjYXNlIGluIGFkc3BfaXBjX3JlY3YKLSBhZGQgZXJy
b3IgaGFuZGxpbmcgcGF0aCBmb3IgY2hhbl9uYW1lIHBvaW50ZXIKLSByZWZpbmUgc29tZSBjb2Rl
IHRvIGJlIGNvbmNpc2UKCmNoYW5nZXMgc2luY2UgdjM6Ci0gcmVvcmRlciBNVEtfQURTUF9JUENf
TUJPWCBjb25maWcKLSByZW1vdmUgc29tZSByZWR1bmRhbnQgY29kZQotIHJlbW92ZSBsb2NrIGlu
IG10ay1hZHNwLW1haWxib3gKCmNoYW5nZXMgc2luY2UgdjI6Ci0gc2VwYXJhdGUgYWRzcF9tYWls
Ym94IGludG8gdHdvIGluc3RhbmNlcwoKY2hhbmdlcyBzaW5jZSB2MToKLSBmaXggZHRfYmluZGlu
Z19jaGVjayBlcnJvcgoKCkFsbGVuLUtIIENoZW5nICgzKToKICBkdC1iaW5kaW5nczogbWVkaWF0
ZWs6IGFkZCBhZHNwLW1ib3ggZG9jdW1lbnQKICBmaXJtd2FyZTogbWVkaWF0ZWs6IGFkZCBhZHNw
IGlwYyBwcm90b2NvbCBpbnRlcmZhY2UKICBtYWlsYm94OiBtZWRpYXRlazogYWRkIHN1cHBvcnQg
Zm9yIGFkc3AgbWFpbGJveCBjb250cm9sbGVyCgogLi4uL2JpbmRpbmdzL21haWxib3gvbXRrLGFk
c3AtbWJveC55YW1sICAgICAgIHwgIDUyICsrKysrCiBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvS2Nv
bmZpZyAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL01ha2Vm
aWxlICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9tdGstYWRz
cC1pcGMuYyAgICAgIHwgMTM4ICsrKysrKysrKysrKysrCiBkcml2ZXJzL21haWxib3gvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1t
YWlsYm94LmMgICAgICAgICAgICB8IDE3OCArKysrKysrKysrKysrKysrKysKIC4uLi9saW51eC9m
aXJtd2FyZS9tZWRpYXRlay9tdGstYWRzcC1pcGMuaCAgICB8ICA3MCArKysrKysrCiAxMCBmaWxl
cyBjaGFuZ2VkLCA0NjAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvS2NvbmZpZwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvTWFrZWZpbGUKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL210ay1hZHNwLWlwYy5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tYWlsYm94L210ay1hZHNwLW1haWxib3guYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBj
LmgKCi0tIAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
