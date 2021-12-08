Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF90C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MaWbPpKVVW68q999WzefVw7RxB25zl60xIJpwRDvwwc=; b=TohudjCf1LsXzS
	3XS5qyNIk+b4dK8UIIUUo1x6IPKU+kAH64SqCD3BKEReapXMHwcQSeXsUlT26IWGq/ALE1h7ysS3m
	b3kLEKgdSW1DYmJpQY6EzpGic8mas+RNQz7dY1hldYGoSjFeeM17apCA2RbPvn5mmt2P7dSQPSvd6
	HujaNoYtvcRrn8vj9itM+AF8OT5Mie2DN5LaPIoWLlWb4y1xYiiMY311wCJjbTlBnik/B4Zp4+Nt7
	uQzej10PKYMOPQJJG/pEJrZ4xo/BqVjoJQIHcG8vN/T1MyW5onnRNAhU2sXGxgBzhsS1d4WdCs3C0
	8ZdvvJFPEs8GW44fVH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv23T-00Dvo6-7o; Wed, 08 Dec 2021 18:52:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv23F-00Dvir-8t; Wed, 08 Dec 2021 18:52:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so4921890wme.0; 
 Wed, 08 Dec 2021 10:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G2Gn57TXwKz95OGmlmSQTgSA6uRDREV59CLTrA3LDM4=;
 b=OKVuuVaPxR6CLec1hWjzcESiIiIwPaUJRKHf4Dyb3LDystuB797Kv+/4/xZ5Citvkn
 U8Xjlq87pVAKo0ueBD+Tg4uP3jxUtY1WwSjUVUnIIVjTlSbCNjLmA4O4ofTNlH7tHR0s
 r+/3j90OcxZCAsgZY40AEUUF03ijnjME6z/hqs27sLPC0WRVdERzeCzpmsK6MHvhUsRX
 Uj1WFjlrWRx13I/XS3Wh320j97JT9eV0grc9/tJtdLqyGRk1OtlTGa6pF1li+TlXvtLX
 gPkpCqkIhxuf7up7tm1NjbV0Itt+4pvKrnTvOjWeQ/gyrrhBAuSpw7zWSHBvcgdip2S5
 XNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G2Gn57TXwKz95OGmlmSQTgSA6uRDREV59CLTrA3LDM4=;
 b=qfIcq5vDctpUH40FJLFJLBcfCeOI6X756PJLfVJACOphGX3xGYdnye4zG0Yuh6+R86
 4ixdAF4aJSkfHZIiBSb/N3qKLCkrGGpLa1TrTxDRtXEvXWdIgoyx/LNqhbEGIZ2uDM95
 xJo4ASaqQCNsX15jT6BCBxamI+UmR5IyhxlCyEaR7kIO31GG6i5tOL7zibWEkGGF9YL5
 ZuSfQtLRCGF5CEdstecmuML5km/wMa+2lH6Ij3L0LW8IlTImTw/OvLkSKWKqd8wMeW1j
 dfXJSUKP+tkXoEFt6WSbJbcLtZEhtkkTnpWVFNDwtwirV9Xerj6BiApBmQT765zdwhGx
 Zt6Q==
X-Gm-Message-State: AOAM532zBTieVb9BXay396n3AW33GZDYcFqppOhROdbv0OX0VWeDu3AR
 AzvICOoCNzEwm/roJahRoJI=
X-Google-Smtp-Source: ABdhPJzInwKOaTbRNAmtuu7tRYtF9nnvxXPPCs7nIKcSSDh8Z7tTsqRvXpGi8rc38zTONr/NpafPQw==
X-Received: by 2002:a05:600c:35c8:: with SMTP id r8mr572989wmq.8.1638989543656; 
 Wed, 08 Dec 2021 10:52:23 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id b10sm3409220wrt.36.2021.12.08.10.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 10:52:23 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, ikjn@chromium.org,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] clk: mediatek: Fix memory leaks on probe
Date: Wed,  8 Dec 2021 19:52:11 +0100
Message-Id: <20211208185211.40682-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_105225_343742_4A696400 
X-CRM114-Status: GOOD (  11.51  )
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

