Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC2FC433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:48:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2E4206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:48:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QcWHyX+E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdIk/H8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2E4206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnJQJrzGOpTvjs+aBxlzhMh15tnjrpv0qwE6fqnKnxI=; b=QcWHyX+EdB2sIQebsuEGnhtdhu
	RFsm0UuEdOF3s5juO4tFyHx5iflMjMEfuGl0US/rdfxthQwtA4xXcjb+fjJsalRzHHBeic/MmPlXs
	mUWVNoHtrmC+PDhHmURnNtPyd52ObQksygfcYldIFrEZtiB2EAaMwdP7SgnFxJo2h6fkd9Y1Qe4nK
	GHrg8SZN37feXkVCwGQBca3M3XYdq4Jprd6yiFHaV6rXS1AWxS7W2dpJbMAz5wAe2AUqU/SKSf+Xq
	Bpc0bkHcKpOQuIpdPRYf9fmbaiyWv6RtqwdmBX1fZPdZK1AnvllMXQENynAlg22eNiGD9ShfnYIn9
	qEQJSXEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysRO-0005Wq-Uw; Fri, 24 Jul 2020 07:48:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysM6-0002i7-LR; Fri, 24 Jul 2020 07:42:59 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2EB720768;
 Fri, 24 Jul 2020 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576577;
 bh=GJgQRG3YQ8ioaOa9xxhYIJQBikr3KReGS0guhEEKk+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BdIk/H8GUSHjr/HovDw6Pq4dLSFg6A0UTNKZtpqe4RMs2ZkyJgMwNp3flKxbbFHJn
 GQhvMmI39tdeLKtURHZ8kGVOF1mBvnEz19Kbxj5tOJ0wsaJdnzYyr23x9SnFtJcy4t
 MEftBJI/4aILINjqDmn4f51iLHrAbseDrqVlJKmQ=
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
Subject: [PATCH v2 22/29] memory: omap-gpmc: Fix whitespace issue
Date: Fri, 24 Jul 2020 09:40:31 +0200
Message-Id: <20200724074038.5597-23-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034258_857765_A2D0EACC 
X-CRM114-Status: GOOD (  14.13  )
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

Fix minor whitespace and comment issues.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Adjust entire comment, as suggested by Arnd.
---
 drivers/memory/omap-gpmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 2a2d0297e071..2675ea4e37fe 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1005,7 +1005,7 @@ static int gpmc_cs_remap(int cs, u32 base)
 	 * Make sure we ignore any device offsets from the GPMC partition
 	 * allocated for the chip select and that the new base confirms
 	 * to the GPMC 16MB minimum granularity.
-	 */ 
+	 */
 	base &= ~(SZ_16M - 1);
 
 	gpmc_cs_get_memconf(cs, &old_base, &size);
@@ -1800,10 +1800,11 @@ static int gpmc_calc_common_timings(struct gpmc_timings *gpmc_t,
 	return 0;
 }
 
-/* TODO: remove this function once all peripherals are confirmed to
+/*
+ * TODO: remove this function once all peripherals are confirmed to
  * work with generic timing. Simultaneously gpmc_cs_set_timings()
  * has to be modified to handle timings in ps instead of ns
-*/
+ */
 static void gpmc_convert_ps_to_ns(struct gpmc_timings *t)
 {
 	t->cs_on /= 1000;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
