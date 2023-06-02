Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF8CC7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eDlE7VsUf+shujEPMAVl+tm2R0mPz8qsAv8B1LJ9ro=; b=Awbexbbg4s0QejO1mhN1jFtgeQ
	oo8fXRfDEO+Ha/go98tV2DkCUyLY6CKy0omgedT3QfJyDpGPLNChZHGCntJlWLRsbGSnCuwHcEEZy
	S7FBbw8E16SSZTRTIIwwkUSlfSYE3tvnu9eAsvRRZCn5KbmAyVvqcovweK2pkZy6Yzkry3t0CE20K
	6nFIzcDl8pdR4YBye4F81K+5zEjAeTeo3t8jcfH+fwIhY5jz0aMrFf7aAJPuTL7j+eoGDfxjmJ4lw
	ROryi5w6Euyz0+qatfK/iEONrm3Chtyb5PSfQHALTpfU7BgIYCnm5XxDp1CBQuo9UseUyTmoJ/uX/
	oACuxDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q54jw-006zRa-1K;
	Fri, 02 Jun 2023 13:22:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q54js-006zPx-2G;
	Fri, 02 Jun 2023 13:22:46 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E8C766056D4;
	Fri,  2 Jun 2023 14:22:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685712157;
	bh=9gZsj5IAGBccJ98w1UVTDdhacpAgqlDEC1+urDUBzEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oL/F5giqODrgUiS/uhsae74g85EyeUwD1ZX68qa1dTMpzQbNImIx5mfhMIZAkafYJ
	 btdZ7ZU85HXvpyOpFHbABF+QEBD19mj7HDOgPCyhZUgU2ROKFNkYM3pGyi9HBYXyW9
	 QlkHh8Bnb1sQHmFvDm3D9judWVsN00Vo/KfT824aU9eIz1nmBvU+tUxpaK3R0jsfR7
	 ojy5s8I0VCS+1SqG8vzIeWgjE3VOQhrBAlY+/Yn2QNorF+CmIJDekyxuWHwTfvj1E9
	 BCKFiyboFStz/PbZGtinebUcJMyoK1JERCftTy5qVJVisvyXSekiAc56TZ5zOzRjDv
	 QvDvPsEWdos8g==
Date: Fri, 2 Jun 2023 09:22:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: Fixes to the
 interrupt handling
Message-ID: <aee68ead-fedd-4aa6-996f-a0274f7c5300@notapiano>
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230502103344.GA3388518@google.com>
 <87b0f5cd-67a8-fbd5-5ca7-a286b543d796@linaro.org>
 <8a38a0da-3a4f-4e39-9f9e-42682edfd9bf@notapiano>
 <68393044-9d28-8402-e190-7cbb28442f6d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68393044-9d28-8402-e190-7cbb28442f6d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_062244_872434_A511FD32 
X-CRM114-Status: GOOD (  25.14  )
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

On Fri, Jun 02, 2023 at 10:07:29AM +0200, Daniel Lezcano wrote:
> On 30/05/2023 21:46, Nícolas F. R. A. Prado wrote:
> > On Tue, May 30, 2023 at 02:27:36PM +0200, Daniel Lezcano wrote:
> > > 
> > > Hi,
> > > 
> > > On 02/05/2023 12:33, Chen-Yu Tsai wrote:
> > > > On Fri, Apr 28, 2023 at 03:53:44PM -0400, Nícolas F. R. A. Prado wrote:
> > > > > 
> > > > > Fixes in the interrupt handling of the LVTS thermal driver noticed while
> > > > > testing it on the Spherion Chromebook (mt8192-asurada-spherion) with the
> > > > > MT8192 support series [1].
> > > > > 
> > > > > These are standalone fixes and don't depend on anything else.
> > > > > 
> > > > > [1] https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/
> > > > > 
> > > > > Thanks,
> > > > > Nícolas
> > > > > 
> > > > > 
> > > > > Nícolas F. R. A. Prado (3):
> > > > >     thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
> > > > >     thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
> > > > >     thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
> > > > 
> > > > This series seems to have solved all interrupt storm issue I ran into, so
> > > > 
> > > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > 
> > > I gave a try on a mt8195 board and I don't see any interrupt firing when
> > > crossing the temperature thresholds.
> > > 
> > > Did I miss something ?
> > 
> > No, indeed interrupts seem to be completely disabled on mt8195, even after
> > setting the controllers to filtered mode (a requirement to get interrupts).
> 
> Really? interrupts work only on filtered mode? That sounds strange

Sorry my reply was confusing, let me clarify. What I meant to say is that
the threshold interrupts (cold, hot2normal, hot, low offset, high offset) only
trigger in filtered mode. AFAICT that's by design, since immediate mode is meant
only for one-off temperature readings, and filtered mode is the one meant to be
used for temperature monitoring. But in immediate mode you could still get the
data ready for immediate mode (bits 16, 17, 18, 27) interrupts triggering.
Though note that I have disabled those in my series, since they are triggered
constantly.

> 
> What board are you using for testing?

I'm testing on the Acer Chromebook 514 (mt8192-asurada-spherion-r0). And noticed
the interrupts aren't triggered on Acer Chromebook Spin 513
(mt8195-cherry-tomato-r2).

> 
> > I
> > haven't investigated that further yet. This series was validated on mt8192,
> > which did have working interrupts, but they were being triggered too often.
> 
> Ok.
> 
> > Also note that I've sent a v2 with even more fixes:
> > https://lore.kernel.org/all/20230504004852.627049-1-nfraprado@collabora.com/
> 
> Yes, I'm reviewing it closely

Thanks!

Nícolas

