Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4625C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i45Qdc0R+l95IuhPhFx3GbyOUcYWYeY2w8LCiHTvtQc=; b=Indpccxe4E1ccg
	qvY5TzwOcbr8b12hrSjAIkm/+d6t53EjEYS34H4ms5IgEhVRIE1Ha4KG8H/0VaGKDe4cLPw5PFrF3
	WfKanMJE8vOska+eAyvi51AY5MK1OjvIKgIJzsMb5vOCK6/Da5Qsjd7/YG6j9AN12Dy0wBag9NUy8
	8KGkSMTFVlI7+BN7cU6GYevHGrbWKC/xXH2Wz3hrcKbO0g1Lyd3+nzrpCx48ceDmzLUx9iLcrdtbP
	XF0e4euajOtPPUTLPNp0eAQHVHS2DreEjhvXTfDuYdpNfHjE/alAzWh/Zn33UKM//9pthyh/HPyo0
	yj/2MVeJtgXFqYXbjQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1q7W-00Glv2-Ki; Mon, 27 Dec 2021 13:32:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1q7K-00Glu8-26; Mon, 27 Dec 2021 13:32:48 +0000
X-UUID: 80a567bb3b704087b81d7afc010604f4-20211227
X-UUID: 80a567bb3b704087b81d7afc010604f4-20211227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 697017547; Mon, 27 Dec 2021 06:32:40 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Dec 2021 05:32:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 27 Dec 2021 21:32:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Dec 2021 21:32:23 +0800
From: qizhong cheng <qizhong.cheng@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <qizhong.cheng@mediatek.com>, <chuanjia.liu@mediatek.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v3] PCI: mediatek: Assert PERST# for 100ms for power and clock
 to stabilize
Date: Mon, 27 Dec 2021 21:31:10 +0800
Message-ID: <20211227133110.14500-1-qizhong.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_053246_132999_AC9146BE 
X-CRM114-Status: UNSURE (   7.68  )
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
w6FyIDxwYWxpQGtlcm5lbC5vcmc+Ci0tLQoKdjM6CiAtIENoYW5nZSBzdWJqZWN0LgoKdjI6CiAt
IFR5cG8gZml4LgogLSBSZXdyYXAgaW50byBvbmUgcGFyYWdyYXBoLgoKIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS1tZWRpYXRlay5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1l
ZGlhdGVrLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWsuYwppbmRleCAy
ZjNmOTc0OTc3YTMuLmIxODkzNWU4ZGE4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLW1lZGlhdGVrLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1l
ZGlhdGVrLmMKQEAgLTcwMiw2ICs3MDIsMTMgQEAgc3RhdGljIGludCBtdGtfcGNpZV9zdGFydHVw
X3BvcnRfdjIoc3RydWN0IG10a19wY2llX3BvcnQgKnBvcnQpCiAJICovCiAJd3JpdGVsKFBDSUVf
TElOS0RPV05fUlNUX0VOLCBwb3J0LT5iYXNlICsgUENJRV9SU1RfQ1RSTCk7CiAKKwkvKgorCSAq
IERlc2NyaWJlZCBpbiBQQ0llIENFTSBzcGVjaWZpY2F0aW9uIHNlY3Rpb25zIDIuMiAoUEVSU1Qj
IFNpZ25hbCkgYW5kCisJICogMi4yLjEgKEluaXRpYWwgUG93ZXItVXAgKEczIHRvIFMwKSkuIFRo
ZSBkZWFzc2VydGlvbiBvZiBQRVJTVCMgc2hvdWxkCisJICogYmUgZGVsYXllZCAxMDBtcyAoVFBW
UEVSTCkgZm9yIHRoZSBwb3dlciBhbmQgY2xvY2sgdG8gYmVjb21lIHN0YWJsZS4KKwkgKi8KKwlt
c2xlZXAoMTAwKTsKKwogCS8qIERlLWFzc2VydCBQSFksIFBFLCBQSVBFLCBNQUMgYW5kIGNvbmZp
Z3VyYXRpb24gcmVzZXQJKi8KIAl2YWwgPSByZWFkbChwb3J0LT5iYXNlICsgUENJRV9SU1RfQ1RS
TCk7CiAJdmFsIHw9IFBDSUVfUEhZX1JTVEIgfCBQQ0lFX1BFUlNUQiB8IFBDSUVfUElQRV9TUlNU
QiB8Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
