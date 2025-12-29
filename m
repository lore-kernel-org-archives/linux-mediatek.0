Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F00E8FDB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Dec 2025 10:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEHua9B0eiJ9krPOOGN9l1YijNcHX4oQExQFKvr6EFA=; b=3ZmqMRsMjZxN9AYV5lPNhtCF5a
	sja2/C/9JhbwYkj/yuwanb1X5COmyWTkqZSnbWHFQH4OCjHZqR8omgxXwzEehRZCx0MqgFEFHy7V8
	Gqii8xw6Z4DMpTT5yA+McXh4l/kT8s2l1y4tUD5PQCwZKhngjDPosyK27a17RPK+eE2JDVloPMFyj
	k5Y96jGwbmcZJRY4641vncfJdTeHtQbS1gxfKncnpYx8TXfiMT3Xb0n8RmxpiHa0N15ZuJw9QUR8V
	aI+P7bLjCIHADfn15pbu2HFPH5+Dvr7D58txSG9STIXKlVfDPeop9soHRnIzANUSkgEaT0Kf9f0LB
	0/nqw0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaARM-00000003ZOc-0RKs;
	Mon, 29 Dec 2025 10:25:28 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaARJ-00000003ZOB-30Fg
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Dec 2025 10:25:26 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5eb3c50c688so4845965137.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Dec 2025 02:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003924; x=1767608724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEHua9B0eiJ9krPOOGN9l1YijNcHX4oQExQFKvr6EFA=;
        b=XxBl8VN+MJFMqTMA/dU1uLuWfQeL1JkPecuYbJdvV800xQMhBnhsBJX6YNJpKOJbfb
         cY0Kq8DYGVEw855VJ3/O6jxh/NBgkfKi2FEYw9jgUBGvr01fDpo71vGGBQmdJI46ZAR9
         DUfCHMssEWyxpLm85pjucBl4wI+rl7Y37FglBfFxZhRnYOKx9wJ2ulj8EB6AbL/eELf+
         pEfwpixvWaQg3xk+n1cGfrXJcD/MvYqhxbJoIgNd04K4IZHeY8D2g5Sj1LMN8ZzIuyMp
         m9PKjsEZGB5ulGmNToIgE03g/xC2ENDorYFYujLwIvrN3/geM/5yP0aVdFZXuw3u84fh
         qdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2vvtgV5Zyyvn21viZnfRNEXpEbCoDRZQTCd8x3STp1ssDn4Q/wngfyeD1FERvZHnVFnATntgB76wB2a8wfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw/ZcB0XE9pxMYJ3ksJkNqAicgn/60YZ9F3YwxKsvbYlBFHCuI
	edrJMV+tyYpmj/4FG+Xg6NgF9NcK5r73U0qQiAYuivp2ft1xg55t0l8jqPPDmDGf
X-Gm-Gg: AY/fxX4q8ywj+7yCjSlqCulVgFVHuuxYGxb6hHMpDz1NkZI1k1yvAhI2862XamxJ9ut
	cp9hHS1oduVAFQ3+x/t0zE82EoV4eRGlE36FIrD39lj99zo7UwJhaaXocO/funhi3qYgQdHLjIf
	i+BXYRFyUBZJx8TqEXPBPYLtjKGm2RyHdRvMtfBE6YsUxydE79eZw8iZ7D+I0fYGLSTXOIG0HD2
	bHi24N3Qel+Bj7u8VGvjx5bT8tKYDhVy9gS6dDY8ksWChGhs5P2H+NRV7FpdIWxSTfvDiLVplOE
	6DeapEkzChakDPEtHkW7D71lZURAiqCI3LPqBbYY6amaWPB4eWnMvp8Muw0O1Qt840P5/DQhS3Z
	z/sb++KS4nc2Y+dMA34CewDuXYoizv0q31WtcxCvAILCLeZumNReqshc6eq9mN9kSoKMUw1dT0B
	KS9tLGoryNdLyCFZCkVG9PoWJ59d3VjNZaLljjEXk2Lox2FYMofgvzc0nZ5LiALJg=
X-Google-Smtp-Source: AGHT+IEbuughQ52Unxg/DflD4M+j8tWpyK6CnuwTO85Ka8PaOv4oTxQCeLKgaYruSaPs8/0O4Rvg0Q==
X-Received: by 2002:a05:6102:5689:b0:5db:d07c:21a8 with SMTP id ada2fe7eead31-5eb1a7d5994mr10626206137.25.1767003924264;
        Mon, 29 Dec 2025 02:25:24 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac8adb6sm9207405137.12.2025.12.29.02.25.24
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 02:25:24 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b6a642a4cso6212199e0c.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Dec 2025 02:25:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhqEJWWF2304I476eoDqnKf+aQb7BckORY7OhR6jYcCNsKZPOSPW4/zvC/iA20sl9BFNVwBN06n5PDERIazQ==@lists.infradead.org
X-Received: by 2002:a05:6122:d85:b0:557:ddc4:dea4 with SMTP id
 71dfb90a1353d-5615bd7150bmr9849393e0c.5.1767003543582; Mon, 29 Dec 2025
 02:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com> <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Dec 2025 11:18:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
X-Gm-Features: AQt7F2rKWfaXfoMj8qssy3Tj3BKKzf9SWfuNGXkoZ2xYV04eFqP8YoD995Ts3mk
Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_022525_759937_0A4EBC9A 
X-CRM114-Status: GOOD (  22.97  )
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

Hi Brian,

On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
in phy/next

> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
>         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
>  }
>
> -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                                  unsigned long *prate)
> +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> +                                     struct clk_rate_request *req)
>  {
>         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
>
> -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> +                                      div->table, 2, 0x0);

Is this correct?  divider_round_rate() can return a negative error code
(from divider_ro_determine_rate()), which is not handled here?

Looks like several other users of divider_round_rate() use this
same logic, and thus are affected, too.

> +
> +       return 0;
>  }
>
>  static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

