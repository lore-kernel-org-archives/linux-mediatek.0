Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA6DC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 13:35:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E53D4610A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 13:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E53D4610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cua25UpbCYBLqkwUBg5WIfrQPAaji03bqY7q0UYMmM4=; b=gz8HBjwIexpwL+
	Pnly2YRjTxDwXvpoxZDVQj+JXA2wTQ4RletkHtb33gmExNhRHwXfT5YlGYf5tHjONwzAoOTkYOvA1
	h+B9Gn0CA28oawuW3ombmzy9wcXt1cthj8twcrs+mFlKFIVhZJiVLuo+O4stiAg7SNhAtTHiLePq4
	cDLAFAQbUpUETk/kICrYkYTzDXFtyJhUinz9KijNozJIGhzh4XcjpFPFVwu8FRYCYMnjwSCVKkqQ8
	V9Mzuq5F9mVE5jTLh4AwY5l+yQeq6/i2vZApRlg+q8sNtqdo7Llys33QRUmb1amCy54cgcx3nvkPw
	fsvvpAJ1v+Cnz14OiqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltsAg-00AWQZ-M2; Thu, 17 Jun 2021 13:35:02 +0000
Received: from m12-15.163.com ([220.181.12.15])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltsAT-00AWNu-KB; Thu, 17 Jun 2021 13:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yvhTj
 szTo8tQ9r8I8hyR5rQ1GLc/Yb4fdHEDaHDNtsI=; b=iDLkQfZIEndzvU8CZWiRM
 C3yefEKCEbeVs3sB1d1sOSRlml12CCGExYw+PWpN+18i3YhKnUfo+sHjRh3tDGJi
 LrBZ5HYYAB5xPcw+jpx9+1qGihk+o3cbzo4eKDKoot3ozk/pQUOSQ92725ePMqZN
 l8uYe0Qi03p/PJBSJF58JY=
Received: from yangjunlin.ccdomain.com (unknown [218.17.89.92])
 by smtp11 (Coremail) with SMTP id D8CowADHz3ciT8tgUvmYAA--.257S2;
 Thu, 17 Jun 2021 21:34:36 +0800 (CST)
From: angkery <angkery@163.com>
To: sean.wang@mediatek.com,
	vkoul@kernel.org,
	matthias.bgg@gmail.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH] dmaengine: mediatek: Return the correct errno code
Date: Thu, 17 Jun 2021 21:32:29 +0800
Message-Id: <20210617133229.1497-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: D8CowADHz3ciT8tgUvmYAA--.257S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1DJw45ZFyDGFyxGrWfKrg_yoW3Wwb_u3
 4v9rWxWF1DAwn3Ar1rWr1Uury7tFZ5uF1fWF43Kr1avrW5ur4DCryq9rnIvw43Xwn2vF97
 WF1UZrnakFsxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5PuctUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/1tbiLAy0I1spa1-21wAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_063450_564663_5BC9BCE9 
X-CRM114-Status: GOOD (  10.71  )
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

From: Junlin Yang <yangjunlin@yulong.com>

When devm_kzalloc failed, should return ENOMEM rather than ENODEV.

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 375e7e6..a4cb30f 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -529,7 +529,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	for (i = 0; i < mtkd->dma_requests; i++) {
 		c = devm_kzalloc(mtkd->ddev.dev, sizeof(*c), GFP_KERNEL);
 		if (!c) {
-			rc = -ENODEV;
+			rc = -ENOMEM;
 			goto err_no_dma;
 		}
 
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
