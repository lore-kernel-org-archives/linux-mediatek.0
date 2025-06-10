Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250FDC5B552
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=; b=zmDHWQngumh+un8D/aC7+6OD6P
	FKOf5Q4o3+hLnyaPbtcRFyBJ5nmvVWR3lTOgddsAsXJckXsxCD4RJ4lYMx9qXqOUt0xl+FQ6K6DLx
	z+9Tl2uBff0ecGy33lAoKrKOD1UozQ7SSv/sWVtSsddR1qlXVLtKgucddw1xL0SLfmKgKQuJHlgHw
	7VxEZlLTVcFFlk9f6zOZr/4p6XUNEMHV0aHIFMxkUUqbochxDCxI/0az9zaQJ/8bPmKBb7i0NrhUM
	193uRPhnCy6rCBJBfyAtsgCD/Ifsd0PF/XSWomMn9ErYHI7GCb6Psiq/OypfQs2K9wY4YK4+s2I6d
	s82rbW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyac-00000006s9l-34SN;
	Tue, 10 Jun 2025 13:00:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxuY-00000006kJo-2wD7
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:03 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55324062ea8so6995487e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557821; x=1750162621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=GYQW6IpewUXtN1tx1n8cCgxD2Qpj9wdsvpx4HO6yAZZIX3H25+rpBEM7pMNO+6rmFw
         bum/KaE1dpvpyajmh/85dN7Fq+kDbMw9g8SmrHnY9CA8tMVSTks7natnKoxznnPThBy1
         XNJiH+TWOCSfvSpPWtPvfl3KN/9M9XkPzRpo8sMKSA1tOkt03BldOufRp9/tyLZt6dkP
         cc3QzVOF9xzYMaLpyh/412bqEx9U8wtAivhSFzFe+ztAuaEl1YVSEiyXaxtlvQMZgPSY
         j0ERoQ1bmCihlnhSSueyBnFCnN2YKrkUVx2RLktYWI+xlsebsczZo1A1qV8a1l3xmCyr
         yCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557821; x=1750162621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=xTuW0ywFeLUCRbDVzmoKZPfteb0ejHIB6a7cBryvRn3DNHQXYOkFbR6fuE4RrspHAd
         41gSwBHgfjjx5NeSlB6V/3vz32L3+q9kAgb4TIyl2r8K6xlBKJ8mo235XaFRcJ/yic1z
         jDDYLIq4b2mD33OCS2jh1zojfc6/KRvWtIQ1PHu0H6JuYtxEI/Hu7Rqlqqf89SQ9x8Hn
         qvK5nwKTbbyGumo2D6wuC9RJkC2dlW1OpPdG/zAbPIWS97OAT/Kf2Z16L6dlXxu05gy+
         +5OzHPNBUpjE58JMnGiF6zNEbIlUK9fe2u8lHx0V8qn1VnfWtjRjvDNvEv+LzTxvEgIO
         cE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2avUw5DHDJ1emtM6QJSF/92PFQy2tV4DFlT4VTLd8P2NfVz0uTkZt9pK/UW7UiNfh20/gA1fOL+4yCGmKyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZQudQLuAEnwE/EtjC7Nhv79DdeGKelV4j8uRcfw13fj3q7IAh
	ydj1Acw5pgBJERGoC/sMeRvjKM7T5RDt7gu/m31ZFAhr8bU6fLgLOzNwuykAMq4anU4EY139yg7
	XRR/+imRRmlSqnrBmPXvNaePGyukDPYs8CAd1GeYz9Q==
X-Gm-Gg: ASbGncueRdOjp3EtLXbAeuBZTMFEOFlYLePkYAok+66cYvzL7JlIweuVA7ytFed7Ou/
	6M/U+SEyGadDPkfmIrGn/Gm1/v4DU8kT2dowFP4nF9DB3YjiIY/UTaVnNzNLYtp1ADVcyA+P6uk
	AIJ2BzwYw6p2PmGRpUAB6A1QVDQDJ3NuZDXA+7BCw6EzhEZYw2FDSYoQ==
X-Google-Smtp-Source: AGHT+IFQxMti2+Q8Uenwhc0/S6UdaliHxGCkJGgDod8emAA4asQK/90KUnu0JtAhA4sI4nKXBC2mhVRJZkpkWFN1Jcw=
X-Received: by 2002:a05:651c:2211:b0:32a:8591:66a9 with SMTP id
 38308e7fff4ca-32adfbb0c50mr43449421fa.6.1749557820819; Tue, 10 Jun 2025
 05:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:16:49 +0200
X-Gm-Features: AX0GCFuA2Dfvx1J77MshD7Tzhu9rwDlijvkgXfC-wltdCoDdq-4uVh1ABAKFvmw
Message-ID: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
Subject: Re: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
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
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051702_746998_E4843A9C 
X-CRM114-Status: UNSURE (   8.61  )
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

Hi Krzysztof,

On Wed, May 28, 2025 at 12:41=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.

will you rebase this series on v6.16-rc1, fix the snags and send a new vers=
ion?
It's all nice cleanups so it'd be great to just merge this.

Yours,
Linus Walleij

