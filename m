Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ACAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 02:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxZFYRLy16GPp/YQqgl2KwmStNLbHGS9X2t26xq9iRo=; b=IGDWvrYDV3x4LJ
	2qd8KYV//U3uawxvGkJfTHqZ2itQvIoQbHNvNzUckEmgI31VpW+z0kfSFUBnJvAOyfEvoK7igLc/7
	4M4fLyJIrS2G82PINIQ6ZJ0CKbAzybbM5slNqGBzCa7sbgY+IZcAx6gaxRKYjSSdH0NYk4UZjDpiJ
	kArZU2GFpJTu2afHuLb2eomqP81kD2uiJnbjFT5sJq8jJ428rAoC8IXQyfW+KZO8YlC+SsmUZd+LO
	Qy7fYF9y5y8wFtl9+4ZTQhYOCVcIQW+e/zojs/FGOUD5a3BGePiIfbbmTdG8pYYjAyOeBz2Daxz4o
	R1hOCRDyZl+8PA/JCBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIM5l-005Y4f-8S; Fri, 11 Feb 2022 02:55:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIM5h-005Y4F-5F
 for linux-mediatek@lists.infradead.org; Fri, 11 Feb 2022 02:55:23 +0000
X-UUID: ea1ff2100ce54b3d8fa7e3a72148f13e-20220210
X-UUID: ea1ff2100ce54b3d8fa7e3a72148f13e-20220210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 15992697; Thu, 10 Feb 2022 19:55:17 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 18:55:15 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Feb 2022 10:55:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Feb 2022 10:55:01 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7615: fix compiler warning on frame size
Date: Fri, 11 Feb 2022 10:54:55 +0800
Message-ID: <c7c87a448a159a9836b6ac848eb92f6a367daf1a.1644547407.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_185521_212221_F37A6808 
X-CRM114-Status: GOOD (  11.58  )
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

RnJvbTogRGVyZW4gV3UgPGRlcmVuLnd1QG1lZGlhdGVrLmNvbT4KClRoZSBmb2xsb3dpbmcgZXJy
b3IgaXMgc2VlIGZyb20gdGhlIGNvbXBpbGVyOgoKICBtdDc2MTUvZGVidWdmcy5jOiBJbiBmdW5j
dGlvbiDigJhtdDc2MTVfZXh0X21hY19hZGRyX3JlYWTigJk6CiAgbXQ3NjE1L2RlYnVnZnMuYzo0
NjU6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTA3MiBieXRlcyBpcwogICAgbGFyZ2Vy
IHRoYW4gMTAyNCBieXRlcyBbLVdmcmFtZS1sYXJnZXItdGhhbj1dCgpUaGUgaXNzdWUgaXMgZHVl
IHRvIGFsbG9jYXRpbmcgYSBidWZmZXIgYXMgc3RyaW5nIHN0b3JhZ2UuCgpGaXggYnkgY29udmVy
dGluZyB0byBhIGR5bmFtaWNhbCBhbGxvY2F0aW9uIG9mIHRoZSBidWZmZXIuCgpSZXZpZXdlZC1i
eTogUnlkZXIgTGVlIDxyeWRlci5sZWVAbWVkaWF0ZWsuY29tPgpTaWduZWQtb2ZmLWJ5OiBEZXJl
biBXdSA8ZGVyZW4ud3VAbWVkaWF0ZWsuY29tPgotLS0KIC4uLi9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3Ni9tdDc2MTUvZGVidWdmcy5jICAgIHwgMTQgKysrKysrKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NjE1L2RlYnVnZnMuYyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NjE1L2RlYnVnZnMuYwppbmRleCBjYTdl
ZmNhMTU0M2YuLjI1MGZhYTg3MGRiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
bWVkaWF0ZWsvbXQ3Ni9tdDc2MTUvZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L21lZGlhdGVrL210NzYvbXQ3NjE1L2RlYnVnZnMuYwpAQCAtNDQzLDExICs0NDMsMTYgQEAgbXQ3
NjE1X2V4dF9tYWNfYWRkcl9yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlciAqdXNl
cmJ1ZiwKIAkJCSBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykKIHsKIAlzdHJ1Y3QgbXQ3NjE1
X2RldiAqZGV2ID0gZmlsZS0+cHJpdmF0ZV9kYXRhOwotCWNoYXIgYnVmWzMyICogKChFVEhfQUxF
TiAqIDMpICsgNCkgKyAxXTsKKwljaGFyICpidWY7CisJc3RhdGljIHUzMiBsZW4gPSAzMiAqICgo
RVRIX0FMRU4gKiAzKSArIDQpICsgMTsKIAl1OCBhZGRyW0VUSF9BTEVOXTsKIAlpbnQgb2ZzID0g
MDsKIAlpbnQgaTsKIAorCWJ1ZiA9IGt6YWxsb2MobGVuLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWJ1
ZikKKwkJcmV0dXJuIC1FTk9NRU07CisKIAlmb3IgKGkgPSAwOyBpIDwgMzI7IGkrKykgewogCQlp
ZiAoIShkZXYtPm11YXJfbWFzayAmIEJJVChpKSkpCiAJCQljb250aW51ZTsKQEAgLTQ1OCwxMCAr
NDYzLDEzIEBAIG10NzYxNV9leHRfbWFjX2FkZHJfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgY2hh
ciBfX3VzZXIgKnVzZXJidWYsCiAJCXB1dF91bmFsaWduZWRfbGUzMihtdDc2X3JyKGRldiwgTVRf
V0ZfUk1BQ19NQVIwKSwgYWRkcik7CiAJCXB1dF91bmFsaWduZWRfbGUxNigobXQ3Nl9ycihkZXYs
IE1UX1dGX1JNQUNfTUFSMSkgJgogCQkJCSAgICBNVF9XRl9STUFDX01BUjFfQUREUiksIGFkZHIg
KyA0KTsKLQkJb2ZzICs9IHNucHJpbnRmKGJ1ZiArIG9mcywgc2l6ZW9mKGJ1ZikgLSBvZnMsICIl
ZD0lcE1cbiIsIGksIGFkZHIpOworCQlvZnMgKz0gc25wcmludGYoYnVmICsgb2ZzLCBsZW4gLSBv
ZnMsICIlZD0lcE1cbiIsIGksIGFkZHIpOwogCX0KIAotCXJldHVybiBzaW1wbGVfcmVhZF9mcm9t
X2J1ZmZlcih1c2VyYnVmLCBjb3VudCwgcHBvcywgYnVmLCBvZnMpOworCW9mcyA9IHNpbXBsZV9y
ZWFkX2Zyb21fYnVmZmVyKHVzZXJidWYsIGNvdW50LCBwcG9zLCBidWYsIG9mcyk7CisKKwlrZnJl
ZShidWYpOworCXJldHVybiBvZnM7CiB9CiAKIHN0YXRpYyBzc2l6ZV90Ci0tIAoyLjE4LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
