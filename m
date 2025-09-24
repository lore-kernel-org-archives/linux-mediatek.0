Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1627BCAC5A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jBrr80FiK6zpr9Wl7ohdKL9X+a/ttpELAyyB8GLY0g=; b=IrGyIR29ZS5oogUEyqoE6hhGpK
	mvg2cwkKja0btjPSRNvxs/eTCISJlF98eFJwGW0TxXgdBt3ivREkvWzIWRvQ4IkHmr9Ct54x+Kgay
	me3QaS6l5J51Pepv9myTUpV5bs6JL7XlcbUHZCfGCmCpKwN9RVmhMzqRLrqz1KsunO3ywU4xZ06vm
	RJSqS0GZ7qwE5JAROZetPcFdt3++o+HtJwKsZXggpAQd9LWIKlKCXM+fMBjYW6wJvbZM43SCCFM1n
	OAvSJ0iwF+MUj9NIE8JZgdxoYGVZHiyOA2Idpek9LGWE5oUG8ru2VhGTMzjT20WHRwj5XwB+suZQA
	5fvMT1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pfd-00000000Gpy-1eZx;
	Wed, 24 Sep 2025 13:36:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PfY-00000000Gjv-3ADH
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 13:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E95644BBE;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE7EC4CEF0;
	Wed, 24 Sep 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=OIe1RuE43WcLPQslx97SFCWinjb/HwQHW7IH+6ElOMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtIHGdInBRc3yBPYTTl8bd6Gw43MVEvPaahxJK4j6raLfkd6fZoluUh4cBWKxzNVp
	 xLSTQxJe4q+gSiulkb09xEqcVgJS8RVTPhaJR7Z3PTYRJQ79AHbaLZqn3n1HbhEoX8
	 goXBkui6d/aQ+Plq7E/V42ox3e62lpM73FqVJVw27a5vdZYs2EFN2/72ZmMe4W8XkN
	 Fv1LAuZeSiq0mhvH1ePZu4iMSH7f5K8MpRhVJCj1QJ3D3KKez9Lr8vshAm7/P4wxI9
	 iJZugM0vRtSkEfwZkIlNXmY4fAlMPm0JOLlywLHfVJ6q2jAVTw9o83dR9t9PfpSwdC
	 xeqajp8hQygpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfR-000000007Vo-1fqE;
	Wed, 24 Sep 2025 15:36:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] media: mediatek: mdp: fix device leak on probe
Date: Wed, 24 Sep 2025 15:35:51 +0200
Message-ID: <20250924133552.28841-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
References: <20250924133552.28841-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_063628_850796_4299C937 
X-CRM114-Status: GOOD (  11.57  )
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

Make sure to drop the reference taken when looking up the VPU firmware
device during probe on probe failure (e.g. probe deferral) and on driver
unbind.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org	# 4.10
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..5c7dcf4090f4 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -198,7 +198,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_put_vpu;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +206,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_put_vpu;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +214,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_put_vpu:
+	put_device(&mdp->vpu_dev->dev);
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
@@ -241,6 +243,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 	struct mtk_mdp_comp *comp, *comp_temp;
 
 	pm_runtime_disable(&pdev->dev);
+	put_device(&mdp->vpu_dev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
-- 
2.49.1


