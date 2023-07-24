Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BA7C001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 01:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdzv/PeemQyUm1Q9yWlGLSRVFIClngqSRYEmQmXVWl0=; b=csxURa6fQWx8Usi3d71LvYHTJd
	5Y9GXA12bCqdNpgP1XsN4BErEy0pQWUkWFU0h7IEHhIyADc6rdsK4qDvjZqJb3pZVUJJLvlcwkxy8
	iO1+nWeLzYEsX2Pd6orN+ZusjPoG0d25L6uQiop+dUjkt+ORPsyJJ9KU9p/2KPdBZnK7gGSWJXLbT
	StQDuuphl2XB4VZHcXse/ifXTa8gDQg+RxlBATGotNEcoTw1+K2hxWAJy0RT3oBGa4zrm3Ds43CcV
	l2JI/uTSpmzvlaSJRtuhD+Qi/Djv7PG15uFioZZ/KORJOHShp1lhnGnqMvcowmPmfEGPZZvURX7F3
	yt2Su79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkQe-002O13-2E;
	Mon, 24 Jul 2023 01:32:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkQT-002Nx3-0H;
	Mon, 24 Jul 2023 01:31:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D1CB60FAA;
	Mon, 24 Jul 2023 01:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A482C433CC;
	Mon, 24 Jul 2023 01:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162312;
	bh=c981O8wuVun9esepfw++HUguwxtUWbBn3o4RYZoaNMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C9A+q5LdkO+NXl0+5BvZ+2q+oUdPuA4Lrm39oUZORFSQkBeZ+a5eg+lABeUkmUbwH
	 8nc/8m2yF5Mq8iM2qNfh96MFR80FupHTdJG3BmbZFDeyTvBgm9M/jJDmDJT1o86xfq
	 gZspXrfv6SgQ+G7SKBjFrgM7pZASoH+DJrhY2YFnc6GIbpyyESYpHuqGEBSQ1P3h02
	 nQ940ARfQxYitv2yekzhH8kNasBkY6Ss9VwDcsIlmmVcxKGCH/hbfzZcmiqXef6MjF
	 peP5K5jah0LiOBecSlYcF9HM09sSGB9FGRrV66hAD4KcYFpvUH7i9d+gPHNzyTtGWh
	 VVKeV1dXU0DRQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.4 07/40] media: platform: mediatek: vpu: fix NULL ptr dereference
Date: Sun, 23 Jul 2023 21:31:07 -0400
Message-Id: <20230724013140.2327815-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013140.2327815-1-sashal@kernel.org>
References: <20230724013140.2327815-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_183153_165127_A855B73C 
X-CRM114-Status: GOOD (  13.15  )
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

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 3df55cd773e8603b623425cc97b05e542854ad27 ]

If pdev is NULL, then it is still dereferenced.

This fixes this smatch warning:

drivers/media/platform/mediatek/vpu/mtk_vpu.c:570 vpu_load_firmware() warn: address of NULL pointer 'pdev'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 5e2bc286f168e..1a95958a1f908 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -562,15 +562,17 @@ static int load_requested_vpu(struct mtk_vpu *vpu,
 int vpu_load_firmware(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu;
-	struct device *dev = &pdev->dev;
+	struct device *dev;
 	struct vpu_run *run;
 	int ret;
 
 	if (!pdev) {
-		dev_err(dev, "VPU platform device is invalid\n");
+		pr_err("VPU platform device is invalid\n");
 		return -EINVAL;
 	}
 
+	dev = &pdev->dev;
+
 	vpu = platform_get_drvdata(pdev);
 	run = &vpu->run;
 
-- 
2.39.2


