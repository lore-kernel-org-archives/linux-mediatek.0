Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F612CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIQWAof7QZtlNfCVxARlw6Y2gtmi1htbvZNPk02NXdc=; b=sqOz4DYPIy94e5LwN43kp6hAMT
	U3C4BA07+Q4yQZ6kJbe9E2r6PIJmOQpxVhpyrkKCJ4QauPQqefGHpHyZA4nkS4ZLMsY8AcQsh/K0i
	QK95ECUrowTB6k2JUokC/18HVIQqINmNjbREYRf92qHm5x4IPaa03thWoLAZJJc22Kgk0FUTeaM/k
	RpVkwvsntCclSMD3xJkMauhyAkeUxlDKEmZqT4xxdJ1q8Shyf5PNSb1ud2sCKhJxafRDfu7SdjHpj
	NPedFx2R9gQZgZZnpuKbphfIYOxSxFS4K3mj3uUDFqX2l+AXgXUBCexdLIeDJ6AQmibGEsppZbWwk
	cLJi6JEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoLD-0000000AgZ3-0e63;
	Thu, 11 Apr 2024 06:55:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoL9-0000000AgWf-0i1d;
	Thu, 11 Apr 2024 06:55:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7603CE2A7E;
	Thu, 11 Apr 2024 06:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F3AC433C7;
	Thu, 11 Apr 2024 06:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712818516;
	bh=g5uFzpLBD5mMvoeBx8hAdujf+J4m8llZ6LvgrHfw/qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvNxYyjsAvCfq31BNCEVkvEyXMKqXg17zoo7EoJSAq2MhkmyRtqBo2DG+2Ssxh0TN
	 0mtKRf7SNGnt4dwLynbgqlfJ2dgqXrwu52VMW6bXvShCdH7WF89v9WoNW3hj0nIzba
	 jffDoK1d5Fp3YmDVOciJfQQlJ7HDJTgcCy4GQEHNv6vh9TR9kBTl3ngPRT5G69VI85
	 MXgiWEZTCbnWSyzbZzKDdGh/+g/HuUsPq6nz2DqeYu2PtRF7nf5GCpJGY6aUJJGuUN
	 QU9Fww/Ln77Q3okVcn7v0WKeIXxi5fKU2aDYHErN5KaEOfszOylPhdAl1U8b3PPGjD
	 72xWSWZmp3Wig==
Date: Thu, 11 Apr 2024 07:55:11 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ChiaEn Wu <chiaen_wu@richtek.com>, pavel@ucw.cz, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, peterwu.pub@gmail.com,
	cy_huang@richtek.com
Subject: Re: [PATCH] leds: mt6360: Fix the second LED can not enable torch
 mode by V4L2
Message-ID: <20240411065511.GB6194@google.com>
References: <d1d1419bb322e2b0f40d34edd3a66979015b668c.1712657386.git.chiaen_wu@richtek.com>
 <c98ea7c9-6c9b-466d-bc49-ec76874ac6da@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c98ea7c9-6c9b-466d-bc49-ec76874ac6da@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_235519_554301_A801F20B 
X-CRM114-Status: GOOD (  24.62  )
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

On Tue, 09 Apr 2024, AngeloGioacchino Del Regno wrote:

Not sure why, but this mail was sent unthreaded from the original.

> Il 09/04/24 12:21, ChiaEn Wu ha scritto:
> > V4L2 will disable strobe mode of the LED device when enable torch mode,
> > but this logic will conflict with the "priv->fled_torch_used"
> > in "mt6360_strobe_set()". So after enabling torch mode of the first
> > LED, the second LED will not be able to enable torch mode correctly.
> > 
> > Therefore, at the beginning of "mt6360_strobe_set()", check whether the
> > state of the upcoming change and the current LED device state are the
> > same, so as to avoid the above problem.
> > 
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >   drivers/leds/flash/leds-mt6360.c | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
> > index a90de82f4568..1b75b4d36834 100644
> > --- a/drivers/leds/flash/leds-mt6360.c
> > +++ b/drivers/leds/flash/leds-mt6360.c
> > @@ -241,10 +241,20 @@ static int mt6360_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
> >   	u32 enable_mask = MT6360_STROBEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
> >   	u32 val = state ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> >   	u32 prev = priv->fled_strobe_used, curr;
> > -	int ret;
> > +	int ret = 0;
> 
> I prefer that you leave ret uninitialized here, and...

What's the reason for this?

> >   	mutex_lock(&priv->lock);
> > +	/*
> > +	 * If the state of the upcoming change is the same as the current LED
> > +	 * device state, then skip the subsequent code to avoid conflict
> > +	 * with the flow of turning on LED torch mode in V4L2.
> > +	 */
> > +	if (state == !!(BIT(led->led_no) & prev)) {
> > +		dev_info(lcdev->dev, "No change in strobe state [0x%x]\n", prev);
> 
> ...that you do here, instead
> 
> 		ret = 0;
> 		goto unlock;
> 
> With that addressed,
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collaobra.com>
> 
> 

-- 
Lee Jones [李琼斯]

