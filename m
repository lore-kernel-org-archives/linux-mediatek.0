Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91009C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbb6qmpJIAPkiRUKWSnLYdnj/7aXtDsBB/Pqskpq7yY=; b=Fb1Gyzm4MwV1JOM2KEsBKx38KK
	ffLYwTrfKX6VXIwmmb0k3LGzLltGWQOlFNSEJ8hj602N31Liijwh0XIOt6XcWbVfbHKncba1lDC0G
	u4TGNeshCCv01xPLWHPIx+8zQR/c4cLdAAL5lpJ+X+4ke4ocZFf4ADfuOeTNQpzRpNPymrdg/FVVY
	xv+ZhWoztfXTabDeYT+azBC2GOvMAnscBfgi1B90lVRTPf61eaTKIKJ7bb1qXpqLFCn3T+SFTFqwo
	1xJMqqYE2kuEIw/04vpBiOr8WzAcbKcorZsz9foSevfTw/+AvXwChVC28xxzJbYWtxQI3Mfta9vtN
	ILMrbiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt8Oe-004WY8-EE; Mon, 23 May 2022 13:46:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt8LC-004UhH-LT; Mon, 23 May 2022 13:43:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 027566090A;
 Mon, 23 May 2022 13:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73320C34100;
 Mon, 23 May 2022 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653313401;
 bh=TyiUkDHlflTnKEzILvhvONXQ/FiPqNQ7lI3Q/Y6bADg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BPCciIhPVoG5lF2g5LwaEyIBRmWbqBpGLSjZG1umVrKPFpWqZ/qX9MAOcay5UhDAn
 QC59huFzN+dAsWD4VhdnaNAEzk74hPrlzZ4jg23TRL27/nEz533Dkled3lqhg638Xy
 zJbmaeez7/OkQOSYGx4sHJuJnTAqfSnLc2QN6erJ+CIKcQVAB1IuItZFmc4PMZBGsJ
 JE22rDq/n6KCzRQyofJ3uIP9oTvH5NCzPh40jcDJgHPwY4VhmcvF2wsXpBMICTeJM1
 tWHAebtGJfCShDnlxwZtLVbmxrfa1IbOT6CAcnsu/GFGq0FlU9QVW7qSvkZ+y0BKTm
 AKpDFW8AZJGBQ==
Date: Mon, 23 May 2022 14:43:16 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] regulator: Add driver for MT6331 PMIC regulators
Message-ID: <YouPdNrBS2xwWwlI@sirena.org.uk>
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
 <20220520133305.265310-3-angelogioacchino.delregno@collabora.com>
 <YoepiTUfdhkYByo7@sirena.org.uk>
 <6cc68be9-e509-eae4-801d-997fdc01dcf2@collabora.com>
 <YouFcSapkVC7ZfuP@sirena.org.uk>
 <a6606891-d55f-dbce-7c5a-86390694e1c4@collabora.com>
MIME-Version: 1.0
In-Reply-To: <a6606891-d55f-dbce-7c5a-86390694e1c4@collabora.com>
X-Cookie: Sales tax applies.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_064322_820749_98F9E5D6 
X-CRM114-Status: GOOD (  26.26  )
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
Content-Type: multipart/mixed; boundary="===============3044838328634485722=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3044838328634485722==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3JjAka1nrbTHhQDM"
Content-Disposition: inline


--3JjAka1nrbTHhQDM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2022 at 03:22:39PM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 15:00, Mark Brown ha scritto:

> > Right, my point here is that it looks awfully like the documentation
> > (this came from documentation I guess?) is including some extra bits
> > that get ignored in the voltage selection field here.  That seems like a
> > weird choice somewhere along the line.

> I wish I had a datasheet for these parts...

> All of this comes from analyzing a running device on the downstream 3.4 kernel
> and on understanding the (not really readable) downstream kernel code...
> ..but yes, I agree on the fact that this seems to be a weird choice.

> Ah, besides, I hooked up an oscilloscope to the VCAM_IO and I can see that the
> vreg really does react as expected upon setting the upper bits.. but since it
> still works without, we can safely ignore them, which makes us able to simplify
> the driver (as no custom code for that will be required) and, at the same time,
> avoid seeing a table of values repeated 4 times in a row.

That seems safer in general if we don't know what those bits are doing -
it could be some kind of mode control or something.

> ...so, the regulator will indeed shut itself off and clear either/both the QI_EN
> and/or its relative bit in the enable register... I've also just found hints of
> the latter (enable register being set to 0) downstream, so I'm sure that this is
> indeed right.

That's still not quite the same thing as a status bit, if the regulator
disables itself then it won't try to turn itself back on.  Note that the
core will fall back on using the enable state if there's no status op so
there's no need for this logic, you can just omit the status op and the
behaviour will be the same.

--3JjAka1nrbTHhQDM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKLj3MACgkQJNaLcl1U
h9DKVQf/UGKn8E+91K910/ff8+FvQzTWLerUNMOum06ibJb4I8BKQbcHMxBu0+X2
23dfHk88gYz0vd1WlsudGoJkMRZNsNOteA3QS38lEE37221ZUeBFMKV2kxkT19vf
/Q210UCz3dhF7XxwD23eWQXJDuTsMk9Z1t1wDVgLL3fqSGnLriIB/qybgOWKX5GT
/gggqqSwIcHYmoBf7sW8TsPdKCqVOGOp2Yw1cyZ0oYEtpv75uxAUSepDhFzZ7z0W
9jVXFzBhmLRl/CMAGBuFL9LQHARcQPAgnzH6KH0WG1ISkAvffqcttPQvZe9L59X4
yBnvUvGSs3ETgWrQCFkCA4WmsDwBeA==
=lRBO
-----END PGP SIGNATURE-----

--3JjAka1nrbTHhQDM--


--===============3044838328634485722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3044838328634485722==--

