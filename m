Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXudwNZomMseCIQURZe4SfeqYOZQgBSVllUjwynSUg4=; b=XD1ca2Aop0jSc4
	d7zQMoHYLBZ7Icsy4Rn2whNcGz/erPGzqhrkq7N1bIbWgZ/r4/Xjxkoh74SY5G+m0ZC1dkY9KgL0/
	pT3bSi4m4TBT1v6MFVGrlPm+E4vdfYCBS7VM54opIcz1QAnr34vrTM3FN8Jgl8vfxRJFzdytkVYqV
	SsI257KhrRcQ3JDxAI2Jc0DzikClw4C/hAd7teUpqQg2Xp8LdnWLpwqM1moKar6TWbx93vpJQ4R4w
	vM1upWKtJAJBrIMd39hP4o3M72Dish5gMvgSGLwbcKwoWSa58gTAi/TtcegE/Q/noTeEA55JuWqMB
	js1tcWq7SnHyoM5Mx19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI5AN-003AVQ-Qa; Thu, 10 Feb 2022 08:51:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI5AA-003ARN-5j; Thu, 10 Feb 2022 08:50:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5A7BB1F45F95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644483049;
 bh=QB8v1TZ46BYQxibDWegAgbUNsBvd0WdJQaG+Wn+uyBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fNQBfk80LkkNCaIMaWvxNI/HF+K/sMgLrX9ou1kchJKZOJljSkL0AsJuYT5tGPAmL
 Iv2lToQSBybMGoJe7oovnIuHB9tXIX0vtPJKOPuPd7G++oUy8eGWBC/vaqeW2oyHy6
 pmJmj3Tps/xUUR1NLYDBQzUgfdLrS7B56eEFv+Tqm4HL3U2NEgh1l5eVdZLhSDENkW
 Aj9DMPe5PPI3MLFjiihFXz+g+zipEmbHIuuu7vI/KkhZT83JXKFJ8MRHrS/Sp4WaIT
 qiMMZluWNYNwbki6cYzdJ5PgEYR0XHhn4tX222wGmcs5/hfCYQQhegJAEplZCDZitf
 a02NxyvkdrWOg==
Message-ID: <8c5cf4b7-dd73-49f6-60dd-b62b3fc3ecdb@collabora.com>
Date: Thu, 10 Feb 2022 09:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 3/3] pinctrl: canonical rsel resistance selection
 property
Content-Language: en-US
To: Guodong Liu <guodong.liu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-4-guodong.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210062122.23974-4-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_005050_386856_96A83D5E 
X-CRM114-Status: GOOD (  14.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/02/22 07:21, Guodong Liu ha scritto:
> Change "mediatek,rsel_resistance_in_si_unit" to "mediatek,rsel-resistance-in-si-unit"
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Hello Guodong,
thanks for the patch!

However, you forgot to add the required Fixes tag to this one; this patch
should be fixing fb34a9ae383a ("pinctrl: mediatek: support rsel feature").

Please add the required tag.

Thanks,
Angelo

> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index d4e02c5d74a8..38c0f0c4cf95 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -989,7 +989,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>   	hw->nbase = hw->soc->nbase_names;
>   
>   	if (of_find_property(hw->dev->of_node,
> -			     "mediatek,rsel_resistance_in_si_unit", NULL))
> +			     "mediatek,rsel-resistance-in-si-unit", NULL))
>   		hw->rsel_si_unit = true;
>   	else
>   		hw->rsel_si_unit = false;
> 




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
