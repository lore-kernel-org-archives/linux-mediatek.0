Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2E7C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1p+vWlKHISNXrWwv+lfYDMX9jmyzPHiRUmGnYPEFXI=; b=1RJvM399jLVqSOjrPbgOMxvlY5
	+WveuNxiAcddWlFHqSeEW2QLbt9qqgSAiCBMIr60CTb+km0VBj0wdosNHlVshxQDArAluIUK5MdPh
	0YvR1VVDoaQlpnINyyL28cF/FKBdr6PDTYJlSu6LHxoRAcqOCpxVjzlp354v2ztGM2ZExSitf23xy
	oC8fJcKbp9Ec1DCN1e9sdpJMfAjC0YyiHiqBtJil1KJJbhOzlgWOhhMDQDAI/HgiAPKmEtk9TKwXi
	YTEQQ2HO5mBtVSEP4OPqFr5o5uNaE2NBk1o3mkSc/QdxgGTILO8oVIPovr0+WsOo7+DBmwdb1KsFI
	8V06LTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQKN-00Apg6-I9; Mon, 16 Jan 2023 14:19:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ6k-00Ai4m-PV; Mon, 16 Jan 2023 14:05:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 41ADD60FDB;
	Mon, 16 Jan 2023 14:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6967AC4339C;
	Mon, 16 Jan 2023 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673877905;
	bh=IzuufyDbJLXhFSsDSZlIOGlXoHOFnZTOQwcthzc3Pi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sBjxKqvHq7xELSDb74X1xg2l0FoWRzHL0Mt2PlbrdYtvZxaDbroDskOEbFEafnoQH
	 NBMupeya33qV4Ltr6gQvLdJgZqJ9w/UfISuNwtICT8zUIEr5lrEvXJ4dHdi7RomioP
	 +73sZp5AxrEt9q6duNRcGRSwNV28cp3lwP5qF4gFfMb807KqBKjZaZysr/xwnOsNqJ
	 pV4hq7fxaJM/1VkLwYLgCabr5maa4ma2FjSSXhhQiimsDej2rTREk0MNdt++GGncHb
	 ZUY4HySiGCA3J5l24y4GsZvlOWopcqG3oiNerh0oeCT/bgTr+l4fLD2xSCbNuNyjVG
	 Bq32tfqNT5OXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miles Chen <miles.chen@mediatek.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	rafael@kernel.org,
	matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 08/17] cpufreq: armada-37xx: stop using 0 as NULL pointer
Date: Mon, 16 Jan 2023 09:04:39 -0500
Message-Id: <20230116140448.116034-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140448.116034-1-sashal@kernel.org>
References: <20230116140448.116034-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_060506_916833_73FA74B7 
X-CRM114-Status: GOOD (  13.27  )
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

From: Miles Chen <miles.chen@mediatek.com>

[ Upstream commit 08f0adb193c008de640fde34a2e00a666c01d77c ]

Use NULL for NULL pointer to fix the following sparse warning:
drivers/cpufreq/armada-37xx-cpufreq.c:448:32: sparse: warning: Using plain integer as NULL pointer

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/cpufreq/armada-37xx-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
index 2de7fd18f66a..f0be8a43ec49 100644
--- a/drivers/cpufreq/armada-37xx-cpufreq.c
+++ b/drivers/cpufreq/armada-37xx-cpufreq.c
@@ -443,7 +443,7 @@ static int __init armada37xx_cpufreq_driver_init(void)
 		return -ENODEV;
 	}
 
-	clk = clk_get(cpu_dev, 0);
+	clk = clk_get(cpu_dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(cpu_dev, "Cannot get clock for CPU0\n");
 		return PTR_ERR(clk);
-- 
2.35.1


