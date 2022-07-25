Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2D3C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LVjJZ3vZnsHBYWH91XFfNQq4hkSx4/m7XWPR5zW2rM=; b=v/UstvYWzxXM8bQlTKPuJuDWC7
	/VJQDP+wdztDLPkc33z4zmSgKBKDekh0amP8njkrVaIhQW5tfHQSVi1dbWzcmCIhBdubkklGfEIOY
	vmjfK1ABsAi2+taOUM/Enu5lOf7K2Td2WuJdCEa5BptXCewhvw+oSlqx9hfykUHABTMIEWyTkvTPa
	Vl87r7BfQe8TFGTr/A9KuqR5uFzAIfyFocHxVol+IAVqqSy7YcSy7EmLa4FVZmCsnIS76dFzFJ0gv
	eDgplZeMiyiOgT3ezzDv6R7/esZVIAkkIHYeYgZTYwhKdLM43rRG6gi5SxN1Ev78jBAY5qFnPgUGN
	67/sUcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt08-006RNc-BK; Mon, 25 Jul 2022 07:59:40 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt05-006RJ6-82
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 07:59:38 +0000
Received: by mail-yb1-xb29.google.com with SMTP id p132so18706063yba.3
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7LVjJZ3vZnsHBYWH91XFfNQq4hkSx4/m7XWPR5zW2rM=;
        b=A4yPo/waVaMIqiTi1D3gcMPCRhfFyDMubfV4Ye7jWo15S5jIz6uB9pGlDRNwR+UEkD
         GkoQ3T2bTCUVib5nqdJFiKC8TuGcSIUhW73cMzUYc15erc9PJ3bJNVk1tZAsuMvah8/F
         WAuTrmKmpbQ9GW7vd23p41ImSbU8YL34psKJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LVjJZ3vZnsHBYWH91XFfNQq4hkSx4/m7XWPR5zW2rM=;
        b=ighPC1YScy7N1WVZUsgw8GDfqogeMQect17mPl1GZfo13hBbgDMQoUr7ZMvTXy+zXl
         uSHaDhuKuS32GwQraROfqNGl76ZTxLg6o+BUhs9oJjMuTp/BRsU0r8marwp3/y8sRlLK
         /Nn5oNb/p6KoJWbj3nXawL2nYRQLvAHs138B70I65o6DzWGtUaC5GDFILUCUm2p2K3vO
         vwZs8tYfD8x3JXGeyqh7uIiuyNQxp5Ty5//lYzim0V/OaTKTjORoMVkFMQonYXU9OKKi
         I/JHHpL43AMUbYOjzzuoph0C6sSWW2WHvE2zCAWPSDwQhsXO+0RLMvKD8/WM2thehQcI
         E4cQ==
X-Gm-Message-State: AJIora+2thLeDMhiw1Ql+5KdzXVxD+ur9fuAcFntUTGwKyB2y/ZAP32x
	l0PfYI9sX0yD6XJrQwi/eHw3iYLO5Oqiwga/gln0lg==
X-Google-Smtp-Source: AGRyM1v0HxzW8vtags5zI75LJuEW/+tx6Jwb+I4b5Af0gdhsPwG/G07wonpdlzb5E5ap46RBTKqTtHsQt/XnayBqYFE=
X-Received: by 2002:a25:d852:0:b0:66f:259c:17b6 with SMTP id
 p79-20020a25d852000000b0066f259c17b6mr8769449ybg.438.1658735975662; Mon, 25
 Jul 2022 00:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com> <20220721145017.918102-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721145017.918102-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 15:59:24 +0800
Message-ID: <CAGXv+5E_Q6Z9RA6VQDHyn6E9xb-C0AmEx7JR8Lc65ofT1YE0sw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: mediatek: cherry: Add keyboard mapping
 for the top row
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_005937_349033_A0932BAE 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, Jul 21, 2022 at 10:52 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Chromebooks' embedded keyboards differ from standard layouts for the
> top row, as this one doesn't have the standard function keys but
> shortcuts instead: map these keys to achieve the functionality that
> is pictured on the printouts.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 87ac2b4f9814..2853f7f76c90 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -821,3 +821,33 @@ &xhci3 {
>
>  #include <arm/cros-ec-keyboard.dtsi>
>  #include <arm/cros-ec-sbs.dtsi>
> +
> +&keyboard_controller {
> +       function-row-physmap = <
> +               MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
> +               MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
> +               MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
> +               MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
> +               MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
> +               MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
> +               MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
> +               MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
> +               MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
> +               MATRIX_KEY(0x00, 0x04, 0)       /* T10 */

I wonder if we want to add the sleep button to this list, since it is
technically part of the first row.

ChenYu

