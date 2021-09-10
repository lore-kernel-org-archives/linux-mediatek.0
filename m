Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711DDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 10:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310546103D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 10:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 310546103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYZV5N2LJijl3DP4+PSHRmy6nAhJw/QAVD1RSCQA8Yc=; b=l7SdcTXDmZ5LVyp3xQ+SCOJd0d
	6jNGb2vmF7Y5CHObZPtwzFaJ/e4QUyW+MYBUkuK/gpRTBPOmvUAgRi5K9sFjJBNUMJEqj+UfbCV1+
	qou1yCAFjlYiyH69p9/N2aVk1Vsxrn0HByR7XvqmkjU+7Nh1XK1a9EpB9ffSQLRCVMkCId2d7ddWP
	f8ZzoMJyAiTKGVF6sdgqMadIrgF5hTbOOX6pq7UL1IXMvtV7w0zvX9fXWobyn3AiswiQhCZXq8lIU
	3ub7BSstqHv2icO5zzAY286SOOmhoXTUNoJHzqAHSFkfmR6bYdLkC/04L0XbA7+1Ere2bwPahp30q
	eddK6JKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOdiC-00CSF6-PO; Fri, 10 Sep 2021 10:24:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOdhz-00CSCg-Mz; Fri, 10 Sep 2021 10:24:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD07C6103D;
 Fri, 10 Sep 2021 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631269475;
 bh=cpBCtKfoFJsBnQ3CVScmpNOH6jE9CCJ9RCK8UwFQj/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZrHss3lnb7kui0uBEWe5AxyvJ9GtTIXPYGNfC3rgexbyODBYOxrhrUVomdUyMh60
 s52WJj7MWKMY9ugTC8fet9t4XARhrKRIRn6ONglqnwMgYnRNSJ18B7bpIj3G4+OmVC
 0IkwWolEAMWoZd5PsGlXlFuvbB0YgLaQH9Sni3d4sGpB7wAd29t913C0/XBT/mO4RU
 mqS7JewfNHRalNUbxaBZ+KPc9zJ+hh5+He6mAnqzjUpmToMqLJC421KDMuDAAwjBme
 fdNeVCZdvdWe6f0fElUlr+f+dytlBDompPp3UJsv/Ch6AXBvO50dLHvwDALBy0j+Kt
 Cp9J2iwZQ6BIQ==
Date: Fri, 10 Sep 2021 11:23:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: tiwai@suse.com, matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Message-ID: <20210910102358.GC4474@sirena.org.uk>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210910092613.30188-1-trevor.wu@mediatek.com>
X-Cookie: You are standing on my toes.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_032435_810565_0CBCCCDD 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Type: multipart/mixed; boundary="===============6368924306847793258=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6368924306847793258==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 10, 2021 at 05:26:13PM +0800, Trevor Wu wrote:

> When memory allocation for afe->reg_back_up fails, reg_back_up can't
> be used.
> Keep the suspend/resume flow but skip register backup when
> afe->reg_back_up is NULL, in case illegal memory access happens.

It seems like it'd be better to just allocate the buffer at probe time
and fail in case we can't get it, I'd be surprised if there's many
platforms using this hardware that don't also end up suspending and
resuming.

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE7Mj0ACgkQJNaLcl1U
h9CgyQf/ZnO68AsLS2olrmP3aE2kiE4Ya+tAlitO9OKbhT1L/n+iJbKrZ4LRbXEQ
ZfHKa0ObhYErjjmvlqb4C/bpkXixnPVFl+sMv8WOMenad2nwt+ObdT59iQzEVqA6
L/mePf/Fgdda0FuauBlcVcQT0Phb275wyvLRqTDmpTiWjDLNZTzuID9rU3b5ZSWW
had8BZqHsE6PtwSFpLw2/GOhn0aqyO/4SiTiEi5qowd1abY+HhjLfVUPuhGBU8sP
Yiy/MH030ps8jfXnX6FRF+fEp+T70yy3EZWm45c3vl2hLGDSH2iCHh4IDqZb8ynv
LPoGRv5X0L7ebfy2BqkWOahDI7GTNg==
=EfnS
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--


--===============6368924306847793258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6368924306847793258==--

