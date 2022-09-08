Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535CCC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0UoEd5b55tCizD086zkm12TKFfpaeGwDnJSOjTxJDLI=; b=nX0FkK14ze+NAWE/Q1yTChvwmT
	MT8hofEIoT9H5qT2jwIm5BrvdiLB5ER/fcxCaPd9GViVFGdW+OAupMrZ0eEFWJMrRN6yaLmqHQl0Z
	ZJDsb/PqFgyoTifr494c81BdeJhjw4OPGBW54oZTnvn9K7BguKuphhKrilXY2TfSFnwZh1iNjdLxL
	8qaVwQfcZItXCj69gNeYs91LzxFa3t6RnFKLTcGMpHSXFTrvA7gSCwZ1/WRB1gZlo04cFvpQGdhDy
	57Mnbp0DUS/5GOhAiH1cwt+A54CJYuRmuNE75cLAhd6ZK2oQmpKO6dafVcPtrv2O86CEA9C9jYE+w
	XSzN9vEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIKA-004WNH-V2; Thu, 08 Sep 2022 14:16:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIK4-004WEW-NK; Thu, 08 Sep 2022 14:16:09 +0000
X-UUID: 5d8eee40345a4fb4bc025649d19a5de7-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0UoEd5b55tCizD086zkm12TKFfpaeGwDnJSOjTxJDLI=;
	b=VYFvXij/ELxMrPdDtafm0fyQczUnjapkfwMJne5LulYQxF60B1mEOBsnvFFLrOvoApwnQIz6t1jCtrAN9NvZ7CrWL6QALTsQuoscIEZgqEUH7rR/wn4q6mzZo7rM93j5jmYcI/OFefPP9H1VcCckvqQT50ZuOxDGHspbSIG73aI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d43bf7e7-3d90-466f-bb44-d4d3f66648ba,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:ef9ed5eb-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5d8eee40345a4fb4bc025649d19a5de7-20220908
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 68152473; Thu, 08 Sep 2022 07:12:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 22:12:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Sep 2022 22:12:07 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH] drm/mediatek: Fix wrong dither settings
Date: Thu, 8 Sep 2022 22:12:05 +0800
Message-ID: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_071604_793588_DE90EF1C 
X-CRM114-Status: GOOD (  11.79  )
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

The width and height arguments in the cmdq packet for mtk_dither_config()
are inverted. We fix the incorrect width and height for dither settings
in mtk_dither_config().

Fixes: 73d3724745db ("drm/mediatek: Adjust to the alphabetic order for mediatek-drm")
Co-developed-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 2d72cc5ddaba..6b6d5335c834 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -157,7 +157,7 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
 	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_DITHER_CFG);
 	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
-- 
2.18.0


