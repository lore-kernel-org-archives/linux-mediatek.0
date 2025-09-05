Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E36CA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 05:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=; b=JeJqP3CgB96E3zp4wgESXQyMPm
	hFz/qz/DunEcSExi6HNmaP4OaSjVmYvMbjNqpnFG+IhoQ780LVJn5RGxAMEZU6QFIFK8NddtOTegH
	NphV2zS06X+QfaqussYE+bN2Ma9cB2A9qnffJcBeXxtkvkp8DzgT5uLPOAoOE9ixKnAytacwOyVum
	EPFWz2lHYuEppi/ljJMj7Iz0l01HvE9UMfsLeE+WjiQ0pk6GJEe6ECKQLOzeCo4CLrvM1aRARsBjA
	CKIn3AVq13mEvrVIETUKOCmftkHf73TuVt9jQrInaDGl8TK58zoKADNfixf/a56XgR0o6p4ik4bwK
	PAyuZEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOh0-0000000Gtb7-0CCf;
	Fri, 05 Sep 2025 05:08:58 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOeG-0000000Gsr1-2oIN
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 05:06:10 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-333f918d71eso16481891fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757048767; x=1757653567; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=;
        b=CHbw9B22nBW8RUBl7TedEn1IdNnM8PTUc6ZzEldycPKbgcsGlSUPx13LnXhg8cWv8T
         aQfBPTqz0LONIoEcoSaMpiROcufBev92f070kGclYysn8ItHbOD/U1uAJqK0ApUysQT+
         ANO+b+hrEkmf2rLmExwuKxiFvy1FY05iIazxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757048767; x=1757653567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=;
        b=v0a+EuPRhCTun+SFRoG19W1GcA/qk3D3VVtfx5l2I3wT389eHP5mJj6RYhsEU8wTrT
         +wigayusPZRC+kbkldxXgluaMXUrHmD2eouDYfcqzDxFPOiwwZ47ptqnvHjeUBWWIyg2
         Zk/l23xe8CJX9QuPXu5vHqY7TX4Ha0JHDuvrXddxDp21R3OcDxgixnkBewXBTC5lw8L2
         4Otu7xUI9MfwyfR5kgw2aKalWwWnPGA52QLkmCFcKhvSLtmo70SYPzFJfveKJf45Lzb/
         3w5iJ0K4akkB7DQ0uKii7ASFVJLk58NgQVoBYN9/m9T50KKubyvJzcxVNLfX6222pf1R
         XofA==
X-Forwarded-Encrypted: i=1; AJvYcCUfaE7bCL9pt5Mi9kwNlTfmL8lgG44Baf4lGzDqjRhVG0X26cPCKRLrPtUnJfnCzc6cgHmvisVFbSeGJ8huNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ElH6tpll9FJPlKe/2Q5dfcuiOiivOh8K1KClLh5PRAfiL0AY
	zi5mou2yKCO5C5P/6DloO8hWewlcloylvdACrkmYLrgskkU3eqtSzl2xr2Ha6qKpyP/5h5myWZA
	iIaPnYMjavpZySec8GWrV9Qon/nDJZbTnDwt3giN6
X-Gm-Gg: ASbGncv2JzSUwlWUkhaaJQuISfqDO9B6dl9vVdxjyLxx5Zyvj0EPsEGV9c0G5QzSkRF
	JeALmPg33dDyEtVnUDK9lAS5OyzXvXD6x/gL+xuoVojc+eGHD355q8FIPC9EG1ypCjfikBU5NOT
	bVRixzkRLNfJSxqYZOHvvXgQANz3bjAQvoEaLES8NT0Zsynozyt4+yWB1miQVwkUJjyS72B1T4r
	WNIxzCrKBW22QG/sG3PJBnvYNiBRta+v0+kww==
X-Google-Smtp-Source: AGHT+IHJjUpnhP9a9BCpvVLpzZvdmFRUDDu4oemMG1IXcZXVXfUhtp9wpdL0LzSmbU5jtUN4x+9LhikiWu80XNjJGfk=
X-Received: by 2002:a05:651c:2109:b0:336:d879:140f with SMTP id
 38308e7fff4ca-336d87916c1mr56567881fa.21.1757048766845; Thu, 04 Sep 2025
 22:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-15-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-15-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 13:05:55 +0800
X-Gm-Features: Ac12FXzUw4mCbky5MPiHj8W2ByhD9sAje7rRwu3IY62BkDBlMB6KCGdwR2WWCfw
Message-ID: <CAGXv+5Fj9Hwmk2y_bZhGX0EUEY42tm3t0nTrjtV-sYhD_B-xVg@mail.gmail.com>
Subject: Re: [PATCH v5 14/27] clk: mediatek: Add MT8196 peripheral clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_220608_712723_F5A4C46F 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 peripheral clock controller, which provides
> clock gate control for dma/flashif/msdc/pwm/spi/uart.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Not sure why CLK_OPS_PARENT_ENABLE was removed, but it does seem like the
right thing to do, since this block is always on and doesn't require a
clock to be enabled before accessing the registers.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE chan=
ge

Note that I did not go through the bit definitions. I assume the other
Collabora folks did a good job of reviewing those.

