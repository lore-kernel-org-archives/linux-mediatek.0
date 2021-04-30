Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4596C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 15:55:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4489C6145D
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 15:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4489C6145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7KyOn1xaEN/kT5YeCGA+vNNVXbXvSbC1603O4xwLW4=; b=X+Dga050q2R0lgGBqzDQSnFip3
	30l4PR5OrBMRuLxTG1pB2tI6U/zRvIAIK86nmYEJiY/2OhFDf3r9BJUUmO1j4BJMYX3JZ7pUOTRXH
	OA9QUv0gc6F7Eccm7Sru8rVWVqxRxgjgecEgmwNF9Uja0pKOedfo2US9b98dqex5wazXU4eBhUnK4
	6kd1XkWQQkg8GFl6wy6gtVTrEB7zsTIISWD3aE73v7bnFRe70JTpMXJ+edUI0zFsWisoBJJh4QfUg
	jv9aHIjS1iNVxkOJEGMmv3+FE9j5YT4W77IKFo/S5Y4eA8FOKkPUbaGIN4HnU/mKNuiPOGf3YaU2y
	OTQqY6Fw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcVTa-0087vU-EB; Fri, 30 Apr 2021 15:54:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcVTZ-0087vK-Az; Fri, 30 Apr 2021 15:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=li4P0f9ZpyoBcCwFHOffrUiZrzMCQxccd5xyukLyhMM=; b=R+uo82bhaedSbzbMSa/nFQVZb7
 g4XaN87lfE3uK8r0Jfe+d4WpL4i9r0D0s/X4zMk8ltwcrQVpxZjOfzbNd6TlGm7pjVMRIjqLfwchA
 ZSQW/r5fmSy/fwiDL0qNoX5yAUlp9rUtDTJWDunLk5wtJ4O5aFAo7XUHxUeKto7XIn51IvSPLjqAo
 Ksv9jW76tw5yU5m1qoSRgNsT0/BzpsiEGUgznNeLCdKOr/7BodOiyJbvQ5qBrK7Y0ona8zvacrYQe
 rXN6WoOfNSMecDpCTUn+2p+B/MdYWyypkEl6g7spLXV+o3zyKQMPq1IL5tdj8E9mrwuJG0RA0pVpF
 Xeo8oGow==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcVTW-001UrU-Pm; Fri, 30 Apr 2021 15:54:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id t22so14444857pgu.0;
 Fri, 30 Apr 2021 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=li4P0f9ZpyoBcCwFHOffrUiZrzMCQxccd5xyukLyhMM=;
 b=SqkaWdQH5jHitR7HyrO7pdXH9wT30YUvJgeZ3KtlT0Rk9mQ1nBfPK3l8KrP/jt0UM/
 9pu/Md3XcahVkflpc28qMEg2GOjKik4gTtCpdcnFpsN8fYXdY0qy4V4W0lLwAzoe2mKd
 BUoEsZvX2br19/hOib3DciVU1MWrRMyzLh5gHCx9zrcjQyaCDvrBrUxAE8HKibp62/3Z
 HC3Aa8QolrmDo2Y63P403sn759PI2AMTAHvYJ3eAvOMIW98X9CxzTVU/j2QdT2X8FLCR
 tJLY5MDeJwaLiDtuKklxUZj0yUPEnOx7tFeAiwrCpW7Bjs601+mw9yWdy6DVnJ7BbCVM
 PVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=li4P0f9ZpyoBcCwFHOffrUiZrzMCQxccd5xyukLyhMM=;
 b=gggC4yXeUB6mMehGGmlaS09O9aMx9U/BSQrBSMnm4Od5zh0RkXBPsZrJ/iIewZ+6JZ
 73QZ2EfPRpPGLy7pGvs83Lm1RKN09R7pBTsj66heYc3X3Dd18+wzD3tNEu9zL4y8yXYh
 KlRqZiQj5DF6evdfXR5quWUUOtsYzesZwFy+nr7e+uUi7YaHQ223gu+z0qssPEo+dBPX
 oUfcrIhV63MzIiQLahb60g4fQbMF+qD40JglxdUGebtfKqaFhO2S6uAYAlR1BWGpFKUe
 n5BgqziEuOssGH9jT2LW/0ZqvEtRyMCyKrvtsAyE1nYy+xcJZYu3sRhbOnTI+WHlHHQS
 rTLw==
X-Gm-Message-State: AOAM533hW5X7ir6OcGWEtOpaaB6vC5Ft8ec1hae0wLkXKlChrM4Z9pSf
 ElNkzT0YDG9QR3mJT7Bfab0=
X-Google-Smtp-Source: ABdhPJzhLNopbYOVTFvjJ5/orBo4d8YD8kKpUXJgCiz0JBSJkrj7UyvGPl6TCdqlL9N1Lsj5R8b8Ig==
X-Received: by 2002:a65:620d:: with SMTP id d13mr5219720pgv.85.1619798081388; 
 Fri, 30 Apr 2021 08:54:41 -0700 (PDT)
Received: from localhost.localdomain ([103.248.31.161])
 by smtp.googlemail.com with ESMTPSA id m11sm3360805pgs.4.2021.04.30.08.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 08:54:41 -0700 (PDT)
From: Amey Narkhede <ameynarkhede03@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Amey Narkhede <ameynarkhede03@gmail.com>
Subject: [PATCH v2] PCI: mediatek: Check return value of clk_prepare_enable
Date: Fri, 30 Apr 2021 21:24:29 +0530
Message-Id: <20210430155429.35034-1-ameynarkhede03@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_085442_870086_55EF8224 
X-CRM114-Status: GOOD (  13.20  )
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

In case when free_ck clock is not enabled during device resume
check the return value of clk_prepare_enable() and return the
error after printing it.

Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
---
Changes in v2:
	- Print the error before returning
	- Clarify commit log
 drivers/pci/controller/pcie-mediatek.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 23548b517..9bdae34cc 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1154,11 +1154,16 @@ static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
 {
 	struct mtk_pcie *pcie = dev_get_drvdata(dev);
 	struct mtk_pcie_port *port, *tmp;
+	int ret;

 	if (list_empty(&pcie->ports))
 		return 0;

-	clk_prepare_enable(pcie->free_ck);
+	ret = clk_prepare_enable(pcie->free_ck);
+	if (ret) {
+		dev_err(dev, "Failed to enable free_ck clock\n");
+		return ret;
+	}

 	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
 		mtk_pcie_enable_port(port);
--
2.31.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
