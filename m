Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EAEC87FD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=; b=TQ/wgU53Mv0h0yK7v6Ti5YddcW
	brRRlSIdX7bQykJ0GuqwJ6G2cPyXdokkPNRG/JkybONQ57bPar5XGkEcm4SeeKpFelOBYXN5sLebr
	Wo2x2U3+mH5Ix79/9ja6EmHp0xYelRQZ7+L5Du78qpoIYmu5DmK2tvGFzQvHzOahPuf3Hp0BWsxJz
	DpyTFRfSpP0L5G1ihU0pyh4u9rW2qZZfO7HCs/eAntLk8inscjxKKnz6Pk26czfBiCcMJlrEbfRk8
	u2YE24D/VvX0e//sFAuM4dG61/8OYYSNmhgkbUZNBIbXkK881oUmtcYk1WfKT7xWbB9x87P6mgKeh
	sHLxREyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHIa-00000009nEX-1e3P;
	Fri, 25 Jul 2025 12:13:16 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGsS-00000009kV6-1BX7
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 11:46:17 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ae73b0a891so34757911cf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443975; x=1754048775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=hyRaSlWwMiNNmTSoqev/t15EygVSifJ88oXZ/MBIJA0BauT03OWLX2/iCw4f5Dvq4s
         frDaslvvAYzLF0AkofpsBV0WSA7Wst/lwX+du1aQ0iQl3qW3aoBRct4zN3ruOer/b+/w
         4d5HuqKey5ysKHPbqk50/Ds9P/75Q1yH7Llsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443975; x=1754048775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=tVQjbHeK2kU4WTSRyi0sNjhakCsNusGW8YWcFHRBMK8mgMmwCMMHb44bUb30uuX/jt
         +j2LEhaeNlg5LwjObtnJqyr1f60oD9lvs6yq+0W1+FxuHc+GjIBIlbfVAJoBrcNAmV46
         2LX64IEVs3qKbri7Dxr8TyeShLfT+SJuyY7+VIAsxZ0qhGQWMPH1vnKGQqHpQ88L22sa
         HQF95fib7es/ebyQ0+qwefw5LgvH/a6Yo4+2PDb6uwVjlj4sCJsLzxAVlDUaYpKJEMxr
         MOG3cYyfpGE6Rd83T/WG3+OQoeEJbSjta4/opsy57JGdGdBbMolCBXA0tXaAuiOgqYfJ
         OViQ==
X-Gm-Message-State: AOJu0Yw8ox6RkCpxjtHlFHWXVFlMynLHkeeV0hw88XFSUk6osX49e3pG
	WLKz3oT6eqEV08khxGsyYGgK0ytAaSAWPhK4R9yH5gsglri9s4nEfy51uWpaWfT1gI5AqHI2tPC
	XerF1qg==
X-Gm-Gg: ASbGnctr4u0qRdPYoR/Z5PW6X4xmkC2rgIuqKIQxRarhFG55EP5wqS0leGt2mUBJb7i
	nTDufrLKITecWpkGhhW3JP/NyIKx9SJBzRBOoXcM6g8SPsXRRV1fv9r5ByrayN8q0oi8ph0ezaH
	iXM9Ge1bVu28uYlJkXOR00MH+6VRAb5kKzG/7zL30wmAPCS6U8j541Zo6/EkVRPe1wQxLLjgpkg
	dzwBkqu+i3bMP8xNySmq5hN3qR2OycPCOvDEo2HQDde4arSgEfi7Xfym4OLiMIXUcE0mqWricWJ
	TEWKQeC0EPFr//iNJlU30moD25Q/Fyod0+hwJeaQuOZj2khCOfnpzZcz3NUiLRVW43VyT/pIroM
	LdbmZ2EgIvkx5KYu5VVBgpuKcJ8sTmMGfDQxOxMWnWvz5JWlFaCJn1szIhw==
X-Google-Smtp-Source: AGHT+IERYoUsP2KKqjShBhUP5bm3+B1XXDls2v8TeDZL6JI9SizFCwDAkjHJWX13DS5fRq8gvrm89A==
X-Received: by 2002:a05:622a:1654:b0:4ab:7e22:8553 with SMTP id d75a77b69052e-4ae8ef89ebfmr14573551cf.12.1753443974248;
        Fri, 25 Jul 2025 04:46:14 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae7e2c5de2sm23068581cf.13.2025.07.25.04.46.14
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:46:14 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fac7147cb8so27037416d6.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:46:14 -0700 (PDT)
X-Received: by 2002:a05:6102:4a8f:b0:4e9:a2bd:b456 with SMTP id
 ada2fe7eead31-4fa3feb1976mr334393137.12.1753439957846; Fri, 25 Jul 2025
 03:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:38:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
X-Gm-Features: Ac12FXzORC58mPF_B982fHDjnhtiL_-5O2nAq5PI4bkUJDNwvq8vw0VlaVEnRW8
Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
Subject: Re: [PATCH 38/38] arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_044616_316531_2BCEA70D 
X-CRM114-Status: GOOD (  14.48  )
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This devicetree contained only the SoC compatible but lacked the
> machine specific one: add a "mediatek,mt8516-pumpkin" compatible
> to the list to fix dtbs_check warnings.
>
> Fixes: 9983822c8cf9 ("arm64: dts: mediatek: add pumpkin board dts")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts b/arch/arm64=
/boot/dts/mediatek/mt8516-pumpkin.dts
> index cce642c53812..3d3db33a64dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> @@ -11,7 +11,7 @@
>
>  / {
>         model =3D "Pumpkin MT8516";
> -       compatible =3D "mediatek,mt8516";
> +       compatible =3D "mediatek,mt8516-pumpkin", "mediatek,mt8516";
>
>         memory@40000000 {
>                 device_type =3D "memory";
> --
> 2.50.1
>
>

