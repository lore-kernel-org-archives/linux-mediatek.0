Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09271C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKrNqZnjtuqCsPuuk6zL2hv1KbOy9a6l7xl/zgVH6is=; b=xZ7MEyZPDVBWfXBAqkFZc8fVrP
	nxsDxRPBxk+YsFim8Z8k6YqTtXoNbWmNm7DcFV8DnWZhAD7kWEyUHZEC1cl5ZyGO/3ynQxz6cs2Gu
	tdH/a+kEv/quG/7miwnMOfZBsXJQ+r7atY0zr4VvC7xok3MX68zZlnIFcueIFirXMpwi90pClti0P
	6TU5vT2+3u+rYTrqlYCYSwQqXlWuVepdCDlNwU2gA+o2nucovCPXKRI7XGvuqQp3Jt2I+Lub/8B0J
	roAHrIRJ3VO35Qx/JC0S0mdqCYa3EdmGDu5D30vzpz4AcGhIve10KpqDCjTCvZHBlIEerfk8bduB7
	qk+WMXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvx7-005krM-2X; Wed, 08 Mar 2023 15:43:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvwv-005koD-SU; Wed, 08 Mar 2023 15:43:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29E436069B;
	Wed,  8 Mar 2023 15:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B33C433EF;
	Wed,  8 Mar 2023 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678290208;
	bh=kYutHpejNtmmeokplIU5qESykQhQfmRXB0B3UcVHJ/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTEH+9+A2VlNt/UDNUfumfNn78n4Ayb3ttC8+3prI+UMqUH008tp6mbaFrNOs/srD
	 L1ZAJ/t4+FGpDhT0uxetSddfLKNg2ESCG1ofsXlnnUoERbqSc72SIrgZx3pPPF7uuN
	 oEoNQrrCXRczlB4Pj61yTWNqjNHnLvd/m9JjeT+w=
Date: Wed, 8 Mar 2023 16:43:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com, weiqing.kong@mediatek.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 0/2] pwm: mtk-disp: Fix backlight configuration at boot
Message-ID: <ZAitHYRCUHsIvZMk@kroah.com>
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
 <06918fde-64ea-37b2-da1a-1c8316457223@collabora.com>
 <06909bd8-3da2-1cf0-82ac-3ed4f3e63def@collabora.com>
 <ZAigsHAgqkLlBD1y@kroah.com>
 <28142704-d82d-d533-d2a8-b1061182f1f6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28142704-d82d-d533-d2a8-b1061182f1f6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_074330_019785_5A696603 
X-CRM114-Status: GOOD (  29.37  )
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

On Wed, Mar 08, 2023 at 03:55:59PM +0100, AngeloGioacchino Del Regno wrote:
> Il 08/03/23 15:50, Greg Kroah-Hartman ha scritto:
> > On Wed, Mar 08, 2023 at 12:46:07PM +0100, AngeloGioacchino Del Regno wrote:
> > > Il 23/02/23 15:16, AngeloGioacchino Del Regno ha scritto:
> > > > Il 23/01/23 17:06, AngeloGioacchino Del Regno ha scritto:
> > > > > Since the pwm-mtk-disp driver was fixed to get PWM_EN state from the
> > > > > right register, an old two-wrongs-make-one-right issue emerged: as a
> > > > > result, MT8192 Asurada Spherion got no backlight at boot unless a
> > > > > suspend/resume cycle was performed.
> > > > > Also, the backlight would sometimes not get updated with the requested
> > > > > value, requiring the user to change it back and forth until it worked.
> > > > > 
> > > > > This series fixes both of the aforementioned issues found on MT8192.
> > > > > 
> > > > > AngeloGioacchino Del Regno (2):
> > > > >     pwm: mtk-disp: Disable shadow registers before setting backlight
> > > > >       values
> > > > >     pwm: mtk-disp: Configure double buffering before reading in
> > > > >       .get_state()
> > > > > 
> > > > >    drivers/pwm/pwm-mtk-disp.c | 34 +++++++++++++++++++++++-----------
> > > > >    1 file changed, 23 insertions(+), 11 deletions(-)
> > > > > 
> > > > 
> > > > Gentle ping for this one: this is fixing backlight issues on multiple MediaTek
> > > > SoCs and was well tested.
> > > > 
> > > > Thanks,
> > > > Angelo
> > > 
> > > Since this series was sent more than one month ago, and since this fixes broken
> > > backlight on a number of Chromebooks with MT8183 and MT8192 SoCs, and seen the
> > > urgency of getting these fixes in, I'm adding Greg to the loop.
> > 
> > $ ./scripts/get_maintainer.pl drivers/pwm/pwm-mtk-disp.c
> > Thierry Reding <thierry.reding@gmail.com> (maintainer:PWM SUBSYSTEM)
> > "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de> (reviewer:PWM SUBSYSTEM)
> > Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> (reviewer:ARM/Mediatek SoC support)
> > linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM)
> > linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support)
> > linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
> > linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
> > 
> > I don't see my name in there, did I become the PWM maintainer somehow?
> > 
> > What's wrong with Thierry taking this like normal?
> > 
> 
> Nothing wrong with that. I felt like this series got ignored as I've never
> received any reply from Thierry, even though it's a Fixes series that I deem
> to be moderately urgent; that's why I added you to the loop.

Then ask Thierry and Uwe, what would you want to have happen if you were
the maintainer of a subsystem?

> If that created unnecessary noise, I'm extremely sorry and won't happen again.

Not noise, just confusion on my part.  I'm glad to take patches that
have no obvious maintainers, or maintainers that have disappeared, but
that doesn't seem to be the case here.

Also remember that we had the merge window, which is 2 weeks of us not
being able to take any new code at all, even for fixes.

And finally, to make it easier for your code to be accepted, please take
the time to review other's code for the subsystems you care about to
make the maintainer's load easier.  If you do that, you will often find
your patches getting faster response just by virtue of there being less
work to do on the subsystem overall.  Why not do that right now to help
out with other PWM patches?

thanks,

greg k-h

