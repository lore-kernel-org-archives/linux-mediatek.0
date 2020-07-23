Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16F7C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:38:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A928208E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CxSLE0AY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUZ+NOKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A928208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wD2RfouLA78vFMa4wXreMRVBYVbSq+iXxJXbUUEfpU=; b=CxSLE0AY+tF7tBcPEDBMFNGWtF
	h9MpF7n/I0KcFM1c0pXiu+h8Uqd6O9tmsPVWUX2329e9zKiSzNlrJJ25SZ0HZEkh1wGBYBjS0ptKC
	Xgs4+PQV5P85emjsoit6Jiraf07q36hMU/PDqtq0vdgI9mgA+f9vWxZVHxsIglvWscz/FoldSsdYu
	BePL525cMbtoCZgCr7x6W8tJ1sMfGxFKcrpMs50JTkyEty+ERyIALT2EH72qUl/AVx0RwwEDb1RBX
	2+LiOFIMv4HtLXstbAchUHQXPIpjjvgIFv10YiUCRZQXWlFOWtyKU6QWa2IXmMLjGuueuF1hk0I6B
	XAx60Z5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVo2-0004dX-NG; Thu, 23 Jul 2020 07:38:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVns-0004Yc-Gk; Thu, 23 Jul 2020 07:38:09 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2347420888;
 Thu, 23 Jul 2020 07:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489887;
 bh=UBowTDjnfwR++x51iBC0S5T4aqD4Cl4to0TPv3vFF2c=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TUZ+NOKhf8ob/sYKroRE2hy9NICzWcjqAFmHEJdeJeu5NUPtbVjud7CKDzQeXgQow
 4InH0wx20/G4/M3O/P+B7Jf7UMEcy7l0PuvReYZPHuM/TF6k8PEjdwMIQQhAwTdmG8
 e9kp2iG6hUcHQ7cLIVF1WPVPcMuLQDpQzgPMLQPU=
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
Subject: [RFT 02/23] memory: omap-gpmc: Remove unused file-scope phys_base and
 mem_size
Date: Thu, 23 Jul 2020 09:37:23 +0200
Message-Id: <20200723073744.13400-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033808_700822_DEFE2CC3 
X-CRM114-Status: GOOD (  12.34  )
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

The file-scope variables phys_base and mem_size are assigned in
gpmc_probe() but never read.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Please kindly test.

---
 drivers/memory/omap-gpmc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index fc08b5292932..8ec2ef2aebdd 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -242,7 +242,6 @@ static DEFINE_SPINLOCK(gpmc_mem_lock);
 /* Define chip-selects as reserved by default until probe completes */
 static unsigned int gpmc_cs_num = GPMC_CS_NUM;
 static unsigned int gpmc_nr_waitpins;
-static resource_size_t phys_base, mem_size;
 static unsigned gpmc_capability;
 static void __iomem *gpmc_base;
 
@@ -2357,9 +2356,6 @@ static int gpmc_probe(struct platform_device *pdev)
 	if (res == NULL)
 		return -ENOENT;
 
-	phys_base = res->start;
-	mem_size = resource_size(res);
-
 	gpmc_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(gpmc_base))
 		return PTR_ERR(gpmc_base);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
