Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051E7C004D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 06:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tACJKT8XgvyTiNyQ1SOAHE7Bfy7mW7GpFKNZHBdrIsc=; b=sTEjL/0aWDIpzcN75NuQkWrqDV
	w4fYckPNAqWz2Kzh8pWHKqerZOgi4GcqAFs5yIrzQL5if/CVIi+Q+cSpXNLbR1KK+Gcfu1lT97sT+
	dvv0KOdFfJraBTqaxaoUUo+LCtyuuyjW5/81keCh8iw+2YJcq01BYpsTpNEh5SWwGwLS/sKWVyAoa
	5f329gcGyf64HM9+X1RssyHfQGLWDR4Z51G8GBO3kLUMhtfgHum+jDVHcRXCLeRcYRSDIiSamp5tw
	OXkCcrxVwnTjMa26hISExBiZO4uzbK73XIhDWOPEB1yCAj2GnjLQzTufogQvi1jMvBLfHIfehURz4
	xmxbyF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1om-00H49i-E7; Wed, 18 Jan 2023 06:21:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1ob-00H47E-SW; Wed, 18 Jan 2023 06:20:55 +0000
X-UUID: 3e26887696f811edbbe3f76fe852e059-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tACJKT8XgvyTiNyQ1SOAHE7Bfy7mW7GpFKNZHBdrIsc=;
	b=WulrVUUiwH0GPjyLa6FPu/WLh1uhjphVYHT8LHvLBIwmPOamMcrymudI4HPo6DW62rH1t1UYx0DUGmXvr9Bh5FEwQSHlHX+urutuNoMlVKJhBKs4ZCI/uj9D3/jxCysw+wc0QBMmeXk1XFdb2l8nl753QAp3dJ+HMKqV/F8GV34=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:798ef059-1805-4c0c-baae-8c8ef428ae25,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:1eb024f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 3e26887696f811edbbe3f76fe852e059-20230117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 95577842; Tue, 17 Jan 2023 23:20:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 14:20:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 14:20:42 +0800
From: Guodong Liu <Guodong.Liu@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Light
 Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu
	<Guodong.Liu@mediatek.com>
Subject: [PATCH 2/2] pinctrl: mediatek: Initialize variable *buf to zero
Date: Wed, 18 Jan 2023 14:20:36 +0800
Message-ID: <20230118062036.26258-3-Guodong.Liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
References: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_222053_943463_8D65B9B1 
X-CRM114-Status: GOOD (  13.13  )
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

Coverity spotted that *buf is not initialized to zero in
mtk_pctrl_dbg_show. Using uninitialized variable *buf as argument to %s
when calling seq_printf. Fix this coverity by initializing *buf as zero.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration
dump via debugfs.")
Signed-off-by: Guodong Liu <Guodong.Liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index e736c1610f3c..d2fbfffda038 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -714,7 +714,7 @@ static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 			  unsigned int gpio)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
-	char buf[PIN_DBG_BUF_SZ];
+	char buf[PIN_DBG_BUF_SZ] = { 0 };
 
 	(void)mtk_pctrl_show_one_pin(hw, gpio, buf, PIN_DBG_BUF_SZ);
 
-- 
2.25.1


