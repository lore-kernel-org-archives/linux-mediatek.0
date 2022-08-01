Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C65C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8M6fvGhI6BHzmDRGUdOmYxCAMYl+TV28SN8ooXTMG4=; b=XVLjGpVLItVepfcgF78RmdEN7m
	GxrOI9qi0CVAnWTnh21HMWxmYpooQZzES3v5efE6fouyZ/GWuxw0lZaFiYc1DgRvsR//4XNJRjOn/
	pGQSf8NGGXWHzwC5pqAo4yLqELmRVs8yy5wcS06EkVHN0b8c6FFE2eb5QIAeWi+Z58/LKOw740Abj
	TN0tjS1WFo7S4O3hoG31WZLUywGbT4Zv6iZ/zSpwinQWYBE7VJljlAcb8hEeNLWPdOW+72GRpVjbg
	d9UbNXpW4nDe3UUbuurc5dJ80cQcslsSeX0zdMW9/7CXwvIUyoPfrehjclUgVg9xpYBBaUC3LfqYu
	Nr7NaULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIVvE-006s0i-L2; Mon, 01 Aug 2022 13:57:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIVv2-006rsF-Hy; Mon, 01 Aug 2022 13:57:18 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 08D606601BA6;
	Mon,  1 Aug 2022 14:57:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659362228;
	bh=8QNCSs2CJVUaA/nm2AntjPKq5zW1gHSa89sDl9+SitQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geXyPyLTVTBpug0yIc9edkx0PZ4OLb+YZBimraT31hA+ST855QlVeiwLZDIyUt5kV
	 XfecpVmwLNZZoWwoVc/Cbm+fBDekWsMlIJcOF8+bwRZemY+T2Sdh87oxNgk04UEDyO
	 ckmkJeMTI9YH8/eDlXMjj2mbPv+bjId0M/4eLfdcq+pc9UqnJE7mSrmLEGH51LRzjL
	 z+xhu5eXX5MKprD62KBjuQXBozsosgfFwwRZRYtB0a5FnGB27Zw8B+b0jSd877QHbw
	 sfVkXvJ49SN8QWrIRDYQpGFLkZHSmOF7VQDfu+myEHeIGhAOFSik8MEC+bPejazeQ9
	 /++jT5dFmy9tw==
Date: Mon, 1 Aug 2022 09:57:01 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8 5/6] arm64: dts: mt8195: Add efuse node to mt8195
Message-ID: <20220801135701.dke4m7yshxucewnb@notapiano>
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-6-bchihi@baylibre.com>
 <20220729201421.fxybo57g46ftghgd@notapiano>
 <CAGuA+ooqk-tf5FVfEbA0WdjTOo2fPJi-+AaHDC9jXgw=3vKq0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGuA+ooqk-tf5FVfEbA0WdjTOo2fPJi-+AaHDC9jXgw=3vKq0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_065716_958530_A1729D38 
X-CRM114-Status: GOOD (  22.29  )
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

On Mon, Aug 01, 2022 at 02:33:31PM +0200, Balsam CHIHI wrote:
> On Fri, Jul 29, 2022 at 10:14 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Tue, Jul 26, 2022 at 03:55:05PM +0200, Balsam CHIHI wrote:
> > > This adds the efuse node. This will be required by the thermal driver
> > > to get the calibration data.
> > >
> > > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > index 0ff34edcf8c8..4fbf24b5d202 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > @@ -1236,6 +1236,22 @@ nor_flash: spi@1132c000 {
> > >                       status = "disabled";
> > >               };
> > >
> > > +             efuse: efuse@11c10000 {
> > > +                     compatible = "mediatek,efuse";
> > > +                     reg = <0 0x11c10000 0 0x1000>;
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <1>;
> > > +                     lvts_efuse_data1: lvts1-calib@1bc {
> > > +                             reg = <0x1bc 0x14>;
> > > +                     };
> > > +                     lvts_efuse_data2: lvts2-calib@1d0 {
> > > +                             reg = <0x1d0 0x38>;
> > > +                     };
> > > +                     svs_calibration: calib@580 {
> > > +                             reg = <0x580 0x64>;
> > > +                     };
> > > +             };
> > > +
> >
> > This commit doesn't apply, there's already an efuse node on mt8195.dtsi. Please
> > rebase.
> >
> > Thanks,
> > Nícolas
> 
> Hello Nícolas,
> 
> Thank you so much for the review.
> I rebased on top of the latest kernel version "linux-5.19.0" but I
> can't find efuse node on mt8195.dtsi.
> But, this node is indeed present on mt8192.dtsi.

Hi Balsam,

no I'm really talking about mt8195. For the dts patches in the series you should
base on top of Matthias' -next/dts64 branch [1]. And there you can see the efuse
node on mt8195 [2].

Thanks,
Nícolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.19-next/dts64
[2] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.19-next/dts64&id=ab43a84c9863b65dc20373d5aca4e4d012aa852e

