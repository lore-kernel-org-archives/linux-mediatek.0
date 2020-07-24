Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60623C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB672065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IT36pPL1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQzI89DX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB672065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD94detKbBArGXrG8mX6ATtEVRGYuxO1K56f0KRo380=; b=IT36pPL1W7TkjCB3TmJEJanDpE
	3UB52bPFB6v6U2De2GoDQYEPCe+H53GI5rHKwpY4lkQz9dnauR1tiO1VnenyD1B0DAs8ugR4FtQp6
	6EQWGeQ/RIfwIftA85TYPj0LQFHwSisQlvCxFn/3jMphHZ/NZt525ecmjWiG7bY8w8E4yiGU6+wY2
	UFGO2KO7hgs3ObGTxWPK5MgZ374EhyF94VR+onS1mp3tbQTm2/jTBfqz7owvqWvkpYJWFn0rSceDt
	d8ibmwzPxMBEExU7hBo3euEmdpEC9aIpH9/CS9yd7/D95vqSAGHtOR0Ru81HuS7BFbzZU13b6F6qe
	g+WGoZCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysOE-0003j0-Ny; Fri, 24 Jul 2020 07:45:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysL7-0002C9-JK; Fri, 24 Jul 2020 07:42:00 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31F382078A;
 Fri, 24 Jul 2020 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576514;
 bh=n3jS1R8cGlbzQZ2E7MTkJN+e77K8jIddQTQt1KGSL/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TQzI89DXGNlXEst3iKfRpL1/8FZTQOYeMgymg36QcNxLTpBen62K9gQ6pHVjL9Wbv
 LeabdNsFhxbUqToBBg+Rleiv5zEogUu2tC4jDaSGajyPkM6FKESnzxoefcvqheyP16
 sZFBhJzZXe79UaRbiY6YGNUxg+pMhl4NeQjxJEr8=
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
Subject: [PATCH v2 09/29] memory: of: Correct indentation
Date: Fri, 24 Jul 2020 09:40:18 +0200
Message-Id: <20200724074038.5597-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034157_899478_6D7A4C21 
X-CRM114-Status: GOOD (  15.07  )
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

Correct indentation to match open parenthesis.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/of_memory.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
index 8a5b654eca6b..67b811cb2cb9 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -26,7 +26,7 @@
  * default min timings provided by JEDEC.
  */
 const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
-		struct device *dev)
+					    struct device *dev)
 {
 	int			ret = 0;
 	struct lpddr2_min_tck	*min;
@@ -61,7 +61,7 @@ const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
 EXPORT_SYMBOL(of_get_min_tck);
 
 static int of_do_get_timings(struct device_node *np,
-		struct lpddr2_timings *tim)
+			     struct lpddr2_timings *tim)
 {
 	int ret;
 
@@ -83,7 +83,7 @@ static int of_do_get_timings(struct device_node *np,
 	ret |= of_property_read_u32(np, "tZQinit", &tim->tZQinit);
 	ret |= of_property_read_u32(np, "tRAS-max-ns", &tim->tRAS_max_ns);
 	ret |= of_property_read_u32(np, "tDQSCK-max-derated",
-		&tim->tDQSCK_max_derated);
+				    &tim->tDQSCK_max_derated);
 
 	return ret;
 }
@@ -102,7 +102,9 @@ static int of_do_get_timings(struct device_node *np,
  * while populating, returns default timings provided by JEDEC.
  */
 const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
-		struct device *dev, u32 device_type, u32 *nr_frequencies)
+						struct device *dev,
+						u32 device_type,
+						u32 *nr_frequencies)
 {
 	struct lpddr2_timings	*timings = NULL;
 	u32			arr_sz = 0, i = 0;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
