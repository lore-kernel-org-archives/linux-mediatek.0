Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111DBC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47D820714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q1qy9uZP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EN3DXaBM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47D820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNaoVUW5kIiwa6W3VGwgz6hUiwt6HE7DkQtop18H6qc=; b=q1qy9uZP8mWHvWZCmQrLngQ2ji
	Mp/MogdCYWa7+MNFJVMx2lsfR7zj6g8OvulhvmqUC6Jp3AOYAsgfo579GyeIbYwR+Xir7C7FVUVeq
	1ZLq5lp33JRThS7KahtY3cpnkUYI+iebYRzyfzsd3K9zyhhho6rgVrmFuRYKP7A0IpjGmhqzKrMu7
	jbs3/ax1qNpf6L0KxjWaTFU5xFXa3/y/SRvHYz5Vx1GZiHGwgnsAZGZ4r1mEQTU9h+v/4EApUemlA
	pXii8Cl+Q9FCkuu0u/nLhEd3kWnZm957uQiTNuArWAujrzVB34QXmbKilWuMW0P2nuT65ev/gVTE5
	s5Mi8ULw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVra-0006bw-4c; Thu, 23 Jul 2020 07:41:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVot-00055m-Po; Thu, 23 Jul 2020 07:39:12 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6887B206F5;
 Thu, 23 Jul 2020 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489951;
 bh=F8/rcj75C8QDyRhC1fqjTttvRAlPLacLZsrsJfSBM8k=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EN3DXaBMHmRIXUjHTlT1fiFpBvJMDCp8b7erVoTMQr1jhGbfWnMwrmwR07ZW2XYVU
 QJepgRUMv6EfZgrU2VROmGXBGSZCTyDV2j/smEWrSdUKIACB/G1PF904rqkTGXPUbt
 8LYVaJJ3HWb1S2mxruX75Y38pSoYbYjHBtaoSbhQ=
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
Subject: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
Date: Thu, 23 Jul 2020 09:37:35 +0200
Message-Id: <20200723073744.13400-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033911_949469_06D330AB 
X-CRM114-Status: GOOD (  15.85  )
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

Cast pointer to iomem memory properly to fix sparse warning:

    drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
    drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
    drivers/memory/ti-emif-pm.c:251:38:    got void *

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/ti-emif-pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
index 9c90f815ad3a..6c747c1e98cb 100644
--- a/drivers/memory/ti-emif-pm.c
+++ b/drivers/memory/ti-emif-pm.c
@@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
 static int ti_emif_resume(struct device *dev)
 {
 	unsigned long tmp =
-			__raw_readl((void *)emif_instance->ti_emif_sram_virt);
+			__raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
 
 	/*
 	 * Check to see if what we are copying is already present in the
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
