Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986D7C04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfDPBLKaioX72UMsfzkGtBIsjdpxTnoJS8fvO2iTDJY=; b=GF8hyE+NstXWXsqSi6ibx0MV8B
	xCK6i3CPLy1We1yOmNQlPzX/7qNcOdqAx8oxyM8ldHKDceR+y1m9BRO8P1BrEiqJ7jnFlZklYbPuM
	u7XFvYYuSpZEJyqi4jMs41xaR5DcMMIaqxIzJzGTu5zkgg+Wbuel7AoVE+3pLYn0u5FOsSi9hwdGF
	oDhV7TaYitwu3KgcpzaoIFoaKn7dfYd7dCKqwUKNjiXhf+LaiyFeft4mrSFJYY3mJnELEElXqMygN
	hrMfO8fCiEGtBEnu/bzJDnI8t43OwnOpbTyXeOOgqwLVQh1rnqvI1rXEzbjXlyisIaMm2iPoToMtk
	vM+8S22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAz-00000007Pal-3l2j;
	Mon, 15 Apr 2024 07:54:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAS-00000007PBQ-29xY;
	Mon, 15 Apr 2024 07:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713167656;
	bh=oAmHrFWJ0AgBwXeTr9PuBA8AXz2vtp9jcoIAQcxeovA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZKPPlpTz8SDFqpqWbYvPH5KR4ujFHnwh1dhPCRq26AkMayZRWSWfrPDQPbVJrFPHu
	 QbfmHN9sGDXMAg5pzHTt+8RP1wxtyYO47G8XlMQZfdMczZB8rq+2jkFznM+VnGMp3r
	 ovxzcASnJqVFggahRJkGXCinBkbxNq5zEPspyQkNZYepk4Ygy0I2T7z0aRcjbL15da
	 HAc3rQNqm7XAGupQXlsPdQf8M3Gu/o0pXQcF95PwDUi6nGaUo3NCdcfK7mlJJ3SeCW
	 iom0ePaCcrsP/eiK6ulfDirRpL9SbW6mZ2BEq0q/ERR1JDUIJQmzdSQtILd45B23jG
	 ZLDEBxp72ARAw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6674937820A4;
	Mon, 15 Apr 2024 07:54:15 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	chu.stanley@gmail.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/8] scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-boost-crypt property
Date: Mon, 15 Apr 2024 09:54:01 +0200
Message-ID: <20240415075406.47543-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
References: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_005420_756675_CD490FA1 
X-CRM114-Status: GOOD (  16.86  )
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

There is no need to have a property that activates the inline crypto
boost feature, as this needs many things: a regulator, three clocks,
and the mediatek,boost-crypt-microvolt property to be set.

If any one of these is missing, the feature won't be activated,
hence, it is useless to have yet one more property to enable that.

While at it, also address another two issues:
1. Give back the return value to the caller and make sure to fail
   probing if we get an -EPROBE_DEFER or -ENOMEM; and
2. Free the ufs_mtk_crypt_cfg structure allocated in the crypto
   boost function if said functionality could not be enabled because
   it's not supported, as that'd be only wasted memory.

Last but not least, move the devm_kzalloc() call for ufs_mtk_crypt_cfg
to after getting the dvfsrc-vcore regulator and the boost microvolt
property, as if those fail there's no reason to even allocate that.

Fixes: ac8c2459091c ("scsi: ufs-mediatek: Decouple features from platform bindings")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 55 ++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 688d85909ad6..47f16e6720f4 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -575,51 +575,55 @@ static int ufs_mtk_init_host_clk(struct ufs_hba *hba, const char *name,
 	return ret;
 }
 
-static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
+static int ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct ufs_mtk_crypt_cfg *cfg;
 	struct device *dev = hba->dev;
 	struct regulator *reg;
 	u32 volt;
-
-	host->crypt = devm_kzalloc(dev, sizeof(*(host->crypt)),
-				   GFP_KERNEL);
-	if (!host->crypt)
-		goto disable_caps;
+	int ret;
 
 	reg = devm_regulator_get_optional(dev, "dvfsrc-vcore");
 	if (IS_ERR(reg)) {
-		dev_info(dev, "failed to get dvfsrc-vcore: %ld",
-			 PTR_ERR(reg));
-		goto disable_caps;
+		ret = PTR_ERR(reg);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		return 0;
 	}
 
-	if (of_property_read_u32(dev->of_node, "mediatek,boost-crypt-microvolt",
-				 &volt)) {
+	ret = of_property_read_u32(dev->of_node, "mediatek,boost-crypt-microvolt", &volt);
+	if (ret) {
 		dev_info(dev, "failed to get mediatek,boost-crypt-microvolt");
-		goto disable_caps;
+		return 0;
 	}
 
+	host->crypt = devm_kzalloc(dev, sizeof(*host->crypt), GFP_KERNEL);
+	if (!host->crypt)
+		return -ENOMEM;
+
 	cfg = host->crypt;
-	if (ufs_mtk_init_host_clk(hba, "crypt_mux",
-				  &cfg->clk_crypt_mux))
-		goto disable_caps;
+	ret = ufs_mtk_init_host_clk(hba, "crypt_mux", &cfg->clk_crypt_mux);
+	if (ret)
+		goto out;
 
-	if (ufs_mtk_init_host_clk(hba, "crypt_lp",
-				  &cfg->clk_crypt_lp))
-		goto disable_caps;
+	ret = ufs_mtk_init_host_clk(hba, "crypt_lp", &cfg->clk_crypt_lp);
+	if (ret)
+		goto out;
 
-	if (ufs_mtk_init_host_clk(hba, "crypt_perf",
-				  &cfg->clk_crypt_perf))
-		goto disable_caps;
+	ret = ufs_mtk_init_host_clk(hba, "crypt_perf", &cfg->clk_crypt_perf);
+	if (ret)
+		goto out;
 
 	cfg->reg_vcore = reg;
 	cfg->vcore_volt = volt;
 	host->caps |= UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
 
-disable_caps:
-	return;
+out:
+	if (ret)
+		devm_kfree(dev, host->crypt);
+	return 0;
 }
 
 static int ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
@@ -648,8 +652,9 @@ static int ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	struct device_node *np = hba->dev->of_node;
 	int ret;
 
-	if (of_property_read_bool(np, "mediatek,ufs-boost-crypt"))
-		ufs_mtk_init_boost_crypt(hba);
+	ret = ufs_mtk_init_boost_crypt(hba);
+	if (ret)
+		return ret;
 
 	ret = ufs_mtk_init_va09_pwr_ctrl(hba);
 	if (ret)
-- 
2.44.0


