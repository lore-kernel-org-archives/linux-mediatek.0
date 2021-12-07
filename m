Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 07:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NUOKIc71gl4fxEe4ZA0Raw5omSFSI8DPdsABeg5anb8=; b=vkUifbpiQUUoNP
	kale/i0cAunZicW2hDgfhmr6doeWTxdC513Z3+ejK3ufen2q4FqGhui3bsMe+MHoaUttkb5Uxe6WW
	iRiID6M2DaAKvWj1uTBANL4HYFuADjYkgXyb08z+65s59siVuysMmTKVwNtmjfA/KJfSuiZ6pfLCY
	GnIOnDsz4bJWCSlZPaiJOa/+UW7lxCJbR2Fybqo575VPqxRMjJs2ovFLNs6/XRZKTFVzpAz9KM1y1
	8jKC2BvzloySds/YZHPzQTAmo3rjz3gmHWL6qRF1laPdLTtnvWtGKfRRc/gGBzppKisWUpTx+WBR+
	Yxzr2DaY3zJMPJiv9wFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muV5u-007FFC-55; Tue, 07 Dec 2021 07:40:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muV5h-007FDP-M5; Tue, 07 Dec 2021 07:40:46 +0000
X-UUID: 87f528cf2e304c8eaf4ddd8fde8ae3bd-20211207
X-UUID: 87f528cf2e304c8eaf4ddd8fde8ae3bd-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1030556825; Tue, 07 Dec 2021 00:40:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 23:35:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 7 Dec 2021 15:35:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 7 Dec 2021 15:35:31 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, <linux-mmc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, "Wenbin
 Mei" <wenbin.mei@mediatek.com>
Subject: [PATCH v1] mmc: mediatek: free the ext_csd when mmc_get_ext_csd
 success
Date: Tue, 7 Dec 2021 15:35:24 +0800
Message-ID: <20211207073524.22707-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234045_749072_690D45B9 
X-CRM114-Status: GOOD (  10.77  )
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

If mmc_get_ext_csd success, the ext_csd are not freed.
Add the missing kfree() calls.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 943940b44e83..632775217d35 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2291,8 +2291,10 @@ static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card
 			sdr_set_field(host->base + PAD_DS_TUNE,
 				      PAD_DS_TUNE_DLY1, i);
 		ret = mmc_get_ext_csd(card, &ext_csd);
-		if (!ret)
+		if (!ret) {
 			result_dly1 |= (1 << i);
+			kfree(ext_csd);
+		}
 	}
 	host->hs400_tuning = false;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
