Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E9C6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sL9kXrTMDCO4yvK2qt/npaInteWU0HXqLCHCfKa0eqk=; b=yBNswSJQzkoIKZ99JdToBbM+bi
	vFSltCUPhawl/JLHaInu3orzv6yKTZu2VhKyG322YWkOUspoUSNiRKBE9T7mQ47oIaVXjjLgvr9rM
	U+a5mTMMgpPu1tDawyGFbuoqj/UqHp7r5rFDDncOgq6KqcI2NjBtrMWdDWsQz0HmXo8Zrd/Mmz74f
	cn65jZNvN1tS9IfClMq3KkFgkKwHufeAWbiUfURmp4oaCd3u7is5VdQ8v34M6MGtsfGB3kSclB1sS
	qrcKeAcnGWGP9WJQTovEkK0dIWTaaf84zK5Wh16BUTmOBkRfu+byZ+tWFT3X94P2kbz6UXOQ4nicw
	Hp35SOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVF4e-006w5Z-7t; Mon, 05 Sep 2022 16:35:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCP3-003Oxz-B2; Mon, 05 Sep 2022 13:44:43 +0000
X-UUID: f680e40928cd4deba77e0c416092de0e-20220905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sL9kXrTMDCO4yvK2qt/npaInteWU0HXqLCHCfKa0eqk=;
	b=a7jXxT4Lf6AVUQL38GUCh7ilgyhJU+RCRuxIweHew8vfnj+4aeZZtoHgbYqBv7Upz+9dVVh7xvOqf52G0rVV6MNGHOadrp7qziI3jipdf1hcyXA0oRp5K2+Fzy6P//Z5mcOAz2t4VLGxylVQiDKqokwgawM2PsXsUhCHNaC7UnU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:65cf1e3e-6392-424b-8f2e-c1e98954aba9,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:79fcbcd0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f680e40928cd4deba77e0c416092de0e-20220905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1558416818; Mon, 05 Sep 2022 06:44:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Sep 2022 21:34:28 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 5 Sep 2022 21:34:28 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<rex-bc.chen@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<chunkuang.hu@kernel.org>, <yongqiang.niu@mediatek.com>,
	<p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v5,1/2] soc: mediatek: Add mmsys func to adapt to dpi output for MT8186
Date: Mon, 5 Sep 2022 21:34:22 +0800
Message-ID: <1662384863-17281-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1662384863-17281-1-git-send-email-xinlei.lee@mediatek.com>
References: <1662384863-17281-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_064441_725349_1E583D86 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add mmsys func to manipulate dpi output format config for MT8186.

Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: Nílas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/soc/mediatek/mt8186-mmsys.h    |  1 +
 drivers/soc/mediatek/mtk-mmsys.c       | 16 ++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index eb1ad9c37a9c..3db0806647c3 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -3,6 +3,7 @@
 #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
 #define __SOC_MEDIATEK_MT8186_MMSYS_H
 
+#define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
 #define MT8186_MMSYS_OVL_CON			0xF04
 #define MT8186_MMSYS_OVL0_CON_MASK			0x3
 #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 06d8e83a2cb5..d7d17d4a9a5d 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -227,6 +227,22 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl_relaxed(mmsys->regs + offset);
+	tmp = (tmp & ~mask) | val;
+	writel_relaxed(tmp, mmsys->regs + offset);
+}
+
+void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 mask, u32 val)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT, mask,
+			      val);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 59117d970daf..7a378d247505 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -65,4 +65,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
 
+void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 mask, u32 val);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


