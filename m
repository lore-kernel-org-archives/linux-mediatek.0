Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9460AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 00:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8ep5VE4Jd/b4r4ogljlZOm7D2uXLnypsbAAMjxbfpQ=; b=trIZUiFXCSzupA
	APLZetVfLZf0l6hHbOgeTH6mT7eUxZ2wfWR889vc1VElMTeLUwl+a5kOupvI0HQ+zYYJU+BMVXJDB
	zRjp0FihqqEtHbL/znGiv1aM22Nxb25bdrKvgw710b6Iz0aRmVLgwLU7WVGQ7h5rhIJzpJjRBhhcf
	/qbnP8bzdC/8ZZ4JU8AY0UMa7LPer/W7fIfiDf+8eslouVcgeqs1qY7a36Ozn2zef4xJH11LH0Mh5
	Kk8AGQBAZNIyyUN0x/0tLRO59MYO6bs6J+Knfw6nqkwY75W/ccp2JAKXdLJXyhMo75oRrMcNDETvV
	ibVSPJ2WIakAJwzHr9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm2xs-008E0V-3B; Wed, 04 May 2022 00:34:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm2xf-008Dxg-BV; Wed, 04 May 2022 00:33:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 85EF91F444CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651624424;
 bh=TylGFKA0mcDRkdBchYF01blEZNeR3QM7S0kr0QFnDGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vq6G2DgbhFyEjIpWgnVbtXcEPE2N76ZLLeMs5umG13ZdJRuxX48zw3XoQfYnVbVad
 fhuowVUpQVkRfXZnhOzP9Ywe9uOtTbwnnGuK/CfGBV5DUodZq0bZfRZ4kj/f4s40iJ
 Z3XJgU1ycDccCFAw8+LLasM0x1wjreyEF5RT6W3D3Bko9zNddR8vm1mUdyni4Fbe52
 lKHStXiEzoLqM7ONLuro3r2oyKhJSOhvZmcdCUdSeVLlabhGlVp216B0V3L+M2F8vU
 mWYEzlu5sfKdahIhTHRTyyPWWnkxVXkJt++9GYV/nc7A5QNOYs6Rw1l9xZlfJ0jz6K
 QpDHiWLBqeckA==
Date: Tue, 3 May 2022 20:33:40 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
Message-ID: <20220504003340.224exvr33qevi3sj@notapiano>
References: <20220503142537.152499-1-angelogioacchino.delregno@collabora.com>
 <20220503142537.152499-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503142537.152499-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_173347_641869_386ECAAA 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Angelo,

On Tue, May 03, 2022 at 04:25:36PM +0200, AngeloGioacchino Del Regno wrote:
> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
> =

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 224 +++++
>  include/dt-bindings/pinctrl/mt6795-pinfunc.h  | 908 ++++++++++++++++++
>  2 files changed, 1132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pi=
nctrl-mt6795.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h
> =


...

> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt6795 pull down PUPD/R0/R1 type define val=
ue.
> +            description: |
> +               For normal pull down type, it is not necessary to specify=
 R1R0
> +               values; When pull down type is PUPD/R0/R1, adding R1R0 de=
fines
> +               will set different resistance values.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt6795 pull up PUPD/R0/R1 type define value.
> +            description: |
> +               For normal pull up type, it is not necessary to specify R=
1R0
> +               values; When pull up type is PUPD/R0/R1, adding R1R0 defi=
nes
> +               will set different resistance values.
> +
> +          bias-disable: true
> +
> +          output-high: true
> +
> +          output-low: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          mediatek,pull-up-adv:
> +            description: |
> +              Pull up setings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are describe=
d as below:
> +              0: (R1, R0) =3D (0, 0) which means R1 disabled and R0 disa=
bled.
> +              1: (R1, R0) =3D (0, 1) which means R1 disabled and R0 enab=
led.
> +              2: (R1, R0) =3D (1, 0) which means R1 enabled and R0 disab=
led.
> +              3: (R1, R0) =3D (1, 1) which means R1 enabled and R0 enabl=
ed.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          mediatek,pull-down-adv:
> +            description: |
> +              Pull down settings for 2 pull resistors, R0 and R1. User c=
an
> +              configure those special pins. Valid arguments are describe=
d as below:
> +              0: (R1, R0) =3D (0, 0) which means R1 disabled and R0 disa=
bled.
> +              1: (R1, R0) =3D (0, 1) which means R1 disabled and R0 enab=
led.
> +              2: (R1, R0) =3D (1, 0) which means R1 enabled and R0 disab=
led.
> +              3: (R1, R0) =3D (1, 1) which means R1 enabled and R0 enabl=
ed.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]

I'm actually myself trying to figure out why there are two ways of setting
R0/R1 in the dt-binding (and which should preferred for mt8192 and others):
1. passing 0-3 to mediatek,pull-{up,down}-adv
2. passing one of the MTK_PUPD_SET_R1R0_** flags to bias-pull-{up,down}

When the pin is of type MTK_PULL_PUPD_R1R0_TYPE (which should be the only c=
ase
in which it makes sense to consider mediatek,pull-{up,down}-adv AFAIU), the=
y end
up doing the same thing, it's:

mtk_pinconf_bias_set_combo() -> mtk_pinconf_bias_set_pupd_r1_r0()
vs
mtk_pinconf_adv_pull_set()

... and they write to the same registers.

Unless I'm missing something here.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
