Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE62D116F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=; b=p6xk0qceBnhZg1KJdv811xt9wE
	M68yc9AjoBJKPdc2Ku8npt7o+q4NltDb7wKXf92dLiqPHwQEwFWuYU72Og7gSx18pHHFB49Bkpbxl
	q/+wJnr0lPPc4JBwY/lTqRrZRKpDBaIq6W+dsoNCjLZusWK9j68y1jbD4OisqDDbq2c8c3w5J0XvS
	G2XeqHKY13wyXq6hyO7hGQDq3vtQu+uVLMLIlls/kRy0P6tP/SNZUwUWxnvYDatN2dWSDb+vWwe2N
	EnB3BVPZDgW4RJtJj+fxvtNpamCB+Jo4NfH09JDU43jZP1mhj3BmMN2/tudB2aatGfM5axMB8Fkef
	QxYA8bXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQy9-00000005Tqh-0A9o;
	Tue, 02 Dec 2025 14:03:05 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQy5-00000005TqG-3Fwk
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Dec 2025 14:03:02 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so6721204b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 06:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684181; x=1765288981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=;
        b=u7Wwl/wuXxAcIbYFbjjSW5IUPkNmlJWTFdrzaFWW3XIYxImjpZEzHdfSWKU4g0+5Gm
         KjhERvLUSRqp47XuMhJAmcXCD5431ymuFoUmoI57E4l+vO764xHV6UC1yyD1dFwuW53+
         fyACPtC1PzqSj1FOSc6iRsCJ/ga2YcQp9qT108R76/mqh9hIJiDlkHNHPTBK6tjnxRHT
         ML7KgUtV5BbV0ak+zrD3TWFzvBUbxpDZ5bkLxs6OzFJP0AuXrFqbjx5sl3GGDCZGnG2W
         DTqU7Aryu4SQsEpaduO7i+sunk1TtfncvuRltW0FdujZlkwMQKQXKtmKRNeNAhoMeoMn
         6yug==
X-Forwarded-Encrypted: i=1; AJvYcCUAPReGQm2/8qPMAe5vlBk8i5IUTSnCA/GIVtG1QXTQIlVgmFLyUsQQ2J7qoPkf7Vy+X/OMbzSDaLiBVMdMFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoy9y8WzNC6jOoZ1M060ni7UdPzlpe2wlgBrHE1G1B4eP0g22f
	urXGS9oh8o4KTAZ3FwzkU04y4hgU1wAFJ3JFoBZ12n1CmMyeUDTPBBVd9dHeg0Pf
X-Gm-Gg: ASbGnctVP0+Rvb//pbdMry1DbhhIekxGQMg85iBvc1MkIMI9NX3MMxY23C2vYQlooMO
	V3VRiC0Rx8IWWrr8sKvpFvVQMzgLj3Y9UUXavufmjpNnbXfzPZ7cgDqwHSWz3MVlRxwquMo5vlG
	yPY8MkLxYfxP/DaikUhNOwbxSRdRafSK4dcpONtLMoe29BIkyPTx13cwFs7PYQAfpfpDdX3SVb5
	hARpwAMRwjtmLVUDHb1X9JHcMSITLpqdBJgUXfe6AZRu4YJ67G9fqPjJT7W9Bowb05LaWws/RlN
	FHTnt00KNu1XCLrMWMtg3uC59AxlYF2bcHEuCnMeX8GPKL64TxQwkiSgBc86MCK2oSyZFX55MMI
	sWMq7QmTeA8oDzUoe2koela5yShEYfMFfVP2fqAF6XaaskabUrcGiiEiG0PuKngj0lbMqlMxHeX
	ZjT9JzWG0azAKhTqWhybexKeGOgwWijRIDrEz6+IKgKZgJYsEx
X-Google-Smtp-Source: AGHT+IEgKcBrtLMUELCiZvsOg3XRklTdO1np9jOkuSgwaSISH7DTpMjaHuCxIs2MVjPe0HlPyGpzfA==
X-Received: by 2002:a05:6a00:3d47:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7c58c7a42b7mr41587392b3a.9.1764684178740;
        Tue, 02 Dec 2025 06:02:58 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f9260a4sm17133383b3a.58.2025.12.02.06.02.58
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:02:58 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so5535014a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 06:02:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzYpyYB7J41BJO4HWCBH0cg8CFC1DxhWZC48RYqVB1E25pGsMymF1/jgdeM0Xi/43yENvTWBQsOaZqSDSLyw==@lists.infradead.org
X-Received: by 2002:a05:6102:26c9:b0:5dd:89c1:eb77 with SMTP id
 ada2fe7eead31-5e1de39d9cemr17004298137.29.1764683823416; Tue, 02 Dec 2025
 05:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 14:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnP_BfEGwKLqJN8UevZeVXg10-IsXC-lVqCY3H9e2HFkqZ11liOD_Kw768
Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_060301_831649_C784DB28 
X-CRM114-Status: GOOD (  25.57  )
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

Hi Krzystof,

On Wed, 12 Nov 2025 at 11:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch, which is now commit 6ea891a6dd370ab2
("cpufreq: dt-platdev: Simplify with of_machine_get_match_data()")
in dt-rh/for-next.

> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
>
>  static int __init cpufreq_dt_platdev_init(void)
>  {
> -       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> -       const struct of_device_id *match;
> -       const void *data = NULL;
> +       const void *data;
>
> -       if (!np)
> -               return -ENODEV;
> -
> -       match = of_match_node(allowlist, np);
> -       if (match) {
> -               data = match->data;
> +       data = of_machine_get_match_data(allowlist);
> +       if (data)
>                 goto create_pdev;
> -       }

I think this is a change in behavior:
Before, the pdev was created immediately if the node's compatible
value is found in allowlist, regardless of the value of data (which
is always NULL, except on RK3399),
After, the pdev is created immediately if the node's compatible value
is found in allowlist, AND data is non-NULL.

>
> -       if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
> +       if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
>                 goto create_pdev;
>
>         return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

