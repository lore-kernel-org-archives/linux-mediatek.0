Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932DCC388F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21DE520639
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DnGku6DH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PBz/ogBo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oU+bZDcI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21DE520639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fHDtYLQqdT9Tczyb+eSeBHqLfWz3+PBEwMNl6IqbWno=; b=DnGku6DHO8qmGz/Q2ak6rcHJl
	MQzLttuvcSNZTN5egU85Qho88896EA9MfMudUEdo2PfafFsOR9biy6MXvEVnAcxvpXJrCfQx9KNWw
	xjakqtATOa+E5plCcIBidpkSBjPd/LcpLlGTpL7EfzzfR9PsBCRugiuF2UoDFKX8g6Id1DXUfU6NW
	8pVffU26ovdDV7CpfvWqXZPSGqXzzRTr/Dv5S3nFhklFp6a0WLjaZ0polpDkQu+y/YmPxOYBFc/6C
	R1qnN9AeE/I8YmuOb7QkINkBHfjb6a2mfXG8BlRAAffeLUBtutL0rKDsvqp5rQANy1Mrjxas6ecqD
	kB2G7Esag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZUc-0008AH-Lf; Fri, 13 Nov 2020 13:51:59 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZSt-0007Dp-QL
 for linux-mediatek@merlin.infradead.org; Fri, 13 Nov 2020 13:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=; b=PBz/ogBoVvkZcQ7RbV4ilYMnmY
 OE/qaUDTqGsTQjahsfLlCIkeOF+kw17bf8JkWunMZ0DzAG+g4MhxTpCbrJJCHEutpxlYhZN5TQtYY
 x/2Sp065TLFEqNX1hCfc24Ksq56eDx5VCDVI+4u1Otn2ZyuPEeqVMwV8TFvL7Cq2yoLPamDXkyv7n
 9YaMgYqXejXy2suuDrXTyMhvDsPfTnQEYQNwDXiwuP/YxxLG6XKwTqMzwW3+UPwGted8xMKr+T+SQ
 YwPAWXxkShVG3nyi4ElmHX5dJQpxgNqHc0VN6udeOqV6xTWHHse+EQb7jBcTtdsOULZPVc+xQxKFl
 xi3ZCjZQ==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZSn-0002no-GG
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 13:50:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id k2so10024092wrx.2
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2020 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=oU+bZDcIA8AQ53jLjMhsbcTjoc0o9aqwixUMDFaPxx4SjacHt/w7oe9W1HMKSdIsn9
 6MbabSjAFbSm0k1Wtzvrq0NdT42aTWaBzzmUWCU8zrAC1ar1JcV5agJQhKKqmsvQRDx8
 DugB2mjm1THeElsZsw+uY85zNMeJ8YXM1g5rjMPx7fYOia71z/cOlFmrj0P/AASK1cLd
 a19gm/PUefiBML3NgcSMj3reICam5oEhlLKz5NZeKUjHwCdh3UqBZfXHS+7mwb1CQBMp
 083hgZs8utmuWHk8W0+RbnRiirUW1LsWFcExyMHgs8HKN+uangYIThSsaPlgGG/FncvU
 Wb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=fd1vMw90ggJCBGhE/KhXO1agDyEvE/daTdrmhbeKW9XvJm9kYAoMJHmHO74+i/XOen
 kPh2INUtfl9nPmah4tCMaiQcp/RSw1J+3x3tBLzP9f97iouByIlqveaIsfHQmUieMzvb
 P0xB/SBCTXX1p0l0oiAmRbWJVnXdoAaXTQtRYtlakf1fKGlkKK78obHxA7M41L4cX/Az
 HgtfLcq3OQlZzuILNKYdx15zuw7B0+ZvhGpsBA1MRAKExsE193wpcdmPYqbHTYdN/ras
 PZwTHVhNEzVJdlxO//p/7fBsoMjqdNDDTpOCsW5qjGfkgGEp6mV2A2pekT70+5pYDA9W
 epTw==
X-Gm-Message-State: AOAM531qqdR9fn3i5SePDKIlHmc08c+d1BGXoSZAxYTJKtOX19eQ31uT
 8byKohi2nJzFDMTEAJTn2MXpHw==
X-Google-Smtp-Source: ABdhPJzKJjo+4i22doEfV7yx3IYktJ3jj4EOHDvZEs21nHetaud1mfeiFp8gdC0lK6WMgPjwB27Hhg==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr3589306wrt.218.1605275403918; 
 Fri, 13 Nov 2020 05:50:03 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/40] drm/mediatek/mtk_dpi: Remove unused struct definition
 'mtk_dpi_encoder_funcs'
Date: Fri, 13 Nov 2020 13:49:16 +0000
Message-Id: <20201113134938.4004947-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_135006_118175_C7B6E5DC 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
