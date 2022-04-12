Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RU62ltQXhiysEtiFyRAc8lX9XUjS47PLMJGM5sZ4G8c=; b=X6479ZDr1j5t8I
	fJ6tD8pytMI9sSc0O8Xu0AWEsiWBdfpOU5xv3uLvGQGcWKuKKiGK60AqEqZDa2PPz/qvw7Bran7Oy
	Yu111rwIRXlcv4XLe+gesMxL+Z3xMV7ZqorR4qr9ZlsmbwX6nMBSsZTTznADgmuvwEsX3YgtJwFyj
	nKNyvC8RSgw81kGdNtN1AsGZZvOwJ8ccSWv/q5aoh5Ho25bckNjjKh3/FDwt0M43y6La/ZvCfT9jC
	YVW+TS8uINk56sCqBWED/qAHF4c2yiaUMitNYmX8y5KEVjMoyUsq31UExG2XgCXq/vL3anDH92ta0
	pGWLJvdI2rjq+YYYofMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBTP-00CQPp-9Y; Tue, 12 Apr 2022 08:02:03 +0000
Received: from edge01.meizu.com ([14.29.68.187] helo=mail.meizu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBQs-00COqU-Is; Tue, 12 Apr 2022 07:59:30 +0000
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 12 Apr
 2022 15:59:03 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Apr
 2022 15:59:02 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Haowen Bai <baihaowen@meizu.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] dmaengine: mediatek: mtk-hsdma: use NULL instead of using
 plain integer as pointer
Date: Tue, 12 Apr 2022 15:59:00 +0800
Message-ID: <1649750340-30777-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_005926_997097_01ADC65D 
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

This fixes the following sparse warnings:
drivers/dma/mediatek/mtk-hsdma.c:604:26: warning: Using plain integer
as NULL pointer

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/dma/mediatek/mtk-hsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 6ad8afbb95f2..358894e72fba 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -601,7 +601,7 @@ static void mtk_hsdma_free_rooms_in_ring(struct mtk_hsdma_device *hsdma)
 			cb->flag = 0;
 		}
 
-		cb->vd = 0;
+		cb->vd = NULL;
 
 		/*
 		 * Recycle the RXD with the helper WRITE_ONCE that can ensure
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
