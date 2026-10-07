Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194F3CA5FFF
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuI1908oM85XvyraVfGo7n/valCJHZAHziFtWu1aTus=; b=BSv1949Esa3Ips9Fi0C7YsmJTU
	xczCp/wGbngo83j3t1e8NJQBm1ZajS/WUsYjs87hWQr4dhLwtfw1rqUAqssuON95nGcPme3IYpHgt
	dIZZZj4WjuoYJ4wvxOHis21qwnUTmepOuTDbqKIJ2qq7uGGaCw0LIvbbh0WpwM/KHz2V4AzJ/2ED6
	oFNBq3vt1J2HUIHsShgLdxYToS9dvlDPaElYY59LoWdf5VyWf7h2gtZg65l0Xkh6pAh+e+fnT/TAk
	Y1WsN0KJx829X9YqDUlrok0pEZkaPFXabNMEer1YHoponBakN/gTzTKl9PFgBjXEY4wSZSyppZ7an
	dLIrkYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPsq-00000002KAl-0Hiy;
	Wed, 07 Oct 2026 11:32:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPso-00000002K9l-3ovN
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:32:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98BC643E0E
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3141F008A2
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372746;
	bh=yuI1908oM85XvyraVfGo7n/valCJHZAHziFtWu1aTus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P0mNovaHcJCuq7f36kaX0J4ZDTJhGRrywGpCU5Zcnim+FIYlrOyEZ6JcLqzV1rC9g
	 LgEtEwlV+c0A9Z+qnE76YT75b2Nhr3TdtMrbwFj9+7/dxDNThFXOtHzM+oUfHgXQ+N
	 F0b2NLu3XIqIBx8Sr0cVsYSl4Ai6gM5r0BnR41nKNic5LOXgl1tU8LKfV95dnxKWN8
	 yW1qZ0Z9gpe04Cjn8YkcWlXECuzJWqZmFzn4G2aL9qcwoURb3FRhu4YVssq8kxZhsZ
	 xWGGKzShwWH8dMI4WAOIYvsoIalHwieuBZ4WIRvX6ssNdMC6xGejArYGWz6MeORdxP
	 jA7L6tvrp2uaA==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6d821901872so1464527eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:32:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3JggjHnF3E+2Fv0UQl0AFWwN/u9h/SQifVdd/JFQVMhvuxN6gYW1NgqBynPoqkPB+WkzPM5n9GGOFxVhkpg==@lists.infradead.org
X-Gm-Message-State: AFuF++k+978VDNGaP50aIYcx+ZZmfJAWJM5pHR5hY7SOtEAmUfZBYBhx
	uldW2udL5XW6OfDNZdbdqaFAGo0JjQrD+thcWxVCMN6vqgmz09C7/mFjQ6d71plAp+NebrTyOmq
	a+9URU6DsJ2i+1ThE+54PxSzgeO+kVis=
X-Received: by 2002:a05:6820:f008:b0:6b6:aee6:c81f with SMTP id
 006d021491bc7-6e4a6e2049cmr4508804eaf.36.1791372745840; Wed, 07 Oct 2026
 04:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com> <20260928132131.GA3950360-robh@kernel.org>
In-Reply-To: <20260928132131.GA3950360-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:32:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmUyYc2LBgM6R9mx2=d9Ez7kF26f2fiCuVomdYHq6msFA@mail.gmail.com>
X-Gm-Features: AclHuK_cStZXxjDqaDn0NagMxIvgseHdySzJ25Pb7f5b3rzrUHjwiDYhKF_LOik
Message-ID: <CAD++jLmUyYc2LBgM6R9mx2=d9Ez7kF26f2fiCuVomdYHq6msFA@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
To: Rob Herring <robh@kernel.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Sean Wang <sean.wang@kernel.org>, 
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

On Mon, Sep 28, 2026 at 3:21=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Fri, Sep 25, 2026 at 06:52:57PM +0000, Yassine Oudjana wrote:

> > Change "subnodes" to "subnode" in subnode description for better
> > grammatical accuracy, wrap all descriptions at 80 characters, and remov=
e
> > literal style indicators from descriptions that don't need their new li=
nes
> > preserved.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml         | 15 +++++++=
+-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
>
> The threading is broken for this series...

Yeah I noticed, I just apply one at a time, such happens.

Yassine: look into using b4.

Yours,
Linus Walleij

