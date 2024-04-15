Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408ADC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rMKet2MHKM6qH4XuZknwYU1eWOy95F7uZcheFCEP1E=; b=y/ZLf7AI2Kki9U65HH2geORxrh
	2FtcVtJzmBHHe1uXtcG1hOnp/InRQ1gQo1AomzdUtjGijWh5JNamg/x/Om+kFZfWGQLP0fmIuTXz5
	fIV2ZYtioFBOP99o13FRcpXuDn5mE7aYbnfzQONYfnj8Gz7f2WEQOwic5ad+2BZtqxGg8oXT7rukR
	XLn9Pv57tZDTwtQOEBGTxt3NA0NGcWlNVizu4JvqXo1fn8fIb7C30XfSEn6M2OKsMExarGSu5G3Z7
	eODJ/A+8xUefFPngIFut0xXNNv1y3bvOGZDCmcdEAuPyspSiy3sA6aaWIi9bGhOsI8PKmqK1Gwr5s
	l8nMcqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHB1-00000007Pbj-00LP;
	Mon, 15 Apr 2024 07:54:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAS-00000007PC1-29wC;
	Mon, 15 Apr 2024 07:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713167658;
	bh=mtHtsXrLALzqGVSNLxyK9tAZfpbHED2YLsLqlHv6qkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=boO3PidsKRgQDIa/WhDqBUQNs7yBhxTFL7Nlsuv92KD8iRzBFz14iCVhIKRvwvsV2
	 Vt2ZWp964MKE24SKxWmksKT27IKbOwRUjckSBlcYEy95SSzhq9zdWwxR/N3VH1ncCY
	 n1tfwcrYubZTOBSGpYGDv/4P2zXN2AWmPQTDlMrUHH7zaCRmCHBK/nVvp3HZUIg4wt
	 8t8FZxOZaAp20E+fUGhnekXe0jmtWZ4TbC0TMp78fVYjBAP0A9ViS45Vmq5uu3lZcA
	 gxYNx/y3ylf8bTdAqeD4V0S6HvM6Kh5ENPBduQaA1Xb9Ow/9d/uov0+UZsxkGDWyH/
	 2Eojl66gBqDaw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE98237820AB;
	Mon, 15 Apr 2024 07:54:16 +0000 (UTC)
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
Subject: [PATCH v3 4/8] scsi: ufs: ufs-mediatek: Avoid underscores in crypt clock names
Date: Mon, 15 Apr 2024 09:54:02 +0200
Message-ID: <20240415075406.47543-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
References: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_005420_774545_7FC79762 
X-CRM114-Status: GOOD (  11.36  )
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
index 47f16e6720f4..5db6d27f75af 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -604,15 +604,15 @@ static int ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
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
2.44.0


