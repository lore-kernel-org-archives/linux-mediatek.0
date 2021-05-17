Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51095C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:35:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA71961002
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA71961002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nFugD5KTjj9rL25hpZMGVQ9jbsrYdLeU2REV3pgPqDE=; b=gYD7YkayslSOlnt33FFu6Zdcc
	FCZ8/UNk0Ica1hZJxx3JRua+CILpERHii7D6fdj8TriNjWexEJ8esMEplhhaynIbwh+LmNDBLp5ZK
	P3hlRW/h7hXnFhYn3dR0/1ZUgjr9YKf38NBKmj6j7m8mVmAFllN0enEg+zdcF4Qlcd1woQXfjuU3p
	ySFrFrqBUFX5T2tosn+JaGH93YQduWO+gNUQA4bWzXo3SaazTJaqUf/LwfMV01uGvW4fB0mHAM0c8
	QHM+O93W3bsSyZrzIN5wWSjowvqf2xKuXD7V1xPgTzAJhMSryh7tcic4cnBd+EJNBeaRSWOVXMaS9
	Fy6UdS6lw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lih8i-00FfRm-9m; Mon, 17 May 2021 17:34:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7Z-00FfBO-Fg; Mon, 17 May 2021 17:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=isU+R0YtdvBEb/YxNhS8iAmTy3xonfIIdT0KEAXDyUY=; b=MzMF9xxlt2zy4YW0cP9c3TeOIV
 kgYTEnj/YV36IBQ6SS3x0zratJLyao08dfXK1+DQQQpac5s4CQkzrCUPCt7hDpO+xRibwpfMfVoaU
 tuXILQUrGNAHHnY9NKPMRL3f9/5Lb4Z6nwpUPZswQM91slH3OQA0XlAmeh7AlYOPo78w+QRBA+eLk
 DCr7gHij7WIDeYgOiHLNsXf760KEMybUL81CZg196kOTifGjMXyaNWlewJBWuze/C4TH/LfMuTm1g
 KFv1wwH5X+oFOxYFYR7IhrpNhhz5aKKJbY/hBtXH5Ex6Lz5JNdUt6n6ipjZyclhxsgi44/dhgTWx2
 eEfg4X+Q==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7W-00E1KP-VQ; Mon, 17 May 2021 17:33:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id k15so5118384pgb.10;
 Mon, 17 May 2021 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isU+R0YtdvBEb/YxNhS8iAmTy3xonfIIdT0KEAXDyUY=;
 b=bJ4knYa1+wo1bFrOT/oDLvt8veW+tkDk3aEEse8oCipOnmPe7zk+QIRTGkTtZ6KMpK
 OrjJ8bl7Fejg/ryFRfI2eofAUC0NPqN/pLKzJN+MxmZ17d7J04FsgSgPi7KbaSiH7vgl
 MS6ckEOpDtfDuBUDe0Ju135s8MOKfCkL8DgGo9n5bMSAxqjcHQS8jL7WX0MiPpCvLmaX
 TU5Pag4M6BHH/GHuO6IM7NOKGjtq+yN1VF+bETI+9eanXOIQ/6Lu03VM9gES23uH0yip
 dIBKI+WuIXAs/vSLDJGspzqWnLLTSIlRGJxALemjp4HZeZ0KSYBUYzxEbkESlMGMmZCU
 DJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isU+R0YtdvBEb/YxNhS8iAmTy3xonfIIdT0KEAXDyUY=;
 b=j3lJqtiO1aMj2MvOa7UPexoljDbbTMjdWGsjGwzr+kT1YW9M6QHhY3Riek7zrc5Zy/
 cz1/LglThMERxQSpiBd3L6JxKN4ZD5+T16Q6R6/XbtcHDTTAU4Qtmx4vxpfLHI0buLUL
 1hxVmpNlFxe96kqxFEl+CoO9bNl6Y7ZeqZspkIOhFXukUL/CpuQrTMMUkrWoZCnOyfQx
 6/luauQxrXozoEtOv6XmM69zSQo/sFVTEZSsvARaGGEe+4C5T5b/AQh1cfBufcPSE1l7
 ubM77BFEk6bYaRq9sMTLKIObsu+/IhGjMTeUOM7D38I6+YnBHManMKras8yNQ24RWZgZ
 4NMg==
X-Gm-Message-State: AOAM530lnNigke0ojQXVqUAP6+sNTnqIps+pk9ytvnV0LxOYkCaZZxyT
 nj+zCG4zywWxAedETsNPxD4V6bVrwP0=
X-Google-Smtp-Source: ABdhPJyaGfGcNWLlYnSVTpg5LA09Jl/79wWm2dvOP0W4GgpoCwv9EBUL1PSpCTOJG+W18AFvfa/Hig==
X-Received: by 2002:aa7:9252:0:b029:2ae:bde3:621f with SMTP id
 18-20020aa792520000b02902aebde3621fmr725640pfp.18.1621272813968; 
 Mon, 17 May 2021 10:33:33 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:33 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 04/10] mfd: mt6360: Combine mt6360 pmic/ldo resources into
 mt6360 regulator resources
Date: Tue, 18 May 2021 01:33:08 +0800
Message-Id: <20210517173314.140912-5-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103335_032048_7D6B4A9F 
X-CRM114-Status: GOOD (  11.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Combine mt6360 pmic/ldo resources into mt6360 regulator resources
to simplify the similar resources object.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 512480f7bd40..3553c7045829 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -266,7 +266,7 @@ static const struct resource mt6360_led_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_FLED1_STRB_TO_EVT, "fled1_strb_to_evt"),
 };
 
-static const struct resource mt6360_pmic_resources[] = {
+static const struct resource mt6360_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_PGB_EVT, "buck1_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OC_EVT, "buck1_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OV_EVT, "buck1_ov_evt"),
@@ -279,9 +279,6 @@ static const struct resource mt6360_pmic_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_OC_EVT, "ldo7_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_PGB_EVT, "ldo6_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_PGB_EVT, "ldo7_pgb_evt"),
-};
-
-static const struct resource mt6360_ldo_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO1_OC_EVT, "ldo1_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO2_OC_EVT, "ldo2_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO3_OC_EVT, "ldo3_oc_evt"),
@@ -299,10 +296,7 @@ static const struct mfd_cell mt6360_devs[] = {
 		    NULL, 0, 0, "mediatek,mt6360-chg"),
 	MFD_CELL_OF("mt6360-led", mt6360_led_resources,
 		    NULL, 0, 0, "mediatek,mt6360-led"),
-	MFD_CELL_OF("mt6360-pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360-pmic"),
-	MFD_CELL_OF("mt6360-ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	MFD_CELL_RES("mt6360-regulator", mt6360_regulator_resources),
 	MFD_CELL_OF("mt6360-tcpc", NULL,
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
