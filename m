Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F264AC7619A
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqQ3SiHws9LUFOFeaTF92+MKSqS3DlyruqkxUBl1iVE=; b=jwJlz4BvhEgZwh3Hqgsb6d2rD3
	Cro4TzNjN4gJNDlWYehS9XiDxVqAbkNLMzHZTpmCxTGN/q3QwTtx3IN1nt2N/O4Ij3nzKCvXla/Vl
	O78LKyx7SLw51A2fO5zDvqFpeBygQPP0eTCxzaEp8qyerF1yeJINqX8mGJZw8ROwubYJDYeQokQfE
	41yhZ4bSJpjepvr8miT2pqQj4K8XyTrDO49+IIul2XLyvz92cIPkqoSsqNH+d7noD2GYW5fx+le+i
	9jhY9K6VkewF//2aftMw/pOf9qBzYfN9LSzZuSaB21Uhij4qFtUnT5p13QGhtQ2VoKylK2Bk3Gs5s
	Xmidhr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnfLH-00CCFd-1z;
	Sat, 15 Apr 2023 12:49:23 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnfLD-00CCEB-1e;
	Sat, 15 Apr 2023 12:49:20 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id w22-20020a4ad036000000b00541e4028218so2333873oor.4;
        Sat, 15 Apr 2023 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681562957; x=1684154957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqQ3SiHws9LUFOFeaTF92+MKSqS3DlyruqkxUBl1iVE=;
        b=sAInW4jdFWd18P0SfBBU1170JUXE7LLFld6YAm6j4OxSekPTZLOY5WVbySpiaUlsDL
         cpJMSyT+1ai6GPaZ+GaWtYkHgOJajm9XTRgsMpGNHdNJpFSdVJ8eIclf7bq9/lqZwTjy
         bYCndd0i63bDCsn6dTfSGaZPEXeKUTgVW8kEdsGMEbT0z3VpD/9H/GWrqqlAGE4Lefvt
         8vN3ZbLwGvCs+1TSnnJ1en9utPQWCqfFfzI10I/VkrMacWt/iSTGLzvHIyVo4jDYeh3D
         +Ov80e54jVnDI/UWw16z7QxZWBr9RpuXpXEUdPm8cjZeoDBTgzQd8mvnIFazu15hpi/D
         Heqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681562957; x=1684154957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqQ3SiHws9LUFOFeaTF92+MKSqS3DlyruqkxUBl1iVE=;
        b=akMtsSqp5YOFsT7BInRk7nZw3saCndsGPxi8liSTep0kszUJbQpfMa1otHn4CyuBZR
         AwY6RENcMwfHyh8d8pj7J/6AvTwFQGLEIs6d3eFHXj18WRanc7SWv6sxsgmR4HgWcqOA
         9WieftgmyXLnV8RnVqoGttscMPwvSjRw96q1KUusWOTVHMU5WQvCi7KvghXyxpJcnwDi
         8CTkWZtyKOc5QWE6N7AtE7LIw2ig3mvOelWJEzVIHxxb0t76eCjvGBvmWh/uJZM1yvMM
         ZAT/hlAyCA6pEYa9JKp4ONaIoEoB8uWwi8tE5riUWcFmLYxG7JcYvC2bFbXiRrFaeQ85
         AWKg==
X-Gm-Message-State: AAQBX9eR9mNEUAuHqYrexBhkmQwsLzv1hxFJ5lMZLp7f4kauzq9yCFwf
	lG1JI+iI9jhDMhO7T78KqzJZIsjrDTcJ46/spXM=
X-Google-Smtp-Source: AKy350aw1sitUTkN1aRNjH+bN0r38acxG6oBYdh1kAmyzRFvhhgzUT2uye2u9KKaOPwVKPk8KV+BJZuBzcqgjqA4HF4=
X-Received: by 2002:a4a:d50d:0:b0:53b:7a81:fe64 with SMTP id
 m13-20020a4ad50d000000b0053b7a81fe64mr2496510oos.0.1681562956798; Sat, 15 Apr
 2023 05:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org> <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 15 Apr 2023 14:49:04 +0200
Message-ID: <CAMhs-H8e_e29=DVU0vc42gp0EiB_zkQLcNw_rH5Om21Xbm=Fpg@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sander Vanheule <sander@svanheule.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fu Wei <fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Justin Chen <justinpopo6@gmail.com>, 
	=?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Robert Marko <robert.marko@sartura.hr>, 
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jamie Iles <jamie@jamieiles.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Srinivas Neeli <srinivas.neeli@xilinx.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_054919_556153_E9F3436B 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Sat, Apr 15, 2023 at 11:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../watchdog/mediatek,mt7621-wdt.yaml         |  6 ++--

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

