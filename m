Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1B6C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:30:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5302923358
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5302923358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3f9jcC/dayf0T/lNKkmXG4cjbdvz9jqoECNz21y+lzY=; b=tRBv4WdGxdBnSAwwDY5w3vNeKw
	X2Sx0D6JxNEnYABZ+1Z3csGtrgJMgTV8B+/4CbQqh0wrWNE5eILT+jZ2n5/e2B0S5UdxfuZs2v8Wc
	jcGm5eNQGa7S+kWYOX0aDrWUP2RJomVYrftFbwGdWGGxVFMXhkcP5wRZ/Xa8tADs63QNUicVdp8mw
	8QNpBvk1tFupXOwCtndWj0ek5q6t50B6IUG3TeIjf6miou9ehQETdtzMNQl3+TUTqYvZOSYHH5KGd
	7arrhaUAp25oB80hRfjkVsZz8sC9ZqfkO2rxJEw8eFQPQcTBGylW2EApOBDhCkXq+wPkVj4/Z+rad
	XuRkcIFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUQX-0003xt-4P; Thu, 07 Jan 2021 12:30:05 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUQU-0003wl-Fw; Thu, 07 Jan 2021 12:30:03 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 15so4727758pgx.7;
 Thu, 07 Jan 2021 04:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JIfhZma4t7M0QhjqQIwVj37Q6U0ytCyWa6sVJ86x3+E=;
 b=H0SYn3zavUKS6x6UDhKNxQX8cw552XrJ/WIv8yRpRIM6sDKARzTk8yEKqCCKzEL7OZ
 Sqe2lyc88QLHWM7CCr2M//0J4DNWNtxS28SXcCB7UJ5dID9OCzEAcIv4JaHnq5lHgmgQ
 sgET4LPtv3JAqIE7o70L0OCCFn0KXXowlcTA1xUCm5ChdAd+757F4S2iJZS47qD5F7PY
 KAX+L9qLahgIkAr9XaXavaw81lYV9AEJ6o19/MZNYDN3ZwqsLEf4hiVKa70pM0eoIFko
 HItgzMuy7Wn4PFEnRymGiIjeu9ZTGEgiVO4ENgrgRMU4GygY5uxOiSCYhri8kBt+F246
 74Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JIfhZma4t7M0QhjqQIwVj37Q6U0ytCyWa6sVJ86x3+E=;
 b=pIXBy2BfJsPfr+EiczU4DIZRl8zU/sVOkl0BVra7gIG+zNZEHPf3bU6h5cMDXsYwJo
 Pr67466gqThDYvZM9xwe/ewDfpUew92HzTzE+R+4GIDPbapAAvxAqB8EMbrmOIcuEsFh
 dHaNMpHwsy3nhhJa/IrV0ANWobTymDXLphv/GkHB0/BJp4FyuozcmpMTzJzrLuX39ePr
 RrrqgNMuSrz+LtytSKh8iLSR0CbyFuX9CIZ5BtYv+CYiz1LXGuRgM9pBkWZvo3H2pIkt
 79GzlxfSJWjBOOIZcSbu6c1OHz/5bba7VDja7c44cXDpkoBkj9N9hgJ60CXmOdhsKjHE
 3E8g==
X-Gm-Message-State: AOAM530eHWAzeGC3epyKje4kZ5KFteW0ULBuSKy47RGHTaxGoO/OAtsh
 W/vGjzgdrFXKnH4qKasdVvg=
X-Google-Smtp-Source: ABdhPJzT/YJktNDHrk/I8qZ8dAithbSQ7i/79m4+vWBw3oHcFA3VosHZj44pM2C/wLC4imXef32UQA==
X-Received: by 2002:aa7:8811:0:b029:1ab:9e4f:b8ea with SMTP id
 c17-20020aa788110000b02901ab9e4fb8eamr8543725pfo.78.1610022600501; 
 Thu, 07 Jan 2021 04:30:00 -0800 (PST)
Received: from localhost.localdomain ([49.207.216.201])
 by smtp.gmail.com with ESMTPSA id h12sm6356014pgk.70.2021.01.07.04.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:29:59 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 04/19] crypto: caam: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:59:29 +0530
