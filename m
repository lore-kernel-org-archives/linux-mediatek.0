Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81657C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yydj03gNNKHfS5JjOmv1pfFMcLoxCijcBYByH7u8Ho=; b=A1SnvZccVyoFhM
	xPJcgdNaUYuUDEBvAh3mGSHmP1zPbU/X7gWYikix6gqwRRXRzsS6IMXfFQPHhkGvKpvfpTG97l75J
	hA3eHIDGjo+aA0lJN1C+qg0dkk5nRMPJ+M47lIAfNCteSzifZh8QgZAVGI9zrlMAyvWf1HJ9ikRC6
	IFQekiUu7DU6Q2wR9b+CFBg4cpYOz19WuAEM1vkuhhCkW7ptXG+N5Cfk44rGGuzu7vLLK0xi/7+Po
	o8q8OS9hqGGbA3gt3lVqR1mIzTJ8QaWDf5xXWpgCvug3rkDqTrk25XEQAiPxdmoeWNfKP/h4zX2Us
	YDRfRe95rD3kZj/OwH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIye-007QK8-9V; Tue, 25 Jan 2022 10:23:04 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCIya-007QHf-Ia
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 10:23:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id h7so29581318ejf.1
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 02:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mXvXXH5NkD3VAbxPYQLS+yBdXysPjN86vINvSbtOAUo=;
 b=pDneXHtftHaFd0QpxVSQgYZJ/r85V/t7o7isVF9jWMXmK6UBInq4U2qhRaHN9SwHWb
 +0+uu2yDz4gyvRd8ExR0Y5Gr6hHRYuo4GHXw+g4H8G7bB6zqppHg6WqlXl5CPg59NNdl
 6/qXOtTbqvTSRLzAgl1zCdDRoM9RZCFoQDlE/H8a4ZGMQWkqHsuSAFhM72EqI+RmXBxs
 9nIPmmd06u2ezVi3XwxyrvGbsohdc1lF/NPzkPidacBVKieVvp6qL2elTUErmY1JIANy
 e1NfXcC10p09JorqT1p5lV33SQaKg3ODW8x+wi8GN4EQbYUNiklzMJjHAiVmlss+XzGr
 OygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mXvXXH5NkD3VAbxPYQLS+yBdXysPjN86vINvSbtOAUo=;
 b=rxUNOj3e0F5tJMozAA3zKS2J6aUbqYhjIL3Z/hT1+r/cxGfwYfg/qJNpRzdEHE9d5I
 HhXpYXZEccdtIws0uHMPtDhAgyE/gezE5zUY3WhZPoGJ0LsHZI/fQEBxx1oODU1jIufN
 hy/U8cwyAyamsSKwd3CHgLhud9ot8qADBFXpOhgszeBXX1+vdWIkjvvBJyZT3ZSrrcKr
 wa7W0uANafZnggBZzT0Xy51jnvkFzkjme3yDOnp0fBYtORN7wAXpXVl+j27Q+SDQL4w7
 RhZU0mqkzjgXNOd8AueNNpHeQjWkhKAbDBRMLx1rWOilno3kzEjiJ01nit+meI2/wCjo
 7mAg==
X-Gm-Message-State: AOAM530n3fKHIkh8TzlIfrz4KZ8/i1L4WhlGZHEpkht/QNzjYjYQcXW/
 6pYNlPbHrWyZdRAMitk5+wE4sQsRUauVfQrKovlnWw==
X-Google-Smtp-Source: ABdhPJzZTQ34Sj6DntR4KEnfsahwcr2GjkI+X89p/KhV55EV9Ip8387kcoPafKP0Tf9qoGGj36xxE50nWLaCOxj2LZ8=
X-Received: by 2002:a17:907:3f93:: with SMTP id
 hr19mr16043123ejc.697.1643106178771; 
 Tue, 25 Jan 2022 02:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20220120070226.1492-1-biao.huang@mediatek.com>
 <20220120070226.1492-3-biao.huang@mediatek.com>
In-Reply-To: <20220120070226.1492-3-biao.huang@mediatek.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Jan 2022 11:22:48 +0100
Message-ID: <CAMRc=McZTped08HwbM+pr-xtsDyddTLjpsCc_f7ucoDM2DNXaw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/9] net: ethernet: mtk-star-emac: modify IRQ
 trigger flags
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev <netdev@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, srv_heupstream@mediatek.com, 
 Macpaul Lin <macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_022300_676537_27930FA1 
X-CRM114-Status: GOOD (  16.43  )
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

On Thu, Jan 20, 2022 at 8:02 AM Biao Huang <biao.huang@mediatek.com> wrote:
>
> If the flags in request_irq() is IRQF_TRIGGER_NONE, the trigger method
> is determined by "interrupt" property in dts.
> So, modify the flag from IRQF_TRIGGER_FALLING to IRQF_TRIGGER_NONE.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> index 26f5020f2e9c..7c2af775d601 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -959,7 +959,7 @@ static int mtk_star_enable(struct net_device *ndev)
>
>         /* Request the interrupt */
>         ret = request_irq(ndev->irq, mtk_star_handle_irq,
> -                         IRQF_TRIGGER_FALLING, ndev->name, ndev);
> +                         IRQF_TRIGGER_NONE, ndev->name, ndev);
>         if (ret)
>                 goto err_free_skbs;
>
> --
> 2.25.1
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
