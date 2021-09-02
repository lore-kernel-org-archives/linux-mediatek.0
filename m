Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A47C43216
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF465610CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF465610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=st49qHNZ3hwbO0keD6fpV1tOsRQ1ltzrMWgg5fa0K+M=; b=KKdT4XFHS7i724
	Jc3jEM2xAie3/s1QBPc3XWIgYKwQNHSAX4qqulHhPaMoxkn3o9Q3s36UzTWRupJ5yyLiU0ZIjdag0
	uo3duaUmYfIXmNRunKcf7BBVEMoaa5qLxwYKvnG4hK/Aqs6zq/ueqifJS1v3OlR7Tbcgw8pQr6Rlq
	Mo7HfAY/LiN4VX5u3EMDsdtTsAelhnQq0nLQduPZvjX6zTW1khodyLvs7uXd+Ni/L1q+AOEFAS0w7
	vIh0yo06NI6QL/9Bcb49SEBCurm+xB5l99Wy4NpriOL3zCmvoZfrG8HJgzSMXzWK8dMxB+WuZiUCG
	tEP72WA+w3U6MML6zP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLgMO-008iT6-Sg; Thu, 02 Sep 2021 06:38:05 +0000
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLgLc-008iKn-S2; Thu, 02 Sep 2021 06:37:18 +0000
Received: from BJHW-Mail-Ex07.internal.baidu.com (unknown [10.127.64.17])
 by Forcepoint Email with ESMTPS id 43FFC8FD5DB95F69C887;
 Thu,  2 Sep 2021 14:37:11 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:11 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 14:37:10 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <patrice.chotard@foss.st.com>, <mchehab@kernel.org>,
 <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lorenzo.pieralisi@arm.com>, <robh@kernel.org>, <kw@linux.com>,
 <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH v2 2/3] media: sti/c8sectpfe: Make use of the helper function
 devm_platform_get_and_ioremap_resource_byname()
Date: Thu, 2 Sep 2021 14:37:01 +0800
Message-ID: <20210902063702.32066-3-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902063702.32066-1-caihuoqing@baidu.com>
References: <20210902063702.32066-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex28.internal.baidu.com (172.31.51.22) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex07_2021-09-02 14:37:11:234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_233717_279106_2D43909A 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

Use the devm_platform_get_and_ioremap_resource_byname() helper
instead of calling platform_get_resource_byname() and
devm_ioremap_resource() separately.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Use devm_platform_get_and_ioremap_resource_byname()
	instead of devm_platform_ioremap_resource_byname().

 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 02dc78bd7fab..8d57970c196c 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -676,14 +676,11 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 
 	fei->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "c8sectpfe");
-	fei->io = devm_ioremap_resource(dev, res);
+	fei->io = devm_platform_get_and_ioremap_resource_byname(pdev, "c8sectpfe", &res);
 	if (IS_ERR(fei->io))
 		return PTR_ERR(fei->io);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					"c8sectpfe-ram");
-	fei->sram = devm_ioremap_resource(dev, res);
+	fei->sram = devm_platform_get_and_ioremap_resource_byname(pdev, "c8sectpfe-ram", &res);
 	if (IS_ERR(fei->sram))
 		return PTR_ERR(fei->sram);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
