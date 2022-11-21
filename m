Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1677C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o61Un1Dqr7UGsTPMLU61cECYFWLbsISHyaBM2/B/cJg=; b=GcFoidjak2H9mEZnk+mFhd7Fjq
	zPq0TY7DSygo5hhWSZhEk5kRupsarL823NTHszkf5n1mQVfZWaS7sBj6rCtVLYkVHum7wi40BINCw
	dfTRh5EcBtMw9ycHDbMkPdkMfD9tPWKQgVGtLwgqk0yNxTd6Nv5z2OvtMeHAMN30ROfLydGlN3irN
	q+tWNzcQJSJKoNGVLpMHOHByy9wJ3psUlYZxXNRSGLGdikAjPEk84U6JI22ZZ2Nj4/VtutAvTTvmo
	Avbdl6oaaje3Ef21emXYsfWF9n/Yl5X2GrZ/Pe+a+dA4VOty41iqZPW0oIzk9Uy6aw9M4GETaDDPL
	vKONx4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxEBg-000M2Q-Ut; Mon, 21 Nov 2022 21:18:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxEBe-000M1v-9M
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 21:18:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A04DFB81626;
	Mon, 21 Nov 2022 21:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36AFC433C1;
	Mon, 21 Nov 2022 21:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669065517;
	bh=ufuqDz0rB+Qolz1CiCkr1MwuVFrxFpuXYO353eidAv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsCXeNbLUFLTIuhPJhK/SfXaGIfinPY3OyT5AkJU8h+JXg0oR4T2xJj1OF29Et2bA
	 S1kqcTRoQHgHqP52bZtPh2WnP1XkXiTmBk//jCf3KWCwIBowO2x95XJRP4hs2eoCoe
	 oCo9SupElFDr2WQm3rlGTOwCRxqRWfFkSKIw5kK/iTjMPbYqiL/1FoSgwc1EEtk7wr
	 8DNXfoPUUM0/+ddPpjXDF4HxghHYQzDfPoW4udUCtHFk1TqFmpZRBTTjAQ4l8BEror
	 hp2Olu7IhfpNJ7IT9e6QmZGu0Bm0WfWDLSnn5QiuzKZ1R2yV1rudD8NsR2Qmod3BkT
	 gIyI3zWEG9oSw==
Date: Mon, 21 Nov 2022 22:18:33 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	lorenzo.bianconi@redhat.com, sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/5] net: ethernet: mtk_wed: add reset to
 tx_ring_setup callback
Message-ID: <Y3vrKcqlmxksq1rC@lore-desk>
References: <cover.1669020847.git.lorenzo@kernel.org>
 <9c4dded2b7a35a8e44b255a74e776a703359797b.1669020847.git.lorenzo@kernel.org>
 <20221121121718.4cc2afe5@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+pfbH8gjKuM0iZEF"
Content-Disposition: inline
In-Reply-To: <20221121121718.4cc2afe5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_131842_494591_7CF9F1E8 
X-CRM114-Status: GOOD (  12.39  )
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


--+pfbH8gjKuM0iZEF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 21 Nov 2022 09:59:25 +0100 Lorenzo Bianconi wrote:
> > +#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs, _reset) \
> > +	(_dev)->ops->tx_ring_setup(_dev, _ring, _regs, _reset)
>=20
> FWIW I find the "op macros" quite painful when trying to read a driver
> I'm not familiar with. stmmac does this, too. Just letting you know,
> it is what it is.

ack, fine. I maintained the approach currently used in the driver.
Do you prefer to run the function pointer directly?

Regards,
Lorenzo

--+pfbH8gjKuM0iZEF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY3vrKQAKCRA6cBh0uS2t
rDBsAQDDnwwLlP2N+Db3WFKNt4X7ol+xmnZ/w0PJ3DlvcSr5tQEAxK9J5aaWbD2U
kR3yP8VXnxSaP+M9qHBf6jfelwfymwQ=
=cwY6
-----END PGP SIGNATURE-----

--+pfbH8gjKuM0iZEF--

