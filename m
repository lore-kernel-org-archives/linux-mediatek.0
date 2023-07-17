Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D2EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7I8tWuOCSAKoVEcr3ABsrBviosGy8IVjZCqtWlU4uYU=; b=Pq2PS44Lvyi2qpj3OQdYofWh0k
	sazOtE5e++F3L7mbMf5qlfQ9pDON8hfL8tHT1myBP9svlhrUBeUeL5lqQYr09nNEH4IJeKrORCtUI
	y8yR+DeFKteawLx3I+LT4Ukgd06QsZ0IChKhtGnnVWBPFPtypG35uVGjK+3SaXC284KtS+owjtlt4
	eptNW8dgU5/6JQebSrNnCm91SJPomWyA1jEI+crYMxF6Q0CKMrrEaDkiLb+hOtiNahlD5fdWhrcoA
	B+9UjnO3zk4NC7QtarlbL4atqcAhlkM8fLAiFDIyWTXBBmGP2M0UcbbWJB0J4r1hW9/MndQHkl+VB
	Kjc85qFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Lo-006Gs7-1P;
	Wed, 19 Jul 2023 08:16:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Ln-006Gr1-1X;
	Wed, 19 Jul 2023 08:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7I8tWuOCSAKoVEcr3ABsrBviosGy8IVjZCqtWlU4uYU=; b=FT7FxMWJHJUO2/zSN2nKu7f1u2
	KMU7sQ8DR1WhSRBYkUjRb3X7Jc86xWlnq6b1K4cB7cXrEkXk3Jn9nNFaxPVBZPQtNAF6oH9gs/NNQ
	Es+0fHIAT+7Sxa3IMcGRpQPx2Ur68B1X0jXiCXChK+1DYMDvwfkFY7QgwL3vg096e60495N8Umh2n
	FttXchOKfy2HnJ3g7UY42z9to9mr2qnE60G/cXuhumac+I96bZhzisctU7Miyq11zEPiTOOp2VON+
	rP0I1WS39yvEd8tWh+53W+V0O6eEz0vGcQR1ueDx7NO4Uyjvq+YQtxxLMujOkMZstQ9BEMF4likVc
	2YcvepPA==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLU43-009FOq-11;
	Mon, 17 Jul 2023 19:39:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-986d8332f50so643048166b.0;
        Mon, 17 Jul 2023 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689622630; x=1692214630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7I8tWuOCSAKoVEcr3ABsrBviosGy8IVjZCqtWlU4uYU=;
        b=Xn8/9u6umMxdhgyMQrkVzTfwZbVc3CSoo01rUE0MOFuZoIqDsjCe35rMOqsc7u/U8d
         NgZ/n//yzSKJwZYlQauLDrzecOJpB+a2wLgqD7B5FU1EKRQhzucEFmSjIs4nAHGqREW0
         h4VYQ/1Mtq86XhqjxCqWBQrdZoeE5Gm7kVnZ48vJViIi6zgBhcxXbika88j9GZjxVDiP
         x9zH4ECmS8gWniDjEp2Xyomj9lyBEQ6q1xY/m8CzhsMrmzmMTgZMDg2jWnO1udo1/blr
         KQHhAFB8ZoCE9oS0c4M7xQaZLYfHNhCH9ulj2RCcRz5KJQV3TP0EKRRMUfw0uw0OZJKG
         dlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622630; x=1692214630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7I8tWuOCSAKoVEcr3ABsrBviosGy8IVjZCqtWlU4uYU=;
        b=OuMNE9I/eqNFV3Ua+cjynwIiu864Myi1uLNaOizyWNgeB8d5/130lXKeZ2rUIciUI7
         kNPYsx5TEsw2fhhYxeh+yQNcTgAWhHWjZXLzWnFKVS/qrLGDukzy6nlRVPiAckCbXnqS
         Qrg3JZOsdcQs7uUQ4GuJRdvr4lPo80ttTLM3LgZb3XBgGFdjAhQNhiL0rhM2e4gHg9f8
         Cb44lh0ADIsjyh+VmJ0YpmgJKVHeuhD2ojnYg0dyIx82xanNvYu93P6jjlqbQGprAwtI
         U3YbXHMpiRR7X8Vdb/QpbaHTbBq6lljkfgQxOL98DLoxzEwy8TNHbzAcevTlART91gKF
         0kBw==
X-Gm-Message-State: ABy/qLbAs1/G+FexGH1PNMzDcTx2INliOMighftbDr4fYCDq1AZ3BUkr
	uQM6OPmnyu/SlXaWraEZXlw3o3ybN64/WJ7qQRE=
X-Google-Smtp-Source: APBJJlEDMaQglJp0zHLnSAANuJWSE2xOez2T+ELk8R/+NG+8JrC1cfjD9INONXiEfrURSQaDOsm7LxITDgeIeKE9KAI=
X-Received: by 2002:a17:907:3c1e:b0:993:d6e8:2381 with SMTP id
 gh30-20020a1709073c1e00b00993d6e82381mr10091030ejc.23.1689622630101; Mon, 17
 Jul 2023 12:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-8-andriy.shevchenko@linux.intel.com> <f48a35d596694839665bc5883260cbae3ae01d9c.camel@crapouillou.net>
In-Reply-To: <f48a35d596694839665bc5883260cbae3ae01d9c.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jul 2023 22:36:33 +0300
Message-ID: <CAHp75VfSd6giH0Hvt4m_cai5+qhhBfMa6R0fDhzpN4U7WxYzSw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: mediatek: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Paul Cercueil <paul@crapouillou.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_203926_669539_D393743D 
X-CRM114-Status: GOOD (  10.19  )
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

On Mon, Jul 17, 2023 at 10:07=E2=80=AFPM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
 :

...

> > +DEFINE_NOIRQ_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops, mtk_paris_suspend,
> > mtk_paris_resume);
>
> It's a bit more work, but I think you should use EXPORT_GPL_DEV_PM_OPS
> (or even better, EXPORT_NS_GPL_DEV_PM_OPS) so that the dev_pm_ops is
> conditionally exported. All callers would have to be updated to use
> pm_ptr().

Why pm_ptr()? What did I miss?
The rest is OK.

--=20
With Best Regards,
Andy Shevchenko

