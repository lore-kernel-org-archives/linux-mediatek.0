Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB596C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfDPBLKaioX72UMsfzkGtBIsjdpxTnoJS8fvO2iTDJY=; b=WoM66kURZNk2utq9NYGUAWbB4u
	c6h7r6b30kM+BtmIiNfMAyysNBz6Q2xnYexSNaM/EB58PUEmpqJ6N89IdT08KmaufRqg9syoQInUj
	2C//DCSCwU944wtufyhriBhfYNENJWq3UXHDENn/3AGwyF1oQyWr8dbntQZU3A0lX4rolMpKguDQG
	ym7sFw2EukFvwWWLQWu5ufouiituxoYmaARJ9CenmVkfmgJssben8Cv+cyaer7HkulNU0c7iFtJ59
	GoL8V1sjUDlbp2/0uIO+JPMdxyFiJnQWRvuMYCe8WhoID9/7SBovtv1hP+xEI2aA8PD/ZPrdFxBc5
	ihGVGLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwK4u-00000007xY4-1ARb;
	Mon, 15 Apr 2024 11:00:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwK4T-00000007xIF-2CSt;
	Mon, 15 Apr 2024 11:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713178820;
	bh=oAmHrFWJ0AgBwXeTr9PuBA8AXz2vtp9jcoIAQcxeovA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GrImNpYFZBsPa+7Bwj0La88hEjiESPwzM9VATwUoooYCFSXQCkOEDvu1hXdNBgbta
	 ZAR+1IaKoch4Dit78eu5b6NEL0qzdZiE0pDetGhvlejJsNQXtuxp5mbGJb3g+E1sfP
	 IkC389BCe+ey/l52g0ber0KiobMktveTw6XWfadPNDCXYkmee9QzJ9hugnKf8XJIA1
	 Hr+Qw6Eax1fCJhega7bIvCII8Vi9+lrIp5Z0e+R/7ifFGpQQaqs/1mANkPGcWT/Qm+
	 935K/QzCjl+CRkbbFvD/tWZdHmtBovLb7/34RBEsHG1QmX329EK24fye6qyDoweFMy
	 CX+WaWfel3aNA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0605C37820F3;
	Mon, 15 Apr 2024 11:00:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/8] scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-boost-crypt property
Date: Mon, 15 Apr 2024 13:00:07 +0200
Message-ID: <20240415110012.148871-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_040022_147836_C48146A8 
X-CRM114-Status: GOOD (  16.76  )
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


