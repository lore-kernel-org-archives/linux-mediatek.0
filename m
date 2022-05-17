Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEFKAEbYvn/UzJrKAk/s4xY58M0fRzzJ+s5qqRARGp8=; b=nH5Xt0GVbF72a6
	sSE+jE+niwCKzJqVVPqcOOxCBxbLyWl0rP9zfUMMAKqleYpagzVoYAYE8vhfBMePL6NWh+5rP/mZt
	3wQjGO8nDTpEBTCd+n5WwAuF//7Wv8Y/+gNXi/3d+lllGOjw9atkQr2st4JrOCM7B8DZyG0h0kf62
	tsuPAuVK8dcfutCngCZSHqqbEZmgRo/yxqFuaYvIzxYyjtE6Wsg61c8VpaHkfmjdsYjDNS4FKOOd6
	tKkmFk1nP9/cFyO1ruS3g8NeWE57azheD9xua0AZl2pBYtmv5j5qaY7t/ZBFFdYeVUl9KXCeJKM1X
	pZXUNIc+TmIZxvWp9GPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr4mx-00Fx9W-NT; Tue, 17 May 2022 21:31:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr4ml-00Fx5k-R5; Tue, 17 May 2022 21:31:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 91C2F1F44529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652823075;
 bh=HRSS8woHfbhaBMvzaEElxv/TxCPiPytRs/B9ys0Aolo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d7DGzljIgY1ZUvR5X0+e6kZMprNH2UzQ0A7u9HHHGywLCvjflIHY/vRiItTD1r2/z
 PQK6qSyuBWLGZatA2CENsvMqzWAs3ccA3dmVxFkZ5GiJtk4lhRC4C8yHkK+ixfzXMI
 uZfyEHtxSpggJFkbTYKHs8l6+yWib4hHXJkmRSROTIzvBOyD/VY8B+1nQgcBYkZwqA
 6i/5Ej9kgfoyU/cgrj9KEsQPWuWZH/QeMdygKYBjumnKQ4RCJXAA+04HCCvWRyxaQA
 9ezs/V0EEFsYXFXwyuljwTKZDQWkm9o606knMWZ6MEyFmZjTAISPUH58MFutFtRusi
 HJ1xFS6Hld++A==
Date: Tue, 17 May 2022 17:31:11 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8192: Add mediatek, pull-down-adv
 property
Message-ID: <20220517213111.22slqxqhbaxc22f6@notapiano>
References: <20220429200637.2204937-1-nfraprado@collabora.com>
 <4adf790c-5773-a78e-3c8e-2a510e3dbd1e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4adf790c-5773-a78e-3c8e-2a510e3dbd1e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_143120_126792_F1E79AE7 
X-CRM114-Status: GOOD (  21.69  )
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

On Fri, Apr 29, 2022 at 10:31:52PM +0200, Krzysztof Kozlowski wrote:
> On 29/04/2022 22:06, N=EDcolas F. R. A. Prado wrote:
> > Add the mediatek,pull-down-adv property to the pinctrl-mt8192 dt-binding
> > to allow configuring pull-down resistors on the pins of MT8192. It is
> > the same as in mt8183-pinctrl.
> > =

> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > =

> > ---
> > =

> >  .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml   | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.y=
aml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > index c90a132fbc79..e462f49eae6f 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > @@ -117,6 +117,17 @@ patternProperties:
> >              $ref: /schemas/types.yaml#/definitions/uint32
> >              enum: [0, 1, 2, 3]
> >  =

> > +          mediatek,pull-down-adv:
> > +            description: |
> > +              Pull down settings for 2 pull resistors, R0 and R1. User=
 can
> > +              configure those special pins. Valid arguments are descri=
bed as below:
> =

> Trailing ':' should be escaped, so '::'

OK.

> =

> =

> > +              0: (R1, R0) =3D (0, 0) which means R1 disabled and R0 di=
sabled.
> > +              1: (R1, R0) =3D (0, 1) which means R1 disabled and R0 en=
abled.
> > +              2: (R1, R0) =3D (1, 0) which means R1 enabled and R0 dis=
abled.
> > +              3: (R1, R0) =3D (1, 1) which means R1 enabled and R0 ena=
bled.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            enum: [0, 1, 2, 3]
> =

> It's okay, but for all these and other values (you have few such in the
> binding), you should maybe add header and defines. It's much more
> readable for humans...

OK. I'll look into adding defines for these.

> =

> Is the property valid without bias-pull-down?

Actually it doesn't really make sense to set this property together with
bias-pull-down, as they set conflicting register settings for the pin bias.=
..
I'll add a condition to avoid both being present.

Thanks,
N=EDcolas

> =

> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
