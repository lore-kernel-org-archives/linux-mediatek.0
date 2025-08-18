Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A33CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=; b=UhZE/LTBgc3JqqGAKuhadMkHwl
	fxKzuvlsf2vnGOjyayULBnEPOAqeut6PRopcSc+3ZXjSv8ZssmCL3Xf0HnVhElcVvW+HJ5lErUCSs
	+slmqL3g2X6BgwWnXTywPYMcRANLGlasi5BtCqIIpmm5cQXhVlRP8dVotfBGZKO8dHCZOF/EHujP4
	OtTaZ/6/QXg9ODdzlx0vQsNX/suJzmQ2M/1/Mktvx3jz0mA/94DLmawb/uVoH+wMdE+GrBBaNRCgd
	8/PCaupqWJuXZAH0vYh/08oouYXHmPkmck8oFy8gzeltGXYtBpo6WlEeBhO5r3QWey1PZWEyUPdlk
	N2qtrFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3i3-000000089sM-0PU7;
	Mon, 18 Aug 2025 17:31:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1b5-00000007th9-1PDD
	for linux-mediatek@bombadil.infradead.org;
	Mon, 18 Aug 2025 15:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=; b=KkwdAT3WzrdWOkDOeyFnKZCw+u
	f2aEnnJtUdm96WejVF+fWj0bqOHmcdWYAkmIPZdIXWcxaXc2lkxl/pDJ9NwSskOAP2rdlLStE08UU
	t07jeuM7QcsmYw/jf6x47do7d0vTkNOtp7yc7KiWp277kMIM3+sSXzC8ObOWMixU76GnCDmUBjhSF
	GaAYf1e0hSEBR7MO/Cp+ZQ8iXoK3m/kJiMWb/rk+b9Ykl7/2lJ0Jlsfsf8QkYERprTxiSBld9rZ6b
	96zJcVTOemQ/KlLyQVG8MD6ddFOflLnotsAYm6TUenLWgcjkMn/ZjeUiNOYpPG1mr2YX/O37M2MuW
	Ligr2YlA==;
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1b0-0000000HR6O-2z1i
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Aug 2025 15:16:30 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-333f92f1911so31292781fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Aug 2025 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530184; x=1756134984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=e/PXjlou1K5YIH1/L0yrt07SFk54UMQ29ZLRZ3Gl+fMZX7298N/foDpyyfFe+h3/k6
         5lRfm+7WQJ4NwuyE5dg/q913tJWouPiBlyQutTOypzUUckxUWRM2ANiIhRWm2yNO9uz+
         EteS+DkQNg8FS3x3TwqDh/bYY/7QpE+drbfVQuqxamC3GVC8vBSH6Qeh1ytLShDlqE4y
         k7PX+tai3tKUtrxuIcLxz5YwQQcw8UNIANdhtkoaZ3hzj5yr4qNo02xI3luALXx7tviW
         zuDDmk3T6CTGFo7dii9p9NX8S68k4AQqdvZk/uLzA18kci/bOVkDbkdUx3WgWcEwhNDf
         1ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530184; x=1756134984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=perzYAZx4lPCOEmE5GRuP1dlPgMlMb/q1Y1531CLC/L1ppgmT0osO+tUS5BrxWLprd
         X86VXwMzVpGqN+xk5fau71TsHNuS7VdqqEwg9yBnrl/SOVSB0UOwScYBIX22qljHjHoO
         Ube9zPyytmm4vIaHe15TSLIipjvAY0M0H9SlCSSZk66EzHvj+9kiCFu3ADqP5g7f+lTC
         wxc6rys3eTg22HT061k25WmL7/B5t3ZtTpyz5yH1RVanoJBzHqPHwQgGgRpQVkt/d99f
         mouJLuwGUxTR213ssnAowBU48hRjC9cVv1rjd/4UaVfEqfrZzgTNMhGvSmRHEBAxNCy9
         MSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZbcv4Vjupf2L0iy6zQ0dJN1kFloGM/7WswH/2y/T59A5U9FNs6OS/jypKJUItPrOT7qUDzd1yboENcx2efQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweSFcgDLuqjcmb6Y+Vtry+sRwlu5bC1fTvR3SLkcPAx1Hl7PrT
	tHeXFXJ+aaNGOxjn/o4bL2T03C9zJYUfbpcJ060NSKHmSMCqocTx1xddR+UHPokV4udw/AjQ/Ul
	37svV6yIQRqk470rTRhkkyqpwuTgWXki+nDbz21/q5w==
X-Gm-Gg: ASbGncuIbW9LJQgGaZEhrFwUDkuEbE+nFbFW38vc26h+udNOUsihGRz2NwN7V7C7SHF
	NiIfbPMtRojkPXEg6ljq/RyIYrqbfOKN0BB5ki2Pb7cVtMOKtmzAt2KnHYBRvFozbD0C+FWieph
	WlLiTYdS68jmkH0ySpg2f8FNmo0QLuJfTL5sfn/QMKNz+9EAsR3ItZOvR0L5NRmu4J7J7qMWGMk
	0ytc+4=
X-Google-Smtp-Source: AGHT+IGzqxCnqLVvPxKCko2DlB85KniY6TF5HHlMzLUiXgvNhvXoucfmnrbgjKUH/ALtayc9hnqKx6ybbX/dLc1uNDE=
X-Received: by 2002:a05:651c:198d:b0:332:4528:c0e0 with SMTP id
 38308e7fff4ca-3340996011cmr37441011fa.32.1755530183649; Mon, 18 Aug 2025
 08:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com> <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:16:12 +0200
X-Gm-Features: Ac12FXxjGtIqn77Wg-HXxURZEtSYdu71ByUfcWhpILl9XIWrUY16-cZaSQJoAaQ
Message-ID: <CACRpkdZpUhPERPFvNTwormrqz-H-5VUDaOrRQQ2ap+Oe6YN2Qg@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_161626_840337_F799D5F9 
X-CRM114-Status: UNSURE (   9.95  )
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

On Fri, Aug 1, 2025 at 1:18=E2=80=AFPM Julien Massot
<julien.massot@collabora.com> wrote:

> Add support for the 'gpio-line-names' property in the MT8183 pinctrl
> binding.
> This allows naming the GPIOs, which is already done in several
> device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
> mt8183-kukui-krane.dtsi), but was previously generating DT schema
> warnings.
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

This patch 7/9 applied to the pinctrl tree.

Yours,
Linus Walleij

