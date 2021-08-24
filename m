Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA14C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 13:16:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA8D761184
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 13:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA8D761184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WjL4Wv3HzdgyGwoDfA+c3q+OOgEymt0GtlaT6Aor1w=; b=UNm92OpIrmPky1
	j84/u+KBrU3JsLl+QGjIiX0V8h6wbRv2JnnsMOvCAPnZYQy2Fg/8duD/yWvrSLZFDgC3ASdr9n1Ub
	Mtgd5UGi+zBnrlt6HavE8chsFEAZrIu4DgZvka3Zo7MQ9qM0nbW3MHx7Z/sfCdXdHgJJyNjNpp8tz
	Or7xg833PboqL+s3JUDQxZi8u2tt7SuvG2iZHOOkzN+Ya1fDPPV5lfowUeI9jklYPZVtrEr0VKGu4
	8I2nvUlZkowU+jYGr7vaq5dOIJZ6juRnelSpHZ5sm03GRswTryKZWmpmMKCppCzCsV4NVfK9f25Qr
	WYHnPWXXhpOR+PKvWsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIWI4-003Bu8-7x; Tue, 24 Aug 2021 13:16:32 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIWHp-003Bq5-Fu
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 13:16:21 +0000
Received: by mail-lj1-x233.google.com with SMTP id m4so2820766ljq.8
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ydTVZ15OhL0mGtwmOd376yklz9JBnBhbEVNdkVMJ/z0=;
 b=XPM3yRqCi4Jh+kJYR3AfSNeIhcwiK9U57g5ukbYv7PRiIEIm93U8ACJ6oGo1TVceQm
 cQQy5M/fQCBoeWm2+pbY66wVkAJEEj0NrV9EkSkkXKOiStCyaMEXmRgdKxTkZhYx+k1W
 5sU/Ons4G7ErJPycd/6adP7IBvdiKwAzhzQ22oPHRW3Z7w7ShMm9AHexTMKAyxvMQjJk
 gxucXOGQBzsUbAx24Xz2XqZbYWWNAf2+g4YLb+MORNdGezqoDWXqjuYay+wW3y9ynPy4
 hNAqDHbCZejWwlU9SZhJtMAx25yZywqbqLrG77zEMjYCK/CgUOFe54PKGukV5l7yuMe7
 N7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ydTVZ15OhL0mGtwmOd376yklz9JBnBhbEVNdkVMJ/z0=;
 b=leVMnvi0CiF3hj9BJfgU7NckbfsctTQ6LjfV7pT5MICkzWCkdNK6025ir0YAOuRXHl
 TSsmKErrR+EpFrlkKG9F+inafTJgphT+FAOnYvAj2DshhU9h0WsWOzpybav3HNx10GYL
 zaWHIVsCr6YUE/p8ao9H/QpqY2vgKGqpbnQk4NBEhAd/eANEl+zL57L21BQC82a8gjPW
 N3YNIPiTOCh+FVzypI8v7tg4dRQmGg0a7sPsQs1Y54S/+cRJeHfucoiohQ21ScuL/ToM
 eBylsqS6+k7mtYRwKROsnJRowj1w3ijL1wWxWTwhjDO23EyBE56vHYPF2iFKwKzpvQRV
 cHpw==
X-Gm-Message-State: AOAM531lqngoUxwpxC4ke3gVrbNU61Epu2cwBqPyZwf9NvNk1IYVpBEU
 NCMRCYWJPnk+enAsK5/GRNJzK6UZHe8Iyna2/ZHfeg==
X-Google-Smtp-Source: ABdhPJy753AzVXSSiQfqytntQ08HWRbs8vTdlqrvJAwaJjLm66jH8yB6x80jNU5eEaj/WH62hBiYT5ElWXoHzqleFzk=
X-Received: by 2002:a2e:a410:: with SMTP id p16mr30044554ljn.364.1629810964603; 
 Tue, 24 Aug 2021 06:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210816073813.11715-1-Mason.Zhang@mediatek.com>
In-Reply-To: <20210816073813.11715-1-Mason.Zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Aug 2021 15:15:28 +0200
Message-ID: <CAPDyKFpSOcX6End_L0mLRt61s0aS_zT19snM71j9bxgMi1oUuA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: mediatek: fixed clk contrl flow
To: Mason Zhang <Mason.Zhang@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_061617_566101_909EF0D6 
X-CRM114-Status: GOOD (  18.20  )
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

On Mon, 16 Aug 2021 at 09:39, Mason Zhang <Mason.Zhang@mediatek.com> wrote:
>
> this patch fixed clk contrl flow in set clk rate, no need close clk src,
> gate cg is enough, so no need call clk prepare/unprepare.

No, this isn't the way we should deploy clock support in drivers.

If the driver doesn't need to gate/ungate clocks from atomic context,
the proper thing is to use the slow path APIs, clk_prepare_enable()
and clk_disable_unprepare().

Kind regards
Uffe

>
> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246c5f95..d9835b272c1f 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -895,9 +895,9 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>          * So if want to only gate src_clk, need gate its parent(mux).
>          */
>         if (host->src_clk_cg)
> -               clk_disable_unprepare(host->src_clk_cg);
> +               clk_disable(host->src_clk_cg);
>         else
> -               clk_disable_unprepare(clk_get_parent(host->src_clk));
> +               clk_disable(clk_get_parent(host->src_clk));
>         if (host->dev_comp->clk_div_bits == 8)
>                 sdr_set_field(host->base + MSDC_CFG,
>                               MSDC_CFG_CKMOD | MSDC_CFG_CKDIV,
> @@ -907,9 +907,9 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>                               MSDC_CFG_CKMOD_EXTRA | MSDC_CFG_CKDIV_EXTRA,
>                               (mode << 12) | div);
>         if (host->src_clk_cg)
> -               clk_prepare_enable(host->src_clk_cg);
> +               clk_enable(host->src_clk_cg);
>         else
> -               clk_prepare_enable(clk_get_parent(host->src_clk));
> +               clk_enable(clk_get_parent(host->src_clk));
>
>         while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
>                 cpu_relax();
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
