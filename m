Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67D4C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 08:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B008B60F41
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 08:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B008B60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1RT9xGYyIWkh458rXhWKNglm0+kVaC/Tm8DhH3uF2c=; b=inQ64tZYok6PBJ
	LIov1sMxn3zu7zcd3NDT/n8Z0Glv8e00L5hdiNWRuznnGABD4FLlOuDSQyTLl9VPybAi5b1qZPxLo
	jiTQtFGo1xRrhW+iO+eH2RBkHnwmK5qY03c+4OQvGHkERl9eS9m7+oji9lhTg5K+FeJY68nS6B3+6
	9WMVGFAGC7pTHYkLsBmCEz+jUhKCfFPlXALfa7bbTEDlzYuACNFvjy5jDAsHp21xG+QUzzZdcjS5H
	E9bx3gAH7jqJqXD/d8gG1b9O6uXevLAXF4Z1e/zKpgzADXU86zAVRHqbYhTWFYQW0VBdU17CZQ/JM
	e4SdDTnPKCJEr7R2TCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDjo0-0063tc-LP; Wed, 11 Aug 2021 08:41:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjnb-0063hP-2a
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 08:41:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id t9so4076769lfc.6
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 01:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRXhxpsGGBaiNGCyD3hg6td+QSBXWB5z0qL251IrDq4=;
 b=eUmIOHzwisXtFKg49mSlkUJt8dGRHaqzBozWiWhzdPe8zHaOj6f30AKTlAcDd/lwb5
 t4zLhSo+WFWFP1R0ImhHYjgR4CCSbFHRxMLECl2Qshn1OxF5jzpVhIUE/4+FYbFet3f+
 gmve+QbPDuRAm+TQyHyiksrDXBapJDsvmXRBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRXhxpsGGBaiNGCyD3hg6td+QSBXWB5z0qL251IrDq4=;
 b=W/MQq1XtpwjceFp7ua8MEJt6HVlWuxybgGCaprZckCqdg73Za9/J9YMd6YcsrCWQ74
 CdeYEJfHZqha9kciFYh5Aj1IG4Xp55MQROeH74Iz2AGhWG6cZZX4GrEJX2yMAsr733YM
 T7vd05AaJBrp5sJrKcV6Q96lOuKpVwbIFsxZ+l2MCSRyzBLJTotN8BWQFxDfMR8SMG1h
 hDiSFKBLVqjEPBwMa+RhlbdL9WMQEBL/sUD2hQ6SdrpXwyY2p0NsinflT4Sj/SOSNa9+
 tF1Oz4IwGQDSQSJ9N/j+u9o8fs9XyTrA+K7qreRJUy/opd5MREnqG0jxDJlz7otsiBDW
 Fb8w==
X-Gm-Message-State: AOAM531mzP+ZcFKt9CC7kwq86I3Dl1YtfoxL3hv4uxHEp/zIu03O+GCL
 G91SnHvi+LvTyqLjmt9NFEYXCThOty4CGW27/Xf7UQ==
X-Google-Smtp-Source: ABdhPJwsZ0kR+wuRdn0H8ALHibyWYiHn6X3kKvBgnSFW7akG+ZYd5RyTPL8iL85Od9MwX7ggGlwRnvEVfNe08yrDK+g=
X-Received: by 2002:a19:c202:: with SMTP id l2mr24358532lfc.276.1628671276094; 
 Wed, 11 Aug 2021 01:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
 <1626517079-9057-4-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626517079-9057-4-git-send-email-kewei.xu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Aug 2021 16:41:04 +0800
Message-ID: <CAGXv+5EGpUV0eaQ6duZ8y8u2dvc1y3uc2YwWP=07D+ZZpzMCvQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] i2c: mediatek: Reset the handshake signal between
 i2c and dma
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, 
 yuhan.wei@mediatek.com, ot_daolong.zhu@mediatek.com, liguo.zhang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_014119_167130_9886EB31 
X-CRM114-Status: GOOD (  20.21  )
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

Hi,

On Sat, Jul 17, 2021 at 6:29 PM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> Due to changes in the hardware design of the handshaking signal
> between i2c and dma, it is necessary to reset the handshaking
> signal before each transfer to ensure that the multi-msgs can
> be transferred correctly.

This also affects MT8192. Has this been tested on that SoC as well?

> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 222ff765e55d..c0108387f34b 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -47,6 +47,9 @@
>  #define I2C_RD_TRANAC_VALUE            0x0001
>  #define I2C_SCL_MIS_COMP_VALUE         0x0000
>  #define I2C_CHN_CLR_FLAG               0x0000
> +#define I2C_CLR_DEBUGCTR               0x0000
> +#define I2C_RELIABILITY                        0x0010
> +#define I2C_DMAACK_ENABLE              0x0008
>
>  #define I2C_DMA_CON_TX                 0x0000
>  #define I2C_DMA_CON_RX                 0x0001
> @@ -850,6 +853,17 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>
>         reinit_completion(&i2c->msg_complete);
>
> +       if (i2c->dev_comp->apdma_sync) {
> +               mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR, OFFSET_DEBUGCTRL);
> +               writel(I2C_DMA_HANDSHAKE_RST | I2C_DMA_WARM_RST,
> +                      i2c->pdmabase + OFFSET_RST);
> +               writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);

I2C_DMA_WARM_RST is self-clearing. Is I2C_DMA_HANDSHAKE_RST not
self-clearing? If both are self-clearing, don't you need to wait and
check for them to cleared? If they aren't self-clearing, do you need
to delay some time for them to complete?

> +               mtk_i2c_writew(i2c, I2C_HANDSHAKE_RST, OFFSET_SOFTRESET);
> +               mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_SOFTRESET);

Same here. No time delay needed?

> +               mtk_i2c_writew(i2c, I2C_RELIABILITY | I2C_DMAACK_ENABLE,
> +                              OFFSET_DEBUGCTRL);

A comment explaining what the section above does would be nice. AFAICU
this is force resetting the DMA handling.


Regards
ChenYu

> +       }
> +
>         control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
>                         ~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
>         if ((i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) || (left_num >= 1))
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
