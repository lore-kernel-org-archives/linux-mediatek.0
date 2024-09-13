Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5675FC6181
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 21:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfk0i+iHLhvJ3k9z3I3WUDqMwnqUv2LP4qomLd8DLTY=; b=ochQoa7zDbGZMN/LnU2aFmCA8r
	ZrryLBRuhQce26y4RAlxP9OvOLNZ/vRJFHK4ws152zavq9NzWOok/oOUZU4DB+vi3/jg/+Gu+Lsvb
	jXkkUHUv8SKiZRZTc58OtJaBbJMbfpNcsEQpqA7F6QU9pVwG+DppBcOEQbw0Xuy8Y/i7/5Obt2DOP
	gjaKgtzC/aOIFXpoSZegha3F2NoO1b84jOLxP5DFQWAUFIcFIx5wh8FwqE/gwiSk1zfmGqgGMbOjc
	hNkJztmi7qbqar0/OXc2wFnT5oEXPZReGq4aQdCcX7znyuOOHyunAcTsF+Dq0e3WEwKi7mI+MXh0s
	SLOlpdQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spDzx-0000000HBAl-0nX8;
	Fri, 13 Sep 2024 21:38:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spDyr-0000000HB59-3bqK;
	Fri, 13 Sep 2024 21:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13DA5A45A2A;
	Fri, 13 Sep 2024 21:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EAAC4CED1;
	Fri, 13 Sep 2024 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726263447;
	bh=manW/XLXA8gVmKWJwstgFB2hSWZWCj5W3+3ArJJtYCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WmHtDYoRSLlStBr4+JqA3TLmkSnIto885ESxtd3uz4a9nOn2Dj0z+8Hof6ptOTjI7
	 9m8nWQryaXnu6DnH/3uWVEnx30IdftMZNPr1tiJ42oUowZtob63ACpkc9yO6EFqMOS
	 +BllsiEAgEnvh3ABvMuyTVjLF7h0btiqfOeTAW10y1VPe1ac4j9BzOg83TwR84yEES
	 C+eZikkDPtBRpZd35Onmbhw3WBqUa6faarQAoksnG2KlTDMX+CYORgLuw6C0iJYIOv
	 apvuyhjH0XIg8qEY7hdnGE6vcoiX2izuA+JyiC5uyN3w+JRHZLMUPMNh3YmaoAkJFF
	 l5j37iToF4qJQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f78b28ddb6so22852981fa.0;
        Fri, 13 Sep 2024 14:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgG1miP4wbX9JeeXYCODD9cF4JgabkcDrb1Rh3244QiXkBfbTBTevb87ZZ3X5EzJaCJBuViCe1TYFaAwGUYq0=@lists.infradead.org, AJvYcCVlvPQUywqi8jKho3ir0gy+HU41P7QjyWAwfRLJCjUh3VzOrQvr/Kt/HcjSM05F90k97/tab/B7cRTojgnZnySi@lists.infradead.org
X-Gm-Message-State: AOJu0YzaSrqZKxKA5BYPvEOjtGlHs2gfh7R6tjVhdj+bUum6ChskLhPa
	fjEhbH3MepIzyTfFvs5sLPuJUI3biQryww9V2EKpSUrFLNhURY7q76aCbTMnBsTc6zljNDesL3T
	K7plm2t67hnwPWhbfG1GKApx4HA==
X-Google-Smtp-Source: AGHT+IF3i2ra1hDCoZJWXdELHFse3nu1BoApDVkgvdYBd1QEEsCBiERlIo516YbDjDMsGqLm6EgWpki4O1VGoMBcV4M=
X-Received: by 2002:a05:6512:b96:b0:52c:e133:7b2e with SMTP id
 2adb3069b0e04-53678fc9930mr5368033e87.35.1726263446242; Fri, 13 Sep 2024
 14:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240912144430.3161717-1-treapking@chromium.org> <20240912144430.3161717-3-treapking@chromium.org>
In-Reply-To: <20240912144430.3161717-3-treapking@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Sep 2024 16:37:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
Message-ID: <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add port node to dpi node
To: Pin-yen Lin <treapking@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	Jitao shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_143730_044186_3245317F 
X-CRM114-Status: GOOD (  15.36  )
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

On Thu, Sep 12, 2024 at 9:44=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add the port node to fix the binding schema check.

The dsi node has the same issue.

> Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409110843.Hm5W9upr-lkp@i=
ntel.com/
>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8183.dtsi
> index 266441e999f2..0a6578aacf82 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1845,6 +1845,10 @@ dpi0: dpi@14015000 {
>                                  <&mmsys CLK_MM_DPI_MM>,
>                                  <&apmixedsys CLK_APMIXED_TVDPLL>;
>                         clock-names =3D "pixel", "engine", "pll";
> +
> +                       port {
> +                               dpi_out: endpoint { };
> +                       };
>                 };
>
>                 mutex: mutex@14016000 {
> --
> 2.46.0.662.g92d0881bb0-goog
>

