Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56540C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoTscAzA2IOlF+4tCMMXwlKX11WpufxA3De2ZMmihJ4=; b=F9/N7TZljQewizher8LQSXZGU1
	Rjx2iURO7ntx6Ze1Nu5NndTxfnFtklCxjh1tSAPqti0wy3ohHk/c3tlRCPL2rx8lgh0Vs/Zwr4OII
	dGprZe8rStecvqT6Zu3IrYfDU75Z8f2HTc1zC1Zn4UW0KmyEBWdvj82cQDC4xleLCnyrZP/u4VZj8
	wCNqr8s4kZ6V5mq7WmF2mVJsunbuUsYCu9i0ObXswVN0ttXMcgmBB5OTeWifwJ755cE6crJOH3XHA
	sObCh9ls9eV8jJTYpOaYMYgUph0ERPHIP7T7lPJ+2rX/kBHa8rM8go+3E8Zquy8yNwwrrrxt8Et7z
	EUCaf70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDCX-00FPKX-2A;
	Mon, 18 Sep 2023 12:18:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDCU-00FPJo-2b
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 12:18:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0548461168;
	Mon, 18 Sep 2023 12:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1522FC433C8;
	Mon, 18 Sep 2023 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695039481;
	bh=m9DbiuYGQsroUWLQblr7CsaQDo+/wfuOspyhyKz0qyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixfkDgtCQsm1qsYVqsBxRnfw76vgvheO6lwjFgfn6yxbF1012FTJgSRtZNnZm9HtZ
	 4m5ZtvRHN9RGP1wKU7Hn1MXf24+TdVfzsIjeOTMTEExl9Fa0vOXItABeWuxQ9u24mi
	 agRFmL0GEnQFdbR/pseV8rfJPLy+NoUqV6ssEfWZKA3cFDIHctiWLHv7lhuJeJnFQE
	 FHIrFg4UOzp52+93c1JZGyVcgGxybgyuDCxzAZ/BliNVDAGeVu/Cvs1P3l4Ws+snKi
	 7j3hgHBSMatEGojj76inqNh04Xdsb+CgGVApVD6JS7+aPytlTNtmhPjNFSyYcmbkeZ
	 dEtHAChXA7kxQ==
Date: Mon, 18 Sep 2023 14:17:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name,
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com, horms@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 net-next 09/17] net: ethernet: mtk_wed: fix
 EXT_INT_STATUS_RX_FBUF definitions for MT7986 SoC
Message-ID: <ZQg/9ku0S+g5WF0O@lore-desk>
References: <cover.1695032290.git.lorenzo@kernel.org>
 <ebde071cc3cc9c35b00366c41912ee2f25e5282d.1695032291.git.lorenzo@kernel.org>
 <ZQg2AxAIxkadOiIr@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3XwjkoR69/2cL2MM"
Content-Disposition: inline
In-Reply-To: <ZQg2AxAIxkadOiIr@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_051802_934881_1FFAFDB5 
X-CRM114-Status: GOOD (  21.09  )
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


--3XwjkoR69/2cL2MM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Sep 18, 2023 at 12:29:11PM +0200, Lorenzo Bianconi wrote:
> > Fix MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH and
> > MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH definitions for MT7986 (MT7986 is
> > the only SoC to use them).
>=20
> Afaik this applies also to MT7981 which is very similar to MT7986.

ack, fine. Can you please test it out when you have some free cycles?
I do not have a MT7981 device for testing.

Regards,
Lorenzo

>=20
> >=20
> > Fixes: de84a090d99a ("net: ethernet: mtk_eth_wed: add wed support for m=
t7986 chipset")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_wed_regs.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net=
/ethernet/mediatek/mtk_wed_regs.h
> > index 47ea69feb3b2..f87ab9b8a590 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> > @@ -64,8 +64,8 @@ struct mtk_wdma_desc {
> >  #define MTK_WED_EXT_INT_STATUS_TKID_TITO_INVALID	BIT(4)
> >  #define MTK_WED_EXT_INT_STATUS_TX_FBUF_LO_TH		BIT(8)
> >  #define MTK_WED_EXT_INT_STATUS_TX_FBUF_HI_TH		BIT(9)
> > -#define MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH		BIT(12)
> > -#define MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH		BIT(13)
> > +#define MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH		BIT(10) /* wed v2 */
> > +#define MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH		BIT(11) /* wed v2 */
> >  #define MTK_WED_EXT_INT_STATUS_RX_DRV_R_RESP_ERR	BIT(16)
> >  #define MTK_WED_EXT_INT_STATUS_RX_DRV_W_RESP_ERR	BIT(17)
> >  #define MTK_WED_EXT_INT_STATUS_RX_DRV_COHERENT		BIT(18)
> > --=20
> > 2.41.0
> >=20
> >=20

--3XwjkoR69/2cL2MM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZQg/9QAKCRA6cBh0uS2t
rMYuAPwLlBwabmv9CBuoMVQSW6yos/0jwMwqx2hC30mstqMXugD/SkmJjYrTRWsA
7Wg219Zkui+ubUI3KZoNdXylN5X8FAw=
=C28k
-----END PGP SIGNATURE-----

--3XwjkoR69/2cL2MM--

