Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC36606A334
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YaLf99tQ;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=TgusRLnw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UzedAFa5h664fztzVBr2iN5QA1eULbJ1Z5kDseqFZL8=; b=YaLf99tQ4dziSO
	aT+iYH90l9eYD/sWHbZwwXAVHw42mp5dsDm6J0OtG4o+kYKmZy2Zg5m46Lng6L3x3FMmqFnXcElmZ
	LBwyeYzWy6nKfowUFsMRmRYY4SqrLuztkbMAx3hvV+YXvhnxkVGYz2ZBeL49Bfj2Kf27Uihej1IcN
	22HhvOvx/m/7zmeXy9aDg9KSC5JN29Ha3BcgaGFl+r+3bPMEB6ArnG43CsSVTKsLRE8iV+/Mq8nkX
	pZiXnf61SnV5ePPhFOyleyth1GekpBOQsgrPn1xys5eYqnEpAusxnr1fufVt/Qka+6urtGPT0qirT
	L8leTv2P8pJGHw6J1NXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUoA-0000000CO0R-1vBS;
	Thu, 26 Nov 2026 08:26:22 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUo3-0000000CNwB-2z1w;
	Thu, 26 Nov 2026 08:26:18 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561726907;
	Thu, 26 Nov 2026 16:26:12 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: angelogioacchino.delregno@collabora.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	msp@baylibre.com,
	fparent@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:11 +0800
Message-ID: <20261126-a35bb25eb5-u14-3@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa216f655cb03a1kunme85e8f6d3c29f4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQhpPVhlDGU9DQhpCGh8YGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=TgusRLnw4DCYyyPItZpKaNriu0ziXvFv/DjLBoZpJ6+WANAb7JUZHZd09UWCJF5tOUux+Uvf7qTmT4sAs9uVjwGfhkhWI9E9Ww2COvVPvGjFC85m3QdJigLd9af/bNp6PkbVCPKyL4iJna1Wu6F5F6I6c3/U5WO/8fGoO3cA/m4=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=UzedAFa5h664fztzVBr2iN5QA1eULbJ1Z5kDseqFZL8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002615_944921_B64FDFC9 
X-CRM114-Status: GOOD (  12.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The apmixedsys driver leaves the OF provider and clocks registered
on unbind. The clock table is device-managed, so the provider can
retain a pointer to released storage.

Remove the provider and unregister the PLLs during removal.

This issue was found by our static analysis tool under development.

Fixes: d46adccb7966 ("clk: mediatek: add driver for MT8365 SoC")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
index e331aa28a4bd..386b0c66bf4f 100644
--- a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
@@ -141,6 +141,8 @@ static int clk_mt8365_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
@@ -149,6 +151,14 @@ static int clk_mt8365_apmixed_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void clk_mt8365_apmixed_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8365_apmixed[] = {
 	{ .compatible = "mediatek,mt8365-apmixedsys" },
 	{ /* sentinel */ }
@@ -157,6 +167,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_apmixed);
 
 static struct platform_driver clk_mt8365_apmixed_drv = {
 	.probe = clk_mt8365_apmixed_probe,
+	.remove = clk_mt8365_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8365-apmixed",
 		.of_match_table = of_match_clk_mt8365_apmixed,
-- 
2.43.0


