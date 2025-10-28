Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077E9CCD1BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPmRM3VeKNo4XOZAQO7SdSI7/iNf4sheEvqk3VgJ2Nw=; b=ZKzTHXmvTEiwwKBaNn2yzpMd17
	KcAny0MzjaREqP1PqspOZ7f4UqrCi5EQMd+7FyJv+SQiyZOBZlPx0WkI0afCHIu+lkTY2I5lyyFpM
	3v2bgMTO2riWdWn1LOePJQloaBIhLApRHiJwn8kSoLfE0dYbKKvj+kLNIIki3REZF/RCyGUF9aDzB
	DvcNY0eXtt3OYlvRBLEG1Rrdl20X3yf8dkI0uZo0LDpPwoWCavbJWOAi50akQ7Fes/1/8tx0qDEVc
	Lj6aEVtXcwoCNZjH28EahLX69yFaPsmZ1APxzi7fVfKCu09y4tuxGWVOWkGvjjeDtzMYiiY0rFRhO
	6SeVc+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDga2-0000000FiLL-0pFi;
	Tue, 28 Oct 2025 10:05:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgZy-0000000FiK1-0iEB
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 10:05:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73C8748D04;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509C2C116B1;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645925;
	bh=TfW/tywFiRgcc0zHJ++gyx/6TvQ8+E3j1OKY3czA0Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V4x9RZLdIKkGYFssGzVS5imlOjLkTcnWQtzdWBnNcs1N8nT5SZnAkEmSeRUCv1IQi
	 Eu7Ps1wf/Kiyp22faeVDqi6FfUMG2xhSmvHPHqn3IQjN03KSSX4DrR0fYWxytA8bsz
	 Dhmlush1lyIjr/7DgEfdnjt74llmbN7HvLUXVnwKFHZ0A8l908+F871P3qdH/mscW5
	 A1YlFujrZrD9QaMv6ie25uFz/akUUUZrD5LDDRmJXKOByx4EP1gWqbPuoBT8M3to1Y
	 fqHfIAV37cBM5ySXxZNJS2Ndeq/1P8vg/NFebw43PyVzIjKlhRkutpXcVw+1pAXjB8
	 M+6k/nwvmTP1g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDga0-0000000014i-3i9z;
	Tue, 28 Oct 2025 11:05:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] media: mediatek: mdp: fix device leak on probe
Date: Tue, 28 Oct 2025 11:04:53 +0100
Message-ID: <20251028100454.4086-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>
References: <20251028100454.4086-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_030526_476542_558E182C 
X-CRM114-Status: GOOD (  11.65  )
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
2.51.0


