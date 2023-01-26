Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79FBC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvUs54OAyVS3LgRQ1nkvHY6BX79R4Nu4Dn9LxUhH4rY=; b=wjphNbWzZbJJ8PtkaA6KJ4WJLM
	NC7Xcb6OJXsE9XKuLkvey5UoU7kQNV1l1S4IekkeR6Q/iBo4wagzmXJ7CbviqqfrUSB4Q6wx9pfE9
	a95FILup5KmVehQodsUZxp80UmxAQze4uI/sDHdsHMZwORhikLC6hhzFiWMEZ30XRIf+xm3qyeh85
	5qklYvCh9LKBsCPj6NISqoLLFEBEItzvQj36/ecFXKh8yRff+h9psM7gWBRdLmdCcHgiivXsvIhq7
	/oo315zXEi8oblyf3Q2b9hbcN+1e0Kilj6ysJ7aq6Ap+MeT7AG2d3xbbgLg6ZOopOMGMvLisKvKzT
	NUzuBmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4p8-00BftW-9d; Thu, 26 Jan 2023 16:10:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4ou-00Bfqt-AX; Thu, 26 Jan 2023 16:09:50 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B3E8D6602E7A;
	Thu, 26 Jan 2023 16:09:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674749386;
	bh=ReNx+z5pm2gVgqa0p7qKV5inYrk0tRsLDHNGin5UdgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+i/l6p/S0iieHzfPbRkG8LrtfwHriyYIr33/wuK0q1ebLkHb9HvtMJaWrm8QSRm2
	 sbHtgH6/deLDvQU7YvssI4gekzf/PW8HGppFUrxrGLRGhEobwk8KDqc+bRxHCVatmS
	 /IJGrXHzohYPF67EbnrBGs1peqrqGBYud/pJMI0r12azrf2FZI13NyLlo5bl8GG+GE
	 E+y8d4TmKrlTtXMadbYcjsdA3+PJcR6tdcNZW6ZYyi0JdbrflCA/jGhRTfX3LTrXgP
	 qXP/qT/zL865I+ZXhVEGMMKzG0LqbDr0kR3HiyyzBa7/fEvx9hjfSYyrgf6rrZ+2Cn
	 +pWHHPGx4JSuA==
Date: Thu, 26 Jan 2023 11:09:27 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com, weiqing.kong@mediatek.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 2/2] pwm: mtk-disp: Configure double buffering before
 reading in .get_state()
Message-ID: <20230126160927.4hgifpmybvsgshro@notapiano>
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
 <20230123160615.375969-3-angelogioacchino.delregno@collabora.com>
 <20230126151914.rhwhioz6yyhaq3z2@notapiano>
 <aa17fa46-0f16-2102-1bd3-6d76cee90ee1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa17fa46-0f16-2102-1bd3-6d76cee90ee1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_080948_654784_41BED0B3 
X-CRM114-Status: GOOD (  40.28  )
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

On Thu, Jan 26, 2023 at 04:24:29PM +0100, AngeloGioacchino Del Regno wrote:
> Il 26/01/23 16:19, Nícolas F. R. A. Prado ha scritto:
> > On Mon, Jan 23, 2023 at 05:06:15PM +0100, AngeloGioacchino Del Regno wrote:
> > > The DISP_PWM controller's default behavior is to always use register
> > > double buffering: all reads/writes are then performed on shadow
> > > registers instead of working registers and this becomes an issue
> > > in case our chosen configuration in Linux is different from the
> > > default (or from the one that was pre-applied by the bootloader).
> > > 
> > > An example of broken behavior is when the controller is configured
> > > to use shadow registers, but this driver wants to configure it
> > > otherwise: what happens is that the .get_state() callback is called
> > > right after registering the pwmchip and checks whether the PWM is
> > > enabled by reading the DISP_PWM_EN register;
> > > At this point, if shadow registers are enabled but their content
> > > was not committed before booting Linux, we are *not* reading the
> > > current PWM enablement status, leading to the kernel knowing that
> > > the hardware is actually enabled when, in reality, it's not.
> > > 
> > > The aforementioned issue emerged since this driver was fixed with
> > > commit 0b5ef3429d8f ("pwm: mtk-disp: Fix the parameters calculated
> > > by the enabled flag of disp_pwm") making it to read the enablement
> > > status from the right register.
> > > 
> > > Configure the controller in the .get_state() callback to avoid
> > > this desync issue and get the backlight properly working again.
> > > 
> > > Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/pwm/pwm-mtk-disp.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> > > index 82b430d881a2..fe9593f968ee 100644
> > > --- a/drivers/pwm/pwm-mtk-disp.c
> > > +++ b/drivers/pwm/pwm-mtk-disp.c
> > > @@ -196,6 +196,16 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
> > >   		return err;
> > >   	}
> > > +	/*
> > > +	 * Apply DISP_PWM_DEBUG settings to choose whether to enable or disable
> > > +	 * registers double buffer and manual commit to working register before
> > > +	 * performing any read/write operation
> > > +	 */
> > > +	if (mdp->data->bls_debug)
> > 
> > I feel like this condition should be the same as in the apply() callback, since
> > they're doing the same write operation, so also have '&& !has_commit'.
> > 
> 
> The bls_debug register is used to both enable and/or disable various features,
> including the one that I'm targeting in this commit, which is disabling shadow
> registers.
> 
> As I explained in the commit message, we don't want to - and cannot - assume that
> the bootloader doesn't *reset* the backlight controller before booting Linux: a
> reset would re-enable the shadow registers, and this function being called as
> first to check the backlight EN status may fail to do so.
> 
> This is as well true in the opposite situation where, in the future, we may want
> to set shadow registers ON, while the bootloader sets them OFF before booting:
> adding a (x && !has_commit) check in this branch would defeat that purpose and
> make this commit... well.. partially broken! :-)

Makes sense, but in that case shouldn't we drop the (&& !has_commit) in the
check of the previous commit too? I get that in the pwm's core current logic,
get_state() is run before apply(), but given that we also write the debug
register in apply(), we're not relying on that. So as it currently stands, if in
the future the bootloader sets shadow registers OFF, and we want to set them ON,
and we call apply() before having called get_state(), we'd be back to the broken
behavior.

Thanks,
Nícolas

> 
> Cheers!
> Angelo
> 
> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > On MT8192 Asurada Spherion.
> > 
> > Thanks,
> > Nícolas
> > 
> > > +		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> > > +					 mdp->data->bls_debug_mask,
> > > +					 mdp->data->bls_debug_mask);
> > > +
> > >   	rate = clk_get_rate(mdp->clk_main);
> > >   	con0 = readl(mdp->base + mdp->data->con0);
> > >   	con1 = readl(mdp->base + mdp->data->con1);
> > > -- 
> > > 2.39.0
> > > 
> > > 
> 
> 

