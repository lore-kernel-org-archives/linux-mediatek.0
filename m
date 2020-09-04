Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935A4C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 21:54:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CA72087C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 21:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gY+VI9E2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HLrVQ6tZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2CA72087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=39amgWAY92wv+K3R0gIEerku69mY/V/ln3HJAd2yVAU=; b=gY+VI9E2l5zrLlf8ybp/U/Lto
	FtqHgFplvCPXiJzddYHUhQd+GkTUE326k6ny4JSDFS9YRye6QmWnpV0MhRnjrc+wZLyyp2u7oUh9G
	93qr/AeuSWj3lEEWc+yxmmLFKh+86Eujh0N89tlcHl0+tTZDETusOLNkFf3fcI1LX8YLWq8AUXssK
	vaf6bwRsT4TPK6E+hydDLcMLaLpXkMVD8fGoUPMibdtWk4dfh9Jdr8eNX0gbUwaDDu1zF5qRXyyEx
	uQSrDzjy82v59rmN93aTXFJaIqTbnCFDPKHHusAZ7oOLZnig83PeGGE6h2zHtMLSXlyW/lxRXCX5f
	pY9kVAXKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEJea-00013P-GK; Fri, 04 Sep 2020 21:53:52 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEJeU-00012J-IC; Fri, 04 Sep 2020 21:53:47 +0000
Received: by mail-ej1-x643.google.com with SMTP id lo4so10460156ejb.8;
 Fri, 04 Sep 2020 14:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kOwVSLuqcLcRrAi0V+2JGPo0oopvFB+z94xUxkMesDk=;
 b=HLrVQ6tZkH1co3Lk465rPx2SlpB/uLObbOIcPvHSfCBwts/RQPF5CgGMNVmaj4MK7Z
 hM8rOxprckSExPV5UPi7iGwtTkKCeM9VcF0yHBShpNJCY60GZi/vbqRtRSXqV1ACMDT8
 DAJBNlz6YQZ9CbDc/ZsqOsrIxoHl0OZTb6+iUz1GGtXvXNWF+7yt1hyGvxryzDo4yD9P
 VogwbEuV/nXAY5Ty008NE1BhuUF/CXyxYxw+Q1Lk38iuluHt+aaRVah6X/m3nqGbew/E
 imoF2TxEmXdyebzAbdOysU/Nm4D4BZ88c4km1sm+ZxUh5los1kSJlEWtNVdMaSmrcoa3
 Iqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kOwVSLuqcLcRrAi0V+2JGPo0oopvFB+z94xUxkMesDk=;
 b=dmW1gQNyp4gW/kCvFS5UDnSRojzW4NN+PMksmLUfD5OGklz42XwQLZV8zdBgMjf/Fb
 SR/NXJ+MuRun+Nb6sEklLxefFRnqiv3XbZOnup8cKxFLj5DXwy/eAFMKNnsBDkRXdq20
 WqIj8vJKK5w+lSaq+f5wnbO31lUMGqcuhcHi0mKM7J0+KLoTsvlitwfE5DzOuU7m8l6F
 dzAiUu8h5AYcGhAcmNnkf3REoD61/ipsvILoakZYtKPZhR+tFWPhbIFzdI53n6dLQoMK
 3ZcDHbBtzNf/jlRet4OcKhN/gxfbvDro1Z9hkhfKOcydg6/KmI3rIBJMlju0fzyLdV6D
 uQ7Q==
X-Gm-Message-State: AOAM530gdrP7ZuLDGjdFCPASYmexmkbHzg1EqZ3CxBiLe1gbsvykcS2Y
 zaNtMev3wEnn1XxI7sU37cy4eEUvTN3UNbUHamU=
X-Google-Smtp-Source: ABdhPJzvZdR4PefRtIkw7lE/tNoQ9kzV/q7D1Napwk+pHgOuj3FJd4E/vlUR+sMicupDfupaIit4ahWr1LQB95n65bo=
X-Received: by 2002:a17:906:8690:: with SMTP id
 g16mr9400161ejx.187.1599256423525; 
 Fri, 04 Sep 2020 14:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 4 Sep 2020 23:53:32 +0200
Message-ID: <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Douglas Anderson <dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_175346_655706_FA47772D 
X-CRM114-Status: GOOD (  16.18  )
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
 Sascha Hauer <s.hauer@pengutronix.de>, swboyd@chromium.org,
 Lars Persson <lars.persson@axis.com>, linux-omap@vger.kernel.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
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
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Patrice Chotard <patrice.chotard@st.com>,
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
 Adrian Hunter <adrian.hunter@intel.com>, Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>,
 Anson Huang <Anson.Huang@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>, Vinod Koul <vkoul@kernel.org>,
 Robert Richter <rrichter@marvell.com>, Viresh Kumar <vireshk@kernel.org>,
 Jun Nie <jun.nie@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Douglas,

On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per discussion [1], it seems like it should be quite safe to turn
> on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> give it a shot.  For some discussion about this flag, see the commit
> message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe").
can this somehow change the order in which the MMC drivers end up loading?
on Amlogic SoCs we have up to three MMC controllers, some SoCs even
use two different MMC controller IPs (and therefore two different
drivers).
so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
can that change with this patch?

apologies if this has been discussed and answered anywhere


Best regards,
Martin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
