Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263ECC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t0/o53uHaLc1cWdwkI5TfPVjLrmOsQYjVeraYDpXbyY=; b=Z34mmiOOehvE/3LyXwugBcpK+2
	0K9XGGWOVxSJzVGbAoc6vPbHHK3a7yYmNScY9kCVf9EiN8Ao4iNqyGZK03vnweF8LZhECs3m+IeMY
	LzYFiHXBptqPbB05SrZB5OKs1vcs6wn0yXyaEn9U79W2t7MxYEsD28WfhnaEx0DLibjw+wIP8VXDK
	TkNxRkre/9sXQ8tUYP1+74h3aehAKMBl4pD8BTFIrZt6gZsg/b0rZjaI0db05GiBSLozMdzWEnU9A
	dDCLbtW2vEHW/x3qa7Vp3R421iEEkNx8/pRwuPO06/g138lU+VzqhWbUhyhTduDHQXs8SEW75Rnjc
	OeJJP+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot208-003n3L-Ud; Thu, 10 Nov 2022 07:29:28 +0000
Received: from mail.nfschina.com ([124.16.136.209])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1zy-003myd-L7; Thu, 10 Nov 2022 07:29:20 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 261A11E80D74;
	Thu, 10 Nov 2022 15:26:34 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKJeQaodD6Q2; Thu, 10 Nov 2022 15:26:31 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: yuzhe@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id D5AC71E80D6D;
	Thu, 10 Nov 2022 15:26:30 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	liqiong@nfschina.com,
	Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] mmc: mtk-sd: fix two spelling mistakes in comment
Date: Thu, 10 Nov 2022 15:28:19 +0800
Message-Id: <20221110072819.11530-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_232918_917326_64F43D83 
X-CRM114-Status: UNSURE (   8.12  )
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

spelling mistake fix : "alreay" -> "already"
		       "checksume" -> "checksum"

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/mmc/host/mtk-sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index df941438aef5..a10aca76dfb3 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -735,7 +735,7 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
 		else
 			bd[j].bd_info &= ~BDMA_DESC_EOL;
 
-		/* checksume need to clear first */
+		/* checksum need to clear first */
 		bd[j].bd_info &= ~BDMA_DESC_CHECKSUM;
 		bd[j].bd_info |= msdc_dma_calcs((u8 *)(&bd[j]), 16) << 8;
 	}
@@ -1212,7 +1212,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 		     !host->hs400_tuning))
 			/*
 			 * should not clear fifo/interrupt as the tune data
-			 * may have alreay come when cmd19/cmd21 gets response
+			 * may have already come when cmd19/cmd21 gets response
 			 * CRC error.
 			 */
 			msdc_reset_hw(host);
-- 
2.11.0


