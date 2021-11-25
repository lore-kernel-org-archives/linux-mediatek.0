Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42115C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ARkSFoHvhjNMRCUW+v9zoM/UvRCpvwqmuKBtY9ib6HE=; b=cJSGXJoosyw0Q5
	cy20U7K0JJE7wpOQxnAqd3kQXcdTNM/8E++sLX9K9TpXwyY3la67pwoRr3M5woG42h9rcB+GGNftB
	TaRpDknkNhyoZp2PqIt2IoKJNZ8rPs+CAnM8aLds3G56ijcwoKSGlNiMFXXKo0OG5hpORyaHWmsFl
	6ulTRm31FuppI0H/HaOiZJsQsxNUS9cSfNIGIYoZ37X/XrqvqhN6/F1MtgK9UhhBRe/uq6fDJFfAd
	TaUXeOeiwWVMisPQP8ZIUngXFDmPs9N/Xgz6P6SrKagsR6tXOl4fKF3rpsQkfpgwq53sk3EMq0tQH
	xaaKpup37w4rTqBKfWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqDt7-007O56-VF; Thu, 25 Nov 2021 12:30:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqDss-007O0l-5C; Thu, 25 Nov 2021 12:29:51 +0000
X-UUID: 5b25f3f0baa64356a8ba85de8f8fd063-20211125
X-UUID: 5b25f3f0baa64356a8ba85de8f8fd063-20211125
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1248081663; Thu, 25 Nov 2021 05:29:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 04:29:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 25 Nov 2021 20:29:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Nov 2021 20:29:42 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>, allen-kh.cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 0/3] This patches provide ADSP IPC support for MT8195
Date: Thu, 25 Nov 2021 20:29:22 +0800
Message-ID: <20211125122925.1303-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_042950_241539_AC18976F 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
bWVzc2FnZSB0byB0aGUgc2hhcmUgYnVmZmVyIGFuZCB3aWxsIGFjY2VzcyB0aGUgQURTUCBtYWls
Ym94CnJlZ2lzdGVycyB0byBraWNrIGRzcC4KClR3byBtYWlsYm94ZXMgdXNlZCB0byBzZW5kIG5v
dGlmaWNhdGlvbiBvciBzaG9ydCBtZXNzYWdlIGJldHdlZW4gcHJvY2Vzc29ycyB3aXRoCmRzcAoK
Y2hhbmdlcyBzaW5jZSB2MzoKLSByZW9yZGVyIE1US19BRFNQX0lQQ19NQk9YIGNvbmZpZwotIHJl
bW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCi0gcmVtb3ZlIGxvY2sgaW4gbXRrLWFkc3AtbWFpbGJv
eAoKY2hhbmdlcyBzaW5jZSB2MjoKLSBzZXBlcmF0ZSBhZHNwX21haWxib3ggaW50byB0d28gaW5z
dGFuY2VzCgpjaGFuZ2VzIHNpbmNlIHYxOgotIGZpeCBkdF9iaW5kaW5nX2NoZWNrIGVycm9yCgpB
bGxlbi1LSCBDaGVuZyAoMyk6CiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBhZGQgYWRzcC1tYm94
IGRvY3VtZW50CiAgZmlybXdhcmU6IG1lZGlhdGVrOiBhZGQgYWRzcCBpcGMgcHJvdG9jb2wgaW50
ZXJmYWNlCiAgbWFpbGJveDogbWVkaWF0ZWs6IGFkZCBzdXBwb3J0IGZvciBhZHNwIG1haWxib3gg
Y29udHJvbGxlcgoKIC4uLi9iaW5kaW5ncy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbCAgICAg
ICB8ICA1MiArKysrKwogZHJpdmVycy9maXJtd2FyZS9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAg
fCAgIDkgKwogZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgIHwg
ICAyICsKIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmMgICAgICB8IDEz
MiArKysrKysrKysrKysrCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDcgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMgICAgICAgICAg
ICB8IDE4NCArKysrKysrKysrKysrKysrKysKIC4uLi9saW51eC9maXJtd2FyZS9tZWRpYXRlay9t
dGstYWRzcC1pcGMuaCAgICB8ICA3MCArKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCA0NjAgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZmlybXdhcmUvbWVkaWF0ZWsvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2Zpcm13YXJlL21lZGlhdGVrL210ay1hZHNwLWlwYy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tYWlsYm94L210ay1hZHNwLW1haWxib3guYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvbGludXgvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmgKCi0tIAoyLjE4LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
