Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E7EE49A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ozTPMOCGjgHLaJa54zNz+3htX4e52MyhqXdip941jo=; b=f+K+vGsQpVzhKcv5SZfUE8qLNh
	//c4GYMFhjaD0hoiQCfws3W9/6e8dh6/gGrpJ/EloK1EA/LqFW/ky7e/NHo3K0o+hJZ0I/8a72y2c
	RwRf76OYlBZaWR+w+IHx4n/wuRXvejH/PFzkDXF+iZP7NsLQrolNjArV9jqsv/DQ1SUnnmRI1btxX
	xjzamzcw5wdRzhkBLVqBckGJb4AbBPp+HGk2l5N4lmvyH9a25F/2xZYqEZ5s7GIypJGUCrVgfjoh9
	mTVQlGqdlWIEld4v7im0sVB7XB+ynpj6wx3tt4O0wDnunBd8g6X4yBHh/xxaRj2nofk5WOuYWKsE1
	H/NQV+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmQj-000U8q-19;
	Wed, 23 Aug 2023 11:53:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmQg-000U7W-0L;
	Wed, 23 Aug 2023 11:53:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91350660DC;
	Wed, 23 Aug 2023 11:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A96BC43397;
	Wed, 23 Aug 2023 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692791620;
	bh=9ozTPMOCGjgHLaJa54zNz+3htX4e52MyhqXdip941jo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l24jGUE83dTC5LIpesTj/6es0p1WS7ylU3MUON3FJiuoWQxxRCjlR5z3wIFk4K+oU
	 K2AWIcTPkmDsluBNADDyBlpMDLA8Rp+uKKqJoCHs0avzOBmXGyOqYqn+BCh16bjUI2
	 hvhq9h51Ry+gIiCJSOxxraYuuki2GsBa0J1eiiJ7gXumwLCguGvREwpTyW9YV+YEk7
	 dNwAKeoP3UDdpi+bdNOnHPI9JPaBhU60YEN1dK+7znlOZ/CRo/Tve9mIsDAErxAZ59
	 jKyyPyla2DIuaYkyUmtM5hqQ6DDKwQ7Gc/a1lvWnat8Yxav7r0p1B08W1yk1QFolNU
	 SsschzuYYGj6A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso85186531fa.3;
        Wed, 23 Aug 2023 04:53:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJA7qKFeD7jcJdfpmsNL0rILInXtDgZ6W/lLws//CT9lja+Qe2
	eJxF/PG0LmmWyhQSsdXPe2queHXV3SKOYH/dlw==
X-Google-Smtp-Source: AGHT+IG6AYWn2ZBtqiggebw0M0LEoLpjEjEkmAuyxGb6SqXHXb0v7iaIhaSPWuqzMe7IxI9zjdhMNEvmSNHymSTc/JA=
X-Received: by 2002:a2e:7008:0:b0:2bc:d8fd:13df with SMTP id
 l8-20020a2e7008000000b002bcd8fd13dfmr2086615ljc.41.1692791617967; Wed, 23 Aug
 2023 04:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174702.4059100-1-robh@kernel.org> <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
In-Reply-To: <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Aug 2023 06:53:25 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+EbxHkdXEJsgAETrQj8Ps30umOMcArt1fCaNumxBem5A@mail.gmail.com>
Message-ID: <CAL_Jsq+EbxHkdXEJsgAETrQj8Ps30umOMcArt1fCaNumxBem5A@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Explicitly include correct DT includes
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_045342_229377_EC358237 
X-CRM114-Status: GOOD (  15.61  )
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

On Tue, Aug 22, 2023 at 6:05=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Fri, Jul 14, 2023 at 12:47=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> I thought I was to pick the patch. But I see you intend to do it. Np.

No, please apply it.

Thanks,
Rob

>
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
>
> thanks

