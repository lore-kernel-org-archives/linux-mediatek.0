Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C79AC7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIuHokypvWm/IYbI4WWTbZbJNrdYy9622yc37Rs0HcY=; b=bsZCKBFeKYGDyoD8bCNn4VD4vL
	AnW1GwUdHS4JKQ68PQp6FsBHnxn5SwLnKlRoUgENxzWfXhHqQGQvGk9uKy7K0OyTQkvMD8pYnALij
	aMRn1uMZd+7eQ0Yz5Og8yupGfy4BaXWhJLlagqDBgQQvRsCsgxUYOckXX+wRrGN0tmyzuEDJThHTq
	GQj7Qz2kcKo2cnSRYHyyVLkYZuJg+tGv1a7qv9xnhhgcu2cG+/eN8MpHoG47UdSqA3ujqmp1pFb3I
	as1U1L/aLjFzvnbMWIIfjT8f5+1Xex2ceDkaCf9o6jB0bRMZnJScWppI9SfDzJG+uJuTpY2Afp5/j
	Z2CnEuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJfN-002k7c-30;
	Tue, 09 May 2023 09:29:53 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJfL-002k6K-0f
	for linux-mediatek@lists.infradead.org;
	Tue, 09 May 2023 09:29:52 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b9a7c1b86e8so7236315276.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 May 2023 02:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683624588; x=1686216588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIuHokypvWm/IYbI4WWTbZbJNrdYy9622yc37Rs0HcY=;
        b=D9fDFwqsVuqVXdUmjfM20BJDxU0MKubgg7ROKoxXzbJKbbvYVl3ZqjVNH7TqqSDpO/
         NeV7IRmJtHQ8S8woeCTqU+k34DbDwTzLHRVpYyfwYln2WLkx4IFGKJ2FYT948a/d8Evb
         KWrYlIYmt1NUvXYJAAU3tWHofuZOK+1QuBm9cfiw3q7aVU8hzZxImVH1pYq9U+9aJIQ+
         5wazl1lybJjUgMTcO84ymoDQVg0ffm7ox9UKNd2NHAvDmcnsZ1zlFlCKofci8wIPQ6Xz
         m842mLMeYBXMvryFh2Np0oZgxpBf8aI9Y4xW/mOOfsYLxXU2ylu6LE6PRnsEEV1r75Ij
         42fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624588; x=1686216588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIuHokypvWm/IYbI4WWTbZbJNrdYy9622yc37Rs0HcY=;
        b=H83iUR5+pXjDXkOsM7WPm+7F8COeK8GBv4s7RKxyTkb3+Pr9W22gtl5LrY89A329PP
         mPoXLFrC7y7f65HSoHOlM36J+h8v0Pe0AtGx0w5HM8/b1hlRWck3UB/O06kQaXSN2u24
         H+V33KnDjklOy6XYTEhwuv5s0dFXO3XUWh+FN2prH8GZgX0zu0B1LoglK9mUxAIjGqdt
         mDWIoLKIUUYA0QfR4P7Du+48YrDy4KCezt8vrDA0Nph6SoSVzKsNTopLpOshqLR28jeV
         YmMCyx1guH6ercZlzx+5/XwWHXAp2lsBGiJ7ibUvBTvNmFxwlPxNNPBnpb3EGZH2Lphs
         O6YQ==
X-Gm-Message-State: AC+VfDzoAUNfdYNJtP2aZPHEtn93XIfXAEy+xeyf4kHXcebhLTgDV8Jw
	IJc+sVumhGhxRQ+BppwMTvAY49cU0cjMFkG2k8rpNQ==
X-Google-Smtp-Source: ACHHUZ71iTfkcXGJZvdKmvPuaTPkPvF22/hZesnDPRnZh7PA7OSLKjrHtHGb839UQSzfT9m9mHIG92NLR6Wn6pkkz4U=
X-Received: by 2002:a25:dc43:0:b0:b92:388e:d2f4 with SMTP id
 y64-20020a25dc43000000b00b92388ed2f4mr12985810ybe.24.1683624587954; Tue, 09
 May 2023 02:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230419063048.10516-1-wenbin.mei@mediatek.com>
In-Reply-To: <20230419063048.10516-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 May 2023 11:29:11 +0200
Message-ID: <CAPDyKFreikcPGVyhbrfU6LA+fATiA6M5M-5H6EhEHU3DbjkNVQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: reduce CIT for better performance
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_022951_243811_341DFF34 
X-CRM114-Status: GOOD (  18.99  )
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

On Wed, 19 Apr 2023 at 08:30, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> CQHCI_SSC1 indicates to CQE the polling period to use when using
> periodic SEND_QUEUE_STATUS(CMD13) polling.
> The default value is 0x1000, now change it to 0x40, which can
> improve the performance of some eMMC devices.

Rather than just providing hexadecimal numbers, would you mind
explaining a bit what it translates into?

For example, "the default value 0x1000 that corresponds to x ms...,
... lets' decrease it to 0x40 that corresponds to x ms".

Moreover, it would be nice to have a comment in the code too,
explaining what 0x40 translates into.

Other than this, this looks good to me.

Kind regards
Uffe

>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index edade0e54a0c..483353ea3a99 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2453,6 +2453,7 @@ static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
>  static void msdc_cqe_enable(struct mmc_host *mmc)
>  {
>         struct msdc_host *host = mmc_priv(mmc);
> +       struct cqhci_host *cq_host = mmc->cqe_private;
>
>         /* enable cmdq irq */
>         writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
> @@ -2462,6 +2463,8 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
>         msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
>         /* default read data timeout 1s */
>         msdc_set_timeout(host, 1000000000ULL, 0);
> +
> +       cqhci_writel(cq_host, 0x40, CQHCI_SSC1);
>  }
>
>  static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
> --
> 2.25.1
>

