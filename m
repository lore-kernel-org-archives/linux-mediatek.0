Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ED7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p0QnEflXNhOG4L+AMxKOnfB/Mk3AwxWvvphGyX/Gi9M=; b=vK31vxliYUjJtA
	bCz/j1xp5VHxe3EdDMUrmlkV+vHlikj6A0j2FHnT+mvMhwJV+jztzMOPD1ES0CtE0rKW0fxR7zP1m
	ICB5rXoaCsadM76BSE2G8vqpoHZhoENVIJiRTtJJjtzRifI0WVM084AZDXfdZwvmVp4npQavpa3In
	rdIkA8nF/Qd66/ki6hMpT1r3Y+l5noy4vt5EQdis/TX7ANbh5rtPSojrLijbcDXfxYvcm0ri6D9Pw
	OMVf1i1f0jQHxkp43K0HDvweaytHgEApzDEnSQNYoQo4YAOcMJvoa+1jz257fT01EADSYMH5fOCQd
	BtIelQl6PDKKp1haSuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqVYI-009QMI-PK; Fri, 26 Nov 2021 07:21:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqVY5-009QKB-O0; Fri, 26 Nov 2021 07:21:34 +0000
X-UUID: cf068f9754af41dba1df8f4c2196472c-20211126
X-UUID: cf068f9754af41dba1df8f4c2196472c-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 179675663; Fri, 26 Nov 2021 00:21:29 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 23:14:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 26 Nov 2021 15:14:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Nov 2021 15:14:34 +0800
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
Subject: [PATCH v5 0/3] This patches provide ADSP IPC support for MT8195
Date: Fri, 26 Nov 2021 15:14:29 +0800
Message-ID: <20211126071432.21990-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_232133_798664_22EE018E 
X-CRM114-Status: GOOD (  11.28  )
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
Y2hhbmdlcyBzaW5jZSB2NDoKLSB1c2Ugc3dpdGNoIC4uLiBjYXNlIGluIGFkc3BfaXBjX3JlY3YK
LSBhZGQgZXJyb3IgaGFuZGxpbmcgcGF0aCBmb3IgY2hhbl9uYW1lIHBvaW50ZXIKLSByZWZpbmUg
c29tZSBjb2RlIHRvIGJlIGNvbmNpc2UKCgpjaGFuZ2VzIHNpbmNlIHYzOgotIHJlb3JkZXIgTVRL
X0FEU1BfSVBDX01CT1ggY29uZmlnCi0gcmVtb3ZlIHNvbWUgcmVkdW5kYW50IGNvZGUKLSByZW1v
dmUgbG9jayBpbiBtdGstYWRzcC1tYWlsYm94CgpjaGFuZ2VzIHNpbmNlIHYyOgotIHNlcGFyYXRl
IGFkc3BfbWFpbGJveCBpbnRvIHR3byBpbnN0YW5jZXMKCmNoYW5nZXMgc2luY2UgdjE6Ci0gZml4
IGR0X2JpbmRpbmdfY2hlY2sgZXJyb3IKCgpBbGxlbi1LSCBDaGVuZyAoMyk6CiAgZHQtYmluZGlu
Z3M6IG1lZGlhdGVrOiBhZGQgYWRzcC1tYm94IGRvY3VtZW50CiAgZmlybXdhcmU6IG1lZGlhdGVr
OiBhZGQgYWRzcCBpcGMgcHJvdG9jb2wgaW50ZXJmYWNlCiAgbWFpbGJveDogbWVkaWF0ZWs6IGFk
ZCBzdXBwb3J0IGZvciBhZHNwIG1haWxib3ggY29udHJvbGxlcgoKIC4uLi9iaW5kaW5ncy9tYWls
Ym94L210ayxhZHNwLW1ib3gueWFtbCAgICAgICB8ICA1MiArKysrKwogZHJpdmVycy9maXJtd2Fy
ZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZmlybXdhcmUv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2Zpcm13YXJlL21l
ZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy9maXJtd2FyZS9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0
ZWsvbXRrLWFkc3AtaXBjLmMgICAgICB8IDEzOCArKysrKysrKysrKysrKwogZHJpdmVycy9tYWls
Ym94L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvbWFpbGJv
eC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL21haWxib3gv
bXRrLWFkc3AtbWFpbGJveC5jICAgICAgICAgICAgfCAxNzggKysrKysrKysrKysrKysrKysrCiAu
Li4vbGludXgvZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmggICAgfCAgNzAgKysrKysr
KwogMTAgZmlsZXMgY2hhbmdlZCwgNDYwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tdGssYWRzcC1tYm94
LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL0tjb25m
aWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL01ha2VmaWxl
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9tdGstYWRzcC1p
cGMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lZGlhdGVrL210
ay1hZHNwLWlwYy5oCgotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
