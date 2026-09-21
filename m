Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3606C982EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=; b=dSiHprojzngXOeiSPIMef2zwII
	BckO6DXY5DJZj+Fwqs1aHPKDUWlWanXQOKH9lvCTUrkgn1xKSHNLnJswFsPMdS3FBJsQ0cSZoiaPQ
	B7kmkBInpmeCnu710Y4vYRFP7e86z5Fh+5gThqSn5vQqbIVlaVn60zHLjXIz2ay+Bz8kezt9gzbG5
	6KdFii6q5G+tGQlcAlxIuVNu+gQ3miSLM+h1yszIdJZS9EVlyjZeCUFh0SdxyhfXfp/oPlxQcXDTu
	Gd9ekCE9lANNdSOh/zF5Kfy4f1I1yk3oCr6ZsBoGJo/hq2CZ33c56TKSc98g9gc6WkhNazh+CezHJ
	5Efmh1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dos-00000002Cpq-0hFe;
	Mon, 21 Sep 2026 13:12:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dop-00000002Cp0-26fp
	for linux-mediatek@bombadil.infradead.org;
	Mon, 21 Sep 2026 13:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=; b=bTdpu8LTt0yrz8mX3E0FeUkYqy
	loA9BZ2iKoULbGc7e2zYhDkVGVXn0EkbEwOUw7/dZ/uvP5ecYNAOCPlKPmj+FVNpL/43n31urtUvJ
	BvEMG93qlwfHuOQ16VEPnpOZuskGbKS9lcHLVz9Z4k/xqlxs8q34iZ69ga8Efwop56HWRRJmcq29m
	bkL0IcGL+F22IwPV9wWDN/a7S4qeXK5FAP7GNGQmryokxSTKAiRpZqdZAJXAzxvvbU+zGOzAVHQrH
	SMRsdKACdaIOG0HvSjBEVHvHHWxIQWkWjPOaLqmBFpL4LMwqFfw8t7ZR25yC+bUjzm84+FVyDbo4q
	WjCVu4OQ==;
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dog-0000000CK1Q-3Gx1
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 13:12:23 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1770564a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996331; x=1790601131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=;
        b=Z6UymCX/JPIOdXycQdxjHxYeLld2jtSWcWGPuG38o5bf70csE/wt6RQrV1EWM+uTV/
         0FltAvdO2cWfTVC3sqhuo+sn9Jmvwcw+w27SxdZ0Sv1uT7VFu8zMDU+USSz3mgb3auvF
         R7jfjMoeRYjuGVlA311HNIpxToh7F1412ZoGK8aaY4IsIcOFIMBJcKQXMWRTbPvwBjyG
         MSvjIP4uwusBiF5HmmEn8le/bPqVm3K32ER984zICWTLlROKDlvKxjLMIyIUxjVBpDzV
         1FA+uhaXCfXpE2fRY1ayBPCU0aLqq54F8OyvNZ1a1TRbxu8a2rkIGWK+AUJPB319WAMF
         J07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996331; x=1790601131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig7/HqBzfoSVv6fdudTalNiMgAfFIlYLiYgMPPiaeeI=;
        b=ZdWP0pks7MjnQZAWRo4SPHSP4Lvnne/p6d4qYrkgRQA8S1gSqz7YR30GS9yQdL2xMo
         qF55Vjp1XlObjP5dlxWcpc/nlp5mgbR7cMhjKreLMQZd1wE4oYDB2lLof6uTn0WUn7L2
         GPKJ9AHlWZUHuvyo8bYprjkIovZlGtRPgtMQUSKexOZGpONrRxoXyUiIxMY9yRrwLnex
         WvFR1WyjYmZ+2egxP+XOCItv+5lIZBB9XPoZPxg9DLMwobB1IKBNAk/v4Rmi7qKxVcT9
         U6QpfeqmpDwTHtl4yIg4lD6AUXMTnS9IxmSumWiGCD9aiPcIlSHGvmLGyN5V5WR0uiSC
         JWYA==
