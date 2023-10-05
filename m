Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF1AE93701
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baRfTXVNhyd9dVkzp3Nqi8UqsMBNTjgkp9+p4TGp0/s=; b=hkCFDyYYTFrFjLzNZrTJsSMD6i
	BEJX0JeoqoAMe+kg+cNdYzU6fsO5KxDbKue6KiSnNXDLT5MHThX5y6edwvnsKbV1OS8nqMAmQXgln
	ersDHDjf40ler1sxSZYvxv1Dy6/pyIScOhdU6NpkMrXrxeFM/Xk1vHgbHAZtRaJeTzZIKtv9nD1tb
	wJTfxTHeBGLNKYO2kqyD8P1zTFSdrYE8HxbHcXBu7B/MKnIClcnOKFdbfvSSAMoZcGAhQX/8x48Aw
	IpIfshzisAZ/bAze2O00ev8L9OIqbXz0Bp33o1a3V5tl7Hr5Su0vvGVazSU3X3Hx96p6dMK0Hbhfb
	TgIhT46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLv5-001xpk-1c;
	Thu, 05 Oct 2023 10:49:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLuw-001xig-1g;
	Thu, 05 Oct 2023 10:49:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22BFA660731F;
	Thu,  5 Oct 2023 11:49:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696502957;
	bh=vtwN7TZUfuKOOcpUTbUvCztJdBqkeLPF1yo8/uXzBpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W3YxRc7t98bDLGOsh8Hk+Bwwp3AQiR6xwxpd3UpfwbkcqiPyyKSiTwGm68YDx8Vh+
	 2TFobSL5JSEWtS6T5+ZkpZPtwt7wt3Tdile43De8AEk3w9i7r2AcYJ0bifjoD/AXCL
	 qtKMpJuhxsxdrT1ME/EQ0+Iv0AvrYyLPut8kjX4527UpbUXn+0Ji5ueUHm4zMWe1HS
	 yAu9oyUCBY1hsFc18+FPWXt/Ab3JmPcvnRcg+2jTPOxV0hOkKX3AdLUgwU+KfAYb+G
	 E3GITamvK5Hg7AZ/N22dk2qse6r01DcQhpCOxSg/UuF4ihqeXhG3AEIhaVy579dvYN
	 XERMItaZXgiIw==
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
Subject: [PATCH v2 2/2] media: platform: mtk-mdp3: Use devicetree phandle to retrieve SCP
Date: Thu,  5 Oct 2023 12:49:05 +0200
Message-ID: <20231005104905.120544-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
References: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_034918_713354_F65D4718 
X-CRM114-Status: GOOD (  12.81  )
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index cc44be10fdb7..94f4ed78523b 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -208,13 +208,17 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_destroy_job_wq;
 	}
 
-	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_SCP);
-	if (WARN_ON(!mm_pdev)) {
-		dev_err(&pdev->dev, "Could not get scp device\n");
-		ret = -ENODEV;
-		goto err_destroy_clock_wq;
+	mdp->scp = scp_get(pdev);
+	if (!mdp->scp) {
+		mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_SCP);
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


