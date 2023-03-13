Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4902DC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfIT9ZRK6yudj90J0732Vt6qjtAYzzeY6mxZcME5wsE=; b=IlJ2kdBC083reO+0MZ0hvKIEF3
	iFY/LNQqxyGzn1noqd41zrI7RZWFabO9c3m89v/jAZgU42ix4HCxGduyN0txpezqOxUTQQFNyniU5
	pc4kdYbaJme4JhA4uwIVuTpOKwUhegm63w1BD9dYWQgfoyHdBQpkuf9ryEnox2UvqNb6zdZkdjIF0
	lr6rUGNn63BlyYNWGTMlxtJCRgxQolrneqAAU/jyC5MN0x62vK5ikZYhq/lEGrx2jPbGGYjerT7fh
	x9UIlinC3xn/T3083m37feQ5kDCyzZlq7BTTGdFozHHAaNwyBoewShmGrhPp3uF67W3Q3zzo78ybR
	IwnVfa1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjjJ-006KYg-VV; Mon, 13 Mar 2023 15:04:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjhQ-006Jhj-TG; Mon, 13 Mar 2023 15:02:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C635612C9;
	Mon, 13 Mar 2023 15:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB67C4339C;
	Mon, 13 Mar 2023 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678719775;
	bh=Z5znNWOfz9QcECdz2pyI19EXcS+etix/ZEegaGLxO/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GCkXHXa5ZKHke+hYl06fprq1jgHis0zI9UkY8KvkihZZuZ4DXWeWgG2UTbzYVxO+W
	 xT1j6Q8ppM7cyhKvrcyTroloVWP5NA59aTqYRNCnm8Mj9NTFlErGTvnNFrWNqdIIP2
	 0dLlokWtQqibw71g9NL17rXpvdbKIbXt1NVyY1wRjP6JTmcK1Z4TElLv1SLXr/B4/Q
	 gIm6YoLZg61Zs2Q/dvqrCHgzDMzOq06arwZ5IXs7ehh6cGbg7GJ3JmrAMkgsNu0PxT
	 VvuQtNQ8v10zOXwOPL6Txnu5gnn6PtGMvT2OzW1voC/nWZWe15MoaWPC2mb0aIx4cW
	 p7Wg2czcujlRw==
Received: by mail-lj1-f178.google.com with SMTP id z42so12889685ljq.13;
        Mon, 13 Mar 2023 08:02:55 -0700 (PDT)
X-Gm-Message-State: AO0yUKUBmpmDGfzb9KOBI0bO8ZCqaGl76kiLlmpGqlRjwqppc+dkGfcB
	SS9iYX1UIFiQc5zasciNLi/Jh6RlBL08NerK/A==
X-Google-Smtp-Source: AK7set/VTut/UwHcfw9/fA57ZQYGQwJ2L0OKLYLC706tyPmz6YQz8WSLG1lrwLiVF9nQJyuV4z9wvKMs1GNUBnZGWW0=
X-Received: by 2002:a2e:aa1c:0:b0:295:95a8:c6a3 with SMTP id
 bf28-20020a2eaa1c000000b0029595a8c6a3mr10956538ljb.10.1678719773554; Mon, 13
 Mar 2023 08:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-1-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-1-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:02:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
Message-ID: <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
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
X-CRM114-CacheID: sfid-20230313_080257_136997_02FFEB2D 
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
> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index d4d585485e7b..d47bc72f09c0 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -33,6 +33,7 @@ properties:
>                - mediatek,mt8186-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> +              - mediatek,mt8365-disp-aal
>            - const: mediatek,mt8183-disp-aal
>
>    reg:
>
> --
> b4 0.10.1

