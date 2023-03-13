Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A324C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugT9vS6Kegq5JhpPI406zKmI6siKl4Xnfc8u9RbeZmY=; b=IZPeiUOVkRQ9LlDyUcMk/1r9nh
	p26HzJOJhiqljSPFDCmfZYcCse4+ZsVET3/H8NI6Rw5wXxJqtD6mTi3SwNCNA6ylAiIzeD5YqsQZa
	eCZkh3LFtwwEGZ/0Vo1sk7qgjjmOCdQVmn14i4QTQvBhagQlld0L5ODMpP2A2bDqIOdM+HQAbv1mp
	heCydCEU7V/BM5szc7coi2g4OhQ6XVbRQN6z5Yzq8rMndFkJAyVhlVqN34QcQdizZ3tDr7EqO7JOK
	YfCaKSm+1mFT5wsZxANbu2eS/2elrnOPZZpzH4+6bQr9NdR6ciYVelyqDEv06Ydkvtoe7snPmuTx1
	GMy0gKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjbk-006HEm-PO; Mon, 13 Mar 2023 14:57:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjZZ-006GCi-Pd; Mon, 13 Mar 2023 14:54:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7A24612DB;
	Mon, 13 Mar 2023 14:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586FFC433A0;
	Mon, 13 Mar 2023 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678719288;
	bh=RVi6fYh4jybclxQm3QSDLUaM4YKWRTrtAmRx285rCA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cM1G27iTXCbtjnquaYYI3WJoOMkxRI7Lg095C+TvPxUqCEG2N9PUrxt+4eDw6Fo13
	 1s8k6MItUTpVNKa466frh53U1N3ZpaekD7nqaiLSp7FybBL3uUcBP++EZvYHAQ20ul
	 MFrbjP905X7LNe/hZhEN9foi4qomPCRpSuU7ucFdlCB4klOzGHjhIBhjqKhPP8vUMd
	 f8T8Ys1ZbqfFrgIjmXI49fdZLOPIGdxpJ61c9SjN2ShfiCQdQDZtolEumHknDrtqDb
	 fEFCRNUyCrX7quaNtC+090z1yZbCr+74VgXRZZrM6q3RjkumiWehRc1syj8lMQQhq0
	 3Ln7vyB+XJ95A==
Received: by mail-lf1-f46.google.com with SMTP id bp27so5767982lfb.6;
        Mon, 13 Mar 2023 07:54:48 -0700 (PDT)
X-Gm-Message-State: AO0yUKV3S61GDxwFCcFA407jOtce5rB8mdkg9sOUmaNkTWSrHEg46OdM
	X/iVUYqFVcbtM1Qwm8cHwbnV0KI88LbDWl5NiQ==
X-Google-Smtp-Source: AK7set91DAOiAyN87RQ56AGE3nCFsEr0OgCQZvbecBdzLpNVYUAUkjxVgFVuI9G8uAGwMUvkIQJG6G76y+EnIBlWV1A=
X-Received: by 2002:ac2:4c29:0:b0:4e8:4117:67c8 with SMTP id
 u9-20020ac24c29000000b004e8411767c8mr1602846lfq.7.1678719286373; Mon, 13 Mar
 2023 07:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-2-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-2-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:54:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-k2YoVjQExBvqYbN-Gk7vc4-FiB3UhzBXARzS_aAyCYg@mail.gmail.com>
Message-ID: <CAAOTY_-k2YoVjQExBvqYbN-Gk7vc4-FiB3UhzBXARzS_aAyCYg@mail.gmail.com>
Subject: Re: [PATCH 02/21] dt-bindings: display: mediatek: ccorr: add binding
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
X-CRM114-CacheID: sfid-20230313_075450_031432_477BDB27 
X-CRM114-Status: GOOD (  13.49  )
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
> Display Color Correction for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 63fb02014a56..fc999e614718 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ccorr
> +              - mediatek,mt8365-disp-ccorr
>            - const: mediatek,mt8183-disp-ccorr
>
>    reg:
>
> --
> b4 0.10.1

