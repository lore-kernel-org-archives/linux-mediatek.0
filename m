Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6300C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Apr 2024 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WaKtkTkS6HsNcZrXdKNsrJ0IUmeNzKLV+4vYSz53F8=; b=2UO6egTp+slSCqq8gEiYwdosIp
	IAqHeztME//yRa+oRj8iCLnlgcd4EXK7Z31gB0Uf+ACWEWtKiFerCey0q+30Pp2pdSZn5Xnq3YGZ0
	fknScea6dujKreUKekRFkuwZv4Tp3BHUxzC5lQNsoB94o231Fo598WP6yJL8ozBa21alviZipkb8U
	8rJ7oC6KTrZ++7IEzYVQnWJc2jr7Ers+n31ZLFqAua4WIH+9qDwgqIa41UlIpYFOIMGCCwSwaJ2ol
	Yb73pDd7BBTX+pbb8Xv6oW76Y7tr6DMC9JlZOXXQ7iMEqNnKesU6aLRkk085Oc+ZT5MwNYhrZU4c/
	y2g/ig8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryXYQ-0000000AahP-1LU3;
	Sun, 21 Apr 2024 13:48:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryXYM-0000000Aagj-3FID;
	Sun, 21 Apr 2024 13:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33EB6601BA;
	Sun, 21 Apr 2024 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D77EC113CE;
	Sun, 21 Apr 2024 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713707300;
	bh=LlUgqYs3MCsI8tfMXyODmqS8Vxzo+bhP7dqc9s6OIOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2HQZsOpXkpKHudpdluczuDQnp4aiFdqJ82dLDH1II7kBwQkMvcWNiCIkeSoP5rWm
	 m9nZ2jQglkE44ukF7sxlCBCK/PQXihvUDzufJomZBn2n9OqRQMJ6Ud/dSxNSDJpwTv
	 Lg9wQiO5BEJ/8jDnKp9G7q+/3ehh9dAKnAX9ycsg=
Date: Sun, 21 Apr 2024 15:48:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	kernel-janitors@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>, Dmitry Osipenko <digetx@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Samuel Holland <samuel@sholland.org>,
	Sergey Kozlov <serjk@netup.ru>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 24/26] media: venus: venc: Make explicit the range of
 us_per_frame
Message-ID: <2024042112-deferred-fantastic-5b4b@gregkh>
References: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
 <0ab13de0-0fde-40e2-958f-6a0818911009@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ab13de0-0fde-40e2-958f-6a0818911009@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_064823_348068_44856CCD 
X-CRM114-Status: GOOD (  15.58  )
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

On Sun, Apr 21, 2024 at 03:25:31PM +0200, Markus Elfring wrote:
> > Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit number.
> > Make that explicit.
> 
> Would it be more appropriate to move the word “explicit” to the end
> of the summary phrase?
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

