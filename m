Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C6CC43458
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA7420714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mXtjoPnn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSt7bqaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA7420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9Dz7ViLvfuRsYFozIso6E6jEuU73EpL90b0a+Ig+44=; b=mXtjoPnncSVxHASNS6EZJ/plTo
	cmOs+gbLRswnC0TeR26ELr0mKrn1IVgGtvg5opXqjg3+c293hz+C99MfD+Zc/goqUai/HYWCjsfyH
	gGndGD7E6Fyj0l50ABJpa6ToVLxyTguFgwwBUjWVD1bz9pOcJL2PkurIEyh1m4xZcB4OEUIMGdsGr
	9SEOkEUS/Pma8YfeIsqxP9tIht5rWztPx0zO+MDUQh294I6tN4EGFnoY5auLZ3zqi81EOz6CeK6ex
	geVLl9SfpZNi84ny8ZtTtwKVPrev6krQm9PGvzuelmtSwQkL5F4V+sqw1R3GvgIShkMfHptmDDZ5z
	wDfP+6mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVt6-0007pI-QS; Thu, 23 Jul 2020 07:43:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVpZ-0005Qa-RM; Thu, 23 Jul 2020 07:39:54 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19666208E4;
 Thu, 23 Jul 2020 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489992;
 bh=CFjeTLf3VxTPc69usAlF1x6NQjpN6H7DE6BSfcr/r54=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aSt7bqaMoWp6nXKbr/zPcZiQShKbFDNwzgSJ8xKs4q9Nr6F/b/P4YdAVzhWRp7Obh
 ABl0P/B6Q7w2Y2vL2IFnUMaI7bJoHhhf1c8AqpERFX2A3K87JCsH+sQqMncHKCQQln
 YaA7Rb89cUn6RSB/s4IrroQGpmKrHzM44HK0QEKU=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 22/23] memory: tegra: tegra210-emc: Fix indentation
Date: Thu, 23 Jul 2020 09:37:43 +0200
Message-Id: <20200723073744.13400-23-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033954_008934_FC615019 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use tabs instead of spaces for indentation.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index ff55a17896fa..d60bdea3af3f 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -1044,7 +1044,7 @@ static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
 			   !opt_cc_short_zcal && opt_short_zcal) {
 			value = (value & ~(EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK <<
 					   EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_SHIFT)) |
-			        ((zq_wait_long & EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK) <<
+				((zq_wait_long & EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK) <<
 						 EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT);
 		} else if (offset == EMC_ZCAL_INTERVAL && opt_zcal_en_cc) {
 			value = 0; /* EMC_ZCAL_INTERVAL reset value. */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
