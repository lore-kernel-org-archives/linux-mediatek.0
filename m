Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D78C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 05:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJeSGW1NKbzAi7kHJIz4kQ2ngfXCLLeH81l7WJkI0vk=; b=VaGnaEjc42pECp
	XEdQ0eg/tCO+8opHm/UaSCCvkcq8dCtINMsgeekjo2YpFl6UeS9j6S/1W9wTmL1ql9Yt4KbVQ7cfG
	rtzY09tK5EQVKfLQaUJakMyd8+3wN/jmmMdKCiWYp4YkGIUwtEVrGibw8J1QYq0vgGBy9P44ix2Dh
	hvP2butQSxz8CG1YUXhXEwdfhC+GrPa2N19qBjOQlTnLe8nRuQ30Bh3JpWPWM9w0RaP5m/fyx6lLC
	2GacRDgxUAolg4wnsenhm7TSKgGQcPXsrNLDt45pWTuzlKBAqhUxQbUrmTlAPAyra5NAtDz1jEsc9
	uWx3DAmHMYXCaLsuOXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqTOM-0062XU-TD; Mon, 16 May 2022 05:35:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqTOJ-0062WH-GJ
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 05:35:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id g12so1479836edq.4
 for <linux-mediatek@lists.infradead.org>; Sun, 15 May 2022 22:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c/IovKeDQ5OmYImuaDKw85Gvkz+g6dB9ube8wouUX0E=;
 b=GGajIGxKz4a1kdgVCnNp3TVY4oWNsaMBX25vD2wNxJjdlfjW0K2HSomOmhtNf8KlII
 I/KzDUxpS795xfRF8NdRofQwNVP/BcZW3gRgq5wCMrBCZXhJNS+FRleC+mG3irXz/3aO
 +mT31wgaBGkXLx4Qfi9CCUwCaASTGFEm4O6+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c/IovKeDQ5OmYImuaDKw85Gvkz+g6dB9ube8wouUX0E=;
 b=yb3moJOh6T14ikIJMHRO4rxJuLjlAMl7PH9iM8QX/sruS2TWMSPj5wo0DAoNKR9TKB
 UzqF9F88Dh3u1Qsca3a4ma2jIgQ8rQTszFtGbRvSaQzBgKR3NDQH8kv+QrcVs9bLWX/4
 CU4x6VHquOOXCnmXo1pFA+y7fDJlDnzwYzUr01vQ3WBUrDz8bjb22aDRi+mbt+NLVtzR
 6ASOhsB+NJ0NR22sXuSzq/hMlc2xsWL/SkjVsAsvnMqbqhz+C/ReyWSv+OT9UYieh1jx
 4o9kMizipu5OC+3jToZ/7srnFB0NJtu7wWrAd9JoWvLf5R/6VXUPqk5yEqnZFLNSQ6KO
 I2JA==
X-Gm-Message-State: AOAM53162MWKNvZ38FyU+rLsb+qWyt0IoDYPf70yl5iTNRhekraKiJoc
 HCehwGWBxbIHdxMx73NJEa49xyFzGKD/fEeSGyluMA==
X-Google-Smtp-Source: ABdhPJxkaaQU1pxAn/HNEptaZ1FK3UV5eSAHcvlMeQ1pJimMFp8UJ4ll80vonmeQUOiLh7XTmmmV9IDAbxXEwPO61wM=
X-Received: by 2002:a05:6402:11cd:b0:427:bda5:542f with SMTP id
 j13-20020a05640211cd00b00427bda5542fmr11486167edw.290.1652679329459; Sun, 15
 May 2022 22:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-10-rex-bc.chen@mediatek.com>
In-Reply-To: <20220505115226.20130-10-rex-bc.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 May 2022 13:35:18 +0800
Message-ID: <CAGXv+5FW59B1Dq8eH=5KjEdTxgT64GuvYZHZ9LnnTuaVrK3XpQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: mediatek: Add MediaTek CCI node for
 MT8183
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org, 
 krzk+dt@kernel.org, matthias.bgg@gmail.com, jia-wei.chang@mediatek.com, 
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com, 
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_223535_600276_5E6446B9 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, May 5, 2022 at 8:04 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> Add MediaTek CCI devfreq node for MT8183.
>
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts    | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 7 +++++++
>  3 files changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 8953dbf84f3e..7ac9864db9de 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -412,6 +412,10 @@
>
>  };
>
> +&cci {
> +       proc-supply = <&mt6358_vproc12_reg>;
> +};
> +
>  &cpu0 {
>         proc-supply = <&mt6358_vproc12_reg>;
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8d5bf73a9099..b035e06840e6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -230,6 +230,10 @@
>         status = "okay";
>  };
>
> +&cci {
> +       proc-supply = <&mt6358_vproc12_reg>;
> +};
> +
>  &cpu0 {
>         proc-supply = <&mt6358_vproc12_reg>;
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index cecf96b628b7..11caf3dd85cd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -280,6 +280,13 @@
>                 };
>         };
>
> +       cci: cci {
> +               compatible = "mediatek,mt8183-cci";
> +               clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
> +               clock-names = "cci_clock";

Binding says there should be two clocks: the actual clock that drives
CCI, and a stable "intermediate" clock to switch to during clock rate
changes. So I think this should look like:

    clocks = <&mcucfg CLK_MCU_BUS_SEL>,
             <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
    clock-names = "cci", "intermediate";


ChenYu

> +               operating-points-v2 = <&cci_opp>;
> +       };
> +
>         cpus {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> --
> 2.18.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
