Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F43C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 03:17:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F5922573
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 03:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F5922573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QM06qvi25fjPJOScbwTeWRkCiVGXHgTx5ppXQ5N1eVY=; b=1Tp70UFfOfC4R1R9xfXMOCVFC
	w1Odb4WvM+p3E3v1Q6DQZPTuQ1AHngphYz3NzDTcbCEFiVOefv3dT1U2rEIOOn7fezOafpuMA0bHg
	QzaegNu8d/xlJ4yEs3UXg9moqDTSmY/onGtipJLUrbi6rMbyE4iLgK/DaswrZ+BxWD3NcYQ+b5E4x
	C3wNcxQVr0+1zbhxG1edpWW7UlZKMlG6VEgBoIWxht2jZ7LPbl2uUqpD+BBtMVe7ScHe9H5BXDCkx
	LLc6Ha0zoPzdYbmRn9bvsCER4BUaHsBPX4FqK3WWGJumfrNF93FOvwLrabB8UJFld0SOy182hc7Zg
	eS/pprtCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwcqC-0002l1-Jx; Tue, 05 Jan 2021 03:17:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwcq9-0002jb-LI; Tue, 05 Jan 2021 03:16:59 +0000
X-UUID: 276093d527324eb78f08bccaa9b257f6-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KRQ/2vvL5Wzl7xTmRwNIO5OLPthloxX2wCigE3PUva8=; 
 b=LzpRrHPSPFXFKcYh1J0BYaQdC6pAKuwCUKO0Rm6DXqzKfbp+1ThZC3AHznBRfKTZKL1uTGxffMU9YR19+MRWvEgIEXO/l8OrAFZd5JPlGkXOlNmuBv77T/KE/GKBw+dSYvb8I78cZyxPzJxhDYEx1W2kaPgwyw/YEBdk/uYjG6I=;
X-UUID: 276093d527324eb78f08bccaa9b257f6-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1689614900; Mon, 04 Jan 2021 19:16:53 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 19:06:51 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 11:06:49 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 11:06:48 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 09/10] soc: mediatek: mmsys: Use function call for setting mmsys ovl
 mout register
Date: Tue, 5 Jan 2021 11:06:32 +0800
Message-ID: <1609815993-22744-10-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_221657_962192_398B4B54 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use function call for setting mmsys ovl mout register

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/mtk-mmsys.c | 6 ++++++
 include/linux/soc/mediatek/mtk-mmsys.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index 075d356..34728ed 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -68,6 +68,9 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 
 	if (funcs->sel_in)
 		funcs->sel_in(mmsys->regs, cur, next, true);
+
+	if (funcs->ovl_mout_en)
+		funcs->ovl_mout_en(mmsys->regs, cur, next, true);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -86,6 +89,9 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 	if (funcs->sel_in)
 		funcs->sel_in(mmsys->regs, cur, next, false);
+
+	if (funcs->ovl_mout_en)
+		funcs->ovl_mout_en(mmsys->regs, cur, next, false);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 2c11617..19318d2 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -50,6 +50,10 @@ struct mtk_mmsys_conn_funcs {
 			enum mtk_ddp_comp_id cur,
 			enum mtk_ddp_comp_id next,
 			bool enable);
+	void (*ovl_mout_en)(void __iomem *config_regs,
+			    enum mtk_ddp_comp_id cur,
+			    enum mtk_ddp_comp_id next,
+			    bool enable);
 	void (*sel_in)(void __iomem *config_regs,
 		       enum mtk_ddp_comp_id cur,
 		       enum mtk_ddp_comp_id next,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
