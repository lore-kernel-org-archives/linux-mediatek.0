Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CB9CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gxUVSVCUEW7zut2SflwjM4pYcypiURMBMDu4ko25UQ=; b=VY6Wn/A1+9x1u+UpJuNL8/oryn
	nInZ33Cmx6UKJv9E5hBECDxYSM5/2daAj/UXRxQp9bPSNsryAlVyN09LKDWeIvz55iH/jhUTR4kZ9
	2iUL26qnduUhlc1Q4z3ykwcsqnxPRdiPtkTrhcZoqdQqB6a8T/PcPqilaufzzqlLo2UcpmRI2gVyE
	auSfLt2x/3ihX3E9wemgC+gOtsTjoSOV7ODfI8R3krixEMe4bF4Jp6bRy9b+s2wTS39b+uM33c0XO
	v0j4Sg+lpxaQZNkYZ7KjvqhM3xV8KBIuDtqAZ5saortQX7BZpQd2XgCqTuhDUPHuj1TDifAIM8q/l
	c9y4xdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9eT-00EqiM-1K;
	Mon, 18 Sep 2023 08:30:41 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9eO-00EqhH-1v;
	Mon, 18 Sep 2023 08:30:40 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1d69b2ffa1fso1407898fac.2;
        Mon, 18 Sep 2023 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695025835; x=1695630635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gxUVSVCUEW7zut2SflwjM4pYcypiURMBMDu4ko25UQ=;
        b=fF0UreWq5waIaUR35mrul/VrjG5b/APEwqTMU1VhTToU1QQiyKErPGl+UtygLQbzwK
         6c7iJdhgS2V3TMBOUp/xvitT4nW2rNQa7C8024WR1XXdwK1AHyIPqd+4BWYmZ5aZBY+4
         DrPqAn165QsOi4GPqlbJDEf1Qt2R9TZkWyPla6+Jm3poUbhz3szlSQ3s9FpxhQHbZplo
         BNFWXjqCgRuxLjp1BTZ7XSwF9KjH5jPMpbfe/5X7+3o8KEmJxivcJh9rdD4ne6/wAuAI
         MjAXif+nwzFfGlFyQSaJ0QGP9oRZu3b/1bhAbm0FVHm8DEAXZxEVJvuPuVyQf8HBLlf8
         nZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695025835; x=1695630635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gxUVSVCUEW7zut2SflwjM4pYcypiURMBMDu4ko25UQ=;
        b=vyVAQJ+/eSZmWuGgpk/ZBOsFh5vSW1L1mux4i/nrPKDY7zp7b9QugUZU18yqwIuFJG
         vZ3a1x7EfxLM8Gc9HQTQfDwSey6NiJywjwhlwcT17ofpmUPs4L0xb1agiLibiLmQssDC
         rod1h9O4jpcjhJIG3CfdokZi9uFIylKUOLOm744Cx9fLzJGSi4WD13yvAIIofyHuGRgH
         2BM/AyWgDY16hEuK92JRly7hv9USqBCHRbT7Q5g/cXxThXmgD5VEZBI1ZXVNtfY1OaVr
         MJ6XlNxNkl6XL9T7Hh/9X/NPvqPxi7dk0aal+AC4I669Em7yZ60Bv72trDisg105xSAO
         EA8Q==
X-Gm-Message-State: AOJu0Yx68iOn+JvgxS8umQErofmRRcprNyVKwmRkS9phF2kaNYtdk7EP
	wGKkyEFnwXsHeefbE3XxsDIs/LiL2qhNI40rt2s=
X-Google-Smtp-Source: AGHT+IHrSDRkd5WNauUdlZMq5j/Pp4W7T1SSLTlkg0boyakoxeUeVrdmPvAbatnVgTgjJF89LlTtpEB1FizNovQ6HuM=
X-Received: by 2002:a05:6870:95aa:b0:1ba:d044:8a4 with SMTP id
 k42-20020a05687095aa00b001bad04408a4mr10884539oao.18.1695025835198; Mon, 18
 Sep 2023 01:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230917162837.277405-1-arinc.unal@arinc9.com> <20230917162837.277405-2-arinc.unal@arinc9.com>
In-Reply-To: <20230917162837.277405-2-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Sep 2023 10:30:24 +0200
Message-ID: <CAMhs-H-MPjiRLY1khOdj7AXhvU62HKTZfoXTH=fsvngF-rsnCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mtmips: document pins of groups
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mithat.guner@xeront.com, 
	erkin.bozoglu@xeront.com, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_013036_632283_A53DC2FC 
X-CRM114-Status: GOOD (  10.64  )
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

On Sun, Sep 17, 2023 at 6:30=E2=80=AFPM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.un=
al@arinc9.com> wrote:
>
> Document the pins of each group on the MediaTek MTMIPS SoC pin controller=
s.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 22 ++++++++++++-
>  .../pinctrl/mediatek,mt7621-pinctrl.yaml      | 18 +++++++++-
>  .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 33 ++++++++++++++++++-
>  .../pinctrl/ralink,rt2880-pinctrl.yaml        | 17 +++++++++-
>  .../pinctrl/ralink,rt305x-pinctrl.yaml        | 16 ++++++++-
>  .../pinctrl/ralink,rt3352-pinctrl.yaml        | 17 +++++++++-
>  .../pinctrl/ralink,rt3883-pinctrl.yaml        | 16 ++++++++-
>  .../pinctrl/ralink,rt5350-pinctrl.yaml        | 13 +++++++-
>  8 files changed, 144 insertions(+), 8 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

