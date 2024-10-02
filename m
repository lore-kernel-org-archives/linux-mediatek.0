Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1966CCF6D25
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HzBc2EV9uqxoflmRRfK8jFyB3aOAk7qQbpOPz7vBxc=; b=Ab3XjX+4H1mo5JHM1i3bw0JTqC
	C5DOm6KPWnBbW6hkseR+uoozZP+Vqe/8bfsxM2tH83BzKoBQfs/e5Li4IlISezOF0PH/uFz2erhbp
	FuoYnqYrNYyl7YRbikqyDAZmytOaF1yv0wbdHkrJE92CCJ+lJwbog07kWjGZHU9sP0E/5LctsnC0l
	6Q5IUN1wppOMv2T0sb+qNaENohfGx0OyJsPQtHqF9CTJM9RYz8qud0TyRM5C57WHhP8c6U8Ke64po
	o6+8wPSxsuZn6Ah+HrrDOkMrDKLPic8h0oLjj1/teDVEm2bNUu5PNIj/jdv0WWKaHvtN35FyPLZin
	4zEnzDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svzOQ-000000067ku-0uVn;
	Wed, 02 Oct 2024 13:27:50 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svzOA-000000067h8-2EoA
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 13:27:35 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e260b266805so4341718276.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727875653; x=1728480453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HzBc2EV9uqxoflmRRfK8jFyB3aOAk7qQbpOPz7vBxc=;
        b=pVaUT87V/Jz53zcA2KkjQbg8RNgsd7tCG7nPOgEjSoOFWYqR+jeTuv8iwCxeXGTkmc
         QKstHAYtPAIEDaeqbjCSUK8gb5B/bOnv02dwBqoDNRgDMN7bvDSx7PAKlcePOLhhPG4c
         qRQIeZjGLHQZuf/DaWUxQQhkma++6xz51IlwvWiYTkqvE5u+ECoOBm/E53EB/XYDX4em
         FydrhOgHAxNmOJtXARTV820hwClUXzgSjquSBrNU3MvA9Q831x0Wxr85u9M3FsibB9aC
         r7lhS4/+/dMs5SqQSKi3PjOF6R0gzuZUy9g+ebOs18aEmNFV2wjn/qL97dPCJqWjC357
         kd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875653; x=1728480453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HzBc2EV9uqxoflmRRfK8jFyB3aOAk7qQbpOPz7vBxc=;
        b=nn4asXm3UyjeFI56w/KO/brnwQRNxzimDJ3b7vodEJM1T0WrcXNbxis0eDaM+sQ9Rk
         CZBW1SrS32q89SslhhNc9G9FGfuCweJpCN8R3pzogxk53040fYVu8EVSmdKLGPmyQtW3
         1cCPJTQ7aUfuLnFKsLx/1nvQ1k2HhZkpsHZdtc0q82doudmE7joGjrrRyxC4eLR5gqJf
         bX1NRMG3nYGbXHMcXLOqHOwRiBRmhsKJz8aPYOfyfrd/1AchZ2G+x9alRTIteZWhWSTW
         cNVGpwhExdq0+RPGia/JP2Tj4APfjShOm59iRC6nKAXZn7IE4vK56ew+StLKEem2wR8+
         TnyA==
X-Forwarded-Encrypted: i=1; AJvYcCUkB1YOogd3bhBf4GPB/nIwCfLNaS32+0lzGsHzCJfbk/8KN73vy6hicje8EfdDAV67ucoucALAXqKP4QLCZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB8FnZwgKJ/QbJDv/qLB9yTgb3I0k5pAL62W/AZmOhysxNP6DY
	Vx3ldrg866CJ+8qjQHyROR3zUrrdwNhBQP49LfdDUQdYHHxz8QjxokTXaxu0YYJ7TBjdMdAnJd0
	shtrKs37nC8gUg1JtrbPhrZ6MCaTcxnDSMkettw==
X-Google-Smtp-Source: AGHT+IHZUCB4vEl2AW6EAUkIG+axani700+S0OSjD1AjUsJbKs++2/eQZRuBsA/6kNKQfxt26/FJDiTjtYis5ARK10o=
X-Received: by 2002:a05:6902:248a:b0:e20:2232:aab6 with SMTP id
 3f1490d57ef6-e263838535amr2218907276.7.1727875653468; Wed, 02 Oct 2024
 06:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org> <20241001-en7581-pinctrl-v5-4-dc1ce542b6c6@kernel.org>
In-Reply-To: <20241001-en7581-pinctrl-v5-4-dc1ce542b6c6@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:27:16 +0200
Message-ID: <CACRpkdZMWKb1h0-sWECCY0E3CxxMyLwCr4M3k6vrY9aAfpzMVg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: airoha: Add support for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_062734_601504_2297254B 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, Oct 1, 2024 at 7:30=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.org=
> wrote:

> Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
> supports the following functionalities:
> - pin multiplexing
> - pin pull-up, pull-down, open-drain, current strength,
>   {input,output}_enable, output_{low,high}
> - gpio controller
> - irq controller
>
> Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Co-developed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

I missed that there was a v5 out and responded more to v4.

Anyway, I think the last comments on v4 still need to be
adressed:
https://lore.kernel.org/linux-gpio/CACRpkdbXWMU+wq6DvviCQPQ0EzKUm9oOnyFh34B=
m=3DY8K-HmT0Q@mail.gmail.com/

Yours,
Linus Walleij

