Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A4C04FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Js+PUReNC5fblwA4YV9+SkvAh/m3okNfWjQFPXiQIs=; b=y885fZtCSqnIJcAT/ZPLnYAQQh
	jjEEbAiJcmIhDzxKKmyOxwVJW3w1qazniU6wGDrcm0EN3PMzSbQytoKyu94tJoh4+c1tMCc/vgVd9
	+/nskeHeYW2PvgLieusbedI4piMD1/JJwH5+PM1Ldi1RYK/kM39GF2uPEZ4883nwDGsII19Sb2hjU
	No6HVmtgBobxpiu7ZW1HHTwr0jS/ejq70hlNVbrJUT50LWvtxstnaac5hkOESd14YQ/5zoePhh7sV
	sHEmJ/g2bd5VhaYr/y6s2pKtT1zX0hF7m8Xs9kOcxEWtz45L3YTudp/gNs51R6U4iEzoh4Oyg9vay
	geHethqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd4U-0000000BE5t-1pOk;
	Tue, 16 Apr 2024 07:17:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd2v-0000000BCta-2n4P;
	Tue, 16 Apr 2024 07:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27B82CE0E35;
	Tue, 16 Apr 2024 07:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BB3C113CE;
	Tue, 16 Apr 2024 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713251757;
	bh=fUF2u2LQ3yYejHYR20qqNgEGI+K7DgTOWHNB8ygVkHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GM0HpOKvvu3P9UCy4cNIuJYRWvPq5BYD+56S81mhe9N1R9IceqdpHoryxgbw1kGhY
	 +JxBBgH51if0tF9gFdKZ10CJHe/4KxL0pZvEaarQ/+kXVYQlIYT+qamLhpoqug094G
	 KERgownT5RTB7lAp9I7wg+v4Q+AsaMKUMMeXjVMY=
Date: Tue, 16 Apr 2024 09:15:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
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
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Pavel Machek <pavel@ucw.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Samuel Holland <samuel@sholland.org>,
	Sergey Kozlov <serjk@netup.ru>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 03/35] media: uvcvideo: Refactor iterators
Message-ID: <2024041643-unshaven-happiest-1405@gregkh>
References: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
 <e0377059-4073-4779-8385-506b9b39301e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0377059-4073-4779-8385-506b9b39301e@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_001602_335970_98572589 
X-CRM114-Status: GOOD (  19.55  )
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

On Tue, Apr 16, 2024 at 09:03:36AM +0200, Markus Elfring wrote:
> I would find a hint for a variable change more appropriate in the patch subject
> instead of the word “iterators”.
> 
> 
> …
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> …
> > @@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >  	int ret;
> >
> >  	/* Find the extension unit. */
> …
> > +	entity = NULL;
> > +	list_for_each_entry(iter, &chain->entities, chain) {
> …
> 
> I suggest to move this assignment into the definition for the affected local variable.
> 
> 
> By the way:
> I see another source code adjustment opportunity in this function implementation.
> https://elixir.bootlin.com/linux/v6.9-rc4/source/drivers/media/usb/uvc/uvc_ctrl.c#L2165
> 
> Can it be nicer to use labels “free_data” and “unlock” (instead of “done”)?
> How do you think about to increase the application of scope-based resource management here?

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

