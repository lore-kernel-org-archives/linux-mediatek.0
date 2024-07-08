Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1320C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 19:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wrvtq3rsFVcvBLx3vkQk3/OQa5ddiTispXmnnMX4RN8=; b=lKdXF8H2TaWO3L/FoLAvkMvlqX
	9fotTT5ypHIhtGi5j9LlTwJkA/62rd4BdmuC8OW8BU6djl4X0nRIWWmycs0Gd4oqqwQXQmyNFRCZr
	4pJMnnaMFFuR6SXD5oi9HFN8x6JBVKhixS4WVDIZ0qtqCG+H1y8fp2Uf6GUxp0fLpQTompASJv5Lv
	41BnMCrXLi8ppwAbW8n0E5ASA7u+WYSA7UcekG98Zv9d66t8bqQ7qtWm1DLSz30WeC4zkO+fMFT/c
	zQEYtXBUZIVNnSX5MYRpFRrrMgjmdIVbRdyOmpByfV9JnjmYT5yZOJ2XDK4Z1Lpk5gVAFd9YgXlm4
	n/YAI9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQu9i-00000004qTd-0TYM;
	Mon, 08 Jul 2024 19:36:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQu9S-00000004qQ0-0RGP;
	Mon, 08 Jul 2024 19:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720467349;
	bh=0OBzSXiRb9v5GMOlfMYcQ/AMJWi6hFBtmioN+HVjr58=;
	h=From:Date:Subject:To:Cc:From;
	b=C3qIIK/vnI3mCTcPc66XWoXaZbiz+9uf2fXh1pfWwFj+9suhveLcIMm1kD+ikzZ6F
	 rJ+WtOnd6HbIO9O87WMq8ZLlUaviA0wfEIUf6CSBp3Pfknocos3ri/+mFgqoDRGIwq
	 lex/vwE0ifxWI64BFvO/TCIGzYmtA/QClvxvXazvdTUtdpEVgbS+xF7CMI0JqP0JQw
	 LKQr5IqmKeculWUaVfuSUiAltUW6C1pGRDxQoXcMfTc0lYNPhoT7icMHxFckapUdHP
	 N0mThcI4PV9RIaVPgjEn3XxAZ/SRPLJrYD1k7+IlafnVg/Z1GEiVlUe0ay+m6gKL98
	 nEKBXu8f+lXhA==
Received: from [192.168.1.242] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 497FB378042B;
	Mon,  8 Jul 2024 19:35:47 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 08 Jul 2024 15:35:42 -0400
Subject: [PATCH] nvmem: mtk-efuse: Only register socinfo device if needed
 cells are there
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240708-mtk-socinfo-no-data-probe-err-v1-1-fb2acd3a47bf@collabora.com>
X-B4-Tracking: v=1; b=H4sIAI0/jGYC/x3MQQqEMAwAwK9IzhuoVbHsV2QPtY0aZBtJRQTx7
 xaPc5kLMilThm91gdLBmSUV1J8KwuLTTMixGKyxremNw/++YpbAaRJMgtHvHjeVkZBUMfZd55q
 2icFZKMemNPH5/sPvvh+c3U9+bwAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_123554_331681_C0560615 
X-CRM114-Status: GOOD (  14.02  )
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

Not every efuse region has cells storing SoC information. Only register
an socinfo device if the required cells are present.

This prevents the pointless process of creating an socinfo device,
probing it with the socinfo driver only to ultimately error out like so

  mtk-socinfo mtk-socinfo.0.auto: error -ENOENT: Failed to get socinfo data
  mtk-socinfo mtk-socinfo.0.auto: probe with driver mtk-socinfo failed with error -2

This issue is observed on the mt8183-kukui-jacuzzi-juniper-sku16
platform, which has two efuse regions, but only one of them contains the
SoC data.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/nvmem/mtk-efuse.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 9caf04667341..79300c91ced2 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -60,6 +60,8 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
 }
 
+static const char socinfo_data_first_name[] = "socinfo-data1";
+
 static int mtk_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -69,6 +71,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	struct mtk_efuse_priv *priv;
 	const struct mtk_efuse_pdata *pdata;
 	struct platform_device *socinfo;
+	struct device_node *np;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -92,10 +95,16 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	socinfo = platform_device_register_data(&pdev->dev, "mtk-socinfo",
-						PLATFORM_DEVID_AUTO, NULL, 0);
-	if (IS_ERR(socinfo))
-		dev_info(dev, "MediaTek SoC Information will be unavailable\n");
+	np = of_get_child_by_name(pdev->dev.of_node, socinfo_data_first_name);
+	if (np) {
+		of_node_put(np);
+		socinfo = platform_device_register_data(&pdev->dev, "mtk-socinfo",
+							PLATFORM_DEVID_AUTO, NULL, 0);
+		if (IS_ERR(socinfo))
+			dev_info(dev, "MediaTek SoC Information will be unavailable\n");
+	} else {
+		dev_info(dev, "Efuse region does not contain SoC information - skipping socinfo driver setup\n");
+	}
 
 	platform_set_drvdata(pdev, socinfo);
 	return 0;

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240708-mtk-socinfo-no-data-probe-err-d7558343dc82

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


