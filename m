Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121F6C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGDnk7puZ8lK4RQ5erIV7021+ZCUekxP1LPuUFA+M1s=; b=Q9GziFNnWffAHGxRGzVO0wlEia
	3hQM1JGVXazZrIHsJTQCn1T6ZEAmGYAYg7+y+FwCQTmf482RkeJHRA7Nr3goYor7sDTfFQceSRpIJ
	ouKXFRQtwwyhShG0JRTQIfu7NxJT+vaj7UloNW7tCdN/APfVz3/fGWoiVkicZlBxBjkL0Zs5CGNeZ
	+UohaqqXq+5mSooi77ePM1orDbcOtC8PcodR3tGX3coI8wUOLYuBWfaqAHyhntArPuiOUqSyn0MFX
	GrycWQyBBlEGiwmKg+5x/kAgSU+karxoJ+P4w+iV5RLB/p1WXA51L5KXDIBvr728UQF5Z8DVh+/DE
	9NtcLhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjf0-006Ibk-QK; Mon, 13 Mar 2023 15:00:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjd7-006Hoi-Ln; Mon, 13 Mar 2023 14:58:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E90B3B81184;
	Mon, 13 Mar 2023 14:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA66C433D2;
	Mon, 13 Mar 2023 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678719506;
	bh=jxq03yf7Xaet9VvXtMUxebKs/p10RnENOfVyO8UP0Lk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DLFsLjwo+BuHJT1ZiIB6bTBvN4gZMT25idQ6lmBXeqJaNIAChRP+0fDpi3hUr6C9Q
	 oOMKZXCBRRoUSXHlmcEnePsR06R6o2cr+/GSXH6tE2nKh6nXZpVl/MG4QLbquyNKDC
	 LWITduQsZqaKKdGI/crSA/t0VYnNvkz9V/TCHY02eLUFMgJiBvsQX/Za52pNDiF2l+
	 uGQscnQyTocAPZSec3mVWpRxME/rEL9V9SOwumrPhDYcmxmBkGsMAK6D2D7u9WFagf
	 YKdUJqMkT7E7eBtKI8izB8gWyG14cYQuPpUZxwUtX8q7ul4S8AchypF2U6knDo8Uhr
	 76rn2PJNZ11Iw==
Received: by mail-lj1-f169.google.com with SMTP id f16so12896216ljq.10;
        Mon, 13 Mar 2023 07:58:26 -0700 (PDT)
X-Gm-Message-State: AO0yUKWKHuhWs8NBs00sFsbDIhdC0sgxC5dFeecCBRIc+wYQL0Tn9G1P
	md2+n/0aGU7Vbgwky1BE+L/39ywPG+37/X/RJA==
X-Google-Smtp-Source: AK7set93ppgf/8A7GowcaF9AMzop4M7RVXL14Ayxlc7lTWoPuXT4WNBru8d2Tw5m+TfhTYQd+XOp94bBcFBQulE38wc=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr10850100ljn.10.1678719504691; Mon, 13
 Mar 2023 07:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-3-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-3-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:58:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Qam0O+VhU1st20O=srxggPXNyrCE2T76E+E8hd3Q7qQ@mail.gmail.com>
Message-ID: <CAAOTY__Qam0O+VhU1st20O=srxggPXNyrCE2T76E+E8hd3Q7qQ@mail.gmail.com>
Subject: Re: [PATCH 03/21] dt-bindings: display: mediatek: color: add binding
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
X-CRM114-CacheID: sfid-20230313_075830_256459_AE658EEB 
X-CRM114-Status: GOOD (  13.48  )
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
> Display Color for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index d2f89ee7996f..9d081da433e8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> +              - mediatek,mt8365-disp-color
>            - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
>
> --
> b4 0.10.1

