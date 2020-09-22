Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82131C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:22:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD6D2395C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nw0I0ybr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9uP1cs6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD6D2395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgNKfCh0P/w92GnUOabKezTq9zB31tOHgvqc5WVt5Mo=; b=nw0I0ybrUEqjdY3gFgIExCkDQh
	H3wKxH8cfFdzkXSZchsUUE+ZoD/VIQcQopCKYNo/F6wbDhwogpSxboLTWkUQjqit6Wu/qY1HGA7G0
	qAasgv8dq1Jnm+JTRFa0YbPVJt+kmo+qSz/JP5COVgFimxdnuNTLDrr7ykjhio+n7J/l6C1KaGwH5
	7Dnx2hYs4SX/MXzeRzQHqNNX0ea0gX/QvWL+Cqg27SbgSPoaRbo8LY1jJbzZI5QAjB8YkUXlQVeGO
	yOFGFRyzZpFbglj5BbWEVQ9yhZMA5f4XudLBMpMRvQX248pnRWbCV2+3KczH/U3Abp9VMfeX4K0mE
	muF3Onzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfQv-0000OG-1T; Tue, 22 Sep 2020 10:22:01 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfPo-0008W6-Tb; Tue, 22 Sep 2020 10:20:57 +0000
Received: by mail-pf1-x444.google.com with SMTP id d6so11998798pfn.9;
 Tue, 22 Sep 2020 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=J9uP1cs6+B/YsiudN5S6Ow1nA2gyo0SYtCj2mK62DnuUeMv/VvvC+YSmLlGIojl20c
 Gdu9Nm8PnopmEUSNGynTglZaEZwEIiEj1p7B2JjcGs/TiSi21/LPe84W58CI864DrA+q
 uQX/RXyI+cac30GcjAYWG8g/BQCZjCEDZMXgLTvCsAwQR1xmXYdDIxFOXRfCMPzRcRIt
 BlYZ7gJHK+06GZzgrFRZ+owZmVB2KroPPwIMTBGTxezlcPQCbyC0luCYeNMXwZcB3lhu
 WzPMf5ZDbtXO4YZAXCr5Kv01vwWcblL5a8xSI/6tfkvqZgNKeOipX4Fq5SjtNxviqCfT
 Ksuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=Fixw/Hfpyr+LxT/duQ/DqKiiB8hwRSnFkrSuXbJwqTna9nx12KNUz2tZ2jKW75Z+NK
 IyrV2XFLKeJ5m+tq0Wh8Fldj9CCMr87lUpHrdx8ewtBnuZL4NaKL4hjM2QMPFx1jEBR0
 NwbHB6qZGR6C32foFS9NEjL/fkRHGpClvguThSwyTCn08AV/5YJJsSuDFaWmNNDS1GLF
 h8bF15JW9xOVKYJ/UW+7Bz2sBkxfwtyNrzbOZwdgp3C5WzZgws9ch3Lc8+zAgz6yo1O8
 ObekTRalWQoXHsAG0nHyd8vNIsi+XUXJnaUOZd/NOch9aLDzOU1KH92f0G3S0oginDiC
 /mGA==
X-Gm-Message-State: AOAM5301ecP6JrdIlU7DLfuvhp8f9hDXFe28znQ+4hvtfwjC8DUJU1Ps
 jlDeJpKLGWPmO34U/wLmDvk=
X-Google-Smtp-Source: ABdhPJy5ak3fqE/fdF88qGdH6s7sOyYpvxXPALqUIUmvI+Ri9RQtt023ptdWx9aqoINk4h9m3DqSXg==
X-Received: by 2002:a17:902:b216:b029:d1:e5e7:be05 with SMTP id
 t22-20020a170902b216b02900d1e5e7be05mr3993925plr.56.1600770051158; 
 Tue, 22 Sep 2020 03:20:51 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id a15sm14859037pfi.119.2020.09.22.03.20.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 03:20:50 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 03/10] mfd: mt6360: Indicate sub-dev compatible name by
 using "-"
Date: Tue, 22 Sep 2020 18:20:11 +0800
Message-Id: <1600770019-11585-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_062057_109616_517C006A 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
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
