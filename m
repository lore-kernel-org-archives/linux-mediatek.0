Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27715C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:48:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B444422D6D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B444422D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3f9jcC/dayf0T/lNKkmXG4cjbdvz9jqoECNz21y+lzY=; b=V0q8/Rb3FQmh9g1HKvLlb1DW0
	N9IxCJXE8NllNmw8V35QEOIODfqksClrIR3YjuprJrXzAuJZ6PpDWvfjTifuIjdRq/FfwmcGCJNty
	bUVq6flT+1rrBJDT8y8aLB9x8GdMhnsiswkdHPsbX1mbqUGj0/HUaM8VR2RGPDdkre/kMXJZWWJKw
	Fx2owQpXmiX5YLWwkgt5dW+u0PKPTrXY0NSQ1y2u2bZulT/nHPJkegrkNAM+3m9JOVG32NMD5fdBC
	jh6StQimEiaaWUDjkC+L28kjzMdavHqbQni14MVOgnhNRkwSOGNlj58LzYHZ3D9RBVZfuK274hFx9
	GmMLpLDYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8ml-0003Bv-33; Tue, 12 Jan 2021 01:47:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8mi-000393-Am; Tue, 12 Jan 2021 01:47:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id y8so514797plp.8;
 Mon, 11 Jan 2021 17:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JIfhZma4t7M0QhjqQIwVj37Q6U0ytCyWa6sVJ86x3+E=;
 b=RJUuJ34gzSSXgEmLEMH6F9Sgq+AjXpRBfq9uOyNbGeEVo9Zni8GVwIioC+KBKuBUwb
 3Hz2ntdsMokLeu0TtA4u6cWnxJVq1h7CHSCNXhh7wxMdZKrASnNYYuAQ68EvklLWwsRK
 Zl+cGIFjCy1cN9ZKNf9Ejtz5nWCTPakILZUVFEh4+j0jeTMCMe/0jSJHwiWtZDwB3Z98
 ITpyOO2Xzhx0Fv9X9F+ZlzFPoeMTosFBNzkNH8p/Hyba4vxN1fuiHVkTt7i4BaOtOSoB
 ivGOKO+FZtDra7bSh1vZH6CArjuKeKOfVdsThHZoD0dqACAhgIhIHq0E35mjkk75NJkQ
 3fDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIfhZma4t7M0QhjqQIwVj37Q6U0ytCyWa6sVJ86x3+E=;
 b=ks7Js1jgY2/Ug4nqbrFh49EuEhAamk46pfN2EmVYd4W9KpqHsfRFoIA89qSGdCgrz2
 oZTecko/ujx4hor3EJHfK0cpGEUiWNyrNDhw7FH3HOMh06SsSx1sOQS+ai/hSoxdIO0s
 f8DEtCPTqle11h4/aRQ5/T8K0ihzaLGgmzMJ4imBMXmRdDhykJkwh/9XlA9fOHf8RQk9
 O2lhWquIWI6opTRTv/PBNUmtkIF8C2XmEu6u4MbvX1c27LqFPg2FlMPxfCv/6ycTbeGF
 KuBJp32Sc+hAweSARTXr3VaryLRvO2GMhO8KqGxIynkpCPgQ4kN7INORytisZgTqofTK
 W8lg==
X-Gm-Message-State: AOAM530soSUXGSlu9H7KyMdtgF+2lV4Wj5TbkdxuowklbIJhDG73MrxP
 af9lB3qERYaQqrQjMfMphZc=
X-Google-Smtp-Source: ABdhPJyTDsH0JvPVWAJSKCCZ0fNwYXHtd/8sbx45wvu+0Xfc9BHtL6tbRakBFNIyS/n2zR6vRE67nQ==
X-Received: by 2002:a17:902:ed11:b029:da:3137:2695 with SMTP id
 b17-20020a170902ed11b02900da31372695mr2689863pld.1.1610416066062; 
 Mon, 11 Jan 2021 17:47:46 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:47:45 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 04/19] crypto: caam: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:35 +0530
Message-Id: <20210112014650.10887-5-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204748_387574_BB14B389 
X-CRM114-Status: GOOD (  14.18  )
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
