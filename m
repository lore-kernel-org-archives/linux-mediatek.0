Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB450C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3AF7207F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jzWr9cZK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVPJeRsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3AF7207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upK3nU6CXaXACBnP2vPwfW9F9nx1/0m6J+ikrPa0/u0=; b=jzWr9cZK75LOJn7U9UhX1TAFtt
	CqMh5rcgZf/m+wmvUN4CXh9GgCy0L6TZLLvxQpaMlyUY9e+1Ur+puz8fIwzoCmP6AQRoLgTqm9mgY
	EiE0LWgkutIZVtZIYiksBpxHEvo+9DAtv7SwQwQ9Na4wXo+Yg1Q21R4dNUKhJb3sMKC9arZSl8uRP
	bqeUTOl3MbOcOIXeq6Z8+phAH+Z6WUrOCG8GFSR4l1ySyMYwXH6ogsQja8vavKKkA1Ml/wSBVvNnf
	lgfaMlc7uMBg20D7GABYsMSv7mEzF3DpMs0qKLitbfFlWxqHqhjNrdbbJr6H0RGIZx3ff12VFiDor
	RWZ2c1EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwOAH-0006Nd-Kz; Fri, 17 Jul 2020 11:04:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwO9u-0006Dn-Fp; Fri, 17 Jul 2020 11:04:07 +0000
Received: by mail-pg1-x543.google.com with SMTP id e8so6513312pgc.5;
 Fri, 17 Jul 2020 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5PfOLny4pEJWy4MQsn/yhZkSIXGOVwix+YbwTulqRH4=;
 b=EVPJeRsac75H1MWZGT2eAc7gmbFMNKYmzd2Nc92E+e+bEpn+FWo46iRxErKK3IzEt9
 2mrqzMrvvugMdvTr1gaEfsNkgCM54pdOBZFk5Zki19l+kkc5OnapIjbVhZF8skJtV6Bv
 hZXDHwPvw22AkDXX1vxoK99BFcTSL8uifm7clJ5gKIxZCejgi0lnoZ3UgYiBeagfASd6
 /LH+M8tuBhlarDIljW7f683YsS/SrmgzYY1tmK9o9ZRiLxBSBW5T9e6s4sWHBZHc5XyY
 OA9dSmyVukfmhLCO4TwVP4+gaRxnYVhE77YpYqmgakZZhoQAaMOB5FbF3xnpVTtICqL7
 qPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5PfOLny4pEJWy4MQsn/yhZkSIXGOVwix+YbwTulqRH4=;
 b=ei/OVqacCQ0pH3wiMp/tDvMRfMUYkSCdHfeWgzG8ZpXUEBzcuroaQQjbZmgXe7YS8L
 j8nVYPxp+TgyaRgcbTpEzofrATKdwKmnCmW8NuokNAiHeGW7vJw/04tMh9AH2c+haoGV
 cgq9aD7ljWFl1DkZzAeHULDM+Q6apeDQjWm4D43+iI7fltzz69dESP92bBE+TRyuSUVo
 AD11QPMhtBHKebqJxz42apNU8+f5icqHK4isjE6hPMXRU0iK9y2uTcZCMeFr9uOLh4Y+
 c7GkcPToQv75nL7ZSyxYkFbrdNDAuMpzMr+/gsnzuzJwRWhNIgQDg1YeozQ7FGF1Aiau
 Mq4A==
X-Gm-Message-State: AOAM532oxBOkI9PcVjU2ywWsaaEVPXAZH1yrmUteeyEmDZyTjlnIDl5Y
 CUa5kwGSaN4nYVHxvIzwWNM=
X-Google-Smtp-Source: ABdhPJzv2tdiLD9maWynthhXaPy0N5lIriyKmvl7WzGLmVNw5qPWKRQAUxePsMuiL3ItOfq/mNbyaw==
X-Received: by 2002:a62:17d8:: with SMTP id 207mr7112910pfx.44.1594983844789; 
 Fri, 17 Jul 2020 04:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:ae36:984e:c073:9d0b:7c09])
 by smtp.gmail.com with ESMTPSA id o26sm7619183pfp.219.2020.07.17.04.04.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 04:04:04 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 3/9] mfd: mt6360: Indicate sub-dev compatible name by using
 "-"
Date: Fri, 17 Jul 2020 19:03:25 +0800
Message-Id: <1594983811-25908-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_070406_631719_6E63C5BF 
X-CRM114-Status: GOOD (  10.36  )
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
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Indicate sub-dev compatible name by using "-".

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index e850675..7cc1b59 100644
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
