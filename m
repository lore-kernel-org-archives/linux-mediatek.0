Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93889C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:51:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF7B2068F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1dZhtgGk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8lQ1NgB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF7B2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0dBrMvllj0JKy2tfs1KCpFniH6hrSvO+8u9Gri7wLE=; b=1dZhtgGkVBrq/lqFqYjRy5f88C
	j4BKuOlC7V3GEStS81CpbxkuCnpgW6Kelxofo7dzCBWpm3JSVFNQwJW+5/0W2vjc+eEtA1Cm1718Y
	AmlGfONzBVp5Qso41O2szYCyql/P4pCAuI1vDlKdP2jwYApah3WDVFXiKNngfPF2nUEF7ByyG8BMl
	ryj5LSltDSrqkiyFNMgZmp5IQqd0sR1J8oYTJT39VOuQjkfhdzhtkQAypCfLgSHddWvXkWPhwZCuX
	l/WOvcvNQ7m9lwqvAPxZxczOw/csqjwAiRzmODtHpzFC4P8xnq5Eqf7ldCLZbhfIX2XpkRrk5W01u
	+CZ63img==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysU4-0007Pn-8G; Fri, 24 Jul 2020 07:51:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysMU-0002tK-J6; Fri, 24 Jul 2020 07:43:24 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67D3920771;
 Fri, 24 Jul 2020 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576601;
 bh=7Y6Qsp3HGJ5Ii/fIf6Yq0qBPBqdTjN0QQ//7iQ2S+xo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q8lQ1NgBUnpMzvwNWQCIM9NCHIlVp3rxSAKN0ti7nKks09XipPLucOfG+2M67iK86
 BvjUHcN5p1mqFF4ALd7rVk3ndjTb8tJNxWDyNgpi36gMWDDGctzkBOqqXDyeEp5P96
 fzhmRjMwPp5097vV7OOyYsgqpB7qhSVCEFPgrDL0=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 27/29] memory: da8xx-ddrctl: Remove unused 'node' variable
Date: Fri, 24 Jul 2020 09:40:36 +0200
Message-Id: <20200724074038.5597-28-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034322_957156_10C15823 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The variable 'node' is not used.  Remove it to silence compile warning:

    drivers/memory/da8xx-ddrctl.c: In function 'da8xx_ddrctl_probe':
    drivers/memory/da8xx-ddrctl.c:105:22: warning: variable 'node' set but not used [-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/da8xx-ddrctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/memory/da8xx-ddrctl.c b/drivers/memory/da8xx-ddrctl.c
index e8f9b3f461f5..872addd0ec60 100644
--- a/drivers/memory/da8xx-ddrctl.c
+++ b/drivers/memory/da8xx-ddrctl.c
@@ -102,14 +102,12 @@ static int da8xx_ddrctl_probe(struct platform_device *pdev)
 {
 	const struct da8xx_ddrctl_config_knob *knob;
 	const struct da8xx_ddrctl_setting *setting;
-	struct device_node *node;
 	struct resource *res;
 	void __iomem *ddrctl;
 	struct device *dev;
 	u32 reg;
 
 	dev = &pdev->dev;
-	node = dev->of_node;
 
 	setting = da8xx_ddrctl_get_board_settings();
 	if (!setting) {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
