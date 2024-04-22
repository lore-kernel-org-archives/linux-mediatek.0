Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D53C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 23:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7eJS+TB7BO22Qaw+78qztUBxxhQHIOBENxKi+uEZKo=; b=Z0sqGOIe5uxmvxeErmbqtsFhEw
	Rl/P5u2CyUvJg+PfPyfanb9ODGmj2LHgD3yVIGhNdwJTUAUyPtpWDQ5fwnTo0FvpjI49JZAtp+UtB
	Ci9WROJSFxMlG/nOsDT/FpLL30Y7QVt6MqtLGTmj3QSjI6OSbPxKx/YykbOa3o9MNRt9STs5rnean
	eUByLHiIoUKgfaQSG/Dr7OMPxrGGuejlQ1HHulsgNeGZk8etK2CxOKwDc1YLJCEaKUljLxkIbqtYk
	jeQAI0OtF4LWDf18nMH3Oq937ihiiLObE7wVYXL3muncZMD8KbP6WzkfWt8Gfm0DosY9QITPrW+1u
	1KREwlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3ZE-0000000FSxF-3AmO;
	Mon, 22 Apr 2024 23:59:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3ZA-0000000FSve-38FH;
	Mon, 22 Apr 2024 23:59:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA0D2611FD;
	Mon, 22 Apr 2024 23:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAC0C113CC;
	Mon, 22 Apr 2024 23:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713830359;
	bh=mv36kwNPx9hcZbPXznQ5tA13wJIVJ592KdMHKYLTkec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EYFnszrvSnOa6TlFA5RNDCW3oy4hvBuRCOXWfeJcBpOWJeSR3eRZPEd07VC8FTQBE
	 5TZ8RVmYNVbjov7GWIN+qCU0uXDkCtH4JWqtREUN8ORdHG/Gtd15dMvLAhQvHJ6iAs
	 7rYsedi0+fr1XqBZ0R/xvVJT4xpCReWZ0jTJUmUAdFYDxelwv0KcXOBY3s3HsaCwLT
	 0FOH942i3jeav4dk3YbO6s/IX85NsA7XbizrY4x+a/g9wEDSJEhSyBeWJbR/Gmpp9W
	 kB0Mp+JBiQwyeGJ0yVPSFgUY1CfOb2VH8EZHRePZbes1h5MEAVAIk8Dl9I7k3Wt18/
	 rqNi2MlynWCow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Joerg Roedel <jroedel@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	yong.wu@mediatek.com,
	joro@8bytes.org,
	will@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 9/9] iommu: mtk: fix module autoloading
Date: Mon, 22 Apr 2024 19:20:14 -0400
Message-ID: <20240422232020.1615476-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422232020.1615476-1-sashal@kernel.org>
References: <20240422232020.1615476-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.274
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_165920_859528_CE1C7ED9 
X-CRM114-Status: GOOD (  10.32  )
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

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 7537e31df80cb58c27f3b6fef702534ea87a5957 ]

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20240410164109.233308-1-krzk@kernel.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/mtk_iommu.c    | 1 +
 drivers/iommu/mtk_iommu_v1.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index dad44e10b3314..2cf7d9f7fd3df 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -854,6 +854,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
 
 static struct platform_driver mtk_iommu_driver = {
 	.probe	= mtk_iommu_probe,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index fa602bfe69512..e0c1a19773381 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -543,6 +543,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-m4u", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_v1_of_ids);
 
 static const struct component_master_ops mtk_iommu_com_ops = {
 	.bind		= mtk_iommu_bind,
-- 
2.43.0