Message-Id: <20210107122944.16363-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_073002_619519_6A1DC03C 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogQWxsZW4gUGFpcyA8YXBhaXNAbGludXgubWljcm9zb2Z0LmNvbT4KCkluIHByZXBhcmF0
aW9uIGZvciB1bmNvbmRpdGlvbmFsbHkgcGFzc2luZyB0aGUKc3RydWN0IHRhc2tsZXRfc3RydWN0
IHBvaW50ZXIgdG8gYWxsIHRhc2tsZXQKY2FsbGJhY2tzLCBzd2l0Y2ggdG8gdXNpbmcgdGhlIG5l
dyB0YXNrbGV0X3NldHVwKCkKYW5kIGZyb21fdGFza2xldCgpIHRvIHBhc3MgdGhlIHRhc2tsZXQg
cG9pbnRlciBleHBsaWNpdGx5LgoKUmV2aWV3ZWQtYnk6IEhvcmlhIEdlYW50xIMgPGhvcmlhLmdl
YW50YUBueHAuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gUGVyaWVyIDxyb21haW4ucGVyaWVy
QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxsZW4gUGFpcyA8YXBhaXNAbGludXgubWljcm9z
b2Z0LmNvbT4KLS0tCiBkcml2ZXJzL2NyeXB0by9jYWFtL2pyLmMgfCA5ICsrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2NyeXB0by9jYWFtL2pyLmMgYi9kcml2ZXJzL2NyeXB0by9jYWFtL2pyLmMKaW5k
ZXggN2YyYjExMDFmNTY3Li4yOTAzZTFhZjBhNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRv
L2NhYW0vanIuYworKysgYi9kcml2ZXJzL2NyeXB0by9jYWFtL2pyLmMKQEAgLTksNiArOSw3IEBA
CiAKICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNz
Lmg+CisjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+CiAKICNpbmNsdWRlICJjb21wYXQuaCIK
ICNpbmNsdWRlICJjdHJsLmgiCkBAIC0yMDEsMTEgKzIwMiwxMSBAQCBzdGF0aWMgaXJxcmV0dXJu
X3QgY2FhbV9qcl9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqc3RfZGV2KQogfQogCiAvKiBEZWZl
cnJlZCBzZXJ2aWNlIGhhbmRsZXIsIHJ1biBhcyBpbnRlcnJ1cHQtZmlyZWQgdGFza2xldCAqLwot
c3RhdGljIHZvaWQgY2FhbV9qcl9kZXF1ZXVlKHVuc2lnbmVkIGxvbmcgZGV2YXJnKQorc3RhdGlj
IHZvaWQgY2FhbV9qcl9kZXF1ZXVlKHN0cnVjdCB0YXNrbGV0X3N0cnVjdCAqdCkKIHsKIAlpbnQg
aHdfaWR4LCBzd19pZHgsIGksIGhlYWQsIHRhaWw7Ci0Jc3RydWN0IGRldmljZSAqZGV2ID0gKHN0
cnVjdCBkZXZpY2UgKilkZXZhcmc7Ci0Jc3RydWN0IGNhYW1fZHJ2X3ByaXZhdGVfanIgKmpycCA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBjYWFtX2Rydl9wcml2YXRlX2pyICpqcnAg
PSBmcm9tX3Rhc2tsZXQoanJwLCB0LCBpcnF0YXNrKTsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBq
cnAtPmRldjsKIAl2b2lkICgqdXNlcmNhbGwpKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyICpkZXNj
LCB1MzIgc3RhdHVzLCB2b2lkICphcmcpOwogCXUzMiAqdXNlcmRlc2MsIHVzZXJzdGF0dXM7CiAJ
dm9pZCAqdXNlcmFyZzsKQEAgLTQ4Myw3ICs0ODQsNyBAQCBzdGF0aWMgaW50IGNhYW1fanJfaW5p
dChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCSAgICAgIChKT0JSX0lOVENfQ09VTlRfVEhMRCA8PCBK
UkNGR19JQ0RDVF9TSElGVCkgfAogCQkgICAgICAoSk9CUl9JTlRDX1RJTUVfVEhMRCA8PCBKUkNG
R19JQ1RUX1NISUZUKSk7CiAKLQl0YXNrbGV0X2luaXQoJmpycC0+aXJxdGFzaywgY2FhbV9qcl9k
ZXF1ZXVlLCAodW5zaWduZWQgbG9uZylkZXYpOworCXRhc2tsZXRfc2V0dXAoJmpycC0+aXJxdGFz
aywgY2FhbV9qcl9kZXF1ZXVlKTsKIAogCS8qIENvbm5lY3Qgam9iIHJpbmcgaW50ZXJydXB0IGhh
bmRsZXIuICovCiAJZXJyb3IgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwganJwLT5pcnEsIGNhYW1f
anJfaW50ZXJydXB0LCBJUlFGX1NIQVJFRCwKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
