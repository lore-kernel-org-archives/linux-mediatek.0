Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E940C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:22:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E41C223BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b2RVlVOj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cViIjeTF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E41C223BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tp66s/TbX4T4JJVQxZ3DRvdThSpVsW6hw1pqZX6N8I4=; b=b2RVlVOj1te7ZeIQg20x8gAoX
	MYUnL8qc3fXT1teasesoON+BD+q7Ed8aMyGVPhOGZySXFHBvxyY0FWdLVjfGErlh3azFfYSpcRLqt
	VBraGBlwtgYwUHStFie/Z62/K4+bjM+D+nRF7B78HfBfrTQeZ531iQ9WxK1CSu8I4pn61WBZuSq0P
	KnPDBiizJOlb2mA9DpTo2f3HhU6iqdp7GeZupkVG15e9ryIbhyKiqnW7CWZ5Uw/9QPPStlbIbbM8o
	JaJKyq7wwGboen2uIN3vz61ZXGFVZdhL++Yr2XbRFYDnzKmdDYOle7u7JXRtBKofghlesU3z23N5S
	u39XWb23g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg9At-0008GN-MJ; Fri, 20 Nov 2020 16:22:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg9Am-0008E9-EE; Fri, 20 Nov 2020 16:22:09 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 942EF223BE;
 Fri, 20 Nov 2020 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889327;
 bh=6qUhf2df6YHu083uuIrpaf14GKeZQqyELwqjl3Hr81k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cViIjeTFMJYkCOMT/xAcPv2RziinrswH6Rhfugqj0huDiZaU3Fz49Xds9xB19xHIK
 fNbEeufSRsMSzs3L2IMCj5Fb6znhuRn0n/xNTSAOnXAKHtTiKg7CBqTLaN1mEcZBvS
 B0gde80tQCWJMmAbtXzOR6RTV7vYNRSZ6F4/S7Zc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 10/16] mfd: mt6397: drop of_match_ptr from of_device_id table
Date: Fri, 20 Nov 2020 17:21:27 +0100
Message-Id: <20201120162133.472938-10-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120162133.472938-1-krzk@kernel.org>
References: <20201120162133.472938-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_112208_627295_2D6B7441 
X-CRM114-Status: GOOD (  17.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLiAgVGhpcyBmaXhlcwpjb21waWxlIHdh
cm5pbmcgKCFDT05GSUdfT0Ygb24geDg2XzY0KToKCiAgZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUu
YzoyMTQ6MzQ6IHdhcm5pbmc6IOKAmG10NjM5N19vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvbWZkL210NjM5Ny1jb3Jl
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzOTctY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2
Mzk3LWNvcmUuYwppbmRleCBmNmNkOGE2NjA2MDIuLjc1MThkNzRjM2I0YyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYworKysgYi9kcml2ZXJzL21mZC9tdDYzOTctY29yZS5j
CkBAIC0yMzcsNyArMjM3LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXQ2Mzk3
X2RyaXZlciA9IHsKIAkucHJvYmUgPSBtdDYzOTdfcHJvYmUsCiAJLmRyaXZlciA9IHsKIAkJLm5h
bWUgPSAibXQ2Mzk3IiwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG10NjM5N19v
Zl9tYXRjaCksCisJCS5vZl9tYXRjaF90YWJsZSA9IG10NjM5N19vZl9tYXRjaCwKIAl9LAogCS5p
ZF90YWJsZSA9IG10NjM5N19pZCwKIH07Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
