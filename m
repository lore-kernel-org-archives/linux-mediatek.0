Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78D7CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=; b=MQKhy8BH6WEOr3hjTdPsriXTCE
	EiIgeerZWIQ+vQnJTBnBmk5ayRZUj+CGngm9tKRhmWE/fT/kPPDHGyqrv3Wv0qb1eU2fw4GBU9PFY
	0HFV1gvDhaEeGOEkNJgszCWqiDaH98U6E9FNYbBRDWa+ixJ9Glp0zwCWg5oCj0i5IcIbjdEyRANMQ
	tLxOW6y+ZrwgGqVT0f6Z5X/mOY0A7CL2ISOGvHmQwlpNoBOs9LKl4nsRXy4iV9C3W5Lwlgt3OQFmL
	5t3b6/cdDrFVEVGjT54pzgE17p6aI+c2VMuUgHjCQ1xQzl6sPMOuHM3oEhUwbrVwzUtQ+Zw9yUqQ0
	UcxkUTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQvy-00000005Ovg-2dpC;
	Mon, 10 Nov 2025 12:23:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQvw-00000005Oub-1IAB
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 12:23:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso5014913a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 04:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762777422; x=1763382222; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=;
        b=NHCCTgLdfUEQtPcSu0r6QMmiabBaBPaYEJE+2tYVbf8FQQSHw7iKzfdgnoS/uADUJz
         hdSPv690Foq4L1AXYAbS8lKDum5uDaWy0RtZ5WA0jerjF7HYjKWR27fq8G+T0tPM3Oue
         5CMQ1HXZhR1hTj08U+btVZ3vAInJ40MWI3fiW8TXzT8YCYOW1DGZLxyuT2yLnyBthY+0
         ztF5fJVBF3DqWF4tt5HVPPrReL7XVmnJxqh/xsTk1v7drqY0g8CT9vA5md5VWZulrKo8
         HZIpCpTUZABZR9KItlifymd9k3tBCoH6b/ni+tWKOX+W3LR4mztR0wZdDOiFplTJC6A5
         poFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777422; x=1763382222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=;
        b=nxpTeSJn2Dfam7Eru0xhVAmdiyL31WK6AIfe4Zl5a64BL/UmhsyeF7Wq15vZtS4gfS
         lE3uTqWIElUOC1YgSy7/gCnGwoTm+h2QRpVF8CR9xPsnS7AodtMbk0ZxYJIlh7yj8Nb0
         aAJarxm/IplalCPv9YG5fnY34/QoRxFaQTpSrjQWjKZHT5y1l2EumiKUfXpvwmupsxHa
         kNQzaoG28zKurhypnHzqC0749ABvn+TSUC/ghclMPmXOsjkP0cCPQtjLSjJ2+zTQsT5t
         WAN/UjCPKx4bMHj+3nVmKUaKFQDiLSfa7A3XxnRL9RG7DSIU2tcV4Vbwb66dc7A88FfM
         vT+w==
X-Forwarded-Encrypted: i=1; AJvYcCWmG9DZI727u6zvMKl2tVgEoBEkAInu//U1fXw/zajol+ju61iSPprlln7C4dL9ONtg1+a+sCv7bCydKiHhbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh+0EjmtSdYEqAZpliYRLnQ55AAKl7+iBTY0KsP62AkCE4Ys51
	vdHvfgShJLMOshqlmQU5NKqx//s3bdiIeRy03/7oKbavgX9oM67nEjxV/EB9qAnwxJdvOqTFDBm
	AkZYetC/EoVB05ZecWEUd5TnXvjC+lAsiW5VLIS80NQ==
X-Gm-Gg: ASbGncuOp0A5IdjlsCgaZteP0VFf3jaGPk3yy+YT38tCPopZ1AvlxvvVn3mQWWAc1/r
	hNR9kAUBjlIl8cLHVZ6xgEYmYySZJJ7EUsN+K/jysElkHi+5JKYtcrbQZIVdoWmOqfnzkzS2p/t
	yL3qLiY5pNs8staNsu5TtIXllqY73uBQA9BfjsLm2LR44fzfvOreWy1CoJkl6lyIna5iKE3cR/M
	dCt2L0nMUdZ9FAnAMa6/NP5n+KJfJsyeRQdAc5N2KD9C3LVmyIFCAha+IIb8ei7uOCQD5RDStWA
	hPsrNak=
X-Google-Smtp-Source: AGHT+IGm5+Uu79ujlZItIA42GflK7UfV+AyBRUd53fOR/2PdZlplGxgc5r7/bRr9gNtqR7fwtBSp/+VdEs2VA7Pi6Oc=
X-Received: by 2002:a05:6402:305c:10b0:640:c454:e8 with SMTP id
 4fb4d7f45d1cf-6415e7fd2c9mr4878827a12.30.1762777421528; Mon, 10 Nov 2025
 04:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
In-Reply-To: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Nov 2025 13:23:03 +0100
X-Gm-Features: AWmQ_bnh8tp1oLAuPElgvSFmN8WE23c2ga9LAvFWkFMPaVp1NApY8JmtQI4OamU
Message-ID: <CAPDyKFoq=dJW_FCVykBwH85+RbeZ-SR6=vF0vKw+237TsgOfDA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: convert from clk round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_042344_354210_CACD9F7F 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, 7 Nov 2025 at 00:40, Brian Masney <bmasney@redhat.com> wrote:
>
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's convert this driver so that
> round_rate() can be removed from the clk core.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> index af20111067c02a5f9a0d6d751e9e0dc32c1a4d90..9bad577b3ae4bf1b83d4f782bb52f56f779a8974 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -309,11 +309,11 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct clk_hw *hw,
>         return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
>  }
>
> -static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
> -                              unsigned long *parent_rate)
> +static int mtk_mfg_determine_rate(struct clk_hw *hw,
> +                                 struct clk_rate_request *req)
>  {
>         /*
> -        * The round_rate callback needs to be implemented to avoid returning
> +        * The determine_rate callback needs to be implemented to avoid returning
>          * the current clock frequency, rather than something even remotely
>          * close to the frequency that was asked for.
>          *
> @@ -325,7 +325,7 @@ static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
>          * high current frequency, breaking the powersave governor in the process.
>          */
>
> -       return rate;
> +       return 0;
>  }
>
>  static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
> @@ -338,12 +338,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
>
>  static const struct clk_ops mtk_mfg_clk_gpu_ops = {
>         .recalc_rate = mtk_mfg_recalc_rate_gpu,
> -       .round_rate = mtk_mfg_round_rate,
> +       .determine_rate = mtk_mfg_determine_rate,
>  };
>
>  static const struct clk_ops mtk_mfg_clk_stack_ops = {
>         .recalc_rate = mtk_mfg_recalc_rate_stack,
> -       .round_rate = mtk_mfg_round_rate,
> +       .determine_rate = mtk_mfg_determine_rate,
>  };
>
>  static const struct clk_init_data mtk_mfg_clk_gpu_init = {
>
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251106-clk-pmdomain-mediatek-round-rate-649a9bf7d30a
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>

