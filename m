Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CECEC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KixZnYN0dc+lJ2OjS2OJhyCtEN+lVS9GdbU8+6zwEE=; b=CMzYfP0xLK815qj7z+GmiZfP2e
	cBNEMxYF5vj9rQAukoptCZhxp+fOdQ7zNAoVoWGqoV/u0W33wRj1GPEUUO6MO+3HjTA4QwCAisaqi
	8qCjNuPP1jSuVsHS5rLFl5rfrQfZqd2jt0+SdQAQme6nEJk2tuLTAP8FV0VUpFLsVDY5rSTCred42
	32LaSodA4jM9+Fq7+i88TUleScdtDDaqBeUU/ESqfR8tpTIqOKo9+/WgNKAraYGQ/QDcbKh+AJChR
	m4/d866Uhj9l/VSp+U8vQgbbeITMmoNwez4RFCJVuIz6zXcHpdVuMJ4dd/XynkirciQQAYx3BgBRk
	U6Gh13XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQHa-00AoHu-GS; Mon, 16 Jan 2023 14:16:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ67-00Ahjr-CW; Mon, 16 Jan 2023 14:04:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D987B80F9F;
	Mon, 16 Jan 2023 14:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B456C43392;
	Mon, 16 Jan 2023 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673877864;
	bh=vzGU7fggFYdTM/Yz8WBo94uwKocZoX7eVhfAfkKbvRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DSuP3UELTk2lc+Idk58Ete4Qm8gw3GUMP6DFtBGZgcFpUYg8Soz+lZc8JXUFdvmUa
	 t+S4jfdkAl4bWJ6rFQV2rKvV6s6mVmBCgbZXe6f4gLYwe0q7NaV3/0bOSyqWjSjkCG
	 /6Zb1X1hVAezknkGhFQxAEBeVf3QWK++a31MmY8q5R5X+XPr1sPKbVsU+Lkg+4h2h5
	 7O2OJ4OjRGLcDxUgWCMaWtizlmDOM5V4c4zaM8NSnoTZpxG+6p3XXhqTqnIPVWQSaz
	 SgM76+ekjXzRUto3ctIapYTmIy6QIWXTmbGKLBstoc+dsFfmHqKh/kpZmIy/uwlGIN
	 qqnZfjw9So0YQ==
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
Subject: [PATCH AUTOSEL 5.15 13/24] cpufreq: armada-37xx: stop using 0 as NULL pointer
Date: Mon, 16 Jan 2023 09:03:48 -0500
Message-Id: <20230116140359.115716-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140359.115716-1-sashal@kernel.org>
References: <20230116140359.115716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_060427_595233_5B2A30A2 
X-CRM114-Status: GOOD (  12.78  )
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
2.35.1


