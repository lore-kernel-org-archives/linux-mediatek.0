Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C4BEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGJxkkGMv4pyxE5+FAh4L8+srFQJmXNAKijRBOh2Uho=; b=SMbCeAqDdKSOCrlsVLaHZ0ht4q
	ATSdm7HthM8C3Irv36QQqNfCMhWFlrrlYYa8yX4tr9q9nzgYRpC3LJ/rDzHe1ATdh7kFohSDhqT3d
	u0hwuMF+3Z6VOWNICR5Hv/tlES7FvliXcSU/fwWBTSNH/EXyViIIeWQGWRCs+oeYiipACAJem+RvJ
	ukfzjwo7foEYeWroBOwYmtqeEqbG0tBo0qCpHGwa3Mff7ejlFKty/shCmm/6xeB/XPI3qBmebJIsr
	rcIiVtS1R9iksMI2uEYtXEyyEye3J9Qy+UWmEK3hPxrLLFQQJxzjb8vazXwrerCLz3KISFaWR/DNJ
	YlhmG4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTeX-00GiaV-2a;
	Wed, 12 Jul 2023 06:48:45 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTeT-00GiZH-2R;
	Wed, 12 Jul 2023 06:48:44 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VnBnpAi_1689144512;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VnBnpAi_1689144512)
          by smtp.aliyun-inc.com;
          Wed, 12 Jul 2023 14:48:33 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: stanley.chu@mediatek.com
Cc: jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] scsi: ufs: ufs-mediatek: Remove surplus dev_err()
Date: Wed, 12 Jul 2023 14:48:32 +0800
Message-Id: <20230712064832.44188-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_234842_047754_5E8127AF 
X-CRM114-Status: UNSURE (   8.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is no need to call the dev_err() function directly to print a
custom message when handling an error from either the platform_get_irq()
or platform_get_irq_byname() functions as both are going to display an
appropriate error message in case of a failure.

./drivers/ufs/host/ufs-mediatek.c:864:3-10: line 864 is redundant because platform_get_irq() already prints an error

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5846
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/ufs/host/ufs-mediatek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 786b1469eb52..b499eade957e 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -861,7 +861,6 @@ static void ufs_mtk_init_mcq_irq(struct ufs_hba *hba)
 		irq = platform_get_irq(pdev, i + 1);
 		if (irq < 0) {
 			host->mcq_intr_info[i].irq = MTK_MCQ_INVALID_IRQ;
-			dev_err(hba->dev, "get platform mcq irq fail: %d\n", i);
 			goto failed;
 		}
 		host->mcq_intr_info[i].hba = hba;
-- 
2.20.1.7.g153144c


