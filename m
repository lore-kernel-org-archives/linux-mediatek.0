Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94352C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Obyb5wFWTLv0FPRqVAz9VX/+59Y5LAj15gIAOWVKTI=; b=Bh02rvvExbULdh
	8DGBnJPazXmExKR37YmxmKSTgoMKl44IigZSeCDiTE8Q2Sk825srKjn84Fm2HST1kKCnUuVgr+by4
	hrv/DRpSRxXRUNr4Aa46v8FZSb3+IxqEWa//n9rpIoZiXeeS2dVSOQyUesq/HcN0aLoIhqWYNpIrg
	SlquER4PKq30IMzTipmbj7Jjo5c8deSd/t5F2EotARQRIdGXphMHJ5W/czccHw37sZduT5upewXeU
	JJK9Euf2DDUYYPShdSYyGsfIsPJILxO+mAtVKnnsPIPCkwnWMMaZ1kQYc7yrTv937vYGmGBxR2ZsI
	jg8VyWVyGXNBu0Yu6RtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhrm9-000GYx-M0; Fri, 22 Apr 2022 11:48:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhrly-000GVD-SJ; Fri, 22 Apr 2022 11:48:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u3so10709394wrg.3;
 Fri, 22 Apr 2022 04:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=USB9sQq04sTiAxmM8QQ7srYcUe8WlCh4HajD9OSYJ6o=;
 b=NzIx/QXqWbn00uU3BKoOzzQ56jbjOJFxXvcFNZMrrnkUcYyLYKtefdD4B78DxLpyqy
 qUQ9OjzuQBnOr/NBhm5cq4zASqJLzRaB1X5ETy+ZBJCgwVFkK/zrUXnkdQ9B8d3l77C+
 bao0jbWUFczaF4rNJfcMB7mdp/yMwDyP4KyXyd6As4FJx7vPiMZUMGrAjKQPVv35LQJj
 GqAET5OL4PFyFr7gaAn9/AhWfCWTSGI2nmpvnnI9E/dHu5T50OtUb/zQmZdaohc7UcqI
 /eW15+8FEZei1tw7AoLxovxndZxe2RiSJ7Vha7VoigGvm5EavC4yPYXHvGFfC+G+Atct
 EL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=USB9sQq04sTiAxmM8QQ7srYcUe8WlCh4HajD9OSYJ6o=;
 b=4ybcKGXHo9+wnu1BbLsV0fvga9UGvx6Y9LDux7Fa06Ve9GG6GqDwTzbtTwR6mbP0Pm
 fLT2uYd7ZlJLFjH3Z2ikk9OWviKDlE8vchzFRvdf3XXx+T8Ke4bxSRs6B3adLgfW1ehf
 fG5yqibM2KnHTd75AYd4O8DNILg5RjO/P21KK19TXBHtWWs36UkC30tEgpymIxfV0xKA
 Me4XuLBBUiss+VOY9RgMHSuDgVS5gRfXvM4V1dAbaj09285V2X3WxPIBX5D91RhQKRhs
 ru+l7oWGrmLNn6xm1jfCUY0aQ6Z3r5Fdytd2Hx6uSmZ/h/etoazWJup9VauwlcKw1SsB
 r8rA==
X-Gm-Message-State: AOAM531tzAzwK2RZdUPNPqEZfPBDENIb9X5gqu4AVP8MPc6wxzLi85T8
 Agj9eaCufTRpsbny4elfREQ=
X-Google-Smtp-Source: ABdhPJxnLaVOa0YHXafmOZJInj59XC4WGJzkGDmdMfbuZG+DNqLpxPS7LhSSaxyFsScgD1taCf5JDw==
X-Received: by 2002:a5d:6486:0:b0:20a:93fe:dd09 with SMTP id
 o6-20020a5d6486000000b0020a93fedd09mr3483295wri.436.1650628103145; 
 Fri, 22 Apr 2022 04:48:23 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0038ebcbadcedsm5107504wmn.2.2022.04.22.04.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 04:48:22 -0700 (PDT)
Message-ID: <2cd07faf-e903-e55b-85c1-ce7a823ddb8b@gmail.com>
Date: Fri, 22 Apr 2022 13:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 11/21] drm/mediatek: add display merge start/stop API
 for cmdq support
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-12-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220416020749.29010-12-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_044826_992328_F9D5F2FF 
X-CRM114-Status: GOOD (  18.28  )
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



On 16/04/2022 04:07, Nancy.Lin wrote:
> Add merge start/stop API for cmdq support. The ovl_adaptor merges
> are configured with each drm plane update. Need to enable/disable
> merge with cmdq making sure all the settings taken effect in the
> same vblank.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
>   2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 53aa988dde3b..43a412525b75 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
>   void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
>   			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
>   			      struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>   
>   void mtk_ovl_bgclr_in_on(struct device *dev);
>   void mtk_ovl_bgclr_in_off(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index 40da0555416d..c0d9b43b2a66 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -67,17 +67,31 @@ struct mtk_disp_merge {
>   };
>   
>   void mtk_merge_start(struct device *dev)

Probably not my call, but wouldn't it make sense to enhance mtk_merge_start to 
pass 'struct cmdq_pkt *cmdq_pkt' directly instead of adding this 'adapter'?

In the end this is up to Chun-Kuang.

Regards,
Matthias

> +{
> +	mtk_merge_start_cmdq(dev, NULL);
> +}
> +
> +void mtk_merge_stop(struct device *dev)
>   {
>   	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>   
> -	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> +	mtk_merge_stop_cmdq(dev, NULL);
>   }
>   
> -void mtk_merge_stop(struct device *dev)
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
>   {
>   	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>   
> -	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CTRL);
>   }
>   
>   static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
