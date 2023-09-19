Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE887CD54B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgkEHzS1P2+GGnG5W33Ph4ysUqmd/eb2iIGx9omjpvw=; b=IXMV7KQZn1wFzDdzjgBG7JQfaO
	qy1Dz/frMnKwgvx71CRepGlYsjIjJoTr1ebAbMS6sfNgZSZ7eyw7pWOMbmzJICBM6Pjtcoo84yblI
	PNMrk5UN1ulwo5FsPVRbn9Xb+POoEJ1rldQVULnOGPAupMii4s5Bizdg9bnVcCTTdV2DV69Q0XvFw
	6+7OdZkuKcygsVvz7q6/yB+/7LoFW90Em+IB0QmviF3tLTPu5rjQvsVtjwLc60LLhNrgWxpCzGfno
	idR/Cy6/79R/c8qXh19SiQwbEBqK3VxQp4VKuKYYkBS2XrLtICy2mWG2uRrMZUIb4ojbDNezDGS+5
	SbtnTePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYQM-000BqO-2A;
	Tue, 19 Sep 2023 10:57:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYQI-000Bmm-1t;
	Tue, 19 Sep 2023 10:57:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 188E8615F2;
	Tue, 19 Sep 2023 10:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2E4C433C7;
	Tue, 19 Sep 2023 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695121061;
	bh=rgkEHzS1P2+GGnG5W33Ph4ysUqmd/eb2iIGx9omjpvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xhbn8JD6cfQMx8xR+PU3g5QAAmLNxJv3xNP1Ho+oV8lXgW6zWTw3qXvcARVgU7Wfr
	 sUNZYHdnYNdWFNVcUx+jVb0TJ9Iw1SgJacseBhE5q1nHoaraprg8K7+tigNTIGYnm3
	 g4Hey3mLWEVrl7BkCXJkFr9uy/7BNIrkGkYBIMXh9L1vP4PaFA7BPfjTrG8ckoEDdT
	 keWQxOVG8bHvqB7wSgv1q3uvtrjuRZId3hzoCrxUVYmnVKao3DQuQaieLBW6ZwCohm
	 Jej6EoiX+OfNKq8SrqZtONz2suiXBG17mnbkkNuyljP+F2pD6vMQ/ZiNRWIphxD7/e
	 V714Ep4Kg7rsQ==
Date: Tue, 19 Sep 2023 11:57:35 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
	u.kleine-koenig@pengutronix.de, linqiheng@huawei.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org
Subject: Re: [PATCH 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
Message-ID: <20230919-6c70a74fa46fa4b298764ce4@fedora>
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
 <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VPROubqw5lKdslhi"
Content-Disposition: inline
In-Reply-To: <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_035742_686561_C1377494 
X-CRM114-Status: GOOD (  10.44  )
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


--VPROubqw5lKdslhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 11:59:37AM +0200, AngeloGioacchino Del Regno wrote:
> The MDP3 RDMA needs to communicate with the SCP remote processor: allow
> specifying a phandle to a SCP core.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--VPROubqw5lKdslhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQl+nAAKCRB4tDGHoIJi
0vTHAPkB522lK8X8euYhusx64TpJF2vQQOJR1RjAvmbcREUgFwEAh7u7X/ovyasV
iE0cp6ttCXGMYAnwPH4WEyu7sYGokws=
=xseb
-----END PGP SIGNATURE-----

--VPROubqw5lKdslhi--

