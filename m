Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F5DC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 13:28:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2129120722
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 13:28:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mG7wgMXG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgklvCvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2129120722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qv+u69PHrKCnJcCqq3rKc7UPosOEV8g6j/ZS5Y3XPLc=; b=mG7wgMXGleO0/MiyslF0DurrY
	j8SGXDnb1jsvd1wA31tTnDz1CP4twlQqpxX/CnFDmhM5ITGpvDUJOddmpIF0tfpoUQAyfUph0jUg2
	SX1UMWnlLMv6Eo2y7egbuXuQntLpiFDo+2KF//RxVJO1eqtOKNyq/VmwyOi2JDV/Gl+VU01p+7djG
	OGVaRDPmehKLzAIJxiS3l3M2nj4xIu6p3kKpu4w1bcP9w0F+yOHurrRAbQj0jc6vvg60ZCFOJ13uB
	xB/qN8SoynPtNePg6rQAL+ypOBOSKjzxQidsuRk9BeORURWL6rRXo09ivyk8iUy7jmI3LaGlemFAK
	SP36Aa6dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEBlj-0003A8-OH; Fri, 04 Sep 2020 13:28:43 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEBlg-00038a-Sc; Fri, 04 Sep 2020 13:28:41 +0000
Received: by mail-ej1-x643.google.com with SMTP id i22so8595327eja.5;
 Fri, 04 Sep 2020 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DqFPTDw+S2uxEofkCLsrBR7htF29OmtIF47V5Geewoc=;
 b=MgklvCvSosrcR7c0oMC5gYl71REsyqHzEjoLgbnXo/qI2Q/8wB12ws1kZbedONx/SR
 uZ4bTRNUhU1yhXfZmWyDfIiDe78TBc1znbncATlOC/7e3Xo25WaLLts3g2kUQYO4r3V2
 RoMOKbVcTzXTfnrKF4CqNK5Ug0Q2QhPHQ/eYV/YLewEQPYeJmcCTJre80yBb5UbOYAHa
 7ymfeGtVXtGzARqS7K1Z/M7yYwircTZ0qInQKINS9dlx5IBSOFRFjwiz62YG7nEfdjk2
 RTPH/HZ5ynwhgQlkjoNX07ppOXiDcHV6tE+C6122G2aHv7WMqd3AV6P6xKrM2crsXiN3
 ArmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DqFPTDw+S2uxEofkCLsrBR7htF29OmtIF47V5Geewoc=;
 b=sE7fjIvFhqrOENji9pRJELXlIRVwijT8yLMVDsJ01c/ZpsU4F9cckBi9r7+UMg6Cdq
 5vBZpHPlF0kRXEaTVg6qIjWuTw2cbF6nTKkNqz/gm7Zy+BTZR+c0wqfkuv98vhogM+AO
 ilHNO20MbDz5JyBoSSHAKf/yeI2xo+hCmiQBINk6w1kiXpL4QevGuwXMktjrk170Ud4A
 HL4BWwgQb60XopOB29uRTg8Y8zWXODo4qYWF2BX7oGQx8hLVOaFpc2SP64XJqomdnyyI
 o1xGAW/PePZxpdb5cKarL14rc1e4QQSLdiqKekFB0W9NcoBQeQNqCstf7Kql5bvyNBkA
 O8MA==
X-Gm-Message-State: AOAM531w3po4PHYqOQ4IwNLxAaYRhirM7TAd5c6AKw8aX3vcqk/cE5qN
 oSFUNa7l1UFfopHClVYk/Wk=
X-Google-Smtp-Source: ABdhPJzT9GealPujDoQ4MgJJbbBEoaZu16JSr/JZk+SvnJZGyrkjE1v52qemerS9mzEkq8Y9/QVaRg==
X-Received: by 2002:a17:906:8695:: with SMTP id
 g21mr7101500ejx.504.1599226115233; 
 Fri, 04 Sep 2020 06:28:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id l10sm6100072edr.12.2020.09.04.06.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 06:28:33 -0700 (PDT)
Date: Fri, 4 Sep 2020 15:28:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.4
Message-ID: <20200904132832.GA810925@ulmo>
References: <20200903232441.2694866-1-dianders@chromium.org>
 <20200903162412.1.Id501e96fa63224f77bb86b2135a5e8324ffb9c43@changeid>
