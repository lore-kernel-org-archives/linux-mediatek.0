Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B443AC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E51420714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z16iFPPe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEBDmx/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E51420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y43ndReCq3NVssnUxJo7yoG0aq/3/Joytsjq49NN+nQ=; b=z16iFPPevvhl07aXBkN9S/+59l
	MucxrMr8PAOf8OsxPUK2QxEk8yUktw6/SQhMiLMWWOzjQEoCOo3rgBG4D/BhomkBD92Ypleio5F8H
	4kZKM9kxsdIe+7DgJ7QdC05tc7cvBEHQDF9epfi2XN7kGkU18FrkYrbSZxSuBg3s7TY1qdAXCf5nG
	D9DMhVMV2sLRjrDHQJBza+CNfY5JaFF/g+RSBtA+WzTE6ckoK1IMu7hWEKTfG5qnwAgAu0FJHbMzH
	OiQELPi1RzZY0Psch/mvMHoPTOh2SPAiLNt2lmTAdqd2pZq26X2aSqj14bq6uUB9ar8VWITvPyw+M
	axWIp25g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVsT-0007I0-JA; Thu, 23 Jul 2020 07:42:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVpJ-0005I2-Q9; Thu, 23 Jul 2020 07:39:38 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2333E20888;
 Thu, 23 Jul 2020 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489976;
 bh=Q+VpYpLjWIwZ0g8o4mw+vEngonlHZ5dsYcy1gteiV5w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEBDmx/81iUUTlDt+yRSihyz14ccJ3hurkzqj3rShk1Az4IuFlr6Vqze8o8ZbMzdH
 hJA7yHBIVT11ow5yNFwciEqwZTI/V8BFtIhYs5bpm08zQEyqhiJ+I3yV34H7CktEpI
 YYOepVrrOkkt1+dVza4c2U+8d/FQxJZOkqpV8NfE=
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
Subject: [PATCH 19/23] memory: omap-gpmc: Enclose macro statements in do-while
Date: Thu, 23 Jul 2020 09:37:40 +0200
Message-Id: <20200723073744.13400-20-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033937_972221_049B52CB 
X-CRM114-Status: GOOD (  14.14  )
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

do-while is a preferred way for complex macros because of safety
reasons.  This fixes checkpatch error:

    ERROR: Macros starting with if should be enclosed by a do - while
        loop to avoid possible if/else logic defects

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/omap-gpmc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index c158b6cae9a9..bb85aa56d247 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -635,10 +635,12 @@ static int set_gpmc_timing_reg(int cs, int reg, int st_bit, int end_bit, int max
 	return 0;
 }
 
-#define GPMC_SET_ONE_CD_MAX(reg, st, end, max, field, cd)  \
-	if (set_gpmc_timing_reg(cs, (reg), (st), (end), (max), \
-	    t->field, (cd), #field) < 0)                       \
-		return -1
+#define GPMC_SET_ONE_CD_MAX(reg, st, end, max, field, cd)		\
+	do {								\
+		if (set_gpmc_timing_reg(cs, (reg), (st), (end), (max),	\
+		    t->field, (cd), #field) < 0)			\
+			return -1;					\
+	} while (0)
 
 #define GPMC_SET_ONE(reg, st, end, field) \
 	GPMC_SET_ONE_CD_MAX(reg, st, end, 0, field, GPMC_CD_FCLK)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
