Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D010C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o3o0rfuGskcmYBaonK4gA5B5ndrLpo8VR/DC/VpbwXA=; b=Rb3GOBMRgBgdJk
	+NgpAZu8jqJiEbpxs3ZNwH7IbokFrPuTDJUEiauYRhuZRv/Ue/UWQdGcw2JSSKLGgp+Lhf3SbiOG4
	Ui7d0sw3r1KysVQ9W3MzJxio6FZkpt3dIEadtmlx6K7l43cHrR0l/woAaq+bNBvbOUGLp4JI6Gloa
	Noy9XoQc32Iv8sanLZm4o1xIki8LR91gbqNHp9Vv72sNQpfqF538IhguCBHtinM3YDZlQdxkU3oql
	pfXGs3QfvM7PbA4teqDBw80wnVP3xI2ZLg+VbnWOZNHNlQQMdeP1BGZGmP9rri8laRavpOh+QE8Yi
	XaCtW9W15oHZb/XbYajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msKTb-007jiO-V1; Wed, 01 Dec 2021 07:56:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msKTN-007jfn-R1; Wed, 01 Dec 2021 07:56:16 +0000
X-UUID: 530e2e8fbf454737b7e4aab3f3aa8a06-20211201
X-UUID: 530e2e8fbf454737b7e4aab3f3aa8a06-20211201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1983895341; Wed, 01 Dec 2021 00:56:09 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 23:56:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Dec 2021 15:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 15:56:06 +0800
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
Subject: [PATCH v9 0/3] This patches provide ADSP IPC support for MT8195
Date: Wed, 1 Dec 2021 15:56:01 +0800
Message-ID: <20211201075604.27864-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_235613_912019_58D48F41 
X-CRM114-Status: GOOD (  12.46  )
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
ZXMgc2luY2Ugdjg6Ci0gcmVtb3ZlIHN0cnVjdCBhZHNwX21ib3hfY2hfaW5mbwotIGFkZCBnZXRf
bXRrX2Fkc3BfbWJveF9wcml2Ci0gdXNlIG10a19hZHNwX21ib3hfcHJpdiB2YV9tYm94cmVnIGFk
ZHJlc3MgaW4gYWRzcCBtYm94IGRyaXZlcgotIGFkZCBzdHJ1Y3QgbXRrX2Fkc3BfbWJveF9jZmcg
Zm9yIERTUCBtYm94IHJlZ2lzdGVyIG9mZnNldAotIHJlbW92ZSBhZHNwIG1ib3ggcmVnaXN0ZXIg
b2Zmc2V0IGhhcmQgY29kZSBkZWZpbmUKLSByZW1vdmUgbXRrLWFkc3AtaXBjLmggcmVmZXJlbmNl
IGluIGFkc3AgbWJveCBkcml2ZXIKCmNoYW5nZXMgc2luY2Ugdjc6Ci0gYWRkIG10ayBwcmVmaXgg
Zm9yIGFkc3AgaXBjIGZ1bmN0aW9ucwotIHJlbmFtZSBhZHNwX21ib3hfY2hfaW5mbyB0byBtdGtf
YWRzcF9tYm94X2NoX2luZm8KLSByZW5hbWUgYWRzcF9tYm94X2NoYW5fb3BzIHRvIG10a19hZHNw
X21ib3hfY2hhbl9vcHMKLSByZW1vdmUgaW5jb3JyZWN0IHJldmlld2VycyBpbiBjb21taXQgbWVz
c2FnZQoKY2hhbmdlcyBzaW5jZSB2NjoKLSBkdC1iaW5kaW5nczogY2hhbmdlIGV4YW1wbGUgZHRz
aSBub2RlLgotIHJlbmFtZSBjb25maWcgTVRLX0FEU1BfSVBDX01CT1ggdG8gTVRLX0FEU1BfTUJP
WAotIHJlbW92ZSB1bnVzZWQgdmFyaWFibGUKLSBhZGQgcmV2aWV3ZXJzCgpjaGFuZ2VzIHNpbmNl
IHY1OgotIHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCgpjaGFuZ2VzIHNpbmNlIHY0OgotIHVz
ZSBzd2l0Y2ggLi4uIGNhc2UgaW4gYWRzcF9pcGNfcmVjdgotIGFkZCBlcnJvciBoYW5kbGluZyBw
YXRoIGZvciBjaGFuX25hbWUgcG9pbnRlcgotIHJlZmluZSBzb21lIGNvZGUgdG8gYmUgY29uY2lz
ZQoKY2hhbmdlcyBzaW5jZSB2MzoKLSByZW9yZGVyIE1US19BRFNQX0lQQ19NQk9YIGNvbmZpZwot
IHJlbW92ZSBzb21lIHJlZHVuZGFudCBjb2RlCi0gcmVtb3ZlIGxvY2sgaW4gbXRrLWFkc3AtbWFp
bGJveAoKY2hhbmdlcyBzaW5jZSB2MjoKLSBzZXBhcmF0ZSBhZHNwX21haWxib3ggaW50byB0d28g
aW5zdGFuY2VzCgpjaGFuZ2VzIHNpbmNlIHYxOgotIGZpeCBkdF9iaW5kaW5nX2NoZWNrIGVycm9y
CgoKQWxsZW4tS0ggQ2hlbmcgKDMpOgogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIGFkc3At
bWJveCBkb2N1bWVudAogIGZpcm13YXJlOiBtZWRpYXRlazogYWRkIGFkc3AgaXBjIHByb3RvY29s
IGludGVyZmFjZQogIG1haWxib3g6IG1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3IgYWRzcCBtYWls
Ym94IGNvbnRyb2xsZXIKCiAuLi4vYmluZGluZ3MvbWFpbGJveC9tdGssYWRzcC1tYm94LnlhbWwg
ICAgICAgfCAgNTIgKysrKysrCiBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAg
ICAgICB8ICAgOSArCiBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAg
ICAgfCAgIDIgKwogZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9tdGstYWRzcC1pcGMuYyAgICAg
IHwgMTM1ICsrKysrKysrKysrKysrCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMgICAg
ICAgICAgICB8IDE3NiArKysrKysrKysrKysrKysrKysKIC4uLi9saW51eC9maXJtd2FyZS9tZWRp
YXRlay9tdGstYWRzcC1pcGMuaCAgICB8ICA2NSArKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCA0
NTAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tYWlsYm94L210ayxhZHNwLW1ib3gueWFtbAogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL210ay1hZHNwLWlwYy5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9tYWlsYm94L210ay1hZHNwLW1haWxib3guYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmgKCi0tIAoyLjE4
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
