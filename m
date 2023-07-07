Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFC0EB64D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 05:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YixM/WLSGJf1qwL6PB1mZuYZCMWeTmuQHQ6qlOcsvIc=; b=HEDAkMC3z+BzqIiLJLLFI0QWyp
	orxRMzg6Jtx/rXTtXK2b1fzJnEuDLLOhTH9bcU7MjYoPaCsJYCUHZfSxJtB7q0FsIO33AweA7Wd7R
	QPixqjlvVnsNJXO7vYEuZYsPwKS+eE6KV4KJxMMk1357C6PMpaNErboH/ZLxImfG+JEeqOo/f7qTA
	92RvzhZq2BV8s7HQYJ5ryNjvGOrVVV04fG2TxfIBmH6u0uEI9W79ChHWf/9FtSGAjQUS6gHihfnkF
	n1zsYuoxmyvSyDz6Cwcn72ic8o2E7UAoohzfESwTXiKexEr3qXyzDFq4qmCJFWDXD7TcNCM1xzcHm
	6VpbBMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHdfs-003ZQq-31;
	Fri, 07 Jul 2023 05:06:32 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHdfp-003ZPo-2C
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 05:06:31 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-794c5f60479so458317241.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jul 2023 22:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688706387; x=1691298387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YixM/WLSGJf1qwL6PB1mZuYZCMWeTmuQHQ6qlOcsvIc=;
        b=LT9a2YUGDO5kQmEO3MSNtwGYuwhXfiKIwP/C/ux/OEYzIDJNALPBLLtTqOmjdc33MT
         dLsn/PIfjf/6GoE6FXyfoI/BrOPko1KUPWIVoMfKiVtz3aL8xQKxd5mzLNekZyPfe+GK
         MSLdaVW8wM483IjH/aG7rudumN8axjQRPPUD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688706387; x=1691298387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YixM/WLSGJf1qwL6PB1mZuYZCMWeTmuQHQ6qlOcsvIc=;
        b=HRxVPF3kBqCBYFgLhfPhfE5WmL6N36kIr/IXcy9VbpYjUeFkiGehSdl1G6umfIgxFc
         zjy3Lg9CJNDjLIIhKGy4gfOr/R5Yyt9/timDC2bKmXmVG8fXw9aVh+DzeSmY6WQ3K29R
         CcZ2xICxLHiwz8IP3uXuxJnNCCJP9vUGqWdMta1W+DbfDCU8eozkvrt8VVt9EJyiRAGq
         rHITMVMZd8rOtBoFv2GP8r7pmn3+VxDA+laRJqelhi7kaQPcpIsW92icclpCBD1p5R1c
         NiwhiAU0quXKs2zHFtd7lxEPc78G2jYlN+nhSlPJTyeYE103KXvwFuLIJz0c4mwF9XoU
         fEtw==
X-Gm-Message-State: ABy/qLZupd/d4r0zVLkhAc78xbHxbhCeSFFqaHfRfDO5BFD4kMFG1PSQ
	d7bRz7LysMqemYN8cUpfTCWoUQX/nFZZH2NMbp55vQ==
X-Google-Smtp-Source: APBJJlEWfZFngfeJS3xkCxrgzBn1WgBbvbfaNP+KgVrfXaPTMaaIJkETKa31fIULWcXnv/IoqwoMwtxKZAfSG/yld2k=
X-Received: by 2002:a67:b646:0:b0:443:5b1f:12e4 with SMTP id
 e6-20020a67b646000000b004435b1f12e4mr1567954vsm.9.1688706387057; Thu, 06 Jul
 2023 22:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230706095841.109315-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706095841.109315-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Jul 2023 13:06:16 +0800
Message-ID: <CAGXv+5HsScBVMOY4JcSNS_ZZdpLnNAYWUKohwmfQr6gJJv26CA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix PM suspend/resume with
 venc clocks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, yong.wu@mediatek.com, 
	tinghan.shen@mediatek.com, weiyi.lu@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_220629_743036_EA07E2CD 
X-CRM114-Status: GOOD (  18.98  )
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

On Thu, Jul 6, 2023 at 5:59=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Before suspending the LARBs we're making sure that any operation is
> done: this never happens because we are unexpectedly unclocking the
> LARB20 before executing the suspend handler for the MediaTek Smart
> Multimedia Interface (SMI) and the cause of this is incorrect clocks
> on this LARB.
>
> Fix this issue by changing the Local Arbiter 20 (used by the video
> encoder secondary core) apb clock to CLK_VENC_CORE1_VENC;
> furthermore, in order to make sure that both the PM resume and video
> encoder operation is stable, add the CLK_VENC(_CORE1)_LARB clock to
> the VENC (main core) and VENC_CORE1 power domains, as this IP cannot
> communicate with the rest of the system (the AP) without local
> arbiter clocks being operational.

Somehow I feel like this is papering over some dependency issue in Linux.

> Fixes: 3b5838d1d82e ("arm64: dts: mt8195: Add iommu and smi nodes")
> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index 95bd058d6083..5c670fce1e47 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -626,6 +626,8 @@ power-domain@MT8195_POWER_DOMAIN_VDEC1 {
>
>                                         power-domain@MT8195_POWER_DOMAIN_=
VENC_CORE1 {
>                                                 reg =3D <MT8195_POWER_DOM=
AIN_VENC_CORE1>;
> +                                               clocks =3D <&vencsys_core=
1 CLK_VENC_CORE1_LARB>;
> +                                               clock-names =3D "venc1-la=
rb";
>                                                 mediatek,infracfg =3D <&i=
nfracfg_ao>;
>                                                 #power-domain-cells =3D <=
0>;
>                                         };
> @@ -688,6 +690,8 @@ power-domain@MT8195_POWER_DOMAIN_VDEC2 {
>
>                                                 power-domain@MT8195_POWER=
_DOMAIN_VENC {
>                                                         reg =3D <MT8195_P=
OWER_DOMAIN_VENC>;
> +                                                       clocks =3D <&venc=
sys CLK_VENC_LARB>;
> +                                                       clock-names =3D "=
venc0-larb";
>                                                         mediatek,infracfg=
 =3D <&infracfg_ao>;
>                                                         #power-domain-cel=
ls =3D <0>;
>                                                 };
> @@ -3094,7 +3098,7 @@ larb20: larb@1b010000 {
>                         reg =3D <0 0x1b010000 0 0x1000>;
>                         mediatek,larb-id =3D <20>;
>                         mediatek,smi =3D <&smi_common_vpp>;
> -                       clocks =3D <&vencsys_core1 CLK_VENC_CORE1_LARB>,
> +                       clocks =3D <&vencsys_core1 CLK_VENC_CORE1_VENC>,
>                                  <&vencsys_core1 CLK_VENC_CORE1_GALS>,
>                                  <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSY=
S_CORE1>;
>                         clock-names =3D "apb", "smi", "gals";
> --
> 2.40.1
>
>

