Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A25EE9D3E1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Feb 2026 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=; b=s+Yr4pvP7lYxN8LSjPIoraPGg9
	cJ2yatS2gAlMzn7QvRIrBr3D7DygZ/2mdt67BWaVQl4SsTIFQs1sJD6Al2KXNz9kumzAxxZ0aNHyK
	bibI7NCmQIdpIaME7MRQ5KdM/qV9oOknjqy6Lou6ltgfoanilnrSwz5ulVe9ePayfYTTLc6hUJTTQ
	n1WD5k732O8UJAz8RjtnBsXdlU0UzJCfPaCGhwmv/UxESRKhSBiMxmo3YJ8TuN5g25MXQYWX394Jf
	vxB+gsvjHyWows7z3YMXZ5JtOcGZjlozzYZtJ5sS7o/3W7Kpn8hxbd7EWcjr9+H94yexe8hYpDPDv
	krR1E9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndyq-00000008bAX-3bfC;
	Wed, 04 Feb 2026 14:35:44 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndyl-00000008b9i-3EHU
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Feb 2026 14:35:43 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-649db2b6cdcso1166575d50.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Feb 2026 06:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770215738; cv=none;
        d=google.com; s=arc-20240605;
        b=MsvdtH7CAvCa7eTZGtYJD33G6HdDcsDDwr81XqvI9nl19hC74WPekL6BJaXI6mFX5p
         eS3sCrWFoiCzKJq6gdlBcJb8aFcBt9UClKgrRH3CKwKigeR1rMLic7j+UdapKwdnpgjQ
         j5wGc14YzxMzpJh8tsA1rf9HMlMTxR1sAd/K8nMeW2+UtB97AG/0wMu3FLBXJ+SrGxBX
         keEPHLiVtrHhuuTlMg01hQJN/fkjDOGMCS//aJVg71VwYwZ02brQ7ryV9NX4QynX5K6I
         1RmzhN2jWPmEvZVQ3ngpneiqbhjSrglemri9KTh/3IlSpKnznDW0eUQl6M72HU78Zaf2
         0sDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=;
        fh=0edjjVS2ZQlyLyUJKOYCXYmHfmLFOpvn/XGZ9j9TN68=;
        b=ju02r+exjNyxpej+G8dmyp3SfVwytjTaFi5LK8LcCNMRZ17zL5GL1uG6ZhVG849Pta
         60ze/R6whx7r2xvx+E8gciEe9yMRrEwyAnX2DbYt9TvABX12d8rurZxnockrF4Rmii/l
         q39fidiRG2aIQ4QJ/EOiZAviA1GYWdkRsRTGN2/l+QraGAu3fWT07TBN/v/QKkPmEIvZ
         2ZBANKyU6oq9i6XPsN5q5DkzmwezTNQCqZ6IqVI65JrvDhwXP2E5qkwufp7nZw9ZYpgP
         nr5gMUdDc1+bTgpmn+emQ/ZaDdOpusWK537x/oTyX2YN4kaEhBAAng5geZ7MexsOsSQi
         Gncw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770215738; x=1770820538; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=;
        b=cy36cYUMRUf1ecS4DWP3FeSm9OGPvgtbIE3bHeXr4mILQV2ix+dU10i1gCCM9l8IbB
         lEq2Tl826yMKuXd8InQQ1hMUaVf6yj48rYv1nDx93bYUymqfwR3zkdaIdSqmLj1n+mgF
         WKthG1xOs3OWi0LmfUX+FTjVj3eDnQuj/scJpZlBDqocekAKXEy46eYblccSL8N0Arwe
         K693/MLPp7ol/HxmZBHHzauXpxjqF9X/cHK2yodhtm0XL2y/WUmoUHfNILeq2qeY5w4P
         NgLV8YqcK6v53WXcy5CN//cEqM120c/CPNaXbX4xf9sYI8ZdvGQM1VzwQaVCubW5qyFu
         9NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215738; x=1770820538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=;
        b=obt9Qu5WXwp63Y1FbiV8+ZRL+ZvF5ALm4BdKJzDlXbdoWAIqLxYyBI3QAc1jKRxrgP
         hwb6iSjUa8cZsOiKVwrVxrkPSQFt+phClCiUBJ12sOQFjldoElhyb0tzHQOgK7HH9vBT
         VszEBR6hGjixonZMlgscJsQuyDo9QLuk6Oi3gbTyO19r3IqfKR6RM9Y8NLdo8MJKlMY/
         3cqrMFDuZFpnpk25v8BmvSrquffSCKBcN027EKQG3ZOW5ell/L8GGnFbCr4d93g0e6QR
         OB7C1XsGODNdsv5ZfuJD/QCRe78N/Qtci3CuGewOZ7VJwMkkQLsBeoeL+G627niNp85S
         3POA==
