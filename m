Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07801C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 03:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QNyb5Z3QvxQnVVBV71UIuozwt8O7RNweh4eQ8iUbsl0=; b=0xdPvMQtxusmqpfLxVHvSWbzjX
	Rj57KN8lyvpXIFm3mXRl5M4jWw/m9nj2h4was3pZeU5CK3X47OGq0f0+E1UIfki4PoCjnLUOb+9nc
	nH5C06Eml97/xmrEdLhSH3IVjLQl6p+fNrYv2vsGzse4gbuF/31RnjjfgjqA6cAgKn+V2o0lydtG0
	c6RpFkk85uKzv33bY7UiFnafGITxDOWAz3Ia9Rmcn1AQPSy2pNRs/0goY+URhJv7BTLzvEPQtxeyj
	qFe1/CNMi0/QkA7KArZ28js5fBJeEBIYEI+zJW+yvjoRb0EPfH1NKzCKjD25O/iq7AxckePCI3yV2
	URfPZndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF54r-0053Yg-EM; Tue, 10 Jan 2023 03:13:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF54o-0053Wo-Ts; Tue, 10 Jan 2023 03:13:28 +0000
X-UUID: 86884fca122f4287bf462284890453bb-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QNyb5Z3QvxQnVVBV71UIuozwt8O7RNweh4eQ8iUbsl0=;
	b=qKYxgJwY8+FaWP4Q19QoI9af0hqGMWHzpXsGtVU173w/NcwFTRueMP81j2afO/oiNaIfnwcexrX5H2TRFUWu4xFmHbmVD3TL45FOVbCIinJBVo3BqRK7HwfwvKcAmudK8ZUlieLX/op2G+F0U41kik5Bwp1dt3zwddUx2MPd9fI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:e5b36b9e-14e3-4fab-a6b0-f277a713b190,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:bd4756f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 86884fca122f4287bf462284890453bb-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1724054063; Mon, 09 Jan 2023 20:13:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 11:12:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 11:12:55 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
	<gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Miles Chen <miles.chen@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] cpufreq: armada-37xx: stop using 0 as NULL pointer
Date: Tue, 10 Jan 2023 11:12:52 +0800
Message-ID: <20230110031252.5014-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_191326_987399_3EF43090 
X-CRM114-Status: GOOD (  12.18  )
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

Use NULL for NULL pointer to fix the following sparse warning:
drivers/cpufreq/armada-37xx-cpufreq.c:448:32: sparse: warning: Using plain integer as NULL pointer

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/cpufreq/armada-37xx-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
index c10fc33b29b1..b74289a95a17 100644
--- a/drivers/cpufreq/armada-37xx-cpufreq.c
+++ b/drivers/cpufreq/armada-37xx-cpufreq.c
@@ -445,7 +445,7 @@ static int __init armada37xx_cpufreq_driver_init(void)
 		return -ENODEV;
 	}
 
-	clk = clk_get(cpu_dev, 0);
+	clk = clk_get(cpu_dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(cpu_dev, "Cannot get clock for CPU0\n");
 		return PTR_ERR(clk);
-- 
2.18.0


