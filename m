Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE03CC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 13:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C9661353
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 13:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90C9661353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nvuvdnHckAZbB3QNfvbUhRxwws48WhVnomUXX+gVTts=; b=nvl2fzGE1GNiO4
	qLLLPO6zhWQ7nejFDN28yWfR27qD/u7U2SKTVWKQeXS5bfNsPiyROk4CSpoLKQFCE13E8F2dR0X7+
	IH0kXD4kmXKcMdg4VT6A480/ZpFhMmUf/vcfIDmnw8+GxBlePC3MmP0mPK2hTVCB9dwJzP7WTcfvB
	2imOErUME+QcKd1ihP63TJiXQnJxgB5B9KCluB70VIChFVEL00SebdVs4JRpABKB/2MrZnFppr8Sc
	oryiJju91ZTO5BgEjZaM3aDTwPy1q+7gG1bEXJBtJ9XOB3F0c/pDzey4kCDEh56QMz9SEbh8w8Epc
	q0n/8OdnA5cafdthEWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2Cym-003gxb-Cc; Sat, 10 Jul 2021 13:25:12 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2CyZ-003gwZ-Eq; Sat, 10 Jul 2021 13:25:01 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
 by mxout1.routing.net (Postfix) with ESMTP id 2986F3FD96;
 Sat, 10 Jul 2021 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1625923491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wJMDjXBafhvNxiRagDqsC9dExnn1uVvik0Aoqi/lvZI=;
 b=ruW1qKc5g+v4UdI4glw06pkfB6z/CEmSNZ2fbqGvtkz5r8U2uPBmt2o81uf0x9Qar5Jyoc
 h8npIE7M/MrDu5bN6K18ta6p/uyENMSxDR723doL4+UYGpniOaFqjcxvsEVMVJn14HqK2H
 pYp8a3n0BgMdnU3P4umwQUYF4N05Ml4=
Received: from localhost.localdomain (fttx-pool-217.61.146.228.bambit.de
 [217.61.146.228])
 by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 429C94005D;
 Sat, 10 Jul 2021 13:24:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] soc: mediatek: mmsys: fix HDMI output on mt7623/bananapi-r2
Date: Sat, 10 Jul 2021 15:24:31 +0200
Message-Id: <20210710132431.265985-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 1f821dd4-763b-4f4a-a1cd-dc3fe34c2e99
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_062459_838482_EDCF79DE 
X-CRM114-Status: GOOD (  12.63  )
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

From: Frank Wunderlich <frank-w@public-files.de>

HDMI output was broken on mt7623/BPI-R2 in 5.13 because function for
special output selection (mtk_mmsys_ddp_sout_sel) was dropped.
This function wrote 3 registers at one time and so it is not compatible
with the array-approach.

I re-added the old function and call this after the default routing table
was applied. This default routing table can still be used as the only
connection handled by mmsys on BPI-R2 is OVL0->RDMA0 and this is already
present in the default routing table

Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/soc/mediatek/mtk-mmsys.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 080660ef11bf..f91b7fdd417a 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,25 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 };
 
+static void mtk_mmsys_ddp_sout_sel(struct device *dev,
+				   enum mtk_ddp_comp_id cur,
+				   enum mtk_ddp_comp_id next)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+
+	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
+		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
+			       mmsys->regs + DISP_REG_CONFIG_OUT_SEL);
+	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
+		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
+			       mmsys->regs + DISP_REG_CONFIG_OUT_SEL);
+		writel_relaxed(DSI_SEL_IN_RDMA,
+			       mmsys->regs + DISP_REG_CONFIG_DSI_SEL);
+		writel_relaxed(DPI_SEL_IN_BLS,
+			       mmsys->regs + DISP_REG_CONFIG_DPI_SEL);
+	}
+}
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
@@ -71,6 +90,8 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 			reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
 			writel_relaxed(reg, mmsys->regs + routes[i].addr);
 		}
+
+	mtk_mmsys_ddp_sout_sel(dev, cur, next);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
