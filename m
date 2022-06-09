Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B650C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iv3IyRfoBrWVECMidBojfgF9iqT1i2SWDwflf67P600=; b=RY7TxrBvh3VQvO
	jm75QAO/sOxbcVHiRm04h//G+eUKSMUFr/cpeP+faZjIfvJT09/98FNAWZBYAlsrObU/bBJbRW+x1
	E977qsCGH+SzJB9+pdJKo+fMKDrt6pS676fihR9nJSMweiLWQ+IYSyYNIQht+dzATyw5m8zLnC11V
	5d3PEUJINlzHK7NNxsrlFXSh9f/PIgGbWpMLcNHd0kYN3jjaq6C0J8rv+/xRSLhyfztTkIsNcnjQr
	eTreauPXdSAEHBZk/1KBkSmJ9k3BFknjhFbmEDCQJBq6srMy18oz4bnjYSUjMOB1MPcyIo2s8cNlO
	3j3E/1+CXKlfiQfJtDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJ1D-002Sf6-0x; Thu, 09 Jun 2022 14:20:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJ10-002SZn-BP; Thu, 09 Jun 2022 14:20:04 +0000
Received: from notapiano (unknown [169.150.201.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D51F166017AE;
	Thu,  9 Jun 2022 15:19:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654784396;
	bh=IGskQUzMVf3MzyO5y7ZT7G+KdfE9vPrMiktEA7GFgYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlRMs5kW5b4iU2ZLeEfP6jBr1LtN1syhRX3o0xPqAdaydhDzhfNl3DGRnSdnbC+AB
	 PRv+LTW1UFUdWBpQ2bsQOSRozNkWdYKVUeC69HiP+6/3izv/iXQ9BWUiNP/9HqJC3Q
	 dzVkodprlPUZHIQyylbAVunC74S64lADKQKupaAIsQ9G0nYl7dN28bvG+EHxDkfE/q
	 2Pp+WPxwiwChBKMq7gImqcsPaNTuTSs4oivcNE5eypIx54bnabZ718cbYMmYbkrZof
	 JGjcPalmCiC5v63bpzpYvOsU7XIGcVui3p+RJKXndNx0TlqVPxaaz90Z3Z9BW+vL2R
	 RxL8vyKohIyJg==
Date: Thu, 9 Jun 2022 10:19:49 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8192: Switch
 drive-strength-adv for -microamp
Message-ID: <20220609141949.j5h6esqjmoal3y2m@notapiano>
References: <20220531221954.160036-1-nfraprado@collabora.com>
 <20220531221954.160036-2-nfraprado@collabora.com>
 <1332454e2733d48fdf2396bcaed37bc3e33616b5.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1332454e2733d48fdf2396bcaed37bc3e33616b5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_072002_773490_43E8B9CB 
X-CRM114-Status: GOOD (  28.89  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Guodong,

On Wed, Jun 08, 2022 at 04:08:13PM +0800, Guodong Liu wrote:
> -----Original Message-----
> From: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com
> >, kernel@collabora.com, N=EDcolas F. R. A. Prado <
> nfraprado@collabora.com>, Krzysztof Kozlowski <
> krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <
> matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sean Wang <
> sean.wang@mediatek.com>, devicetree@vger.kernel.org, =

> linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, =

> linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
> Subject: [PATCH v2 1/2] dt-bindings: pinctrl: mt8192: Switch drive-
> strength-adv for -microamp
> Date: Tue, 31 May 2022 18:19:53 -0400
> =

> Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> drive-strength-microamp instead of mediatek,drive-strength-adv.
> =

> Since there aren't any users of mediatek,drive-strength-adv on mt8192
> yet, remove this property and add drive-strength-microamp in its place,
> which has a clearer meaning.
> =

> While at it, add a new 'if' block to validate that drive-strength and
> drive-strength-microamp aren't used together, since they're mutually
> exclusive.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogiocchino.delregno@collabora.com>
> ---
> =

> Changes in v2:
> - Added 'if' block to make drive-strength and drive-strength-microamp
>   mutually exclusive
> - Changed commit title to be more precise
> - Dropped Fixes tag
> =

>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 35 ++++++-------------
>  1 file changed, 10 insertions(+), 25 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8192.yaml
> index c90a132fbc79..c8092b218f2f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -80,31 +80,8 @@ patternProperties:
>                dt-bindings/pinctrl/mt65xx.h. It can only support
> 2/4/6/8/10/12/14/16mA in mt8192.
>              enum: [2, 4, 6, 8, 10, 12, 14, 16]
>  =

> -          mediatek,drive-strength-adv:
> -            description: |
> -              Describe the specific driving setup property.
> -              For I2C pins, the existing generic driving setup can
> only support
> -              2/4/6/8/10/12/14/16mA driving. But in specific driving
> setup, they
> -              can support 0.125/0.25/0.5/1mA adjustment. If we enable
> specific
> -              driving setup, the existing generic setup will be
> disabled.
> -              The specific driving setup is controlled by E1E0EN.
> -              When E1=3D0/E0=3D0, the strength is 0.125mA.
> -              When E1=3D0/E0=3D1, the strength is 0.25mA.
> -              When E1=3D1/E0=3D0, the strength is 0.5mA.
> -              When E1=3D1/E0=3D1, the strength is 1mA.
> -              EN is used to enable or disable the specific driving
> setup.
> -              Valid arguments are described as below:
> -              0: (E1, E0, EN) =3D (0, 0, 0)
> -              1: (E1, E0, EN) =3D (0, 0, 1)
> -              2: (E1, E0, EN) =3D (0, 1, 0)
> -              3: (E1, E0, EN) =3D (0, 1, 1)
> -              4: (E1, E0, EN) =3D (1, 0, 0)
> -              5: (E1, E0, EN) =3D (1, 0, 1)
> -              6: (E1, E0, EN) =3D (1, 1, 0)
> -              7: (E1, E0, EN) =3D (1, 1, 1)
> -              So the valid arguments are from 0 to 7.
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -            enum: [0, 1, 2, 3, 4, 5, 6, 7]
> =

> Can't remove mediatek,drive-strength-adv property, I2C pins will ofter
> use this property

Yes, the point is that they should use drive-strength-microamp instead, whi=
ch
does the exact same thing while also having a clearer meaning.

> =

> +          drive-strength-microamp:
> +            enum: [125, 250, 500, 1000]
>  =

>            mediatek,pull-up-adv:
>              description: |
> @@ -138,6 +115,14 @@ patternProperties:
>          required:
>            - pinmux
>  =

> +        allOf:
> +          - if:
> +              required:
> +                - drive-strength-microamp
> +            then:
> +              properties:
> +                drive-strength: false
> +
>          additionalProperties: false
>  =

> Property drive-strength-microamp and drive-strength aren't exclusive,
> just i2c pins support drive-strength-microamp property .

They are exclusive in the sense that both drive-strength-microamp and
drive-strength shouldn't be used on the same pin configuration. The fact th=
at
only i2c pins use drive-strength-microamp doesn't have to do with this, and=
 is
perfectly fine.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