MIME-Version: 1.0
In-Reply-To: <20200903162412.1.Id501e96fa63224f77bb86b2135a5e8324ffb9c43@changeid>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_092840_931587_CA785EF8 
X-CRM114-Status: GOOD (  20.00  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yangtao Li <tiny.windzz@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, Paul Cercueil <paul@crapouillou.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@axis.com,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Lee Jones <lee.jones@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Pierre Ossman <pierre@ossman.eu>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, swboyd@chromium.org,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Ben Dooks <ben-linux@fluff.org>, Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Barry Song <baohua@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>, Patrice Chotard <patrice.chotard@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Ricky Wu <ricky_wu@realtek.com>
Content-Type: multipart/mixed; boundary="===============4622889647979755105=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4622889647979755105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 04:24:36PM -0700, Douglas Anderson wrote:
> This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe") but applied to a whole pile of drivers.  This batch converts
> the drivers that appeared to be around in the v4.4 timeframe.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  drivers/mmc/host/android-goldfish.c | 1 +
>  drivers/mmc/host/atmel-mci.c        | 1 +
>  drivers/mmc/host/au1xmmc.c          | 1 +
>  drivers/mmc/host/davinci_mmc.c      | 1 +
>  drivers/mmc/host/dw_mmc-exynos.c    | 1 +
>  drivers/mmc/host/dw_mmc-k3.c        | 1 +
>  drivers/mmc/host/dw_mmc-pltfm.c     | 1 +
>  drivers/mmc/host/dw_mmc-rockchip.c  | 1 +
>  drivers/mmc/host/jz4740_mmc.c       | 1 +
>  drivers/mmc/host/moxart-mmc.c       | 1 +
>  drivers/mmc/host/mtk-sd.c           | 1 +
>  drivers/mmc/host/mvsdio.c           | 1 +
>  drivers/mmc/host/mxcmmc.c           | 1 +
>  drivers/mmc/host/mxs-mmc.c          | 1 +
>  drivers/mmc/host/omap.c             | 1 +
>  drivers/mmc/host/omap_hsmmc.c       | 1 +
>  drivers/mmc/host/pxamci.c           | 1 +
>  drivers/mmc/host/rtsx_pci_sdmmc.c   | 1 +
>  drivers/mmc/host/rtsx_usb_sdmmc.c   | 1 +
>  drivers/mmc/host/s3cmci.c           | 1 +
>  drivers/mmc/host/sdhci-acpi.c       | 1 +
>  drivers/mmc/host/sdhci-bcm-kona.c   | 1 +
>  drivers/mmc/host/sdhci-cns3xxx.c    | 1 +
>  drivers/mmc/host/sdhci-dove.c       | 1 +
>  drivers/mmc/host/sdhci-esdhc-imx.c  | 1 +
>  drivers/mmc/host/sdhci-iproc.c      | 1 +
>  drivers/mmc/host/sdhci-of-arasan.c  | 1 +
>  drivers/mmc/host/sdhci-of-at91.c    | 1 +
>  drivers/mmc/host/sdhci-of-esdhc.c   | 1 +
>  drivers/mmc/host/sdhci-of-hlwd.c    | 1 +
>  drivers/mmc/host/sdhci-pxav2.c      | 1 +
>  drivers/mmc/host/sdhci-pxav3.c      | 1 +
>  drivers/mmc/host/sdhci-s3c.c        | 1 +
>  drivers/mmc/host/sdhci-sirf.c       | 1 +
>  drivers/mmc/host/sdhci-spear.c      | 1 +
>  drivers/mmc/host/sdhci-st.c         | 1 +
>  drivers/mmc/host/sdhci-tegra.c      | 1 +

I do see a failure on Tegra124, but comparing to recent test results
=66rom linux-next that seems to be a preexisting problem, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9SQP4ACgkQ3SOs138+
s6GDzw//WH+drKQhIpGYRbCmaO0DaRpFAv8bprKz82rnQZNwrjt5/ZaPPjGfE4th
WUo1B/yRN73Stgptx13qG+htODQ/uOh98JsVyXtNFio5QUVNrGcVJzVvmVLvcjPw
YDI0+JnBSqhTsNMH1efS/jq/0/e6d9DSQdvaI7Hf4pIUs3bYjABvvrhCtVY619dm
yKwSQlUzP42bDmmVsFdypHnDYMV92QyftTJljz21Io0OrTXbg5hQ4By9pPMwTX22
+FrMVzdePX40a+fiAlk2ndut/m27d9NBjzbyyJbQJ0322n+zEt/w43wb6YzobAUl
2vxbetTgx93IcB75DS24u0AlfKH1uNHhMKXu/2cFwnJWgwwxPmLC9v4IaWYTn3fy
T7MHVCucHaOpY2ngi8c8fdIHoV9lkIVMlXDnmHWieleAA+6lHa/p4g5hd0fpzg29
vFtfT1+ZY5mLPSfJSwG/pdjQnmCDU/ZacM8ReJ9+KjKAnQkKzbYEWFktD7D8pH7V
toiYMb/7uYHmQuFcMqUCW3OC9jCh/NoMliBdrE9vD0Z9SZ0SuY1bFS4/5LcHK7fX
bQCD3ihzfHMNG2W7KbQ+W6YRZ25AUFmiuM9tK8hjkD5aYPpzh3dfTZcO7KSoa9n5
pis6xz8dSoykpZZceImxKTgR33tmuxUp/F2glxP4xm/h9WafEso=
=PAIZ
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


--===============4622889647979755105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4622889647979755105==--

