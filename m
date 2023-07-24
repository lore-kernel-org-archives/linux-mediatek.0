Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C78FC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 01:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SFyAans+BdocrYnxIwOaxHQWj8A+PfWnkMiPJ3aLok=; b=2RGmE2uHKYvzWLlAwY5friO6Wb
	1Kq3RBG6mlSgHHQWfIeJfygoj12oHmTyWXcQ2omdMkPsCXcfse6AMQT0wbw92TLShzvFLWuoWAOq8
	H78FlY6pWPqi6+Hb4DZT9oJ6ndGs/nErV2IUk9Vwjjw5SPt/UjTOf7EV0yUr/vVFUCQ4MvxwVfpgO
	XIu8742d6kOkNyb6Ekn4s90npdOpdFS7UUtY+mIU0K1H8O6RLeDFyQrvgYrlBvyxVUfqq5QC/1VXD
	Bz9kHOL7F1WBJstrx1BmK3FOkARlbcdtszAxvMhSlppHlmO/IZ6UQ6AAhLsgPV8bHpuSGUW3J/UAg
	3OyeYOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkSC-002OQQ-2E;
	Mon, 24 Jul 2023 01:33:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkS6-002OOP-1B;
	Mon, 24 Jul 2023 01:33:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BADD660FF8;
	Mon, 24 Jul 2023 01:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AA8C433CC;
	Mon, 24 Jul 2023 01:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162413;
	bh=aE6R5/LUDMOcNOLRnGALpC25FChiJ1VOZIwrp4XhCtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVetLGiKd2ykwJf/hui4Z/xEDPUXLwaTtQkrRLlWBs9k/JMld2Md2/5lge4UVFsJu
	 chfo3GgXH+tVKboO7bPIC/FWFPQhVyuYkggA6IGYpRpBtn9zzzJRsoCZc59wNiDpbz
	 dEeRtvSe4IWjlfUTYWgQ0nG2RcHZvirPm7mjsBf6TP1FEmkzSvpWyqAIX/fhL5vzyW
	 X051rIipLBCFt9zolVTA17VNzi4itjt/hDfGoMVI0etXxyUrfky0tzHmB8hzevTtcD
	 98dUphOUxqnxeQYZ027prhO4QWMmTajIUtmomjLP8quQL1bp+L41t0YgHO1izzyKQx
	 7nGMlJal7uxpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	minghsiu.tsai@mediatek.com,
	houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	tiffany.lin@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 04/24] media: platform: mediatek: vpu: fix NULL ptr dereference
Date: Sun, 23 Jul 2023 21:33:05 -0400
Message-Id: <20230724013325.2332084-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013325.2332084-1-sashal@kernel.org>
References: <20230724013325.2332084-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.121
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_183334_446754_D199EB90 
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
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 7f1647da0ade0..af59cc52fdd73 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
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


