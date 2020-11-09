Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3571DC4741F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 09:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E34206ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 09:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1gJI2R+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aUSm5LzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E34206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oqtzux8/8thVCIgz84YzFzs/l0N4IuLo/wD3MeWBZTU=; b=Q1gJI2R+yFzFhEgL2QRNSz6VXZ
	KLHC6VA9WdQ2H2GJuUA4teg125/nMJ6DuYfTCEkBzI+Gdu5T/V8LltphTlEKmjyaIRshpsEGKhqJk
	EqpwYawe4IiVMHuZnL5/7GKtVF0+7Tza9Gp9AiU20d3YwJzPmBipuPC1FnZMsdklzU+A7DxBdlfuj
	NbQ9GzyKahoq7gZ62ZbgrayUdn1mWhI2TpSuQgSXWoK5x1KDQypq+mVKMPyQlQqBVZGCtjiMz75oB
	FnTP9N5vTI9Z04uNrS9p2PZpqXiFqoFpmcIhfy6EeoYr3DruR4qLZZql6O06/MUtxf4fa4gqhsnX4
	DW7ILKOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc3by-0006k7-9Z; Mon, 09 Nov 2020 09:37:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc3bw-0006j8-4u; Mon, 09 Nov 2020 09:37:17 +0000
X-UUID: 49b3de6712dc458aba809b4d2bdd02ce-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=y18PdOi4AAYhrSttdKfUyYbFn/VzBQNwj5oUxyKSku8=; 
 b=aUSm5LzEOcmmlkpLQNc3aUnoBvMulocdAIaCV6qXRPWFOaiD1APDYmIwUDzdxLoIr6HIlAJbcuR40ER2mHZRD64sBaxIM0Wad721m/aL50nJO0k6w1nK0KtVZRt75d5/w9/hP0PbxkbiaInoyqsBvyxVozz8vIC4JGd5JGCE7Bg=;
X-UUID: 49b3de6712dc458aba809b4d2bdd02ce-20201109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 80126527; Mon, 09 Nov 2020 01:37:11 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 01:37:09 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 17:37:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 17:37:08 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: mediatek: fix mtk_clk_register_mux() as static function
Date: Mon, 9 Nov 2020 17:37:07 +0800
Message-ID: <1604914627-9203-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_043716_330627_DD19E9A5 
X-CRM114-Status: GOOD (  13.11  )
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Owen Chen <owen.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_clk_register_mux() should be a static function

Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")
Cc: <stable@vger.kernel.org>
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
