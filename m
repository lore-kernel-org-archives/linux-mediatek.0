Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD404C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 03:58:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3490320838
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 03:58:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QK/Acvvm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaW7gHqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3490320838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eHegHV/7+kV7qLSf6q/4yF3xyTxXCCBVxDw2r/KzQYM=; b=QK/Acvvmn6JTrIxCNaSGsq6Gr
	0qxrvUi5UPgevh/SUkZ4uTOShNE1Ikz7j5e1JLIf5lJI132ZEFaHVOLN2/pcw7QiuOVi41uyhdJwj
	JNup4V1I16phqLn/21wTwTbSFGkfURmkt6pPEgSCzQnMoFESMZsSM77wyQdO3h3iOsPmG+PZ6GgAi
	0ceWOY1S8I7dQQ7TpkqONdbSnPv0UK79Tgrk41mSFX7woLGlMkkV8s7Eqs4ZsLQXdbKTgwjI4NimZ
	cWX56g0wVw791aFHrjSwQwcKqPTm9ulyAej3tuklmu2lrlnmlj4Z2yzB25Dq4IA0SjJ0Oxg0wnwdI
	oSTMnbiCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kF8Hz-0007FC-D8; Mon, 07 Sep 2020 03:57:55 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kF8Hv-0007EF-GO; Mon, 07 Sep 2020 03:57:52 +0000
Received: by mail-il1-x144.google.com with SMTP id b17so11351112ilh.4;
 Sun, 06 Sep 2020 20:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XryGHQO6eD+7cC1Y9cwOygjqKqm4eiixaACN/ogwZBw=;
 b=iaW7gHqWz2WpvCChxCdF73ymFxpKnYsvhLso+G/K+Xzvat4tBWmRqHvy4H+XRq+xcC
 GzNXQNHpL8asaEQpdBokN+92R+dXlDCsH2F1LF/7yoKSXdL0nkrW5+A+2VDPzO74hnfA
 jNtVhWXZsJoQ6VCqMUVSnL4OPdBMou/wsUmogf4xyaGOmq6+JpUf5j6Z5rsEksDTo2eG
 z83CaAElLwGG7BIvenlmDYM2ID/CUvi7QsXxm8L9JQ4cmBhBPtV+TNo6INMymTC1Ffpl
 JBeDHB7g5mZxkPFr6XtyqbpzrttmTbI0jo5rWXPDAqjCA27rzu6n3yeoCkW/Eff5K4Xx
 ut5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XryGHQO6eD+7cC1Y9cwOygjqKqm4eiixaACN/ogwZBw=;
 b=FF2mVq4ykF/zfTHZrl7Zl8E8DIDcbheVhImN7s5EsUrDnJrfszzVXAMN10k6pnrBY9
 1dS5HTzkIDiVuR7wrFNTdWOll1dxdEsUp6XLbI9V86+uYxIHxDlfUdADv84JZDNhrxJK
 JhV0l6o5tSflmbmt/Fxu+bSbb/wCrDKR7chWAPtSiyvFVP+H2XdG+owpH27H/52J+njG
 doWOVMgKH4d/lokvprwlV8qhuikt9UaGqchGLj+RIN/pvnJXmKnMT/Bo1wrNdMlK5LPS
 dQdx5ZTVmFc0+AtjncV+S/s21+GzcShDjvAlBPgJzn0c+8CqiphW1ol98eBhL/4Iuln6
 YL1g==
X-Gm-Message-State: AOAM530F0SQdSNID40J9pSFc42Yc0nGsNsCkMUsRsu3hqFFIB8itx2jY
 4oAGFjNBVGFZ6j8MgmWgZBjPju2tRvtosB1xW8U=
X-Google-Smtp-Source: ABdhPJz1j6fgFvZpCoqcXn+9m88ozc3Ql8RWA8t8El+lYPuH47iO0JlrV3Be9/8IIqCI+qgjymaiLIvmnlR3DB+JLUQ=
X-Received: by 2002:a92:4184:: with SMTP id o126mr18480584ila.6.1599451067513; 
 Sun, 06 Sep 2020 20:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
 <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
In-Reply-To: <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Sep 2020 09:27:36 +0530
Message-ID: <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_235751_570625_978A9392 
X-CRM114-Status: GOOD (  22.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Lars Persson <lars.persson@axis.com>, linux-omap@vger.kernel.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Yangtao Li <tiny.windzz@gmail.com>,
 Hu Ziji <huziji@marvell.com>, Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 Pierre Ossman <pierre@ossman.eu>, Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Douglas Anderson <dianders@chromium.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ricky Wu <ricky_wu@realtek.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Al Cooper <alcooperx@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Anson Huang <Anson.Huang@nxp.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Robert Richter <rrichter@marvell.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, swboyd@chromium.org,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>, Patrice Chotard <patrice.chotard@st.com>,
 Viresh Kumar <vireshk@kernel.org>, Jun Nie <jun.nie@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin.

On Sat, 5 Sep 2020 at 03:24, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Douglas,
>
> On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > As per discussion [1], it seems like it should be quite safe to turn
> > on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> > give it a shot.  For some discussion about this flag, see the commit
> > message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> > probe").
> can this somehow change the order in which the MMC drivers end up loading?
> on Amlogic SoCs we have up to three MMC controllers, some SoCs even
> use two different MMC controller IPs (and therefore two different
> drivers).
> so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
> can that change with this patch?
>

We could resolve this by setting up aliases for mmc nodes in the dts.

> apologies if this has been discussed and answered anywhere
>
>
> Best regards,
> Martin

Best regards
-Anand

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
