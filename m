Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E4C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLSfBGJOhDDBBfSRc7QnU1NHs6omSrkAr1c3JfB3Yec=; b=XSxYQsv5S5TCnP3VGCvvBzXz9Y
	BLqw+/5W+Z8W16sh6PnI80h0GGzrbcgslEuUrlzK9JbvkPUOTfPqbbtXR2Cq/kUkLOUm11jUIyEpq
	h6LtwhcLtBdrM7Wz8iMhHv3wiaaIsKFRcQ5OHHBOYT1g1S5OZTf+17iHFLceWUj0eSa8Bt+Lid7ma
	PYTWJD4i1XnIAmRofgb404sScK9t5aV3HDveO+xY3sAKWS2UQwpjzqcdT21CmJvMv6m+RKgJApJVR
	fUi88hnZejaw/Cgcas/qhoHjb4l6a8j+a2B5Z4lTPwPSaepNgQQjFh0d2yTzkSCcDF+dA7ABO3yKD
	fJalPB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn00E-006hbn-06;
	Thu, 13 Apr 2023 16:40:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn00A-006hai-2Y;
	Thu, 13 Apr 2023 16:40:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC63B63FDC;
	Thu, 13 Apr 2023 16:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA0FC433EF;
	Thu, 13 Apr 2023 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681404049;
	bh=hLSfBGJOhDDBBfSRc7QnU1NHs6omSrkAr1c3JfB3Yec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8ELSuF9coQ6IgQt1yVjcJg4YVkrZn6LGF61SF5zXO8ZrFvF8Ljsg3ExIlZfYh9x5
	 qA48s+ImFXLAev8lYT6DBkCO2iilWczgs4QzZXIa9m+9SBJ0m0aUeTktB/VU33bSIQ
	 Ask+EWp2C5BDMasul3Xdaw6tRiSGFBCbUq0yORd7QquZeNY3Bf/8fb+LVWNxcKfKYe
	 nlqJkbyiI+eg1N6w6QmPkduqBpTMTeVRct3tyk41VWM6E+e/ofDoNDTeo7inKReTh7
	 ATXhpVHAUFWg70YYUkkAGq30JmY5gZlvCNOKvgjiqinDRYLvgMWmPM3ShUnsM4ruGY
	 sLyPDaSgh2Now==
Date: Thu, 13 Apr 2023 18:40:45 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981
 SoC
Message-ID: <ZDgwjS3GHdPhEWrJ@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z8Cihzoqi6i2kfv4"
Content-Disposition: inline
In-Reply-To: <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_094050_893716_1CFB5F2F 
X-CRM114-Status: GOOD (  12.17  )
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


--Z8Cihzoqi6i2kfv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 05:19:21PM +0100, Daniel Golle wrote:
> Add compatible string for the I2C controllers found in the MediaTek
> MT7981 SoC.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Applied to for-next, thanks!


--Z8Cihzoqi6i2kfv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4MI0ACgkQFA3kzBSg
KbauHQ//ScKeF3PqVVWjcNRmvwyH0OO/JEWpJ3MPIIJb+BorrmjEYS9dTweuR1bX
dLldsjFdMy0RZ7G4B/MtqhSsco3zG7eAqtBLbTbCX/J8ogD/ieWsx9Jin8Gi1si+
d0zvwaEpZVNur+XsFeEV5RhI5no6RWctYgnGG5GTsX39tDCqkJeZ8vKlA8OMVAZ1
1t9DTocRj+Ztblk0AFJ1pKdpeuKZABXF4bVjLurgKbd2Z4s5Pm72+UMMsBX1Glbx
EMlHEfx7TyvMbdwnJWPpUzomZrC6W+NuS/qda0XEov/w17rKnuBjUk3ujaPeWMsj
dr5FTLh+bpWxhhI3uojhWuSbqJfEnTboEJG2Db72Xrse/Xzrk+eKY/jhl6sGhg53
BjZ5xh6cqRJrB2xDL64WwbdR/BAvhG61Gk1WhoSex/1yatkwvenZDOsilJlKi+P8
IXdMzYMC0xbLOWxvV8GiL6RafVJbwOB7f/Hk6ceaISiTlWlNpkGRbkxr0SIEaKjR
xIm+Rogqk6dSXq0w//O+mTUgKUg62h/mtDklnn4FQYWEa9Hb6dKp7BPdrwbAZJx0
TD15QzkRPnCnjk/Pz8IxrKNvrhpzBUn7QNblODwImNqfEhKe4COywvBBaE0jMAqp
xwwR5MUXqUc9xSlsN/E9HfoBaOiPpCZUKgVE7EB7l5/ik0+3VrQ=
=p8Zt
-----END PGP SIGNATURE-----

--Z8Cihzoqi6i2kfv4--

