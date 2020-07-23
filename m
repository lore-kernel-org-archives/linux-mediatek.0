Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B653C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0FB820714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yt0MH9/y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkoGw1ti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0FB820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wP63KyUaUv78A4CUxQsJwwpXtXFJMBLMcNUm6r0FZbI=; b=Yt0MH9/yF4nS7SiXwgas4dVaJU
	gvqm8A459syjd6t1PYnYQL61S0/XhFw0Uze0oBK5jg7Bd6RM366bh84YxHATr1EnnHf5ayheZ7+t7
	EYCFd0O6cJv1WgYNAt7mA6tzQ9pIwVXmz6RgmLFmkaSCX7/Uzljy2X1sSyNpsjdJ/oMtsjjy6Bms0
	eAaZgHt6yA0ymRgKdhBcRhBPEGUav8wGXRtdNtaENaT6ZwFTGUrco1fj7yl37+bf7syxBFDRc9OuR
	00o0GNLm7u6aelJwc9mvT5RlewUJEJtVd7BWsKlPreg0jqd6+cwWFIgEN8p7okH2Z1KRmtB+kp+VU
	ah7bxLFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVsf-0007Tp-AB; Thu, 23 Jul 2020 07:43:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVpO-0005Kz-Tw; Thu, 23 Jul 2020 07:39:44 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C698208E4;
 Thu, 23 Jul 2020 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489982;
 bh=NdbmLicn3oVWIbypF/s2z0DFqecAMJ/cDEIwA0qY1Xw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZkoGw1tiEsETe7FUzfEjLbKpYB7akIamNrOTCY16ovj+rqIlDVbvHGLRggnEyt1Ca
 +Lv6jbMHiV76g7WWqdXnbneyGlBbXIt6/YB2XR90DJpDsoy+gBN1dRsyANWcnLli/X
 TeFzPyLm1maxaU4XxNO/XV/2FlblSdxEf1ifaTO8=
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
Subject: [PATCH 20/23] memory: omap-gpmc: Fix whitespace issue
Date: Thu, 23 Jul 2020 09:37:41 +0200
Message-Id: <20200723073744.13400-21-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033943_224981_D11EA7A6 
X-CRM114-Status: GOOD (  15.76  )
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

Fix minor whitespace issues.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/omap-gpmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index bb85aa56d247..dc10f55a3162 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -958,7 +958,7 @@ static int gpmc_cs_remap(int cs, u32 base)
 	 * Make sure we ignore any device offsets from the GPMC partition
 	 * allocated for the chip select and that the new base confirms
 	 * to the GPMC 16MB minimum granularity.
-	 */ 
+	 */
 	base &= ~(SZ_16M - 1);
 
 	gpmc_cs_get_memconf(cs, &old_base, &size);
@@ -1756,7 +1756,7 @@ static int gpmc_calc_common_timings(struct gpmc_timings *gpmc_t,
 /* TODO: remove this function once all peripherals are confirmed to
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
