Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BE0E77180
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=; b=pbgThPO4ikrsO8
	UMDq4fhC1RYsFD25CL0In0m3aLRFU7DJp4rm1XrbZuXMn171uDPuzW4TC0+7fVDkODF2r2TC7v+Em
	heBH2IMlHlyC0U/ddThU/WbmHrFln0o3L75Y1fWW4YvtCYqMU3wyQcTQtDcbR7udpjt1sprvHS0m6
	XMaj3LyZb/wgFQyt7n6Ql15uKlgzNsTDphL28V6ycATnmmiBhGd5TyTp7bpL60R1t893jP3g+RGab
	KjUP0Dej9LxXfoXHHIjVwBHurgl5S5CGV2JHm/hsoZq2bLZFMY9XD7XDV0jPaLKvh1suRzIhRPYhc
	ZUw/+0X+jpNTw2tJNHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2sX-00000003Poc-3W86;
	Fri, 13 Dec 2024 10:26:37 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2sV-00000003Pnn-2tQU
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 10:26:36 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-71e2a32297dso810214a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Dec 2024 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734085594; x=1734690394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=;
        b=b0llVnNe0uHfcVtLsZkeAC0mFR3IPxwHO0JFTvPyFnE+W9xnUpYDE9YGaBe9stL2XW
         HW0GPdX3vk+O52dgP2sd3wJemH0asmKF9LLqRK+smG6jXT/7At/h93nQM/vQoDCYVPXf
         /oz5ZGwZSX40+7Y4ldWetS2JlfpxyAgSzSklI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085594; x=1734690394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKqDqgeGFaNiglPykk1ZWFq+KoOVfgPfTAi6q8lDcbU=;
        b=fwAqPOss/72fMg+ynHZzhxgDk8EzXAALFgJbOdWd+rmcHr2jWT119JLcygY6YFOM2N
         PskqMvovmHnjMkc4JZtPbDG6P1ZjT1PZgID7e6waRbqcCgioTLydUM0XA9d+NUnoVrK+
         RNBYSupyMHH1aHMFfMC6h2nxW8j5dFFYM2aTGxVV8wDTFTknTv4o8JyJN17qlql6XFw6
         fyrnM69z7dDBYUvw23pEo8rkSd3CM/g6RZ3dkBQIe+3+V25cI4v1H7WK8oQ+3O9MP77W
         7dA8PzOu3zWPtrUVB2h8WfyXqD1r0PmSV92OJtZowGCD9G20w0pCX4yW37zBmzCKagUj
         sP9g==
X-Forwarded-Encrypted: i=1; AJvYcCWLYIyDcDzunoCxTvCX6HIspIAAwooQ7wIccZK00hdFGWQ3mdwtR8b2+4pRWKzBsiM6C/u46OM+K99Mp+g02Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9VuWzaNkEUdSueK/KE9j4/E49SjywDsgDRuifp1D2YTMJgZn1
	mS3hwslKAC+Uga7wnHCeABqbKuZZdSkPxiSNEZbw2JGo6v1kefVRf/UB8hITOC2TSKJrlkgqRx2
	yPsYkkQMurdVs9nrBxl46IQe/kzMyVgJb6MTU
X-Gm-Gg: ASbGnctHNGGkLqWY1iaMN6cV8spQzhDU1Q6XJHBGhiDh1mP+7r8zg+q/J1Lk3dYYQ2Z
	3GKQdaE5t0fYc79l/4KjhiP4kz7E/q6g6ZPY9jgMfhbJVTrt+M3258cMdELjbptAP
X-Google-Smtp-Source: AGHT+IENCMH98mpXyF3VrVAuDfFFYvkYege6xGr7xJlAm+RCTMb9aQXAq9gG3Wn85+C8PlkKAH60Qe9TT1gWu6utMaQ=
X-Received: by 2002:a05:6830:448a:b0:71e:30e:e022 with SMTP id
 46e09a7af769-71e3be44e5bmr1104651a34.10.1734085594573; Fri, 13 Dec 2024
 02:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com> <20241213095044.23757-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20241213095044.23757-3-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 18:26:23 +0800
Message-ID: <CAEXTbpcp31oWOCh2c41QbWOc5F_gpD1Bia0NiZeVyDbqKo98Lw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dts: arm64: mediatek: mt8188: Update OVL
 compatible from MT8183 to MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_022635_748215_81C2042C 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jason,

On Fri, Dec 13, 2024 at 5:50=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to update the OVL compatible from MT8183 to
> MT8195.

This probably doesn't need an (immediate) respin, but this patch needs:

Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes
for vdosys0")
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index faccc7f16259..23ec3ff6cad9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -2488,7 +2488,7 @@ jpeg_decoder: jpeg-decoder@1a040000 {
>                 };
>
>                 ovl0: ovl@1c000000 {
> -                       compatible =3D "mediatek,mt8188-disp-ovl", "media=
tek,mt8183-disp-ovl";
> +                       compatible =3D "mediatek,mt8188-disp-ovl", "media=
tek,mt8195-disp-ovl";
>                         reg =3D <0 0x1c000000 0 0x1000>;
>                         clocks =3D <&vdosys0 CLK_VDO0_DISP_OVL0>;
>                         interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0=
>;
> --
> 2.43.0
>

Regards,
Pin-yen

