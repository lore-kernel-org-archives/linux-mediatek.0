Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxB2Cs2yea4036h+V8SnGYtOvv8W077qMT/MocLE+r8=; b=j6XaCeCry31L1RmEmH18TSIyxx
	YFpuKQJu9mi/47oyEYk0AbCuAKw/G5Zt0NmaT4okLLmpTTCPHQaDSvO7y1n6zSHeVTv1DpvpbypV/
	gQ/JpsErvNRI6zGKYZVKjGvHRHZdLOTsr6xgRWG6Oh9bnKIlDS0pz3eJSSsEL7IMOsC0KacJBWz+c
	xyr6X7Ck9QUOPhBpKciGZWPSkBPvZ0cc+P0+n4D2WmnR7Ws+k56sOq4PJlzeaVZ0n4wbn1Cw3RQJ0
	l0y/98Wo84VJpYcLupQANNDcu6DsBw/LtEcw+MUYTsxwEtmWPaCnbigNLmp/n6xWakhG+RNk6xUWj
	eeAiLZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJdB9-00Fp6T-VZ; Mon, 14 Feb 2022 15:22:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJdAv-00Fp1P-Sj; Mon, 14 Feb 2022 15:22:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B9F721F43C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644852118;
 bh=++yhPFmxmu7cGPsZh0XYgN78QVE2RIZcqQXV+giWu/g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=b8ErAXCrUOAmvdnYHnh9/TxFOeLgasc/OLxHbRMM1zQ/zlxEzejaSK1qeTdyYD4Hl
 VZlYXyxVjnI4DZ/Xh055bjRtWNKDpG1G93djseSI44c1eklumetK6NNzTm1iUC2Fr7
 oYzqii2rNUiKLEcbUu7h6ECBL92PPGGWR+BbTTo2REQGJdEzOPgGtaHjRVSpg25Dsr
 YqQ5hCOcAqY2fBfrt8YAhUJogmiZS8fges/P8ZXf/9Rqm1S41LYpxSokBnUKwMjtzv
 FukrgWTubzRznrWKmqjJ+xQfIMZM6EMidHbKXoi9aSSFI+wZHKDTf2HRuMwjwsnNvv
 V5za4SkH7koqA==
Message-ID: <5aacbf47-9ab5-d1d7-cdde-d338d531bc7b@collabora.com>
Date: Mon, 14 Feb 2022 16:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node
 name with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_072202_153211_13B4D60D 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/02/22 09:19, Krzysztof Kozlowski ha scritto:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 8f7bf33f607d..2d7a193272ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -92,7 +92,7 @@ volume_up {
>   };
>   
>   &cros_ec {
> -	cros_ec_pwm: ec-pwm {
> +	cros_ec_pwm: pwm {
>   		compatible = "google,cros-ec-pwm";
>   		#pwm-cells = <1>;
>   		status = "disabled";


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
