Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E2EEB57A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 00:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w1710vM5u5m8Ud3d4IwesKmTX52HDiDKKYgHLCNHmFA=; b=Bn0Og+UU1uqZcJ/7QvhWnSQeyL
	lxyKftO/cu31mkm6RdPaGRo4dcow0rG6wqDP2yya1p3d6iF4MJzqU+1mTjRbcxcOirIHOyeouSeNB
	rf319sDJrKOG+QQIVzviXyDrtDA9PG6gy+H1ma3zOHQjK3mkmc+xqu0Om6v6Rsytkxuecge653evi
	S0+i8csTcq59yv9U+tVzYv0DhRQwX7YNZCU5/gz9+lBG2oscB5VI6SI5pgiPHIm1Z/Nfc0nnanjnl
	phmtnmfojWPOwMjpiy0M7Rc2yQn0x/9u2EVZbOo8Wrv1I1V466PoElnJeTuK/YtXj0TsiDrjVifTx
	4XeoqYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qelxO-00EmCO-0g;
	Sat, 09 Sep 2023 00:36:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qelxK-00EmB9-28;
	Sat, 09 Sep 2023 00:36:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 244B3B82215;
	Sat,  9 Sep 2023 00:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DD3C433C7;
	Sat,  9 Sep 2023 00:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694219767;
	bh=guUZwgwpptycEhh1UBHNkj0x7bnqCz7pkwBOOnAQXcs=;
	h=From:To:Cc:Subject:Date:From;
	b=lps+1660wPoW5Noj5R6wns2MCbjAaVEQoUfyntA4jxAzVf02vUE13GvUoyv0rdttc
	 pOm2xZuQMW0gSn9W9xS9beH+kf71qusDQ4FQoCo1e++o8VYi904R77APd5sfCrsBWT
	 p/LfOIDEydOMa6Hv2o+4sXaz4pbyrH9/sc6murhs3W1gMEoOR4VMjepXAYwM0aXFbM
	 +uGYOv01zalup7fgJZoC+VIvzt0rv5ECH3h1MayzP+SGx1uk4EN7jb/HeicK3uuYTD
	 YZ19se4gzV9PkL+2wowpL1/QIGLoxxhitvcx7WFfWRgFNsC8C7v0GhA+hqWfaPMK2v
	 Zs4h/CVS3xG1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lu Hongfei <luhongfei@vivo.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	moudy.ho@mediatek.com,
	sakari.ailus@linux.intel.com,
	sunke32@huawei.com,
	arnd@arndb.de,
	drv@mailo.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.5 01/28] media: mdp3: Fix resource leaks in of_find_device_by_node
Date: Fri,  8 Sep 2023 20:35:35 -0400
Message-Id: <20230909003604.3579407-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_173610_844957_2DF5C7A3 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

From: Lu Hongfei <luhongfei@vivo.com>

[ Upstream commit 35ca8ce495366909b4c2e701d1356570dd40c4e2 ]

Use put_device to release the object get through of_find_device_by_node,
avoiding resource leaks.

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index a605e80c7dc36..b0ca2b3a8a739 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -892,11 +892,13 @@ static int mdp_get_subsys_id(struct mdp_dev *mdp, struct device *dev,
 	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, &cmdq_reg, index);
 	if (ret != 0) {
 		dev_err(&comp_pdev->dev, "cmdq_dev_get_subsys fail!\n");
+		put_device(&comp_pdev->dev);
 		return -EINVAL;
 	}
 
 	comp->subsys_id = cmdq_reg.subsys;
 	dev_dbg(&comp_pdev->dev, "subsys id=%d\n", cmdq_reg.subsys);
+	put_device(&comp_pdev->dev);
 
 	return 0;
 }
-- 
2.40.1


