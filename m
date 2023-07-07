Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95EEEB64D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swjcoqb53SUMB+DeeB9DvOSbSUZxcLJDlvlKSPHfeEA=; b=Rvn+thWk9J2xwvNMVrfV/JQ5HP
	vNgepTspZxCEI2TKpvFW5RUAqr6ufgY9h8v0wI0jG5B3mAfGs6xhaXksFdj9qAK6yV9gH2eP3H84J
	e52g092rlnMr0FhxXGbqFyyMVcXRG2pKeRZ3+HPeegMC/fzHaYGDH3sHSzQ/3COMlMdZLWSadCl5I
	8HF+s/ufmgVUZukb7rclQWfjM6Yehj97CvUu7c0IWqkqEAPt87Asr0p8f5vEPRClwmfETAF0dZslQ
	3ULR92OPGb+AcjXI1S4o9pamG3wUMQuvWdl/DLcCHeU0Zl1fTwSaadREypFRcE3Res9xtW6zm00TB
	psieOMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmhy-004uQM-2E;
	Fri, 07 Jul 2023 14:45:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmhv-004uNk-06;
	Fri, 07 Jul 2023 14:45:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso21736075e9.2;
        Fri, 07 Jul 2023 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688741111; x=1691333111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=swjcoqb53SUMB+DeeB9DvOSbSUZxcLJDlvlKSPHfeEA=;
        b=EcoaLuTvcXuXAayOAavdbHzX2pVNH/G03FXOIGUydIXmJQFbXUuROQO3utdu1UBlkJ
         i5T79FLwHEn+FbOtR6rojeXwzJHcN3/CK68Bvad105Kftqm7T8WDy8sNuGjTd6hfayxv
         uDJpcivLdOgHm8ZSTeXafh5kjH1vdz2QyHtzSHJLV/XWYvaOhiPNnuQ5tzKTLvDjncvS
         P5y3XVHqP3pY7yN0RNh/vAFc8a4l591jAPxYmEal9MXxlDk2fBMq4NgR91GWWwHGck3P
         eI4yxP0AJ/MzpKAkgF7Zh61e2cd2+bok+S1BGzDVt9sha/nd0oeYoFxqrjfurOOtpj/L
         wcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688741111; x=1691333111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swjcoqb53SUMB+DeeB9DvOSbSUZxcLJDlvlKSPHfeEA=;
        b=ZStbL1rvFqloRWs9sCdNk7WFOgyTQQVS0IjgjLxW0ey3RYh3RGRh9CTCqnQeSwPU/r
         sXq3reQAZ5TXiAXRukyzMSQPWrScARvCuBFpLjon6g0/6yb+i0m/qtTY/gyi1qdSUdLw
         J7fzySY5of6ww64eiaukaNgpAJmduP6Y+DU8LuKulFlfI758IP4ly71G0AQ6OM912C1n
         RG6MOjX0x+ICqDdk79wp2m04V0BN3rFAogVk+HjEVJVknMrnfvZlLY8ZhN9+gFNxvok9
         nQILvEeGd1n9WJEHLdpdv6soDCHWcGI9hxkv0qwxjEu4w2pbQyMvhZWWTtwDpdJi4DtA
         jl0A==
X-Gm-Message-State: ABy/qLbblipTLuLsj+1Lg8tFNYXfthy68dqXj/uof9wm03/i+AY09KZ8
	iMffeTBkzEClXlsU7wc/ocw=
X-Google-Smtp-Source: APBJJlETLQxFyjxg4eixOg08xV5sR1+LQzSdY3LDqoWIxyh7KGoxRT87Xs2dLzQbJvZmgQ+CxxmFAg==
X-Received: by 2002:a1c:ed14:0:b0:3fb:4149:b816 with SMTP id l20-20020a1ced14000000b003fb4149b816mr4242668wmh.8.1688741111164;
        Fri, 07 Jul 2023 07:45:11 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id l15-20020a1c790f000000b003fc00789d5bsm1434084wme.1.2023.07.07.07.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 07:45:09 -0700 (PDT)
Message-ID: <0364cab8-25b0-5850-9791-4b0451d2adbe@gmail.com>
Date: Fri, 7 Jul 2023 16:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/18] soc: mediatek: Move power-domain drivers to the
 genpd dir
