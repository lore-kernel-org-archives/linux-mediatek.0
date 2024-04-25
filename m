Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD39FC10F15
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGU3DaKNSTtJ72BC/IE3k9ofyCHohc65XekJ83HHlQ0=; b=u0XXYiPvqcGewUHZ7bwEw624J6
	mRMkCzEWFIYW9hg26WxhqPPpyUWaKsBqc6Cuy82j8j+cscCMomzC4PpgDKiZ8D1pIpQUW30ceTWsO
	pf5mQVw/upjtRC4IkrvrdKafO2Ax5zQYyqQY+oxEDqQRh8IKW+b94eU0v8ldbKQg1uiHK6CoFGym5
	9M62199WNnJtW4Cytgms2+GAwtpPvIR+LL4OzRW4YoSMaOpNNfm4M4Q4/GCteGTiEQlyq+7q1eHxl
	89kL2D9yPQu4WOQN3ls/4WJ8S7mMIyVp0c/Mjbfdc2wxPSvpX4tZbqIbUSfptHkO98a71r68C0Pl9
	irHcNs7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvkR-00000007hDJ-0vKb;
	Thu, 25 Apr 2024 09:50:35 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvkO-00000007h6I-2qQx
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Apr 2024 09:50:34 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so655473276.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Apr 2024 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714038618; x=1714643418; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dGU3DaKNSTtJ72BC/IE3k9ofyCHohc65XekJ83HHlQ0=;
        b=uiT/6hlW+cDdfSlXNUQgkDu5qa9ld77Yj1USu/OP3jwsvkPidTtyk64210J8rc46q9
         8/UtiH8gkyw5PA3fyw92826TC0AYeiKq+alryTYwsm62gSTmh5+xqW5LA66UAzOVTFE8
         +vegE2p3QM2+2OD6y8PdV/vHhdyCnSHg9yDlkgNf/Xs+GSeWOrSA7iNaLLkkWpCACgxy
         ba/wH+SVo18OFzAHiJXyu+4sQB3eW4HrFf3P/St7KZuWJicIVmfqJ8S0lioPqO77pHao
         Nh6fHCYUig9IeNDhPyY/d5UujQwZKp8k5S+KYoFVCsmkkBgr/fZCsn/yf3pECsIF73Kr
         7eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714038618; x=1714643418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGU3DaKNSTtJ72BC/IE3k9ofyCHohc65XekJ83HHlQ0=;
        b=V9FmMcrgIVH1M0j/0vzHQJdQLVVnPbg21ImNKvhReUCCeEYYy3yymdvMK0CFBCvcDc
         yr5R3x8G5QZ2C3v4OecX0JJtQNait5IuFd14vQkqZzyKbR+2NVxrsPMQud1RN8rlXgUs
         P2e37dP1XVj0GEOT85xo+0ZZXuFwURDCni6HMS1jiyDhN+YZ1CuhTpe7BCUwTfQ/WdLt
         FRL/eaVa3ZNwrHTtcByWembbOGleJtJINFQd8D4GNITfihFWmhYTxho9T+pUmHTbasuC
         pyQOelprAm+xQ+ypeERuIM/BAowRon+zGyYBoxTtYNyjmCRqjNjsndN7NKCTh2iehtVA
         Qz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWR1S6J5LaVuJ8GG5ON5bo/f0dWaDxYmuJy2WB8DiOuFXgCitHOP5uXkqfSlsRndIDMV/hhyB2XJ+yAfSCyTagotoP0C+yQnaHletxYKmnFA8Z3
X-Gm-Message-State: AOJu0Ywix6q+T5LVjdlsg24B2Es5yZ2rOu7+Yt+/j0iSZqiXWazWAcmR
	viU7YRdeR166TaBFKRM1JQaEGvgYjOQV0WaOCpOQ4O+iQPzTbASjXwAqA5x4GuTjcCXPRJFmK3T
	702t2UjnloaYI2q/ghe2uC6p3kwwZPaHe0XFFDQ==
X-Google-Smtp-Source: AGHT+IEh1aNOcE1EWqa5SB+pPSQDM8zBDGimINTWTmIb3MThQkUvYyafMsUCxx/cLuE/UDnbuzzQ2SFF3eYiECqiOkI=
X-Received: by 2002:a05:6902:983:b0:dc6:d258:c694 with SMTP id
 bv3-20020a056902098300b00dc6d258c694mr1702289ybb.19.1714038618515; Thu, 25
 Apr 2024 02:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240408103824.11476-1-Joe.Zhou@mediatek.com>
