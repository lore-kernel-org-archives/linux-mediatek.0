Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B076CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2fZLF7avs5DMWOiIq0KHN70cPnOtcv4SASIDsj8Bss=; b=QgLA9SQgvsKyGkggOEDCK1B4jJ
	ox7tiRuFCqQEhg+k65MpsjVX7EIEIXFFP4a+timAKHe3BiEQwiP+EwZdByVAE/goSi5f5lWBwJ9Xv
	RBvCIHmhgObyfcDKBGumoUrybkg9S0PwWNob8ZiwCQNr285ivtP/M+V920M9faXX5QzXUet+1zjmB
	PZ96hFF2AKYwER4Rpro1eR4axLUch2P6aoprSUT+uVsBrowf+vZl+W+HcOvNIAbD9zTe2PQYyiZ5v
	0tMUGLJqCAwyjbhJ7defIMCxgAq9drpLhCi+V2ZyPW5bncznQ8c3LpXyNggFuv9SxpVfBCiy+CDe1
	nHPSLj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjCa-00000001mez-0K9d;
	Mon, 07 Oct 2024 08:34:48 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjBF-00000001mMY-3Pmj;
	Mon, 07 Oct 2024 08:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728289985; x=1728894785; i=frank-w@public-files.de;
	bh=A2fZLF7avs5DMWOiIq0KHN70cPnOtcv4SASIDsj8Bss=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZNWgu8DrAe/eKpJcC/I90IMyOuylpe8velQNLGn6gPt7kHRWfqimqZF2nWRmMhht
	 cers30UCLltSbGOKHcL/ohELzk1jrrSnq12CSbeZTiRVtV1kGQcPpDqyIAmQknu55
	 MwnM9ZUL4h5KjXp3wiEHEWMIg1cwuDwP+ogKuYuJrGQmg4FoO6DNcuiUmvtoES5i1
	 0FhYlribWvfLqEOn5Rmh7VgaNVauwtRVpEqxiWi0CGIGKlVFQXzmpr39G5RTl4bVD
	 +WwvMZ/BjW8RuTntoP8MIRC0YkDdWvuDeyYnAhO3FtkquPZPkcsPmSdX/qUphuRKx
	 W3UBnLS/vdPum/7m1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.101] ([217.61.153.101]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Mon, 7 Oct 2024
 10:33:05 +0200
MIME-Version: 1.0
Message-ID: <trinity-6fcf3e00-393c-48ee-9aae-26057be08645-1728289985089@3c-app-gmx-bap03>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, eladwf@gmail.com,
 ansuelsmth@gmail.com
Subject: Aw: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Content-Type: text/plain; charset=UTF-8
Date: Mon, 7 Oct 2024 10:33:05 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <b41c51c4-775c-49ca-84fd-1137b61f42d5@collabora.com>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-2-linux@fw-web.de>
 <b41c51c4-775c-49ca-84fd-1137b61f42d5@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Ngq4NbOlruE7F2nvSl8B/hBNQ0cqZUCijyM1oY0+exKRh5yziWcQFPujSTI76d8tuiNlN
 ePhetGWdhfwlPwuroZR+LeQ52I6zrO+BaFlRauwM/LGrHf97qDEYvi1vbIsbDCtHoz4y+GEbJ96y
 NdAf1bdyUr2PA4xUWNua7cFJA77ZCXImJ3vBuVzOyHgVvGvPX9ElX1FmANCS+1CjuH3oo7LdJTuy
 Aa4kyqqTVb/FFJJ5DVKmSJVoHHfGqUXJbNSS0qMvEi6jaTmKYLUyzcFziPhevpHOdRBJu0fpb76K
 3c=
UI-OutboundReport: notjunk:1;M01:P0:ReyKzSXbLaU=;4XGj64i7glxekjhy0Bn5tOpJD2m
 W5QpJJfhz+SgNilocL4rJDFuPMmtYrkXEhlgHsqy6f49qbDSzDOY/uO0LY0wTeH/zDKf9YtB4
 eBntgQuH0TIQD5QiYd5DMLNX1fPD4b4Df//xF3XPNjT9+kt/k51Do2C+QrFAeIxZDnj/iN8VT
 X3Yy/gTwT+2LDU6I98Oi8YJLitliJOtsxsWVvsedCk6fEEc28Rn5VELQ4gMiBsc/N8ofBndBo
 t7x2duAYQyY+IPIpyV75Mx1r0pCLuE9i0bmlwyW2l+dZjF8hoLfbUY4tqwRfn0sJIL5Mx5QCb
 fibzPsaWP1ZvN/B83gI7La/50xAYxtngVW3HhvXr51ucmJDxAponFrPJPHN5iFE5a812kjH3T
 3c3tgxbaBis70rTnhCb7MoPv+uwB+VxVuHiSnHk4rVdzvogY0/aIpx5Gttp5Vv/b82bmj6Ile
 qzhQRAZjdNfReL+xe4rArgEyCC239pKINT9WhkUqX2YeKBoiKFEwTkOU1XcAW1LLn8cndTo26
 N8BsGp8sGRaE5tDIMra1hUQ8qC/nHSfAd9oW7ZMgEUuAGs87uKTYiXUH/pgQf3owtdLFYy491
 ucThy4yU8vYfWZTpJ48v5hl2Ephh5tJ+1EWkVIWF4k8CcVRCAyoKP8IModnEUpjwWqHffDmIk
 V4/KzGXLsyap2j3YY16lFV9TzG1nZz9h85/uLfNy5A==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_013326_169561_A2FA3C4B 
X-CRM114-Status: GOOD (  15.42  )
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

Hi

> Gesendet: Montag, 07. Oktober 2024 um 10:00 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> Betreff: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
>
> Il 06/10/24 17:34, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add binding definitions for mmc on MT7988 SoC.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v2:
> > - fixed minItems to 4
> > ---
> >   .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++=
++
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Docum=
entation/devicetree/bindings/mmc/mtk-sd.yaml
> > index c532ec92d2d9..7380f72ea189 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -21,6 +21,7 @@ properties:
> >             - mediatek,mt7620-mmc
> >             - mediatek,mt7622-mmc
> >             - mediatek,mt7986-mmc
> > +          - mediatek,mt7988-mmc
> >             - mediatek,mt8135-mmc
> >             - mediatek,mt8173-mmc
> >             - mediatek,mt8183-mmc
> > @@ -263,6 +264,29 @@ allOf:
> >               - const: bus_clk
> >               - const: sys_cg
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt7988-mmc
>
> Are you really sure that you can't reuse the MT7986 compatible?

have not found a way to reuse mt7986 binding because clock-config is diffe=
rent...
from driver view we can use the mt7986 compatible, but from binding view i=
t is different.

regards Frank

> Cheers,
> Angelo
>
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +          items:
> > +            - description: source clock
> > +            - description: HCLK which used for host
> > +            - description: Advanced eXtensible Interface
> > +            - description: Advanced High-performance Bus clock
> > +        clock-names:
> > +          minItems: 3
> > +          items:
> > +            - const: source
> > +            - const: hclk
> > +            - const: axi_cg
> > +            - const: ahb_cg
> > +
> >     - if:
> >         properties:
> >           compatible:
>
>
>

