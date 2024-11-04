Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8148D132D0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nWI6Xd/q/LZwmtaLVMw4xyJRrOQePjMO2FUfWARW0Q=; b=FBsREtbSIQ7ZGLEkLRHPPfDCpc
	BswJZ3BmY8Eg8EBu7RdILlYWw/tRe3Iuq/epvgBp2qfrjDMjQdUr0dqf9i4FadIBRwF/cims5/h7L
	C7TNyCT3Dwm/b+ygMX0OEDgiRCo/l4CDCRj7R+x88oJop141wwPGWxBN4HrV6LVzTwwUEkWToXkRU
	t8APz0hjUA9Dd3RIgqOYNBwLYTvrFyubpjYqyyZTDnNa/yKQ7dV8c+s8rHmpT507dIak0Tx6t2qCT
	lbTxM4MemffZKHxRfwcTrMWkt8BoF3O5tWRHUZkgCIWrGrMumW5WhKUgvQka2MmY0VRMuKuelKovW
	iu3yx3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xsH-0000000E0qv-2Wiw;
	Mon, 04 Nov 2024 14:16:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7whQ-0000000Dlsi-0fAD
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Nov 2024 13:00:53 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so3907062e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2024 05:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730725250; x=1731330050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWI6Xd/q/LZwmtaLVMw4xyJRrOQePjMO2FUfWARW0Q=;
        b=TSrLY8cER/qEASnlwfRVBg8bICY1n1hjvf6QNY7HECCgo1GDu+4/xnJmQYMdltHEJ5
         ucMTcbRmg3XNhMq8z4klxwOQE+ihPTk1p6IL6Wn1i6eEHc+ZvnfwVPx4ABm2F/hpxC1c
         0ZWVDfpxVCMLPUGPESvIRlG8Wb/6UXZibwlNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730725250; x=1731330050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nWI6Xd/q/LZwmtaLVMw4xyJRrOQePjMO2FUfWARW0Q=;
        b=NvAdTSnaq6WCfGe7sGg/WEQNkRb62lAAH6ARn8MG1t+ftl+ViCFO5rWr1tiNInZ7GY
         yOEKMVlhBWdW1bHKwxNUNFH7ZT0kpdhKnmgTxfvX1D9rJnqR4rtL+WU0CizYPfZw3PCS
         QUoTIo1m7KKC1qc3QpP+7L6Z0lKI4YHo/KznQ12H+twjELeGxQgu5VWhKyEgbF+X4jzy
         c/K7bbL0sP4DI8fMO12f3M8GAwqfYFympB4UruUA49RRVuYOI5vigR4pCnx0+GTMAbUa
         jVH/X1aFw8yyHGmfi78joldioshpHQStySntEbzPqQ9XQxZAy118vAigyiYmtGZ3WDeN
         DuzA==
X-Forwarded-Encrypted: i=1; AJvYcCXlTTF/GXvp9nr+9aWOHXpetKaE8i5Lpb1KDR+5e7/FbO0Var31cqAzHU2MmNeL0oy1Vn2BbEMTU0Won9sGNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgIlvRTxJIG8gWhs63f+IoaOM/nx/fx8MtdQ/MceqQDutk4Kko
	9QvhhzvmL+jJyV1xlNjTwx1Gq7hMoAgXgJfXLh1ph1+Vw7EvqYa+bgpq3CU91b2062S2Z791mKQ
	AyJvVyAm6b84/ObkPuRXuHXEdr9/GCVxkM01EtwQOykUxATU=
X-Google-Smtp-Source: AGHT+IEaB8ZZda+xiJN8hKjO+7R4XsS7rVORV17qPKkGoFiz7+eoeVha8v/dIRlM1DAoeMrrYQuRDQrFwr1eS5hM8ts=
X-Received: by 2002:a05:6512:3404:b0:530:ad7d:8957 with SMTP id
 2adb3069b0e04-53b34b36e63mr15028995e87.49.1730725249927; Mon, 04 Nov 2024
 05:00:49 -0800 (PST)
MIME-Version: 1.0
References: <20241030070224.1006331-1-wenst@chromium.org> <20241030070224.1006331-2-wenst@chromium.org>
In-Reply-To: <20241030070224.1006331-2-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Nov 2024 21:00:39 +0800
Message-ID: <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_050052_205780_B76D09D1 
X-CRM114-Status: GOOD (  15.65  )
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

On Wed, Oct 30, 2024 at 3:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The pp3300_panel fixed regulator is just a load switch. It does not have
> any regulating capabilities. Thus having voltage constraints on it is
> wrong.
>
> Remove the voltage constraints.
>
> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I see that the other three patches were merged and included in the pull
request, but not this one. Were there any concerns?


ChenYu

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 783c333107bc..7bbafe926558 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
>         pp3300_panel: pp3300-panel {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "pp3300_panel";
> -               regulator-min-microvolt =3D <3300000>;
> -               regulator-max-microvolt =3D <3300000>;
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pp3300_panel_pins>;
>
> --
> 2.47.0.163.g1226f6d8fa-goog
>

