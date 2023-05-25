Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55592C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9v4pXEzRnbDf+x2arRNt01QmgC+/H2ifakmNEcASOxs=; b=weRKGWasljEQIHBEQaxGdeJG+r
	bFtlSDM3kx9SoK7QgCkQe9HDhBtpLRnZM3RvqInL7VQFUyNlsXdjz0HCVnCF1S2MPDA6v+i+Q7OA6
	ho9wIwZIPLDNkcFx35Y+BFCQbNm5NOugrRrhHWMczUfDeZ17I1YbvZsCCa7W2pZRm5rhjcvHYp2xa
	WJvdlKtzX0Gqq+w3kAIUyVNbicVUinZT8Lh0W6ANKcZU6+PXROCauL1YpBHa3aLGCCOUhUlMxQtOE
	dcU5dvtdq7w5LKgCWBjRT3HK1/CYiHiPswokzzirjQxHo2Dk7ScFPsNt3kOAQ2PnDPM+SgB9tSAUL
	uSUrJNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q28vd-00GU0A-0q;
	Thu, 25 May 2023 11:14:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q28vZ-00GTyQ-0v;
	Thu, 25 May 2023 11:14:43 +0000
Received: from localhost.localdomain (unknown [IPv6:2a0c:5a83:9203:ad00:d93f:618:db35:8dd6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 139116605840;
	Thu, 25 May 2023 12:14:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685013277;
	bh=UiKAWaz+TVBbHcco3PIJzUCzRR4p4Qx9+60xRrdVKYo=;
	h=From:To:Cc:Subject:Date:From;
	b=VSFSPWGOJgn7KTkuUQ73VmY8lj0zR403O84m867RYHL/Vxr9zVFozrNXn3LPvGt7+
	 dmG6iLasz6hn2mNTT6Cvus9+2MhrTksJJHM0/mGNXoBU7tjSwuuETY0FqjRLAoGRpo
	 Qj40pFp3SVnYBfuSCcA1aZIeWJ57p21xQXbiLAn2wajWiGA7AH0nQv6GbmB+Y/vpTL
	 wKZ4EVllIK4L581/gv+4Fg247Wvye1xEjmcblEvrmOIc1VCI+qVucn/hhFhj5AgXTB
	 8JgXrmcJL7P+SURMeAnTKKLr37gcEIQCmzte6Uq9bXF1UfYpQvThlw0BuTW6DoUgB+
	 XE5U5+oO9mLvg==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: matthias.bgg@gmail.com
Cc: void0red@hust.edu.cn,
	angelogioacchino.delregno@collabora.com,
	daniel.lezcano@linaro.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH] Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe"
Date: Thu, 25 May 2023 13:14:17 +0200
Message-Id: <20230525111417.3350271-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_041441_505041_5E1CC385 
X-CRM114-Status: UNSURE (   9.63  )
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

This reverts commit f05c7b7d9ea9477fcc388476c6f4ade8c66d2d26.

That change was causing a regression in the generic-adc-thermal-probed
bootrr test as reported in the kernelci-results list [1].
A proper rework will take longer, so revert it for now.

[1] https://groups.io/g/kernelci-results/message/42660

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 0b5528804bbd..f59d36de20a0 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1222,12 +1222,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	auxadc_base = devm_of_iomap(&pdev->dev, auxadc, 0, NULL);
-	if (IS_ERR(auxadc_base)) {
-		of_node_put(auxadc);
-		return PTR_ERR(auxadc_base);
-	}
-
+	auxadc_base = of_iomap(auxadc, 0);
 	auxadc_phys_base = of_get_phys_base(auxadc);
 
 	of_node_put(auxadc);
@@ -1243,12 +1238,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	apmixed_base = devm_of_iomap(&pdev->dev, apmixedsys, 0, NULL);
-	if (IS_ERR(apmixed_base)) {
-		of_node_put(apmixedsys);
-		return PTR_ERR(apmixed_base);
-	}
-
+	apmixed_base = of_iomap(apmixedsys, 0);
 	apmixed_phys_base = of_get_phys_base(apmixedsys);
 
 	of_node_put(apmixedsys);
-- 
2.25.1


