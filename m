Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4B7C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 19:40:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F18B7207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 19:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="spNJj2kl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ua92POSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F18B7207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SMgXGj0fZ7ODetSDxXxoiGYngHiGbazQdM7gqaktjz8=; b=spNJj2klwop9jNkkHs2LTW4g0
	8ruRxNqka5DrdnyC9CLTr8pdk56ZWxa4cqBaxS+Jcpy6fjLA47bwo0/wcCQ99bR5NNUofRDGK9Uh2
	Zoi6xB/g9RKIStep+8x9M576Zt48ehNDuj6rpA5KBf7CU/5jIOkrd10UyFgj/YcybyGT7chrnUy80
	5Cek+uej1vdMMdC45fTY761aZHYYnKUaY+ZaNJkLdCIl1K53/evd5NML/cYaF2W8F0NIrPUKRlLfb
	/KT+MwGgUyv7NICCUU0oWxO7m1TUjEuKkhMWiCCI3xT1A26AEVAn8zMWPRfyOXsmXg3ZRdbjwJNfo
	N3X3WOfnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Twx-0007iF-6H; Wed, 19 Aug 2020 19:40:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Tws-0007hF-Qe; Wed, 19 Aug 2020 19:40:39 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F545207BB;
 Wed, 19 Aug 2020 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597866038;
 bh=4AK5v821zy1PWvts/5ogFBjV+oVDZUgiOW/Z26HFexU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ua92POSnqY57JylYmFlW/zoes2kP0GYGQbu4I2NNqI7oKhrS+kId6nciud6UtU/53
 xxjtEqyOGHXub4q0MJZENkMJiLMST98/X3qRGgvZaSsOkDwX/+1iT3sCek7q/zCe9/
 6H3LuAli7CzlhN/nPXo39fhV7mSt1VLrJDKdV/2k=
Date: Wed, 19 Aug 2020 20:40:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
Message-ID: <20200819194005.GC38371@sirena.org.uk>
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
 <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
X-Cookie: Absence makes the heart grow frantic.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_154038_971032_03849BE5 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Type: multipart/mixed; boundary="===============8478474792349239729=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8478474792349239729==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2020 at 11:42:27PM +0800, Tzung-Bi Shih wrote:

> But I found struct mfd_cell also contains member .of_compatible.  What
> is the difference if we use compatible string (as is) for this device
> instead of falling back to use device name to match?

That's for binding the MFD subdevice to an OF node, you don't need to do
that for a device like this - you can just use the of_node of the parent
to get at the properties.

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl89gBUACgkQJNaLcl1U
h9D/+gf/Ux+96dRrUQezVV+5UF/r90Gm5dpzj3qN3D3o9ZNOhCUt2+i9Js4F/YDL
LL4dlrRI1Yg/CpFwunLwTiy3q2xYqUIFODQq/u2fkSDyejrXkt6R3NqxlaG5Jc0K
EpOxKm07grdw9WOWls6UmbeJLTL8jHp2KWUqGL5t2KiVLPAaxXvCOzI5MugAp3W1
B80S4jndViv3IEGEgKqvuS8PxVxmXuNe1gVH6arMvmDmK2NQWEIpit4dpWiuT7UY
EbAJsnABzE8jasbBRLHt5F7VRdU004CyjtsoZswk9b+otbSwvW82CRUQ8oD7t83+
VQcrX/wlkN3yNdkNF4CwrbBmV9d7sA==
=eiwO
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--


--===============8478474792349239729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8478474792349239729==--

