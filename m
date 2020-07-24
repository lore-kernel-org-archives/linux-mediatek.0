Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C04C433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA11E206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0wkwi3s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxVX1tyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA11E206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9Dz7ViLvfuRsYFozIso6E6jEuU73EpL90b0a+Ig+44=; b=c0wkwi3sSM1quzjkrJG8IP6T+V
	qv4LiNyUmWuAYvI4rt3a7jGop15td8ObPbs5eHQSWMEazHd1D6jCsw4UZRwgE+fjxuh6DOvweojz6
	oLEiqTa7oFkiXdkBf1UqN5UW18/uAYwPSMv/bUoevNK9wrRcHDuEhNF3G9iHPdnlwxN81m9CrsdPU
	7HQwTItHp+NmOZ2qbTUtPKG85/ydyDhXrDwO/Qo0O+owYfGhKsjrfJw1oqQM/XRx+VJJUEvXbSr4Q
	mbLG0UmUOKVoH5MJAI3YuToDnsDQ2A8atNWb2rNcsJFdPZHPpvDiRcJGtg90bv2gVBntCxDV4Fyfb
	vdYyx8eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysSE-00069k-0N; Fri, 24 Jul 2020 07:49:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysMG-0002mT-CY; Fri, 24 Jul 2020 07:43:09 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42A5120748;
 Fri, 24 Jul 2020 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576587;
 bh=CFjeTLf3VxTPc69usAlF1x6NQjpN6H7DE6BSfcr/r54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RxVX1tyirSx120u18ZJM+5Gx+2KqFZYCFB2SQtS0ZGDTqPD7BS7V6VZdc/yD3NjqB
 AfqzWdTIr8M5e777Yf9ra0jDA0j25dl4z7Y3Jxf9DIS5oolpz2oWFUG5qocUQhU8/r
 6Y01I1AJhqage1nlFby30TsvQJ3HhQWGM5nUYJUg=
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
Subject: [PATCH v2 24/29] memory: tegra: tegra210-emc: Fix indentation
Date: Fri, 24 Jul 2020 09:40:33 +0200
Message-Id: <20200724074038.5597-25-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034308_550309_3FB68842 
X-CRM114-Status: GOOD (  14.60  )
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