SGFuZGxlIHRoZSBlcnJvciBicmFuY2hlcyB0byBmcmVlIG1lbW9yeSB3aGVyZSByZXF1aXJlZC4K
CkFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTQ5MTgyNSAoIlJlc291cmNlIGxlYWsiKQpTaWduZWQt
b2ZmLWJ5OiBKb3PDqSBFeHDDs3NpdG8gPGpvc2UuZXhwb3NpdG84OUBnbWFpbC5jb20+Ci0tLQog
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5jIHwgMzYgKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5jIGIv
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5jCmluZGV4IGNiYzdjNmRiZTBmNC4uNzlk
ZGIzY2MwYjk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLmMK
KysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5jCkBAIC0xMjM2LDkgKzEyMzYs
MTcgQEAgc3RhdGljIGludCBjbGtfbXQ4MTkyX2luZnJhX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAKIAlyID0gbXRrX2Nsa19yZWdpc3Rlcl9nYXRlcyhub2RlLCBpbmZyYV9j
bGtzLCBBUlJBWV9TSVpFKGluZnJhX2Nsa3MpLCBjbGtfZGF0YSk7CiAJaWYgKHIpCi0JCXJldHVy
biByOworCQlnb3RvIGZyZWVfY2xrX2RhdGE7CisKKwlyID0gb2ZfY2xrX2FkZF9wcm92aWRlcihu
b2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0YSk7CisJaWYgKHIpCisJCWdvdG8g
ZnJlZV9jbGtfZGF0YTsKKworCXJldHVybiByOwogCi0JcmV0dXJuIG9mX2Nsa19hZGRfcHJvdmlk
ZXIobm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dldCwgY2xrX2RhdGEpOworZnJlZV9jbGtfZGF0
YToKKwltdGtfZnJlZV9jbGtfZGF0YShjbGtfZGF0YSk7CisJcmV0dXJuIHI7CiB9CiAKIHN0YXRp
YyBpbnQgY2xrX210ODE5Ml9wZXJpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CkBAIC0xMjUzLDkgKzEyNjEsMTcgQEAgc3RhdGljIGludCBjbGtfbXQ4MTkyX3BlcmlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXIgPSBtdGtfY2xrX3JlZ2lzdGVyX2dh
dGVzKG5vZGUsIHBlcmlfY2xrcywgQVJSQVlfU0laRShwZXJpX2Nsa3MpLCBjbGtfZGF0YSk7CiAJ
aWYgKHIpCi0JCXJldHVybiByOworCQlnb3RvIGZyZWVfY2xrX2RhdGE7CisKKwlyID0gb2ZfY2xr
X2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0YSk7CisJ
aWYgKHIpCisJCWdvdG8gZnJlZV9jbGtfZGF0YTsKIAotCXJldHVybiBvZl9jbGtfYWRkX3Byb3Zp
ZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsIGNsa19kYXRhKTsKKwlyZXR1cm4gcjsK
KworZnJlZV9jbGtfZGF0YToKKwltdGtfZnJlZV9jbGtfZGF0YShjbGtfZGF0YSk7CisJcmV0dXJu
IHI7CiB9CiAKIHN0YXRpYyBpbnQgY2xrX210ODE5Ml9hcG1peGVkX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCkBAIC0xMjcxLDkgKzEyODcsMTcgQEAgc3RhdGljIGludCBjbGtf
bXQ4MTkyX2FwbWl4ZWRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAltdGtf
Y2xrX3JlZ2lzdGVyX3BsbHMobm9kZSwgcGxscywgQVJSQVlfU0laRShwbGxzKSwgY2xrX2RhdGEp
OwogCXIgPSBtdGtfY2xrX3JlZ2lzdGVyX2dhdGVzKG5vZGUsIGFwbWl4ZWRfY2xrcywgQVJSQVlf
U0laRShhcG1peGVkX2Nsa3MpLCBjbGtfZGF0YSk7CiAJaWYgKHIpCi0JCXJldHVybiByOworCQln
b3RvIGZyZWVfY2xrX2RhdGE7CiAKLQlyZXR1cm4gb2ZfY2xrX2FkZF9wcm92aWRlcihub2RlLCBv
Zl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0YSk7CisJciA9IG9mX2Nsa19hZGRfcHJvdmlk
ZXIobm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dldCwgY2xrX2RhdGEpOworCWlmIChyKQorCQln
b3RvIGZyZWVfY2xrX2RhdGE7CisKKwlyZXR1cm4gcjsKKworZnJlZV9jbGtfZGF0YToKKwltdGtf
ZnJlZV9jbGtfZGF0YShjbGtfZGF0YSk7CisJcmV0dXJuIHI7CiB9CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21hdGNoX2Nsa19tdDgxOTJbXSA9IHsKLS0gCjIuMjUuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
