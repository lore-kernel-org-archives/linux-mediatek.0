Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE0C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHLbgtC9eaEy5W5YoFrWu6seyn59kvRi1Sqb5aL8SbQ=; b=wizpXkMzbvfwA990WXrDZECxr/
	81pzgVRdmYKICKEwct+3yR51BWs29I3hksjJZ6b/ZlIgExnk7sh853ZQZ2hFJqlNIjEq7umTc2E3W
	bDfNds5kC2zIns0wYStAD+lKZT5RlQqlzW8vxkU0UcYTm4ktSKymXID787vKy5MKrEjhMwsv37Mqh
	+cdTxi+34e2LjxS0BcCdzOIW7odnddzIbetseNEeBHqaexN2kNEzTUELJrDeFNxTu9wVadyXPgtl3
	zZw+6VizTyWIascr0fenJ0rrno4w/pJzdXtZmOxaFcv0NSpPHOYlDtR6xQueNS8EIbgG/DiRd5CZK
	55nfB+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUr7-001oJs-Nl; Fri, 24 Feb 2023 09:59:09 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUr4-001oG8-1M
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:59:07 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id o32so3131571vsv.12
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mHLbgtC9eaEy5W5YoFrWu6seyn59kvRi1Sqb5aL8SbQ=;
        b=b69Xf5nQRII8T75C7CsYVxwf87GZLuEg4VUM/9OzTISPIzUjpLShl0lZFXdWbKCt+X
         WJzVjMA3yOfm2KzrLljPqDRvdVly5mzoYjxjQPT371EwoEUaMw+v8yBdF0Z0fpc/clGU
         ld/oyVLQr9zvQC3Pb0luxYoNfHWC65IpaqVjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHLbgtC9eaEy5W5YoFrWu6seyn59kvRi1Sqb5aL8SbQ=;
        b=xw7Tq0oo6TFkmV1vyk7f9PP+lP0YjerglGPQ30i4AeYRiomc6D/tIp8z5XCSDMUyrH
         MHJAbbpbT1U8ZKicG6Kmm70FETsgrke+uv/+U1VeMa8GxcwYJuqNLkR1DfztYlzXOgsh
         thlnF4Yay4GRCvXpnoxmLDxeeB3L5U48kSpEcYAyxjrAxsLoOESfZYD/qZMlv0Ohb+uy
         423JgnOF5CqwRk/djhEJJhZmPapz3/5aCaW0B+R4tgX56joTy4sFR6KCORMIXdnjczi8
         WhKUzzuOQpc6n1CMCaSH7QQYfCMLar1hCaY0kKJA8nPPC/I7Xldp+QLRByJgHR1zmLN6
         gw9A==
X-Gm-Message-State: AO0yUKVLwJzY0yKOX/vs7YvKGVWiWlDaPKRFNiMtFByPnb+ibhnaXDCU
	7C4G/8UlcHfNBeQfob9WAmQl5rTjjcetUA90XgJRBQ==
X-Google-Smtp-Source: AK7set8HsPgFjiHEs8kJFwTbhza2xbhJLtQBIrep9NpSiN29T9vZ8VfsQAshILBJ+x0txHKlIjDOG6ygccqaFbZz+/k=
X-Received: by 2002:a67:c584:0:b0:41f:641c:f775 with SMTP id
 h4-20020a67c584000000b0041f641cf775mr317973vsk.3.1677232745205; Fri, 24 Feb
 2023 01:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:58:54 +0800
Message-ID: <CAGXv+5ER-Z9WiRAKEbfKV3hzNQu0Xru-z5QUJA85wzrwzY7hcw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015906_150223_F17A6042 
X-CRM114-Status: GOOD (  14.06  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as VSRAM_OTHER is used to power the
> GPU SRAM, and they have a strict voltage output relation to satisfy in
> order to ensure GPU stable operation.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> index df477eb89f21..c8b6e1a9605b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
>         regulator-always-on;
>  };
>
> +&mt6359_vsram_others_ldo_reg {
> +       regulator-min-microvolt = <750000>;
> +       regulator-max-microvolt = <850000>;
> +       regulator-coupled-with = <&mt6315_7_vbuck1>;
> +       regulator-coupled-max-spread = <10000>;
> +};
> +
>  &mt6359_vufs_ldo_reg {
>         regulator-always-on;
>  };
> @@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
>                                 regulator-max-microvolt = <1193750>;
>                                 regulator-enable-ramp-delay = <256>;
>                                 regulator-allowed-modes = <0 1 2>;
> +                               regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
> +                               regulator-coupled-max-spread = <10000>;

Also fix the constraints here? And overriding the constraints should be
mentioned in the commit log.

>                         };
>                 };
>         };
> --
> 2.39.2
>

