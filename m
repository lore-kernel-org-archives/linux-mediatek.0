Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B3910A3D81
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=; b=s4WdcWO+AhaFdrrFDqZtWdEsSb
	Az2cPv9HNNaBqLjqSkgzEGYqEjL4KsBEODK1cgRPMgYIBYsD2NPUpdW578dWEhw92MDPpvRu+UuZI
	N6ULIvNYXYj0xgkZ2rgNmeCHwbVMVZZazM7Fe9CUcyMZA5lzT87kCbzSjqS8DvcNLO7q6etUWkJl9
	nivDsT5uOnjJEIIhM8uMNxwwKW9BALaCzIYSLGnj+UnEUYWEnGR7J4fYQfzw3jOZgzqwa1sNc9LLU
	XguY2b8uFeKu345qgmamQalqMkz9sAFXS9wIkPfTHnxLl4/nZDUcg6wEaumTEzChoWZbPCIs4UQBo
	YarczubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jvP-00000005SEX-0WsC;
	Thu, 26 Mar 2026 12:34:59 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jvL-00000005SCz-1xKN
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 12:34:56 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so1055403e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 05:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528494; cv=none;
        d=google.com; s=arc-20240605;
        b=F4cpYLF4qaQieOOl0yDQXStaIBTVdm3sODSx/SQHi1C/XZsz045t8oUakW9Q/7zvF/
         azh24Bn2KANxWwh/mbRXaXyXTc+EM03/XgWTwRaby0qcgIKmdnkatUPRzpn4gmnMbZu6
         +mW85PyN27p5hubNzrdh5frF7dOJdklruwDEWeWmyzQ9C3OU+tUMEtFAOeBqWxQqhruz
         xsnbuBNZ84HZ4SA6n7s/gJSFD2haL6xqtSyja1rzsIxJYXuGPPn4l+h2XoEC4U4gslG4
         ZoRqSW5FBauzsHaDVjU22MqJnl/LHQvmydAIoWpSFzcFSf8TZIEHQXTKu0HOgUbTFjdn
         Zs7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=;
        fh=ZxgxuI10KDhl4uhTLM0lV2XxjI6oe6/CT22VqKqQzUI=;
        b=lyHCe2M9YkxL28x/U+OQNsMqb0dwumU/DkwuRYJUUHbm76rOEdfxwwdvpWKCddtd2L
         fzYRd374mTfmwVaaFriMdoaEf3JqlR5OCU+wm722q9ypu8ul2eFQV50F/P3xXO+5tjT3
         51qF8jiW3cDhZGhkEKPt00GRmww+UmHf01c/x/ZRqxksWi3L2m//HaYBC7t+ykL/7pfg
         xr5QEwlfogoRVrDG+jt9MSR6gRTZurKIeWtY38pbvXw0iSqq/O8n1X6wWtILiqAdYt/O
         RTEbVCE9xRTpdQl4CCQfg00JlZ5eKWJQFsFszp+CRMLXCzRntgs0yxEqNSwiPwnIiuxq
         2F1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528494; x=1775133294; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=;
        b=l0FTWJ6c74bU4Bdc0QVkVMzP6cZQkipi6v2qy0J6csKot6JyuQK+Olld3CWwY92b/c
         xkNO4zlgBXhBT0rmLsZDxMSYHlSsJlu68xXa/A7MKOkiVsV1HNzrpTGaqCVWuWsf2/Ni
         3sXU+RrvN5aDrwmtWIkTuveQ9LABt+aRahXVWE0+T9ciylqP5I/SK+zGoUUnxYq2MK/c
         7f0ctv513+Q8oHqRECgGG9ri8CzbyBYlt95qT8rQQplL4XjiNQ5eGbLpIi2WtVFfY2mM
         oLKTbrMQFYGbNDa4r8rcBF4uv7DFACXAjnMkx+VgrgosbS2mpdzeHYxzQN+fnhSaEPd7
         GmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528494; x=1775133294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=;
        b=iSO8NigbqFisc1clIUiUk3xOsSJt6J9mK4zn0+oEAw6wSlGDbHXE6AJr2OqewQJJaZ
         yhMC3B8/cbResL9IGKv+3KzVg+3Gql2ij4BW+SLl370Op9mNsOmbSlE79ZH+JOgG80i1
         qsru91in6gPYk6x2jGQ1n48Shz6unqitHWyOGccsL9PqltXJn4X6MvcwEWBY31kZc91u
         JXW1qiWLCgr7axfEeEpes37O6RDKmnJWMQzTRxwYW5z02nd3rSINAyFbqBSrnCayCSBh
         c+wTTE0R4OoBjA6jrMANg0P78Op8GbW7Hyr3PpcHeBceW+NjEPn8jW4G9wewYE5rjlNC
         YVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVx2+oJ+ezpHDwSPxb/aDYb9SGxgNlxZFVJ6DCFt93VTTLbldU3TzaKrFZL+621uGkakFzETlPJiRfSAXvrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLRJXZpqaDWbXnXoNvn+aGsY5ULVYkXnJjcK5vYk8m2xdgwrbw
	zw+GePvFVieV5/+bQFN4gGsSmWClar4DH9X4o82IFXnfW7zIgDrsTCggV1S+nCXxX0ZuNlDsmx2
	adjcK1X0qEoeKLVWIsvDomuajSuQriRYEVmd6UcjYHg==
