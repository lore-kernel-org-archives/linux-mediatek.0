Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhUiqLep/QNurFxR9/HZhyAKYEluS013sDYYoooOFS8=; b=BwfZcyJfNFEonO
	zjSFM0CNyn/EM3MzTKCUJpAlyKVOVP8A1mXXsrHTlp6cjzhLEU55TTRE6A/VaqDXyRY293iP7cBBb
	YXCkTVUT7w02g6PceHBQkS4SlYoa4H7Vbm8NkQUPD9oL7mGrHYSysylDX9GQiTKf5KScHHfa2XfL6
	zUy1VwleZgbWVp7ayzbfnbTJtwDr9gYagkKHm8oUY3/7zln8K7tvotY8tdJhctaibP+N9zvBlWA++
	PQEvJ4OGj9n+8XjuP3THfWBjrSQNO24GMwdi9pnhAvmWaCGxPCQjRD9C0Jxmo+N4tAa3XA+8liJHm
	rPdXJe2slF4SWC1GmsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nByAb-0039fm-Il; Mon, 24 Jan 2022 12:10:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nByA2-0039TT-Ln; Mon, 24 Jan 2022 12:09:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EED441F42E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643026165;
 bh=K2ObFY3Vsm+qnoFl2QeGq49BSilMuqWVDQ+bAXw3Mog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MXIzTOobugUM0mowy79jjk1wphZsdQeaD09BgOWJkvg9YkRg2INPxE+3z59OGCbaP
 oGOgJZyLmJ/EDqaqCFR1peOp+C5HLSeEVSR8VN0fCVIerLlfa/PSP1gY89+4F7ymtk
 RmjpdpgsBEgOl0FqpJblVZj1Dsgw+lIhVOFigOX7JF8PmoIIh6/UCs+6NvySXOCRTo
 y5203U/mGV2mQ1spOsg1DoKw98o9G0kotfqk6RVIhRaDN8DxbfmdXuoyMl1P0n3i1d
 mZVoDugn6pJSvub6XGR1RYeiACs7trCsDaFVHFCgXjKt9Wq6pVhef28Ejy1BIlwamf
 GmUSTmUu1bXhg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: bjorn.andersson@linaro.org
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/3] remoteproc: mtk_scp: Use dev_err_probe() where possible
Date: Mon, 24 Jan 2022 13:09:15 +0100
Message-Id: <20220124120915.41292-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
References: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_040926_886202_2D97AE7C 
X-CRM114-Status: GOOD (  11.68  )
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

Simplify the probe function, where possible, by using dev_err_probe().
While at it, as to increase human readability, also remove some
unnecessary forced void pointer casts that were previously used in
error checking.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e40706b0e015..dcddb33e9997 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -757,10 +757,8 @@ static int scp_probe(struct platform_device *pdev)
 	int ret, i;
 
 	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
-	if (!rproc) {
-		dev_err(dev, "unable to allocate remoteproc\n");
-		return -ENOMEM;
-	}
+	if (!rproc)
+		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
 
 	scp = (struct mtk_scp *)rproc->priv;
 	scp->rproc = rproc;
@@ -770,21 +768,20 @@ static int scp_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
 	scp->sram_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR((__force void *)scp->sram_base)) {
-		dev_err(dev, "Failed to parse and map sram memory\n");
-		return PTR_ERR((__force void *)scp->sram_base);
-	}
+	if (IS_ERR(scp->sram_base))
+		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
+				     "Failed to parse and map sram memory\n");
+
 	scp->sram_size = resource_size(res);
 	scp->sram_phys = res->start;
 
 	/* l1tcm is an optional memory region */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
 	scp->l1tcm_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR((__force void *)scp->l1tcm_base)) {
-		ret = PTR_ERR((__force void *)scp->l1tcm_base);
+	if (IS_ERR(scp->l1tcm_base)) {
+		ret = PTR_ERR(scp->l1tcm_base);
 		if (ret != -EINVAL) {
-			dev_err(dev, "Failed to map l1tcm memory\n");
-			return ret;
+			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
 		}
 	} else {
 		scp->l1tcm_size = resource_size(res);
@@ -792,10 +789,9 @@ static int scp_probe(struct platform_device *pdev)
 	}
 
 	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
-	if (IS_ERR((__force void *)scp->reg_base)) {
-		dev_err(dev, "Failed to parse and map cfg memory\n");
-		return PTR_ERR((__force void *)scp->reg_base);
-	}
+	if (IS_ERR(scp->reg_base))
+		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
+				     "Failed to parse and map cfg memory\n");
 
 	ret = scp->data->scp_clk_get(scp);
 	if (ret)
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
