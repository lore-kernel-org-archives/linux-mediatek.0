Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjACJRHez5QJTg6NtB7jRKUB6zEWSaV5de2TOdPvPjo=; b=MOQGpqJux2ddq7pMtXzVPvlK5l
	laNzeq+lGNk+z0KcaMSBl8mB9NZnnDbpaCf9tdKyZehcdursU/CHOQqC9PyPDAb3N+NtF3TPqo6Kg
	hicjSs4oLor9tpSgzaIoi+18QKQPFAafVosu+/sesEb0H0uqPD0Wkvcunkji4ZKAgb9z+Amdo9j+q
	IfzfE46btW0fEaggpcJrcAuO+T4zZlnyfl2rSuJGTJQjU8sajJLTcPKbrpsNYTVby2YK1zH8iaMOJ
	SB6LcK8XXql2xC323ipptdRax9XXv7E5Am/Jqhcl47IMHdR03T4ipU+1YYck7WXGWTkV/LjH7hNdw
	zhP+S3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjnc-006MN8-QK; Mon, 13 Mar 2023 15:09:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjn4-006M58-P4; Mon, 13 Mar 2023 15:08:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 29172B81189;
	Mon, 13 Mar 2023 15:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D2CC4339C;
	Mon, 13 Mar 2023 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678720123;
	bh=S10P55qoSefp3tquh9o+ql/D/gx54XqqWmAW+yYAqF4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rtS14mijajCdyZs+bskRh+6uFKJcx7ON6bKWosMSmTcPWMG7MAyDvpAR4h2a9YMWa
	 slPJL7WxpBELCd6ldj/RYFaamtJCAl/f1FaZzuLN0tKiFf2ghyENWAHdefKUQ9PMif
	 uLlaHovpUaByHArd19eCmIbOt4kT1hNXTdUofhYJCsvofyXHSyBlq31onqe55gtDiL
	 eCzVZiK8pBYLTIyEHj0rSJbASJv/wJUNtGb+/JOJXzGV3uJs0ckasoIBkaRFwgPy+1
	 mZq7nHIa4gdntqeukIiEPfSl6jGFfWr54Ul84g799to41lvPWcrLzOQC3+M3v1qZ2Z
	 PKoXeDruUSJRQ==
Received: by mail-lf1-f54.google.com with SMTP id g17so16138444lfv.4;
        Mon, 13 Mar 2023 08:08:43 -0700 (PDT)
X-Gm-Message-State: AO0yUKUtfH5ySG3Vm6w8lQYQo0RbUR/PSE+Kz4S9GhbCerd/WN3gKAC7
	e1MX+CZ4ouot4ooKMc7faYsnysu1zxBWhb7nbA==
X-Google-Smtp-Source: AK7set8O8oG4SXhOvRL6HCMEQolVFDwrGrQP5nswTrxrSjexg5YyYijOPMKZuhjj2e7ORk3z38TIJ8Y5USlb96Za1fE=
X-Received: by 2002:ac2:5923:0:b0:4d5:ca42:e43e with SMTP id
 v3-20020ac25923000000b004d5ca42e43emr11026612lfi.7.1678720122020; Mon, 13 Mar
 2023 08:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-9-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-9-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:08:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_--qP-PBBt9zZwcMewiWB-ow_n2XZSHFAz7FeU=v1Hj7g@mail.gmail.com>
Message-ID: <CAAOTY_--qP-PBBt9zZwcMewiWB-ow_n2XZSHFAz7FeU=v1Hj7g@mail.gmail.com>
Subject: Re: [PATCH 09/21] dt-bindings: display: mediatek: ovl: add binding
 for MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Xinlei Lee <xinlei.lee@mediatek.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_080847_172100_8DDA49F9 
X-CRM114-Status: GOOD (  13.80  )
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
> Display Overlay for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8192 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index a2a27d0ca038..20e4ca4fc915 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -41,6 +41,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
> +              - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
>
>    reg:
>
> --
> b4 0.10.1

