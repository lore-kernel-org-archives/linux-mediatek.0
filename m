Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D401FC43464
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 13:10:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A6B320684
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 13:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7EJ3C1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A6B320684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wI3ZzL3mqOhv2HxX0h2F5WoPcGT29K4JJJ+iUL7/JgM=; b=f7EJ3C1+/hf6inZR5gm3I/F473
	k/GtuxSFdxpSYLI3j4icEh8ENG9t/bzc2wsdJ3T0Btynp7YxGpTa3l3+x7dnjPmgs8vwr6dVJgkTs
	xvAXA1Dfzwu5LtqV5N5BWYgn/Mo5ZKs0JjcIc6HPHzoYz1zE5U3dazsIlw1w1tdIbgF6L27aktlvj
	NsphKQBmCuJR9lFIwFUCvSYQrOnPto+6EYME/v7Sy+kNr9ctRdnEWZcu4jRoBFH2+oGZNtJ68AxWa
	mcsso2rTrxcVLKWCk4C1h9RHhcjAEYPRL08fk+/xIaIOPgcuaiHcxCezY4GAPUUkIV97EUY2EYpe4
	m87pWDtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKLae-0004xu-Aa; Mon, 21 Sep 2020 13:10:44 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKLZz-0004cS-Ly; Mon, 21 Sep 2020 13:10:05 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 59B12778451AA172D40D;
 Mon, 21 Sep 2020 21:09:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:09:45 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH -next] crypto: mediatek - simplify the return expression of
 mtk_dfe_dse_reset()
Date: Mon, 21 Sep 2020 21:10:09 +0800
Message-ID: <20200921131009.91191-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_091004_099183_0B406F6A 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: linux-kernel@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index ef4339e84..66bb2378b 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -185,8 +185,6 @@ static int mtk_dfe_dse_state_check(struct mtk_cryp *cryp)
 
 static int mtk_dfe_dse_reset(struct mtk_cryp *cryp)
 {
-	int err;
-
 	/* Reset DSE/DFE and correct system priorities for all rings. */
 	writel(MTK_DFSE_THR_CTRL_RESET, cryp->base + DFE_THR_CTRL);
 	writel(0, cryp->base + DFE_PRIO_0);
@@ -200,11 +198,7 @@ static int mtk_dfe_dse_reset(struct mtk_cryp *cryp)
 	writel(0, cryp->base + DSE_PRIO_2);
 	writel(0, cryp->base + DSE_PRIO_3);
 
-	err = mtk_dfe_dse_state_check(cryp);
-	if (err)
-		return err;
-
-	return 0;
+	return mtk_dfe_dse_state_check(cryp);
 }
 
 static void mtk_cmd_desc_ring_setup(struct mtk_cryp *cryp,
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
