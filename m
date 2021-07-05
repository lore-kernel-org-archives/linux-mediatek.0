Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018EAC07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:42:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B46613E7
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B46613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmy0IBWVQ9CC4k0GW9hMR0lyriH6BvtpN4Nf0P4Z5bI=; b=KHXrdy4Tj4A3MT
	cGzPpvOolnCGAyIBS6w8G952gcbdKz3rHMBi9qUaEQrDBgXrCl8LKZdYWycn/wVhPpd/aj7mJxqV4
	UQiSPEFeyl11Mj8/M6/BLeYNu8yVgieUdNN4NmLYEIJwjYCpNoqXff6mUOJ7pSFwXAgDt6T9Xa4HL
	fxWzK1be32Xe56rJQDLmqLy/Ai8NCaTzrj2rQ5DvY0OAvQe7fNCQOu14UmWs+sM+UFjt6RBonkPTO
	aJP9mH2Q6zlUddNuByRN1cNGqPD7IqUMjPWcGXYD7AU7FJYZw9+xwruMKdNkt4Z5kH2NzlqFVSxUK
	wJaLO74n7QEsfx+r7ZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HMg-007tnv-Gj; Mon, 05 Jul 2021 05:41:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HML-007tgC-Fn; Mon, 05 Jul 2021 05:41:34 +0000
X-UUID: 92b34c81fd094daf8ac4ff6d42a67d00-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kskFUQWGgwSbnEWvny5McirBptK22i+i4Xpo12OXIIY=; 
 b=rJouhVOY+DGpNuGGhdOw16HIYg5dl5q2mmCP8bIQAYUICMxiXw31OMoCsl8mE9Qw3pV7PbDjaqkS3jCQdHMmDCwa2WShe3/cvoq0tmfujFOaoYHAufhFn4lICRpC2G1DIyNm4edQIkUJvGmZ3blrOuv6l5oE5ysupT4W9oZQyWI=;
X-UUID: 92b34c81fd094daf8ac4ff6d42a67d00-20210704
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 45647599; Sun, 04 Jul 2021 22:41:32 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 22:41:30 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 13:41:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 13:41:29 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v3 4/5] soc: mediatek: pm-domains: Add wakeup capacity support in
 power domain
Date: Mon, 5 Jul 2021 13:41:10 +0800
Message-ID: <20210705054111.4473-5-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
References: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_224133_580575_FFCDC583 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to some power domain needs to keep on for wakeup in system suspend,
so add GENPD_FLAG_ACTIVE_WAKEUP support in Mediatek power domain driver.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 12552c9996ac..d705860b47a7 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -447,6 +447,9 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	pd->genpd.power_off = scpsys_power_off;
 	pd->genpd.power_on = scpsys_power_on;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
+		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
 		pm_genpd_init(&pd->genpd, NULL, true);
 	else
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
