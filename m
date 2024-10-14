Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E3AD1813E
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 19:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeMda8+xgSSeD7kwa3BrnkDUSIagRgoPqhqmqNucUtw=; b=uvKkjYd94jp8VQ0yv6qAfOZQLV
	5eMNCbAafK51BtxTnlTDIonxNAN1FGKDMUMwX7Uu88QkqprtB8J4V8vF6GgkTqJuz4cCeoHGDQrHy
	32SXELTr7STBIDo192tZS55d+s46SM77blo3YYY3DngAoyffeAQeRKujk9SY/Vv1VLCfl0jXPqqft
	SEDUi8Jz7wS58wEye5FVGZoW71ZDw9JfUoecDdhsFkKwfh1GtBwU4JHrXuCsUPHMBA0l66XBxmsgX
	lFaJw/jCTb0GN5jFPscm2D3+ePcfKz4FkG92jSMEDhFCpC+lxw/3D60aA62CJKiPN71qLjaYk722f
	TMOntmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0R9E-00000006LDe-3Wpe;
	Mon, 14 Oct 2024 19:54:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0R2e-00000006KSJ-1jzg;
	Mon, 14 Oct 2024 19:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8873A40B5A;
	Mon, 14 Oct 2024 19:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5099AC4AF0B;
	Mon, 14 Oct 2024 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728935263;
	bh=BmeazclAOWGBXpv6W51J/lnVKM4suOylLnvlvJPSWFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qtfi9rn10vjFc4wmjkonxMOvOlBMcep0XH06igeF//Ho9YkQ0hkNsLeIcgpXp49cC
	 tq9nyBjQ970ruTiIxS0fVy8w44Uc/Zb/r7Z0IUa6hloZ/zXRUiRuYU1irC/5jRpumk
	 kEC5xiXLKgg7cxQgWcPHCeLR5XH+NSBY6kBpXApvyolHjp7Qdxc5/TDoIhUmgS1LcT
	 5MhhcPJXpx1I10VXMR2RklXm5CGYkrYJxf1Bp84VJrvVDidHN3g6bDsfiy9d3C6dqx
	 W7ZWPjVuWwPt7kNCal91yl2GkBEnAR8Box8f4JtJVAlS11wLwUlLZ1B1TSJE6NcVbW
	 effcf43agOYBQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f6fede4dso1482842e87.1;
        Mon, 14 Oct 2024 12:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/lk2ioorqbK6whh1dcb/QyUAaGlT+kGLDQlowlUNDWzhP4YrsB5FCLDghusawim54KgnYTKIrkC+QxLixzXc=@lists.infradead.org, AJvYcCUBpOnW3bec3doUXejkAonomBSng00NkD772pg1EhXVqgqgmC7lnb0xL1+tt4TDNTpp3zLZeNbpoZmycYLh+Xo6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ZANNvXKZgAzekvrLBNp5Vyx305rBGTevSnguA4X7pwBJzdU/
	NWih5z+sfXPKBdHXUv2hJRH5PPFM8vYsfJpj1RYVK9g7hLxnFsbkEWbME/0pFwRu4GqXrGxLiaY
	3CD80TEYkelc0jZZGuBQBiTiQbg==
X-Google-Smtp-Source: AGHT+IGWKpdEglFpIlk6kIsyRnfEB8zZoqKphERJa0sPyVBgZGiKBn/mqvbmmqVRsK8iGBHs2hU9kQhmNKsc6ZcqYbE=
X-Received: by 2002:a05:6512:b88:b0:539:e98c:c33b with SMTP id
 2adb3069b0e04-539e98cc3c1mr3113634e87.41.1728935261639; Mon, 14 Oct 2024
 12:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com> <20241011165640.GA2475122-robh@kernel.org>
 <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com> <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 14:47:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8s1SmbLuO1saByQ+GWNSAFFqdxFpYFsEaibX3sMMkNg@mail.gmail.com>
