Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8A7C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 07:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CveOrbVF2/uaY1cUDeZzIO6XscERmowLRm0zEKBO8XI=; b=0qylJURBj1O+QKbu945tIUtFF7
	iF15nOVObfIBNTu3o/9tBkYYJTZ+ycjULRTo2D++WKbNlVBBEcEw7BAB/cFlAgFzXJNzS5W1Vqj1o
	quUT/EapA1ilRF8nYhTInCgDGGZ3uhyoaSwxE7l/jhU5bAXomQZ41xiVz5mWsSXmccD84ijIBpa1A
	0lWI/1UjB9TW80LVxEESp0kzX3lLg3OXrXGxlbvO2jK2jrIUYudB49KjtKqonmST/7cxdt3ErECzi
	QLhXQJsxee6JpDjoCpDmngePbWs7TVIYiiumUSff1bUuWpmCkMIFzLIiFcKtoJN4GUaexpP4eBpHS
	6bD4t/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25v4-00FZeQ-2T; Mon, 05 Dec 2022 07:29:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25uz-00FZdL-Ml
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 07:29:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 15DB3B80CA8;
	Mon,  5 Dec 2022 07:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AABFC433C1;
	Mon,  5 Dec 2022 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670225374;
	bh=fx8DijmljxFft2vuBcvu+su0yNi3F7HjMQ2QA0Z/qsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArPxW/i43FgeOiVQwWsnHQz8lP9FM7g1jZ82IQgQoJNy+5y/JXTULJu2m/eQmA8kw
	 MkvrBPqvGOfHjxkvGzQEUhLA3oZnB/1X3Hf9B9deqirDJTkD50z+/ChnRqAn5fGJJT
	 wraL883KEEQdChnvBqmOZBznbVuQwzytrs8/oKMSvohcewZs8VtpvywCrVTz3wc6CH
	 mxAZZyGMuh5PSzXSprPY+hkbY1H7klD0Z5LmJCl4PsMl6K+vpRrTB//NZwJlkWli6q
	 2dS33bfzZwQmYVH+hSS1EP94T7L20cLg3kkZe2CEPPMuz7W7pvkHFKEy612JupzKgO
	 gTCbvuGm6esEA==
Date: Mon, 5 Dec 2022 09:29:30 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <Y42d2us5Pv1UqhEj@unreal>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
 <Y4ybbkn+nXkGsqWe@unreal>
 <Y4y4If8XXu+wErIj@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y4y4If8XXu+wErIj@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_232937_923143_A093AAE6 
X-CRM114-Status: GOOD (  22.13  )
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

On Sun, Dec 04, 2022 at 04:09:21PM +0100, Lorenzo Bianconi wrote:
> > On Fri, Dec 02, 2022 at 06:36:33PM +0100, Lorenzo Bianconi wrote:
> > > Introduce __mtk_wed_detach() in order to avoid a possible deadlock in
> > > mtk_wed_attach routine if mtk_wed_wo_init fails.
> > >=20
> > > Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo su=
pport")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/net/ethernet/mediatek/mtk_wed.c     | 24 ++++++++++++++-----=
--
> > >  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 10 ++++++---
> > >  drivers/net/ethernet/mediatek/mtk_wed_wo.c  |  3 +++
> > >  3 files changed, 26 insertions(+), 11 deletions(-)
> >=20
> > <...>
> >=20
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/ne=
t/ethernet/mediatek/mtk_wed_mcu.c
> > > index f9539e6233c9..b084009a32f9 100644
> > > --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > > +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > > @@ -176,6 +176,9 @@ int mtk_wed_mcu_send_msg(struct mtk_wed_wo *wo, i=
nt id, int cmd,
> > >  	u16 seq;
> > >  	int ret;
> > > =20
> > > +	if (!wo)
> > > +		return -ENODEV;
> >=20
> > <...>
> >=20
> > >  static void
> > >  mtk_wed_wo_hw_deinit(struct mtk_wed_wo *wo)
> > >  {
> > > +	if (!wo)
> > > +		return;
> >=20
> > How are these changes related to the written in deadlock?
> > How is it possible to get internal mtk functions without valid wo?
>=20
> Hi Leon,
>=20
> if mtk_wed_rro_alloc() fails in mtk_wed_attach(), we will end up running
> __mtk_wed_detach() when wo struct is not allocated yet (wo is allocated in
> mtk_wed_wo_init()).

IMHO, it is a culprit, proper error unwind means that you won't call to
uninit functions for something that is not initialized yet. It is better
to fix it instead of adding "if (!wo) ..." checks.

> Moreover __mtk_wed_detach() can run mtk_wed_wo_reset() and mtk_wed_wo_dei=
nit()

This is another side of same coin. If you can run them in parallel, you
need locking protection and ability to cancel work, so nothing is going
to be executed once cleanup succeeded.

These were my 2 cents, totally IMHO.

Thanks

