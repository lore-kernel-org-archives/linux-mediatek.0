Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE936C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brGSpE/I4bwiL2QodCss+SZ4iDIK+Jo8cWnug9QmyxE=; b=Qh2+yV6GoamvBJjWtCht1V8sFH
	dXof+NQzn7WKnowhdwPVK0w5w+dP2hET1FhoQNTLBZvGT/0rNl6zMWgeM6cTx5YIn4J6XHHMikz6B
	kvPbG9RDnKCCgKRJtBWpbb4ixTQHqwHh/Tlq7v4kh9KDxhN3taaKvB18tNCpaQI4d+LL5zvvzbPxW
	crBfc7WtRNM9E+B+WXPORXm/h5zlYAl9yr0uxtu8LwNk1GF9UZjg+L0gw/mbrkczwPbPCwkyqvJGp
	+2CGItLAv8D4jYULBOycQVFN5IBYMKS9CkI/T6jCXhRx3OxJNRDsLBa2eMqeEGkk7bB0gZ/xdYDWV
	VI7YDgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Snh-006iy4-2T;
	Fri, 24 Nov 2023 09:48:41 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Snf-006iwi-1q
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 09:48:40 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5cd2f1a198cso14674447b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Nov 2023 01:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819318; x=1701424118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brGSpE/I4bwiL2QodCss+SZ4iDIK+Jo8cWnug9QmyxE=;
        b=qrHtWP8ILuo0Ja0hIQCFEc7SKB0aM0cJ0JGACZ3JgFgWVn/wOVJYbfEZAGTZzYQZFN
         zvEtkujzIQsIp3XvpdyAYHw8XY7/tx+h/G6f3VVFLCDc6wMTXiFMmT2ZlZg2j0cBUX8z
         GCdmuIlovD1KS/tutEs7/3/B4JcjNCaFvgV/K8wA50dNJO7d4Il6tido6K48yOawFo7A
         PdOXt26PTv8P3RjR0lkcMiLPmNBKMqg76oVwLQfsihxAYmsRElO5HtaWBFowRDerJhD1
         UXcBHN+QdAzYq8Bb97Toz2D7KGQAObvShG41GbyBVikKBBKjDQlUgvW/88eKcrxQ/FZA
         miqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819318; x=1701424118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brGSpE/I4bwiL2QodCss+SZ4iDIK+Jo8cWnug9QmyxE=;
        b=YlvlWZyJrKZqBhG51cqn9jh4pFWXUFfA69GrAoURW1hsjHtAJIvOl/yH9GN07RhZO1
         /2GVj5gggMnkElqUBRkaW7ORwzbi3m7hYwVOgUWVqQ7+3i1SMN6vw8zbeUdEk1ACpu2Z
         P7tqs1h638ybllrZcxVO7ba8YEJCfCcNcnamoi5Y4lGsyTM4TjGSVnzlX2+q9YawV/QH
         m0ijWZZZfnRPMpkT0IuGAkbF/LPX7ArmcBLQuxsP4XBU14kLNt9X13lFBY62+Spx8LpV
         NqCCFynI1IssXP50zq82TZ1xhKUVcysGBWZp94PV4Yo2YsjF82Xt+bjMPy/UrktxkYHj
         iYhw==
X-Gm-Message-State: AOJu0YzhR8ofXUC9ERMIf236lfHNGWysnCUZVl2DDO73JSYRJNg3jp4O
	e/8PcF1ZoY69h64X0NLz1nvZrxwFA9/rBVbUr/2Ivw==
X-Google-Smtp-Source: AGHT+IFFWjuFRxzqwnPVQOCyRHtCV15dWbgBvVaHUW8qbp1IhYnDim/OX7zwXKi8JWkHbIg5en8YBsTX9yaPJxXFD0g=
X-Received: by 2002:a81:830a:0:b0:5cb:23:d28f with SMTP id t10-20020a81830a000000b005cb0023d28fmr2220520ywf.14.1700819317941;
 Fri, 24 Nov 2023 01:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20231117104101.9374-1-zajec5@gmail.com>
In-Reply-To: <20231117104101.9374-1-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:48:26 +0100
Message-ID: <CACRpkdbra2Mv2qcfeDbQdPnUOvJcXf4FrMmVduz1EUN-2ONvTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add acelink
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Chris Morgan <macromorgan@hotmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_014839_608296_C1042EEF 
X-CRM114-Status: UNSURE (   7.84  )
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

On Fri, Nov 17, 2023 at 11:41=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gm=
ail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Acelink is a Taiwan company providing network products (routers, access
> points, switches, cameras and more).
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

