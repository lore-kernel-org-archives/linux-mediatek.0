Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CB8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 04:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSXV8cofjpGWCvN5GeYT0GOuEuSaElHlkKt4GgMFO6o=; b=BxJ9LN5m04FCzw
	hbR++Rw26h16BxioVN54gUuJMrkYjntgHxMDKwDimhdfCspxaDVIBlR00s85yjx0w9c/9xiITSZxb
	cASJrUH/vQ2fbf9DgfjqShD0EJ1YKECWszMDJm+1PTRarLPrXKuPwDxZ53HpJ8DQV8f+pnvh+IVn3
	GjRZ2e8/xx7O3Ag2SaDnLhFPTEId8r/IhvpBdOjnczgKBl51h5MJ+6lt/efhrkr8hRrKP0qwAij1y
	JRs4lDPELPPIJ2ZJLMvA2hbzL+RVKxiz4UTPqYt2dMSCwFDDYXJM+O70eWrhSND+WIK0w6edRWYv9
	8lBwfG3rYVCdoJxWqfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM0ed-003SG0-Qd; Mon, 21 Feb 2022 04:50:31 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM0eS-003SEX-GM
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 04:50:22 +0000
Received: by mail-yb1-xb29.google.com with SMTP id j2so32004907ybu.0
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Feb 2022 20:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6fLPreDyk5i/acRhp6t4wYyRKGMfEFw6AWmQFjTT3XM=;
 b=lcJRQC48zBT6JSk4Cze0rWSvfDcjxUrksvEdhCPEJ9kcKeuCJ8ZTqkOMFnVW9fN4LL
 7kfPRB7tL3AI9stSJYhk2gAYt+K6CgL7KBgSaqC4QmR2ucTci0NCQzyiVDmCf+5V0krp
 PJacX78nweK6yTgCJE0Lz5jgZZdPJe7gbORvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6fLPreDyk5i/acRhp6t4wYyRKGMfEFw6AWmQFjTT3XM=;
 b=bJXnkSgtmS3G+1KIiqOMCKHfsNYsMRDF2MnWCMm1k/nMcmnlsK1IlH3hvbTkJESvgg
 GTv6Hs5FoUQPo/V0S/bJ03k+VpNTBqWz/QoTDSBkUvUeOkeAKgBHJjckbGhBJc0QjRKF
 oTdnMlsL7osQvMuf4+HejNvZXgbfAqbu7UxLf58V7QeXjJNugxH7KiuAkBTvUKM4XPYb
 Dl7r3p/415/zC06nfXFr7vcaphuPVZ8jnDHVaJGby+g6wuG3ly8if59mBCGTls+z/c11
 9xUU2ram6TWM9PMWptGJC/96xPyFKewHUEV73aGO+ZpSJhopWqcTjUepTD+hGy9si8Dc
 8Bnw==
X-Gm-Message-State: AOAM532kUyGxVD3g/MP6sX5ciojkxHcL5dmSY18XOu0x9mNIy5YzinF2
 e5taWYW8C8NMlzb3JK2rfJbZEeOmbBdts87lUrv81Q==
X-Google-Smtp-Source: ABdhPJwnJji3Y6vGfmHdiJMJSvQXhmnzkIuuJoCGVqZQWmEi5cZKBvn6o1cT2ydL5KK4nhZsMh8eNWrzvt2qMHhyDxg=
X-Received: by 2002:a25:2d52:0:b0:624:1bf8:2f8 with SMTP id
 s18-20020a252d52000000b006241bf802f8mr16376975ybe.219.1645419018711; Sun, 20
 Feb 2022 20:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-20-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220218091633.9368-20-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Feb 2022 12:50:08 +0800
Message-ID: <CAGXv+5FO5gBv1L4S_Nitmfv1zwjTGvp3CPP8CyFVEAq3DkkJ-g@mail.gmail.com>
Subject: Re: [PATCH v2 19/23] arm64: dts: mt8192: Add i2c aliases
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "--to=Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_205020_554746_5E148AA6 
X-CRM114-Status: GOOD (  15.48  )
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

Hi,

On Fri, Feb 18, 2022 at 5:16 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add i2c aliases for mt8192 SoC
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 55bcbf72a366..e3314cdc7c1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -21,6 +21,19 @@
>         #address-cells = <2>;
>         #size-cells = <2>;
>
> +       aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;

AFAIK, maintainers have suggested against [1] having aliases in the .dtsi.

If the numbering isn't an issue, I suggest just dropping it altogether.
If it is, then the aliases should be added at the board level, and only
for the interfaces that are actually enabled.

ChenYu

[1] https://lore.kernel.org/linux-rockchip/CAK8P3a25iYksubCnQb1-e5yj=crEsK37RB9Hn4ZGZMwcVVrG7g@mail.gmail.com/

> +       };
> +
>         clk26m: oscillator0 {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
