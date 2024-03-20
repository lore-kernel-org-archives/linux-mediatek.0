Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F30C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 21:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY/fQ80eVJe50fVaORl/qh7YL7x3RaAVUmBxkG9aJbE=; b=FtJhnky/FUZSff/GPjKmYtj9nC
	5EleotCdlZ54fkCOYXpCW2uut75ryT6L6GUF8imOuWPMIbhfjFW7qj8WsUiFQQzrFx5DLXqYXKqG7
	1NMEjZKxnX+3mhuXEBS1cVD/f9FsZFded46LP94F6pLU6cMeUX/opNQhm7puvjWtORDjda6zKEsTD
	CwkNTJpkGGb8kxA1b6S07HvW47/9UTsetPmyGHw1Thb+mALIbaYRK0uGQrE9VsBajJm7+iO+TmQiQ
	eB8ksZT379dMxJiYvSL/3A8VQt6nMdnZNocsgIJqtY+ubMmnFA3++SCqXKDpwzTwtL8i7F3qAbe/9
	DIVkIMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn3rP-000000013pQ-3du5;
	Wed, 20 Mar 2024 21:52:35 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn3rN-000000013o7-0PVX
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 21:52:35 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id C4A5D1E7E88;
	Wed, 20 Mar 2024 17:52:17 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:in-reply-to:message-id:references:mime-version
	:content-type; s=sasl; bh=e2r3a9OUT67BeS0KOQ2laDNvlxbwQEjUIU2HcU
	wGQBc=; b=PuC7LEMRVEoziVdJVWuQuIavcZMrcthhG23/wPYxLyCiLNURdfzvdF
	UPHHM5r6mOiaHMhwFr9MmsFzuNQJXY4hjhjskXq5PVLfmFa1uMThZ+Zjq6EbTpP5
	b504Bc5TwfDiiRr/ENVf+0pHRXvmD9IZlRCKm57xWqROZAxB2RFLw=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id B73A81E7E86;
	Wed, 20 Mar 2024 17:52:17 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=e2r3a9OUT67BeS0KOQ2laDNvlxbwQEjUIU2HcUwGQBc=; b=mSTdvtuz0uwoVvK/km4jnKpaAAXB1iriSgCSK6dwLOO6hLCCLjo9dP5e9JfejrSx+BuudkEB0OTDWjMiq+YH/mZUzdbV5jCcStAtyH1dHjQaG5CCJVuUxv+VA1ilxR/1qmjM74vB3B4GR+E6ojueD4bM0DrW307bKbyOO6AFdEU=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 34BA51E7E85;
	Wed, 20 Mar 2024 17:52:17 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu (unknown [IPv6:fd17:d3d3:663b:0:9696:df8a:e3:af35])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 251E6BEA1E6;
	Wed, 20 Mar 2024 17:52:16 -0400 (EDT)
Date: Wed, 20 Mar 2024 17:52:15 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/13] arm64: dts: mediatek: mt8186: add default
 thermal zones
In-Reply-To: <34e75ebd-b01c-430a-a051-47489492c189@collabora.com>
Message-ID: <ron9o4o3-qror-o1o9-3911-7189925o1os2@syhkavp.arg>
References: <20240318212428.3843952-1-nico@fluxnic.net> <20240318212428.3843952-9-nico@fluxnic.net> <34e75ebd-b01c-430a-a051-47489492c189@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 1E7B3744-E704-11EE-83FE-78DCEB2EC81B-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_145233_368793_38F2D85D 
X-CRM114-Status: GOOD (  17.58  )
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

On Tue, 19 Mar 2024, AngeloGioacchino Del Regno wrote:

> Il 18/03/24 22:22, Nicolas Pitre ha scritto:
> > From: Nicolas Pitre <npitre@baylibre.com>
> > 
> > Inspired by the vendor kernel but adapted to the upstream thermal
> > driver version.
> > 
> > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 236 +++++++++++++++++++++++
> >   1 file changed, 236 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > index 7b7a517a41..9865926459 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > @@ -13,6 +13,8 @@
> >   #include <dt-bindings/power/mt8186-power.h>
> >   #include <dt-bindings/phy/phy.h>
> >   #include <dt-bindings/reset/mt8186-resets.h>
> > +#include <dt-bindings/thermal/thermal.h>
> > +#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
> >     / {
> >   	compatible = "mediatek,mt8186";
> > @@ -2115,4 +2117,238 @@ larb19: smi@1c10f000 {
> >   			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
> >   		};
> >   	};
> > +
> > +	thermal_zones: thermal-zones {
> > +		cluster0-thermal {
> 
> Please use the names that are expected by the SVS driver.

And what would those be in this case?

I've used the names that were suggested here:

https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/#m05936e84a2efe5c431bad39c24d66c246fb8ca38


Nicolas

