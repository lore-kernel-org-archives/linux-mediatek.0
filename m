Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD0FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=; b=EVatgJsIQggWuu6WdyjrKcO1Zm
	CsseexPJgOY4BRt5MhW+DDuvDi2RrzN590IJTq/OEg2cpD9nGdTFxcdsJih5mkg2tY2zQIfnWEaS3
	hNSApy5eb7FwC1n36+wVT+IXp8QkvfwFX22qWMVAD6cO4YuqdGgbDHjzlwT2cqzU7ygB7h1NDZph9
	twrC808oGggYunuHb7xcyM/RR25Zxnr6R42vQ+My28Ks28+aWq5yghEO92uYtuZ8Jp9A/GzQU1ihH
	eafPatgCtSSU0nCNpfP24p4h7xhSDmp99ufZuOwjcDCTCRdIJTTVLZa5rCfgz+kgtbteDfl9uaGDl
	QlBTcnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwSK-00E98y-PF; Wed, 22 Feb 2023 21:15:16 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwSE-00E96V-Tn; Wed, 22 Feb 2023 21:15:12 +0000
Received: by mail-ed1-x533.google.com with SMTP id eg37so32060472edb.12;
        Wed, 22 Feb 2023 13:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
        b=Y95tEBQTvJnja0wiaBFlONHEPFFpg4E5Aidd7Wxu88GO6+Efw9s32CSm6Qrv+mXXKE
         i5+x1nQprf7tfF0IcJzKPjG26LQSm8lVS+CQndNmsIeuLxTz3Zws+u23ldaG3K54+WIL
         IKeo6NJCJ7WchtpfymyIpeNWai8L7kAy3lwcxu51e9DNdYZrZ0f3D1Sw8ivAk+CfDKS3
         Ek4oq62+5hOyx3h0ySU4oZmDiESIURoGhUvHFCUOXpdaqhWIldAEFOJmG9Rfku2zdt2S
         XHD98cqCLTBp5a+c55IWJPbpd06egfIFbD37YQMjJACS4ZlT8leLyYR4DAvtMaXLTN/X
         IY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
        b=ESzvGo2YbvD9LkdPZngcUgPHxKJHJ11ML7/WfBdKFcxFjShY0Cg7AHlZ+t5/7ZkBRO
         bRgczKqzjlpebS6eCV6yaDCjdwuwmw8hbJUhwhDoFM4EbfEHf6MdWrD93vGGv38vVCNw
         Pt8ABVBZyiVcx5NObesb1koQjM6Z7iICBI2I6CofEKzQNmlnyopcSNdocw2hhHKWbmVM
         Wj0sRZw86o2KEUrEd+dkZYA/VnKwMzW2JdWTvw9Yya/MBCOMHTGl/nSODbYojH0aSTOs
         LTef2Wz9WItTcVQd/d7966NXo54PTBwopnF2mLx9oMkChnXe/MS1FnuMKpA2l70azBxJ
         jLoA==
X-Gm-Message-State: AO0yUKVu+6q8GGYg54UdQxtMYeLW6Y4q1xtF/XYb0p7x+Ghd9pNDjpvt
	uK6eP+6iWbJvoDPsVbgL+SI30gkqRESBAm3PyZ0=
X-Google-Smtp-Source: AK7set8TXb46bTmDPfzW/xczn6QfGU7MdMXPRf/CaO6cyWdNx+3X84yvibHTXzLWWA/EAH5iiZY+OShEAAHjsEGwRMc=
X-Received: by 2002:a50:f611:0:b0:4ac:b7c1:9109 with SMTP id
 c17-20020a50f611000000b004acb7c19109mr4476929edn.6.1677100506156; Wed, 22 Feb
 2023 13:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20230221145021.31993-1-zajec5@gmail.com> <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
 <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
In-Reply-To: <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Feb 2023 22:14:55 +0100
Message-ID: <CAFBinCDcDYtdOdikc2ieXjRUkrjgwNKaPYvYZb_v84gh66q=bw@mail.gmail.com>
Subject: Re: [PATCH] nvmem: add explicit config option to read OF fixed cells
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rtc@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_131510_988749_858D027B 
X-CRM114-Status: GOOD (  23.40  )
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

Hello Rafa=C5=82,

On Tue, Feb 21, 2023 at 11:29 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
[...]
> > I am not familiar with the recent changes around dynamic cells.
> > Is there any discussion/summary that I can read to get up to speed?
>
> Some NVMEM devices don't store specific data at hardcoded offsets. For
> such devices we have drivers (to become: layouts) that parse their magic
> content. They discover cells and register them and provide matching with
> proper DT nodes.
>
> For bindings see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D084973e944bec21804f8afb0515b25434438699a
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da607a850ba1fa966cbb035544c1588e24a6307df
>
> For example driver see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D6e977eaa8280e957b87904b536661550f2a6b3e8
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D207775f7e17b8fd0426a2ac4a5b81e4e1d71849e
>
> For usage see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc8442f0fb09ca3d842b9b23d1d0650f649fd10f8
Thanks, that makes things clearer for me!

> > My main thought is: if there are many "fixed OF cells" implementations
> > and only a few "dynamic" ones - does it make sense to flip the logic
> > and introduce a new "use_dynamic_of_cells" flag instead?
>
> The problem is that there are more cases than just two. We can have:
> 1. No cells at all
> 2. Fixed cells in DT
> 3. Dynamic cells with references in DT
> 4. Driver specified cells (specified within config)
> 5. Cells defined in a global table
>
> So we need to reference DT cells explicitly (we can't just confirm /
> deny *dynamic* cells).
>
> Another solution would be to have "no_fixed_of_cells" but:
>
> 1. Personally I think negation is less clear / easy to follow
>
> 2. There may be actually more drivers with no fixed cells.
> I think I modified 18 drivers. It seems devm_nvmem_register() is
> referenced in 44 places. Few of them may be not actual users but it
> still seems to be about equal.
Thanks for this overview of all the special cases. Please add my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
for the following two drivers:
- drivers/nvmem/meson-efuse.c
- drivers/nvmem/meson-mx-efuse.c


Best regards,
Martin

