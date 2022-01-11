Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228A7C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 07:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EORZ+UoNRo27M1z+rTaGag0MR1MXKI8D7NMEFR6ZjrM=; b=bwlhKzq5Pof1Q8
	rnLbnu9wd4aDteSC87xl8wWx4RIw52JKANyHFLjoz7WYgYIrP4h8YgLUx+bWMKS0myu2E/nhAGTjx
	dBDXhzkNF3000L7QjOmpRQ441uP6yKZCf1it5VzzQJbdqDTyaMXkfDDBoIM3zS6z2gO6edQ6Y/fP9
	pm3YraYZ9rYPvd3I3nrFEFlWq8cDuMgzhGVceMW0o6FckdXpmFITm+hqwKnQZWOA/2f/OJX4sA4aX
	9/9Jn9bOMJS26658vOv2RnOUrrei0Qy8h/dbswBg//ihFJIayTRy17rH4L8jcV5kfHoTZ1yEc2N/A
	Jm38SYl8BpV5eXWiIb7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Blu-00F8PZ-5x; Tue, 11 Jan 2022 07:40:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Blh-00F8Lv-9m; Tue, 11 Jan 2022 07:40:34 +0000
X-UUID: a8b9e2d7bb9746149a5108a130b49275-20220111
X-UUID: a8b9e2d7bb9746149a5108a130b49275-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 173154384; Tue, 11 Jan 2022 00:40:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 23:40:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 15:40:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 11 Jan 2022 15:40:26 +0800
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
 <sound-open-firmware@alsa-project.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v11 0/2] This patches provide ADSP IPC support for MT8195
Date: Tue, 11 Jan 2022 15:40:23 +0800
Message-ID: <20220111074025.22633-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_234033_371758_3CB54576 
X-CRM114-Status: GOOD (  11.42  )
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
ZXMgc2luY2UgdjEwOgotIHNwbGl0IHVwIHY5IGludG8gdHdvIHNlcGFyYXRlIHN1Ym1pc3Npb25z
CiAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3Bh
dGNoLzIwMjIwMTExMDcxMDExLjU5NjQtMS1hbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20vCgpj
aGFuZ2VzIHNpbmNlIHY5OgotIHJlbmFtZSBhZHNwX21ib3hfY2hhbl9vcHMgdG8gbXRrX2Fkc3Bf
bWJveF9jaGFuX29wcwoKY2hhbmdlcyBzaW5jZSB2ODoKLSByZW1vdmUgc3RydWN0IGFkc3BfbWJv
eF9jaF9pbmZvCi0gYWRkIGdldF9tdGtfYWRzcF9tYm94X3ByaXYKLSB1c2UgbXRrX2Fkc3BfbWJv
eF9wcml2IHZhX21ib3hyZWcgYWRkcmVzcyBpbiBhZHNwIG1ib3ggZHJpdmVyCi0gYWRkIHN0cnVj
dCBtdGtfYWRzcF9tYm94X2NmZyBmb3IgRFNQIG1ib3ggcmVnaXN0ZXIgb2Zmc2V0Ci0gcmVtb3Zl
IGFkc3AgbWJveCByZWdpc3RlciBvZmZzZXQgaGFyZCBjb2RlIGRlZmluZQotIHJlbW92ZSBtdGst
YWRzcC1pcGMuaCByZWZlcmVuY2UgaW4gYWRzcCBtYm94IGRyaXZlcgoKY2hhbmdlcyBzaW5jZSB2
NzoKLSBhZGQgbXRrIHByZWZpeCBmb3IgYWRzcCBpcGMgZnVuY3Rpb25zCi0gcmVuYW1lIGFkc3Bf
bWJveF9jaF9pbmZvIHRvIG10a19hZHNwX21ib3hfY2hfaW5mbwotIHJlbW92ZSBpbmNvcnJlY3Qg
cmV2aWV3ZXJzIGluIGNvbW1pdCBtZXNzYWdlCgpjaGFuZ2VzIHNpbmNlIHY2OgotIGR0LWJpbmRp
bmdzOiBjaGFuZ2UgZXhhbXBsZSBkdHNpIG5vZGUuCi0gcmVuYW1lIGNvbmZpZyBNVEtfQURTUF9J
UENfTUJPWCB0byBNVEtfQURTUF9NQk9YCi0gcmVtb3ZlIHVudXNlZCB2YXJpYWJsZQotIGFkZCBy
ZXZpZXdlcnMKCmNoYW5nZXMgc2luY2UgdjU6Ci0gcmVtb3ZlIHNvbWUgcmVkdW5kYW50IGNvZGUK
CmNoYW5nZXMgc2luY2UgdjQ6Ci0gdXNlIHN3aXRjaCAuLi4gY2FzZSBpbiBhZHNwX2lwY19yZWN2
Ci0gYWRkIGVycm9yIGhhbmRsaW5nIHBhdGggZm9yIGNoYW5fbmFtZSBwb2ludGVyCi0gcmVmaW5l
IHNvbWUgY29kZSB0byBiZSBjb25jaXNlCgpjaGFuZ2VzIHNpbmNlIHYzOgotIHJlb3JkZXIgTVRL
X0FEU1BfSVBDX01CT1ggY29uZmlnCi0gcmVtb3ZlIHNvbWUgcmVkdW5kYW50IGNvZGUKLSByZW1v
dmUgbG9jayBpbiBtdGstYWRzcC1tYWlsYm94CgpjaGFuZ2VzIHNpbmNlIHYyOgotIHNlcGFyYXRl
IGFkc3BfbWFpbGJveCBpbnRvIHR3byBpbnN0YW5jZXMKCmNoYW5nZXMgc2luY2UgdjE6Ci0gZml4
IGR0X2JpbmRpbmdfY2hlY2sgZXJyb3IKCkFsbGVuLUtIIENoZW5nICgyKToKICBkdC1iaW5kaW5n
czogbWVkaWF0ZWs6IGFkZCBhZHNwLW1ib3ggZG9jdW1lbnQKICBtYWlsYm94OiBtZWRpYXRlazog
YWRkIHN1cHBvcnQgZm9yIGFkc3AgbWFpbGJveCBjb250cm9sbGVyCgogLi4uL2JpbmRpbmdzL21h
aWxib3gvbXRrLGFkc3AtbWJveC55YW1sICAgICAgIHwgIDUyICsrKysrKwogZHJpdmVycy9tYWls
Ym94L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvbWFpbGJv
eC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL21haWxib3gv
bXRrLWFkc3AtbWFpbGJveC5jICAgICAgICAgICAgfCAxNzYgKysrKysrKysrKysrKysrKysrCiA0
IGZpbGVzIGNoYW5nZWQsIDIzNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLGFkc3AtbWJveC55YW1s
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tYWlsYm94L210ay1hZHNwLW1haWxib3guYwoK
LS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
