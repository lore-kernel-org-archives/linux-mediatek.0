Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD8C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6MwPjlK9K0kWs7uUBNOwpE6Bg8Uxb2wYDRU1IIsqnKM=; b=YjVYxXfoqijbyyyrCWzxDN5ryK
	eLFzbm8Wg0Fc/+Z70BRz0x2C+9P5HsmNkikmM2s5ZtP2PI9XTdEncnlPWrl8Oisn4qU39WTumdKgK
	w+OVHkPzA2m0l9bxFmDknkHfvsIhV6htm1ma0XzQECZzvPF99cSbVATb4edvCz+pwilhnIzNYCF4b
	PG832P3tCysvaSK5ER+jSnvwG1wDTUBf+rL8qO6iwRMuXMreUrT1mFrj+xtbuj60TZxeAmVN+hD4Y
	91i4oz8rnlgVe+el32jhGALQhw2i3kLr/zrOxWi6K4XGTtwdGH/Bx1elHK9A5dE0Xqx/TtFixZoJ2
	uly2FjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6c9-0000000BNL8-2myW;
	Fri, 26 Jun 2026 13:29:01 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6c7-0000000BNKB-0t4u;
	Fri, 26 Jun 2026 13:29:01 +0000
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-05 (Coremail) with SMTP id zQCowABHntGSfj5qhXFqFQ--.43105S2;
	Fri, 26 Jun 2026 21:28:52 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] fix: drm/mediatek: mtk_drm_probe: of_node_get in loop overwrites previous   node references without release
Date: Fri, 26 Jun 2026 21:28:49 +0800
Message-Id: <20260626132849.38694-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHntGSfj5qhXFqFQ--.43105S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy8ur4ktF43Ar4xCF4fGrg_yoW8XryfpF
	WUKFWYyry0gr4xKFyvyF1Uuryay3WIqayxWa12ga1xZws5tFyUXFyFqay7KFZ2yFy8CF13
	JFn8AFyfur17AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbzpBDUUUUU==
X-Originating-IP: [117.182.75.66]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwKA2o+TTuTHAAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_062859_630095_9AD81B5A 
X-CRM114-Status: UNSURE (   7.95  )
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

In the for_each_child_of_node loop, private->comp_node[comp_id] and
  private->mutex_node are assigned via of_node_get without first releasing
  any previously stored reference for the same index. When the same comp_id
  or mmsys_id matches multiple nodes, earlier node references are
  overwritten and permanently leaked.

Cc: stable@vger.kernel.org
Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..2c0d8db9ade2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1138,6 +1138,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 			id = of_alias_get_id(node, "mutex");
 			if (id < 0 || id == private->data->mmsys_id) {
+				of_node_put(private->mutex_node);
 				private->mutex_node = of_node_get(node);
 				dev_dbg(dev, "get mutex for mmsys %d", private->data->mmsys_id);
 			}
@@ -1153,7 +1154,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 		if (!mtk_drm_find_mmsys_comp(private, comp_id))
 			continue;
-
+		of_node_put(private->comp_node[comp_id]);
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-- 
2.39.5 (Apple Git-154)


