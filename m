Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C432EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ox22k/blPZorbdmBKbVSpwf4CVMwW9X85JPVkBQkDpk=; b=zhUr3+KgMOVQcE
	vgASCS3jgrGr1HxtLogOEXHwcW0BxRspWASmVN1E8gKqd6JPr2y3l7mPjHqrbiT4nj0Ap9+BZC2mG
	J7YNln+HP276UQ0/8pbwgpdjfBo+t6Q6dDenN69kBp4e9dTL3YsDlI/KR6qzRAg+5T+I4UolGA7n8
	9a5NGuZXscnHGRY5ckVSuygtjuXveP6xo9xDJtJyo4DKsTxEsepE0H5aSWYDD4o3aGQ0guBdvEAln
	URD5hp2XhCzx+LgAucdkzRB4IbUza8C6Jb/gXsQ0XnpU05yzlCrntkmJoerrITZhdu87Aochm5C4p
	/PdITLEb2OKWbUNaL+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNkx-00G5pB-Cb; Wed, 01 Jun 2022 12:47:23 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNkf-00G5gW-Fq
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 12:47:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id r8so1309158ljp.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JqDKJWJn3KR6F/t8EuCHiF1PKuDwpntQP0fkdEdQKws=;
        b=Fh6mGwxvUqrYxnGeAf6gRK0flNakrFnVg9b2xz1C0/zw54bfM+TF+jUKVOFwQNYRp+
         Fcvt5S3hwHMsigKcVt7+uHOLwQRDUSmE9mE/ZU+/wrEkc/M0SuU861PbAuNH8qb+T9E2
         MV7wlVsmnB6J5j3mAoKwYwuuDeOctq+f/Z0ws6OvbJIfDoWe56zcXxWcWFhs/9QMc9q8
         701JG9yzRYGhH3j5OoSroN5LU4zBLGWA2KYRMEMa0lnaKRhMDy9UOoZqpSOUDkeV4fI0
         Qb9Z5HA8xEgqxYfnH9kZ1b2VN2cJ2gTe00YFR07+KpDBiywxJo5UiXprOq+U/Q3Qt2ND
         v1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JqDKJWJn3KR6F/t8EuCHiF1PKuDwpntQP0fkdEdQKws=;
        b=CPN3NBVNHdCAmYMThaEnchQ/FFDVfsnHNzZ/vsIdHqnQDGyl7OmMZd+r5la/3RyUYs
         oGDNZLirxI4aY1NKg2ShT6AUWWIIbac8PprXcdnl3wEur37w2wbY629mIfEXQTpM3WIl
         I96kKhK41sSrDTlIMHXhCSoDDap6GAXctv0mLgQeITy6PMrSoM652l6PIecU8TuVxvRh
         DAv2L0XT4HQ+Xn0JwJS3VC4W1w6Kt9DYxfnICZ3UKn7n9D1K/Gkw38J8LKbixX2E1N3s
         XIaLxRIt0/3/sIJZKpIEljMyqZp8viufCn22frf/g+N8ZZQVsvdcNCpOpJxWJVtV0WpG
         tKjQ==
X-Gm-Message-State: AOAM531MvccL/1U0YpfgLhTo8cOjyKdkb72AAJTlEkd0KAWcxZpoQldE
	8TL6FQPtMp+mP5TcYocU4EW/WYYycaH8RdDnzng27Q==
X-Google-Smtp-Source: ABdhPJxJIs39WEUtGpVqKIIbRC1ZzEuJkg8hkJUTVxGDs/YlupuKseOHBIm/4fxNJmL142hY/6+4H6ajgpj9hkeXWnY=
X-Received: by 2002:a2e:a273:0:b0:253:e0e7:7948 with SMTP id
 k19-20020a2ea273000000b00253e0e77948mr33626186ljm.463.1654087621703; Wed, 01
 Jun 2022 05:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220530123857.692076-1-fparent@baylibre.com>
In-Reply-To: <20220530123857.692076-1-fparent@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Jun 2022 14:46:25 +0200
Message-ID: <CAPDyKFqNegBhdqc0URv27OLKMupXEMEU5c7-e4YasWsKGA0OQg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: fix typo
To: Fabien Parent <fparent@baylibre.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_054705_577536_3710AE48 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, 30 May 2022 at 14:39, Fabien Parent <fparent@baylibre.com> wrote:
>
> Fix a typo: Fianl -> Final.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Queued for v5.20 on the devel branch, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 195dc897188b..c7d196f805ec 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2318,7 +2318,7 @@ static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card
>         else
>                 val = readl(host->base + PAD_DS_TUNE);
>
> -       dev_info(host->dev, "Fianl PAD_DS_TUNE: 0x%x\n", val);
> +       dev_info(host->dev, "Final PAD_DS_TUNE: 0x%x\n", val);
>
>         return 0;
>
> --
> 2.36.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
