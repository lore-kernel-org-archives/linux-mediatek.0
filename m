Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5CFC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBRnReI/EWbnz6sUhTBWAlqOUHOEPxHS7DXa09LHTHk=; b=wCjYk5BcJiaWJ1JKqDKj1K/NaI
	1pAiVYC1+Vfa4FmWehUC5N0bZOqQEYs26x65MXOY8Or+Bx/TobmTfxvaL9Bb9GeuK+Xxc0SsL9CVt
	QKwF2BWikdHOFqNrV+JvztM3kqTwnJfAUvdJRKwt+l7265p7SkLmgrhNSem77GxUCnnvrXJ/zGOEF
	b1Lx7ynfRUTM1Gp959ptSPTO0nCf5YR/aZJLmiMhLFEEy/yZUzWTKiXgKkWQzpIZCuPiB4QcMoU27
	A3c2z6SMACUjqBXK4p1zO2N8AAcJ8PiSpAs/8rtIunbNtjwSnXF5v9nS5/i3LQQWC7+0FiAIh39cw
	gGUFIbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAs5X-001FDZ-Lf; Mon, 11 Jul 2022 12:00:31 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAs5G-001F3i-0n
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 12:00:16 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id e69so8327171ybh.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Jul 2022 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uBRnReI/EWbnz6sUhTBWAlqOUHOEPxHS7DXa09LHTHk=;
        b=cZCX7qE4GJaHsrdfxQTALnTMCRUcRiYD08jxqjnZY8YlcqIjCeLTikKt8znUSUKs60
         slwaH/HKyOJlCq9Bv0rFBL/ttcPEAVMmOqYaS8qKhqH1iqB5lcKnOgW2M4jQUOSxKWjU
         ZRonmVfGrdIxLEOUxxTrkwvZvKdA2FD+OUUWNxwjZteWX9ZITT9Cv+Orz3pAbQbW+DLF
         PbvXeCQ1zLkVppClLM+cq3IajdCtYcDJnA/lVUIw2SlLN/J7HkIRsu7A/9/MkwbKXPmI
         xJfB7ZrLVSxM+4brh3ykcnnIr4PO9MvnEX6wYUodtu4A30jqXRZAea37mHqBQxruLtqB
         DB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uBRnReI/EWbnz6sUhTBWAlqOUHOEPxHS7DXa09LHTHk=;
        b=X5XLOLrEhYAh9BeiyAoYjYKY/fLD/M4AvKKq3iCDHdzh2xdpHIcYVTcv2vXuTlwBOs
         wnfqfjjSdI79hTDYZ8NeNXP8/bDWl7SpoNRHTX8oYwv0VQZ5ErlUU4CSQFoDpmLFoAor
         JIK9kX03HGmiUVw9nyUBYGMWpguFLgfytauoudpjhlxup4hoc5oo8kF6rAkmmkb7l9FM
         c4UjE8eyENXOk2uuUVaJDzUgryj81/ZpOkEx5NKRQPLvVy13U8XQZmR3nFSnUBeP73gg
         HD+1e8i/mqpdCoz12IQNxxKMk27oyx6Td4VV77Wzecj9ZZtOtYC2CiT2H8S6XjaDjGct
         Tl8g==
X-Gm-Message-State: AJIora/wk1sXH1YjT0jEl2a6LIR3p4BTdXqQIxtYScNP5jHOL/Q05vgZ
	ACZgLskITFNDcPfCl/IrydhqnYQwMlpVsETsdt5UOA==
X-Google-Smtp-Source: AGRyM1uFGpCTROuCfVKjWlz+hz544UUzULXGIlRp7bn/8BuvhxzWdGAKXTMOr2Q1EKlBr6eoRV7167vFOm7xhSPQT9c=
X-Received: by 2002:a25:fe04:0:b0:66e:1f8a:8e89 with SMTP id
 k4-20020a25fe04000000b0066e1f8a8e89mr17205797ybe.514.1657540812354; Mon, 11
 Jul 2022 05:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220630110453.186526-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220630110453.186526-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 14:00:01 +0200
Message-ID: <CACRpkdb3m=7AbkEYvFrDYyh4OYLUmbt2OmZ=bnON_OfOJ4GXig@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Add gpio-line-names property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nfraprado@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_050014_080833_0B485DFF 
X-CRM114-Status: UNSURE (   7.52  )
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

On Thu, Jun 30, 2022 at 1:05 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Add the 'gpio-line-names' property to mt8195-pinctrl, as this will be
> used in devicetrees to describe pin names.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied!

Yours,
Linus Walleij

