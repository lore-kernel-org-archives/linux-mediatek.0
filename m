Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C43C27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fH0br5JcXYsbmFDlAsAWBJ8NI5SRzEUCudG3/89ick=; b=1IooJwAoLWLJ2loe3zVLp/+xLw
	3FJndqdo3cGVLfHd8eSFipRQZprErTXCgRQ7wa1s4ficRAZkHhNn6MT/SBOLNKl2vjDBHEbeqXy97
	iquQeYkD1NSTd6sCI/8dc5tZWeTPiDFwNRjz5CFwVoYEahMeUoEFxl3Aqt5BMr8cvhq/Y1LBdykBz
	kivosBKn1xniLcNZLr12HDxL7caHZy5QR+3USO8j5BITukIFLfaRBSaFw8d+fi4C/bCWsinelmXtc
	XQP7YAtivYIevWYN2kkgES7cHS6mc5VJbu0Hl6TgQT3uolfg6wTpnIjyxKVd9BIMIA3iFaoqBxdZd
	hoeOaQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIe8-0000000BUM0-1fFh;
	Wed, 12 Jun 2024 07:43:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdk-0000000BU2E-2oD0;
	Wed, 12 Jun 2024 07:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178207;
	bh=K9MBVzw8pOo1gyqCI5gTzX5FvDaBQEiToN0XXU2CLjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eoHZXYncZyQl8K7MWDaJC1sFeWZxHXStMI1HqUfD1Va/32VVj+OxGTeEStnJTIcDS
	 mJLX9np5dQ0zn74aPE9fs6p0BJAz7I8fomj99yIVCEZzZdo7WInMOZ2eNRpEPXZbmG
	 gjaZ66SQehY8Qw24C1Ho5EZwfzYrpryfHrtiXov4hIFYK9Gofvw8GruUGyLa2B4wOp
	 FPqrmFrUpiuH4NntZgI50fnAMnunJOkXq9FbKXiIv8nmVPa7Sy2267ELCXDZykVYJg
	 ZnLQBkvtge9Qemf+TwEzXFRFFIj6KzFmc0Khitl75Zjg7a5U2mYJtBSNxyycBm3Kz5
	 GhLzEyB5dd0Dg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 677DB378219B;
	Wed, 12 Jun 2024 07:43:26 +0000 (UTC)
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
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	michael@walle.cc
Subject: [PATCH v5 4/8] scsi: ufs: ufs-mediatek: Avoid underscores in crypt clock names
Date: Wed, 12 Jun 2024 09:43:05 +0200
Message-ID: <20240612074309.50278-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
References: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004328_862666_EAA8A477 
X-CRM114-Status: GOOD (  10.91  )
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

Change all of crypt_{mux,lp,perf} clock names to crypt-{mux,lp-perf}:
retaining compatibility with the old names is ignored as there is no
user of this driver declaring any of those clocks, and the binding
also doesn't allow these ones at all.

Fixes: 590b0d2372fe ("scsi: ufs-mediatek: Support performance mode for inline encryption engine")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 8d0e7ea52541..10a550e7e628 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -605,15 +605,15 @@ static int ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
 		return -ENOMEM;
 
 	cfg = host->crypt;
-	ret = ufs_mtk_init_host_clk(hba, "crypt_mux", &cfg->clk_crypt_mux);
+	ret = ufs_mtk_init_host_clk(hba, "crypt-mux", &cfg->clk_crypt_mux);
 	if (ret)
 		goto out;
 
-	ret = ufs_mtk_init_host_clk(hba, "crypt_lp", &cfg->clk_crypt_lp);
+	ret = ufs_mtk_init_host_clk(hba, "crypt-lp", &cfg->clk_crypt_lp);
 	if (ret)
 		goto out;
 
-	ret = ufs_mtk_init_host_clk(hba, "crypt_perf", &cfg->clk_crypt_perf);
+	ret = ufs_mtk_init_host_clk(hba, "crypt-perf", &cfg->clk_crypt_perf);
 	if (ret)
 		goto out;
 
-- 
2.45.2


