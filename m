Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDF6CF887B
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Oct 2024 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv3NO0IyZy/SDDp7dqTUD82xX5MvRgwk5b4TflH+qwY=; b=eoQ1JB5UsHcu47U1277jCBbQyQ
	aUsLbXKj3KVepNvkp50q1/kxeNFzU2Z1px2SCM/MvG4jdXKRHl0jZFHwXnRo0EFxLDYNJ7QnJu9ew
	2UDVf2QQVT6Rf6RbYQaeAMEhFL8G6ceb7aFNNv+wJkHmtmaz2wGa6vBrit1VRAhr5yZBGDIbfl4A7
	3vBdaG5F36PyHOucgPaI68uNwWkEwrZWeoW8No8iszWGGfz2rOx+F2flVnTiQ2VqDI7vFLS/vOG+V
	8BLEcT6vXs4jxjuvOu40mN76ZBOlBsyMo1sEELJJyg4KtizJIHFs6zCyn2VuzyyH708+MyLeaQztY
	wjFy0uIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx1zD-0000000FBom-3C7W;
	Sat, 05 Oct 2024 10:26:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx1xx-0000000FBgH-07Q7;
	Sat, 05 Oct 2024 10:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 869C05C53D0;
	Sat,  5 Oct 2024 10:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CF8C4CEC2;
	Sat,  5 Oct 2024 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728123887;
	bh=VSkUhuEZREzVaWXtWS+SMpiGA9jxfyNvXOGjetZNpPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzWxAMeQjIQtJyh4emAWIbjZEEYZdHkQcfbP54FNlXJbq69VeMRdHXKxrVkwzReiU
	 BLQSA9EEVJumWqxvLl98I5xuPfOG3j/zCoV/lWq20a+nyszvmQUfPAlBgh7XLq2sMD
	 6qoC/JCl8OMqmw215qP5eL2xKEAmhUaaT2AERVN7BWgXRytAi8Pozpnx8OqkKNErBM
	 YaniEHEIyQDGfsWYzRpjYeGeqg4UeeDPkmcvA7LtGRz0rC5tpeaF8NK/2jd1dnVQiw
	 RXLhXrePhAHq2p/mUIce7zPYpfpLvuykWQCJOIMjNqReg+5w7MdsOA7JZ4Sj7DGY4N
	 AmoTKaSBYkvWA==
Date: Sat, 5 Oct 2024 12:24:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix EGRESS_RATE_METER_EN_MASK
 definition
Message-ID: <ZwET7MzCGVoDjIqt@lore-desk>
References: <20241004-airoha-fixes-v1-1-2b7a01efc727@kernel.org>
 <e4574a97-8e34-49be-9ec6-bb787104e6db@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="In29TbajZU6IMjK1"
Content-Disposition: inline
In-Reply-To: <e4574a97-8e34-49be-9ec6-bb787104e6db@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_032449_183774_C64639BF 
X-CRM114-Status: GOOD (  23.29  )
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


--In29TbajZU6IMjK1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
>=20
> On 10/4/2024 2:51 PM, Lorenzo Bianconi wrote:
> > Fix typo in EGRESS_RATE_METER_EN_MASK mask definition. This bus was not
> > introducing any user visible problem.
> >=20
>=20
> I'm not sure I follow. This bit is used by airoha_qdma_init_qos which
> sets the REG_EGRESS_RATE_METER_CFG register?
>=20
> How does this not provide any user visible issues? It seems like an
> incorrect enable bit likely means that QOS is not enabled? I'm guessing
> bit 29 is reserved?

Hi Jacob,

even if we are setting EGRESS_RATE_METER_EN_MASK bit (with a wrong value) in
REG_EGRESS_RATE_METER_CFG register, egress QoS metering will not be support=
ed
yet since we are missing some other configuration (token bucket rate, token
bucket size. Airoha folks please correct me if I am wrong). This is why I do
not think it is important to backport this patch and I did not added any Fi=
xes
tag.
QoS hw ingress/egress metering is in my ToDo list. Here I have ported the b=
asic
qos configuration I found in the vendor sdk. I will add more info in the co=
mmit
log in v2. Sorry for the confusion.

Regards,
Lorenzo

>=20
> It would be good to understand why this is not considered a fix?  The
> offending commit is in the net branch already.
>=20
> > Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet sup=
port
> > for EN7581 SoC")
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/airoha_eth.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/e=
thernet/mediatek/airoha_eth.c
> > index 2e01abc70c170f32f4206b34e116b441c14c628e..a1cfdc146a41610a3a6b060=
bfdc6e1d9aad97d5d 100644
> > --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> > +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> > @@ -554,7 +554,7 @@
> >  #define FWD_DSCP_LOW_THR_MASK		GENMASK(17, 0)
> > =20
> >  #define REG_EGRESS_RATE_METER_CFG		0x100c
> > -#define EGRESS_RATE_METER_EN_MASK		BIT(29)
> > +#define EGRESS_RATE_METER_EN_MASK		BIT(31)
> >  #define EGRESS_RATE_METER_EQ_RATE_EN_MASK	BIT(17)
> >  #define EGRESS_RATE_METER_WINDOW_SZ_MASK	GENMASK(16, 12)
> >  #define EGRESS_RATE_METER_TIMESLICE_MASK	GENMASK(10, 0)
> >=20
> > ---
> > base-commit: c55ff46aeebed1704a9a6861777b799f15ce594d
> > change-id: 20241004-airoha-fixes-8aaa8177b234
> >=20
> > Best regards,
>=20

--In29TbajZU6IMjK1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZwET7AAKCRA6cBh0uS2t
rNNyAP9uDDos8SDJ2XegHnssVx4dyQpUj5EHw09nl48HbC9uQgD/fVCCfhSiR0ps
qxVMUSjlIMCF114O3DrDR89LdwBSgwg=
=TQox
-----END PGP SIGNATURE-----

--In29TbajZU6IMjK1--

