Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDE3F532DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=; b=oPj/t7qTVOuhP7zx/jCcLnlrYf
	JIEUTY1/b/P+65oaWSnB9iQAEsgli7XMwb/VM1LvCWfqQ8lWzPdXPi4HnMAjqosI7N+Qssm7mBteP
	wKsiHaiQmKOVcp7yLVkWu4ocxorcPu6S58mShCZPzBzazWHNrBxVc2YL8gymNhoki4MpomqQbGVGV
	CLI5rqk898wd6AaKuS+Yk6SA8z4B4AxOZ0UaZTU5kge3wy+65xBD/4e7viNyR3w0sz/LQmRAYUVXV
	UEMnCzL2CZr5T33KJTZa2U68iSFAC+KyDeQ+ywY+F9m8xfU40W3MT/FcGfTfkihqUqrw42wHDFqv5
	ykecZXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLw-00000000aVA-08KX;
	Tue, 24 Mar 2026 05:30:56 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLq-00000000aR2-3APl
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:30:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so4705013a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330250; x=1774935050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=;
        b=Y/fwPgmg3J9AMSVJWGrfCPhoq9TOPQDnVR9CHQNh+Jmjr9jgCdIq9pVtBKtWoHvPVl
         2nk9dHDBMGGwtFIN+YN8an/5Zztvl9iHJs0HQGE5cAvjrnX6AERpLitC2/YFXRKGaq4L
         kcsH6w5mjaV+Yr6DAVPu3G3rnl+aC9K99CVWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330250; x=1774935050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=;
        b=GRLDMEEl6Oei59n+kZ5ayiqNBqWkMuDJ8j+rfhwvUdbL4XReMPj9riaqji8pvSisF9
         n6RdmHE5B+yxWgWZ244VbiNLTqwn4rJL0oyB6d1jHCwwulTPHF3Wb0xMbMF578K66w+8
         NjHFScfkgwyAEr7q+lOqIsjjrSFI3xIpEFWUdfsmKjIW9fC9BQnuLY4//Yr00BmNPIc5
         eL62BVhr5ljj2VdIu2He28EHJeunaA2DMBhPBjfT7+OMueBKDqvWjOkPzpgFi1KYx+GP
         h/9QrOQf9sC9SjN+LSQKVstc9+osQoc5IkZp2VYDjwCg3CPLcme3N4x8WO/eRz4fT/eW
         R6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXYKcauy5KvCNyHEhfwecHvLey0EEB+NskuS9QBlNAOc/vscVTbU3zlxn8Bafp15+VFAv6kY7iZXmFKPQEjJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ZxDgC7u4cA5RA2v/VDXmGtT1DvkdbsjFMnCR6Hrymv1r/CwJ
	AQb/1r/N+Yequ4rSFbquTeZZ0E895s2y4Zn5bJpy0QFvNg4k8BSGuuxSuC++FVYaFw==
X-Gm-Gg: ATEYQzxl/L9Yb4VOPnCysRu5ZAwLNj+s+th8Qam1K+FxmfkEqHcth80ksvhGStqsBLy
	NcXb0gNoxfmJc/1sug+ZYF4bDnHtR3FyHa0RBkh3t0OeOlp5wFrb4c9AgLBYdEOUlUPITyR/6vE
	+j9GDH1Lu4t/9mNom53NijRcI0UzHrs12D771Jov4npW3ejwFfpQYozscevh3l0KSBTFJYbl7BZ
	QRbLRbMCzcyEAIIe4alx+Gb10o99Nt7FoYQLXd3zzz1sbH/8wCAqvPqEXD7PMM3fe9xSKHyMCnF
	mCGqNCMUsiGOVqstAmYJI0MrM+y0q0rii5/NyUJQhDr2ls3JraGVqhKLkVgYuI8FdpighZzCvCc
	zMEa+RKJzjeQ+vIzcNy07FHWYnPi9Sy+Jj8BQs5DKIxGAcETjw3X/2Bc9YAwNg8vgDXFH5/FL/s
	TXS8N1u8tRuktccPP7pK77QbSxrOO3fkJ9M4URJsmdm2aeYDq8ROKH7Jm3txbNfpzXHX44k2HRA
	sQClHaj
X-Received: by 2002:a17:90b:4e90:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35be551e7a9mr7465594a91.27.1774330250183;
        Mon, 23 Mar 2026 22:30:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 2/2] regulator: mt6315: Add regulator supplies
Date: Tue, 24 Mar 2026 13:30:29 +0800
Message-ID: <20260324053030.4077453-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324053030.4077453-1-wenst@chromium.org>
References: <20260324053030.4077453-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_223050_804248_CFC3091C 
X-CRM114-Status: GOOD (  11.63  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6315-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index d3f93aae0fc5..231e64fb0596 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -31,10 +31,11 @@ struct mt6315_chip {
 	struct regmap *regmap;
 };
 
-#define MT_BUCK(_name, _bid, _vsel)				\
+#define MT_BUCK(_name, _bid, _supply, _vsel)			\
 [_bid] = {							\
 	.desc = {						\
 		.name = _name,					\
+		.supply_name = _supply,				\
 		.of_match = of_match_ptr(_name),		\
 		.regulators_node = "regulators",		\
 		.ops = &mt6315_volt_range_ops,			\
@@ -190,10 +191,10 @@ static const struct regulator_ops mt6315_volt_range_ops = {
 };
 
 static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
-	MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
-	MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
-	MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
-	MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
+	MT_BUCK("vbuck1", MT6315_VBUCK1, "pvdd1", MT6315_BUCK_TOP_ELR0),
+	MT_BUCK("vbuck2", MT6315_VBUCK2, "pvdd2", MT6315_BUCK_TOP_ELR2),
+	MT_BUCK("vbuck3", MT6315_VBUCK3, "pvdd3", MT6315_BUCK_TOP_ELR4),
+	MT_BUCK("vbuck4", MT6315_VBUCK4, "pvdd4", MT6315_BUCK_TOP_ELR6),
 };
 
 static const struct regmap_config mt6315_regmap_config = {
-- 
2.53.0.983.g0bb29b3bc5-goog


