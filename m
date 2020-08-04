Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B18DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:33:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE762177B
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hsDI+UMP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="De/jNu96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE762177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgNKfCh0P/w92GnUOabKezTq9zB31tOHgvqc5WVt5Mo=; b=hsDI+UMPunJdhMMCIImhhTl2oO
	ZpGFIkcVzTGccAXIIEfyLiE0p7Q7EquOe6fVbxMzwhEYIOMe3x0BERyaAI3zYP8uoRO3QjFtP8BQL
	uZpG91WBMjirWKWtK0fZ0RTTkGBy8pMGZr/SDuzer5c6kh2az92f+DUyRdIgJ6skw5FDqP+ETRqHe
	u74/Xi5m/Yb0KQkCHjTPxtOsXHCcD6fa4sG4oIaLZL2Pg1XByjRB0QVrOYgu+qFEK9lSkcA0HBQrF
	46APhbjFIKN82qIZlRSLs3rPp0DtFCgajjkYfwct9Wi7udDaRS7/J5dSy4EdYpgSqATMH8V9w6SZX
	Hmfx55SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zsX-0008KD-Ly; Tue, 04 Aug 2020 16:33:29 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zsO-0008Ex-I9; Tue, 04 Aug 2020 16:33:21 +0000
Received: by mail-pf1-x442.google.com with SMTP id f193so10275780pfa.12;
 Tue, 04 Aug 2020 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=De/jNu96mJukp4chWsMDcgMGSnYzj6VY5TgCOJPgy4y9devJV5pT2uNd/EZzLIt5sC
 G12avvOo9F5n52s/ixkhoTjP2KwAL3BoyNvr9LV6Z7tMRPWUaf/KuCOPLnVEmR2ffARU
 Z35mjxsMvqCz85c4AX10QCWcLiCpWnyDCRnqI1wCOUiPHAq1BcKE5aNnhCyJZMY3bnby
 +t1zT74gtTBbN8OzRlFvY4q+pZrXjzHv3B32pgKEtIEvohCHj0A/5IjTudhY/OgcUhoP
 GT7B4Elovv1R3qotYSkyfQUfHaAVxTRusfIDBXEzhXkoJuoqYr5qGgy9vrQuwAEqzLgd
 UjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=qC8FaEH+Rg5u486HEBFz9mwatuFtNFFr9CdmQqwdz5XJaIhU050uvnf1taCG5n03wG
 AsKcY2QQEyJWxWWdqgIkfX3qJyH7dnjprRtgndm4ORs/VIg1K20XJ0l6SUsnGXIasXVP
 ndMUnRVdGRi5dfkFl3xW/Qjv7jdL4GWym3OYmT5yf0Ze3ehzUhoIFvuryc8Pv426TSGP
 P8VrGsVEsXKE/MR01qGpZzfLxytyyEbsEztsrtuz3BaT8dp90H/UhjyfR670/0dpmbcH
 liO9XzqzLAK9hZt7hSML+/JCf10xvUBPMZpO+VFb+8MmeeC5DcKWFyeRlC/hhKSK/fXL
 ksYA==
X-Gm-Message-State: AOAM531Lg8KO6tOlltMtuSismBlw7hYIkHgBiB6Rt4Q5nHP4NyMapb16
 r+7jKJF3wasR5D79KbKIsLM=
X-Google-Smtp-Source: ABdhPJwo6/ubLU4AReb0s2APcKHXVKyaB9BWQyUa/5liofmuzVDETXysgLOxjz7oJeySotbfjMz8Yw==
X-Received: by 2002:a62:758f:: with SMTP id
 q137mr20675494pfc.170.1596558798302; 
 Tue, 04 Aug 2020 09:33:18 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m16sm657253pjz.47.2020.08.04.09.33.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 09:33:17 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com,
	rafael@kernel.org
Subject: [PATCH 3/9] mfd: mt6360: Indicate sub-dev compatible name by using "-"
Date: Wed,  5 Aug 2020 00:32:55 +0800
Message-Id: <1596558782-3415-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_123320_633434_C7EA6611 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: gene_chen@richtek.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
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
