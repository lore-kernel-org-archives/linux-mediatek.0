Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC72CFB449
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtoBBorIVdMWpMYPOMh7teRbyE8iAhVRuwfdj+9mNIM=; b=WgYHlfCqiiHJ0aosMIoh+37JjS
	IBMhKmJ40XpwtRhkNrtiwxGb+ZZ48ZSUf1p2J68eG+ygU1hqTDCmppHATIauLu+WqFqPkTxz7R8rY
	6ZYnH22RDCssHa09FUKY0quRcJiodRpC+OKed8TqtnMQDkSE17q1mY+5p6mv/iBsh3pj32sk17q7X
	KFf5ZTU6xE/cp5FAAbFwS/Pg3QLI357kv+00kmjivO3tFIRCE3OcVTkxBPiit/GNG5zpefaTMVH8W
	91u0fuQeq74w3mncV0EgSyOdwlOdl35glMrAiYYN5OpLl3dDgDcZPFCyl43yew2t5xsD2Fv3njp2/
	AOEoB9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqJo-0000000362I-3Y2a;
	Mon, 07 Oct 2024 16:10:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqHj-000000035d4-3pk4;
	Mon, 07 Oct 2024 16:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B7135C5C9B;
	Mon,  7 Oct 2024 16:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD7CC4CED7;
	Mon,  7 Oct 2024 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728317314;
	bh=mb/EntZAH5636vRx1tL6DIfFpHNmGBmg1NC7Jttx0u0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ufM7qYZHomEPYQZFDRLbhuB2kRLXduuT6tPJmzZ9+w5xuvpWQ5unFmSKN99rlJMXF
	 KubF7a2e9T1cKKDXBEBIuldmGbzmIe35Z+G7pSZj+tqKZ/YBCK5VmVAEvU9tVm/+wa
	 jXxRhwBcMjsTaVUfxy4nlusrw1AL7r3pI5Gx5sSNqE4/I//PW6Zom9HpG2KjIQ0gPd
	 bRa19dkswMkT1m+ZSnWTfA0bnr5KWPS/SnAqzF4E5jkYBCfWSEjV4lm2s7Ftzul4lB
	 djjztAuUUG8ssgM1PXQ/Mf+ca1LA3RHQcyvIYoSzrF7dM6dvM/blWXYu2IkDOG2q4j
	 WcR6k1gNnvYOw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad6de2590so67929011fa.0;
        Mon, 07 Oct 2024 09:08:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBlUvOSHnJeCD30Kv3yyfEoE/5bBpvTP5YsgpiwAG7kEkTtXc3NM9z4mQGWpTgmppuoMzP41d5vLLz5kD5tGAN@lists.infradead.org, AJvYcCXbuuNBGHYX6Wd3XfZpcdKsCUiR+osICNf869I5A3ggc6i8NzE328r18wE+6lruo/JbFpLVT6fdaUbn7A9nMpw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwY/LgqHP2ZznN1lTHGThaNoAgw+Jf2cd3Px/oL3hoqODYFCPlL
	HjX3It9IsJ04z+/D8Drru2cEF1CI4JhyQ/NfTj0S2ObM9+aKqiNN8FtlExHTBT1A07BHQBv/WnJ
	nW/UK592RjSUWjt6PsZdkYi0sUQ==
X-Google-Smtp-Source: AGHT+IFkJ71X0YYr1aDhpcTISFu8/dx+ZpD8GCVANAoP91uoXdd+XPWx1OEAkEzHRsA84/JqVYKumeOPERd1hITbmKM=
X-Received: by 2002:a05:6512:398a:b0:536:7377:7d23 with SMTP id
 2adb3069b0e04-539ab9cf27fmr7669514e87.40.1728317312820; Mon, 07 Oct 2024
 09:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241004123423.34519-1-linux@fw-web.de> <20241004123423.34519-4-linux@fw-web.de>
 <20241005184449.GA505893-robh@kernel.org> <DA1815FE-D2A6-46A3-9219-9216A3C6D61A@public-files.de>
In-Reply-To: <DA1815FE-D2A6-46A3-9219-9216A3C6D61A@public-files.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Oct 2024 11:08:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKvJHf0OFpQf0uWeoqyCEvA4gdAyCdd7fD83_qQRSMErA@mail.gmail.com>
Message-ID: <CAL_JsqKvJHf0OFpQf0uWeoqyCEvA4gdAyCdd7fD83_qQRSMErA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: add binding for MT7988 SoC
To: frank-w@public-files.de
Cc: Frank Wunderlich <linux@fw-web.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org, john@phrozen.org, 
	ansuelsmth@gmail.com, eladwf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_090836_065375_A16AE1E8 
X-CRM114-Status: GOOD (  16.12  )
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

On Sat, Oct 5, 2024 at 2:41=E2=80=AFPM Frank Wunderlich <frank-w@public-fil=
es.de> wrote:
>
> Hi Rob
>
> Thank you for first review
>
> Am 5. Oktober 2024 20:44:49 MESZ schrieb Rob Herring <robh@kernel.org>:
> >On Fri, Oct 04, 2024 at 02:34:17PM +0200, Frank Wunderlich wrote:
>
> >> +patternProperties:
> >> +  '-pins$':
> >> +    type: object
> >> +    additionalProperties: false
> >> +
> >> +    patternProperties:
> >> +      '^.*mux.*$':
> >
> >Do you really need 'mux' anywhere in the name?
> >
> >> +        type: object
> >> +        additionalProperties: false
> >> +        description: |
> >> +          pinmux configuration nodes.
> ...
> >> +      '^.*conf.*$':
> >
> >Really need 'conf' anywhere in the name?
> >
> >> +        type: object
> >> +        additionalProperties: false
> >> +        description:
> >> +          pinconf configuration nodes.
> >> +        $ref: /schemas/pinctrl/pincfg-node.yaml
>
> mux and conf are used to match subnodes see example for mdio0_pins
>
> mdio0_pins: mdio0-pins {
>   mux {
>     function =3D "eth";
>     groups =3D "mdc_mdio0";
>   };
>
>   conf {
>     pins =3D "SMI_0_MDC", "SMI_0_MDIO";
>     drive-strength =3D <MTK_DRIVE_8mA>;
>   };
> };
>
> This is same as done for previous SoC like mt7986.

Why do you need foomuxbar? Please define a prefix or suffix (separated
by a '-') or just a fixed string.

Either we missed it on mt7986 or it was documenting something already in us=
e.

Rob

