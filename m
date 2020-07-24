Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA02C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A19206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l/aDMQWh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ti4wY681"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A19206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMVtr4si9kH7o/K+0xgfXauSnueFeKoUXmBhUbVqCwk=; b=l/aDMQWhl6U+LfPb6GntcmzV4n
	/BEXbMJFr9RrB8IKydLbZcnknEMUFnRwqnJOv1a/YGxCp6PMoujCmNIsqbKOF9EjHW01fDaGI03jV
	b/AqVyJIW0lbsJPx7pi20zSay1TxpVjvvau+G12OFTCWkDbKB8kzDbRvp5+J7c/kdOb0Mp5azxtkq
	H/4+1PhpU/HY914YpYpZgcPWkuOT6fVQKzUbwQ1SUc5DY7jrDHhQaW82/KQyLa5zOZvhaicb5NUHi
	MEQQ0n37T7bA1DLk/7hMV9FUCgWHhd+yNMHUVY4DwxJ7eJarpw8Gkw3E1YYYaNTYmGMdCpSglzHzJ
	+oN1mbow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysRI-0005Sg-U0; Fri, 24 Jul 2020 07:48:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysLx-0002de-98; Fri, 24 Jul 2020 07:42:51 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1CDF20768;
 Fri, 24 Jul 2020 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576568;
 bh=T1+HENTJZwZC4mvFiOB0VKpTwI3d/Ish/a/v0tYcd9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ti4wY681h4IQgSVClvqN+HtZ9rKV3ye2e5SYJVH2HSzU7OMxfVUXtuMMaxdGUI2l3
 HAsg8hxeIjptKf8VScrGSzgx9OPvp6raGP5x9dm0ckVWKLl444D+H84mdev/xiOJWZ
 4BcpG422GdCnPFFphmmx69+KsHPW2zEGGS2rvkmE=
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
Subject: [RFT v2 20/29] memory: omap-gpmc: Return meaningful error codes in
 gpmc_cs_set_timings()
Date: Fri, 24 Jul 2020 09:40:29 +0200
Message-Id: <20200724074038.5597-21-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034249_736290_0B0F24E1 
X-CRM114-Status: GOOD (  14.98  )
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

The callers of gpmc_cs_set_timings() expect to receive -ERRNO on errors
and they pass further what they have received.

However gpmc_cs_set_timings() was returning -1 (equal to -EPERM) which
does not make sense in this context.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested

Changes since v1:
1. New patch
---
 drivers/memory/omap-gpmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index c158b6cae9a9..1e370142dfca 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -638,7 +638,7 @@ static int set_gpmc_timing_reg(int cs, int reg, int st_bit, int end_bit, int max
 #define GPMC_SET_ONE_CD_MAX(reg, st, end, max, field, cd)  \
 	if (set_gpmc_timing_reg(cs, (reg), (st), (end), (max), \
 	    t->field, (cd), #field) < 0)                       \
-		return -1
+		return -ENXIO
 
 #define GPMC_SET_ONE(reg, st, end, field) \
 	GPMC_SET_ONE_CD_MAX(reg, st, end, 0, field, GPMC_CD_FCLK)
@@ -708,7 +708,7 @@ int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t,
 
 	div = gpmc_calc_divider(t->sync_clk);
 	if (div < 0)
-		return div;
+		return -EINVAL;
 
 	/*
 	 * See if we need to change the divider for waitmonitoringtime.
@@ -733,7 +733,7 @@ int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t,
 			       __func__,
 			       t->wait_monitoring
 			       );
-			return -1;
+			return -ENXIO;
 		}
 	}
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
