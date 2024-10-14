Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B8DD1813A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fa1ymdH6YHDd1PXzy81SZLgmB84Oy4cvRM4D5uEw+s=; b=L2deZi1rOUqUhf5zuMjl/xns4X
	tyLpZHf7XS7eG5hgHNbAxpOeP2RsICwG7oWVITyQJKBO/pnpZ1TZcHTbxWm59PiA1QHe95S5SB3Un
	CTOQNryjcgB7/CEVwBCYaehosTXcoQyVK/1dHIVVaACyMG7Z0KFZ1/710/H1luKWpZq3Gsaalcb+t
	YSckQ6NACrh9gK4Opm480ZIHY+qUyLRS/HGuB3pMDaV2Gbhp9zs8LSa4R+6P0Jqs0qk5dwYdKkTKG
	GI3p0wBYDp5aSaJhLpFjjI0Y6nMkQtphY9PxuOm8NY1YXL5P3/wIs2gyppPDLXsn5MPZKAZtqqYA2
	Cg+SvZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0QMj-00000006FRb-04XU;
	Mon, 14 Oct 2024 19:04:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0QLJ-00000006FGe-1gKJ;
	Mon, 14 Oct 2024 19:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5051F5C02F1;
	Mon, 14 Oct 2024 19:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64811C4CED1;
	Mon, 14 Oct 2024 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728932576;
	bh=S4arwuzO7j1jhWd47g0uoukq8DJJ4fWBq2BNobj+aYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FJrzfcM3db9LMyFqGD0McuCfW5vQyJWws3eb53Nmcl98QJWehOZ+Hj6mo5k0CVoy+
	 Z2pdlcLzUEO44rXQhR418TQyBBBUvH4Y9uviHGulNNgx3oO9qY4wuHHi3k26swa4Ly
	 vQvJ2nVgCv+LS1Gi3sRZP9EleiOyHMeHftTNhprCmO4X6Is1atfq8Ax/qSLuIUYHFH
	 aH8RMsoqrAbIMd16uBIASKVrAf1db71NwR72vZuLZLFdWb1hKJllsvftpKZtzmle+F
	 Kkl+QN2XTpOUpJmnK4Nht5RFARNucP9p/p8hRJQVdULTjBJcX/du5YySfiRAMLHNTr
	 Z3oLHmDN4RukQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e427b07dso32992647b3.1;
        Mon, 14 Oct 2024 12:02:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEx3woMTeRujgySgIY2BMN2yIyx08fd9HUbpcgPHJBBLBJ5gcQ4C0B+8jLTimRzaXrJ8xmqK6Mz1QPGMTnIiE=@lists.infradead.org, AJvYcCXDTPYae8KE+Ce8IOK+UZ6W7eZUtsICh6FJ+lnhCQvpTyyFbsTK3/H/Nej91qc3+/y9c0/oJkXaJz0HfGJ381S6@lists.infradead.org
X-Gm-Message-State: AOJu0YwEs1doJWl4PDaysxZAXKrWZpt/5S3opUMS+gUEUAg5qF6f3iPB
	XigCqTQQ+Oi8z7CIaS1fqyVfZLTvtl7PCsZnvms9EEgVKcKwCEvyVqSZx27MTsiTorWnxQHnVqE
	Wf62RcD+Z6f/pJDJVXTtkzbHdLA==
X-Google-Smtp-Source: AGHT+IG1Um+TeY+p/HlTwahS1LZNEmjEHI6QEzViuZbWFDN/48qQYMlejknzr8AsHrp6NBMHHATDBJ03Iku1z4EHf24=
X-Received: by 2002:a05:690c:9692:b0:6d5:90f:d497 with SMTP id
 00721157ae682-6e364153287mr68863237b3.19.1728932575616; Mon, 14 Oct 2024
 12:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com> <20241011165640.GA2475122-robh@kernel.org>
 <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
In-Reply-To: <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 14:02:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
Message-ID: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_120257_550041_782F6D8E 
X-CRM114-Status: GOOD (  25.73  )
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

On Mon, Oct 14, 2024 at 3:27=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/10/24 18:56, Rob Herring ha scritto:
> > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> >> From: Yassine Oudjana <y.oudjana@protonmail.com>
> >>
> >> mediatek,pinctrl-mt6795.yaml has different node name patterns which ma=
tch
> >> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml w=
hich
> >> has a description of the pinmux property, as well as some additional
> >> descriptions for some pin configuration properties. Pull those changes
> >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match =
in
> >> preparation to combine the MT6795 document into it.
> >>
> >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >> ---
> >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++---=
--
> >>   1 file changed, 28 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779=
-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-p=
inctrl.yaml
> >> index 3bbc00df5548d..352a88d7b135e 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> @@ -111,12 +111,12 @@ allOf:
> >>           - "#interrupt-cells"
> >>
> >>   patternProperties:
> >> -  '-[0-9]*$':
> >> +  '-pins$':
> >
> > Worst case, this could be an ABI break. Best case, it's churn for
> > mt6779. Is it worth unifying?
> >
> All those MediaTek pinctrl bindings are mostly the same, where only the p=
in
> definitions in the binding header does actually change.
>
> I think that it's worth unifying them, not only to get rid of the duplica=
tion
> but mostly for consistency between all of those subnode names which are w=
ildly
> differing for no real reason... and consistency is a long time issue with
> MediaTek bindings/dts in general (which is way way way better now, but st=
ill)...
>
> Besides - just for context and nothing else: the driver doesn't care abou=
t
> the names of the subnodes, anyway... so while this is technically an ABI =
break
> it's not really creating any functionality issue, and then, actually, Yas=
sine
> is also modifying the devicetrees to comply with his consistency changes,=
 so,
> in my own perspective, it's still acceptable.

Wait, I thought there were no users?

We generally only consider node names ABI when/if something or someone
cares. Most of the time it doesn't matter. For the pinctrl nodes, it's
really just a question of churn renaming a lot of nodes.

Ultimately, it's up to you. I only care that the implications of the
changes are clear in the commit msg.

Rob

