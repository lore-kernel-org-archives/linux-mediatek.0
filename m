Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC81C433E1
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 11:16:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E102075B
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 11:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ca0P6eAZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E102075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WAASQQ6vI9QfcvoZPUCPR5emMfQ3cB1rZOGQwAPGEyo=; b=ca0P6eAZU60RP4AN+qs3X46gux
	bXHWCzluvz90dMwCggUfxftv5/O4WbrmOPMxY5S1F1jJoWwx13fUajfh5u0xynceP/xWVcnDPRxsS
	fZgIfIDs/5k7RPovGVqCZL3C8EoR/lz7pbplUWhrRnf3yZrS7EbbZVOF8NzLOpSQPTT8t4AgqMd4f
	6PEWyIvPFIkJ2bqb5PdvtzDqxBtgbVd5SDVygFnQUiP0+gcio/4Er6NLzWlfIfwTK+6tsHMSutgLw
	pNI7tr+jYWcMM4jZzCatoJScgz6P7LgZj0JZ/HMssBZcXQqvcc8HETDRVqyBBwYgFI+sA8nlvrp5M
	Vz2DLJ2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2By6-00072h-3U; Sun, 02 Aug 2020 11:15:54 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Bxz-00070J-JC; Sun, 02 Aug 2020 11:15:50 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R361e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0U4T1Vff_1596366933; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U4T1Vff_1596366933) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 02 Aug 2020 19:15:33 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH] crypto: mediatek - Fix wrong return value in
 mtk_desc_ring_alloc()
Date: Sun,  2 Aug 2020 19:15:32 +0800
Message-Id: <20200802111532.5110-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_071547_904322_40530DD3 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: tianjia.zhang@alibaba.com, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In case of memory allocation failure, a negative error code should
be returned.

Fixes: 785e5c616c849 ("crypto: mediatek - Add crypto driver support for some MediaTek chips")
Cc: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index 7e3ad085b5bd..ef4339e84d03 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -442,7 +442,7 @@ static void mtk_desc_dma_free(struct mtk_cryp *cryp)
 static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 {
 	struct mtk_ring **ring = cryp->ring;
-	int i, err = ENOMEM;
+	int i;
 
 	for (i = 0; i < MTK_RING_MAX; i++) {
 		ring[i] = kzalloc(sizeof(**ring), GFP_KERNEL);
@@ -476,7 +476,7 @@ static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 				  ring[i]->cmd_base, ring[i]->cmd_dma);
 		kfree(ring[i]);
 	}
-	return err;
+	return -ENOMEM;
 }
 
 static int mtk_crypto_probe(struct platform_device *pdev)
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
