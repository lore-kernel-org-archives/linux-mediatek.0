Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB95C369B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=; b=gXCesFDrVfjPdiD1Gn0zqr26VT
	iA3u4U4EiJW0dFGz1A1H/I+9UQkjK3bz1ofcUI0zc/deHj1L4OzGOUkHm6+JrTie0NTbcY3pdYrJ8
	NWiNWMTuD3qBwPCG5vBdL4tg8C+tYJrSpG25Ijvq0EQFJrT/JkGD0x+G2VFJY1oJ5r3prkgNTCPSo
	G+NgcDDaNlraWM0fi8ZHMyYyy7jCOih8rTDrcQfx+SMWt22FsKVy5vH9rd3WnFyUm8lHxe501gWqA
	C5rR0DkUh/Qe8HS0P/pDL893UNQnR28/NSHxOidSqFsFXgWPb69mth/H280PRiZ13fYHiq+X/+sXm
	D1n4kPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xFk-00000008cuL-2auW;
	Wed, 16 Apr 2025 07:32:12 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xDW-00000008cUQ-0HOO
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 07:29:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54addb5a139so7195863e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788592; x=1745393392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
        b=qOkQqmKAG7j1+0XdwLHQj3xlj1tCW16HwdHoRpdbEzTchiDnQ7NWjcy8pl+aXzRUEF
         N+zz1zY/wnAE5vn2M+xKdiRrx10SzPBEj2OKHEIi5n0quOp4gSIHv61RZBp1Y6lP27Tv
         FWDv7j3pJ8ELZ0i5ni9pKzHo0XCZJ4ytSACwra5oY5Jig7GBjF/qpMXLDlmG6ZpzxwiT
         p8FxGaZ5Owq1DfSIEYYkj2YcpUHs4wkYSLtgSex56IJficECkesHcWTZPA/1SKxRO1Ku
         ldx7BP1Dqyq/XJ0WC06Lc1oFd/vV9F98WLhXPNGvJA81hnoiE0kiolg9KKDpGO1PG1ni
         8Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788592; x=1745393392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
        b=pdw8C6felvc1X9PsvrDU11PoyW9GgihBhDE9vXXQhwEhD9SuAJKVnqfNZX/ASnMIhu
         rRmp6SWCg6ek25wL4gGPBJrrnffpgTYyQ/IK6cjbWJAqfuYyg9GklfBwmXyIH7mT9MML
         h925DQwTcDCgkb0lixgvgm0NzeIhP6MisKWqg2c8gWy14+KRtTC3rURWT3lp6Fi66S1s
         pKRl0tp8khF47fCrDZep4Qun86VeCd5ZTDna5jb/02q7I0rc+MTwt2Mq5I8G6+v6rDh5
         cfS6RJyDeAsPhmkKT6/2eoXsZjaSVPU1wgYz8wONrFCZAJufjVhk/84miS550EB7kWab
         fsVg==
X-Forwarded-Encrypted: i=1; AJvYcCXC6O8N+wtTAYxMFEklxNTUYimDvvo5oUqr7JLC+90J8RIGfzo5sV+/6zugInX3EkQccGrtTHMdQlfI308gJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLd+uzgFyVpibYqRsMsesGc4b3e0VU2VOH60O48Cc3TVyqtdxV
	7qybr6DLM0g2cC9VODpfV0Xx4rlCBi1Pn2rt7qybE9q3UfGSYMjNGoEZ1pmyvn3nXHhWaLMPBhl
	i4sDISsOxxeSATfpC5Gg6JLdv59bc87SYoAa0Fg==
X-Gm-Gg: ASbGncsTdc1uW/U4waiYrGQMRYU1nPx7d/sajD0FkcU4idScCERjkSMhhK4aILhGofj
	aDhsihi/+Qqu0nGDAymh3I82ksR/uuQkheTZXMEUIbYdGE/rHefDSjImuzd0d5k/HmXqKPvUdcc
	RujA0T8l+GuqO16/KLMhWhyw==
X-Google-Smtp-Source: AGHT+IFIpyoa4b37GuE7bShcO/RCUjBlfmU/mTjYO4extyxyEAUNDPyqKbiJFcyUDnd++AOe+MPmtXvLY9f9jwMpHVM=
X-Received: by 2002:a05:6512:108e:b0:54a:c835:cc4b with SMTP id
 2adb3069b0e04-54d64aea449mr196703e87.45.1744788592107; Wed, 16 Apr 2025
 00:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250415112339.2385454-1-wenst@chromium.org>
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:29:41 +0200
X-Gm-Features: ATxdqUGsaRj7mRwORGwu-YQfJxqBlwgA7akp1LopdnGat1Af2KKfApGkes9E8jA
Message-ID: <CACRpkda0HVd1auh1zmyX8QdDCL6jNVb+JYj7hbZrdg+v26BQWw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_002954_106903_5550BD4D 
X-CRM114-Status: UNSURE (   9.79  )
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

On Tue, Apr 15, 2025 at 1:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
>
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
>
> Reported-by: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoa=
kqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied for fixes.

Yours,
Linus Walleij

