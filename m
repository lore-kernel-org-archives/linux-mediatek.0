Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7AFC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:38:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FF776128C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FF776128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+gm1aApM2gYmaiHZ7ltn6ihTYltI/D88+pEYElIWYo=; b=lUUyzdDDX+UfH9
	w996DGoBZZ/hIok8QFDJaC8U6fzX7OiV6qr7fxwnd0poahYYd/J1vErmFL+0vUPHQyjTjmv1aX8lc
	Wf8cJZzCo8V9dYNDHR3itzUb3lWMiwBUhuIjX3q7EaJYmODdCfL0DYWFXbgtZ5Z5dBnBlVQkfyQaI
	FKMD+wz6Oy26XolWyzwxApoj/NqBrPE5KunysYGbKqaeej/ObXP9psu6sL1Y2ThQ7I5lvLZa3gxZm
	bZbYnrGGQ8+E3mLzdtsh0S3ILMDhtL7cZ6M+Ekgi/3WyyeJJffZr37YTwSX38b5s3Tt3hmZA0HsDi
	j0ho11tRmI8K85BM2Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxSX-009o9u-2B; Wed, 23 Jun 2021 07:38:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxQf-009n8u-Ny; Wed, 23 Jun 2021 07:36:11 +0000
X-UUID: 925565813e954eda9021c69332734820-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wsai4tlhSTfNyC+k/o4acX2auPdu227NMt8ySxUAn58=; 
 b=uhq1Q5i60BFNwtNN0p1BnAFIxMPIsOyp5JffzcwjP+FOHjOQzsFKnuX/fHp+cfV6doZmuPlQmMWG4nFEKA1YO+NH7tIMFHlb0mB0kjTnFeCz0tTDGtqr378Z8/bmx9whCNBa7VsAMFy21o9940MskSCyG+jq7EiTtCY4KEN6Hj8=;
X-UUID: 925565813e954eda9021c69332734820-20210623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 796444035; Wed, 23 Jun 2021 00:36:00 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:35:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 15:35:57 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <ben.lok@mediatek.com>, <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
 <srv_heupstream@mediatek.com>, <frederic.chen@mediatek.com>
Subject: [RFC PATCH V0 08/10] media: mtk-mdp3: remove illegal device node usage
Date: Wed, 23 Jun 2021 15:35:47 +0800
Message-ID: <20210623073549.24170-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_003609_864768_942BDF6C 
X-CRM114-Status: GOOD (  25.63  )
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

This patch is used for review before send upstream patch.
From Rob Herring's review comment: device node can't use same
register address as other nodes'.
Remove illegal device nodes in device tree.
MDP's sub component init need to do corresponding modification.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 224 +++++++++++++-----
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   2 +-
 2 files changed, 163 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 157ef9408ed3..e89fd02bb556 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -1016,23 +1016,15 @@ static const struct of_device_id mdp_comp_dt_ids[] = {
 	{}
 };
 
-static int mdp_comp_get_id(struct device *dev, struct device_node *node,
-			   enum mdp_comp_type type)
+static int mdp_comp_get_id(enum mdp_comp_type type, u32 alias_id)
 {
-	u32 alias_id;
-	int i, ret;
-
-	ret = of_property_read_u32(node, "mediatek,mdp-id", &alias_id);
-	if (ret)
-		return ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(mdp_comp_matches); i++)
 		if (mdp_comp_matches[i].type == type &&
 		    mdp_comp_matches[i].alias_id == alias_id)
 			return i;
-
-	dev_err(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
-	return -EINVAL;
+	return -ENODEV;
 }
 
 void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
@@ -1143,33 +1135,10 @@ static void __mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 	comp->reg_base = base;
 }
 
