Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD53CE668BC
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Dec 2025 18:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j17v1GY5ZUui5Rtx97+9pI639Hi6bT0WnwCtzvrtAQ=; b=X+OSnjzAgQLxRWXimy9RIKk1ll
	+00cu4J81jnZ4OP09gbyjx0+s2+GXIcEuAfYUCPC2ff5dxPbm0Lo7P5qGSRLniLm5K+tWJ0KqCZQY
	nJaaBT7PqL+g9QSzfrPMyig24KxGO0p+Lml6GZIUuX+7axBJJKaW37a8CfTmTfzcikVneRyJecwym
	SK8pB+9yQ1sjPN4hRwN+BiAB4HPcV34wmxVL4IDYPF+gTvJbSfklRjKqrBw7JAG00CAL8S3BqSguQ
	LYQx8QTFjBfTnmkDAvqHAaXUIwuAbYnOzf/+46bd6AO6+raF1WMt7hOPY/VW+rq5+lLniKhTn0HLe
	hhYyrkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX234-0000000Boxy-2NWl;
	Sat, 20 Dec 2025 18:51:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX22u-0000000Bot2-0jXD;
	Sat, 20 Dec 2025 18:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766256646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k+ps33RBoTWzNAlrymFBqhrJ55XvdVPAT3xq+aTba7zUdV7Z+/k3sFXbqkjStnwU3fKC4DLCfbfstyss83JbuvavywOY0EcDg3VIAPGHH3hBOKeMPjfB6xGPa73x19e+tvR3/xrJ+igMvn99fS524VdlG+VU1mvIh/aMxVQmBqA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766256646; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5j17v1GY5ZUui5Rtx97+9pI639Hi6bT0WnwCtzvrtAQ=; 
	b=DXXW5zq0m7GofuoNuxOsUEqA1LuHa4dN/fLdZPkE1PXL79G/77pNl7LEZ5RoXzPQJ6ptLSf8TVX25ws6N8kMHKFepV2GWyZw0sMPwxApZhcmIXUVM2QWGhKoHoqgbAMoxlBJw+mQ0RebKzWb9RnkajGbAmGyL4unhOdY/vuyfHU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766256646;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5j17v1GY5ZUui5Rtx97+9pI639Hi6bT0WnwCtzvrtAQ=;
	b=YxRCapuLlpcgveZ8ge+9Vt9yL4zoF7BeXltj21O4pBcGxMmo4PKr67dZOWJgacT9
	4LGATQCtFbN3QrbIoPAc5Wyk8dy9fLAHt1gHOZDn198/kWRImzStGT7ic1eIp2BDdU8
	EIaJSJZXXNJaG07RIi1ArCYZ4JYC0mCUo1E3Vuf4=
Received: by mx.zohomail.com with SMTPS id 1766256644626461.8229840632764;
	Sat, 20 Dec 2025 10:50:44 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 20 Dec 2025 19:49:55 +0100
Subject: [PATCH v2 4/4] pmdomain: mediatek: mtk-mfg: Expose shader_present
 as nvmem cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-mt8196-shader-present-v2-4-45b1ff1dfab0@collabora.com>
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_105118_730370_45764D42 
X-CRM114-Status: GOOD (  14.56  )
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

Implement nvmem-provider functionality in mtk-mfg-pmdomain, such that it
can expose its GF_REG_SHADER_PRESENT value in the shared memory as an
nvmem cell for panthor.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index 9bad577b3ae4..3ce6fb74dd53 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/container_of.h>
 #include <linux/iopoll.h>
+#include <linux/nvmem-provider.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -872,6 +873,60 @@ static int mtk_mfg_init_clk_provider(struct mtk_mfg *mfg)
 	return 0;
 }
 
+static int mtk_mfg_read_nvmem(void *priv, unsigned int offset, void *val, size_t bytes)
+{
+	struct mtk_mfg *mfg = priv;
+	u32 *buf = val;
+
+	if (bytes != 4)
+		return -EINVAL;
+
+	if (!mfg->shared_mem)
+		return -ENODEV;
+
+	if (offset + bytes >= mfg->shared_mem_size)
+		return -EINVAL;
+
+	*buf = readl(mfg->shared_mem + offset);
+
+	return 0;
+}
+
+static int mtk_mfg_init_nvmem_provider(struct mtk_mfg *mfg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	struct nvmem_cell_info cell = {};
+	struct nvmem_config config = {};
+	struct nvmem_device *nvdev;
+	int ret;
+
+	config.reg_read = mtk_mfg_read_nvmem;
+	config.dev = dev;
+	config.read_only = true;
+	config.priv = mfg;
+	config.size = 4;
+	config.word_size = 4;
+
+	nvdev = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvdev))
+		return dev_err_probe(dev, PTR_ERR(nvdev), "Couldn't register nvmem provider\n");
+
+	cell.name = "shader-present";
+	cell.offset = GF_REG_SHADER_PRESENT;
+	cell.bytes = 4;
+	cell.np = of_get_child_by_name(dev->of_node, cell.name);
+
+	ret = nvmem_add_one_cell(nvdev, &cell);
+	if (ret) {
+		of_node_put(cell.np);
+		return dev_err_probe(dev, ret, "Couldn't add cell %s\n", cell.name);
+	}
+
+	/* cell.np purposefully not put as nvmem_add_one_cell does not increase refcount */
+
+	return 0;
+}
+
 static int mtk_mfg_probe(struct platform_device *pdev)
 {
 	struct mtk_mfg *mfg;
@@ -984,6 +1039,10 @@ static int mtk_mfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_power_off;
 
+	ret = mtk_mfg_init_nvmem_provider(mfg);
+	if (ret)
+		goto err_power_off;
+
 	ret = of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to add pmdomain provider\n");

-- 
2.52.0


