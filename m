Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D04EEB57C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 00:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i+vdIi41NC/5jqFC8OuosB0ShYF3ReJBybMa87XYesU=; b=23Lcwqx8pqolBUjEW5rJGskihw
	dCpNxE645wUqloXDrl4F+1tvHslOtWXBH9LGU3jVdAVs0XzITtdMBZX80FzzkR1+cZJ3HxpEmArYp
	f1UrNPEnpOr+CXvc6CElQXw+0mA7p0yVXTg+37v0lUeRJcaDhEmKRdmfxgPhrUojcQHbfLdiMP0Bi
	+NBr2YjaBotSCd5DCE1VwbEulnc8LHiw8sql3FYgBh6/4/4iEuMf5hkPgtBtxSwaYHjBRGoyKf5Pd
	N3pMsQoT8CNF/EXoPevd+0+ff4GwjKAq431ine3dLpOOAp6NLobuWzlQxaWbS+K4WkgJ9xGe/yFDD
	uBdZ8Jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qelzX-00EmnP-2q;
	Sat, 09 Sep 2023 00:38:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qelzU-00Emku-0D;
	Sat, 09 Sep 2023 00:38:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5FFD2CE1D3D;
	Sat,  9 Sep 2023 00:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4309AC433CD;
	Sat,  9 Sep 2023 00:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694219901;
	bh=8Y9/Q46EDXsYGJ9s+d4vStc40jj5nKadX33sDIrDYM8=;
	h=From:To:Cc:Subject:Date:From;
	b=s7exa4SNWsAUMO0LjsoApVQndOuksmd9cvscDQXvb8h0WjXcnBgCl9/mRfhdzbLnH
	 /PpCP6SsPprBZDyWrhjmddJTOLINSq2pa7WoyvvtjpErpLQlx6KI8dCf3blix5b7Ic
	 82A1yS0zUK7tG2aimT3RHj03LVF3lTSX9vcfE4eE+uuXPr0IO7dF5Eeym/9XQRIH9F
	 Vpd2OCq16zXD/RaH79EhD9H26hXgb0QiITa/tTgvFeNC9azDCUDuYwJaSGJ/e5YyLC
	 +JOBdljilVt2jf5nHcYzle3VWEfZY5fh9gqHZ85gShUOF7QY3tmDFvM+cJ1EA4sX0v
	 ncFelbNL1l6DQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lu Hongfei <luhongfei@vivo.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	moudy.ho@mediatek.com,
	krzysztof.kozlowski@linaro.org,
	sunke32@huawei.com,
	drv@mailo.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 01/24] media: mdp3: Fix resource leaks in of_find_device_by_node
Date: Fri,  8 Sep 2023 20:37:53 -0400
Message-Id: <20230909003818.3580081-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_173824_282339_9CC46F54 
X-CRM114-Status: UNSURE (   9.49  )
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
index 7bc05f42a23c1..9a3f46c1f6ba3 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -775,11 +775,13 @@ static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
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


