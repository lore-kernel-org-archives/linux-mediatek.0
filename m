Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DCFCA5FF1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgxM6FYn0isBdsQMlcFrK2TIeGVsguqdQQK2vRxPUi8=; b=gTQsepMipOPvoy7+xEbSk5hvjw
	O2EswhfdUi5OFHkkyEJjLXGgVUdvyVr0QA4EH52eWHWMi3RB2jLdntTWtxpyMmMtgLne1PtIJYu85
	Zj5uyjlAcV2ySA4ps0tFMH7u8CZ4quFA/BNS+rkqc1Jtbf95/rswEhvO7apW6OcIAqD4pfdU3wA6D
	lebkHMg9BzET06/Ig6z1r6/P97uDX5W681GPrYi2d23tcEWnwc6pmoY+tU92nxsHhqUP1mYKT+k53
	nhqS6yRtFevsGcBmszkc61DMbomG1o3hoR3P0fo5S9NJq+xLgqanuv+BwE2wBhw7uspUsbnZy+0xE
	VKP99nYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPrP-00000002JnQ-0ytk;
	Wed, 07 Oct 2026 11:30:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPrO-00000002Jn4-17oH
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:30:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A922442E2A
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3981F0089C
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372657;
	bh=xgxM6FYn0isBdsQMlcFrK2TIeGVsguqdQQK2vRxPUi8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fTndUSvpRAekw3zXE5G11CMv1qCMbLi2OZaH+lz3aO0TRCtwePQGkAwqXXphnaXOY
	 0nvxmDMb0M3623XjCr6t0+CC5r5SKRLQoWauL+zC9fBlvZDuj4lDYXocFzzSfxRAvj
	 x/VVqxPc/IKcaF2El984fvL1LPzAj0SmtUT7B+nQ3GWo/uJd6nWmx/H4ZxnHCVD49z
	 hJms/ncDgLh1d1hk0bDRHb3XIuaPRPj6Or2s7PasdonV/+iHtLAgRQ4yv8oim6yR4c
	 PScE5zDJjvT+wqwCInQ7AYfXsG37ZxYcXzEAvB6eVLQjEzaQvLSokpOaIhnwKDfSWt
	 qIEo6wI9e6WHw==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d7a9e2eb24so2309556eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:30:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzB/pAW6zNuN2berajEAjv25n/1eLrms2PH9bENd7+rEEvjJeEdBep5OrVgPEwtMOYs5G43PEtORsQz08WOw==@lists.infradead.org
X-Gm-Message-State: AFuF++nJJON1lzipnEfPBu2UcV3mT3JS8vSQW+z+KfvSHhKS5jfV+nBA
	I60TvAmIfGoLUsTnriQHOImR1MJbpWmKV5DTU3Vjg2s4WoVPcIEiDyarBPsIuGcA27ElA1h1i/o
	Zgj+Litqq5D2CKr4jrC0wJu0P/3y8UkU=
X-Received: by 2002:a05:6820:80c4:b0:6dc:5532:c64a with SMTP id
 006d021491bc7-6e7a6f7ea8emr1872351eaf.50.1791372656927; Wed, 07 Oct 2026
 04:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-1-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-1-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:30:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLk9OwY1oQOhD5gGrTtwbiaf04YF0NeFN7VAXhTM4CO5UA@mail.gmail.com>
X-Gm-Features: AclHuK8H3quu5l1-b_eOsuvpMh14N3vpR9eJtEK6ctWPpCH8KQlDYSG-vDGgNc0
Message-ID: <CAD++jLk9OwY1oQOhD5gGrTtwbiaf04YF0NeFN7VAXhTM4CO5UA@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
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

On Fri, Sep 25, 2026 at 8:52=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml whic=
h
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij

