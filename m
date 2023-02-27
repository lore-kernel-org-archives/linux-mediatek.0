Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0166CC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 03:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gR/wbqkWELBvn+JMlhT/1Wwy2lqKc5lu0UUAT54M4Rc=; b=mjJ10woPNsIC9roLtPUvqfr8dG
	xnTxUo6JN4QAAz8UgGdvhaVs26JVGgbUHyICYuagrg+ltArjHD7KmQGjhjXl6MBnOoknQuqQMVP9x
	2gvb23gV/vdLhCfCT4XnBCGUSWUsejtimRZiYAjt6hBBZ/WCaqL2xRP5/a9zACeyUI4ecm6eCu3ts
	Je8uf1fCTrUCgCGq4AbTvVjDpX0FKHEtXFswDRtHw66srSb1IYKDI2uQEKLCGEMozz0ALjmlCvLu4
	YYGJjn11b0w4xz0aWvZ+vAkeRa8dxdZA4ANy8kl9GGHiwLDvxCTGFB/7WtDZHR6uW510LmcsdBrWm
	4SupAn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWTyA-008LuP-Tw; Mon, 27 Feb 2023 03:14:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWTxy-008Lru-PS; Mon, 27 Feb 2023 03:14:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id i10so5301362plr.9;
        Sun, 26 Feb 2023 19:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gR/wbqkWELBvn+JMlhT/1Wwy2lqKc5lu0UUAT54M4Rc=;
        b=GYQ3Ms8rjd2jErfhgiWiEr/dJxgV5z8L+TIrPo3Ew4DocOtfJADVUoqZ9d4u9a2XTL
         VWxa0EF3CH5erbyF3v4luEYbX/tkyY7QtKswpwU55z0gtW1rqxC1cN/H54mChZNNM6hY
         eslkxgj/Tb92yvS2VvKvpkTt+pbFW+UFGrS8iUr6aTxw6Pq1Nm71fxHfI+K93L3j91wD
         zaFMrPewTRZ3kU/tp587eYeSFMuHyeyiT1QsQXtoVJOQo8w6PB3nKsOrth88Gg5qNXhU
         YVn5N9trWAnrY3JjixezzmFjnBNaPF/Vt8OBFzFh9ies0e+xRIH5SjlrPVon+5Puah/H
         tPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR/wbqkWELBvn+JMlhT/1Wwy2lqKc5lu0UUAT54M4Rc=;
        b=Z6PlH9vLNcwXK3GMG58F1PmFXkrOhNjb18P5L7UuYFehyB1i+RfPyOxtEhjOVmP/Y+
         Tr7bO0G9A4Gktz5Ik3LrN0z8XK+gR5+AbVkYqb2xxOdZgufAZaEgjloNevkvhYSZ+A0C
         s91KmtNstu1VAk3RPL7rEohQ/IacrDoppLsSW1CBmw2T/35q1qaOZpL1EBogwy3UQYxs
         QflVuIF7wZFH8RmaBn9KCl5ywzrTZ74j8N21HZkETu+AAxOr/oFb/VfBlxNTAwbNgeAs
         YnATEakM+1nV29ZysVYxhf2A6B2OybKd72V4wVwBgc0UZmcvWSIjHOZPj17JIfvrYlnY
         DhEQ==
X-Gm-Message-State: AO0yUKWs6zDwaiXrpKvCtXmlixz5diOVjd4JGceB9NHbgMnHBADnt0qU
	EmzlmHLXGbsW+NrNtbpWkMc=
X-Google-Smtp-Source: AK7set8cIYQP+miBC0tMU5JIugoMFJN1vsUND7dRn31QdsukPLIUZzlVly0ruAvbjyhrgN9JO/Cp0w==
X-Received: by 2002:a05:6a20:cf60:b0:cd:363d:b27c with SMTP id hz32-20020a056a20cf6000b000cd363db27cmr2294371pzb.16.1677467655103;
        Sun, 26 Feb 2023 19:14:15 -0800 (PST)
Received: from localhost.localdomain ([103.116.245.58])
        by smtp.gmail.com with ESMTPSA id d19-20020aa78693000000b005dae7d1b61asm3088362pfo.154.2023.02.26.19.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 19:14:14 -0800 (PST)
From: void0red <void0red@gmail.com>
To: angelogioacchino.delregno@collabora.com
Cc: sre@kernel.org,
	matthias.bgg@gmail.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Kang Chen <void0red@gmail.com>
Subject: [PATCH] power: supply: mt6360: add a check of devm_work_autocancel in mt6360_charger_probe
Date: Mon, 27 Feb 2023 11:14:10 +0800
Message-Id: <20230227031410.893593-1-void0red@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_191418_886622_B41FF3FE 
X-CRM114-Status: GOOD (  10.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Kang Chen <void0red@gmail.com>

devm_work_autocancel may fails, add a check and return early.

Signed-off-by: Kang Chen <void0red@gmail.com>
---
 drivers/power/supply/mt6360_charger.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index 92e48e3a4..1305cba61 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -796,7 +796,9 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	mci->vinovp = 6500000;
 	mutex_init(&mci->chgdet_lock);
 	platform_set_drvdata(pdev, mci);
-	devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
+	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
 
 	ret = device_property_read_u32(&pdev->dev, "richtek,vinovp-microvolt", &mci->vinovp);
 	if (ret)
-- 
2.34.1


