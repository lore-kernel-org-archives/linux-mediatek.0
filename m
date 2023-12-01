Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505B7C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S981KapfzO045oI7EezmWMBJ8fVn+98mRDxQPvPZv8g=; b=vbGKqqzDs0/J6iCdXL5j32IiZq
	qU36oqAaeFyP8oam51uRYHScRbCFgcYZGFLeLbMPcYEfkWikBeP9pdvD7pagbPX5IRyrvo31f8WNq
	V1uXkYS+n+y+4qs3OlObIDPT9hblQfHEyWkNFGzLDSp6YxxyWyuoQs/iJLVph6FTEOEy9h4glynX4
	arof3mbcNUSl8In9uHnjlPNtq8RqnXgHvqi/Cl6Wr8pcjregwc2Y5MS6Q4nXJUsVxrZrzJiK7FAsc
	M2ZgskfQYT8FZdvlGAh0jI4dcIfdoIDOSVWAtHs38KMrmjGwuO9fc1/eWUy4wCA9uHWBdw83A9R6E
	8FHoF0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r949M-00DtaG-0D;
	Fri, 01 Dec 2023 14:05:48 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r949J-00DtYN-24
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 14:05:46 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5d400779f16so6215537b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 06:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701439541; x=1702044341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S981KapfzO045oI7EezmWMBJ8fVn+98mRDxQPvPZv8g=;
        b=HHp9HX7v8OVOYB3a2217WNfRJkyvHZDNYFzF1uYDz3h/XjoAF5lszqO3vwe1pIsIkv
         TN45AENeInQc2Z/etsz3QTJoAYbhMFvLq+Wgs2vXtRZjOpG/WUR+JQqm/J/a/4+0LQDE
         z/bhzuDB6cUplznz/ccbVJNNbjbxHmwLgmQBecUf27W6DwHlNrFDnlXEt8iBrFJGbMIj
         i8suXBildNyDyZtsQbnMw3DngwKeLGZzAIMPR4ORze0Hnb6X2eYFkiuGXxWjsGcW138y
         s41rblJMAnJ9FL0DkbwwjeReYKgLXxNvca+5F0FCiyrlqIEslX+lu6iYUamjmglx7Usu
         Ffhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701439541; x=1702044341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S981KapfzO045oI7EezmWMBJ8fVn+98mRDxQPvPZv8g=;
        b=aUTI5FPFV3wH/00aPohVGkNY9NSggJMRZqcIeEO18m73NYNKCwImtr/NXN/kUMCjZ8
         3Dcq8jzWHWZ0gxy6rh/XmBEq4d8vCqU4Y/I6qbmNejb+wxJ08F0UzsEV9TD83QjB43+b
         7TXbVqYyR6HKU4QV/bkw/X5dU0zQP8tx4HprdYNDup39eq88nh8orHXi1yMKgpLtZBDp
         HsYrnnaDf6GX/N74OcFlFeUUV4fhftsdrW6zl4WpMpEfhdaIyjSoxXOLYEF/JlJJeh7l
         lJMDaZvvKae9ChdggyNADvVMSvux6YI9w7NRNQRGCs+7rm8VNZIppZQ3LbOlvppe/0lt
         XQcQ==
X-Gm-Message-State: AOJu0YygJA0R8Qm4A2cLVwKfpmkzydo9MgTjky8pC0ozJnHHV1VOxh8q
	rn1P6z7P2r5AToa2zBQGZ3Kp+i5t46OJqS44aQyeQA==
X-Google-Smtp-Source: AGHT+IGgZieAgbL8W8KVNwc6EnusoD/krGGnayXbUe4OQQFB/f3qh/vCdT4Gm9aE0Qgd6YmyIbk9BOCGJMnoZgchng0=
X-Received: by 2002:a81:a184:0:b0:5d3:b71b:4d30 with SMTP id
 y126-20020a81a184000000b005d3b71b4d30mr3497574ywg.17.1701439541650; Fri, 01
 Dec 2023 06:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Dec 2023 15:05:30 +0100
Message-ID: <CACRpkdZAriTP3iOgmwvoAH-3-aO_ugoEkBHE7mHH5YLxhMXSXg@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_060545_682272_0D19ADA9 
X-CRM114-Status: UNSURE (   9.66  )
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

On Wed, Nov 29, 2023 at 5:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The struct group_desc has a lot of duplication with struct pingroup.
> Deduplicate that by embeddind the latter in the former and convert
> users.
>
> Linus, assuming everything is fine, I can push this to my tree.
> Or you can apply it (assumming all CIs and people are happy with
> the series).

I applied the series to devel so we get some rotation in linux-next,
augmenting the relevant commit messages as discussed!

Yours,
Linus Walleij

