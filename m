Return-Path: <SRS0=F1mA=FQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1376C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:13:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE2223329
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE2223329
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LWIlHaSvYA4dx0V96Znq+zK/5KfLGFcNW150xgSNhuY=; b=kk3BdXaUE2uqSHokhKwZGEQM+
	j8mqYCu7Wewb9Sq2f2a+9t4jyaTusZ/4wyA4pxoV1CBze0IzTllK/gcJTUafN3PYQ9GisGxBqywJY
	rikSO1QJeOm01y1mwOflHmraEHFX5o9ReG4y5/kH/7Vakqsvnhfe1VS1GLdVNUCEgJYnGCCXINu9r
	fzvreY8lAk80HLl1GE1HNksdCdOvBrmxvBEVU+WmVsPGQrMW2LlSKOiWv3mLUTkgh3Tqbs1Ob2pgs
	aHsFoLPi2O0xnmJ0ay8aRoUOd6fu7Ru30GNLFGHmIZZlCaNsnZUBzN8YIcV+Gmmp75YZthU7y3Rfd
	tDPG6/O0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knwHb-0002bz-KK; Sat, 12 Dec 2020 04:13:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwGW-0001v2-5I; Sat, 12 Dec 2020 04:12:17 +0000
X-UUID: 2bf9ba43c1504e619f714fc0d6dac32a-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HB57uX4rZtOg60lzQGs+c2gN0eUwazi9+3B7Kl+3WKs=; 
 b=cv2/Tf47UTNGbBUuC/eiHn43A5bp1j59x0/7f8iFwyYx18onvXs7GKZaBqj3cJN+U1NOm5YBwJRHm/DSll8ntdmOYIagM8My8gBDa2Puv9j3dBgJLva27IzmSBr+ZrOaA5+GBCcwqohUyV13Y3F/xM6ckRbrDn1th7lVra1jz94=;
X-UUID: 2bf9ba43c1504e619f714fc0d6dac32a-20201211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1058543118; Fri, 11 Dec 2020 20:12:13 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 20:12:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:11 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 14/17] soc: mediatek: mmsys: Use function call for setting mmsys ovl
 mout register
Date: Sat, 12 Dec 2020 12:11:54 +0800
Message-ID: <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_231216_471392_3118F2E3 
X-CRM114-Status: GOOD (  14.11  )
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
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use function call for setting mmsys ovl mout register

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/mtk-mmsys.c | 18 ++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index cb76e64..2558b42 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -78,6 +78,15 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 		reg = readl_relaxed(mmsys->regs + addr) | value;
 		writel_relaxed(reg, mmsys->regs + addr);
 	}
+
+	if (!funcs->ovl_mout_en)
+		return;
+
+	value = funcs->ovl_mout_en(cur, next, &addr);
+	if (value) {
+		reg = readl_relaxed(mmsys->regs + addr) | value;
+		writel_relaxed(reg, mmsys->regs + addr);
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -103,6 +112,15 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 		reg = readl_relaxed(mmsys->regs + addr) & ~value;
 		writel_relaxed(reg, mmsys->regs + addr);
 	}
+
+	if (!funcs->ovl_mout_en)
+		return;
+
+	value = funcs->ovl_mout_en(cur, next, &addr);
+	if (value) {
+		reg = readl_relaxed(mmsys->regs + addr) & ~value;
+		writel_relaxed(reg, mmsys->regs + addr);
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index aa4f60e..220203d 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -49,6 +49,9 @@ struct mtk_mmsys_conn_funcs {
 	u32 (*mout_en)(enum mtk_ddp_comp_id cur,
 		       enum mtk_ddp_comp_id next,
 		       unsigned int *addr);
+	u32 (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
+			   enum mtk_ddp_comp_id next,
+			   unsigned int *addr);
 	u32 (*sel_in)(enum mtk_ddp_comp_id cur,
 		      enum mtk_ddp_comp_id next,
 		      unsigned int *addr);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
