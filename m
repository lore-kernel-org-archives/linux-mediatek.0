Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A73C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7WxMdRQmBxtEnrk+1tBYegwGnUXMQpzCWjycVV/QDfE=; b=nCJUQaE9R/F4MK
	IIWahJk45EK1KFFUShLZqgA1rjebAOWs2jNwyqBs0GTsPvJgzKzS3ogOXujuSy4A8vPqJL/K3etW7
	jLRElyexNHMuEdGDIaZNpRrQGW6iPbalu6aQMfmR+BmaJcStqdbbwcCqRessRKIj4N04mJ5DSl/kL
	BbmIhCwFBkrZSW2YCnTCCd1TJlkK0mcIwDWYK8PZAZ+7cb5H4BisRbDoWputepWlD/SN6yVVez2LV
	VfGMAwkeqALb6RjQan7fl3i/sL4w/1KcszTEeEHpLdg/SE6eyxI3ZC3G4DkBl4taYaRdkVjYF/nz4
	b8GM8IaVygG6VtPIhlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWQr-007hZy-Jy; Tue, 07 Dec 2021 09:06:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muWCy-007dB7-MK; Tue, 07 Dec 2021 08:52:22 +0000
X-UUID: d8d1b84f2472484080f350e61544d85f-20211207
X-UUID: d8d1b84f2472484080f350e61544d85f-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 919865572; Tue, 07 Dec 2021 01:52:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 00:42:12 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 16:42:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 7 Dec 2021 16:42:10 +0800
From: qizhong cheng <qizhong.cheng@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <qizhong.cheng@mediatek.com>, <chuanjia.liu@mediatek.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [RESEND PATCH v2] PCI: mediatek: Delay 100ms to wait power and clock
 to become stable
Date: Tue, 7 Dec 2021 16:41:53 +0800
Message-ID: <20211207084153.23019-1-qizhong.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_005220_775136_31CAD89F 
X-CRM114-Status: UNSURE (   7.49  )
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

RGVzY3JpYmVkIGluIFBDSWUgQ0VNIHNwZWNpZmljYXRpb24gc2VjdGlvbnMgMi4yIChQRVJTVCMg
U2lnbmFsKSBhbmQKMi4yLjEgKEluaXRpYWwgUG93ZXItVXAgKEczIHRvIFMwKSkuIFRoZSBkZWFz
c2VydGlvbiBvZiBQRVJTVCMgc2hvdWxkCmJlIGRlbGF5ZWQgMTAwbXMgKFRQVlBFUkwpIGZvciB0
aGUgcG93ZXIgYW5kIGNsb2NrIHRvIGJlY29tZSBzdGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBxaXpo
b25nIGNoZW5nIDxxaXpob25nLmNoZW5nQG1lZGlhdGVrLmNvbT4KQWNrZWQtYnk6IFBhbGkgUm9o
w6FyIDxwYWxpQGtlcm5lbC5vcmc+Ci0tLQoKdjI6CiAtIFR5cG8gZml4LgogLSBSZXdyYXAgaW50
byBvbmUgcGFyYWdyYXBoLgoKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5j
IHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMgYi9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaWUtbWVkaWF0ZWsuYwppbmRleCAyZjNmOTc0OTc3YTMuLmE2MWVhMzk0MDQ3
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMKKysr
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMKQEAgLTcwMiw2ICs3MDIs
MTMgQEAgc3RhdGljIGludCBtdGtfcGNpZV9zdGFydHVwX3BvcnRfdjIoc3RydWN0IG10a19wY2ll
X3BvcnQgKnBvcnQpCiAJICovCiAJd3JpdGVsKFBDSUVfTElOS0RPV05fUlNUX0VOLCBwb3J0LT5i
YXNlICsgUENJRV9SU1RfQ1RSTCk7CiAKKwkvKgorCSAqIERlc2NyaWJlZCBpbiBQQ0llIENFTSBz
cGVjaWZpY2F0aW9uIHNlY3Rpb25zIDIuMiAoUEVSU1QjIFNpZ25hbCkgYW5kCisJICogMi4yLjEg
KEluaXRpYWwgUG93ZXItVXAgKEczIHRvIFMwKSkuIFRoZSBkZWFzc2VydGlvbiBvZiBQRVJTVCMg
c2hvdWxkCisJICogYmUgZGVsYXllZCAxMDBtcyAoVFBWUEVSTCkgZm9yIHRoZSBwb3dlciBhbmQg
Y2xvY2sgdG8gYmVjb21lIHN0YWJsZS4KKwkgKi8KKwltc2xlZXAoMTAwKTsKKwogCS8qIERlLWFz
c2VydCBQSFksIFBFLCBQSVBFLCBNQUMgYW5kIGNvbmZpZ3VyYXRpb24gcmVzZXQJKi8KIAl2YWwg
PSByZWFkbChwb3J0LT5iYXNlICsgUENJRV9SU1RfQ1RSTCk7CiAJdmFsIHw9IFBDSUVfUEhZX1JT
VEIgfCBQQ0lFX1BFUlNUQiB8IFBDSUVfUElQRV9TUlNUQiB8Ci0tIAoyLjI1LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