Content-Language: en-US, ca-ES, es-ES
To: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-8-ulf.hansson@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230707140434.723349-8-ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_074515_075424_DBF5420D 
X-CRM114-Status: GOOD (  15.66  )
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



On 07/07/2023 16:04, Ulf Hansson wrote:
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: <linux-mediatek@lists.infradead.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

We are missing a complete commit message here, is that intentional?
It would also need a patch against the maintainers file.

Apart from that patch looks good.

Regards,
Matthias

> ---
>   drivers/genpd/Makefile                              | 1 +
>   drivers/genpd/mediatek/Makefile                     | 3 +++
>   drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h | 0
>   drivers/{soc => genpd}/mediatek/mtk-pm-domains.c    | 0
>   drivers/{soc => genpd}/mediatek/mtk-pm-domains.h    | 0
>   drivers/{soc => genpd}/mediatek/mtk-scpsys.c        | 0
>   drivers/soc/mediatek/Makefile                       | 2 --
>   14 files changed, 4 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/genpd/mediatek/Makefile
>   rename drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.c (100%)
>   rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.h (100%)
>   rename drivers/{soc => genpd}/mediatek/mtk-scpsys.c (100%)
> 
> diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
> index 6b9e9fe907f3..1a0a56925756 100644
> --- a/drivers/genpd/Makefile
> +++ b/drivers/genpd/Makefile
> @@ -3,3 +3,4 @@ obj-y					+= actions/
>   obj-y					+= amlogic/
>   obj-y					+= apple/
>   obj-y					+= bcm/
> +obj-y					+= mediatek/
> diff --git a/drivers/genpd/mediatek/Makefile b/drivers/genpd/mediatek/Makefile
> new file mode 100644
> index 000000000000..8cde09e654b3
> --- /dev/null
> +++ b/drivers/genpd/mediatek/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MTK_SCPSYS)		+= mtk-scpsys.o
> +obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) 	+= mtk-pm-domains.o
> diff --git a/drivers/soc/mediatek/mt6795-pm-domains.h b/drivers/genpd/mediatek/mt6795-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt6795-pm-domains.h
> rename to drivers/genpd/mediatek/mt6795-pm-domains.h
> diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/genpd/mediatek/mt8167-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt8167-pm-domains.h
> rename to drivers/genpd/mediatek/mt8167-pm-domains.h
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/genpd/mediatek/mt8173-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt8173-pm-domains.h
> rename to drivers/genpd/mediatek/mt8173-pm-domains.h
> diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/genpd/mediatek/mt8183-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt8183-pm-domains.h
> rename to drivers/genpd/mediatek/mt8183-pm-domains.h
> diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/genpd/mediatek/mt8186-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt8186-pm-domains.h
> rename to drivers/genpd/mediatek/mt8186-pm-domains.h
> diff --git a/drivers/soc/mediatek/mt8188-pm-domains.h b/drivers/genpd/mediatek/mt8188-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt8188-pm-domains.h
> rename to drivers/genpd/mediatek/mt8188-pm-domains.h
> diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/genpd/mediatek/mt8192-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt8192-pm-domains.h
> rename to drivers/genpd/mediatek/mt8192-pm-domains.h
> diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/genpd/mediatek/mt8195-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mt8195-pm-domains.h
> rename to drivers/genpd/mediatek/mt8195-pm-domains.h
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/genpd/mediatek/mtk-pm-domains.c
> similarity index 100%
> rename from drivers/soc/mediatek/mtk-pm-domains.c
> rename to drivers/genpd/mediatek/mtk-pm-domains.c
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/genpd/mediatek/mtk-pm-domains.h
> similarity index 100%
> rename from drivers/soc/mediatek/mtk-pm-domains.h
> rename to drivers/genpd/mediatek/mtk-pm-domains.h
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/genpd/mediatek/mtk-scpsys.c
> similarity index 100%
> rename from drivers/soc/mediatek/mtk-scpsys.c
> rename to drivers/genpd/mediatek/mtk-scpsys.c
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 8c0ddacbcde8..9d3ce7878c5c 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -4,8 +4,6 @@ obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
>   obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>   obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>   obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
> -obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> -obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
>   obj-$(CONFIG_MTK_SVS) += mtk-svs.o

