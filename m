Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA94C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D44E6103E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D44E6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJizVN/SW1/CKeUJNN0aJkBLwp1M9G2mi0//U7Sb+0I=; b=sLr6uDX+4JplETAXs2zKVc/qyc
	64YxmXvnkT3flD5gWlB5VStBhc4hIShWczd9Jzw7DzNrOCUnMDY8APsxF5ntnuxD/7gyLywzL3d1P
	u/XO5AhQRvHEIXDLl0IXKEndpZROKSk1KwWxzx3N2ZHDUSs/JZARkcKwOqvRKGE/TG8jJuAnjKBa5
	RKhtlQ4O5aPcXjLyJi9op6vBQvtchUojn02lw1C5jpDq7Xpw8xTIC+DBKfbVlMSX1as9ynMmrL9LN
	1Uu5yozpkKjqVe9VNR6mgGRSVbOm3zYiyilmONXreSsFlDENqILW79f4dMEKKrRHX0Qah69vVKTHl
	+GI+Ch3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj2I6-00BzUj-Hb; Fri, 05 Nov 2021 16:42:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj2Ht-00BzSW-Tq; Fri, 05 Nov 2021 16:41:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E46006125F;
 Fri,  5 Nov 2021 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636130517;
 bh=ocA+aw4pirZGTHGgqV169WIEms5jSzs7du1qenb+eZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X0CrHeWXPSgOGxW1ABfOZe5F7iB9LiCCXc1YpXOPxUUw6gyKyCvDhXkyyWXCsSaz/
 Nc22Q44HTYx2dW5mblxoy0pSUOf3OexNeLYU7GnugM5i6eXQG+7mJZ4hP41FkdnDrl
 TsPFi3OY02thxiKa4A5MWAIcUwM/PsakN08TPiLuRddw6NmojaF8HzOnQrlun07jZR
 s2FXx4uO1+suYZlEYeC1T1a1BvfjNK1CHdLodhUruXzUXElsDVo9ntdWcw3RbPRxTp
 7CIcxE6ghriTf1J3ZpSnt3E0Z40dgJbskVanPYkGje0Nk9UGVl9SjxPUFZLt59PElG
 ncqqOIWv351HA==
Date: Fri, 5 Nov 2021 16:41:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
Message-ID: <YYVez/V9ocCXhYmg@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
 <YYVQC7KLZx8oxdXT@sirena.org.uk>
 <e404d241-0685-643b-4b9d-d85bb8783385@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e404d241-0685-643b-4b9d-d85bb8783385@linux.intel.com>
X-Cookie: For recreational use only.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_094158_031588_70753C55 
X-CRM114-Status: GOOD (  23.00  )
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
Content-Type: multipart/mixed; boundary="===============8541381400956270860=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8541381400956270860==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xu7RSJUInac+5dPD"
Content-Disposition: inline


--xu7RSJUInac+5dPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 05, 2021 at 11:16:05AM -0500, Pierre-Louis Bossart wrote:
> On 11/5/21 10:38 AM, Mark Brown wrote:

> > We shouldn't be requiring people to load completely different drivers
> > based on software configuration, what if a system wants to bypass the
> > DSP in some but not all configurations?  Can we not just have controls
> > allowing users to route round the DSP where appropriate?

> It was my understanding the card relies on separate components

> - a SOF-based component to provide support for DSP-managed interfaces
> - a 'non-SOF' component for 'regular' interfaces not handled by the DSP.

> this was the basis for the changes discussed in
> https://github.com/thesofproject/linux/pull/3217 and
> https://github.com/thesofproject/linux/pull/3236

So it's actually supposed to end up as two different cards which can't
possibly be interlinked?  That doesn't seem to add up entirely given
that there's stuff being moved out of the current card, and I thought
these systems had a fairly comprehensive audio muxing capability.
Trevor, could you be a bit more specific about what's actually going on
here physically please?

> But indeed if the same interface can be managed by the DSP or not,
> depending on software choices it's a different problem altogether.

> We've looked into this recently, if the choice to involve the DSP or not
> is at the interface level, it might be better to have both components
> expose different DAIs for the same interface, with some sort of run-time
> mutual exclusion, so that all possible/allowed permutations are allowed.

Yes, if the interface can optionally be completely hidden by the DSP
that's adding another layer of complication.

--xu7RSJUInac+5dPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGFXs4ACgkQJNaLcl1U
h9BRSAf/SkjWUf/cCKGy0zPR/tNt3CMqLlX0YCzYqYiswj6dKfU0LWjOlsXEClp2
xvBonvHD9Ni048rh/n5re028LssK5IYCcxqNfi3WMM+g1nTe7msKcRWanYElCx1U
vmZUv5k7H/1aYktEU5/KjPhz6YlGi4eJqGPLl397gC0fQX9GReu4b9tdipO+AJ+p
UzDeHJ+pP/rvbpSiUcRKxA4MrFXYq17gd0xaRuUbrdOvNH6yKUfaeDcz8MBW29ex
c5gA39zLIqFq9VsEmww6uDWqX0WattYGTzErTm2y2unLpvoxVdsidUgEESNtimpS
AXlgO4XPiIZSX96+ACgiOB/MBzFFsg==
=iro5
-----END PGP SIGNATURE-----

--xu7RSJUInac+5dPD--


--===============8541381400956270860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8541381400956270860==--

