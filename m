Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C45AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 02:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYBBx8MZgcfng/5UDnhqMKpcMg4X1XNDsSPoy5FfSIc=; b=JovT54GX5dKH6o
	MPnZYvuq7xhRjmRDQuE4EI5AytaJlcVXXUc0lP/uSEVkVn4I8P4OTHPu7lsIyjcxF+fafaQdzfp6+
	B8oD/lx4rCZ5lETX7rCrChEE4GAXtb11NObdJO4ppfLnOe0Jsq9YUq1wnuU65RJDQXBlEBZfT8ecp
	ltOICKZqeYxK9bA0BH1pagoB4+XFlijTSCJaFBSQ52B5O4Jpf2Ehvtf623q1dKmMOugRjoXrA7aFK
	zqSEoOKsv+6Ltn35iVVxSMDNYybifjKA7E/2Fn10DNhnqqTkRIdh2rBtZhzLkFaXu1taJ36GKu7YE
	rehSPa9cFobJ/zHXyxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSVS2-00EokT-4Q; Fri, 11 Mar 2022 02:56:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSVRo-00Eog8-5x; Fri, 11 Mar 2022 02:56:09 +0000
X-UUID: 33e768f54ed8499990a6e1fac6d5a70c-20220310
X-UUID: 33e768f54ed8499990a6e1fac6d5a70c-20220310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1883045782; Thu, 10 Mar 2022 19:56:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 18:54:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Mar 2022 10:54:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 10:54:51 +0800
Message-ID: <3a55f44998645308bb1b4fd65ef550682ebe6ba0.camel@mediatek.com>
Subject: Re: [PATCH v1] soc: mediatek: pm-domains: Fix the power glitch issue
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <drinkcat@chromium.org>, <eballetbo@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <srv_heupstream@mediatek.com>
Date: Fri, 11 Mar 2022 10:54:51 +0800
In-Reply-To: <20220310035938.20110-1-miles.chen@mediatek.com>
References: <20220310011548.2487-1-chun-jie.chen@mediatek.com>
 <20220310035938.20110-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_185608_319521_7ED02E9E 
X-CRM114-Status: GOOD (  22.27  )
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

On Thu, 2022-03-10 at 11:59 +0800, Miles Chen wrote:
> Hi Chun-Jie,
> 
> > Power reset maybe generate unexpected signal. In order to avoid
> > the glitch issue, we need to enable isolation first to guarantee
> > the
> > stable signal when power reset is triggered.
> > 
> > Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power
> > domains")
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> > This patch is based on 5.17-rc1.
> > ---
> > drivers/soc/mediatek/mtk-pm-domains.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c
> > b/drivers/soc/mediatek/mtk-pm-domains.c
> > index b762bc40f56b..0195f6c3396b 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -272,9 +272,9 @@ static int scpsys_power_off(struct
> > generic_pm_domain *genpd)
> > 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd-
> > >subsys_clks);
> > 
> > 	/* subsys power off */
> > -	regmap_clear_bits(scpsys->base, pd->data->ctl_offs,
> > PWR_RST_B_BIT);
> > 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
> > 	regmap_set_bits(scpsys->base, pd->data->ctl_offs,
> > PWR_CLK_DIS_BIT);
> > +	regmap_clear_bits(scpsys->base, pd->data->ctl_offs,
> > PWR_RST_B_BIT);
> > 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs,
> > PWR_ON_2ND_BIT);
> > 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs,
> > PWR_ON_BIT);
> 
>  
> Does it mean that we have to do power off by:
> regmap_set_bits(PWR_ISO_BIT)
> regmap_clear_bits(PWR_RST_B_BIT )
> 
> and do power on by:
> regmap_set_bits(PWR_RST_B_BIT)
> regmap_clear_bits(PWR_ISO_BIT)
> 
> But scpsys_power_on() has the following sequence:
> regmap_clear_bits(PWR_ISO_BIT)
> regmap_set_bits(PWR_RST_B_BIT)
> 
> Thanks,
> Miles

Hi Miles,

This control sequence is suggested by hardware designer,
and when PWR_RST_B from 0 -> 1, it will trigger to exit from reset
state to running state, if we still enable isolation then can't start
running normally, so we need to disable isolation first in power on
sequence.

Thanks!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
