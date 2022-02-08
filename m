Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09992C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/inFgoemmOMlonMa8EUH0ead9CkBnl/vFMPDe4NnWk=; b=NL/kLazyGierRw
	ayaOOL4qlT7vJ55BF6qBXP4B0EZrfZ57zOq+gRQYyk6VhYmbHvYX/Gn9zARoemA98R/mzLah/jAIo
	tKSRDD9ExA8OWHKnYLM2/IEmiSzvK1u5CUycG92N4cktTly56o+4/aUf2WAHl7ITmyfqFiy9Z5gap
	H8/tJwzpL73vbIhArebdMNHLc1f9wkuXiU4FcrEuXbVtKHbcUkF0/JaeBB5t9pe535K/MXEi5gJWY
	ADUoKt+7EZK+dSJQcA/4YdfI17Q6E3LJdaAt3bFhvNp+yhXFJgYDag6XgZFQKsg1vPJSKQbx4MNiR
	7/epQiKM97Fo/dYv+vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHSaT-00EXl0-5Y; Tue, 08 Feb 2022 15:39:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHSZy-00EXTx-H1
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 15:38:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1964888wme.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 07:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rwKl8ZeyCuycfyHiHNzaCDGxP6pfys7UA7HgC7w51Hk=;
 b=J8rGUAr3VAjmWXmp/ug1dk925Xs2TgqQC98/ubJfOSqot4uI/8l2P/bJGc1BLEFde/
 02w69uACXz87zFLCn4hFgeDAx1K1QiQtuZlfrpZv7l+iMQuGTBsZhC6x5Bwp9n+LlBSE
 q5BvhZLUUptXXiuSUgC7qDp7XPJdSdSc5XsOxhJp9Vejfd/r++x5Rn6HLC0lL30zRLx5
 pit3G4CGM24B/tdxV7ArZb/J4pRtCYc2Tjtm/PmBWM7BoPfQheWViImBTXPtNZpGb2Vm
 fyk5zOkWFUi0zeIbVgSf1iCKyiZ4EHWMmg+gF6KKY6nsWIDBjSFpnjnshFHWFr4OQGjt
 Gisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rwKl8ZeyCuycfyHiHNzaCDGxP6pfys7UA7HgC7w51Hk=;
 b=lSOTpFZBjIu4wDVOkhjbePviCLpybBEly4sUxXBBpK67lfFVX83bPEfBvRn+Y9G75L
 Wv6sSwekDcQ0vwq+Hp8FPeuYrDv3R7yfC0IvB33hubJnjB1BffqPYj2kfGKamM0m3HXI
 JcgkHx5WedEqRGr05GtdWg9sXtPHr90smeym4ZFeobXE1WmpgCKVIU8OcqaKxOSjSwZG
 uVjW8bEcG5F7KNdPks8S8RbbGqCAi6gezq5sIko40BLpPKOf/iRucQqs7oBXEieYQ+S+
 78i3HPHuGQ6oSaanyOOuzEnEJmMAUPHrqqJIsJCDcY+7hmlQ91VUwzP5QksCX+ENpz3h
 ZwIg==
X-Gm-Message-State: AOAM530gC4xo51BmcXTqQ/UnrERn1wQ8COnEIV/P6j8FAdWCUu5IxU9R
 H2c7RJlnUl2wtZf9IhqNEQ1RLQ==
X-Google-Smtp-Source: ABdhPJx8NmLR0cLoQwJ+aWrxfCSDB4wpiMqHzFtzKLKpkKQhBC8j92FFvulZ4fHheCC8AjHQmnFOGw==
X-Received: by 2002:a05:600c:4656:: with SMTP id
 n22mr1630222wmo.85.1644334732007; 
 Tue, 08 Feb 2022 07:38:52 -0800 (PST)
Received: from localhost ([2a01:cb19:826e:8e00:bf36:c801:97ea:7f])
 by smtp.gmail.com with ESMTPSA id p27sm2397617wms.39.2022.02.08.07.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:38:51 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: mt6358: add mt6358-keys node
In-Reply-To: <20220121140323.4080640-5-mkorpershoek@baylibre.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
 <20220121140323.4080640-5-mkorpershoek@baylibre.com>
Date: Tue, 08 Feb 2022 16:38:50 +0100
Message-ID: <87v8xps705.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_073854_669358_9524F2EF 
X-CRM114-Status: GOOD (  15.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On ven., janv. 21, 2022 at 15:03, Mattijs Korpershoek <mkorpershoek@baylibre.com> wrote:

> This enables the power,home keys on MediaTek boards with a mt6358 pmic.
>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Since the driver change has been merged [1], can we queue up the DT change?
Or should I resubmit this separately?

Thanks

[1] https://lore.kernel.org/all/YgIE%2F806gDmRJYCn@google.com/
> ---
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> index 95145076b7e6..98f3b0e0c9f6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2020 MediaTek Inc.
>   */
> +#include <dt-bindings/input/input.h>
>  
>  &pwrap {
>  	pmic: mt6358 {
> @@ -357,5 +358,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
>  		mt6358rtc: mt6358rtc {
>  			compatible = "mediatek,mt6358-rtc";
>  		};
> +
> +		mt6358keys: mt6358keys {
> +			compatible = "mediatek,mt6358-keys";
> +			power {
> +				linux,keycodes = <KEY_POWER>;
> +				wakeup-source;
> +			};
> +			home {
> +				linux,keycodes = <KEY_HOME>;
> +			};
> +		};
>  	};
>  };
> -- 
> 2.32.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
