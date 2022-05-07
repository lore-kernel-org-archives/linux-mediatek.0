Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CEEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KQN7JSnc3YcjKfEMF61n+I6+GdNsxdgSnpQ/OCX0QsQ=; b=PmQ18YGE3ba8xS
	0rrzFyvrc0Hzq/JHfYeP4Pa235ljSDJchapFj05RyMTuZVwKGyVK9IwJ7/cypFGwRPbmhdZdiItDW
	QmOU9f4d0wXRCFCdCbyyT7gZnYc5ot9NBXJnRpoX7bL8qa+Y3Vk8/nznt0/+kYaiDQHYx/B72VTFY
	iY4X2YRAv3NazWM2oU1wWK+cF+JyM+prc+ekS2gGDwKIhH/MLBvGtuabV0XawOSJaYGZxUJyYT5M1
	dBjO/TvBM91S/7qQzFEChDZvy2tG8F3cX2AUgKWcpOvsyFzr4Z83eFsHxAPUzJmTHyffYTLeWMGDR
	j/Tm+O9n66y5WnFI5AIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnG2j-006WlS-Vt; Sat, 07 May 2022 08:44:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnG2b-006Wib-0K
 for linux-mediatek@lists.infradead.org; Sat, 07 May 2022 08:43:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nnG2W-0003ZA-VT; Sat, 07 May 2022 10:43:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nnG2W-000rna-UN; Sat, 07 May 2022 10:43:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nnG2U-00885o-Rb; Sat, 07 May 2022 10:43:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] pwm: mediatek: Implement .apply() callback
Date: Sat,  7 May 2022 10:43:37 +0200
Message-Id: <20220507084337.167890-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; h=from:subject;
 bh=1KW6ty6GQ2hPJLt+FmKcTNmj+Zi8+DqoBiVLGQsCtaQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBidjE1BE8QaAG8kut8vuwP3pNWJ+MbI0NoKyRVRwrT
 LZ5Sk6WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYnYxNQAKCRDB/BR4rcrsCYnLB/
 0XT4bvhgerT8ZpBENu+CGRC0wyQ+GST9QmS1RA5dA1PSPitenhwiNFwL1Rem7vYeIvWjGlHcyZGHPo
 DGqv9AWug1qGxkwfMxeqvS7xIQSw4GLpchoUPsTyXybkc1cR95A88G0gq6dRRhOBOljAY5sfrRuE0I
 2C2BVUUziHMnlSXvk1EsvJydBAstYrb8s2Bh6OOxvDAXaqVCW1CuVCtss5ICgRaz2Vzlt2n+qo/8TS
 Aoj0U69s/WVdkNCyWb4vVqRBc6nh4unYb8cDzecKToI2/jCZvC4m9yAB6u20XmIFMI9rHq3t8+Zjak
 xTjBBVwblUZzAx6cY7FUhH5i7rUB/l
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_014353_049925_5A58F399 
X-CRM114-Status: GOOD (  14.08  )
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

VG8gZXZlbnR1YWxseSBnZXQgcmlkIG9mIGFsbCBsZWdhY3kgZHJpdmVycyBjb252ZXJ0IHRoaXMg
ZHJpdmVyIHRvIHRoZQptb2Rlcm4gd29ybGQgaW1wbGVtZW50aW5nIC5hcHBseSgpLgpUaGlzIGp1
c3QgcHVzaGVkIGEgdmFyaWFudCBvZiBwd21fYXBwbHlfbGVnYWN5KCkgaW50byB0aGUgZHJpdmVy
IHRoYXQgd2FzCnNsaWdodGx5IHNpbXBsaWZpZWQgYmVjYXVzZSB0aGUgZHJpdmVyIGRvZXNuJ3Qg
cHJvdmlkZSBhIC5zZXRfcG9sYXJpdHkoKQpjYWxsYmFjay4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9wd20vcHdtLW1lZGlhdGVrLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wd20vcHdtLW1lZGlhdGVrLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVkaWF0
ZWsuYwppbmRleCA1NjhiMTNhNDg3MTcuLmUyNjRiYjc0ZmRkZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wd20vcHdtLW1lZGlhdGVrLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLW1lZGlhdGVrLmMKQEAg
LTE5OCwxMCArMTk4LDMzIEBAIHN0YXRpYyB2b2lkIHB3bV9tZWRpYXRla19kaXNhYmxlKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIAlwd21fbWVkaWF0ZWtf
Y2xrX2Rpc2FibGUoY2hpcCwgcHdtKTsKIH0KIAorc3RhdGljIGludCBwd21fbWVkaWF0ZWtfYXBw
bHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAorCQkJICAg
ICAgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCit7CisJaW50IGVycjsKKworCWlmIChz
dGF0ZS0+cG9sYXJpdHkgIT0gUFdNX1BPTEFSSVRZX05PUk1BTCkKKwkJcmV0dXJuIC1FSU5WQUw7
CisKKwlpZiAoIXN0YXRlLT5lbmFibGVkKSB7CisJCWlmIChwd20tPnN0YXRlLmVuYWJsZWQpCisJ
CQlwd21fbWVkaWF0ZWtfZGlzYWJsZShjaGlwLCBwd20pOworCisJCXJldHVybiAwOworCX0KKwor
CWVyciA9IHB3bV9tZWRpYXRla19jb25maWcocHdtLT5jaGlwLCBwd20sIHN0YXRlLT5kdXR5X2N5
Y2xlLCBzdGF0ZS0+cGVyaW9kKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOworCisJaWYgKCFw
d20tPnN0YXRlLmVuYWJsZWQpCisJCWVyciA9IHB3bV9tZWRpYXRla19lbmFibGUoY2hpcCwgcHdt
KTsKKworCXJldHVybiBlcnI7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHdtX29wcyBwd21f
bWVkaWF0ZWtfb3BzID0gewotCS5jb25maWcgPSBwd21fbWVkaWF0ZWtfY29uZmlnLAotCS5lbmFi
bGUgPSBwd21fbWVkaWF0ZWtfZW5hYmxlLAotCS5kaXNhYmxlID0gcHdtX21lZGlhdGVrX2Rpc2Fi
bGUsCisJLmFwcGx5ID0gcHdtX21lZGlhdGVrX2FwcGx5LAogCS5vd25lciA9IFRISVNfTU9EVUxF
LAogfTsKIAoKYmFzZS1jb21taXQ6IDJiZjhlZTBmYWE5ODhiNWNlYzM1MDNlYmYyZjk3MGEwZTg0
ZDI0ZWUKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
