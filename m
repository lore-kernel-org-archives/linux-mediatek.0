Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89166CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15g5r3oSUiKTdIG+I/wDEXw4AST3WvtOOO4Ksp3Lbpk=; b=e+rYV5DK1FVtTsW0jzN/u8GT3p
	z4fDb5yqufIVxn2hJZWoGD8atXV0nKAszKpULzGNOR4nMl9jLObVu4GJt/uVMmLIM4fAspjQ2wEU4
	n9clXT7G5N/As0zZNhSvaJnr/ZKWuIhgLuA5VCwXZbmqLe0e/BcJo/apQao6cmfuiCEQvO/I9uQOA
	hk2M0vYCeE39Mx2bEa6v5/M4NyQIeeUrsBOpuBfZzVMAb59YKUR+TMa+G4mRN695pw1w/vwHT0Fv7
	KAiPyocZP/aOHo4jcGKb7tTeZRYFdvSO8c1sno7LJg/7D2HcFe+UFfA48pRN1REN6quBxIw4HhN7U
	ir3gSlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTa-00000004Ky3-2NuM;
	Sat, 23 Aug 2025 08:19:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYYm-00000003Rru-40fo;
	Fri, 22 Aug 2025 20:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5629B405A0;
	Fri, 22 Aug 2025 20:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF79C4CEED;
	Fri, 22 Aug 2025 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755895228;
	bh=cQaigDBTxzr1UzSEKTyGQ6sShaL7mmiAEnUOGpm19DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5KQQ1ia/LPE0jWIdLX92S6hU598Aa9oRK7q68PJvX9I1fP/wu2jVpxXUu4ZcRWWh
	 2TfX6N8DyNb10amwbNWFA89/+lM2wvkQBHmBTik/BEEjHPWC89iPGf1jrn5rclz1fe
	 wK04qZwSD+dVz269iAxvyxHAo3q2QlGOaPlxj2K0dXqlH5ssipaSd9MphPUHImfv/h
	 wYEz0UMcT/FekQnw959WOP+qoCbpI8+JNc7ficN2QdOaD2Klz2HXJf3uIhOLMZqlwA
	 PmsO23d3FLfEGROqaXKZp6Fu18+lGDNCv1rzjKbVQ/7OzPzkDeuueIY5lZZ9wjDiWA
	 EQ61a7HDJl4ZQ==
Date: Fri, 22 Aug 2025 15:40:27 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tim Harvey <tharvey@gateworks.com>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jean Delvare <jdelvare@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Mathew McBride <matt@traverse.com.au>
Subject: Re: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own
 directory
Message-ID: <20250822204027.GA319356-robh@kernel.org>
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_134029_040234_1B613125 
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

On Fri, Aug 22, 2025 at 09:57:13AM +0200, Krzysztof Kozlowski wrote:
> Move ChromeOS Embedded Controller, Gateworks System Controller and
> Kontron sl28cpld Board Management Controller to new subdirectory
> "embedded-controller" matching their purpose.  MFD is coming from Linux
> and does not really fit the actual purpose of this hardware.
> 
> Rename Gateworks GSC filename to match compatible, as preferred for
> bindings.
> 
> Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Cc: Mathew McBride <matt@traverse.com.au>
> 
> Lee,
> Can you take it via MFD?
> 
> Changes in v2:
> 1. Correct remaining paths in other schemas ($ref and descriptions)
> ---
>  .../bindings/{mfd => embedded-controller}/google,cros-ec.yaml | 2 +-
>  .../gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml}    | 2 +-
>  .../{mfd => embedded-controller}/kontron,sl28cpld.yaml        | 2 +-
>  .../devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml       | 2 +-
>  .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml     | 2 +-
>  .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml  | 2 +-
>  Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml | 2 +-
>  .../devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml         | 2 +-
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml     | 4 ++--
>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml       | 2 +-
>  .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml    | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  12 files changed, 14 insertions(+), 14 deletions(-)
>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/google,cros-ec.yaml (99%)
>  rename Documentation/devicetree/bindings/{mfd/gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml} (98%)
>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/kontron,sl28cpld.yaml (97%)

Who's the maintainer for the 'embedded-controller' directory? Fine if 
me, just need to know.

Other candidates:
Documentation/devicetree/bindings/platform/*
Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml
Documentation/devicetree/bindings/misc/ge-achc.yaml ?

Rob

