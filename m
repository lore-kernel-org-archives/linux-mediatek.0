Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835ECC07E9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKeP+ghYgSOaqQd9YmiBluDsTnRdrFDBnor9fqLcXXw=; b=NODN/K72a7gG0Lx3Gs5FPQIbXk
	1X2YINRLoy/T44hwRIzcQZeT9p3uKng6Qmz4LXvZ1LmiYQzHi438u+u8rA1kWWNpw9cU3Nel6gfOy
	SEng49Ih90OUTfgMaauApEjM4Fo8s0g7z6JK2P/fMeVT4tOrx9zyxroxV9wrEPVy+dklBqUHqmC2H
	TOMeAGognW5+Xw+KURQ0XXvewgBSl4Zxcme3UA4k/hmCJRtHVo40yJ7jT2A6sliacF/DSBLmdA6Ml
	0EBsRHJ7sLdxcLAPY/dZNt+WiCm8jyCnaHgkXWbqBjL2pHHHicGQYd/Y9W1zAnyfL3ILEmpKVAYEX
	3NppU3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odn6B-001PtL-MW; Thu, 29 Sep 2022 06:32:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odn60-001PqY-F6; Thu, 29 Sep 2022 06:32:34 +0000
X-UUID: 7fc3b95ee6d8422f84ee7eef08000a43-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pKeP+ghYgSOaqQd9YmiBluDsTnRdrFDBnor9fqLcXXw=;
	b=f5BLZMWhhboHkhNOeLx1GjSIih8HXCYvTphZniaGtnCCvQd5gNy3rWHg5n3Owz6QQsD5VBfdTn036Mkfv7DavviSmlXgl6sMml8PAjAkTxfRBHXPKJEAcrRd3vj4qMJXtd8b6STunkLiI5IaNEg0Kh+JK6wPTkWcje7NWVSZqGk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:52ce6e75-b2e4-4d0a-9e16-62d34d0079e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:abd06807-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7fc3b95ee6d8422f84ee7eef08000a43-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1808991084; Wed, 28 Sep 2022 23:28:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 14:27:34 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 29 Sep 2022 14:27:32 +0800
Message-ID: <544f6c3fc4a72b519578b07cc04a1bcd1209fcef.camel@mediatek.com>
Subject: Re: [PATCH,v2] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 29 Sep 2022 14:27:34 +0800
In-Reply-To: <b594626f-5c73-2a4c-6286-81f9df26832e@collabora.com>
References: <1663934771-15152-1-git-send-email-xinlei.lee@mediatek.com>
	 <b594626f-5c73-2a4c-6286-81f9df26832e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_233232_540876_73ED3F09 
X-CRM114-Status: GOOD (  21.31  )
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

On Mon, 2022-09-26 at 11:13 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/09/22 14:06, xinlei.lee@mediatek.com ha scritto:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > In the original mtk_disp_pwm_get_state() function, the result of
> > reading
> > con0 & BIT(0) is enabled as disp_pwm.
> > In order to conform to the register table, we should use the
> > disp_pwm
> > base address as the enabled judgment.
> > 
> > Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API
> > .get_state()")
> > 
> > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> > ---
> > Base on the branch of Linux-next/master.
> > 
> > change since v1:
> > 1. Modify the way to set disp_pwm enbale.
> > ---
> > ---
> >   drivers/pwm/pwm-mtk-disp.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-
> > disp.c
> > index c605013..1a9880d 100644
> > --- a/drivers/pwm/pwm-mtk-disp.c
> > +++ b/drivers/pwm/pwm-mtk-disp.c
> > @@ -197,7 +197,7 @@ static void mtk_disp_pwm_get_state(struct
> > pwm_chip *chip,
> >   	rate = clk_get_rate(mdp->clk_main);
> >   	con0 = readl(mdp->base + mdp->data->con0);
> >   	con1 = readl(mdp->base + mdp->data->con1);
> > -	state->enabled = !!(con0 & BIT(0));
> > +	state->enabled = !!(readl(mdp->base + DISP_PWM_EN) & BIT(0));
> 
> I think you mean mdp->data->enable_mask here.
> 
> Anyway, for the sake of human readability....
> 
> u32 clk_div, pwm_en, con0, con1;
> 
> pwm_en = readl(mdp->base + DISP_PWM_EN);
> 
> state->enabled = !!(pwm_en & mdp->data->enable_mask);
> 
> Regards,
> Angelo
> 
> >   	clk_div = FIELD_GET(PWM_CLKDIV_MASK, con0);
> >   	period = FIELD_GET(PWM_PERIOD_MASK, con1);
> >   	/*
> > 
> 
> 

Hi Angelo:

Thanks for your suggestion.
I will modify the code for readability.

Best Regards!
Xinlei


