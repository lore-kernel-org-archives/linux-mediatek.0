Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA8F10A1E63
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7C/YJ3bH4vIrxytCLP5AZqS4GyFkVHBtGdzI0XhstE=; b=Cem4KQx88FAxvOQ3nj3zWSm9Rd
	Hu6bH+7pmj93YipRPXalkk1P0PryAJakg/+o6po2xW2KiSfqtcmZAMpfgAAhMhfscgqi+EGTsyx/W
	fD0/cIh1Jg5OwFEMvZGzdUvCpeF7m6/fX/YNb71IWmCa/K6/z/EueF+hgwKAijl/8wr4emC2xoOTl
	UD2819CZ1jracIbRF9O2BFMKQs77nKzp+aZv2j+lsZbNuLMQxyrD9ObOr65MO2CNTkqUdTPLcEzEd
	eZxziM/3+22BRzEOD9ZAbT0+g1us5a+26W+EZtHA0sDGmtXnyssA1E51TNpqkA0PL3gGQW8jfJXoV
	UpwlRDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pYa-000000062u5-01fJ;
	Thu, 26 Mar 2026 18:35:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pYX-000000062t5-1lav;
	Thu, 26 Mar 2026 18:35:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB2A3444B8;
	Thu, 26 Mar 2026 18:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E51EC116C6;
	Thu, 26 Mar 2026 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774550144;
	bh=s7C/YJ3bH4vIrxytCLP5AZqS4GyFkVHBtGdzI0XhstE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgqXfxZhmtLXcyBlNt8utRu6PZXVezS9rzQ0jAEWt0zfBcatzo+Hvddgxtgkq0C60
	 ZkKnfmtYsl7efB3JpANu5jOs0S8f9y1LS/7Yyxa+XKk7rxRwkjDYU8R11SjpcQ/cRj
	 Am+J0D6dZ9mgTU7uUGGDl+g3Jh+y7fDWKrN6rpieMfQSwXjuY7O/nCJBOrE4vbnnCE
	 Th5d3TOLYUDOduiTJsiU4BGcCDSUc8qLcrhjWUSBlE/eq3/tZFpq/sFOmjLynmXOmc
	 B2lqLg9Nj38tjQmnRG/ClozFZuWdYbpx1jfrAfCtm6ohDwt8EWa3HrpXenMLFYYugW
	 AGiqLjIoDmIRg==
Date: Thu, 26 Mar 2026 18:35:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: mt6315: Add regulator
 supplies
Message-ID: <20260326-laptop-smock-c028f709d6fc@spud>
References: <20260326081050.1115201-1-wenst@chromium.org>
 <20260326081050.1115201-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lFhfG7hb4m/dorJL"
Content-Disposition: inline
In-Reply-To: <20260326081050.1115201-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_113545_472614_5F99166D 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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


--lFhfG7hb4m/dorJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lFhfG7hb4m/dorJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacV8fAAKCRB4tDGHoIJi
0slGAQDMcXP9eQdwOuxSiXJm+WfUqeKNCujzmY37ft3YdB/vywEAw+ZQyth8/OoR
nidyq8Yjr30Vc+7aLWSu9aSfYzMGIAc=
=INcA
-----END PGP SIGNATURE-----

--lFhfG7hb4m/dorJL--

