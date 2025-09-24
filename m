Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682EDCAC5A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHkyOKHXgkfKiKAlVtCZbhNOlQiNxd1WUrvn9aGxjkU=; b=HrBCCtdpR7Xoo4j6nz/wza13Km
	MOecnr0HZabI8QkDgLmhjRBkm0reBGkVUb3fvLCQo4PUovD2RaeAzd8gSwlshnndSQ53UqcOmOyYf
	VyjQry8ZUYC4CtmWYKvikoMyta8mZ4fQXm/0zuiyPhAT2n5WeNNWpKoDpTLEHPLPvW3i+b2vprl8e
	Bu5Ov5+OSB+1my4j2hrPmUsLVfnJ/zQX+Exu7HzsNe7sMt806wVWkx2JPfo4acY5GfERr5IFTVaKD
	CR6GUQjPEP5Z2MeoyrvOSxXTRw6GpkhPPcRmgQ9O96TXNqgQrByd55q7s/6X5FKDArr5nX+yFLNHQ
	mnIamhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QfN-00000000lie-0lgH;
	Wed, 24 Sep 2025 14:40:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QfL-00000000lhM-0n5t
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 14:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9399F60007;
	Wed, 24 Sep 2025 14:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4305FC4CEF4;
	Wed, 24 Sep 2025 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758724818;
	bh=4T26JdYYsM1e+t3tkUnI/PC5m7zquhrZvJn75mxBUl0=;
	h=From:To:Cc:Subject:Date:From;
	b=l7HITxtpfw5v7AfGaQb2F4B2jNmtn0RMw5nDMlYyZh5CyjHb2YeLlgXAeHLhL6A1/
	 pCa06CyLgHxfv1Q5OCSyjeI7cyBVwYunS6Y7OQ5eCv1vfqoo0/+TwDreRuNvxlNtc6
	 JRMn+7PhugLkWlyK8dSlC93FrLVLwlCyInGq2IWS3V9lQ37ulUyuvJuE6X7IDS+1cO
	 8W0zWgbA6cpW7Non7OA+oc68DJtF0U0S4j7dKuBWIcF/XEE/DfBNwd0A1CaTwmPpAN
	 K2/7StV3wfKP8Tamry23SHIdYVjkWvelRkNbgZD6w4P1V9dLAD8ednLAprAV/UbP5b
	 yFYtrMfPTveMA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1QfD-000000002vR-2p10;
	Wed, 24 Sep 2025 16:40:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH] media: platform: mtk-mdp3: fix device leaks at probe
Date: Wed, 24 Sep 2025 16:39:19 +0200
Message-ID: <20250924143919.11183-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make sure to drop the references taken when looking up the subsys
devices during probe on probe failure (e.g. probe deferral) and on
driver unbind.

Similarly, drop the SCP device reference after retrieving its platform
data during probe to avoid leaking it.

Note that holding a reference to a device does not prevent its driver
data from going away.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Cc: stable@vger.kernel.org	# 6.1
Cc: Moudy Ho <moudy.ho@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8de2c8e4d333..fc117a6a822c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -157,10 +157,18 @@ void mdp_video_device_release(struct video_device *vdev)
 	kfree(mdp);
 }
 
+static void mdp_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int mdp_mm_subsys_deploy(struct mdp_dev *mdp, enum mdp_infra_id id)
 {
 	struct platform_device *mm_pdev = NULL;
 	struct device **dev;
+	int ret;
 	int i;
 
 	if (!mdp)
@@ -194,6 +202,11 @@ static int mdp_mm_subsys_deploy(struct mdp_dev *mdp, enum mdp_infra_id id)
 		if (WARN_ON(!mm_pdev))
 			return -ENODEV;
 
+		ret = devm_add_action_or_reset(&mdp->pdev->dev, mdp_put_device,
+					       &mm_pdev->dev);
+		if (ret)
+			return ret;
+
 		*dev = &mm_pdev->dev;
 	}
 
@@ -279,6 +292,7 @@ static int mdp_probe(struct platform_device *pdev)
 			goto err_destroy_clock_wq;
 		}
 		mdp->scp = platform_get_drvdata(mm_pdev);
+		put_device(&mm_pdev->dev);
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-- 
2.49.1


