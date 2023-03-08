Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70964C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpZkV2Uf8rwSD4K0QFGV6gxaxZ8wXIZjwsAeiW+iMhc=; b=lWkj5G7ns/nBLK5zguEcPinTOS
	d6mEcetXZFxX5RMgfPwgp+aaqaUJP5t75R3VeLZ3ZoSU1ZwvfXt8aalYiRilN6goTjvDom1Xz16ct
	4tQLx+wWdSBVK7fPwmhzugdWxFd9siZSkV5/4FZPa3Gbt4p28tj7TTB4dlmP60SpRMJNUU1x3c7Z0
	M6Z/6mfvHGxPb9C7Ndgxbhn3L/hNAlllkXDDVDsgyekGTcyDIA7jsZpYPN/cZBJY2v+CF9tLkNRQd
	CDQY7CWhcMqpce7p2vysfjmKjITBZQcVDH3Tch6/r7PxRt65rz2I1No9yePGGyVmPdHUfr9y7hIDQ
	OppqQOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZv7q-005ZG0-Hc; Wed, 08 Mar 2023 14:50:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZv7g-005ZCU-IU; Wed, 08 Mar 2023 14:50:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DD1F6B81D16;
	Wed,  8 Mar 2023 14:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75ABAC433EF;
	Wed,  8 Mar 2023 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678287029;
	bh=k9CLjWy5LWSWIB8cQjG++VGjuzyrJmcSHzOfzGCShqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TntO7ahg63zljF8Crhsm2K5w+vTvTTXZqa9CQWD0fz28JGAVrwfPJYpl83vsj4Uy3
	 7zzBuqM2MIDnOmgvp1nztTy3gGMdeNaPZ2D1r+cAEghYw1R2iP2TSML3+tk6EtbtF4
	 UvN4LzpBPIi0ExCW15UCqCUsztrAbZjP4Y7o/nwk=
Date: Wed, 8 Mar 2023 15:50:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com, weiqing.kong@mediatek.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 0/2] pwm: mtk-disp: Fix backlight configuration at boot
Message-ID: <ZAigsHAgqkLlBD1y@kroah.com>
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
 <06918fde-64ea-37b2-da1a-1c8316457223@collabora.com>
 <06909bd8-3da2-1cf0-82ac-3ed4f3e63def@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06909bd8-3da2-1cf0-82ac-3ed4f3e63def@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_065032_782026_0C1118B0 
X-CRM114-Status: GOOD (  19.25  )
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

On Wed, Mar 08, 2023 at 12:46:07PM +0100, AngeloGioacchino Del Regno wrote:
> Il 23/02/23 15:16, AngeloGioacchino Del Regno ha scritto:
> > Il 23/01/23 17:06, AngeloGioacchino Del Regno ha scritto:
> > > Since the pwm-mtk-disp driver was fixed to get PWM_EN state from the
> > > right register, an old two-wrongs-make-one-right issue emerged: as a
> > > result, MT8192 Asurada Spherion got no backlight at boot unless a
> > > suspend/resume cycle was performed.
> > > Also, the backlight would sometimes not get updated with the requested
> > > value, requiring the user to change it back and forth until it worked.
> > > 
> > > This series fixes both of the aforementioned issues found on MT8192.
> > > 
> > > AngeloGioacchino Del Regno (2):
> > >    pwm: mtk-disp: Disable shadow registers before setting backlight
> > >      values
> > >    pwm: mtk-disp: Configure double buffering before reading in
> > >      .get_state()
> > > 
> > >   drivers/pwm/pwm-mtk-disp.c | 34 +++++++++++++++++++++++-----------
> > >   1 file changed, 23 insertions(+), 11 deletions(-)
> > > 
> > 
> > Gentle ping for this one: this is fixing backlight issues on multiple MediaTek
> > SoCs and was well tested.
> > 
> > Thanks,
> > Angelo
> 
> Since this series was sent more than one month ago, and since this fixes broken
> backlight on a number of Chromebooks with MT8183 and MT8192 SoCs, and seen the
> urgency of getting these fixes in, I'm adding Greg to the loop.

$ ./scripts/get_maintainer.pl drivers/pwm/pwm-mtk-disp.c
Thierry Reding <thierry.reding@gmail.com> (maintainer:PWM SUBSYSTEM)
"Uwe Kleine-König" <u.kleine-koenig@pengutronix.de> (reviewer:PWM SUBSYSTEM)
Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> (reviewer:ARM/Mediatek SoC support)
linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM)
linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)

I don't see my name in there, did I become the PWM maintainer somehow?

What's wrong with Thierry taking this like normal?

thanks,

greg k-h

