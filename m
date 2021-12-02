Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FD1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LIbJqyjZC5fRzEwZWZBvhFyjWtMg5kO7lLlKvqrdaBE=; b=tTPR/CYoxzj4jn
	A8bCNj+ly3Osc4yRD9YBzS2O6tO2hqDiiUqOGWuPHjM4ZWuYQUv7qI+5PwHlkTDRB7i7RP3OQLhDP
	k13XND4/njXOmLjTvJA3IRUZWRhcHYOOYqhTmUlYyEI3oqxeb2sbJTmjzkuOQLutc20km0nm66LGp
	+vh8Hl46MCzsbvkwxC3Js5NxsiD3iArVJ0bhRN0PQ1yToW4sFNqen9dDAmUtZ8jZIeyCF62KKZ5Ml
	0DUGLqqvaxQZuxhAkjaDSSy9jrewspJvw6Hcqk5G+3MiFSkx2gynSbsyN+i9vj6EFGE7U7hgbXIlI
	ed+TKZC1n5OpiiiOI3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mskda-00C3rB-An; Thu, 02 Dec 2021 11:52:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mskd5-00C3eK-06; Thu, 02 Dec 2021 11:52:00 +0000
X-UUID: f4f7de1430834348ae6f52074e56a6c1-20211202
X-UUID: f4f7de1430834348ae6f52074e56a6c1-20211202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1163657778; Thu, 02 Dec 2021 04:51:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 03:42:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Dec 2021 19:42:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 19:42:42 +0800
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
Subject: [PATCH v10 0/3] This patches provide ADSP IPC support for MT8195
Date: Thu, 2 Dec 2021 19:42:37 +0800
Message-ID: <20211202114240.26976-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_035159_069974_ABB3CB91 
X-CRM114-Status: GOOD (  11.82  )
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
YmluZGluZ19jaGVjayBlcnJvcgoKCkFsbGVuLUtIIENoZW5nICgzKToKICBkdC1iaW5kaW5nczog
bWVkaWF0ZWs6IGFkZCBhZHNwLW1ib3ggZG9jdW1lbnQKICBmaXJtd2FyZTogbWVkaWF0ZWs6IGFk
ZCBhZHNwIGlwYyBwcm90b2NvbCBpbnRlcmZhY2UKICBtYWlsYm94OiBtZWRpYXRlazogYWRkIHN1
cHBvcnQgZm9yIGFkc3AgbWFpbGJveCBjb250cm9sbGVyCgogLi4uL2JpbmRpbmdzL21haWxib3gv
bXRrLGFkc3AtbWJveC55YW1sICAgICAgIHwgIDUyICsrKysrKwogZHJpdmVycy9maXJtd2FyZS9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZmlybXdhcmUvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2Zpcm13YXJlL21lZGlh
dGVrL0tjb25maWcgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy9maXJtd2FyZS9tZWRpYXRl
ay9NYWtlZmlsZSAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsv
bXRrLWFkc3AtaXBjLmMgICAgICB8IDEzNSArKysrKysrKysrKysrKwogZHJpdmVycy9tYWlsYm94
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvbWFpbGJveC9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL21haWxib3gvbXRr
LWFkc3AtbWFpbGJveC5jICAgICAgICAgICAgfCAxNzYgKysrKysrKysrKysrKysrKysrCiAuLi4v
bGludXgvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmggICAgfCAgNjUgKysrKysrKwog
MTAgZmlsZXMgY2hhbmdlZCwgNDUwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tdGssYWRzcC1tYm94Lnlh
bWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL0tjb25maWcK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL01ha2VmaWxlCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9tdGstYWRzcC1pcGMu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lZGlhdGVrL210ay1h
ZHNwLWlwYy5oCgotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
