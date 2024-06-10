Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B194C27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6WzIULq9+fnQYcQS1bKOAdon3jwK1WH/CKRPxb9Dg0=; b=RGtJsSp8riX7yhPd8H2lijJ39y
	ICup+Ph1x62l/tc4eC+a8qaHxnmYM09kx9l/vTixPKBy/SKWmLJHrO5VZzWboDZWjo/BSBWkyXiMR
	MQrAjQR7eLPxK6hwkEevUd3/kedfY0GXnqipCt2MYAVHQtGYtV+O7Om1VQ7r5p0WGI1sOnTYkW3jW
	XiA1FbVkE6KspghXQxpBdDjZOTPRPpIUSb6qBxgFc+yceGfr4wzdEL8GhHjDwqfcL6/zjtU1oPfdC
	m/ptReONxtNE0M6GtgtHIqDdEhSg4GWnfrjOnPmQ+/QeVLljehJeH3jRs9wP2E0BnyVx9OGmExpmg
	GKUz/EYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhkW-00000005kkc-0zoH;
	Mon, 10 Jun 2024 16:20:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhkR-00000005kg6-25cB;
	Mon, 10 Jun 2024 16:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BDE60CE16C2;
	Mon, 10 Jun 2024 16:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7CBC2BBFC;
	Mon, 10 Jun 2024 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718036389;
	bh=R6WzIULq9+fnQYcQS1bKOAdon3jwK1WH/CKRPxb9Dg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcUCHTx2EYJ/GmvexbgWlXn/OfbnPQSqd7Ez4p3BHSxY17Zysbn59If0ApIbKoL8X
	 dfuMWERYIYCSIfs9Y+5D9NXh8Sa+ovgFSVd9ZWe4w/HdTpVWeyQoVkGuQvskYmi03w
	 jRS1wiQ9jpbd+YasQZ7/8IzhTbbgL7ycFng863AT5ChQnNdvVgh2USaFXEwAStnpQi
	 pEErYLW8kKB8/VnkteCKuf9zsk4OVBNTXYvcRLZV91t52Tf9jUbpww3YL4ojm82zD7
	 N7RLatbkOjGPMs/W4md3UjI8PPNu4xVmmMB4fOXqzamMy7L8+CTP029x76g2W8c2I2
	 ubSRFZdU3vO6A==
Date: Mon, 10 Jun 2024 17:19:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240610-eligibly-gainfully-7b1caad07aaa@spud>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
 <20240607144154.GD18479@pendragon.ideasonboard.com>
 <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
 <20240610085424.GH26663@pendragon.ideasonboard.com>
 <e9a44b0b-1930-42fa-ab5e-a7eac1470041@linaro.org>
 <20240610-roping-ninja-56074ad61f77@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="krd0kZavuSZAemTC"
Content-Disposition: inline
In-Reply-To: <20240610-roping-ninja-56074ad61f77@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_091955_904232_4E9B5B0F 
X-CRM114-Status: GOOD (  22.79  )
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


--krd0kZavuSZAemTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 05:10:51PM +0100, Conor Dooley wrote:
> On Mon, Jun 10, 2024 at 12:18:12PM +0200, Krzysztof Kozlowski wrote:
> > On 10/06/2024 10:54, Laurent Pinchart wrote:
> > >>
> > >>> There's also the camsv IP in the same series that needs a generic n=
ame.
> > >>> I really don't know what to propose for it. Could you recommend
> > >>> something that would make you happy ?
> > >>
> > >> Sorry,that's almost half year old thread. Not present in my inbox.
> > >=20
> > > I remember someone presenting a talk titled "Beginner Linux kernel
> > > maintainer's toolbox" in Prague last year. The talk mentioned a tool
> > > call b4. I highly recommend it ;-)
> >=20
> > Wouldn't solve it. I would need to download the thread and import to
> > mailbox (several clicks needed) or open in some other tool just to see
> > the email. Or find it on lore.kernel.org - anyway just not convenient.
>=20
> Apparently you can use b4 from within mutt to populate threads, but I am
> yet to figure out if it works with non-local maildirs:
> https://b4.docs.kernel.org/en/latest/maintainer/mbox.html#using-with-mutt

That should read "how to make it work", I know it doesn't work like
documented there with non-local mailboxes.



--krd0kZavuSZAemTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcnoAAKCRB4tDGHoIJi
0qtrAP9YPh0+sV/kjtNmXMwP7T5usLhhX5vZzAjPc0mwr5965wD/Wx7GB6CXgeXI
q3vmSBs2jnhda3KzpGbgmbxGrNjp0Qw=
=HyAB
-----END PGP SIGNATURE-----

--krd0kZavuSZAemTC--

