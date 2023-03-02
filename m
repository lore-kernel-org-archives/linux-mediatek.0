Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC1C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spMK8uenDqn36oHL1e/zBfnn5QTutF5o6W99Pq78A9s=; b=0QNYGeDxP1OjotgxaotJpP4EKf
	ksIqeReZvQH0SzrIgpO8Mn0Ak1XcPazbCAl1D9dlwEw3J+nREH4bOppGjUAENdJUShl5eWg9qVcc+
	bRh81TcnMAcV4/5zFYbdKjvk6tzqF3yps1fWIJ0XNAbB2uFpEARNK8MOgjzVVeWNop+YSkDpgViPA
	//aqManAbMyy0bl6LMDNxK560YNm/xZJPkQswUjk2oVunCeKpHkI7K3Q7XtFy7iIoA09DQx7hZkFg
	BfgE2NW3zUGIhapWArNtp0Pq2JOwGfawkHI5sFA0le/9HlFMhJCC6qZs+9Ti8yK3KtNzR9jlv4B9B
	zu9UeeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfmV-001azl-6T; Thu, 02 Mar 2023 10:03:23 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfmS-001aye-8w
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 10:03:21 +0000
Received: by mail-vs1-xe33.google.com with SMTP id a3so22021334vsi.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 02:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spMK8uenDqn36oHL1e/zBfnn5QTutF5o6W99Pq78A9s=;
        b=KXj8JUuCq/H7nA3qF+PWOtRzKW5T857VuIHKsVE7+XCCQ8eikkXbUFkeWhAc2ZIt9D
         lG8vviX//AJz1h2UVA8NieOiOZXik0s6LDk9r3j/A7fU8jnqTi5iaL7iN24amOLdJKBv
         N6GDybFjbmuWB/8QesrvzSo9ur2djqAJ5Bh3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spMK8uenDqn36oHL1e/zBfnn5QTutF5o6W99Pq78A9s=;
        b=hxP7Rad3MVYFRPUqsWj4BGuHWXK98vkvBiEJUuVUWAOm/EJe+4pHlG4j+iCw5rzoy3
         y4KIB2tP+w0I2XZvC0AxoUpd88JQDa7NbVodgZb0yUVRyj6xKEOM5MmZdD88nEJmvQLS
         9hmewnZxLRHe9rXxLv3vSYziBbOfd+naI57LOvkaliz3uVuOHHttIzISu1+Z1/saR041
         CqRw1hjKvmQgnpQYef6gn/4JC5UOy4rwIohiya8pEU8CcI5oStU6CRPP8LS8PrzN4u5Y
         QZW8pRjfDwU0SwM2gLbkuooWlqSllsEAzchqXqFaPD75TkkamwUcmsugvJSgz/vvPvD+
         fjrg==
X-Gm-Message-State: AO0yUKXFQIWKB0xUAELA9Y0qpGIOgRzzJq9EmJbQhVVagGCVfS62lMec
	hW8vi3LgzgHrWM8xZiqHA4Fpl+ETC5plAJu8acZLSg==
X-Google-Smtp-Source: AK7set+SWaRZ2OD4u8G2zQvT9dzOZbWXsp5NQKzNronyBvqX9kSb9fKWCyUNsfD+0ceCkURFLuMECx5o+xPfJ9qzsKI=
X-Received: by 2002:a67:ec52:0:b0:412:2ed6:d79b with SMTP id
 z18-20020a67ec52000000b004122ed6d79bmr6383028vso.3.1677751399157; Thu, 02 Mar
 2023 02:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com> <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 Mar 2023 18:03:08 +0800
Message-ID: <CAGXv+5GHdtbheL6wxtDo-szk+=3BGk2z93SBowd4Z=E9XupZkw@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_020320_374518_38830850 
X-CRM114-Status: GOOD (  15.80  )
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

On Wed, Mar 1, 2023 at 5:55=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as VSRAM_OTHER is used to power the
> GPU SRAM, and they have a strict voltage output relation to satisfy in
> order to ensure GPU stable operation.
> While at it, also add voltage constraint overrides for the GPU SRAM
> regulator "mt6359_vsram_others" so that we stay in a safe range of
> 0.75-0.80V.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index 8570b78c04a4..f858eca219d7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
>         regulator-always-on;
>  };
>
> +&mt6359_vsram_others_ldo_reg {
> +       regulator-min-microvolt =3D <750000>;
> +       regulator-max-microvolt =3D <800000>;
> +       regulator-coupled-with =3D <&mt6315_7_vbuck1>;
> +       regulator-coupled-max-spread =3D <10000>;

Looking again at the downstream OPP table, it seems there's no voltage
difference requirement. It only needs V_SRAM >=3D V_GPU. Same applies to
MT8195. Looks like only MT8183 and MT8186 need V_SRAM - V_GPU >=3D 10000.

Would setting max-spread to 0 work? I ask because with both regulator's
maximum voltage set to 0.8V, there's no way we can reach the highest
OPP.

ChenYu


> +};
> +
>  &mt6359_vufs_ldo_reg {
>         regulator-always-on;
>  };
> @@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
>                                 regulator-max-microvolt =3D <800000>;
>                                 regulator-enable-ramp-delay =3D <256>;
>                                 regulator-allowed-modes =3D <0 1 2>;
> +                               regulator-coupled-with =3D <&mt6359_vsram=
_others_ldo_reg>;
> +                               regulator-coupled-max-spread =3D <10000>;
>                         };
>                 };
>         };
> --
> 2.39.2
>

