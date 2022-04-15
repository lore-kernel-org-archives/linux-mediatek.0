Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYo2zqWUHrrV3YZVAIOLad97vdSAYqEIzdnfDeSu6Rs=; b=cgi1SXtcOulnUq
	Nbw7YfwYZ2ET+0MH+L0l0Qg9X9YCPvY3I6QcAScNZaWxesDmFbeZL908WSPN5HIZPSTr7AZT8GxrW
	gXYeu/nug9zxnXx5rN6KHO4I22KuZzb/DFq+CaoxcVTVW3KGMflMWuLiYai/BLta4w1C+AwSP5M8R
	5O/Kprw0AW2WG5wHZYfo/I4tLrSW0OBKwwbzyuHGDS6c3QhYZLixCxtl96jKgUlHwOl1dPhCeZ7V7
	Q/IsGExeQKK6eKsN8pTJxCBlNLewcuglk10cNE5g6uasM4esMGnOVoCFfMYmLkepvCSUucw7U7hp4
	FgEo3rWOCX+cYXm1Qtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFHz-008wBX-Q2; Fri, 15 Apr 2022 06:18:39 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfF6R-008s9y-Uc
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 06:06:45 +0000
Received: by mail-io1-xd2f.google.com with SMTP id 125so7542934iov.10
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Apr 2022 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EjdPQf7qMEmsnQdH9Lsin89rXivDvbUmZSVyW8V6lRQ=;
 b=erKpGsHFd5Sf9kS9SBDMU6QT8/q3BhnoONJ7PogKQu44iphr3NmgCTbUu+235pDAum
 VEBQFxa9m9zXu1dqSlPlXwJ68Jx2bHdW2ql9b6ieFJ7EWjUsNzEO9RimzV/WWOTTOc/O
 DltZ34da7CLDFx9Vx11twYDGL0VG7ea1pRLckFXvjgI7VZ//rPV5PyPR90uZ8TajWXoP
 EOBLnKU7jpXCxt+j3XklhjfOB+yhUlj5a43BEe0GAzfghknM6GHrSQYLpYJaLmyDtLXZ
 R+f4cWein/LjrsYMSqsAwnjgA1/IMCrkDnArIdnFrUn9xKnfqBW06l8cW8it9Wh50BJ8
 KjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EjdPQf7qMEmsnQdH9Lsin89rXivDvbUmZSVyW8V6lRQ=;
 b=TcfTKynsXwY5Ux991etDFKBQYv84/6yXKEJ2f0IuIiNq5Fr9Ratq6tW8pQcWPzwj7J
 TNEkIZNVHJJufpd60GdRy3V2EJ3xzz9uRenNynbZm1Dd+Cw76jy8ZKRKviVcLUP0gBbh
 UAxHy//LqTQ0yb/KybsCLGGlHqE9RJuApddQAZaJuu3ZgPFopjHhrwSvWSzd79FmkdYy
 DnTiJzoZIYG43qbX1TSSOA1AzutxvNKlhrL9y4/2Y8pbUwYYmoQH1qOq1NhTzzpOo+ZF
 JcJoyMdOOKUxGIxJaz11xXHTtJz3Id/LFj1KfE+Em7PzfjM6OgHHKP9GefwKUGlRK+5J
 QzjA==
X-Gm-Message-State: AOAM5331m0KwzXjip3Bk9EwdUfVruHVL5Y2w4jaRGWFB673xeda7/SEQ
 lxT1vsFoKx9uPU4GrilzhoL4aSP/QBWA0FHSdqy7SA==
X-Google-Smtp-Source: ABdhPJyjRqRUmRRe3KwbqxZCJb6fy3VByM/fYMcpxwZINn7YjR12Uuc+96kV22moycRPWDOAIcATyEFMgg6Uiu0fTSY=
X-Received: by 2002:a05:6638:2402:b0:326:5418:f73a with SMTP id
 z2-20020a056638240200b003265418f73amr3094380jat.170.1650002796757; Thu, 14
 Apr 2022 23:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-15-rex-bc.chen@mediatek.com>
In-Reply-To: <20220415055916.28350-15-rex-bc.chen@mediatek.com>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Fri, 15 Apr 2022 14:06:10 +0800
Message-ID: <CACb=7PXmA_n-xAb+ZkRJdTXu=Enbf6NbyxVa3VC1zmJwsrgQ1w@mail.gmail.com>
Subject: Re: [PATCH V3 14/15] arm64: dts: mediatek: Add MediaTek CCI node for
 MT8183
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tim Chang <jia-wei.chang@mediatek.com>, 
 roger.lu@mediatek.com, Kevin Hilman <khilman@baylibre.com>, 
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_230644_054655_70F86F66 
X-CRM114-Status: GOOD (  15.00  )
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

On Fri, Apr 15, 2022 at 1:59 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> Add MediaTek CCI devfreq node for MT8183.
>
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
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
> index 0f9480f91261..4786a32ee975 100644
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
> index 4ae3305d16d2..334728413582 100644
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
> +               operating-points-v2 = <&cci_opp>;

hi Rex,

cci_opp is not defined in dts.

> +       };
> +
>         cpus {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
