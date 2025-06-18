Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFB6C7115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=; b=VL12LsBgtcnOfOeh4DGspjRJ1v
	eEjhdFSNniruOsFwRude5oXQSPa+aB9DSDE1P1z/NbBG3j+zO7iy7NdAv9Lqz6wNrvKuR6Fmtuefp
	prRYhYBZI7lzAilErgxxhLPq2d9I94uOAWpUgYm1jYh75nF2SEEBzHPKDldiAqtmlImZaP3UP8u5i
	FnEj4r/6v8P+TVo9nklW4SokmiRp03Dj93e0wo+U3MNXmFRTc4xH3Z9LA9oueZUt98s2bPBJ4Og2Q
	V4odINC0Iu5a8k8zK89y9A+v8AocIIDSgxQVC3YPYIa52LSNEMkjzvWpvNYpcjarWdnskq2prxK6C
	1TEr6EOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsUT-0000000AE9l-1I3D;
	Wed, 18 Jun 2025 13:06:09 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqws-00000009vs4-03sl
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Jun 2025 11:27:24 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54b10594812so7023436e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jun 2025 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246040; x=1750850840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=pZiZPQBX8EJE7nz32SiRxA/TOBcim3s9/WCTO7cPUh8Q2MqJKj0tv38M7DRF34lx/A
         JUI2JhN9tJEOFLeP6/YP/HGiqcp6qYyVifBm8RvI5IBSburIFWvC16EMwp8cFgF60eCu
         X3EENXPsATqCG7U/fmoRJmFsHuoZEeiK3/Os28Hj5NiadA2SYQfnG1Vxi8KNsgkMEMYR
         O8ogZn3IzBeYQSBMGCq3/GjEF2aUJWJzXTw+/KQQYG56xVrexe2k9IwNEz2iveTgAdBe
         Jm+irj5tp+Zm3Sb1hSKYNF/YZMxhOc5QGHMPnuV2n+9iEBkXdixVMupsdC6lrmpnOXGU
         EO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246040; x=1750850840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=b5zmB83m8JjwfgJ6z96o3MIZRMAHjkgAZzxfza9tZjckXUqmzXZkeDp2ex46k8N+y8
         XVxKzq7J9gXduSbH7EO6NYZlbMfaZy9I4oo4EL2Tqz0EC09v2JsipgjGDm/+wDe9Z3K3
         xighJcw16WVpmJD3MOLgUmDLwtHMAzfuUiToTd9UniLrjXMdfz2NJoIWUwos3J6X5H3/
         EYMQQUhnXjskhQKPHYODO+GtIO81aFUTGzMCf1pFAetJdRfbyUg2/xTNZI4kvcNS0NHK
         EytMdw1GhUgF2bN0Eb/1BH3yeXtEimVhpmILUf4kQm5nGxXWv9aLb0XeC3s+jISkt3Ui
         nnWw==
X-Forwarded-Encrypted: i=1; AJvYcCW1x3AJ0GR1OzIz0C8RNr+muMaruHN8aNVgPADfbKGGy1K85+g6uyfc4b+R/bDu5bMrWsvd4GdwbVHvfLm0QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4NJm/KIfIqQBVzDT24f/QaX5/aRFFWFUyzXKwzZNZEJ4oOuDs
	50kuyoX4TR3svrY1cF/tdN5rOsxXjstZfBF4t/DYK41SJaiajs3tXY2zilCxFE8P2pmCaCkymew
	RfXyoLtrcQ+Rxw94As1ZvTTE4iMW8lBtIbyyXLHNrWg==
X-Gm-Gg: ASbGncsroctRsiorEQjj7rAjxPdK19lTPbf3kXGlYyBkOHEXxbSpRMN3un4CKfAnCkj
	bPEUkyqT3aCE4WyUb3+mtu+aReUmQ+QVJkoJoCFOXiHfhlhYYYvChzkgKIfNG+gDS1cAbmISQM3
	2LmZ8MWCuoJglHtt3lZNxtFeighDJQEPvjUA/TF9mBHuU=
X-Google-Smtp-Source: AGHT+IH9N3s8eV4QAoWcV3ZISC8T6rNpJ4leRaY7YHuJFlZ4bPXaxx7Hzh/4jfbIVAzp1tapzbe+4WLXZFpaeF/7BEk=
X-Received: by 2002:a05:6512:39c8:b0:553:2bf7:77ac with SMTP id
 2adb3069b0e04-553b6f15af6mr5016567e87.41.1750246040209; Wed, 18 Jun 2025
 04:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:27:09 +0200
X-Gm-Features: AX0GCFuhKOslIDouO5PgG3-FBiOJa3cs6VfF8AgbesblIRkK52-2f8uLA9uvwos
Message-ID: <CACRpkdb1YqS00tEeyAUTjjJ-EQQbH5wfE8QzZt-UFwQYCfNHRg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_042722_065368_0295B3F8 
X-CRM114-Status: GOOD (  10.24  )
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

On Wed, Jun 11, 2025 at 8:14=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Changes in v2:
> - Add Rb tags
> - Patch #1: rephrase commit msg (Geert)
> - Patch #2: fix/require dependency on OF
> - Link to v1: https://lore.kernel.org/r/20250528-pinctrl-const-desc-v1-0-=
76fe97899945@linaro.org
>
> Description:
> ------------
> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.
>
> Dependencies/merging:
> ---------------------
> Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
> prerequisite for all further patches, including RTC patch, therefore
> probably everything should be via main pinctrl tree.

Patches applied!

Yours,
Linus Walleij

