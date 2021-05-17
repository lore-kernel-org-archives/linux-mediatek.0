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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF86C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:34:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C784861002
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C784861002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FxNQ/O7H3wXPLMsNC6NmacBtbXRDFOAzfzDlwsVBP7U=; b=li45Ungx+/DLlSkrntxW++xI5
	qh1uCxGm1gvB96ExvOPRVjPGpyxurf9sIaM2Ru20VFE9mm+dgqUbWoP3pYhTnnW7KmQUc4HEA1+Se
	KjCgZ5czhn9rSZxk8TgPAGXTKtRaw1WPps93HQJ9SxtepOyF9gh0Qw1v38ijcObxSiDlnuS8E1VIb
	QlXUhaH19JMmfoYXVeDDmS2mQXLSU+Se08gdjDGPLhywjccbc3PKWTaUo24OmEcYW022gajHak8cN
	1BU6fUrtXzeta3260RWe8vCNHPgB8J6dFpePnJet8EIx74PcRvA/SZkPcnyI2PlA4gVP5OqOF1KFQ
	2yt+2B1IQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lih8R-00FfLS-2Q; Mon, 17 May 2021 17:34:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7W-00FfAu-2W; Mon, 17 May 2021 17:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4pqFj7Us03V4DKXoPVf/+QTFVKwt46ibq2A620kOL0Q=; b=p24wCiVt+6c4Fw/F5/hmtv0NG/
 nflxNNaH6xfcCKHLPBSWHsWAz60eVTxFKUYNmRE9FUlFNEktwKizHarC3Pzmxo2aYVpk2p1h9MZhe
 jYGig3hvddP/tfqcJj/N6apSkX/lo8cMDxjZpOjKyQTBqeC6fy/Ue+3esjQvoQjDuGceYDRrb1tdn
 vcS60HPGLiax5tMdUdTErzlJIxQakzX8M77TQo1F6agTzgNJ9ZDDs7H18Zo6/qG6+lWPmzxqjsmSr
 NW+b0DFG2ex+U/rJ/xtvNfYTE167y85lK+neSIvbX83JO1eZHyvs0xWa65/hsmmJDiMGBoIETP+LO
 KOQW6/mg==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7T-00E1K5-K4; Mon, 17 May 2021 17:33:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso2521pjp.5; 
 Mon, 17 May 2021 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4pqFj7Us03V4DKXoPVf/+QTFVKwt46ibq2A620kOL0Q=;
 b=Zk1D+rU4hW4nerwdzxqplSrneAc1UjS+6fRKnD9kdguNc60rlUaCn9LNfT2hAv46p9
 dF1xYF4qKNHTBvJuYbswXGVVriGbDLzwYclqFzYrHlRe9ZEC1xweii+4OW19lLDV2Acc
 spIbFpDLwVOST6bGN6gpcjK8pBB4iaJ1d/ls4MhYlL39iPIEl2WfAleC4Qzzupnz8nrG
 A4Fi7STSj759NxwuFGXemxSLuZtdmsAcFP5NpaIH9jHgY6RKzgRKSXge3sbxTIW30M5m
 LDoH1t/eEy603/aabn0r+65i1t0SILSEQZ1lKb0x5Gj4At7uAJ204ENdHuKy0XxJCGpz
 SEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4pqFj7Us03V4DKXoPVf/+QTFVKwt46ibq2A620kOL0Q=;
 b=U3qRjp90kUFNKU3RqhEIZXgsNJMeZXeuKUgoG1wY8x9wkdBEJ3WRauP2NvssVpo3jm
 ELKrbHC9fLnwshV5tnijZ4jeOr7wEe44yYUs08bYGZfo/Xn+ADqWUc37Hp7fVrun8fYJ
 z6U+D62oupbw5dCdq/W5oqfJCBLnxSWg1A5NNWlmH7r7Kum1OQMurkaQXsAw+5T5Dfdb
 TnVdoqFV5ShGsxZ2Dp14QTc/3FG6n0dNrARMRk1TvcZrDtQ17ZMEarlG6W+3objZMI5K
 5/RCUZbEItmJwWjEVloAVTCaVSf/uuFzLHrGETvih8zCFI05Xuvs4afpkochMD36wHQU
 bX4w==
X-Gm-Message-State: AOAM531D1YON3FKa5Shvhz2E4f5wttSHBZSekExjpeODwOTxyASTMPtj
 Wbpe7mUGpG+iQpVmOv+KsS8=
X-Google-Smtp-Source: ABdhPJzT50m5T8D4oLIx2u84pBdh0BVHwS15cXOIDNzpnnzNh7QkdPbvXwqZzSnKWeBvVVl4BBczIA==
X-Received: by 2002:a17:90a:f87:: with SMTP id 7mr613916pjz.38.1621272811122; 
 Mon, 17 May 2021 10:33:31 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:30 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 03/10] mfd: mt6360: Indicate sub-dev compatible name by
 using "-"
Date: Tue, 18 May 2021 01:33:07 +0800
Message-Id: <20210517173314.140912-4-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103331_679286_BDDA92F8 
X-CRM114-Status: GOOD (  10.79  )
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

Indicate sub-dev compatible name by using "-".

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index c374aa6c4a1b..512480f7bd40 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -293,18 +293,18 @@ static const struct resource mt6360_ldo_resources[] = {
 };
 
 static const struct mfd_cell mt6360_devs[] = {
-	MFD_CELL_OF("mt6360_adc", mt6360_adc_resources,
-		    NULL, 0, 0, "mediatek,mt6360_adc"),
-	MFD_CELL_OF("mt6360_chg", mt6360_chg_resources,
-		    NULL, 0, 0, "mediatek,mt6360_chg"),
-	MFD_CELL_OF("mt6360_led", mt6360_led_resources,
-		    NULL, 0, 0, "mediatek,mt6360_led"),
-	MFD_CELL_OF("mt6360_pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360_pmic"),
-	MFD_CELL_OF("mt6360_ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360_ldo"),
-	MFD_CELL_OF("mt6360_tcpc", NULL,
-		    NULL, 0, 0, "mediatek,mt6360_tcpc"),
+	MFD_CELL_OF("mt6360-adc", mt6360_adc_resources,
+		    NULL, 0, 0, "mediatek,mt6360-adc"),
+	MFD_CELL_OF("mt6360-chg", mt6360_chg_resources,
+		    NULL, 0, 0, "mediatek,mt6360-chg"),
+	MFD_CELL_OF("mt6360-led", mt6360_led_resources,
+		    NULL, 0, 0, "mediatek,mt6360-led"),
+	MFD_CELL_OF("mt6360-pmic", mt6360_pmic_resources,
+		    NULL, 0, 0, "mediatek,mt6360-pmic"),
+	MFD_CELL_OF("mt6360-ldo", mt6360_ldo_resources,
+		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	MFD_CELL_OF("mt6360-tcpc", NULL,
+		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
