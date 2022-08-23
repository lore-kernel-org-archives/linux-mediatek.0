Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978D9C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TbxRyzdztn1NiJp5R3HW5/9g2+zp5DPvsdzpL6ZGWw=; b=kl0C/GFMTCaQH5ZEE7ZmIWbmOA
	yodIzolDZ5e0HIL8ajSjI45mQco0dfATXxrGZW+0tfrGNSMdazzw+b/JdZ+AdnsmFkBWP2+OgPU+C
	HL8SQI1loujffMBkGj+KnJIkWBe02cvQ3SLMVWBosC9Y+DFBK0zpgwxil2ehGOvMoRgvwPH8+Kilh
	pcNcmblRpRqVDk28q1ptHl8/QLFEGla1M17KMf62j88k2nhgDAw+NbaQq9JCeF+6AZ5YPAH3sHjud
	IX6yfG1g7Hhn70KFy/QpmGpnbcCZIJQ0+F2BAHdBkuUkunaLN8xGKspTHgweAZGPgZe7ajp1hbKS3
	tmXRlFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQQy0-004qZv-V6; Tue, 23 Aug 2022 10:17:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQQxy-004qVH-EV; Tue, 23 Aug 2022 10:17:03 +0000
X-UUID: 35a7cdafa28d4d0c95b87f3d5b3d321c-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/TbxRyzdztn1NiJp5R3HW5/9g2+zp5DPvsdzpL6ZGWw=;
	b=UWQ861MW8eG1JE2iMpavk3CeEF1HT7lm6Y4YVx1ZrRPSTXWQxvhXlfqFejKfFjeMb2GjyRiLAx1UTPi/vmOXHQkNYCpNBe8VJQMd0MvD+jo/6Jfu2ahI97QiKOjinEQsLs8OCldY4FOtKB7/xbCWzqIIXxEhaSEz3aCVMOhbUY8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:42eae510-6a04-41d0-b123-a8071f60d58f,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:931989c9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 35a7cdafa28d4d0c95b87f3d5b3d321c-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1168581710; Tue, 23 Aug 2022 03:16:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 17:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 23 Aug 2022 17:26:15 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH,2/2] pwm: mtk-disp: Fix the parameters calculated by the enabled flag of disp_pwm.
Date: Tue, 23 Aug 2022 17:26:15 +0800
Message-ID: <20220823092615.1765-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1661239875-19841-3-git-send-email-xinlei.lee@mediatek.com>
References: <1661239875-19841-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_031702_511350_B81F34E2 
X-CRM114-Status: GOOD (  15.34  )
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

> In the original mtk_disp_pwm_get_state() function, the result of reading
> con0 & BIT(0) is enabled as disp_pwm. 
> In order to conform to the register table, we should use the disp_pwm 
> base address as the enabled judgment.
> 
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index c605013e4114..50425cd1de61 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -197,7 +197,7 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
>  	rate = clk_get_rate(mdp->clk_main);
>  	con0 = readl(mdp->base + mdp->data->con0);
>  	con1 = readl(mdp->base + mdp->data->con1);
> -	state->enabled = !!(con0 & BIT(0));
> +	state->enabled = !!(readl(mdp->base) & BIT(0));
>  	clk_div = FIELD_GET(PWM_CLKDIV_MASK, con0);
>  	period = FIELD_GET(PWM_PERIOD_MASK, con1);
>  	/*

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 


