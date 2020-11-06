Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4984C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:08:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF7F20735
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kOMBmkWs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADBSOuu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AF7F20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgNKfCh0P/w92GnUOabKezTq9zB31tOHgvqc5WVt5Mo=; b=kOMBmkWso5Cldb06OVjQ2o96ys
	GMqM6JsGnEWfxQ8+0nNFMuwFgNC1f2e5upHla4nByHVsK5XcacNlw5hanWEf9mxI+sjARRrg0izbJ
	KNsq7XzCTpjvQjwag55QLuIVQaRzfJAAZMn95eFMWZNklrKgdf45Iarly/OuLuhy3NydxEs3J8ugW
	ffB4wIeg77dO/P82kvkrrIldToKOny0wCPc7kKEjA/CgpfZDvvhjoPxyKh61nXLUonAvTo+nD+6U8
	TaZAiUTVph3BAzqm6OO4enVbovfK+Go9tVBA3eVXMYzPJdldwDIVWg9BKaoJ7GU3wJ8DI+VRX9eQw
	qN9k8P1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaywy-0000gF-KD; Fri, 06 Nov 2020 10:26:32 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaywQ-0000MY-LM; Fri, 06 Nov 2020 10:25:59 +0000
Received: by mail-pf1-x443.google.com with SMTP id q10so933064pfn.0;
 Fri, 06 Nov 2020 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=ADBSOuu5+RnTrJMu2JFScnn1lupC9Qpr98EKW+sFCRB/iyNTcmycd++3XsS5badlx5
 cZ63ZZnjBnEvctAmrVciN/Zxdn/UoQ6/THkDUpkIMmoFqS+bEHbrCIKIbuk9tBX9sVt3
 6xQAN24i3ZWvdr+dv2x55SjAtC67ulNMe4XiKEHEkq76W4KXTAp6cDFTyRx5Ibj0lGO4
 IefgxPWOhzcsTP9gdQWj6T2k6rttE1TS0bv0VSbs3yd+q7XHO/sReL2JIxM+aGBt+0tO
 CPyhp1UmLYWVnMWUjfvf+AkpuU9pLwh1oNbEIG0slAOrAnFk4rjhCtWpK5UQJgEGCbnY
 IDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=Zn/Eh4n6xxixQ2m+8fnKKZKksYml9yeQvakiwn60JcQM9GA/2da+2DneWm0YiRWVRa
 aGv+7am2UAk2K7Yqhg6Mb/FF0ph78/rw2C0XW6DpkMW8KtA5BEt8iuVFNmohKeTI7boS
 2Yv4qOzvKboq7Out4NqgzSc2ej+IqLggIY9zOBSIM94GBVCEsbWFqUppqQleNmK3DVZm
 Ch0JZQLOWK9KxbjKbCLbdAy7i2K3khMcd/taElyuADU9g1Yup6GA/s6/1w7NML6KmeSY
 atS0IvRV69Errt+7DDq2kxCvFG8dSStznFfRIWXvWAPI3P6G8QETwYplYcptrrj0uqd3
 BoOg==
X-Gm-Message-State: AOAM530e0mYvQSZ7vbvKTi2SXiiHYx25BuY50YTeObn7/8PQvegSC4/Q
 tznnYxDIDvboOBo1jESMa099/LlOKdA=
X-Google-Smtp-Source: ABdhPJwDw1g9l1Dk4zO9BznC3YRYdFgm86kmCLKvigqSg0L0ZtfYcEW0oSDfLrD1kggsd38y8ALvlQ==
X-Received: by 2002:a17:90a:ead3:: with SMTP id
 ev19mr1903770pjb.208.1604658356734; 
 Fri, 06 Nov 2020 02:25:56 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.25.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:25:56 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 03/11] mfd: mt6360: Indicate sub-dev compatible name by
 using "-"
Date: Fri,  6 Nov 2020 17:53:44 +0800
Message-Id: <1604656432-10215-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052559_171498_5A79810C 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Indicate sub-dev compatible name by using "-".

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index befee70..692e47b 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -292,18 +292,18 @@ static const struct resource mt6360_ldo_resources[] = {
 };
 
 static const struct mfd_cell mt6360_devs[] = {
-	OF_MFD_CELL("mt6360_adc", mt6360_adc_resources,
-		    NULL, 0, 0, "mediatek,mt6360_adc"),
-	OF_MFD_CELL("mt6360_chg", mt6360_chg_resources,
-		    NULL, 0, 0, "mediatek,mt6360_chg"),
-	OF_MFD_CELL("mt6360_led", mt6360_led_resources,
-		    NULL, 0, 0, "mediatek,mt6360_led"),
-	OF_MFD_CELL("mt6360_pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360_pmic"),
-	OF_MFD_CELL("mt6360_ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360_ldo"),
-	OF_MFD_CELL("mt6360_tcpc", NULL,
-		    NULL, 0, 0, "mediatek,mt6360_tcpc"),
+	OF_MFD_CELL("mt6360-adc", mt6360_adc_resources,
+		    NULL, 0, 0, "mediatek,mt6360-adc"),
+	OF_MFD_CELL("mt6360-chg", mt6360_chg_resources,
+		    NULL, 0, 0, "mediatek,mt6360-chg"),
+	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
+		    NULL, 0, 0, "mediatek,mt6360-led"),
+	OF_MFD_CELL("mt6360-pmic", mt6360_pmic_resources,
+		    NULL, 0, 0, "mediatek,mt6360-pmic"),
+	OF_MFD_CELL("mt6360-ldo", mt6360_ldo_resources,
+		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	OF_MFD_CELL("mt6360-tcpc", NULL,
+		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
