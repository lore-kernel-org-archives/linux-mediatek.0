Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D8ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 04:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW/x7MiG7B2vjrj3KS93shZhBwyQ3bV542/dydczki0=; b=C7+2E6lZ0iOyJU5u/hb9Z93Dhw
	y8aDZngZFVE0lVvuc4KgL5fm/r42M6Hwk0uI6taeY6IKXPtEtVqJjpVZ2unCSb3uX/AyhpEKco0Iy
	5RQY+y+ChYR4QXdD7cGQpYygG0qH0ljqZBEhh0h4ReRGBRYlvt0d16Bxx/f1NsCZBGWyFPlS97Fh2
	W+D27u8Ca/srSt+Pjgy6n2MG69vXlf3mtPkC/yCRzaAd/hDnjwzzCkSam/BOrsO7u7fI5BAT1z+tS
	HUB+ao5Boar+FndqvdFCPYQweTV7LGMVTQXVapo/XtiarwmBj9wFAJ7yNgoMjvbYE+RHCALhhdtqX
	atUJrrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYgb4-00HRO9-TF; Thu, 15 Sep 2022 04:35:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYgb1-00HRMB-T3; Thu, 15 Sep 2022 04:35:29 +0000
X-UUID: d58043662ef1410d9860be80f673682b-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mW/x7MiG7B2vjrj3KS93shZhBwyQ3bV542/dydczki0=;
	b=Tehk7zFTzf5ax9Ttii7dFBi9DT5vg060DQ2+ngZqpnpWAmRFi/teh6+cbSB76mrzHic6scrQVhBS+wV9DX1glBpF2SKgbsYMODZHagaAphsa+kbRoYodtCbCd1zGIYwdFxKm6KDcRbkKRzITQMTVcSLBNj/UF/Pk88gM4FwAal4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:162d0621-d511-47e6-83e6-45519b39acc8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:677077f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d58043662ef1410d9860be80f673682b-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 641297436; Wed, 14 Sep 2022 21:35:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 11:34:38 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Sep 2022 11:34:37 +0800
Message-ID: <da8726dc111520475c1685170e5a3a49c7db05c7.camel@mediatek.com>
Subject: Re: [PATCH] pwm: mtk-disp: Fix the parameters calculated  by the
 enabled flag of disp_pwm.
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: <thierry.reding@gmail.com>, <matthias.bgg@gmail.com>,
	<jitao.shi@mediatek.com>, <linux-pwm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 15 Sep 2022 11:34:33 +0800
In-Reply-To: <20220913090521.6ybohvgbehua4rgv@pengutronix.de>
References: <1661745852-27323-1-git-send-email-xinlei.lee@mediatek.com>
	 <20220913090521.6ybohvgbehua4rgv@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_213527_967191_59364C98 
X-CRM114-Status: GOOD (  28.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-09-13 at 11:05 +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Aug 29, 2022 at 12:04:12PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > In the original mtk_disp_pwm_get_state() function, the result of
> > reading
> > con0 & BIT(0) is enabled as disp_pwm. 
> > In order to conform to the register table, we should use the
> > disp_pwm 
> > base address as the enabled judgment.
> 
> Do you want to say:
> 
> 	The enable bit of the hardware is bit 0 of the DISP_PWM_EN
> 	register at offset 0 for all supported hardwares. Up to now the
> 	bit was wrongly assumed to be in the CON0 register.
> 
> ?
> 
> > Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API
> > .get_state()")
> > 
> 
> This newline is unusal.
> 
> > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> > Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> > Base on the branch of Linux-next/master.
> > Split from series [1].
> > [1] 
> > https://patchwork.kernel.org/project/linux-mediatek/cover/1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com/
> > ---
> > ---
> >  drivers/pwm/pwm-mtk-disp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-
> > disp.c
> > index c605013..50425cd 100644
> > --- a/drivers/pwm/pwm-mtk-disp.c
> > +++ b/drivers/pwm/pwm-mtk-disp.c
> > @@ -197,7 +197,7 @@ static void mtk_disp_pwm_get_state(struct
> > pwm_chip *chip,
> >  	rate = clk_get_rate(mdp->clk_main);
> >  	con0 = readl(mdp->base + mdp->data->con0);
> >  	con1 = readl(mdp->base + mdp->data->con1);
> > -	state->enabled = !!(con0 & BIT(0));
> > +	state->enabled = !!(readl(mdp->base) & BIT(0));
> 
> I would expect this to better be:
> 
> 	state->enabled = !!(readl(mdp->base + DISP_PWM_EN) & BIT(0));
> 
> which is the same for the compiler but a bit more descriptive for the
> human reader.
> 
> >  	clk_div = FIELD_GET(PWM_CLKDIV_MASK, con0);
> >  	period = FIELD_GET(PWM_PERIOD_MASK, con1);
> >  	/*
> 
> Best regards
> Uwe
> 

Hi Uwe:

As you said, what we need to modify is the offset address of enable of
disp_pwm register.
Thanks for your review, I will revise the next version as you
suggested.

Best Regards!
xinlei


