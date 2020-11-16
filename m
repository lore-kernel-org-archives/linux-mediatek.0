Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DF4C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:43:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38B320B80
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFRF7dG0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNwXbsPl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38B320B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fHDtYLQqdT9Tczyb+eSeBHqLfWz3+PBEwMNl6IqbWno=; b=hFRF7dG0/MB6PXxRx6qLhteLe
	ad3pIo+Ksru748Z5DQqd7V9jWf4GQgd+gDokgkfA6kRwhgZdnML/pQc+iTXOjGdwU+JI4hk3CSpFw
	dKK3n8ef8yasPSLiwYOxp4tDsF2qmrUOxtJw/RvHffrGBhV5/+JKd54s1/VpBz1CywK+rPNuryZjC
	NoPEzytyGLGK13T2sAQ30RaepSqIXyPJiE84ImJT4c3woBEYJRBSWE+KdKGgYugoWu7WrGCFUjAW1
	vNSy/zi10XqBoOcFHvwJ7JbkXUb3AiH2T+iYzxq//vI/Q5jyhS4ioUpAV/5q4oKfx7a2k4VVTaj2D
	bT+KweIvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiWw-0004nJ-5l; Mon, 16 Nov 2020 17:43:06 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVN-0003z7-J3
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 17:41:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id b6so19666473wrt.4
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 09:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=dNwXbsPl6q1/WYDA3oEdV/zceq4tTRbwO6lTXlm5XU9tFJdlL8uLCb2UQHW6BfNZn+
 mgndbZ8TvSG3mtt/+A+jocB/IQFje8yUxevFzpcVFB6E5R2NBK/G30xCQNZJztpaSFpj
 7ZL6jHg4IpI1yxLcXSvFPmiWVMom49yEIm89insI5yf38ZUfud8tZbfGClv+QtqTRh8K
 Gq07tgEv6tNT68z5M1XbSKZVOq8SQXXWhA7Hpv/yIwvULEp8E4HTctxb8tjJFZk/4Bb/
 WbgxYlrEvPj5DQjWt0ZA/cKbW6LHdSm7hTS8aDEIcN1QcPH3xmp0cy8EjLxZ15mIUZmy
 ZGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=WkeC5XZ1GeNISeExrohRdNZoo1/FOtbRKQemYk6QDvohgJ473UwNnmE42xckUnUUlN
 sNITP6vxARXDt07zJwdKZtrGw0sQJ7FcCVN5u9itqs5c/LLmJyZQg1BW9QZKg37DR2kD
 zGmOI+eob0ekn4ZuWYGyOId84S15k3ItlSNCwHlXdW7q74iRve36rlQ1c0iDAfaCxwog
 OGnNaL+mWCk1p1qAg+MvjYQTreqsQCvZK/JJZlqqfymMY83u++jxIcQwwsR4q6pb4c61
 mma6fM9NICvVrnMUOKaOzucwjqns8iRuA7fZAjeQA1y6qoeSp1iP8yu4HwlUTyxAu2Lv
 cWcA==
X-Gm-Message-State: AOAM533S9DeuktIMcdI5orVQGFtRhHvncFjd0mDHhML9mTLJ6B75vHaa
 D2XOSPBRp0rs39oFtmEBEXF1xQ==
X-Google-Smtp-Source: ABdhPJz+zBLjNMtTAkRpY8Bqlfb5jRoe4b4kXclN6HEEszc34CvpCg6cluG5/xfolZQyW6Bj4pbxTw==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr21002442wru.112.1605548488615; 
 Mon, 16 Nov 2020 09:41:28 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/42] drm/mediatek/mtk_dpi: Remove unused struct definition
 'mtk_dpi_encoder_funcs'
Date: Mon, 16 Nov 2020 17:40:37 +0000
Message-Id: <20201116174112.1833368-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124129_735612_AE457369 
X-CRM114-Status: GOOD (  12.95  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYzo1MzA6Mzk6IHdhcm5pbmc6IOKAmG10a19kcGlf
ZW5jb2Rlcl9mdW5jc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XQoKQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgpDYzog
UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkNjOiBKaWUgUWl1IDxq
aWUucWl1QG1lZGlhdGVrLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA5
IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKaW5kZXggY2YxMWM0ODUwYjQwNS4uNTJmMTFhNjNhMzMwNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCkBAIC01MjIsMTUgKzUyMiw2IEBAIHN0YXRpYyBpbnQg
bXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCiAJcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyB2b2lkIG10a19kcGlfZW5jb2Rlcl9kZXN0cm95KHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcikKLXsKLQlkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwotfQotCi1z
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIG10a19kcGlfZW5jb2Rlcl9mdW5j
cyA9IHsKLQkuZGVzdHJveSA9IG10a19kcGlfZW5jb2Rlcl9kZXN0cm95LAotfTsKLQogc3RhdGlj
IGludCBtdGtfZHBpX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkJ
CQkgZW51bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKIHsKLS0gCjIuMjUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