X-Forwarded-Encrypted: i=1; AJvYcCW/o3w1Xkp8zs5Hae9vTLGZt+BYK15051NST+Ft9RL4Njw8iGJBJtWWGxSla1awSVv8fC4yKtt1sNnH9IasJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAWnkNsi+Lh9LLf34WBBd2CgUJqQUK4oWOCPK3QcWd6uPAwp9I
	jzNkXEVBMC13qNVPVSsqnDQi2k4oJQQlQM2XsHc0UFdAd6+DqwF7oYFMupyZvtTKriXXzeR24rR
	Zq7OSHkQalem0Iq7hqwwR/BSHDfz4a2ohvbtXQgE7Uw==
X-Gm-Gg: AZuq6aKYp4eOwqsjytjyY2ea/IUR+/dX1KW9uJpskS8cTd3qjukN5RANMHdgtcgfLCy
	4txcMhY0BTVH8dryHSA3ttjbNePHsv7R0UJAMRjCBrb8M7eyJ7XmYnHgWl7dKr/f4tjqLHon8cN
	9ScQo+kKHBGGV4CrUCujc7zfJHuPASAb2bUB8GHr2Dj2HxyJ4ojI9mN9sJ9eeEVGjLEwV8BPEg9
	a1oRs0A1GEbKwuuw8NVRNW47h731Aa1wibsgcjgJPdncncYAv3QZgiy+fjH+gT7lCiOIEKko06/
	18IG+jE=
X-Received: by 2002:a53:c0d0:0:b0:649:d4ce:243f with SMTP id
 956f58d0204a3-649db33fb9cmr2174177d50.3.1770215738543; Wed, 04 Feb 2026
 06:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Feb 2026 15:35:00 +0100
X-Gm-Features: AZwV_QjKyxhBAxAWnQN3ZmPtmDSh2TTxzwvjZf3Uhrpoyqis27NsaHph3OPTLhw
Message-ID: <CAPDyKFrGgf1+vYVA6S1SJTZ8+n9WJo91e1VWeWq8p3RNHz1qtw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: disable new_tx/rx and modify related
 settings for mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mengqi Zhang <Mengqi.Zhang@mediatek.com>, 
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Andy-ld Lu <Andy-ld.Lu@mediatek.com>, 
	Yong Mao <yong.mao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_063541_783777_FE9064BE 
X-CRM114-Status: GOOD (  14.68  )
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

On Wed, 4 Feb 2026 at 03:09, Cathy Xu <ot_cathy.xu@mediatek.com> wrote:
>
> Disable new_tx/rx and modify related settings helps avoid data
> transmission instability, and better compatibility for mt8189.
>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Should this have a fixes/stable tag?

Kind regards
Uffe

> ---
>  drivers/mmc/host/mtk-sd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 302ac8529c4f..b2680cc054bd 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -682,15 +682,15 @@ static const struct mtk_mmc_compatible mt8189_compat = {
>         .needs_top_base = true,
>         .pad_tune_reg = MSDC_PAD_TUNE0,
>         .async_fifo = true,
> -       .data_tune = true,
> +       .data_tune = false,
>         .busy_check = true,
>         .stop_clk_fix = true,
> -       .stop_dly_sel = 1,
> -       .pop_en_cnt = 2,
> +       .stop_dly_sel = 3,
> +       .pop_en_cnt = 8,
>         .enhance_rx = true,
>         .support_64g = true,
> -       .support_new_tx = true,
> -       .support_new_rx = true,
> +       .support_new_tx = false,
> +       .support_new_rx = false,
>         .support_spm_res_release = true,
>  };
>
> --
> 2.45.2
>