X-Gm-Gg: ATEYQzxOQIuIoorQZBcQcQzmMpBxAxSsnZGEG5fgrVRYXMNw4rtQyJh8hlKqqimZMxn
	RSu+UR9E89tDIm00+B66sqjyT6hj0s6QFxYBAMzMC6kmL+diFaDDVzLR4qBrBGZ1uDJhUtQ06+4
	c6/v/M8DAWun2I1q1/LWhvWjxJeJGVBbc0yVsx/GjBXk3E9k0p8xUcWy6ZbbJg0TAifDi7i4MKL
	d/OM7yKBqEQ8o7qyGPaY9h5jnhV0AEmYYdtjkY4NzHvmjciNOZahPFdxl/kH/X+WLf/rEeMM79R
	25j5O8E=
X-Received: by 2002:a05:6512:3e0c:b0:5a1:43f3:764a with SMTP id
 2adb3069b0e04-5a29b979b0amr2997503e87.5.1774528493504; Thu, 26 Mar 2026
 05:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260326030759.8107-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20260326030759.8107-1-ot_cathy.xu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:34:16 +0100
X-Gm-Features: AQROBzAUMJTYzzyeSawXUe9OdLfBc-C70N5GR1BByMjzhb7eLn_1dlJggBGZnww
Message-ID: <CAPDyKFoemi7Ss8706XVUCu6L64CUgcdGQNe9jBFSxaOPp2umEQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] mmc: mtk-sd: disable new_tx/rx and modify related
 settings for mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mengqi Zhang <Mengqi.Zhang@mediatek.com>, 
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Andy-ld Lu <Andy-ld.Lu@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>, Yong Mao <yong.mao@mediatek.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053455_527508_73A1941F 
X-CRM114-Status: GOOD (  15.97  )
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

On Thu, 26 Mar 2026 at 04:08, Cathy Xu <ot_cathy.xu@mediatek.com> wrote:
>
> Disable new_tx/rx to avoid data transmission instability, and adjust
> .data_tune, .stop_dly_sel, and .pop_en_cnt to fit the overall
> configuration after disabling new_tx/rx, making it more compatible
> with mt8189.
>
> Fixes: 846a3a2fdff5 ("mmc: mtk-sd: add support for MT8189 SoC")
> Cc: stable@vger.kernel.org
> Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Applied for fixes and by dropping the stable-tag as it's superfluous
in this case. Thanks!

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

