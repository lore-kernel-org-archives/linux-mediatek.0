Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E99C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24EB822265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cxvfKFAX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6Jv+7mH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24EB822265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mz5480bA0ciwlLQG8kn3eT6+lG1YXdtoBsAEVs9EVD0=; b=cxvfKFAX4fi2xJyyDLfokPxH3
	cMFEDP+cEPn8yrXuTervzi8Qls/iBaUJa42sr8oWkk5EiMw5dvUJHg8b6KdI30yYwpCDeX2rQC+iY
	BO7y8RvI9zOJqty7+VSiFcwxryHFd9DAloALpYqeiLt4fEUcTq3eYLrkLGc3k4VCEYcGn1QPq34/D
	vlvgpmbZKWBPIm6m2MIcvTqWFq8AhqC+5jRWCUjNRY/BTiFGGHkkpbSBWe0381HwiGT800g37i9Hi
	C/i7P7EuobSd36TJld7m0fpG/+HnMY86X0Vi8oB6kgk9zSZFkP/g1bu97hdJOA/O4rxxA5IEdyzk2
	RM/6e/XUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiYt-0005tZ-3V; Mon, 16 Nov 2020 17:45:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVV-00044q-Iq
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 17:41:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id 10so49235wml.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 09:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
 b=k6Jv+7mHwhLKPJA/QCG06ugtxDKWpQTKy+20nzwFKSS58MARf4S8W8ACDDJb9At+kN
 Zj7BRm0cL5pJuZG03JgKNEOyxkFzKQDZEoeq6JKwur3GNW3waj1+cD/cATWqphXb/N3E
 Hwel7NdYgPQ30GBKTzLyGySsqlcZlYoScXIJf5HNpiV7Q9NiuYvKyh5I1UrBg1kr6UbV
 iCLuVTvJ0zQs9VHfs2J9H/qqPEg7slFJP5MGKs7bVItDI9ChEjoM5eM4spQGw5YLHt1S
 zBTagqyBF4NDMKbJ0sdlBYLtRa1aopP+KNyfSJbABRD/2iFY3eTiXtqFZBU8xFpxWZ8o
 d/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
 b=cpQnKAsHx298Em6pfFwxKBbdIxOY4T26rhI27teCd/fJvZlxVZhFL7BqAvoNhZ8m+Y
 NxTW/iuchwhvQhLXby8cjxg+iTjAwrOOtdWram6Y5pxx5N/yVOGhLeTqkliQGbsGFqXH
 5FuecqQhTAaa0e9A5lk2BPv0I1Mm6Cl3jFS/LG5pqcIW8MnAT97qrm2aMCbCGUyf6ck7
 leeMoIpMuWPKvwTksfSxP3t4TWCGeSHyCK8T9xQ0E65sXOkJhA+/nYKGtDt8yeoLk0pC
 dHR3KPyqAmcS69K6HQe8rOv1dszPDQJaQodlw2sU025cU+Rk+yCp6x+G5HBMdJNQAOA2
 eqZQ==
X-Gm-Message-State: AOAM532rN0HCMobis0u5cWO+XLXBxj0z8bovU8AHU4HPrBuLrYwoyDyO
 /R4jwN3Otk0cDEdUX8iM2y2mtw==
X-Google-Smtp-Source: ABdhPJzqHnsBJooc4S8laQMeNPmpnnuKV6rHd3UhDvssbsZxsM79tG8D8ZiF2nH5S1+VMw/gXxelZg==
X-Received: by 2002:a1c:5f83:: with SMTP id t125mr30364wmb.82.1605548495973;
 Mon, 16 Nov 2020 09:41:35 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/42] drm/mediatek/mtk_drm_drv: Staticise local function
 invoked by reference
Date: Mon, 16 Nov 2020 17:40:42 +0000
Message-Id: <20201116174112.1833368-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124138_172175_F5389C15 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmM6MzE2OjI0OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmG10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydOKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCgpDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KQ2M6IFN1
bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IFlUIFNIRU4gPHl0LnNoZW5AbWVkaWF0
ZWsuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1z
aWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKaW5kZXggMmU4MDY1YjFlMmJiYy4u
NDAxMzExNDUzZTdkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKQEAg
LTMxMyw4ICszMTMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBtdGtf
ZHJtX2ZvcHMgPSB7CiAgKiBXZSBuZWVkIHRvIG92ZXJyaWRlIHRoaXMgYmVjYXVzZSB0aGUgZGV2
aWNlIHVzZWQgdG8gaW1wb3J0IHRoZSBtZW1vcnkgaXMKICAqIG5vdCBkZXYtPmRldiwgYXMgZHJt
X2dlbV9wcmltZV9pbXBvcnQoKSBleHBlY3RzLgogICovCi1zdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotCQkJCQkJ
c3RydWN0IGRtYV9idWYgKmRtYV9idWYpCitzdGF0aWMgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpt
dGtfZHJtX2dlbV9wcmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKKwkJCQkJCSAg
ICAgICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKIHsKIAlzdHJ1Y3QgbXRrX2RybV9wcml2YXRl
ICpwcml2YXRlID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
