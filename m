Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD78C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//tcbZAfA88wCUbnshuR+mwlgHVasQuHxcdFOALzbv0=; b=NkAOXR62HjBKnFY14SzalV8lHq
	MBHGpnND4aAgRqvNAr73unbVp5A9IOiWTPsjXlBDBoa97uXW3Eea7DguS/BiVin4Ac6eUESCYowkQ
	+5aDxDua6ldJ+cG5qU0Taze1ikrhkIn8Q9B3mdxe7s5i2+Ur9gFVNHYSycK4Yb1j7dpq8NdAWZ/ic
	s9yqzq6JQsUsaW5RlYCN9r6kTinw+YO1Y2dHcWyRW42Nm1WGNg9IybrUUpu2SZ7qjxVidS347H5EH
	5AaLr/SS6gWK4CJfPKqRSl1B15R/1SWmztslhRRP/Fh90QSp/xpcTtOCsKk4ZUMO/Ac/D9GnZjXvO
	OScNcoxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7IcL-005hZF-FF; Fri, 01 Jul 2022 15:31:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Ic4-005hPU-8A; Fri, 01 Jul 2022 15:31:21 +0000
Received: from notapiano (unknown [193.27.14.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5210F660194C;
	Fri,  1 Jul 2022 16:31:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656689478;
	bh=z052kP4hfB8gSwGmauqevNpl/h4dfkQWDsl3Df3UJEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ie+CqVG7TZ1FdMjN8qXgzQKJ5XPLxMvIDk5BuEFxgGtv7A1mgat8nsFLiRVWMw6L8
	 bnkTSzr8FRMZZtWQc+ywHUngWZFgurCK/Ysq7DxkQyCe0/b8GnDZuunLAaHfxMDQqT
	 xogXa0h7rNiWHWmw/GtwTZh8fiTHpVdQJtCEKxQc4+VEp7X9h/rR5mg8s3fzBzWUQt
	 PhGunL8AAgW8aHMu2T1PPm1bJf+9P2teAWWHlJVLgGD+rS5Nsd/ZCHW1Oz08bJEUhf
	 RWTq3HaC0CcFe12HXJ63XtMvnshZzbvMzuUb7C1tIlkQ9aV9P2+v8gFV8O4cvEVDSJ
	 FC7YVe2eafc8g==
Date: Fri, 1 Jul 2022 11:31:11 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry
 Tomato Chromebooks
Message-ID: <20220701153111.glbd6gophzipwtjk@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_083120_471592_4287081B 
X-CRM114-Status: GOOD (  14.64  )
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

On Thu, Jun 30, 2022 at 05:33:06PM +0200, AngeloGioacchino Del Regno wrote:
> Document board compatibles for the MT8195 Cherry platform's
> Tomato Chromebooks, at the time of writing composed of four
> revisions (r0, r1, r2, r3-r4).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index dd6c6e8011f9..3e0afa17ed2e 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -144,6 +144,19 @@ properties:
>            - const: google,spherion-rev0
>            - const: google,spherion
>            - const: mediatek,mt8192
> +      - description: Google Tomato (Acer Chromebook Spin 513)

Hi Angelo,

searching for "Acer Chromebook Spin 513" I found that there are two different
chromebooks:

https://www.acer.com/ac/en/US/content/series/acerchromebookspin513
https://www.acer.com/ac/en/GB/content/series/acerchromebookspin513cp5132h

The first one is a Qualcomm based one, while the second is mt8195-based, so I
assume that's Tomato.

They can be telled apart by the model name though: the Qualcomm one is
"CP513-1H", while Tomato is "CP513-2H". So I suggest to add the "CP513-2H" here
in the description, as well as in the cover letter, to avoid confusion between
the two.

Thanks,
Nícolas

> +        items:
> +          - enum:
> +              - google,tomato-rev2
> +              - google,tomato-rev1
> +          - const: google,tomato
> +          - const: mediatek,mt8195
> +      - description: Google Tomato (rev3 - 4)
> +        items:
> +          - const: google,tomato-rev4
> +          - const: google,tomato-rev3
> +          - const: google,tomato
> +          - const: mediatek,mt8195
>        - items:
>            - enum:
>                - mediatek,mt8186-evb
> -- 
> 2.35.1
> 

