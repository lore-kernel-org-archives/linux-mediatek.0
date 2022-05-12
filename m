Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7977BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPHCiwwc6prag903FQ2O3O2vVGJkYM3acF7gsyH7PEM=; b=C/klTZtXBCUwfb
	kV+0pCACL7eBVC16qyVksjs0esjsFHkJfBav+Gd3ZF/kNYF30ANoUgTrmwOwZ9uPIlq2Idyf42Dew
	nsBhRSIxSwdLWfDRlNN9u1OseFY7ePUID2yXq2H1K0UBT+rODodNugKWO4eYmv2+DDVtwVKQnBv2i
	1a6agid8par0c4zdveyWVEx1zlOGcBVLRxWjDxOJPW/Z2KJ2uk3Qxp6rqv0OzXRo+EdxjK2qqHm/m
	v6IdMM1zF6OAyaW10LOJoCi5UrB6E8YuRXSaHijU+SAEdZ6Mix0RNdh0PaSEGXD1ATBOUpwheDqju
	/W4pfsqiO5+GFJwffUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np4Ya-00B4DK-UK; Thu, 12 May 2022 08:52:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np4Y7-00B3yB-Eb; Thu, 12 May 2022 08:51:57 +0000
X-UUID: 1d1196436ed746fab6211bc9fedf3397-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9394b167-e062-4eb5-8435-28fa84a1e267, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:85b70ba7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1d1196436ed746fab6211bc9fedf3397-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 850761248; Thu, 12 May 2022 01:51:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 01:41:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 16:41:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 16:41:41 +0800
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
Subject: [PATCH v18 6/6] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
Date: Thu, 12 May 2022 16:41:39 +0800
Message-ID: <20220512084139.15086-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220512084139.15086-1-moudy.ho@mediatek.com>
References: <20220512084139.15086-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_015155_530007_2E3D6FC5 
X-CRM114-Status: GOOD (  19.29  )
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

Due to HW limitations, MDP3 is necessary to enable MUTEX in each frame
for SOF triggering and cooperate with CMDQ control to reduce the amount
of interrupts generated(also, reduce frame latency).

In response to the above situation, a new interface
"mtk_mutex_enable_by_cmdq" has been added to achieve the purpose.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 47 +++++++++++++++++++++++++-
 include/linux/soc/mediatek/mtk-mutex.h |  2 ++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 92afdee14d43..4ec2954f2f43 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -7,10 +7,12 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
@@ -176,6 +178,9 @@ struct mtk_mutex_ctx {
 	void __iomem			*regs;
 	struct mtk_mutex		mutex[10];
 	const struct mtk_mutex_data	*data;
+	phys_addr_t			addr;
+	struct cmdq_client_reg		cmdq_reg;
+	bool				has_gce_client_reg;
 };
 
 static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
@@ -531,6 +536,30 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_enable);
 
+int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (!mtx->has_gce_client_reg) {
+		dev_err(mtx->dev, "mediatek,gce-client-reg hasn't been set in dts");
+		return -EINVAL;
+	}
+
+	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
+		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
+	return 0;
+#else
+	dev_err(mtx->dev, "Not support for enable MUTEX by CMDQ");
+	return -ENODEV;
+#endif
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
+
 void mtk_mutex_disable(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
@@ -655,8 +684,11 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_mutex_ctx *mtx;
-	struct resource *regs;
+	struct resource *regs, addr;
 	int i;
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	int ret;
+#endif
 
 	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
 	if (!mtx)
@@ -676,6 +708,19 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
+		mtx->addr = 0L;
+	else
+		mtx->addr = addr.start;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
+	else
+		mtx->has_gce_client_reg = true;
+#endif
+
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mtx->regs = devm_ioremap_resource(dev, regs);
 	if (IS_ERR(mtx->regs)) {
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index f174452212d6..80425ae19fb7 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -29,6 +29,8 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
+int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
+			     void *pkt);
 void mtk_mutex_disable(struct mtk_mutex *mutex);
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
