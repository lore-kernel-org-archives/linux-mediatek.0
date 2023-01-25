Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08F2C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVy49VwAMvNvfly1owkooWr3fc9DSt30v0h99b71T2M=; b=eBEMkEG4JRaKkZAYxsGxVpuJEW
	Eoh8T3ekrXL8WW5IuSVVyAIVKub61Kub6Z+vU5n4C84WEi9eOrAahIxgBKTYmUB/CUIHuDw7vchim
	aCzFd7PHN/AZ6PmQ6GoFOekVCTd0v+EVfTLJaSfIg1/pBd7eaiVGi+aH1M3HarmiObAk4cTiXU7I3
	fOzpUJBT2tZy8b3f5iF0W8Toc33+ngaZvwtHo0hCWY/unPiaJMpDjzefgL6gx8nbGBIMiOKh/K4NT
	X4T2MSBrPn2fwBBavUMWsf6Grig4DdJZE+pro98AtptD9F0bpaipyZ0wHmZoOTmCf1300m+grISTz
	bmP46kNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKjOK-008AQL-32; Wed, 25 Jan 2023 17:16:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKjO8-008AO4-Sl; Wed, 25 Jan 2023 17:16:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 669A561582;
	Wed, 25 Jan 2023 17:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0338C433EF;
	Wed, 25 Jan 2023 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674667003;
	bh=UVy49VwAMvNvfly1owkooWr3fc9DSt30v0h99b71T2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uaD9EW7rjHHXbvhkf/mp5jKQdeoxq6Q82JD9py3lRSGJ6YjIVsjVf7GxAAoMMX+71
	 +V10qssso3Ag4IW5LJ62BRHZ6e8cyVC07FyIyMZYeIbyRAjAAvf6GsruIDnUTnC4/d
	 c0lYc2u21KEBjswd+mvjS6g5Zr6HragxahqZP77bUJULBm+k/nO1uOl93+N+0biEHb
	 +fbH4heOSQtRyxm42Vsx7wZ24ppGvpxwnpp59CZnHdEvIWDOSDTiiNGSwZlQUUULWf
	 6FuQj23lRCvsRdFFZlxl0YtYoEb42mzsWHjLvSiwAM7dAasHH3HYaF9mE+VoyQX0qB
	 c6cGfGn2QbMLg==
Received: by mail-vs1-f49.google.com with SMTP id p1so20444427vsr.5;
        Wed, 25 Jan 2023 09:16:43 -0800 (PST)
X-Gm-Message-State: AO0yUKWFc1mgZdQhJeFimHBR9zAp6hgZPFTemBQcCqNLqbk+l6u2v/z8
	Af/TtDwbCjdpFi+ppqcrxhY0TlmNr7Jx7vg74Q==
X-Google-Smtp-Source: AK7set/9MH2+8m/u8CsJY1QynMiZjKxMVjlsPnhguaIoTxMs8JGmoZA4y6kFqKQs9YuW49fZGC5DK93+2plS+rfNt00=
X-Received: by 2002:a67:fe41:0:b0:3ea:c8c:48a5 with SMTP id
 m1-20020a67fe41000000b003ea0c8c48a5mr91271vsr.53.1674667002782; Wed, 25 Jan
 2023 09:16:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674409777.git.daniel@makrotopia.org> <7c680bf2502ddfd2077306a46c69728d212386f9.1674409777.git.daniel@makrotopia.org>
 <20230123225943.GA2781371-robh@kernel.org> <Y88eMrwDmSZ2xovw@makrotopia.org>
In-Reply-To: <Y88eMrwDmSZ2xovw@makrotopia.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Jan 2023 11:16:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLnuJKhm46dSShtkwW1o9tQNbHQ9bCd-9U5UqMij3J-0Q@mail.gmail.com>
Message-ID: <CAL_JsqLnuJKhm46dSShtkwW1o9tQNbHQ9bCd-9U5UqMij3J-0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add bindings for MT7981 SoC
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Shih <sam.shih@mediatek.com>, 
	Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_091644_990018_48841B80 
X-CRM114-Status: GOOD (  19.75  )
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

On Mon, Jan 23, 2023 at 5:56 PM Daniel Golle <daniel@makrotopia.org> wrote:
>
> On Mon, Jan 23, 2023 at 04:59:43PM -0600, Rob Herring wrote:
> > On Sun, Jan 22, 2023 at 06:23:55PM +0000, Daniel Golle wrote:
> > > Add bindings for the MT7981 pinctrl driver, based on existing MT7986
> > > pinctrl bindings.
> >
> > What existing bindings? A .txt file you need to remove, or undocumented,
> > but in use somewhere (where?)?
>
> What I meant to express is that I used the existing
> mediatek,mt7986-pinctrl.yaml file as the template to create a similar
> document for MT7981. I guess my English was not clear enough.

No, I just missed the 1 digit difference...

> Maybe better like this?
>
> "Add bindings for the MT7981 pinctrl driver. As MT7981 is simiar to
> MT7986, the existing mediatek,mt7986-pinctrl.yaml was used as an example
> to create a similar document covering MT7981."

Describe how the h/w is similar or different. Can they share the same
schema doc? I'm guessing all the if/then schemas for pins/groups are
different, so no. But I shouldn't have to guess.

Rob

