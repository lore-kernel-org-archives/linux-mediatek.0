Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D504CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhAC6vwrbP7VGLTK/9G9G2MtlzV6M2abfE82QUXAgPw=; b=My9Ntlucyuxe2asjC+l4AEddsZ
	KI7MYGtqMwiMpJ7Y07mt1rs8JqqHy2B6pfgmR/UxUJLHL79hl1CoXblZUPqxLBrFxJbKLzvhQ0mIf
	fwkrDsob2Dtn2BvWGXRP4b+5O5/nQhDbY4ZQm+sh6YUIkb16C1P755fT3+/AelfS6NE6wc58zM7N8
	XWh74U8Mkp9+g72j6J6gSCN43Yd9+CwELupXVNDLuINYdeUum1knaHZ68Sku8KdwoYTFzjrR8qjZd
	azMP3ays9iwpg6RGMwJ29/sVl0YTA0QaKQ4PtOt4ZacvzmU/yLGI58CR4iIQDimGawbf7S0eY86EP
	abS5PD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPuY-00000002Kbm-08xL;
	Wed, 07 Oct 2026 11:34:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPuW-00000002Kat-2sha
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:34:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 595BA44500
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDAA1F008A3
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372852;
	bh=JhAC6vwrbP7VGLTK/9G9G2MtlzV6M2abfE82QUXAgPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Co4LiB0Qo545jXjZZYzYeuApMCYtVHJRvoXNDSd/X54JCkcQeT+VZDRNE1N80ETUT
	 EyUiklwwkvhN8U87NzfNIJSm4eI5SRkEGQQMIFFvzY5g1XbBSkT9sZ01nr6PWLi/v6
	 DrGSIkjjufKdXaumhknA4po+MeRpibZOT7FillaCPCOdmLw5jovpK9OEkq0T+qlds3
	 Oe1E6WyEE5+k+G3t7s5+oiByMF8cjc3t6BNNWxSpQXStIBKC5qUPGagPVvExVww8rU
	 RNlvjQQ9zzaQfOrhoTYKEzw70YFSOSWwkWO3eyGS9Qj7uCyC19Nif4/8o1RahiW1Vr
	 qlFDQMUdoKNDg==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6d7e06dbcccso1134626eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXifOVw+Y3ezGYUhbhkdgxEtHhzlafQkPjQGYfbJuxCBuG1eUJIh1iVJhcwx23qzzxTr573UMxEMJy9UEN0Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nMfsCK5oFQ3FXJhYmQX2AU4WmdpaJGLhPjK17FGfLb6q62B7FE
	ZvsvrVyFrzmqj6CimqGVuLy41MIE1he+HHWidNXFDotMvNJ0/mr8ZknKwrES9j7rR4Qvjx0yEGM
	VX3PSpPhoRmGB7DKEfMnraF4xEGylRsE=
X-Received: by 2002:a05:6870:1425:b0:49e:691c:1bdb with SMTP id
 586e51a60fabf-4a259412f13mr2063730fac.32.1791372850535; Wed, 07 Oct 2026
 04:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-4-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-4-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:33:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkqvPxNSx6jsVjXLAvMnpPDPTeUKn4hRK7KUi=PtEysZA@mail.gmail.com>
X-Gm-Features: AclHuK8XHQwc9XkY5CTAgsRDVLTJbfqcvgGYIDV5p-RXsb_N5_WlBlXLH17W7OE
Message-ID: <CAD++jLkqvPxNSx6jsVjXLAvMnpPDPTeUKn4hRK7KUi=PtEysZA@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> The MT6765 pin controller has had a driver for a while, but DT
> bindings were never documented for it.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Patch applied!

Yours,
Linus Walleij

