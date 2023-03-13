Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E986C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtUitPYdm6GZOjODqw1+9stkSdh2aDiJCWsKVA2L1XQ=; b=P/uTxDxPx31nosXMOT5i3H/TxZ
	kVbZE1D+TM4Q38pn8KOsz8LHOV6oZ+FObovkQRv6+ZBqe9MtTpSVM5MYUDYGqbD/yiuCgPDni0iya
	frnG9yUuDgZfdt+0XuKISceXO7zT7FiChJke3vKyE77XHvc0lJi/EMcYEd9kEN+i2MbEoqw/TjorW
	NfVCH1R0I7WShqKXvm4yCgQPaITuoybtqeg7/8itcfj38nkYxG3mhxjOqRLYhCb3gRyVhLU+gu/iL
	PbOPHVlvJ9ICqQaqtvkzdF+d/6/a8s42xBy0USs73f/ljuPBvamozyorO3bQU2IuP+oytyDlKNZgq
	c277GZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjmo-006Lxc-TR; Mon, 13 Mar 2023 15:08:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjmB-006Lhe-Jj; Mon, 13 Mar 2023 15:07:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F12A161336;
	Mon, 13 Mar 2023 15:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61411C4339E;
	Mon, 13 Mar 2023 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678720070;
	bh=9uDAGZu4CJyMoYzZK2RUuQqShh9kqX6wJsiU6PIlzuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qLMBvQhsNBgoWCgd+R9FhR31f+41+FX6l3p7oDgiAvisb1mK8aFGZeUWxTXcRinyM
	 A+9EJOnF3pr9gdQ+xqubBulIiZOFXfZ6IE2VWj4dqBlBh1ZCodv19JbU1PLy0l0Phe
	 dWuuZsI12q+YpDn/DW4XagMSw4VDFLGeD0YUQ0FwN7N5LO50rwjmQ+8x7qCQDEiN2B
	 ZwRW7ySB2tMHBfhmdf7w5Rr28ejjmZkX4P36GYwyZ0T1BeA78MHKSrwhDQVcnbbpd9
	 uapqtSh+bFX4p0MTokoXCoFnBsrhW9O0RSRpCHYUQY4X3nkgOHe4OSI+Sbohl45qkA
	 31vSu0JOc0MwQ==
Received: by mail-lj1-f173.google.com with SMTP id h3so12936799lja.12;
        Mon, 13 Mar 2023 08:07:50 -0700 (PDT)
X-Gm-Message-State: AO0yUKXfAvNs+3ni2p4kNjXc5DTM+/OJHQWb0i/9FWdVZU70PvYrBbzX
	uBFdjJeovGmgkmX56VxCyxOevW7K8GzaypG8GA==
X-Google-Smtp-Source: AK7set96FceeAgzIrNFk6O5tGtdzNZKS74mjeYqgSiEvYzM4A13lNdDb9HBRGzIk8lESKcb8+sqursSIAO3pnU2VYxM=
X-Received: by 2002:a2e:b55c:0:b0:295:d632:ba20 with SMTP id
 a28-20020a2eb55c000000b00295d632ba20mr10877049ljn.10.1678720068446; Mon, 13
 Mar 2023 08:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-8-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-8-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:07:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY__1rm_neb7UPDt0xum2Yr81++Z+uz0KMsLRm2QLvBUSFQ@mail.gmail.com>
Message-ID: <CAAOTY__1rm_neb7UPDt0xum2Yr81++Z+uz0KMsLRm2QLvBUSFQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: display: mediatek: gamma: add binding
 for MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Xinlei Lee <xinlei.lee@mediatek.com>, Guillaume La Roque <glaroque@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_080751_759084_A8759A7C 
X-CRM114-Status: GOOD (  13.60  )
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

Hi, Alexandre:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Display GAMMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index a89ea0ea7542..f54859cfc97b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> +              - mediatek,mt8365-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
>
>    reg:
>
> --
> b4 0.10.1

