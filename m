Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF00C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 19:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZDwGaUkGBLrMyNSIpb3kLYEJV1iPNS+5Pn9t9xv6aE=; b=yxQLylVtRylwVOxpkbnsqRZel2
	+k2zkwLU+N8cPQxRNLwSOr4WfXvBYw0XslvV46RG1wYSyDiFSVMyHfb04OfxzTYKz93u58RBJQFnr
	EUB1QQsRJ2CbwofuIR75JVi+6nbrVSC4yYMbM1wBtrH5UrVvA++TVnFyBRPU1kKU1Xquv97zYbBzI
	xLWVw5dwWAMYhQSWGMrXQ7KWSdRdEL1AjbS8nbzr8sCsbLWjgL/+cleVvDlxGoSNiXxdUv2JHVxiK
	GvqmyOTBtE31su8hL9ybkNVE1QjJdL3xrn7z/73SZ77nJxdhcFTcWCtuWZsrGLKviV8uyBKSvZvro
	oTvU5Jvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHAm-00000005cwi-0iJu;
	Fri, 10 Jul 2026 19:46:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHAk-00000005cwQ-286X
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 19:46:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C2EA44021
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 19:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C781F000E9
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712766;
	bh=sZDwGaUkGBLrMyNSIpb3kLYEJV1iPNS+5Pn9t9xv6aE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HkSsEg0fbPswpwBbq7msyQoTQ/fzpUpBAWCJeyoo47JBrl1F4fLCAocKnijbpM/p6
	 GDbOtWqNLNjYAx3W000zcCbmXpLxeTYg1+fMSzkuksy7ydBzM8bj7gC6WXw6wQdRD6
	 vVdMHXz0K1GVFdtb/usTM0mXhAL+ZZsfcP7DWwsuADXRD4a5scfpg85ktfSdSrmGEW
	 RX91BEivy4ThHjiAFPD10y6OZy6KCaoROgurcEirnNXtZytmK4+Y7XIXkAVzwQgQnS
	 tWsz1C57JTWtsEG565sIfsiTVX1EO3rFjDmmROr8HMl9MVJMK0AKwMlgTnovI0C4jj
	 cqjPm+xX37wIg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so1082954e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 12:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNZhCfNAW/0MpZFWznswE0TviIelwbj9F9cAPsUf0njItL4fjHe8Ysq+KITEyRWaUPdfHIZPnSs76SucS4cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQq1OHEGGpX5YaBOi7Gj6o2EzzT9TN0LP6ec6TB5h26k7kWWNv
	RxCBcx61cTPWiCEgjbTllI+4sSa0siAjD2BiDV5U2M8p7u7VXzx1CMIqN+7HRQ/xFuvxExVkFAI
	PDLSYRTxYEdJoqmYINIM0SwyACwcTFR4=
X-Received: by 2002:a05:6512:32cf:b0:5ae:b792:7f1e with SMTP id
 2adb3069b0e04-5b0236a3891mr89821e87.30.1783712764308; Fri, 10 Jul 2026
 12:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:45:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJthrzmVCDE=BopUDMECBpMtPOpCJ9S0CKWRg--Zfz3A@mail.gmail.com>
X-Gm-Features: AUfX_mx_vh7ziiGHTkkaiMBQb1TjjZ8vahBxzqeJira0tID9YqDdR27A_6wUme0
Message-ID: <CAD++jLkJthrzmVCDE=BopUDMECBpMtPOpCJ9S0CKWRg--Zfz3A@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] mfd: Use named initializers for arrays of *_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, mfd@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
	linux-crypto@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	Colin Foster <colin.foster@in-advantage.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, Xu Yilun <yilun.xu@intel.com>, 
	Tom Rix <trix@redhat.com>, Michael Hennerich <michael.hennerich@analog.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, Support Opensource <support.opensource@diasemi.com>, 
	Andy Shevchenko <andy@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Samuel Kayode <samkay014@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux@ew.tq-group.com, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Peter Tyser <ptyser@xes-inc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 9, 2026 at 6:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:

> The objective for this series is to prepare mfd for changing
> of_device_id and the others to make driver_data a union, see
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre=
.com/
> for the idea behind it.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

