Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 04:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAbJmsGjwOjduRujOqb5S6U4cP6MrvnrVVr2VnVhb9Y=; b=Egul7kmAGnCyNh
	Z9ykh/6pe/uEEV2yb2hMDpRz3RraBzHiHgWFHfmRjVmryZNC4O8JKJiC3peQg4UBvZ5JSaxKn3fRL
	Z3OkZmcLjRx1zN16p/HsNtyphYzk1YEe7sw2NxXqPqUdA84/7ZwLtlahi7L6gnQE9kgSECKJTmmfR
	6VDwaeSotWKYPPA2lON3bxAoRwb4ftDU5MJK3cQFi/MTp8dAkzrawcENG4j2MYB5ullcMYxWAlSVO
	Oir94qvGBJzBWNFVviAS16lZELbke6AolLNQi5gUC42x2coBcqxqUedMk7fSUwi3i9nDwOFZ1f3Vb
	zWCsrunyBSjLA9Fo2Ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSAAm-00BMUa-Dg; Thu, 10 Mar 2022 04:13:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSA3M-00BJI3-P5; Thu, 10 Mar 2022 04:05:30 +0000
X-UUID: ab733bd402714396b3643f79d8047367-20220309
X-UUID: ab733bd402714396b3643f79d8047367-20220309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2066461887; Wed, 09 Mar 2022 21:05:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 19:59:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 10 Mar 2022 11:59:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Mar 2022 11:59:38 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <chun-jie.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <drinkcat@chromium.org>, <eballetbo@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v1] soc: mediatek: pm-domains: Fix the power glitch issue
Date: Thu, 10 Mar 2022 11:59:38 +0800
Message-ID: <20220310035938.20110-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220310011548.2487-1-chun-jie.chen@mediatek.com>
References: <20220310011548.2487-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_200528_852002_35ED860D 
X-CRM114-Status: UNSURE (   9.59  )
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

Hi Chun-Jie,

>Power reset maybe generate unexpected signal. In order to avoid
>the glitch issue, we need to enable isolation first to guarantee the
>stable signal when power reset is triggered.
>
>Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
>Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>---
>This patch is based on 5.17-rc1.
>---
> drivers/soc/mediatek/mtk-pm-domains.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
>index b762bc40f56b..0195f6c3396b 100644
>--- a/drivers/soc/mediatek/mtk-pm-domains.c
>+++ b/drivers/soc/mediatek/mtk-pm-domains.c
>@@ -272,9 +272,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
> 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> 
> 	/* subsys power off */
>-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
> 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
>+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
> 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
 
Does it mean that we have to do power off by:
regmap_set_bits(PWR_ISO_BIT)
regmap_clear_bits(PWR_RST_B_BIT )

and do power on by:
regmap_set_bits(PWR_RST_B_BIT)
regmap_clear_bits(PWR_ISO_BIT)

But scpsys_power_on() has the following sequence:
regmap_clear_bits(PWR_ISO_BIT)
regmap_set_bits(PWR_RST_B_BIT)

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
