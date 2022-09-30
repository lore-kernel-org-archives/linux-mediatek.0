Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CC1C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqKA688tcbpurfvzbBe8fTw+3CfJn39LO9edxB10rZw=; b=RJLwecFF5UvEI+kHNrPBGglTnG
	l4uYBTujlyaNWmRIZiWU/7+65p5nVD6L2Ujzc3+fgNvKYoisIUTaNDQHnnj+/ltVIO/SekttIOcke
	w4F/q69EoBSEH57gNFDHBYdIk6Uqk7WY3qwziQc4tz0a8989WfPLNazNquAOvYmpvKDcE+4jFKpiJ
	vY4SmlTJ+bJZ2RTBFQcPYRQhwkd6XZMNRruOKky689kFJlK4StsjAxB5ysu6QiesK/XotlOJXlSG+
	/szB7dTXXWQv9jkxJ5uMK+ixByt+1gHcAkzKpL4UkjprIEfWodQDvHamGE0V/348d7uF8tUyHfVR/
	4Al5xpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLF1-00B6o3-7t; Fri, 30 Sep 2022 19:00:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLEq-00B6kf-0T; Fri, 30 Sep 2022 18:59:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8472DB82881;
	Fri, 30 Sep 2022 18:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41810C433C1;
	Fri, 30 Sep 2022 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664564393;
	bh=3QNA3zbxcf7C4eGHXviUTx4Mw2lLcI48VnpwYP8Y8s4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aZSaxoh2EQHcxbPxcxRfp25X3CBDogGpi/oGVPkj8agbdJ9P96s1jidhYhAqXmWEy
	 TcykmDM6A+4IG1bMzW2DyIZ5eeBpaw1Aab0BLIodRJUWZMzrQWXIRrYvekX0P4wU16
	 6FMiMv2Xhv+f+4mwQEDvLyPrpMi74Cdce3dsWVdJSQHi2loO9vNcd15Y3ywbuQRxeq
	 ambIAp0HAGBnCAzsAzPra/gRV8VYhsfeLiOPZWNb/evVLAOg9WqZw9xksARRYH1Va9
	 MBPcgUspxQh8oPEtdvbE9+Tv5gOPgK+rETIKKMifAPVIqWqiXiXWYz1+Q6gcR4P/hJ
	 2FHcjYw24WZYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <17c5cc9c-50ea-aeac-04e0-20b6c093c7ec@collabora.com>
References: <20220929121031.17523-1-rex-bc.chen@mediatek.com> <17c5cc9c-50ea-aeac-04e0-20b6c093c7ec@collabora.com>
Subject: Re: [PATCH v3] reset: mediatek: Move mediatek system clock reset to reset folder
From: Stephen Boyd <sboyd@kernel.org>
Cc: runyang.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org, nfraprado@collabora.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bo-Chen Chen <rex-bc.chen@mediatek.com>, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de
Date: Fri, 30 Sep 2022 11:59:51 -0700
User-Agent: alot/0.10
Message-Id: <20220930185953.41810C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_115956_237862_10F95E13 
X-CRM114-Status: GOOD (  22.38  )
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

Quoting AngeloGioacchino Del Regno (2022-09-29 05:50:38)
> I've just analyzed this idea a bit more, and there's the outcome.
>=20
> This driver would be fine, if some MediaTek SoCs weren't shipped with
> a bootloader that supports only very small kernels... because then, if
> the reset controller is not available at boot time, it's unlikely that
> you can probe the eMMC or the uSD, so it won't be possible to actually
> compile this driver as a module and load it afterwards.
>=20
> Please don't misunderstand me: I like the idea of having the MediaTek
> SoC sysclk reset controller as a ... reset controller driver but, to
> make that work, one fundamental issue must be solved...
>=20
> If the kernel is configured for, let's say, MT2701 and MT2712, we're
> always building in reset controller support for MT7622, 7629, 8135, 8173,
> 8183, 8186, 8192, 8195 - and this list will grow with MT8188, and others.
>=20
> Obviously, it's useless to have support for, say, MT7622, if the MT7622
> system clock controllers aren't built-in, nor modules.
>=20
> So, to make this idea to work, we have to find a way to:
> 1. Build in support only for the required SoC(s)

Use Kconfig

> 2. Put the reset index mapping arrays in SoC-specific files, or this
>     single file driver will see an exponential growth.

Split the reset driver into different files compiled for different SoCs
based on the SoC Kconfig made in step 1.

>=20
> Wrapping it up - as the driver is right now - we're losing flexibility:
> we need to maintain the current flexibility while keeping the improvements
> that are made with this proposal.
>=20
> Ideas?
>=20

It should work and your concerns are alleviated?