-static int mdp_mm_init(struct mdp_dev *mdp,
-		       struct mdp_comp *comp, const char *ref_name)
+static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
+			 struct mdp_comp *comp, enum mdp_comp_id id)
 {
-	struct device_node *node;
 	struct device *dev = &mdp->pdev->dev;
-
-	node = of_parse_phandle(dev->of_node, ref_name, 0);
-	if (!node) {
-		dev_err(dev, "Failed to parse dt %s\n", ref_name);
-		return -EINVAL;
-	}
-
-	__mdp_comp_init(mdp, node, comp);
-	mdp_get_subsys_id(dev, node, comp);
-	of_node_put(node);
-	if (!comp->reg_base) {
-		dev_err(dev, "Failed to init %s base\n", ref_name);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
-			 struct device_node *node, struct mdp_comp *comp,
-			 enum mdp_comp_id id)
-{
-	struct platform_device *pdev;
 	int i;
 
 	if (id < 0 || id >= MDP_MAX_COMP_COUNT) {
@@ -1191,32 +1160,140 @@ static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
 
 	mdp_get_subsys_id(dev, node, comp);
 
-	/* Only DMA capable components need the pm control */
-	comp->comp_dev = NULL;
-	if (comp->type != MDP_COMP_TYPE_RDMA &&
-	    comp->type != MDP_COMP_TYPE_WROT &&
-		comp->type != MDP_COMP_TYPE_WDMA)
-		return 0;
+	return 0;
+}
 
-	pdev = of_find_device_by_node(node);
-	if (!pdev) {
-		dev_warn(dev, "can't find platform device of node:%s\n",
-			 node->name);
-		return -ENODEV;
+static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
+					struct device_node *node,
+					enum mdp_comp_id id)
+{
+	struct device *dev = &mdp->pdev->dev;
+	struct mdp_comp *comp;
+	int ret;
+
+	if (mdp->comp[id])
+		return ERR_PTR(-EEXIST);
+
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+	if (!comp)
+		return ERR_PTR(-ENOMEM);
+
+	ret = mdp_comp_init(mdp, node, comp, id);
+	if (ret) {
+		kfree(comp);
+		return ERR_PTR(ret);
 	}
+	mdp->comp[id] = comp;
+
+	dev_info(dev, "%s type:%d alias:%d id:%d base:%#x regs:%p\n",
+		dev->of_node->name, comp->type, comp->alias_id, id,
+		(u32)comp->reg_base, comp->regs);
+	return comp;
+}
 
-	comp->comp_dev = &pdev->dev;
-	pm_runtime_enable(comp->comp_dev);
+static int mdp_sub_comps_create(struct mdp_dev *mdp, struct device_node *node)
+{
+	struct device *dev = &mdp->pdev->dev;
+	struct property *prop;
+	const char *name;
+	int index = 0;
+
+	of_property_for_each_string(node, "mdp-comps", prop, name) {
+		const struct of_device_id *matches = mdp_comp_dt_ids;
+		enum mdp_comp_type type = MDP_COMP_NONE;
+		u32 alias_id;
+		int id, ret;
+		struct mdp_comp *comp;
 
+		for (; matches->compatible[0]; matches++) {
+			if (of_compat_cmp(name, matches->compatible,
+				strlen(matches->compatible)) == 0) {
+				type = (enum mdp_comp_type)matches->data;
+				break;
+			}
+		}
+
+		ret = of_property_read_u32_index(node, "mdp-comp-ids",
+			index, &alias_id);
+		if (ret) {
+			dev_warn(dev, "Skipping unknown component %s\n", name);
+			return ret;
+		}
+
+		id = mdp_comp_get_id(type, alias_id);
+		if (id < 0) {
+			dev_err(dev, "Failed to get component id: "
+				"%s type %d, alias %d\n", name, type, alias_id);
+			return -ENODEV;
+		}
+
+		comp = mdp_comp_create(mdp, node, id);
+		if (IS_ERR(comp))
+			return PTR_ERR(comp);
+
+		index++;
+	}
 	return 0;
 }
 
 static void mdp_comp_deinit(struct mdp_comp *comp)
 {
-	iounmap(comp->regs);
+	if (!comp)
+		return;
+
+	if (comp->regs)
+		iounmap(comp->regs);
 	/* of_node_put(comp->dev_node); */
 }
 
+static int mdp_imgi_init(struct mdp_dev *mdp, const char *ref_name)
+{
+	struct device_node *node;
+	struct device *dev = &mdp->pdev->dev;
+	int ret;
+
+	node = of_parse_phandle(dev->of_node, ref_name, 0);
+	if (!node) {
+		dev_err(dev, "Failed to parse dt %s\n", ref_name);
+		return -EINVAL;
+	}
+
+	ret = mdp_sub_comps_create(mdp, node);
+	of_node_put(node);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mdp_mm_init(struct mdp_dev *mdp, struct mdp_comp *comp,
+		       const char *ref_name)
+{
+	struct device_node *node;
+	struct device *dev = &mdp->pdev->dev;
+	int ret;
+
+	node = of_parse_phandle(dev->of_node, ref_name, 0);
+	if (!node) {
+		dev_err(dev, "Failed to parse dt %s\n", ref_name);
+		return -EINVAL;
+	}
+
+	__mdp_comp_init(mdp, node, comp);
+	mdp_get_subsys_id(dev, node, comp);
+	if (!comp->reg_base) {
+		dev_err(dev, "Failed to init %s base\n", ref_name);
+		of_node_put(node);
+		return -EINVAL;
+	}
+
+	ret = mdp_sub_comps_create(mdp, node);
+	of_node_put(node);
+	if (ret)
+		return ret;
+	return 0;
+}
+
 void mdp_component_deinit(struct mdp_dev *mdp)
 {
 	int i;
@@ -1235,6 +1312,8 @@ int mdp_component_init(struct mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct device_node *node, *parent;
+	struct platform_device *pdev;
+	u32 alias_id;
 	int i, ret;
 
 	for (i = RDMA0_SOF; i < MDP_MAX_EVENT_COUNT; i++) {
@@ -1260,7 +1339,11 @@ int mdp_component_init(struct mdp_dev *mdp)
 
 	ret = mdp_mm_init(mdp, &mdp->mm_mutex, "mediatek,mm-mutex");
 	if (ret)
-		goto err_init_mm;
+		goto err_init_comps;
+
+	ret = mdp_imgi_init(mdp, "mediatek,imgsys");
+	if (ret)
+		goto err_init_comps;
 
 	parent = dev->of_node->parent;
 	/* Iterate over sibling MDP function blocks */
@@ -1281,27 +1364,44 @@ int mdp_component_init(struct mdp_dev *mdp)
 		}
 
 		type = (enum mdp_comp_type)of_id->data;
-		id = mdp_comp_get_id(dev, node, type);
-		if (id < 0) {
+		ret = of_property_read_u32(node, "mediatek,mdp-id", &alias_id);
+		if (ret) {
 			dev_warn(dev, "Skipping unknown component %pOF\n",
 				 node);
 			continue;
 		}
+		id = mdp_comp_get_id(type, alias_id);
+		if (id < 0) {
+			dev_err(dev,
+				"Fail to get component id: type %d alias %d\n",
+				type, alias_id);
+			continue;
+		}
 
-		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
-		if (!comp) {
-			ret = -ENOMEM;
+		comp = mdp_comp_create(mdp, node, id);
+		if (IS_ERR(comp))
 			goto err_init_comps;
-		}
-		mdp->comp[id] = comp;
 
-		ret = mdp_comp_init(dev, mdp, node, comp, id);
+		ret = mdp_sub_comps_create(mdp, node);
 		if (ret)
 			goto err_init_comps;
 
-		dev_info(dev, "%s type:%d alias:%d id:%d base:%#x regs:%p\n",
-			 of_id->compatible, type, comp->alias_id, id,
-			(u32)comp->reg_base, comp->regs);
+		/* Only DMA capable components need the pm control */
+		comp->comp_dev = NULL;
+		if (comp->type != MDP_COMP_TYPE_RDMA &&
+		    comp->type != MDP_COMP_TYPE_WROT &&
+			comp->type != MDP_COMP_TYPE_WDMA)
+			continue;
+
+		pdev = of_find_device_by_node(node);
+		if (!pdev) {
+			dev_warn(dev, "can't find platform device of node:%s\n",
+				 node->name);
+			return -ENODEV;
+		}
+
+		comp->comp_dev = &pdev->dev;
+		pm_runtime_enable(comp->comp_dev);
 	}
 	return 0;
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index f201bced3c06..f5d514a51236 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -112,7 +112,7 @@ struct mdp_comp {
 	void __iomem			*regs;
 	phys_addr_t			reg_base;
 	u8				subsys_id;
-	struct clk			*clks[2];
+	struct clk			*clks[4];
 	struct device			*comp_dev;
 	enum mdp_comp_type		type;
 	enum mdp_comp_id		id;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
