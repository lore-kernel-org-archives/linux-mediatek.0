Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE1DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb5BPO4Y+9G3ein06+iQjj8mgQS/6wAsLzGRU0S9TDs=; b=W+Fc/4+QrVaozF93eRCL6sRF2q
	19//b56BbAb0Jv0C0WROXNRYbeJt1JOa/WkmZeXfO3Z/IL54Dj4/ZsgJ7haOGT5VBHQm679rp6FLo
	eDkKLusdi3q4hsG87ptBNJrEvhdAqWwRHZpHTcuAXiG8biau5OD9rOHziMVA7CzDw8/cORghJVPBH
	Gns20/j06YPsTicvHCmYTZfqXeWVirLSEtQq980gLMfnQeI7iq84EjC3ong6w8dDV5hDDtRdwaZNm
	xw2p+/yjlw7rORuXIuYLJnfaYTyZ2FUy9hd7w9oTLXYmgZ6Z+h2iVlHEJJ4O+2c+c8eNGcTke2mxa
	V+7AuyhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9RqZ-00GKTC-KU; Thu, 07 Jul 2022 13:47:11 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9RqW-00GKRX-Lc
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 13:47:09 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 136so792217ybl.5
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Jul 2022 06:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cb5BPO4Y+9G3ein06+iQjj8mgQS/6wAsLzGRU0S9TDs=;
        b=C5ExqJkULBLoSw11dpTvVl75U6NGIIk5Oq2fJRmtWkBps1PTAGcKm00bvNywN6iXoa
         8I8K6JXmyEZfiPj//h6Fpvarvsw7l6ooeemkQlZuRYne75Pwm4PXwOG25ZDvgTrhdinq
         DAIr0bzEmrP3K4w9Yd7KaXATLP+IApD38FdkiPdFAklsQLZGJATpFP7PIQ4H64tQF1hA
         JOIo5KTj3Wp9YHbZ26o0CdGFkFENNOcZSeKJuA/jTs+avfU33ZfNLDQhoCf3fHF05lFW
         d2lmoZ2o0o0Y1L/JH1CBYwVMrmuzYySaUav7qOXNqxhG187XiZ+XWfL5qbLrzvz/TiKU
         Z+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cb5BPO4Y+9G3ein06+iQjj8mgQS/6wAsLzGRU0S9TDs=;
        b=ufVAX7+AfGjVJ6XQn5SEyMpM5ZKaG/WrC3YMujtU5QPLn2U3di4+TP71YNxeKf1Ux0
         svfTAf5h1DTriGOEncWslw+F0U2iy5rZxibXe4Sr1qygITBZ3w87ILZ9pWLIgVR/R/RY
         AzkSp6HDYjWNYTAqjEKbj5PPhsGjgsYYpKR4PrvT+6XIaaLhm0DNUtjM0AtDkmiexxwU
         mKZbyr3ETRdFusrbjM3KiiWVPm79PtYbsGB9hpMD0fIsuKZt2UTGCJ3t279dcwJ96eA0
         WSKjB+SqHeIyQehhu/Z9KAlOHbvQY1/Cy89ALA1Wcjarn5zh9kAv+cz1+ktaqfHlFnXe
         0cPA==
X-Gm-Message-State: AJIora943Ib88QQAiNjAPP3RpoKxcukpdAfmkxTd3hLjeF4EVypfStby
	OSa07U2n6kZlhul95gqs6ruE8L2fUL++3OkrLPjjjg==
X-Google-Smtp-Source: AGRyM1uvQ0cQJty2FzAW4FeDdGQz6QaZTV3BooLcLf0wn4LKyRX+g6NzcH2vD+4rygvTxGUCIropcgNBlA+8Fh01ehE=
X-Received: by 2002:a25:6cc5:0:b0:66e:6606:74fe with SMTP id
 h188-20020a256cc5000000b0066e660674femr20004122ybc.291.1657201626136; Thu, 07
 Jul 2022 06:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk> <CACRpkda3tdo0q2xZGrAO2b6Pef-Pt2GV0VyVam1uFKotk4iXKA@mail.gmail.com>
In-Reply-To: <CACRpkda3tdo0q2xZGrAO2b6Pef-Pt2GV0VyVam1uFKotk4iXKA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Jul 2022 15:46:54 +0200
Message-ID: <CACRpkdZgdwvgx6j8LVDW+z0sHL8uzxqDUaNZxRv--jbKVhA0PQ@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v2 0/5] net: dsa: always use phylink
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
	DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, George McCollister <george.mccollister@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Landen Chao <Landen.Chao@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Woojung Huh <woojung.huh@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_064708_765637_03196829 
X-CRM114-Status: GOOD (  11.38  )
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

On Thu, Jul 7, 2022 at 12:46 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> Pulled in the patch set on top of net-next and tested on the
> D-Link DIR-685 with the RTL8366RB switch with no
> regressions, so:
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>
> The plan is to enhance the phylink handling in the RTL8366RB
> on top of Russell's patch in some time.

I developed a patch like this and tested it, it works great and the DSA
core now properly configures all the links (as expected).

I will send this out once Russell's patches are finalized and merged.

Yours,
Linus Walleij

