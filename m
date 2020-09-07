Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23676C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 17:52:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B67208C7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 17:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U44D2loB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v5Kb6di9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7B67208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rJ7c6o3fVgIdT9Un5v8yuxXBlT+k84px0YMnZKVhy1E=; b=U44D2loBNP1/2OXy13scDikNL
	iF8DLWL8XXOwH7WFW0mNqYtjKQKZ7gpu1OBIwYNzdQZMjqCQCVgVTiZ6bAXP2ovXLdsMrm3YRG+Po
	qlTgYxAiukxBdID+zt1kRop/uFk7mr2RONHuaAavetRFLHOH9B+meFOd9uGbjX47MdU2ra5R9jr9+
	p6f0sxs/5GSRrH9u6IdT4LuLCV6ra4ai9goEXUA7QOUo7lb3cFzuAccUcf+Yi7RyPFmG9qsjsVLQU
	phnJV9LcdIB/zh1/P1C7v5D5J4heAfgLMOvIw615gkHFxTDNcsoC/Yk/3wkD3Yng6Qj4WkLjpsUUY
	SxCbmroow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFLJ3-0005HN-1D; Mon, 07 Sep 2020 17:51:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFLIv-0005DO-5y; Mon, 07 Sep 2020 17:51:46 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47F3E2080A;
 Mon,  7 Sep 2020 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599501103;
 bh=YMxZ0LBQubRWUql8kN4D8NLNlVpvgs2xsR5mya0rxqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v5Kb6di9323FGcnbwasyBMt/IV3HEFuAzbUF+APrbb0SwX1Vz8+6BIvEfNG1YP0Sn
 4Yyl9nTx4dUPvO6OfOBYrJ1/CQ6/Pxtf7VpWZ80gfFV/2K0iRzWwK1P8y5E1vPxDz7
 L+SR/HeAepqOnh9a29zkFo5IyF4a3NjkhA+slzaE=
Date: Mon, 7 Sep 2020 18:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
Message-ID: <20200907175059.GD4907@sirena.org.uk>
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
 <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
 <20200819194005.GC38371@sirena.org.uk>
 <CA+Px+wWMH6iUzFq0g4BFC5qA993r9UBobmNAyS2ie+xDwci-yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wWMH6iUzFq0g4BFC5qA993r9UBobmNAyS2ie+xDwci-yg@mail.gmail.com>
X-Cookie: Elevators smell different to midgets.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_135145_378715_A90AD65D 
X-CRM114-Status: GOOD (  17.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5211680542889087717=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5211680542889087717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2020 at 09:37:12PM +0800, Tzung-Bi Shih wrote:
> On Thu, Aug 20, 2020 at 3:40 AM Mark Brown <broonie@kernel.org> wrote:

> > That's for binding the MFD subdevice to an OF node, you don't need to do
> > that for a device like this - you can just use the of_node of the parent
> > to get at the properties.

> There is an issue we overlooked.  In sound/soc/codecs/mt6359.c,

> After removing the line at (1), mt6359_parse_dt() cannot read the DT properties.

> Here are a few options we can come out with.
> 1. adds back the compatible string in the DTS
> 2. gets of_node of parent in mt6359.c, and iterates all children nodes
> to get the desired properties

Do this, but instead of iterating all the child nodes just look for the
named CODEC node that you define in the bindings if you don't want to
put the properties in the root MFD node.

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9WcwMACgkQJNaLcl1U
h9Dp0wf6A3eiem9QGqgDURjl9QoxRQnRXVafGmdx8S4QioV/mf+/xBOc7cNzYri6
keaJ0K+HFWRqk4GwYx4JhRYez80iQmT6TWszym6iv0bCB5UeGXXvhsxsnAm06eKi
FgsY9Wx48r9hxEvDr6S46HYR++HLQI2cg3krRvm6iyQ/jLc1tm1zGfRSOXYenfSJ
HuJydCwg8AUxd0o486d5K6v8md9EK7vtFqqNTEi2NLcfLNlXhR+7L8Ft5LfhvYDk
ScJydi1HAyayykul+n7w4r6ZlP8H5I9Ha7O7HTZMEmpWufiNAl4l+yn6vL2l73xX
77G/jtTLhxwpYEW45hLguvCN6asf/A==
=CY1J
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--


--===============5211680542889087717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5211680542889087717==--