X-Forwarded-Encrypted: i=1; AKwUvBwtbHJgdnEkuVjfc2BkeocY97DPvvHzolMvTVIITJyi9H9GM3YdW13ZyHSUfCPEfI4SNcxTmRByNTqxJWp3yg==@lists.infradead.org
X-Gm-Message-State: AFuF++mIO0q8WR5J8nG1DGO3esSR/4wNuo9Y7bLi6262WJ0oArr3oN7D
	5AnJzqZ33gm4tTNGpzyhIsYmEYG8ZAcnbyuJ/f7oRj5jToDOfK2X5yTy
X-Gm-Gg: AYBFou3fD8EEpkuTkjDdLOVr90qRup5znfAHNfgQVnPuMayjGbH0OKwOAO9rWwoygwT
	/1lonQH/4AaqeJ/GV+/5WSvJzc7vLm6qxThs0nREGXESu7o2JPF9AOzWYViIqiHFFybBnuF34xe
	ikeOcxJpHM86PJ6G4H4BLyRvjFxy/Y6z6RjSagmAQwHG3UmVwsYDWtHPLjfvsegi9tfOllw4WIW
	E9jsUbPbdvTETTTMn+wKpo3+lr9EpJg+kICZ3wN6pIhqccy9MHM2F0xiqf89fde8BBLk96hgwxv
	kyW2NMLk0qcZ+277Qvu+kvfDlfrsErnnoovn1sv4EDQRowpnOLU2sXhOx2dSF/k7YRKHM9aGu++
	/tBQ7SjotkH9JHM3gwtD3v3iyFW1PqUNCxbFzBQs5EwvNhPQLOLM+H9oendVg5vsx8l0dnbXKyE
	j+3VOeDMHrC1D5V8sbwkoel+GmXhA9j9MZz/7IX4WcISeu/5CcIkGipVG9qkSfEIlc
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b64 with SMTP id 98e67ed59e1d1-39e6c6a5438mr8799720a91.46.1789996330968;
        Mon, 21 Sep 2026 06:12:10 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a063bcecc6sm80447a91.12.2026.09.21.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:12:07 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Nancy.Lin" <nancy.lin@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: fix ovl adaptor platform device leak
Date: Mon, 21 Sep 2026 21:11:56 +0800
Message-ID: <20260921131156.403652-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_141221_789975_C2B4648A 
X-CRM114-Status: GOOD (  15.09  )
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

mtk_drm_probe() creates an OVL adaptor platform device with
platform_device_register_data() when the display pipeline requires the
OVL adaptor.

If a later initialization step fails, the probe error path releases
the DRM resources without unregistering the already registered OVL
adaptor device. The normal remove path likewise leaves the device
registered after the DRM driver is unbound.

Keep track of whether the OVL adaptor was successfully registered and
unregister it on probe failure. Also recover the platform device from
the stored DDP component device and unregister it during normal
removal.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..d176e6496aa7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1060,7 +1060,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	struct mtk_mmsys_driver_data *mtk_drm_data;
 	struct device_node *node;
 	struct component_match *match = NULL;
-	struct platform_device *ovl_adaptor;
+	struct platform_device *ovl_adaptor = NULL;
 	int ret;
 	int i;
 
@@ -1205,6 +1205,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 err_pm:
 	pm_runtime_disable(dev);
 err_node:
+	if (ovl_adaptor)
+		platform_device_unregister(ovl_adaptor);
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
@@ -1214,9 +1216,15 @@ static int mtk_drm_probe(struct platform_device *pdev)
 static void mtk_drm_remove(struct platform_device *pdev)
 {
 	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+	struct device *ovl_adaptor_dev;
 	int i;
 
+	ovl_adaptor_dev =
+		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev;
+
 	component_master_del(&pdev->dev, &mtk_drm_ops);
+	if (ovl_adaptor_dev)
+		platform_device_unregister(to_platform_device(ovl_adaptor_dev));
 	pm_runtime_disable(&pdev->dev);
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
-- 
2.43.0


