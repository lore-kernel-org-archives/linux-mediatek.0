Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7202DEEB57A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGUEIe6Z4rz3HNf9iluNiZ89HQYpBXxOHI2xN5e3S0k=; b=j5C58qv82Hu9bc8t7IVGBM+sV8
	U1Ie/LxcIO1dGba7VU17CR7SZ6Gl8sDo1SsI9i33wMksb/SL3OUSsTTW58CuA0dKKeyV64x2Gadxz
	EqbdFljjFm/Hcyl996zf55uLlDaApmLxSWyriVpVc0oVsJ65M5ApFWJtkxzx62btwZmsGolUm/O/u
	OI/0lBd8rDSVILnBbV314d3ronca14IPAm0eu0kDJEZz7kGpnnq/lIGZhyIBeJ6G3QoLaY6Dg+QzG
	aUN4mgs9qHYKuekaQ8srQQmqCqLqe0TJHfCo7LAlaj1M4sha0Q+ekPKRgFoPiZvUOdQ6SWsMT7rgv
	uvIEujMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qelyX-00EmRw-0u;
	Sat, 09 Sep 2023 00:37:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qelyU-00EmPa-0W;
	Sat, 09 Sep 2023 00:37:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 420AFCE1CE7;
	Sat,  9 Sep 2023 00:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16909C433CB;
	Sat,  9 Sep 2023 00:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694219838;
	bh=8FQ5miKYPRyNfQwyR/VE0KAeVwlRfmYE3qnqZyRfi6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=MEsuYaZ6KON5uZiLU20Ni03Wt9YMl9vAgxCCSKSvPV+flrEmdywaz2gBg8CePdvB8
	 d3ZqbZ7FUrvHElOMuSjBn7ullQUazTAfXcgWLB7H3rtay0f/Li0kjQ/Qtevnc8jYY0
	 xUcuVtPPnRID5mAUB6TdH2845BI3BK4ZnitV4ZCQzeRaH8dunurwiSXSvUtW4KQpeE
	 1+26Is3pdRgkmI7NyA5bq0Jmx31qejI/o8+7WXDoxE8KJW/BQ4CrxGZHdwNivsSIPn
	 W6WEKek8DYeqGVcKsuPWv/jwSVg8J+57RTTEpJF5TNzGKn2JU2cyGeDoFpHbmPhw42
	 k16YA1NzqTGkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lu Hongfei <luhongfei@vivo.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	moudy.ho@mediatek.com,
	sunke32@huawei.com,
	arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	drv@mailo.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.4 01/25] media: mdp3: Fix resource leaks in of_find_device_by_node
Date: Fri,  8 Sep 2023 20:36:49 -0400
Message-Id: <20230909003715.3579761-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_173722_377017_36714330 
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
index 19a4a085f73a1..1fe10a21e395a 100644
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


