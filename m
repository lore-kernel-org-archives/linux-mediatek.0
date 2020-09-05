Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0518C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 12:16:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3335920757
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 12:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g1hCN8lS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3335920757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xdz3saPM9npvEhDbrbfQ2Wt0XG5z9OB5GTj/7qOLPSc=; b=g1hCN8lSh94N1nuqpyaotjPB8p
	znZSO6i0N47lLNdFd6PgYvfmQ8zCxpumiQZxrPky+nx0b6ooelcSiaasCsGk8ui+IOp5Emhwb3scU
	W0bZQLW45ATbCeQ3fPkEyiIbcmQniRyBXte4PaJ5wSDQ1+RZkdakITXmdds8u58CmckIiPVHGNglc
	m/874UpOL/0EWTd+aMNzzcKZStbqoSg5FqKtf790HSnSkQR7RShNeR4/PciiTJ425JEL2kLSZXbKa
	QwSf+WoUcOwH6VOHAS6JWeFMabTykIAdLnVWA1x9/EgdxPCinAq2zW3u7C3R/sT7LY40ArXbkUy4b
	xULpwePQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEX7Q-0000w1-FU; Sat, 05 Sep 2020 12:16:32 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEX7M-0000vR-DU; Sat, 05 Sep 2020 12:16:29 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1BBD328909026AC3E515;
 Sat,  5 Sep 2020 20:16:23 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Sat, 5 Sep 2020
 20:16:16 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
 <matthias.bgg@gmail.com>, <sean.wang@mediatek.com>
Subject: [PATCH -next] Bluetooth: btmtksdio: use NULL instead of zero
Date: Sat, 5 Sep 2020 20:15:49 +0800
Message-ID: <20200905121549.32936-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_081628_709746_EF3BD581 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-bluetooth@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix sparse warnings:

drivers/bluetooth/btmtksdio.c:499:57: warning: Using plain integer as NULL pointer
drivers/bluetooth/btmtksdio.c:533:57: warning: Using plain integer as NULL pointer

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/bluetooth/btmtksdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c7ab7a23bd67..ba45c59bd9f3 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -496,7 +496,7 @@ static void btmtksdio_interrupt(struct sdio_func *func)
 	sdio_claim_host(bdev->func);
 
 	/* Disable interrupt */
-	sdio_writel(func, C_INT_EN_CLR, MTK_REG_CHLPCR, 0);
+	sdio_writel(func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 
 	int_status = sdio_readl(func, MTK_REG_CHISR, NULL);
 
@@ -530,7 +530,7 @@ static void btmtksdio_interrupt(struct sdio_func *func)
 	}
 
 	/* Enable interrupt */
-	sdio_writel(func, C_INT_EN_SET, MTK_REG_CHLPCR, 0);
+	sdio_writel(func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
-- 
2.17.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
