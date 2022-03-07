Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A57CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PzIdKrO8aUAvjs7r+tO91sT1qFvE7BvxAm//NODcHB0=; b=cIc1xRNMxeswyZiG4kljXxF4Ia
	laChZsBi/7px/g9waJpl/HHNIkjVCuTLQ4HAouRO/9nl4yEGmfexd+M7q1rilTQuzxJW6CFekkFtg
	qRgirlbAevQU2To3QCu2AzHK7EQ2CTFFqotFF38ABkcrSJlPGPwviXz4PmfDxEOQbhQFZ05ZRJ8GG
	IhC2wovSkzH1Dp0txeaBwso4EV0JhjApLiGht85mvDtf2BboniaELiDrq0cXwPl4/qZgRNM2Af6mE
	wi9m3SZIzb4zyvw0Qv7Bn5dOWMdiCwLifW8ucMzVnUVFZAqhEG+n7Izjx0FepzmlSsLUzST/8FsZC
	VvE6Aglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRG63-000oSs-CA; Mon, 07 Mar 2022 16:20:31 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRG5q-000oPL-Ss
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 16:20:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id f8so3809921pfj.5
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 08:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+wV1FY8U0FWB4VAPUiegJjEIq4RD3FNiqaa9wr6HZiU=;
 b=HHxBwJWvb+zcfYI6s9N+7pQZWwRNUv3GxQ6D78pso72TORyjd7Eoi7G9ZoGfaTtuvT
 +YGxjcgJNHZWubIdOEwRzBEmMlMeCxU6xnn1f9XqzuOOKCKZEE3tpPK3j+ID10hUCguZ
 mHOATnIR8CkGYTCe6H27Px6VUPMR5+JMrlpyHxw6vMj1MNjuazGNc5Y0F/PmAqBvVlTI
 Kv4UnmBTAxOAH+YXealbXzJMmAmoTZKL+68os0S0/EPJle5tuR0W5FsA7Nfgcc2pexey
 IDSK+9jDYCZdtn5MbsEssOwC2ebqPhbqCYaGzp158jtWQVu2VuUfq++MJyoHi2rzXy3d
 zzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+wV1FY8U0FWB4VAPUiegJjEIq4RD3FNiqaa9wr6HZiU=;
 b=VN2JiPALnpZdjg+ygsf9QmKTJ3HwPi3OtTtG+TUwGfLTAsVyjVQ81crQSuLrH64HUe
 x7EJdu/xkMwjUc78xLwCbTruQFQtpH/kGCSLObGotvNVvBjU5GdbAM8HwMG1qk65mpFP
 0GLWV2epAcTjzwksFCPv9Ie7jCdNKN/vOJt/zShdxh+pWVnkFTIC+fioY9rnSjwFdevu
 7I4TQDRmTWVFnEWa0MAbAtw/7b+txr4me58ZGfT2PKvPu7vSe6aOk0wL8DUSnnGVf38D
 V0p22fAERGB8sd8EWiAoOhFcllgyyx+HpAeoqt1HJM996FsJ4F9qg6fDYb7j6hp4VkKf
 KXJw==
X-Gm-Message-State: AOAM532Gzmy04oTEpSgpJvyRirpR1Yb1hXn9tI9+q+5Gy+v0A+ak3Nd6
 57RWM2RaiGmZx36SHs4lq6ApkOTGVdVTBnELWSUhbQ==
X-Google-Smtp-Source: ABdhPJx/V3uLVWBI8/E8KCOJyzUgUR2RjgCZBR6Hgu1VcR0R4QgDq/3T8EiSucOBT+/CPouLZFgIw7Ts/R5qlhZ+a60=
X-Received: by 2002:a05:6a00:24c5:b0:4d1:65bf:1fe0 with SMTP id
 d5-20020a056a0024c500b004d165bf1fe0mr13441313pfv.0.1646670017759; Mon, 07 Mar
 2022 08:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-3-robert.foss@linaro.org>
In-Reply-To: <20220307154558.2505734-3-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Mar 2022 17:20:06 +0100
Message-ID: <CAG3jFytGV3NNfkEPqx_rZX9O9aZjTjzo2tpeSK8mFimOrYt9zw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com, 
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_082018_984971_554DD035 
X-CRM114-Status: GOOD (  10.50  )
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

Signed-off-by: Robert Foss <robert.foss@linaro.org>

On Mon, 7 Mar 2022 at 16:46, Robert Foss <robert.foss@linaro.org> wrote:
>
> This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index e8f133dc96b95..8f7bf33f607da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,8 +171,6 @@ port@0 {
>
>                         anx7625_in: endpoint {
>                                 remote-endpoint = <&dsi_out>;
> -                               bus-type = <5>;
> -                               data-lanes = <0 1 2 3>;
>                         };
>                 };
>
> --
> 2.32.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
