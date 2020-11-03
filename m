Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375F6C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 07:44:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEDD2222B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 07:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKCo2Nq5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCEDD2222B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w8rcaDoN0CbRcm+rCVga+WfGOH9UX4WAOE7z/SXEGaA=; b=OKCo2Nq59eJM5KCw0n3LyicaQN
	12f4Kz0AsZ/x6xT7ou8Xv3ZkfiZzUcAntJa9Z5hoQmX883DMvGERCE/IhHQjdt9oQ0BdkimPVkS1Z
	BpaS6Dx1dl2Mpni+b0jUISeuAvRfNCB9R0wlWfREwXcKtZl3PgX4M0TbY0Mq+D2bgKVWpUvYBdy41
	iIf7FYHasct5MTsKfqME9CImpm6g2lLXaS4FpLCITn0LYbkZUX2YERDFUUS7o9N0MmJn8pqbBt5AT
	3ix4NASiiKbzmB7r1s7wUjBNghCeWYD5xzSmKUhoEj6FExdKfR7DqXHO7ZZlrjxTKZCusoZFIX4wq
	tPXO3Ihg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZqz4-0001yt-Bv; Tue, 03 Nov 2020 07:44:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZqyu-0001vU-NQ; Tue, 03 Nov 2020 07:43:54 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CQMGn33GyzhfTt;
 Tue,  3 Nov 2020 15:43:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 15:43:36 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] spi: mt7621: fix missing clk_disable_unprepare() on error
 in mt7621_spi_probe
Date: Tue, 3 Nov 2020 15:49:12 +0800
Message-ID: <20201103074912.195576-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_024353_116286_93D7146F 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Qinglang Miao <miaoqinglang@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the missing clk_disable_unprepare() before return
from mt7621_spi_probe in the error handling case.

Fixes: cbd66c626e16 ("spi: mt7621: Move SPI driver out of staging")
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/spi/spi-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
index 2c3b7a2a1..2cdae7994 100644
--- a/drivers/spi/spi-mt7621.c
+++ b/drivers/spi/spi-mt7621.c
@@ -353,6 +353,7 @@ static int mt7621_spi_probe(struct platform_device *pdev)
 	master = spi_alloc_master(&pdev->dev, sizeof(*rs));
 	if (!master) {
 		dev_info(&pdev->dev, "master allocation failed\n");
+		clk_disable_unprepare(clk);
 		return -ENOMEM;
 	}
 
@@ -377,6 +378,7 @@ static int mt7621_spi_probe(struct platform_device *pdev)
 	ret = device_reset(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "SPI reset failed!\n");
+		clk_disable_unprepare(clk);
 		return ret;
 	}
 
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
