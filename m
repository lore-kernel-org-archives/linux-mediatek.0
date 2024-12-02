Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39A3D10DA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 06:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=; b=3GEAtKrpnJ26ugTJKqDaIF//Ls
	820Zhrkln4w54xqnPCC1pkcTAkZh6J2+68+Mw8uUmDQ0/Di4pFc9wUxxODTEZ8b2imUP/LbzPS/VY
	RxHlN1RmWC3D8y4cAPKHGwd9Lk8mCwp0UO4dlDQPU/YB6BT3nt7rNH6t3eA72AzC/w152grAhDo3c
	l+mSDyq7N6lK/1dR0RNOFhLAgeSxEuGnOQsHSa7n0eJN6hr3EOI0VcnEPaniUBcfEwJY6HT213yzV
	daDaYiuIhlTvTYLMay0M8LSXne9Ya6s36nzpErgpiflmSGf4t4wSRtvNE3wFUBZXqS7j6djgw/ft8
	rELX2CsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHzw6-00000005C0K-2y15;
	Mon, 02 Dec 2024 06:29:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHzv6-00000005BsK-1qrc
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 06:28:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21271dc4084so28101675ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 22:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733120911; x=1733725711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=;
        b=e0dGD0Bv1DgAE77AdS/D9E6F+0UeqX2HITjtLO8R9enjs+OSnGOlkvRRmBI26Z5Wzf
         nci9AjjgCFF6nZ7DyAC9O0iDqQeJuQdKMVUn7PUXfKLPj96NCFuBP6k1FKEHD/FkHonw
         dBjwbjIfRJtSeGkzOUJx07U0BuLU2485WVAi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733120911; x=1733725711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=;
        b=pyXBXXffQ1F663BQVffS64irlNBhBqsXxtPY080hqt9OXl+u2XEMv8sK4KXxzMoZWX
         YaLi3ciuWsjZJOWl+bLSya9ilK0eYhjg9rxNkpcJzU4kSAdmFLbGzbIUSqXOESzS3d/e
         Si8BR3hlbtnZe5mVMCFZBZKIPzNTcSuxSmmaMLoiHjdJ1dpec5GFRqJHEJKgvaYekdFS
         IhQxrxJ56j3j63yKwYeShFxYUItW6pu8ZNeglFCNpDHkl6r4h70UtaLCV3nAM3hExrhd
         EYdg1stYp4cJfejlOeKm0BjWrVz1Am2I10q0N0U85RZLnn0js5Kb2U/wK+6zy9FO8Efh
         XMhg==
X-Forwarded-Encrypted: i=1; AJvYcCVZmxIRWN6w08yZKD9bGUJee8eeLltR0J6ZuwlLs/6BU7dhg1aN9POHpyU/uqerUy0SAN2q3esONMLSSASe9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5OhEar/kqHmeE1C5RTxyFe9R39xXaeZwRstc/ahvfwuwW723+
	Ni0ho1Izqi7/k8mP32uf8GtajyxmVd1xhtcCTMq1K0Xz4BCUgb+DI9VAl1m5dA==
X-Gm-Gg: ASbGncvsfjAlXHoVarddR9UIsUrChEDAqN5Stya06IIgkwsL4qolOMrsUbH2lYjszpF
	CrSRdp4aZQIgY5MFUNJi0BngughWYMTy21Glgy0HYFHAqPryJdrbqvPNaJc8BIkC/ZhmP9TFpmQ
	wsd0ucvhcjLPJb2+aZIo1jE2PAPSYeQIu5jACdpIf1wRgico0RWf1/qCnKlLNgrmOk2XQ74Si9a
	VuY0UoCNoeSnUMPMvBJbHcJFUqKYZ14d5+tpgkBEh3Q/mh3lFvuTzA1JKIf/DexSD1M
X-Google-Smtp-Source: AGHT+IHrImvV+P3fnp6O9oKMYzWe60hrfjJ4izSDkEkKWNLOabp7zSbgf2dW9C8Dph+qT+k/E/6L3A==
X-Received: by 2002:a17:902:cccb:b0:215:89a0:416f with SMTP id d9443c01a7336-21589a04ec8mr55693695ad.30.1733120911505;
        Sun, 01 Dec 2024 22:28:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215361fd5a6sm58878555ad.94.2024.12.01.22.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 22:28:31 -0800 (PST)
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
Subject: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
Date: Mon,  2 Dec 2024 14:28:25 +0800
Message-ID: <20241202062826.66619-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_222832_476650_3C80FF4A 
X-CRM114-Status: GOOD (  12.69  )
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


