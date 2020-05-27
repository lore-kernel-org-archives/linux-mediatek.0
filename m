Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E99C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 06:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92E12078C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 06:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WXHqzYSv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qa3bSPrv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B92E12078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g8Xz4H+gFiKxSc2hcQTRYOvZuRdu0CNuX2zGhQwLhbo=; b=WXHqzYSvTbn+wu
	qzZh2ahs4aJTQ/IocecMvuYrzjNz/JvQ+ziAXFl/gIeCIDpcMvq37JhcKckC3mplgq2M3RIeLarJR
	09u/EGFQTRgMTxsdEaARkfYErRmbswGF4UwoEtE49yciqz1XASSBVhyvJsvdw3pg/gSdH4o8Dvolo
	bC2x22HLR2T/8Gy1FeM6KLlJ/kGSOeBQXJiBCNCfXtMxS7tqbWRNiJky2nUeBs3D1ueEIxWD3tS4s
	U0dwkpNepsOiYChWHzQkftwRCNAUcnzIupcV/BJkvqOjr54xA/IPmTX6BzQz7n4iSJ3fvPiZYWjU8
	qYMi4KS/pssxw5sFiZRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdpW9-0005ih-PX; Wed, 27 May 2020 06:26:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdpVy-0005ZQ-MG; Wed, 27 May 2020 06:26:12 +0000
X-UUID: f015e84058bb43428e434ba0bdb2fae5-20200526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3JgPtKgRdy8ddR7xtaWXijDFOHGnyaGurBt3CDZDbJc=; 
 b=qa3bSPrvl0ZaXE29kjfi/OCbwK/CBns3iU/bn193BTzTIC8m9KXM7e+ODSYjAyw4m/MhHBZ64uESU0j3wJdPRzr2SXv3k15qGdBMpe6favG1RWr12y3QHPawBEzy0oMy/v1gokoVwDoouJLug0hDk5423JdQnefmWRUEb6k0DFA=;
X-UUID: f015e84058bb43428e434ba0bdb2fae5-20200526
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1518370596; Tue, 26 May 2020 22:25:54 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 May 2020 23:25:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 14:25:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 May 2020 14:25:52 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] clk: mediatek: assign the initial value to clk_init_data
 of mtk_mux
Date: Wed, 27 May 2020 14:25:49 +0800
Message-ID: <1590560749-29136-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: BFDC40E46F0324815F4D3721A56AD387881A75494A619CD8E2BD5B4CD48C0DC62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_232610_731022_FEBD8D5D 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Owen Chen <owen.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When some new clock supports are introduced, e.g. [1]
it might lead to an error although it should be NULL because
clk_init_data is on the stack and it might have random values
if using without initialization.
Add the missing initial value to clk_init_data.

[1] https://android-review.googlesource.com/c/kernel/common/+/1278046

Fixes: a3ae549917f1 ("clk: mediatek: Add new clkmux register API")
Cc: <stable@vger.kernel.org>
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clk/mediatek/clk-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 76f9cd0..14e127e 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -160,7 +160,7 @@ struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 				 spinlock_t *lock)
 {
 	struct mtk_clk_mux *clk_mux;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *clk;
 
 	clk_mux = kzalloc(sizeof(*clk_mux), GFP_KERNEL);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
