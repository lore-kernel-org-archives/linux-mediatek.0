Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D9EC388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 02:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B53820759
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 02:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdJWKEky";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sAgAUfrB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B53820759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6LogoCTSQzlNleo3ZEt39wCS1mDUK/v1oVjbGTnkELI=; b=qdJWKEky5K+WEZYu4hMX88VAkX
	ifPybi+6EWYCwYT46FjY+slJvKNPUYjEsLRWGfORmNuZ0bzkj08cz1F/B5U+svPKpe11Q36Z3F7QZ
	cBK8vPufB50dbXHfHD2Y1vU8uaeup7XsP8jTyZ2ZhF3RIgMQP7wWdJzA8pYI85lnsZEU21bTA1sFS
	8/27/U0LBILXIh81VRba/Y2h3t5AL6slZsNJ544pZivrL5y66T+3T8MaIXf4dkyEU+OJ2GMwsEQdW
	7Xh/9kRbM95+vPWdDfJBY6F913W9zGYax1szHZINs6YvSmzmxqZ2SRXvDRi1kta3FEWZ4IQmDqqqH
	CR3z/LgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcg5y-00058P-1G; Wed, 11 Nov 2020 02:42:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcg5t-00057s-T5; Wed, 11 Nov 2020 02:42:47 +0000
X-UUID: f7df82f9cca24eb28a0e7e76417b40cd-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cTeQ/hjldFmEyV5pQnqStA/bVh7oOAFXTZ9SDz6FiSc=; 
 b=sAgAUfrBKnBCM+5q+fYpXZajMMt4CbSBcX9ZagzeEijirjJs30VXaGJdny4EzRHbSAccRsnBEs/reKJcCW5tKBsUfH3hcSG+wuMF5gkfH9Lg5qLkTOUoubr6LIHjGqrGX2XnefIGqvxUlh4Qu1NGw41pZpPd3pDGCT73oBFiCrk=;
X-UUID: f7df82f9cca24eb28a0e7e76417b40cd-20201110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 289177003; Tue, 10 Nov 2020 18:42:32 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 18:33:58 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 10:33:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 11 Nov 2020 10:33:57 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2] clk: mediatek: fix mtk_clk_register_mux() as static
 function
Date: Wed, 11 Nov 2020 10:33:56 +0800
Message-ID: <1605062036-12735-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_214246_298900_3F31E85E 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_clk_register_mux() should be a static function

Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 2 +-
 drivers/clk/mediatek/clk-mux.h | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 14e127e..dcc1352 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -155,7 +155,7 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 	.set_parent = mtk_clk_mux_set_parent_setclr_lock,
 };
 
-struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
+static struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 				 struct regmap *regmap,
 				 spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index f5625f4..8e2f927 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -77,10 +77,6 @@ struct mtk_mux {
 			_width, _gate, _upd_ofs, _upd,			\
 			CLK_SET_RATE_PARENT)
 
-struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
-				 struct regmap *regmap,
-				 spinlock_t *lock);
-
 int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
 			   spinlock_t *lock,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
