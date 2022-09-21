Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E01ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVsGdjhIjYMyRVhriMOBaijrfLxW8OH+97COeh66bsA=; b=3FyPDkGh16VWRWWvcCNvNhGZdI
	ck1ryVOU2l5O1k3HVeTXANZ+mEBHSWjuHn0YNNje/RTUQhx62vRNXwTDGJaZlgohKm5FGTiiJGVWH
	uk56XWJyBdNKPwwAf7YFr7uU9/CNYztFc2rcomn9hjp2V4Jx1+yo3I0D2bhrzzJUDrGd9gBXPfpUr
	sztLMXb7ulWacmh0iFUQrSxflTnglhpOjfEa4pBx6Q92f/F+YAQlpxqenWWuErp8MFiLioUhx9Tsc
	JlLAAV0zWBAPVcjjPSWVWjXbjbqhEz0rbj8sIuXw0gYksb6AGUEanyWXvTKqRKSvNpeCC0rsLPmVu
	3TJrkynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob05U-00BSxM-LH; Wed, 21 Sep 2022 13:48:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob05I-00BSuy-MR; Wed, 21 Sep 2022 13:48:18 +0000
Received: from notapiano (unknown [71.190.76.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 98C5D660035D;
	Wed, 21 Sep 2022 14:48:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663768091;
	bh=kHonNTF/Lzlr8aSshRxKzH5rWoJVYD+SKE3V/t0eknU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhoFbIAxA6bxocnv8A8BbQ2z9aflUs/v/bLdPBGTtbJx6ZWh92NoUz6Hvmt/5CySh
	 qv9JK0gbugoCOmDebyFePqygFBJ01yH1JAhiRXb1L0GXahjmozyrX/l8M/ameLEskL
	 YRj14SGj1VhfC+occC/FEnzAoBLi6AB8E/DcRvsy8gcFHFpV1rEY2asLRXifO6y8kk
	 +1Dpv6ia2erykaS2SCM298Fl8hL+8mOkKLyLnH2ZyAY1VjEcJpAs8RRmh3EwK/RylK
	 Mg3CoppufEHx61ro0O3vgMOJhUf11v7SfDC/oRkj5OWGL25jiTUTuvp3u40eWXraNT
	 uGIESuRMOTOzw==
Date: Wed, 21 Sep 2022 09:48:06 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: asurada: Add display regulators
Message-ID: <20220921134806.lbg5meuy4fn6pifm@notapiano>
References: <20220908171153.670762-1-nfraprado@collabora.com>
 <20220908171153.670762-2-nfraprado@collabora.com>
 <ab2027b9-17e8-4fe8-3847-84c54d6f9d58@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab2027b9-17e8-4fe8-3847-84c54d6f9d58@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_064816_900378_49097A7C 
X-CRM114-Status: GOOD (  26.97  )
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

On Fri, Sep 09, 2022 at 09:46:33AM +0200, AngeloGioacchino Del Regno wrote:
> Il 08/09/22 19:11, Nícolas F. R. A. Prado ha scritto:
> > Add the regulators present on the Asurada platform that are used to
> > power the internal and external displays.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> >   .../boot/dts/mediatek/mt8192-asurada.dtsi     | 114 ++++++++++++++++++
> >   1 file changed, 114 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > index 4b314435f8fd..1d99e470ea1a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> 
> ..snip..
> 
> > @@ -56,6 +116,18 @@ pp3300_ldo_z: regulator-3v3-z {
> >   		vin-supply = <&ppvar_sys>;
> >   	};
> 
> Can you please add a comment here advertising that this regulator
> will not only provide power to the MIPI bridge, but *also* to the
> display panel itself?
> 
> This is to make sure that everyone understands what's going on, and
> also that we ourselves don't forget about that.
> 
> Probably something like:
> /* pp3300_mipibrdg also enables pp3300_panel */
> 
> I would then propose to add a "regulator-fixed" that has no GPIO
> but with vin-supply as this one.
> 
> pp3300_panel: regulator-3v3-panel {
> 	compatible = "regulator-fixed";
> 	regulator-name = "pp3300_panel";
> 	regulator-min-microvolt = <3300000>;
> 	regulator-max-microvolt = <3300000>;
> 
> 	vin-supply = <&pp3300_mipibrdg>;
> };
> 
> I would also test assigning this regulator to the panel node, as this
> will make sure to cover future corner cases (think about PM suspend/resume).
> 
> P.S.: If you add the pp3300_panel regulator-fixed with that vin-supply,
>       maybe the proposed comment would become a bit overkill. Your choice!

Hi Angelo,

thanks for the feedback.

I think the current layout makes more sense based on my understanding of the
power routing here: a single power line output by the pp3300_mipibrdg regulator
powers both the ANX chip as well as the panel. So I'm going to keep it the way
it is for now. If there are any other concerns please let me know.

Thanks,
Nícolas

> 
> Cheers,
> Angelo
> 
> > +	pp3300_mipibrdg: regulator-3v3-mipibrdg {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "pp3300_mipibrdg";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pp3300_mipibrdg_en_pins>;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		enable-active-high;
> > +		regulator-boot-on;
> > +		gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> >   	/* separately switched 3.3V power rail */
> >   	pp3300_u: regulator-3v3-u {
> >   		compatible = "regulator-fixed";
> 

