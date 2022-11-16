Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5701C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vuu78aZaHK7VJ8++7/BN17PpF7VX0jC0oheW36hmIs=; b=ZGP3M1Q2B7+G/D3Q/NU0IQxw6o
	0QiEm6Qbz6oDKFYTWz7XhzUR/N5yUuxpseip2HBT0RMcOimMy9dhFTcAISyfFmcOFamhjGWb9Alno
	23QdLZc9AzoD11VYlayh9DlBadjHMal5yHpjkveGhsvtfc92raJs8nFCogieCx815KybV3B1XN4a7
	zGK9CSS+3W6g58EA+v9n/ReEeqh6a8WJTgTMZ+0s6xLkNYcfaBEAZVlclSzApDFDQqsJ/AEZvv3gJ
	MrkfE6JUiqpHODfp4Kw2tCf83pPtpl/u1mczkLnkwsyHJazeQ09BgQez+2zJWub/8NzV1x2bWlRYm
	ipuM7S3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovL7I-005n7U-7d; Wed, 16 Nov 2022 16:18:24 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovL7F-005n5K-CJ
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 16:18:22 +0000
Received: by mail-pj1-x1030.google.com with SMTP id gw22so16973651pjb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 08:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vuu78aZaHK7VJ8++7/BN17PpF7VX0jC0oheW36hmIs=;
        b=uuC6XXHVG9Amxc061f3zNUOSdEnIEF4TjDWOnctoTMuFscut4Itv7mLnBGqCfgs0al
         L+c/6HzzyuYppun8NsFwkMKhAp5vuR0lJkvjp0Yz5s3NOtHEoezqavVS9o1XoDOkXRp2
         nqljq8Xzfl5NVYp/FgHWjOUh+fYjzcJCl7moBfmRkCKQLPemXAavMLERLsUbzejrOh3g
         sGecALTxxhB0T3feWWlLZDsacHgB4UyWhkhOqkh529nWjGvMUHJ+j4rmzbEUntYWrui9
         +lVi3b7o7oneBIJGhYCYDGHbBxGQ56+iebIAoJY2gK5JwDxBEF9X3O2nublK5wBYf97X
         8/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vuu78aZaHK7VJ8++7/BN17PpF7VX0jC0oheW36hmIs=;
        b=BhWmD9yv0u8N4ZDOFBsDjSxM/iTasXwYKRTJfjrsQin7GChaZWg0dMk98lGOsCk/HR
         q2C6Kg8F1trmgclwRsFCulErISbc6BWFrUB8AtAcdzIaVt5ONTqz42bIjNb8r9c4ovCR
         1pdtoi5vRZfkUC9Qse3Ct2CK5IhejSyDE+9uiJYg3/GYyxpuK0vwk6Lp3TYQoKbkBmeB
         AaHgd/tboTVofXThZTs+BVnClM/1niWT8b3nQQ0qNt3sJMfjt3EXETB6nt4KE91j7rek
         +ZRIxBBrZ1KDnv726SBlhYO7XcrFazsNDfJ7gSnBBouNizAmA+Kh/suTACd50Kw4d+/D
         lH8w==
X-Gm-Message-State: ANoB5pngY0LCW7zElV7iZzlH+ngTuGwI1PgFV3r4hhde81wsbhX+TLdX
	fJ3F4r24LDrcNa5OoklePYEQWjrHp2QCKLUOC9N0mw==
X-Google-Smtp-Source: AA0mqf4Wa1H27TGFSnM/a1m63gk9/L+t2q1xko8YOBEh2/dkruP1K3xLmmg6L38tevF4sFxaktwBmh2GNWgpZ2zVkB4=
X-Received: by 2002:a17:902:d48a:b0:188:6baf:2011 with SMTP id
 c10-20020a170902d48a00b001886baf2011mr9115763plg.165.1668615498412; Wed, 16
 Nov 2022 08:18:18 -0800 (PST)
MIME-Version: 1.0
References: <20221110072819.11530-1-yuzhe@nfschina.com>
In-Reply-To: <20221110072819.11530-1-yuzhe@nfschina.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Nov 2022 17:17:41 +0100
Message-ID: <CAPDyKFrW+FaDNc+YPjrR1eAYhjPc6BHj4zqghBRnMC0P+A_jKA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: fix two spelling mistakes in comment
To: Yu Zhe <yuzhe@nfschina.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, liqiong@nfschina.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_081821_443875_CC37FCAD 
X-CRM114-Status: GOOD (  14.51  )
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

On Thu, 10 Nov 2022 at 08:29, Yu Zhe <yuzhe@nfschina.com> wrote:
>
> spelling mistake fix : "alreay" -> "already"
>                        "checksume" -> "checksum"
>
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index df941438aef5..a10aca76dfb3 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -735,7 +735,7 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
>                 else
>                         bd[j].bd_info &= ~BDMA_DESC_EOL;
>
> -               /* checksume need to clear first */
> +               /* checksum need to clear first */
>                 bd[j].bd_info &= ~BDMA_DESC_CHECKSUM;
>                 bd[j].bd_info |= msdc_dma_calcs((u8 *)(&bd[j]), 16) << 8;
>         }
> @@ -1212,7 +1212,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
>                      !host->hs400_tuning))
>                         /*
>                          * should not clear fifo/interrupt as the tune data
> -                        * may have alreay come when cmd19/cmd21 gets response
> +                        * may have already come when cmd19/cmd21 gets response
>                          * CRC error.
>                          */
>                         msdc_reset_hw(host);
> --
> 2.11.0
>

