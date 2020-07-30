Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56364C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 08:15:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25AFC20838
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 08:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHxz9tDf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Nx3HVLZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25AFC20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qaO9InqYCsG+dyeZcpSaOePSUNd9qfvUjWtoxTSvw80=; b=oHxz9tDfw40sZgVaeFsJwVAnzW
	l45LAmRU+478rj0i14vaaT06ctGckqwbD372Ju+N2y9BtWWzRIDKV34KQONo/yxC0dIBEpTyn3nu9
	tX6Tyqq7qkcNOtg/tBTfHPrL8VltR3P9x+g4/p5HNkGow+K8rBoxYmsaM2xaRpPqznsCW6TaUORUq
	KI0WUTFkDabXfM1h+Cmo705arzvYBUvq/HB1Z0OUo1STnjvT7nDG9H1djd6ex7FjZYUUadNkSWmwM
	rReUUScfaOHuzey7qik7EpS/FTFkau6bdh/FTv65mD3wkf7QlluTLUEm5/YmN1HNPmpJ6LI9Qig7F
	SaWIdj8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k13iL-0004Vi-UI; Thu, 30 Jul 2020 08:14:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k13iG-0004TW-HR; Thu, 30 Jul 2020 08:14:53 +0000
X-UUID: ed71cef205a649879e9fa66cb5bd2ae8-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gtc/7yIbUp5/Z/sZoviqQWwUV/DSInVUWpg1vFZLruY=; 
 b=Nx3HVLZWcN7KuAtbln5l++vbjwRlbUENDsOEJ4MlNyNynMs7GD6OIx3hwBPrvlu78CZOQI7FfkngU/VdOy8galJNypqrATQYSJupq9d2/d+k/90q3wyejC171YlGM8GIR6WCWPdXcsS2YqCK6Uu/jFQsbQbrJRohdCV7gmBZX+A=;
X-UUID: ed71cef205a649879e9fa66cb5bd2ae8-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1721956277; Thu, 30 Jul 2020 00:14:47 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 01:05:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 16:05:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Jul 2020 16:05:15 +0800
From: Henry Yen <henry.yen@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] thermal: mediatek: Fix missing selection
Date: Thu, 30 Jul 2020 16:05:04 +0800
Message-ID: <1596096304-16422-1-git-send-email-henry.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_041452_773497_CA465533 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <henry.yen@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Michael
 Kao <michael.kao@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek thermal driver is compatible with multiple platforms.
Some of the platforms (e.g., MT2701) requires to enable
MEDIATEK_MT6577_AUXADC option. If lacks the config, the driver
will not be able to read correct temperature.

To fix it, select missing MEDIATEK_MT6577_AUXADC config.

Signed-off-by: Henry Yen <henry.yen@mediatek.com>
---
 drivers/thermal/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 3eb2348e5242..3a37f674f7f3 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -409,6 +409,7 @@ config MTK_THERMAL
 	depends on NVMEM || NVMEM=n
 	depends on RESET_CONTROLLER
 	default y
+	select MEDIATEK_MT6577_AUXADC
 	help
 	  Enable this option if you want to have support for thermal management
 	  controller present in Mediatek SoCs
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
