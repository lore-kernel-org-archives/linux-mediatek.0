Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7C0C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A04238E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1A04238E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3f9jcC/dayf0T/lNKkmXG4cjbdvz9jqoECNz21y+lzY=; b=YYkChQsO29QkSlbjJzx8E243j
	yOaw7+kYsV0jcI5QeFxMqKbmCJjAe68BMIewhrQ4A+AOSNEz2Ii6wVZQcSRQqz1bUFQUruA2owo+9
	CSG0AMWraOeUurSLGNjigSjWr7wP0Zz2REi5WTGhjXXnVT11nnINLv+kwpgAuSx5E4x/noDD+ry//
	8k8sM4P0BAm/HroBCOCUk3ILPUfxnY8j2zsssTFIZh6BIn7NzHqUcpsu+3gMRAegTmHcZ1fSC5ccE
	K2rKETZvzk4Hk0q4X/rzXEYe8BQSeXUUod7hS8HjTskfIJl+rwV6jPX8KotlBRX+rS5Eyt5axjFKf
	MzFTA4Mhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Rno-0007eu-GX; Thu, 21 Jan 2021 04:42:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Rnm-0007cF-K9; Thu, 21 Jan 2021 04:42:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d4so591275plh.5;
 Wed, 20 Jan 2021 20:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JIfhZma4t7M0QhjqQIwVj37Q6U0ytCyWa6sVJ86x3+E=;
 b=kQ4IBs5RGnxInr65CELhjNbEAk272NcmVxA31yPCdWxsh8gHBtj49IutKuAasFo3yv
 IdtGcXx3Q3UWwDKkTnk2CAP1OAQ7GGFvE40J/YUquxFskntsW1qmjzmfRDT+S5zcS13y
 Bo6ZYhPz6IxuWtNbFtn71VbgYkYbSDIslmydhy28FcpM1O5hc67TIljw08KXfEdfWXkx
 6REi5dh3N+ob5S1rWMXej9sjVQx/3gZoF1ozlxRVY5otuV/EbVRfZdpBS1a1Y/rUflCr
 p8HeKv4E87J1PPExxLRnR+984RSHIJF44bnmjvs/mUwjJjHpZeQhmqHqjiT12urkowrr
 dVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIfhZma4t7M0QhjqQIwVj37Q6U0ytCyWa6sVJ86x3+E=;
 b=ag+aA+9UzwZRUc9kvYvj7zFRhQEP2uSx9uGyg8UbJIdwUP2yxThspH3XBP9AL8shq9
 WrE8cCK79wsPd4rtstQ5ilErxOsAFuD6oYmIWM509kL8SCpoywk3ydjsnU015QkP+Wj7
 +B23ELREIGW0Xm9QYJRMV/XUFLooPrt+GtSfcX0AXd+p+W/N0oHyOcOhN3pQTX5S/uEQ
 UopZXuuFQvRtIdcJ+7qx0PI3oMZ7dZa8r0SAYbYmbymtPJf5P/G5AofVMBl6i4nBL1Jw
 57wZPOuguPSxjnFBT+W/hMjRj21wmpZmk/zgQaBQfshleIABPzRUtclMdWrGrC6+R+1a
 Kn+A==
X-Gm-Message-State: AOAM532TSw4fG5iu/UMVEEr1U75je/x2jvW1iLpbVablnFEQY5/llyYz
 oU+g05YAyLj8eFVB5mXN674=
X-Google-Smtp-Source: ABdhPJz3gROHw2YBVyuK/onSBCkTE15+V84IiSlj0HhFbNpYb33RBgymr84d61EoU4s8NU2jWYoi2g==
X-Received: by 2002:a17:902:7088:b029:df:cbdb:a0a6 with SMTP id
 z8-20020a1709027088b02900dfcbdba0a6mr3010271plk.17.1611204152572; 
 Wed, 20 Jan 2021 20:42:32 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:42:32 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 04/19] crypto: caam: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:11 +0530
Message-Id: <20210121044126.152274-5-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234234_668371_E66B2E55 
X-CRM114-Status: GOOD (  14.07  )
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
