Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE70CFD2F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=; b=PNTcxa40ILKYz1CZc6BelFCcfQ
	o22RU7IR0+x9n8vdhyxUKFhAqMc/xJkgYHG5/yBu5kFgE+19oueiHZuu70oN5EBHDF/jYPGaad2Pa
	Qg1BdSYmliKcaBb52hDhdq+fdPij/70Kv0oacEd35rI2zN8bWlS0XbQJiFPKZ3YKhmPFRsPikKWb6
	dUdeOnU++Vd1G+Jo3YzKMfs+/WTZHt9/cIMczGvA11POFBh737l4exIm1jU1oHq6xnzYIumbMf/bF
	qxw1dxE1shIpeIfxAOCFXLEg1E1DiG1z9yp9uz+R7xUM2EdYxHsbOSOidqMXjeZC/vPyhs4J0mWYR
	m29NQJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQR93-00000005URw-0Z86;
	Tue, 02 Dec 2025 14:14:21 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQR90-00000005URT-2Tp7
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Dec 2025 14:14:19 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c75a5cb752so3306226a34.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 06:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684857; x=1765289657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=;
        b=j09pO+qyye3spnfzQBTjDKENkERXhXwObPl9qTdE4qjALPrKCN2QDbPsic2tqV567H
         ZW2x8sUiwA2XnkW6KGNCF8lfy0wJ54pTPp99nw7KzwcjWl4l/IqLnK/gqLzJHVzVd/PI
         hozLkIMVYukgVvllQoLu4qEaoifUprUBNd8t/zRHmhrzFoE8Q1qLG9o3CktlJ0mFc9rP
         noWxNDKyBMq1+KgYN4IWC3w5uWTtmTegRbkRwHO6opZycV1gMf0vhntNNM4o1ItlQggw
         Xe1Dw/vPG1G1cA5HT213Rn9vmXUzLua9xY8pwkjf1yLL+hfn5SCqHhCAtBfmz91l54KR
         ycrw==
X-Forwarded-Encrypted: i=1; AJvYcCVkzSlqjbf3vzAaodh39BAWIAf0wppSHF/swUz6aoR0ECOgZxaqWWaaeJSshqMqe77AeWOSJiv/aKJ22BvyMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN+C8VR1GHeMnt5Pa76aFMIHA55jh/SiUFcJ/gH0JQ67kPkdli
	8neaIwS8Ft9+cfiMz8FvAlGIKCJBa2NrNsutFCb6VsmGLuhHbxYnEQXjY6QoLKw0
X-Gm-Gg: ASbGnctSvKNj8TTlSHtskNemNQajKV0GQE5fVqOeC/poVCB1S0aI+JBX8oTCuyfDZrn
	axvV6hUL8BkX0ASAE1CmbQQCv/lUIOEAZ4d2K3jnCmZNYYZ3mHOjf4dob88kV84wPyyD35mk+1W
	fatE/UIJHqeIZZ91Mptyslf1eSGoGvrVxRlbkdvwX5H3MD8aZcKJMkTYh4jIF/PZ9jG67xaHUdD
	mAl4a6B5/X31OLk/rblj4+jo4hxINn6SQPsF1Bm0pSAtEFSb9P6YdiHk2l0bYYT5vX6QcCKaBBn
	c0u9b+/iDbsVZHrhx9au2DqewAwkodPwMw4Ly3BO2h5TQhBnOEG+UYMxi/d9+jWH4+6n50c+9vy
	gfvvnJcNZ+X7Zv1Aruk/jAi9pgPFsxjDqJ8GXirGiIuEgpBTL7jGRQd+HldHIBpIrkD3ISpvKdc
	zU4iFKgkUs2kOKs/PurZ9qXGN7Wi8YXPpOX20KtSLpeIgRg5xJkmZm
X-Google-Smtp-Source: AGHT+IGIk6zAs0aECaPeSTTVm84Cp/y7rNaepr8eFuvfl8mtc342StWeOUK4BMr4gByzFearMm3cgQ==
X-Received: by 2002:a05:6830:82c5:b0:7c7:2c3c:690e with SMTP id 46e09a7af769-7c798d552admr16720118a34.35.1764684857374;
        Tue, 02 Dec 2025 06:14:17 -0800 (PST)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90f5fec7fsm6603089a34.11.2025.12.02.06.14.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:14:17 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-44ffaeda17fso2195329b6e.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 06:14:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrqKjk4roqi+XjhkhU8EChX5n99xGsM12Pjnbmjz4GL4H6f3bS6Y/3IsbK0v+rcntITi3ZrsDsNTTuV8n2Qw==@lists.infradead.org
X-Received: by 2002:a53:dd48:0:b0:63e:17d8:d977 with SMTP id
 956f58d0204a3-64302abbb9cmr22209916d50.41.1764684434875; Tue, 02 Dec 2025
 06:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnQtK_C28o8ts-DX6QMHSfgR5FWBqGmuyp3cjxdu41cx4XkoPs5W_lQhYE
Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
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
X-CRM114-CacheID: sfid-20251202_061418_632274_68BFDC34 
X-CRM114-Status: GOOD (  31.24  )
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

Hi Krzysztof,

Thanks for your patch, which is now commit 4a93adcbd201aad5
("of: Add wrappers to match root node with OF device ID tables")
in dt-rh/for-next.

On Wed, 12 Nov 2025 at 11:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
>
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
>
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>    of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>    associated driver data for found compatible.

Shouldn't the first function be called of_match_machine(), and return
a const struct of_device_id *, cfr. of_match_device()?

>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_device_match - Test root of device tree against a of_device_id array
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns true if the root node has any of the given compatible values in its
> + * compatible property.
> + */
> +bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +       struct device_node *root;
> +       const struct of_device_id *match = NULL;
> +
> +       root = of_find_node_by_path("/");
> +       if (root) {
> +               match = of_match_node(matches, root);
> +               of_node_put(root);
> +       }
> +
> +       return match != NULL;
> +}
> +EXPORT_SYMBOL(of_machine_device_match);
> +
> +/**
> + * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns data associated with matched entry or NULL
> + */
> +const void *of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root = of_find_node_by_path("/");
> +       if (!root)
> +               return NULL;
> +
> +       match = of_match_node(matches, root);
> +       of_node_put(root);
> +
> +       if (!match)
> +               return NULL;
> +
> +       return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);

These two functions are very similar, but look different.  If the
former would return a pointer instead of a bool, the latter could be
built on top.

Even if you still prefer returning a bool, they could share a common
private helper returning a pointer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

