Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7958DC433EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:47:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48137206E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ihCxuDRg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYYsdG/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48137206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjU8Slcr9ZuX/LNjZMakWd5ouIZKt/x7sUpTXC1JvOI=; b=ihCxuDRgREZzlakDFrQMkDLnUY
	KLjkvTD86N1niOzML7GKngaIITCRMEsxdj+QIq24kdiR1EsBm3wxuvvCj29551j/zwOn0aQO/i1F7
	bSg7wBS5fRKrW8qcwaHS2wZOhYr0JoJZyhGxJ8N1GNsdQrfPdcauqagPeTqpbNrIafeStfULGXZJ4
	YATQ2cnw55kPs9bwD/VC/3hXENPgiWY/WNO3FjBFBk7PpABk8JbKCZyofLQVgD1V0cM3dyse6m5x+
	sgg84HdeGu071IbMsdMD+3KNQfZLld0BtirdELmmBVx3T6Id/JxjQfsyxZN1QxqpRfI1g/BLijhAx
	n+rHP3OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysQH-0004jl-MX; Fri, 24 Jul 2020 07:47:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysLV-0002O5-Di; Fri, 24 Jul 2020 07:42:27 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89E6820767;
 Fri, 24 Jul 2020 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576538;
 bh=ee2yfevvxPNZT07hkWmEVih9tVXRSdr7zWFQlfrcYn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sYYsdG/bbAjpHsuIPpA/70pSp49oPPnWLCXgkIjUUwHhnx2s03cTAD2aZUzKzZCCb
 Cgk0CYgzDMmNlsBFIYDZzzj3a6eG722h1qP1YmGmL6WQSg3wGndbTyXhaRhfzBNrQL
 HogSSCQJTin69uZGosAljLWzCyacxzknNeFxTAYU=
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
Subject: [PATCH v2 14/29] memory: emif: Silence platform_get_irq() error in
 driver
Date: Fri, 24 Jul 2020 09:40:23 +0200
Message-Id: <20200724074038.5597-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034221_641940_AE7CE988 
X-CRM114-Status: GOOD (  13.74  )
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

The platform_get_irq() already prints error message so there is no need
to do it again in the driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/emif.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 1241a87081f8..1bf0656d5e9a 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -1561,11 +1561,8 @@ static int __init_or_module emif_probe(struct platform_device *pdev)
 		goto error;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(emif->dev, "%s: error getting IRQ resource - %d\n",
-			__func__, irq);
+	if (irq < 0)
 		goto error;
-	}
 
 	emif_onetime_settings(emif);
 	emif_debugfs_init(emif);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
