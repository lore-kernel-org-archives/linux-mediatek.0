Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C98C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 06:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xl9uNcBrw3Vmtg1w/FcYaIZ6zySf0q2s0TLi/46eDqU=; b=jBXShHhwChzMXs
	/pWVMoPITWNuuufISBseBBBVHegnmRXQsDjqGDF7rkOsiULrS00udBFbNbgvZ16QE0MQhGpPkxYRd
	fYsIA+1lFwTFr0sOthr0Z6e8YHcoQHgAJG1P+WLMADiPpp9mok4EUmqAXf42hD97eMPta0NWpl5T/
	DGnllfKl6ox7HtKiDpt/l37r+r5lN61vsXpVbHZfUqVnrhpklAwCg20fwneHfHbM2xiRx151TiUCe
	BV+lvSIAY4UEEWOWNEPhD6HqtYMba54+1xVEKhAtqigOEAMs3LIxgVOgZ4PXnu7T3SokKeTHgDTm6
	w9/q8+iIL3lp3IbpQQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvuy3-009TUC-Ao; Tue, 31 May 2022 06:02:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvuxe-009TLL-8M; Tue, 31 May 2022 06:02:36 +0000
X-UUID: fc85833f6e04452da411169000f92d00-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:9d869ae2-fe11-459f-85ff-56058fca6958,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:1d315814-f88c-475e-badf-d9ee54230b8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: fc85833f6e04452da411169000f92d00-20220530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1722997868; Mon, 30 May 2022 23:02:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 22:52:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 May 2022 13:52:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 31 May 2022 13:52:25 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
	<river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Subject: [PATCH v19 1/6] soc: mediatek: mutex: add common interface for modules setting
Date: Tue, 31 May 2022 13:52:19 +0800
Message-ID: <20220531055224.19280-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220531055224.19280-1-moudy.ho@mediatek.com>
References: <20220531055224.19280-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_230234_358337_034175B9 
X-CRM114-Status: GOOD (  16.97  )
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

In order to allow multiple modules to operate MUTEX hardware through
a common interfrace, two flexible indexes "mtk_mutex_mod_index" and
"mtk_mutex_sof_index" need to be added to replace original component
ID so that like DDP and MDP can add their own MOD table or SOF
settings independently.

In addition, 2 generic interface "mtk_mutex_write_mod" and
"mtk_mutex_write_sof" have been added, which is expected to replace
the "mtk_mutex_add_comp" and "mtk_mutex_remove_comp" pair originally
dedicated to DDP in the future.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 59 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h | 26 ++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 981d56967e7a..a3b054b33826 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -185,6 +185,7 @@ struct mtk_mutex_data {
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
+	const unsigned int *mutex_table_mod;
 	const bool no_clk;
 };
 
@@ -606,6 +607,64 @@ void mtk_mutex_release(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_release);
 
+int mtk_mutex_write_mod(struct mtk_mutex *mutex,
+			enum mtk_mutex_mod_index idx, bool clear)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	unsigned int offset;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx < MUTEX_MOD_IDX_MDP_RDMA0 ||
+	    idx >= MUTEX_MOD_IDX_MAX) {
+		dev_err(mtx->dev, "Not supported MOD table index : %d", idx);
+		return -EINVAL;
+	}
+
+	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+				    mutex->id);
+	reg = readl_relaxed(mtx->regs + offset);
+
+	if (clear)
+		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
+	else
+		reg |= BIT(mtx->data->mutex_table_mod[idx]);
+
+	writel_relaxed(reg, mtx->regs + offset);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_write_mod);
+
+int mtk_mutex_write_sof(struct mtk_mutex *mutex,
+			enum mtk_mutex_sof_index idx, bool clear)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int val;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx < MUTEX_SOF_IDX_SINGLE_MODE ||
+	    idx >= MUTEX_SOF_IDX_MAX) {
+		dev_err(mtx->dev, "Not supported SOF index : %d", idx);
+		return -EINVAL;
+	}
+
+	if (clear)
+		val = MUTEX_SOF_SINGLE_MODE;
+	else
+		val = idx;
+
+	writel_relaxed(val, mtx->regs +
+		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_write_sof);
+
 static int mtk_mutex_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 6fe4ffbde290..829231523e3f 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -10,6 +10,26 @@ struct regmap;
 struct device;
 struct mtk_mutex;
 
+enum mtk_mutex_mod_index {
+	/* MDP table index */
+	MUTEX_MOD_IDX_MDP_RDMA0,
+	MUTEX_MOD_IDX_MDP_RSZ0,
+	MUTEX_MOD_IDX_MDP_RSZ1,
+	MUTEX_MOD_IDX_MDP_TDSHP0,
+	MUTEX_MOD_IDX_MDP_WROT0,
+	MUTEX_MOD_IDX_MDP_WDMA,
+	MUTEX_MOD_IDX_MDP_AAL0,
+	MUTEX_MOD_IDX_MDP_CCORR0,
+
+	MUTEX_MOD_IDX_MAX		/* ALWAYS keep at the end */
+};
+
+enum mtk_mutex_sof_index {
+	MUTEX_SOF_IDX_SINGLE_MODE,
+
+	MUTEX_SOF_IDX_MAX		/* ALWAYS keep at the end */
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
@@ -22,5 +42,11 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex);
 void mtk_mutex_put(struct mtk_mutex *mutex);
 void mtk_mutex_acquire(struct mtk_mutex *mutex);
 void mtk_mutex_release(struct mtk_mutex *mutex);
+int mtk_mutex_write_mod(struct mtk_mutex *mutex,
+			enum mtk_mutex_mod_index idx,
+			bool clear);
+int mtk_mutex_write_sof(struct mtk_mutex *mutex,
+			enum mtk_mutex_sof_index idx,
+			bool clear);
 
 #endif /* MTK_MUTEX_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
