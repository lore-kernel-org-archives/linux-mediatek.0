Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A58FC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xej66WkZPKHqELRT/lfMwNOt+lqMQKIQYReFhqKDTFI=; b=nzsB3IgLmTjqkbG7n2vtFxG+cy
	rUZvP9zHPiLrZO+fr+jXiE1Jdmu/jIlozDSw27JD1l7wxYkxcqsZfsmNecIqot61Vf+A6FJlItJqW
	9EcU9WWLdeGKIQY8MDJgIbYvaQoOTkcDKBpT5F1qP0RCPp/iShwTMkQHbSkqUfUuz020U0k4uuFO2
	k66lXgU3zL5n/BtkmtDQ6vUJis9HjIvqv4om76k7Yudh8EWf1Q+hMNwi0telfroLvNcgmRyAAN6qr
	zLpChiF03e1UcNPcMCR5rwo94m3pveGvevMYiccgnm6CTtCk1nGIRBvr9Rj1dx+zHUr3MeSHN8FZI
	my5aeBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0VJ-00000000JFQ-1a8m;
	Thu, 25 Jan 2024 14:14:53 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0V5-00000000J6F-2pAv;
	Thu, 25 Jan 2024 14:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706192078;
	bh=xuWotEzSelSVBqWujYKbIOXX960an6aLcCPwqSUkjtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nSMrqxBc5B0zoxSh7oM+5Fjyr3Ev/UxHPkW05LIh9tqvVs8PD+gCaNAqlz5QsrhBH
	 HbSRK9bawmsg86dsQH2IjMpDCUePRyRF5oM8aEVzAti4uMMz1HRIpPYLi32u2KBQJ+
	 AliVBErnUM3jUPU81ZHJPCNYmhPMgUeAyPCVcAL4Hih1LBsQ2CGmIALnpwgLpButSL
	 rbFGcAbYC6BY3TnD/ujgbQgo1zc9++xbkTUK6KOdcjliB5wx4T3j9bIncv2DioZft3
	 9ALNYJlMlexd763yE/DkmWdIt93ZLBCvhepEUEmz9UsnHPTMiD95fyECCAAuyLjyhN
	 8xG5LCL5+b38A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B7E43782057;
	Thu, 25 Jan 2024 14:14:35 +0000 (UTC)
Message-ID: <4079a650-74a6-49bc-87a9-c5729fb6e8d1@collabora.com>
Date: Thu, 25 Jan 2024 15:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device
 of a given chip
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck
 <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_061439_973367_E023554E 
X-CRM114-Status: GOOD (  17.78  )
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

Il 25/01/24 13:08, Uwe Kleine-König ha scritto:
> Currently a pwm_chip stores in its struct device *dev member a pointer
> to the parent device. Preparing a change that embeds a full struct
> device in struct pwm_chip, this accessor macro should be used in all
> drivers directly accessing chip->dev now. This way struct pwm_chip and
> this macro can be changed without having to touch all drivers in the
> same change set.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   include/linux/pwm.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index 8ffe9ae7a23a..d7966918f301 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -289,6 +289,11 @@ struct pwm_chip {
>   	struct pwm_device *pwms;
>   };
>   
> +static inline struct device *pwmchip_parent(struct pwm_chip *chip)
> +{
> +	return chip->dev;
> +}
> +
>   #if IS_ENABLED(CONFIG_PWM)
>   /* PWM user APIs */
>   int pwm_apply_might_sleep(struct pwm_device *pwm, const struct pwm_state *state);




