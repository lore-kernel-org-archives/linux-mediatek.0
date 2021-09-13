Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2768BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 15:34:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF1C60249
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 15:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFF1C60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JAv7rqputDwTQ6lrMYUOpi/HdfGtPtnVTTv4cDnKXA=; b=LFZ2hnLeILY4AjJXzwhW6BGquK
	z4FVZeXODMijDKjWDwT1MTem92bJzSVOiDImj2KnSW2eyiuBBOB04VJwtdaG1lIYH/lhzrfGQcqnl
	D4bjVkyn4OacpLIvXz7AWncwrYKa4OqI1SDU0ckpFPI+eqT4yA+6FnqPzSjHazQaQo4qpkMUCYNU3
	s9/JJsjg/9asV3ABnGETX+U61clz+eTPpe2wykO6ZR5pxyOnfmixAaF4tF2HiYH+aPEXjrLsU+bNe
	dWyGEc1ZrXTXgHmkLCIp2wbE8LqD29G7PEmQM2PekglO5apJ0Y4eRyXV1ki7tX0tlwOSFUKGJeK5t
	+SeaBRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPny4-002Bdr-7u; Mon, 13 Sep 2021 15:34:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPnxX-002BVH-2p; Mon, 13 Sep 2021 15:33:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C236F6103B;
 Mon, 13 Sep 2021 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631547206;
 bh=BVrxRWHKyUrGv+35tc6x5b7RGSJFUHhIxAEhdcNdIKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FakgeYfeGaCUOVDhuplPOuxzkueMRigaWZPbFMdFaWzXE1bGfIIOH1Mm6EF0NCgJX
 Iluf7pmOjapb/XnI4+xibPLH3PNTzPQtwjQ1G+hkJcJfOmoWXgsYh9StzqKB3c5B0l
 Z58aIJ3VTZ8ov0dWfyQjkfnEQ0+E5nZoZ68DRIznchEDUSgnv9OjoUdbDRw5mZzfLD
 zYi7sK5wyxfa4wT+OBkNYTjBRRZVXRPio/dHjMwWBat9Aer4OgGDt55PZngQ0+SPUf
 IfaLvfbRcezowcvk0kZoz1CaRIS40SwyTYzT6x0TImW6ksMk4RdDCn3AQARF/azmqn
 gddnu7nozISGw==
Date: Mon, 13 Sep 2021 16:32:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: tiwai@suse.com, matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Message-ID: <20210913153246.GI4283@sirena.org.uk>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
 <20210910102358.GC4474@sirena.org.uk>
 <5fa1e99f1b9097336a3e610dc383170f09036b14.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <5fa1e99f1b9097336a3e610dc383170f09036b14.camel@mediatek.com>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_083327_186411_D953FD94 
X-CRM114-Status: GOOD (  21.69  )
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
Content-Type: multipart/mixed; boundary="===============4079444748995922529=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4079444748995922529==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 13, 2021 at 01:55:38PM +0800, Trevor Wu wrote:
> On Fri, 2021-09-10 at 11:23 +0100, Mark Brown wrote:

> > It seems like it'd be better to just allocate the buffer at probe
> > time
> > and fail in case we can't get it, I'd be surprised if there's many
> > platforms using this hardware that don't also end up suspending and
> > resuming.

> Thanks for your suggestion.
> I agree it's better to allocate the memory at probe time.
> I think we can still keep the implementation in the suspend/resume
> function as a fallback solution if user doesn't allocate the memory in
> probe function.

If you can't allocate it at probe time you should probably just fail the
probe.

> In the new mediatek SOCs, regcache has been used to handle register
> backup.
> Do I need to add the buffer allocation on probe function to the
> platform in which mtk_afe_suspend and mtk_afe_resume are used?

I think you should have separate implementations if you have both regmap
and non-regmap versions of this.

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/bx4ACgkQJNaLcl1U
h9Arhgf/YT4zF+AifPO22fnvUWMW7ps029xRsDBaUGwyRl4XFu6O90vmI7jjaogy
2fFfMzXc8EoOGWfhZhrhZqkIogzIol1wDrEnHtWLDpdnWBOgejqTG6jh3hbIU4EI
PRKbvL3qTXlzfhz23Qb+BjG4SQaDbVfRbb+e+nE4Om9qw5b199MIDht8Mye8KMgE
Wqt+y6alWGPcl/1RsdRJ8pVWASpQyYmwwbaHnVtGEarrdVOZzmiEL2offMAwiW4G
NDRcFOJcCrpu5eECoF2RM5XeRwzwJ8CxIvKMtlbhbniPDRyBPaLZ2zPGEUfInaoe
8lGIdpFSBHHvIq1QE7w6VAoqpmER4g==
=eZc7
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--


--===============4079444748995922529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4079444748995922529==--

