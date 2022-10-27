Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B906ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 23:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3/tiBBM65lbA3Kx0jToCOjz1sXOtHVXWYvgKgpiDFc=; b=mbrcWWw1cLX54wlYj8ZvFaPrcu
	YFxbCD6/0IkzvowAOv59zdoFpNMpKdlyhef9aj/l9cLsfj8Ccz7ZW+BSnz4pZIB8oRrcN7EsKrxVP
	3pumCaIuWHLOHpa1p0vei5o2tzb2c5C19tn7q3gU/A/umXpTECrUNBQesBlBkJVkUpxHGGpAnXR+Y
	7hFL54H++UBEPnEKoe63X6TH/8b7EV4LnJZALss2LB/EW5nPx54CzA0yLWhnh4P5SA65Z0Nf7k9ru
	RZvaB1VhElviiS+gWN8VOaM4bSGkS4Y49NJkE+zFPosrVuAXup4ynD269O7nMddKaIPvkitDH0EfV
	G9r5Csyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooCKh-00FEZZ-FL; Thu, 27 Oct 2022 23:30:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooCKW-00FEXx-OZ; Thu, 27 Oct 2022 23:30:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 62872B8280A;
	Thu, 27 Oct 2022 23:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3FAC433D6;
	Thu, 27 Oct 2022 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666913430;
	bh=N3/tiBBM65lbA3Kx0jToCOjz1sXOtHVXWYvgKgpiDFc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iu6ONbFOuNtcJM4mQaxWpdNWxM/V/eSzUpZ73hpm3Qffo2BJqyPDWAqe0OR9TbNOh
	 B6erzkAR+KYefBQnqAlUM8ofjzhedfcAsQ1QXRNpCxC8iBexmKJt0eFujzgcVORvLO
	 ptEYjNYbC7CBC3v/yVO/a47eUK/wU08m8G/rEi0Jru8z4X302KFe3HCx/B/E2EksS1
	 nQm7pGTZlJCCceE2Ma/wWzDQpD5elcc16qEbDL5rxpmLWCohB4x1y9LSIGmLkgnF2M
	 gsUfd5eWBCbTN3nxWBKyNUR8izsE3bNEJuJ0hIeYOeIqBFjs7u0ncaNsawDK/qgOYz
	 EQRxkyggrj46w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y1sTM/E1VY+XdHk5@makrotopia.org>
References: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com> <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org> <20221027214151.7F112C433D6@smtp.kernel.org> <Y1sTM/E1VY+XdHk5@makrotopia.org>
Subject: Re: [PATCH v2] clk: mediatek: fix dependency of MT7986 ADC clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sam Shih <sam.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
To: Daniel Golle <daniel@makrotopia.org>
Date: Thu, 27 Oct 2022 16:30:27 -0700
User-Agent: alot/0.10
Message-Id: <20221027233030.0F3FAC433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_163032_965733_3206EB0E 
X-CRM114-Status: GOOD (  20.68  )
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

Quoting Daniel Golle (2022-10-27 16:24:35)
> On Thu, Oct 27, 2022 at 02:41:49PM -0700, Stephen Boyd wrote:
> > Quoting Daniel Golle (2022-10-26 09:18:07)
> > > It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
> > > CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
> > > mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
> > > driver clk-mt7986-infracfg.c.
> >=20
> > Is this a cleanup patch? Or a pre-requisite for thermal and auxadc
> > drivers? I don't understand the priority of this patch. Should I apply
> > it to fix a regression?
>=20
> I'd say 'no', as AUXADC and thermal has not yet been added to
> mt7986a.dtsi, also the corresponding clocks are currently still unused.
> So while this commit does fix a previous commit, it doesn't have a direct
> impact and will only matter once thermal and auxadc units are added to
> mt7986.dtsi.

Thanks! Please include these details next time.

