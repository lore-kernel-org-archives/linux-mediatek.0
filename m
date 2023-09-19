Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9E3CD54AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlwfOsv+H6AHlDKbTRxG4SD+E/FSPjYeg/3rDXmzKz8=; b=trt0vzgoCR0DNx4R/jzUpQa8Xw
	C7jS5aUdxyPNohLa3Ft81hpeleczsD2rcjkj3Hb2rx0wMmaGWDubIbIn32vYLG6pdGvNIrgkdkNzm
	Yfm4H+LT6sC0oV+nJlHUSGb78JTSwREPtyrrjMsZjD8+CLmUf1QRIeS2DREA7896KvhyXESqOvkr5
	+P5n7gdkrtSAGJMCzSnWwFDvAP0cxY7HGz+IAnVU7+nqiF5Qp//TA/oictrx5sMwYaX7EjNQnnBqr
	VBTWnz0iLZ8P6ZX0g4RsIAf78IZDBJoZW1RUuWeNqBwfO5/pZh2Lp6rVDwQmsSbCpYPjYNDcJMvQF
	9ITT1d6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXWV-00HZhi-0i;
	Tue, 19 Sep 2023 10:00:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXWF-00HZbB-0M;
	Tue, 19 Sep 2023 09:59:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95BC26607083;
	Tue, 19 Sep 2023 10:59:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695117585;
	bh=ty1ncJ/gw8hrt51lR2U+TFArnXv5dU7HXDPnYcxw+dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=StKEpJ45dfYg1hZOjzQqqJo3FpCWv8VqfgMPIQo7ZvtnXXpwzhwgrztPa4NeZ8T+y
	 RVe0zeLcKynvJjpeOEr32ul/Abs0xJAhnwLplgr3pK6paFIQoHo+d8BRTxzH5eiIy/
	 uoj/dHKTDdFsNciQMeVwNuQWAMxOgCYsNlTmqctJA147Sljyda6bWa5UTZ2qvQSR5l
	 xN1cY5vKssh0CdT8wNDCh2jHjufv/peXcgDi8gzlTvsOt9LjIR/nj2x/ayYlNXIS22
	 monR6h0q5f0N2s9ApuGN13f4S9sUCAfPMmpcq0VRzQKPJRa937S0tCb35egfWi9ScY
	 VULyrDJyyqzNQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mchehab@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	linqiheng@huawei.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH 2/2] media: platform: mtk-mdp3: Use devicetree phandle to retrieve SCP
Date: Tue, 19 Sep 2023 11:59:38 +0200
Message-ID: <20230919095938.70679-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_025947_341652_D7321867 
X-CRM114-Status: GOOD (  13.04  )
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

Instead of walking the entire parent node for something that has the
right compatible, use the scp_get() function provided by the MediaTek
SCP remoteproc driver to retrieve a handle to mtk_scp through the
devicetree "mediatek,scp" (phandle) property.

In case of multi-core SCP, this also allows to select a specific core.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8677e7fd5083..d93d3833633e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -254,13 +254,17 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_destroy_job_wq;
 	}
 
-	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
-	if (WARN_ON(!mm_pdev)) {
-		dev_err(&pdev->dev, "Could not get scp device\n");
-		ret = -ENODEV;
-		goto err_destroy_clock_wq;
+	mdp->scp = scp_get(pdev);
+	if (!mdp->scp) {
+		mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
+		if (WARN_ON(!mm_pdev)) {
+			dev_err(&pdev->dev, "Could not get scp device\n");
+			ret = -ENODEV;
+			goto err_destroy_clock_wq;
+		}
+		mdp->scp = platform_get_drvdata(mm_pdev);
 	}
-	mdp->scp = platform_get_drvdata(mm_pdev);
+
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
 	dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
 
-- 
2.42.0


