Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD0DC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts6l4q35PJyZVvbtUPUcE0vDkunILKSFRvvJ+IL6obs=; b=Y5QlOe4b12Vt/CNMlIPNXTDgru
	VRt+h3JIE60B6Hd5YRp2ciZerSttLIYvHb2hrpAZo4qO5/gNJZPZ00jHLLCFDE9mZygz7Q6vkK/7q
	iSRPIQEJ9Gy4NcBhEojBv6ECDpVbcsp7SfkWFnaGwFHx/7FXGOO4arXzP1IHqzFP8TOc/tmJSmnrP
	AzyUT9bui4LYHE1Ngky6Gc8KoWZF8i9tHvifwCrGTOdXPcQNJOLeSODNhQbDnBKR+oaNgU21Zb/qx
	EK+mfLP/n6Jj+jf1KzfURHCQ0f+Duq9NHU12RAjZjiwjPo/d9eYd/SLJi8L/hlrYxaPIFIlrNnYn4
	2cMz/noQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGSe-001IGP-0C;
	Thu, 23 Mar 2023 08:38:16 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGSa-001IEb-1m;
	Thu, 23 Mar 2023 08:38:13 +0000
Received: by mail-qt1-f178.google.com with SMTP id n2so25772341qtp.0;
        Thu, 23 Mar 2023 01:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts6l4q35PJyZVvbtUPUcE0vDkunILKSFRvvJ+IL6obs=;
        b=BlOYfG7uEB9+f94rAxRB6WosIJ8pv18VfO0Rld2GFM/RjDDG3eK1rG5wXliM3gWrZ2
         gI652U5hOkcnQoqi7wJDHpU7WTZiXFz53MCQfBtcZYJHJt2NL9V8t2KW8XJtL/5NTOCI
         48C04bnoNToDhaQkd0qra7dGnilxSiH6KP1yis9tOqvcfbuOg6wf6gHWEC23gotYt9dC
         0g4r0FmpJCPpEJZsL0FCbmKcg7ZCQXBY8BKyBnDxLLqAfSCzjLyrhGJZr930aS45h7nY
         LA3s2XnKg9CgGfHu3mDZXEA1SKD9aGoNcrLE3fgIe/gtZmaI3NLWsgtKEXdVvcVCogUC
         +Myw==
X-Gm-Message-State: AO0yUKUAGySsVW0Zfx43AV/kcSKdP+EkhZPvlKcsTZZDVWqC6tTUKzfl
	jlu5ELzaqld0PMS5A/fiTZHMe7R+5SLa2A==
X-Google-Smtp-Source: AK7set903Q8Hjaawp3szxl5OQNQPo1QqIP1hSxbvhPbXQtQf38KjoOghBN/46P6d2gk9cSBjDXZ/wA==
X-Received: by 2002:ac8:5a0c:0:b0:3ba:1f09:94ab with SMTP id n12-20020ac85a0c000000b003ba1f0994abmr10124734qta.57.1679560690132;
        Thu, 23 Mar 2023 01:38:10 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id y5-20020ac87085000000b003e014845d9esm7789413qto.74.2023.03.23.01.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:38:09 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5445009c26bso382891787b3.8;
        Thu, 23 Mar 2023 01:38:09 -0700 (PDT)
X-Received: by 2002:a81:af02:0:b0:544:8bc1:a179 with SMTP id
 n2-20020a81af02000000b005448bc1a179mr1425037ywh.4.1679560688960; Thu, 23 Mar
 2023 01:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230322173549.3972106-1-robh@kernel.org>
In-Reply-To: <20230322173549.3972106-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Mar 2023 09:37:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUtnngE4Jk6P0iLF7MXnp+7jw9XXOZsbSutDtbO77d=Q@mail.gmail.com>
Message-ID: <CAMuHMdXUtnngE4Jk6P0iLF7MXnp+7jw9XXOZsbSutDtbO77d=Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_013812_584668_46FC6669 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, Mar 22, 2023 at 6:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 4 ++--
>  .../bindings/clock/renesas,rcar-usb2-clock-sel.yaml           | 4 ++--
>  .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml          | 4 ++--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

