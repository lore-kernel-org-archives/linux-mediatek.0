Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E26CE7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 07:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=; b=PMFSk8+YhuYWIp/fP7U4FTEZIE
	DOhiK+TR7WKc069D80Imn+QhajUTaDTLI2xxyFUOpNaWu+zighoZUDr210UGmnDsFdUbJqmeqGRU+
	LNFCR7mmotDI8Brt8Ld9WjF+nIewg/h9gCXQSh3/WFFZsSk+GZurRZPJ2NAbrEnYlBEqSpzdjMmst
	iErXZEFz2ol/bqNWBdDShT9GzJYYUcgwINkwLB15U6ogMkz8uALm6BZIgZjbJuOZyKMors0ZdywDO
	bl0W4tm2YULepvWS6Xge1+HKuJ4VCizIFcWbMbmHj3COTU0OzJzQQ2oTy/kTpj54sxv6vgwO1TsUw
	4YXA2ZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLH16-0000000E2E4-2Ks1;
	Wed, 11 Dec 2024 07:20:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLH14-0000000E2DE-2uvP
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 07:20:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-216395e151bso2624945ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 23:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733901613; x=1734506413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=;
        b=KCQ/KyMEKQbqQ442Y7Q+CdEjixXbcXgqBzRNiFp89aNVPC6iFBsxtQ+uKjmGLY5+oN
         d0JsyiUkJW2r+sc/Lh16ItcHvnNDiKR01uQG/01JumxX3aQv9y9OyXR0O5VzP4s6pOVd
         FSrm1yzwvW8YA8zBBnAeZ2CkHIt5js/83Lh78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733901613; x=1734506413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=;
        b=TrTp4Dkhtjk9AvDwDZ8sBr5VIutrr5s0nYXLCiFRD74GdW9rTGzgLO8yEpEotR80nc
         bTSdQyqTALCYi28EF5j4CM7oqTLWEb05amAHJCsjbeqcVtop25JWVSCAYKQ0Bzn0MEz6
         QXz79H4IwRyaQ/B5krQCIEyOPH/PxUhqmAa6n1og0CAb0rtCsyet5n3sy2g0/WinoMMB
         QUQgUr4G1whIFdaAzoj06RbwSmtpGhG1HG82K5DMW0s5/aWor5vFPOvAHXLGUiRZp2BL
         cAvhEc5g5LkQZ6T0xUlQ2jguOdPMAeN041Yq2JqDGpJb4kzBcSypaiv1zy/odrDGRGPM
         4oIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx+9CE8yoosq5olLgXHmKK0Ai4QsE2NasYj5rrQnHPj7SYcvF2km/MnT4lmkFqjoXDD2Nwat0cFqANMfhq3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcgMH1zBOFPclkGbRLqBom+In7izqHMfdOZWCnNks+KMdmYvTJ
	3J39xVhs35EwV8KAxulnld9tyIxIDjAoh1MysdjdH3GBHgWGc8FkONpCBMrdi19jdzulET6kQ/A
	=
X-Gm-Gg: ASbGncviPEkU4mK/eZZdOCnwdooymKdk9VKQYk00lZt5HmcnGYR9H+1Gf2jbvKGVe1v
	LLMc9ZqA08iCfw84SoOQxzUCJ6E/ElNjeHOzQBWk1AePptDyymSm0YThJVRHZJGL1oyE82JUFLJ
	KS6tnGEQmm3iAkMeBcNUnX4z4PgQYtRlD3LaprCkkKF9ExvuSAWTneHbbAeHml9eszprryrfO9A
	mOpErtrCwwZGKUlMCPNUKPG0zZl7uMGagRL5Ei7XOycIMbiNKduwh3az9SaxmDCPowpp/TK
X-Google-Smtp-Source: AGHT+IFb/j40l8RyXKKBP91IUhP6PaUxTTbrpQWP3pPlzKpxqE854bcUMGQOoZq9SqoelV4WQPakhQ==
X-Received: by 2002:a17:903:230f:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21779e450e3mr25924325ad.11.1733901613656;
        Tue, 10 Dec 2024 23:20:13 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e41e52sm100214925ad.3.2024.12.10.23.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 23:20:13 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v2] remoteproc: mtk_scp: Only populate devices for SCP cores
Date: Wed, 11 Dec 2024 15:20:07 +0800
Message-ID: <20241211072009.120511-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_232014_761113_42D3D5FF 
X-CRM114-Status: GOOD (  12.97  )
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

When multi-core SCP support was added, the driver was made to populate
platform devices for all the sub-nodes. This ended up adding platform
devices for the rpmsg sub-nodes as well, which never actually get used,
since rpmsg devices are registered through the rpmsg interface.

Limit of_platform_populate() to just populating the SCP cores with a
compatible string match list.

Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Cc: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Fix commit subject: populate devices *for* SCP cores
---
 drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 0f4a7065d0bd..8206a1766481 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_clus
 	return ret;
 }
 
+static const struct of_device_id scp_core_match[] = {
+	{ .compatible = "mediatek,scp-core" },
+	{}
+};
+
 static int scp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
 	mutex_init(&scp_cluster->cluster_lock);
 
-	ret = devm_of_platform_populate(dev);
+	ret = of_platform_populate(dev_of_node(dev), scp_core_match, NULL, dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
 
 	ret = scp_cluster_init(pdev, scp_cluster);
-	if (ret)
+	if (ret) {
+		of_platform_depopulate(dev);
 		return ret;
+	}
 
 	return 0;
 }
@@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev)
 		rproc_del(scp->rproc);
 		scp_free(scp);
 	}
+	of_platform_depopulate(&pdev->dev);
 	mutex_destroy(&scp_cluster->cluster_lock);
 }
 
-- 
2.47.0.338.g60cca15819-goog