Message-ID: <CAL_JsqL8s1SmbLuO1saByQ+GWNSAFFqdxFpYFsEaibX3sMMkNg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241014_124744_611024_4E707698 
X-CRM114-Status: GOOD (  30.92  )
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

On Mon, Oct 14, 2024 at 2:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 14, 2024 at 3:27=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 11/10/24 18:56, Rob Herring ha scritto:
> > > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> > >> From: Yassine Oudjana <y.oudjana@protonmail.com>
> > >>
> > >> mediatek,pinctrl-mt6795.yaml has different node name patterns which =
match
> > >> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml=
 which
> > >> has a description of the pinmux property, as well as some additional
> > >> descriptions for some pin configuration properties. Pull those chang=
es
> > >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to matc=
h in
> > >> preparation to combine the MT6795 document into it.
> > >>
> > >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > >> ---
> > >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-=
----
> > >>   1 file changed, 28 insertions(+), 10 deletions(-)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt67=
79-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779=
-pinctrl.yaml
> > >> index 3bbc00df5548d..352a88d7b135e 100644
> > >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> > >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> > >> @@ -111,12 +111,12 @@ allOf:
> > >>           - "#interrupt-cells"
> > >>
> > >>   patternProperties:
> > >> -  '-[0-9]*$':
> > >> +  '-pins$':
> > >
> > > Worst case, this could be an ABI break. Best case, it's churn for
> > > mt6779. Is it worth unifying?
> > >
> > All those MediaTek pinctrl bindings are mostly the same, where only the=
 pin
> > definitions in the binding header does actually change.
> >
> > I think that it's worth unifying them, not only to get rid of the dupli=
cation
> > but mostly for consistency between all of those subnode names which are=
 wildly
> > differing for no real reason... and consistency is a long time issue wi=
th
> > MediaTek bindings/dts in general (which is way way way better now, but =
still)...
> >
> > Besides - just for context and nothing else: the driver doesn't care ab=
out
> > the names of the subnodes, anyway... so while this is technically an AB=
I break
> > it's not really creating any functionality issue, and then, actually, Y=
assine
> > is also modifying the devicetrees to comply with his consistency change=
s, so,
> > in my own perspective, it's still acceptable.
>
> Wait, I thought there were no users?
>
> We generally only consider node names ABI when/if something or someone
> cares. Most of the time it doesn't matter. For the pinctrl nodes, it's
> really just a question of churn renaming a lot of nodes.
>
> Ultimately, it's up to you. I only care that the implications of the
> changes are clear in the commit msg.

FWIW, these are the top occuring warnings on arm64 mediatek pinctrl nodes:

     27 mediatek: pinctrl@10005000: panel-pins-default: 'panel-reset'
does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     27 mediatek: pinctrl@10005000:
mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0,
1, 2, 3]
     27 mediatek: pinctrl@10005000:
mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1,
2, 3]
     27 mediatek: pinctrl@10005000:
mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of
[0, 1, 2, 3]
     27 mediatek: pinctrl@10005000:
mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of
[0, 1, 2, 3]
     27 mediatek: pinctrl@10005000:
mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1,
2, 3]
     27 mediatek: pinctrl@10005000:
mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1,
2, 3]
     27 mediatek: pinctrl@10005000:
mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of
[0, 1, 2, 3]
     17 mediatek: pinctrl@10005000: volume-button-pins:
'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes:
'^pins', 'pinctrl-[0-9]+'
     17 mediatek: pinctrl@10005000: trackpad-pins: 'trackpad-int' does
not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     17 mediatek: pinctrl@10005000: touchscreen-pins: 'touch-int-odl',
'touch-rst-l' do not match any of the regexes: '^pins',
'pinctrl-[0-9]+'
     17 mediatek: pinctrl@10005000: pp3300-panel-pins:
'panel-3v3-enable' does not match any of the regexes: '^pins',
'pinctrl-[0-9]+'

Not sure what SoC because I strip the dtb names to deduplicate the
warnings which get amplified by number of boards for an SoC. The first
number is the number of times the warning occurs.

Rob

