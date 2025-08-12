Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29080CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=; b=0o0GpSM5HpN2560xvy6LU0EBhf
	9AtONEk3/AuHzjfB6/qrCYczTavvuI0FnL+QCe5RUMWas1xM92F1Ko8kpKcSOOb4FkoWd0iT6tUqH
	Muu6Uc5QAITf0WPXCjEDS7knN14jI1Uvm2f0Rbuf0WxzKGH4Dd1tBp2+kE59otg0L1edcZT753esm
	sQrOlAH4xPsRKrAlU+EF2I+AI15oW8D22TnNwfJ+qsMOqEPrYiNk2dA7Y3RkXvgweRu+nBH/YVU9y
	I683heD7XpkTeQzduOnDRsm3aTozeNpJbEsPo2LgiPnQpVTUgeS4iHPS8/uW1qx5jRUSYcQolNFCx
	Xhnaq/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIq-0000000AnKq-3AWk;
	Tue, 12 Aug 2025 12:40:32 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull8U-0000000ALzR-2OV1;
	Tue, 12 Aug 2025 09:17:39 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-433fa926c9eso3134380b6e.0;
        Tue, 12 Aug 2025 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990258; x=1755595058; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
        b=J/EnFQ0tAZ3Gbh75D96y9oZlKuzqhFAR3w9Oti+hzrOjCYzI9bs3t8tAWEGjc7C2CT
         ZoNfHusOKrz2Wd4NgClseT/dH1g8di6wPoeuSKq3YGsh3JT4qjN21DsZ1i7PfiflQhin
         VzweSuDzYiIpHcdkl3LkKNd1VpZtqs8Fe9pnilqdNK/VUkpVGiY6+MQCBVCgzF29u2kz
         3sAW5C2FHoDRTHZkSzt60dQyPcz8pYBt+Iyxbiii1bSdS91GvztDStQVTHj/3jRZ5xK4
         iUAi0tFemdixV/SNz34aHl9hjoQ6srDAf+hg1yoIKxiAbnX+ShzinT9lOg0fmLwEYU5e
         ZIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990258; x=1755595058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
        b=YCEWyEfY/uZS+i4N4L97N6wLqvLlJJCRX0vnzhK0jWMyq/MPgDgoZQIEzJ5kb6ILVu
         XDjo0AM9jSEGulQk9v5PxyidStrRFAqd6IeWgxwW4tqgWJSTHRMoLpGlPkfw4G6M7S8S
         o+9vueZ+l7nykVKwupMIY9o0LrJlmgDlos7sGCIsYNelDEDD5v/cXggCJtXpOed2ggR9
         cumuWYfqru4Te8jLNae9JQX8JgaQJaULHqRXBM2f/7dktYCLc7Akfo7Fa326x+ELapf9
         +sRo3MQmgAb6SIMVro5oc910rLSZCPajRFJXZJuG/DKKuGB2Ui53jz4FGHZ5mA6nvJug
         ORcg==
X-Forwarded-Encrypted: i=1; AJvYcCU8DFrcQ+aASdEIQ7l0+4BkiNSkmnjAXsTe80r5YAPdMSIlPf5FJoFiLTAHv24IOSASgVR/czaboszy7Jyc@lists.infradead.org, AJvYcCUW6IurOHOMz77Q/Se2M6GFNWdACr6rn0xscqzegMZof/t8ee+R5YisxI2WKz3xDryE+Z5DmSu3mujnBrs=@lists.infradead.org, AJvYcCWVWB7KvrO5XlS5Y6oOtWzyfxfkq+odrJuwU9UesDTE4mdHkiU5ls7/LbfYr7JxcHNZHEO8E5dnThze4pcPenU=@lists.infradead.org, AJvYcCWmT0/YJ0D3grFbS/B/dbLsrl8hMU11shq1qR9wGq/S1fwrP+pa5TBaSpodGbvQ6lqBGekg8lUKbK2nhEQESb4=@lists.infradead.org, AJvYcCX+0f3U0LPXPJlpjVuAcnLvwPlcfHxJbSDSqiallHwqRCIrpPADA/IQP2qRaxPjwhETod8/n311rwoYMN4uSpcvuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC09Cr2cU3pYB+Sfw5gITE13N2BfmJuhN+xh+OOuiJGwI6E1Uk
	qLGB6vnkJDinaM8Ia1uOnlg9jigE6XmyMPFqxEQd/Hr2qbTz38hy0qM1Xw9VOgC4qSDseUO2Ckg
	n1xKQKJgEtaNSVoSqbKUnil1rAHH+xgk=
X-Gm-Gg: ASbGncuWrjv0BIo782V2rocfumoMnkW0RrEuKdEaV7QdKmJ0tC9g3+1Eyp91RJ2Mbds
	/V+/K5zY6z/6de8TUDwiUepDEyi7Ibo9ghEG+boXCmm2/bdIGuswLPamdvkbw1AWH1L4eG05f45
	HuB/WgJJFmmmuOe2zCKskfo0IuPQbN4L1cLoSnbnESUZ5uNYw2vJztjt2RnLVDwH1iXuMxxdlGM
	2jsMMp7YAGIBUljnjE/+g==
X-Google-Smtp-Source: AGHT+IGeKg+1AsHT8OzWJRaAIn4nQ5un+51PPsEFZqXXG7zkpSAAOASU4iUV34U5Po600E/i/8biPwPW0aGpB8iXi3U=
X-Received: by 2002:a05:6808:30a4:b0:433:fd1b:73f3 with SMTP id
 5614622812f47-43597b3b9d0mr10072751b6e.5.1754990257436; Tue, 12 Aug 2025
 02:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:17:01 +0800
X-Gm-Features: Ac12FXwWvkLhtiiPhiHwQqmN1cgPTqDfCjN_x0Nmsu9rzni9NmKJK-aaPD6k1MI
Message-ID: <CAAfSe-spVF480JyBwxFN=KH82CdKNR0oY87oR6fsR+-CUH356Q@mail.gmail.com>
Subject: Re: [PATCH 053/114] clk: sprd: div: convert from round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021738_621616_604645AB 
X-CRM114-Status: GOOD (  21.35  )
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

On Mon, 11 Aug 2025 at 23:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
>
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/clk/sprd/div.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/div.c b/drivers/clk/sprd/div.c
> index 936782c241271832c0a1957c99cbecc287351d1b..013423881968002d29c4e9536e7cd7b944779196 100644
> --- a/drivers/clk/sprd/div.c
> +++ b/drivers/clk/sprd/div.c
> @@ -9,13 +9,16 @@
>
>  #include "div.h"
>
> -static long sprd_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *parent_rate)
> +static int sprd_div_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
>         struct sprd_div *cd = hw_to_sprd_div(hw);
>
> -       return divider_round_rate(&cd->common.hw, rate, parent_rate, NULL,
> -                                 cd->div.width, 0);
> +       req->rate = divider_round_rate(&cd->common.hw, req->rate,
> +                                      &req->best_parent_rate,
> +                                      NULL, cd->div.width, 0);
> +
> +       return 0;
>  }
>
>  unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
> @@ -75,7 +78,7 @@ static int sprd_div_set_rate(struct clk_hw *hw, unsigned long rate,
>
>  const struct clk_ops sprd_div_ops = {
>         .recalc_rate = sprd_div_recalc_rate,
> -       .round_rate = sprd_div_round_rate,
> +       .determine_rate = sprd_div_determine_rate,
>         .set_rate = sprd_div_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_div_ops);
>
> --
> 2.50.1
>
>

