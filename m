Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBCPl58uu7lncKqFb70d3uaLrkG0fLw7uxXn+D0iLVk=; b=HwuTLowCh+SRqz
	VtvCA0ToZbj6lT/Yio/FqgZMVXXXyIdW7MtQbO0O3ombJB/aws+qW9hYJYi0QXVzQ4qPXr8wr7Hj9
	KooyzrVQZ9VlgFYhn0nWwaQ+K4VzJ3bBotTf5OUYVjNSM+8LypEdCKk88fRO+FRn81CzgXV0Qtdde
	NImoJ9nPwJiIdA8e/XhsVJLU1dkW1aH7I1hgJI8YqyoERrHaMEkWhQ5x7aSA4TC8APmCqf6rErzKF
	WSkVUrpfy9BkGTMgTLRNAmqAFo6q0k7LlC697IBL29tdTfNlAdc0sbcsxnwGVNiI9/5ZH7ItTqnc8
	FWUQVGL/7/ePsOQkYdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niwF9-009Akg-R4; Mon, 25 Apr 2022 10:46:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niwEu-009Ag2-IB; Mon, 25 Apr 2022 10:46:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id y21so9013755wmi.2;
 Mon, 25 Apr 2022 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/kUZ7qeC4kUAsBno+tq5DgewTJsOtJlIzPTE4j6RoSo=;
 b=UP73freZ4aCTAWK/QJdepyUvg0C0eZWnAXzxRrxeid9YclAvTvsL/oj9YnUSwuu3M6
 AjXgujd1v9oUxIsBarWNq2nPUIA+2Z0XcJ2aLMLEp4S137aMAYypY4GjnnC2Xl6Wk5oe
 98Tp4/tYSKURtgBs7uv1hO5D2V9LLTA/6OZX41IWJEU1lhYiqnBIwMXyoOqsuAPWsf0a
 7tYGLHw2mRHkLAZA97nStFbAOYP3zIh+xmPHcrPKOrdAhcVrGr64Eq4Mm3aMYDxh2e3o
 wDBh+oAs3ztOr2v4LAcRKGY750hMLfTI7c+FZzZA+afGjG8Qdvl0SNAiBdQ3NQb0ggJf
 whpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/kUZ7qeC4kUAsBno+tq5DgewTJsOtJlIzPTE4j6RoSo=;
 b=4cnlDVZd+jsLsozql7KK+8ldcUMsMf1IdoOLqsjHuLLy8DtvCH4jCJ4Hh/Kp6frKTK
 Zv6UqtDRXGjGLiubkznVzQUR78u+UYRETM+lKLVfDES2PSLfCvhn2fj4hqz9yXW17fTy
 0ciWvXz6b05jX+y/4yLW2miLoomgxfDOwj0PvcKu05OTCNfPV9kkoWI6bDU7uaSYyZAN
 K6EFtRAoarGa0wsxt7Tj1qjQZa6NEDq0nrxeNC9fyxHlD2s1iMYXoCzaZOWTWe17ieUx
 0AUyPtYL+QuEuY9hVaSiimQ1jr/4WTux/8EcAIigxXPvBMwXrzBToi8ZevQ5Gw89V45P
 YG6A==
X-Gm-Message-State: AOAM53278KnNC1YVhdeTGJxZuTs/oUx/RS2eezUSGO1JlYXxkn9x0dij
 AyVSazysDndJefVIHbi5vxQ=
X-Google-Smtp-Source: ABdhPJwM7nl5KqGKF/zvs130PVYxl6YBC4SD36zeLuzvXryZ2KrnVyVTgZJ0ZGlwJGxS0Yo9szSSdQ==
X-Received: by 2002:a7b:c8cd:0:b0:38e:c2c1:5219 with SMTP id
 f13-20020a7bc8cd000000b0038ec2c15219mr24699413wml.151.1650883595368; 
 Mon, 25 Apr 2022 03:46:35 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 v28-20020adf8b5c000000b0020ad668407bsm4920826wra.115.2022.04.25.03.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 03:46:34 -0700 (PDT)
Message-ID: <f155664a-b612-0293-49d3-3ecbcb154f84@gmail.com>
Date: Mon, 25 Apr 2022 12:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] soc: mediatek: mutex: remove mt8195 MOD0 and SOF0
 definition
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220425034537.28989-1-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220425034537.28989-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_034644_662659_512A0659 
X-CRM114-Status: GOOD (  15.79  )
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



On 25/04/2022 05:45, jason-jh.lin wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> Using mt8183 MDO0 and SOF0 definition instead of creating new one for
> mt8195.
> 
> Fixes: 8fdb61f1933a ("soc: mediatek: add mtk-mutex support for mt8195 vdosys0")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Applied thanks!

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 9184684baf1d..981d56967e7a 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,9 +17,6 @@
>   #define MT8183_MUTEX0_MOD0			0x30
>   #define MT8183_MUTEX0_SOF0			0x2c
>   
> -#define MT8195_DISP_MUTEX0_MOD0			0x30
> -#define MT8195_DISP_MUTEX0_SOF			0x2c
> -
>   #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>   #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>   #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
> @@ -422,8 +419,8 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
>   static const struct mtk_mutex_data mt8195_mutex_driver_data = {
>   	.mutex_mod = mt8195_mutex_mod,
>   	.mutex_sof = mt8195_mutex_sof,
> -	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> -	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>   };
>   
>   struct mtk_mutex *mtk_mutex_get(struct device *dev)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
