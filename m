Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22C5EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciuF2i24mdJZzXK1MpnULzZ5uIH5tKK1goU1NOO22mQ=; b=Ls+4FAdrAHUt1U4EZKGcfsztJj
	5F1DlOskduBu4bD6MYKJoQ5ZFhMgyhgB+Ia0d7nMHK7Spyd5BJnZ3B8CDdsSpO+QLbupVWp0Hyft6
	E0KJFuSZd1c7TeHFI2F+ecLxgcUEW3tgJntCldc51TAebCJR8sBHKRNGB8q4um9TSP0wpBRZOOAus
	f6AEUaKktaSscyDIEjYz2jdrUYWX16SY2+AtbkKkP3kKMS05bPqOC+7NzbtKpkXkmDej/9vL390zM
	o89Lo3Z+p8hrqb8H0sMzTs6F6qb4Pqr8ho9b2E9px+FG5a8pMzlD6t87EJIawhUqN1Dod0GTDKP9o
	YLCZbIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEyue-002Bub-1c;
	Thu, 29 Jun 2023 21:10:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEyub-002BsD-18;
	Thu, 29 Jun 2023 21:10:46 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CBDD066070D1;
	Thu, 29 Jun 2023 22:10:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688073041;
	bh=JCh8QNgbheBN9vzum2hXOH+Xccw6yemZ2xjeKair+aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awtycltug4rEIpIWPHSmCJ0Ar7z77OoWwDGCry2DH+yxVYb/zvGXFn4MY6+0VYWHz
	 KsjdF6RlG839AVnwTUXG5EhlfY57qurBilxeD4c48tgwS66/uibtEDaER8NzfwVG5S
	 JHXvf7vP2vcIQKryhP7Nc2aPRt+dbb+oXgMTCIsXDUC66CsEfWU9LrVu+nJyGWIw83
	 BSZf9ksQr+YcWLUt9cu1rx4wlaf479EvT0yP1Jab0CD+ftjnz/ZU+t4SXMd1MUetTU
	 H2jTI5x4AB+Dy+grt0C/nvXBZA132sNpsVnx645CtNY3W9M2+wrzL+iw7ra+tbJehg
	 JGugr9zpCYcOQ==
Date: Thu, 29 Jun 2023 17:10:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Bailon <abailon@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 5/6] thermal/drivers/mediatek/lvts_thermal: Don't
 leave threshold zeroed
Message-ID: <819b9c10-044c-4a2b-b8f2-6ddd633bbf8d@notapiano>
References: <20230504004852.627049-1-nfraprado@collabora.com>
 <20230504004852.627049-6-nfraprado@collabora.com>
 <5d810151-3a3b-51af-bbc1-0ee45668bcc4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d810151-3a3b-51af-bbc1-0ee45668bcc4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_141045_606921_0233A5FF 
X-CRM114-Status: GOOD (  26.83  )
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

On Fri, Jun 02, 2023 at 11:17:27AM +0200, Daniel Lezcano wrote:
> On 04/05/2023 02:48, Nícolas F. R. A. Prado wrote:
> > The thermal framework might leave the low threshold unset if there
> > aren't any lower trip points. This leaves the register zeroed, which
> > translates to a very high temperature for the low threshold. The
> > interrupt for this threshold is then immediately triggered, and the
> > state machine gets stuck, preventing any other temperature monitoring
> > interrupts to ever trigger.
> > 
> > (The same happens by not setting the Cold or Hot to Normal thresholds
> > when using those)
> > 
> > Set the unused threshold to a valid low value. This value was chosen so
> > that for any valid golden temperature read from the efuse, when the
> > value is converted to raw and back again to milliCelsius, the result
> > doesn't underflow.
> > 
> > Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> > Changes in v2:
> > - Added this commit
> > 
> >   drivers/thermal/mediatek/lvts_thermal.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> > index efd1e938e1c2..951a4cb75ef6 100644
> > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > @@ -82,6 +82,8 @@
> >   #define LVTS_HW_SHUTDOWN_MT8195		105000
> >   #define LVTS_HW_SHUTDOWN_MT8192		105000
> > +#define LVTS_MINIUM_THRESHOLD		20000
> 
> MINIMUM
> 
> So if the thermal zone reaches 20°C, the interrupt fires, the set_trips sets
> again 20°C but the interrupt won't fire until the temperature goes above
> 20°C and then crosses the temperature low threshold the way down again?

Well, actually, set_trips won't even be called since from the thermal
framework's perspective we haven't crossed trip points, ie in
__thermal_zone_set_trips():

	/* No need to change trip points */
	if (tz->prev_low_trip == low && tz->prev_high_trip == high)
		return;

But in any case, yes, the interrupt will fire, the temperature will get updated
in the framework, and that's it. It will only fire again when a threshold is
crossed again (either by the temperature rising and falling again below this
minimum, or rising beyond the high treshold).

So basically at most this will cause a spurious interrupt when the temperature
gets low enough. I do get 34-36C on all sensors when idling though, so I doubt
that temperature is even reachable. Besides, we don't really have another option
here if we want working interrupts, the threshold needs to be set to a valid
value, and this is the lowest I've found.

And thanks for all the feedback! I'll prepare a v3 based on your comments.

Thanks,
Nícolas