In-Reply-To: <20240408103824.11476-1-Joe.Zhou@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Apr 2024 11:49:42 +0200
Message-ID: <CAPDyKFoB+r7KMdbV-svz9d=WdPm1Zvd6oZppzbsPDWqX7YN_Kw@mail.gmail.com>
Subject: Re: [PATCH] mmc: race condition between "sdcard hot plug out" and
 "system reboot"
To: "Joe.Zhou" <Joe.Zhou@mediatek.com>
Cc: linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	wsd_upstream@mediatek.com, "Peng . Zhou" <Peng.Zhou@mediatek.com>, 
	"Sophie . Wang" <Sophie.Wang@mediatek.com>, "Wey . Zhang" <Wey.Zhang@mediatek.com>, 
	"Yijian . Jia" <yijian.jia@mediatek.com>, "Sharp . Xia" <Sharp.Xia@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_025032_750765_B91663C3 
X-CRM114-Status: GOOD (  19.50  )
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

On Mon, 8 Apr 2024 at 12:38, Joe.Zhou <Joe.Zhou@mediatek.com> wrote:
>
> In mmc driver, a race condition may occur between "sdcard hot plug out" and "system reboot".
> How it happen?
>
> sdcard hot pulg out:                SyS_reboot:
> CPU0                               CPU1
> mmc_sd_detect()                    _mmc_sd_suspend
> {                                  {
>
> ......
> #Step1: detect SD card removed
> if (err) {                          ......
>     #Step2: host->card is NULL
>     mmc_sd_remove(host);
>                                     #Step3:_mmc_sd_suspend claimed host
>                                     mmc_claim_host(host);
>                                     #Step4: use host->card(NULL pointer)
>                                     if (mmc_card_suspended(host->card))
>                                     ......
>                                     }
>     mmc_claim_host(host);
>     mmc_detach_bus(host);
>  }
>  ......
>  }
> we can prevent it occuring by add claim for "host->card = NULL" and add "host->card" validity check in mmc_sd_suspend.
>
> Signed-off-by: Joe.Zhou <Joe.Zhou@mediatek.com>

Thanks for your patch!

Doesn't commit 66c915d09b94 ("mmc: core: Disable card detect during
shutdown") take care of this problem?

Kind regards
Uffe

> ---
>  drivers/mmc/core/sd.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index 1c8148cdda50..38c0b271283a 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -1593,7 +1593,9 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
>  static void mmc_sd_remove(struct mmc_host *host)
>  {
>         mmc_remove_card(host->card);
> +       mmc_claim_host(host);
>         host->card = NULL;
> +       mmc_release_host(host);
>  }
>
>  /*
> @@ -1702,18 +1704,19 @@ static int _mmc_sd_suspend(struct mmc_host *host)
>         int err = 0;
>
>         mmc_claim_host(host);
> +       if (host->card) {
> +               if (mmc_card_suspended(card))
> +                       goto out;
>
> -       if (mmc_card_suspended(card))
> -               goto out;
> -
> -       if (sd_can_poweroff_notify(card))
> -               err = sd_poweroff_notify(card);
> -       else if (!mmc_host_is_spi(host))
> -               err = mmc_deselect_cards(host);
> +               if (sd_can_poweroff_notify(card))
> +                       err = sd_poweroff_notify(card);
> +               else if (!mmc_host_is_spi(host))
> +                       err = mmc_deselect_cards(host);
>
> -       if (!err) {
> -               mmc_power_off(host);
> -               mmc_card_set_suspended(card);
> +               if (!err) {
> +                       mmc_power_off(host);
> +                       mmc_card_set_suspended(card);
> +               }
>         }
>
>  out:
> @@ -1729,7 +1732,7 @@ static int mmc_sd_suspend(struct mmc_host *host)
>         int err;
>
>         err = _mmc_sd_suspend(host);
> -       if (!err) {
> +       if (!err && host->card) {
>                 pm_runtime_disable(&host->card->dev);
>                 pm_runtime_set_suspended(&host->card->dev);
>         }
> --
> 2.18.0
>

