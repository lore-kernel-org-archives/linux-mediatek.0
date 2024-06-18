Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED91BC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=; b=Ci2qNNkxee5Tv3RDHPqsEM+lnH
	5CWc+PdvDLfxZfiIuHmnWk63Pkenil5gbj0eBk8izLI/CcOmE6xLMI/cfbdkLHq9FIffTldanTy4n
	l/z/yTbmzrVbJ/uGiOyejSKXSZRh85sxfOR7lnK2MykgGwntwSqIJX0oY+klJOwfHg6gwRXqgzP6B
	782GByfS7iPJTeryf2JfTiwRUwFt2MeZaGYEdXBrfC7THfOBlfOwWj702tI4b9H4oygSo5CIZ6SSW
	KupftT0Nv7XX6djl0NjK17VdgkgIuRho6fxXzVff+pcB4xaEjn2JNgwOFMF0hu2Z+F1p78HTdyhrE
	xO8DY7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW2Z-0000000ELom-1u9l;
	Tue, 18 Jun 2024 10:26:15 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW2U-0000000ELkm-3Upo
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jun 2024 10:26:13 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso56316611fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jun 2024 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706369; x=1719311169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=bz1j8/XGUSFyTlIWYEdrVzTNjNP4Iv7F9KevnaHhuZK0SLDN6GJo8tvnqOr3YukBwT
         f68diMCV3Ad3UUIMuiFUXFBltU3legLpZqDVJiKeN+Xq5KoK2yaTW73uNjcqIAe4ADgY
         oLUMCtS2zKWETFKl+cJCTp7nwv1EYUNcHCVzkPEdhbEhXju+LmMHxsOFkmSz7PyUNyZ7
         wsEBbzNbobO5MCxYrQ+cQYEfRC73itufzSDd00Xvm2WrB3o9tv68Mkmh4qoXiWFhjALN
         CG740Lltz/Qj5MbVEFvvohQmNBaboijfJg24VianwNFjn2L21tqvfZ3IPdGHdZReiaSc
         jLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706369; x=1719311169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=hMM9gIPwCOyg4kPSBwlNtZ/+cen9YAl/gnzZGs4By3b9se/Fvjf/IwLxTHFbxQwFnZ
         nXai5nnjkVNT0WLFG5MDpDB0BOIFO1hX25bAEF62T+bmA7oVrD5Ie2P0sIhrCxBYnLs8
         1gp/fEed1YfBA21bYKJULNj0f0U2W/KtSBQImlVSbCyewIhkNH998pigoDebBN88o7Oh
         pz/Rbgz9sTYPkhAXwQOlFeJ1W7uhhugTI7qYIR3K5cq12ey8Xthmi1DK+XIBTkSDorQU
         xpH9ZG1YZXafZm0MN1QPTeiGiBsYVgTh1izGn12iDmgEul6Syp+oR9Dmop+j35ODMO7Z
         Bfvg==
X-Forwarded-Encrypted: i=1; AJvYcCUQzzbA5PmWuXdZ727AO6y2gmeSikKYjpDqVUenkVco6eAcFMmJoUK14Qzfjr8D2wrd3t9XstvrT/Mehdb9ZcHnhyMJiK6OQ+XSvMTWYgaX3DH6
X-Gm-Message-State: AOJu0YzGM2jX2sdwRwmOyFSS5bQVfCMdg4mHo6ZsSHfHt+OkMMqtVJUc
	zFb3qtn3aGlKnZfaLMNNPbdPBDYYSz3BZhJFCNUiJcR2oQB9kVm9G4Y55xIlH2XeygU7f/OHnj2
	QWDFQwijPlTRWHDOxJ/dknZHNs+PvMv6X0Rczww==
X-Google-Smtp-Source: AGHT+IFVnhzqBoiu9GboooE5iY1zi/XLlllZteuuassl+ZmbxgbyJsQPD3pk6oFTjF6bKUOXQjAi+8CRlASoDk+Kx6o=
X-Received: by 2002:a19:6912:0:b0:52c:99c9:bef6 with SMTP id
 2adb3069b0e04-52ca6e5639fmr6700866e87.7.1718706369027; Tue, 18 Jun 2024
 03:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
In-Reply-To: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:25:57 +0200
Message-ID: <CACRpkdZdjL7Z7qY5MTtZZRKQBLWHPKoHKKyoy56mKzZfu=WfPA@mail.gmail.com>
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_032610_902388_E0C22951 
X-CRM114-Status: UNSURE (   7.87  )
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

On Wed, Jun 12, 2024 at 7:51=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:

> With ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx=
8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mt=
k-cmdq-helper.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/mes=
on-clk-measure.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

