Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263F9C10F05
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAVV2qiEK5RCktShx/Q1QMv0e5n63Am5gtpRCSYF1Yc=; b=HOoVJvxWbDjsaYmbZmjwEX+8b6
	+rLXYthC7Q3vcfQFUaUZqf5JaZjXdV1M4aT8hAqvlW7rEsLklQ/bZoezVkixd3cGwXXptAk5ln8fs
	gZyZfnlRDcOc9aor370WTPD8WKCz/ztqMLYyM5j2CBU6Iu0vLoBV+DRaRoUWm4G+zj4QOiVJdGjvD
	Bw0dQ7APcGACMjYcsVip3no0y4kyk1PKc33wBinjSSZ53V8WC4J3iIv+tm/SzHhKGtQKdAlgEqeco
	dxF9UEHKrCkulEBNVkLGhr3eNtcuq+nsDPAdg/VsdiUYHLsIzG9CV76lr2KGB6kD2j6fn1U3qYkV2
	PqDBhnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEaP-00CvFS-2Q;
	Thu, 07 Dec 2023 13:38:41 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEaK-00CvB5-2O
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 13:38:39 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-db539ab8e02so1095126276.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 05:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701956314; x=1702561114; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lAVV2qiEK5RCktShx/Q1QMv0e5n63Am5gtpRCSYF1Yc=;
        b=L0fHXLLmvyztdxtX+4d5qJFn1qDdY+I6Oyi4NFMNyBIO3uDA/VHIGhpzyvmTIQFTHR
         zbqhJja3Tc2cNzu9a6sxIS2LUIWA+K6EcWZgKscbQ60uqFsoXoNBqMLoEAdq6zDva7Vp
         iRMRmjlECj+1W7Glf3334T9r3O7tsc3vft7UrJk5MFzqvacZ6dW9QA74mog4KYX2kmDS
         HmvRL6UCLE8pgUsrF+besV6pppMlHHg/tQCtavvugZbC39IUoHNCm+Ad2iDRdxwoXHp7
         c+iMXGdT7COLq03Ay1JDKRzEu334ho37DtRbDeaKwj89zoePATnOcyk0u5Cpdr6EgQ4F
         l04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956314; x=1702561114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAVV2qiEK5RCktShx/Q1QMv0e5n63Am5gtpRCSYF1Yc=;
        b=ocAb0uxE21iI3ZCsNAAgT8vEtQdEgTheLYhiN+MsHVgkozOyAX3Asdw23nuSbqOANn
         MUDxcmUY4tpg2piW4a9mtJ+KnUIS7ORTuy+ahcsw6iR/WQI8kgkqpIQ6x8NgEbQy+g2f
         duwCSOKFivbCmwk7elhhKWIhGm0UsJubNGqxG1lEUqoIOSw7NOLd8pFt4fRcxEgIQoig
         zsuMM/dIR8KQE9ENOXDvqFhqJ5LpFz+TlvxDFS54wbtz64wABmzYtkrkbswZbO/f6x4M
         fhf/4c66GTUzSamShErruD/xjShUpjutE4ZMVVJOcWdU9avrEXkOzI+bI/BhVdbsuuvh
         rHGw==
X-Gm-Message-State: AOJu0YzY/NXjlZZgw38Lj5KF7r72xz+NVB/kQdaToxro1uNAbHwH+ftr
	p1fovBFYSN6t25KNam4QgmZdqMb/uXbgkj+rBpGTCQ==
X-Google-Smtp-Source: AGHT+IEJUzzF+mqKM2cMqlMkgSJjy8gNx2I3xz0+xRFeMN9n4FIMMoQJYpoutX6EOtTJPaW4EAm6phj5PJecY/TvrDE=
X-Received: by 2002:a25:bc84:0:b0:db5:43e7:47b7 with SMTP id
 e4-20020a25bc84000000b00db543e747b7mr2249653ybk.48.1701956314164; Thu, 07 Dec
 2023 05:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20231201030547.11553-1-mengqi.zhang@mediatek.com>
In-Reply-To: <20231201030547.11553-1-mengqi.zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 7 Dec 2023 14:37:57 +0100
Message-ID: <CAPDyKFqhGULWp3P2EpxUMLvdiijqu7qxPrY40GU2m3FM7XVCVQ@mail.gmail.com>
Subject: Re: [v1,1/1] mmc: core: Add HS400es support in retune and
 initialization flow
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, yangyingliang@huawei.com, adrian.hunter@intel.com, 
	avri.altman@wdc.com, vincent.whitchurch@axis.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_053836_778940_D77B8377 
X-CRM114-Status: GOOD (  20.39  )
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

On Fri, 1 Dec 2023 at 04:06, Mengqi Zhang <mengqi.zhang@mediatek.com> wrote:
>
> In HS400es mode, when we enter mmc_retune(), we will be forced to
> the HS400 mode instead of HS400es mode. So we decided to add support
> for HS400es in the mmc_retune() process.

Hmm, I was under the impression that we really don't need to do
re-tuning at all, when using HS400es mode.

Are we calling mmc_retune_enable() from a place that we shouldn't?

>
> Additionally, during the initialization to the HS400es stage, add
> hs400 tuning as an optional process.
>
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>

Kind regards
Uffe

> ---
>  drivers/mmc/core/host.c | 11 ++++++++++-
>  drivers/mmc/core/mmc.c  | 10 +++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 096093f7be00..4bddbbb3d539 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -179,7 +179,7 @@ EXPORT_SYMBOL(mmc_retune_release);
>  int mmc_retune(struct mmc_host *host)
>  {
>         bool return_to_hs400 = false;
> -       int err;
> +       int err = 0;
>
>         if (host->retune_now)
>                 host->retune_now = 0;
> @@ -194,6 +194,15 @@ int mmc_retune(struct mmc_host *host)
>         host->doing_retune = 1;
>
>         if (host->ios.timing == MMC_TIMING_MMC_HS400) {
> +               if (host->ios.enhanced_strobe) {
> +                       if (host->ops->execute_hs400_tuning) {
> +                               mmc_retune_disable(host);
> +                               err = host->ops->execute_hs400_tuning(host, host->card);
> +                               mmc_retune_enable(host);
> +                       }
> +                       goto out;
> +               }
> +
>                 err = mmc_hs400_to_hs200(host->card);
>                 if (err)
>                         goto out;
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 705942edacc6..9760eea2c104 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1823,7 +1823,15 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
>                 if (err)
>                         goto free_card;
>
> -       } else if (!mmc_card_hs400es(card)) {
> +       } else if (mmc_card_hs400es(card)) {
> +               if (host->ops->execute_hs400_tuning) {
> +                       mmc_retune_disable(host);
> +                       err = host->ops->execute_hs400_tuning(host, card);
> +                       mmc_retune_enable(host);
> +                       if (err)
> +                               goto free_card;
> +               }
> +       } else {
>                 /* Select the desired bus width optionally */
>                 err = mmc_select_bus_width(card);
>                 if (err > 0 && mmc_card_hs(card)) {
> --
> 2.25.1
>

