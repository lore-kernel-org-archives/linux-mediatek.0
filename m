Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FEFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I0Nw8jbE3sP19LjXXRkOikyI2yJMkCK+lNPi5UhUak=; b=VHImS/oWcR0+kmAA6F2imXkcbt
	PHUInFpHA50T17rMTG9AZCr2BavR5GNE1wRNnaC1FCtSXDF4rtwCz+8XSsBpK8ajC5JQDR5uxxym/
	+PQD+NqF9boQQ26uyfHXcroNs9oMuIKRhcH7mugZJ+nMqFdFfv+ppSRS7hHrpZ2NeZo8WA2VlVFdR
	6fu524ZPiJ6SlePzGBD056AkrNnfkKjctUGQvkksCr39LH02J/o1wHG0Xn3IyQoooDM5pZLdq9rVo
	mgJHqMfvAvxTPYs+2X/VWRFV2LO2nekMQ+nnE0Cw4NZWLDt/uOue4hHbK4F2go29sB5KH7+XbddIr
	0+bfL91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4lF-00Cuqi-FC; Thu, 13 Oct 2022 20:24:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4l5-00Cupa-0F; Thu, 13 Oct 2022 20:24:48 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C919F660236D;
	Thu, 13 Oct 2022 21:24:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665692683;
	bh=/urp6FGOF38ju+OWMwUWjSNprDW/xXAY6n8S22UMNjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTzsoONBYo+04M082a10SMoJtzloBqw3/GwPTVo51uEdStLzkFeuUYZFWXF8I3NEv
	 tlgvl0jZFtz0l7OdBweF9gUW9tZ6fWYfPDzHK0JMZYOa3X/eV3tWF6l1t9LTAoc3TF
	 D2xklenwKuyf+RYiLzselE6g7nYyww/LxqibW/wUuf/0Fk1axaQG/pmlvYq9MVkBnX
	 egA8c89DHqG6B80BxIKeswc3XaD2iOrzTXlLbTdYW4gUN2Nvn1Y3sON9PeGAN46N6G
	 SzkrLg1LCx9OjFpj9vAUU904qwZV30EPQDQtid11YeLQxNgxb8XzcJDMxv72NWEGOs
	 BOJuw7uy7EcGw==
Date: Thu, 13 Oct 2022 16:24:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: asurada: Add aliases for
 i2c and mmc
Message-ID: <20221013202438.unfa4fqinwhgvfiz@notapiano>
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-6-nfraprado@collabora.com>
 <CAGXv+5GmJOYnfLsovO_+piuJ1ry1R0ZQqALRGK3MNp=nUO-TNw@mail.gmail.com>
 <CAGXv+5HGodRWbawEpDppZWM_EiuzdvZC9h4XBoAPo=FQ7yNotA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HGodRWbawEpDppZWM_EiuzdvZC9h4XBoAPo=FQ7yNotA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_132447_277984_E7E54278 
X-CRM114-Status: GOOD (  24.92  )
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

On Fri, Oct 07, 2022 at 12:02:03PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 7, 2022 at 11:51 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > On Fri, Oct 7, 2022 at 5:25 AM Nícolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > Add aliases for the i2c and mmc nodes on the Asurada platform DT to
> > > ensure that we get stable ids for those devices on userspace.
> > >
> > > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - Added this commit
> > >
> > >  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > > index dac2d4f5e670..758ca42a6156 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > > @@ -11,6 +11,18 @@
> > >
> > >  / {
> > >         aliases {
> > > +               i2c0 = &i2c0;
> > > +               i2c1 = &i2c1;
> > > +               i2c2 = &i2c2;
> > > +               i2c3 = &i2c3;
> > > +               i2c4 = &i2c4;
> > > +               i2c5 = &i2c5;
> > > +               i2c6 = &i2c6;
> > > +               i2c7 = &i2c7;
> > > +               i2c8 = &i2c8;
> > > +               i2c9 = &i2c9;
> >
> > You should only add aliases for interfaces that are actually enabled.

Ok, will drop the extra ones.

> >
> > Also, I think we can disable i2c6. None of the current products use it.

It's already disabled upstream.

> >
> > ChenYu
> >
> > > +               mmc0 = &mmc0;
> > > +               mmc1 = &mmc1;
> 
> Also, Spherion does not have an SD card slot. It might be better to move
> the mmc aliases to the end .dts files.

Based on the downstream dts, rev0 and rev1 do have SD card slot (or at least the
mmc1 controller isn't disabled on those). However upstream we have a single dts
(asurada-spherion-r0) shared by those two and rev2 and rev3 (which don't have
the SD card slot), given that this way we can have a single dts and there's no
disadvantage to keeping the mmc1 node enabled because the CD IRQ will never be
triggered. With this in mind, I think it makes more sense to keep the mmc
aliases in the asurada dtsi, as there's no harm in having them, and will ensure
fixed ids for the rev0 and rev1 spherion boards.

Thanks,
Nícolas

