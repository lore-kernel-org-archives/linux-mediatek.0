Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110A7ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95p6AP3sUT/dASIGWwdGLj3incOhvOUM3cSIPAoJ4oQ=; b=UKMw2IviVVL7Rw+WqH63MK4n51
	zlZ9Xz63qbsf/pyvhLUgRDJtxfTwJzQNXQ/BiveXlMMJzyxCEso5+mNGqDcV8n4tvlci2VFYJeCcG
	u1BABp0tywdIfHNjJwYLx8svN0kAdP8SShJ1lNBRf+e3wSwB9wfQTrfpay1QCJeq6RLgWAb6ycNyB
	eGcWvQtr3vfHV+Hec26uato6jB0bhylDCc3ucI31pAaAQM/Mg1TtDFWNXFqoYdlzma5VZWf5XEiBs
	p7oZ1tU1eEOfU4TtNs03oLGe8m1vDgf5ZxR1tpaa3jHhPAhlKOTOGiaSaDt38Q1g3NmMxlQa+Y9Gh
	6DofPg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlqX-003BsX-1q; Fri, 09 Sep 2022 21:47:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlqU-003Brf-4d
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 21:47:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D308CB82628;
	Fri,  9 Sep 2022 21:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04275C433D7;
	Fri,  9 Sep 2022 21:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662760046;
	bh=Ax/uvAY03/zgpeUKLhwstiXZ3hgfRZwfa9av35aAHXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwoSfo3Bd9xYfIGwgcbVQjmaS1OKWhafPVU2M5E3uQ3xVQnIxtPJSRfMy5XpdEsuB
	 YbuN3yYoFTM9yEEHtcY+gRDAPEN//SxS4FIOh0MBzinNjwPwwSgKih9xdJxRNeECHU
	 wNeY1+eyKj8axBJi8t9g8ewh/rBfEga7G4OYFnW7aDAjnQOFzqLOrmk2zbeE7woStX
	 fHYoPmUCtIZloQhFL3zay3IzE879R+qTC1LGkxr00/m4g2Kuyt29Q1evNWrDBU/bsZ
	 7mvrTZddtXkcbpevydhkCPRCQH1Rx+7GjE0PxvMfPM5wMSVq2BZKnfVXAG+h85pBgG
	 k7IU9aU1+X8FA==
Date: Fri, 9 Sep 2022 23:47:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next 08/12] net: ethernet: mtk_eth_soc: add foe info
 in mtk_soc_data structure
Message-ID: <Yxu0aoBcCirDkm9j@lore-desk>
References: <cover.1662661555.git.lorenzo@kernel.org>
 <0d0bfa99e313c0b00bf75f943f58b6fe552ed004.1662661555.git.lorenzo@kernel.org>
 <YxuL45OghfKVGTrM@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o/fDb3p0UsNpkYZx"
Content-Disposition: inline
In-Reply-To: <YxuL45OghfKVGTrM@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_144730_497313_80CB2AE9 
X-CRM114-Status: GOOD (  19.01  )
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


--o/fDb3p0UsNpkYZx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Sep 08, 2022 at 09:33:42PM +0200, Lorenzo Bianconi wrote:
> > Introduce foe struct in mtk_soc_data as a container for foe table chip
> > related definitions.
> > This is a preliminary patch to enable mt7986 wed support.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  70 +++++++-
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  27 ++-
> >  drivers/net/ethernet/mediatek/mtk_ppe.c       | 161 ++++++++++--------
> >  drivers/net/ethernet/mediatek/mtk_ppe.h       |  29 ++--
> >  .../net/ethernet/mediatek/mtk_ppe_offload.c   |  34 ++--
> >  5 files changed, 208 insertions(+), 113 deletions(-)
> >=20
> > [...]
> > diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethe=
rnet/mediatek/mtk_ppe.h
> > index 6d4c91acd1a5..a364f45edf38 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_ppe.h
> > +++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
> > @@ -61,6 +61,8 @@ enum {
> >  #define MTK_FOE_VLAN2_WINFO_WCID	GENMASK(13, 6)
> >  #define MTK_FOE_VLAN2_WINFO_RING	GENMASK(15, 14)
> > =20
> > +#define MTK_FIELD_PREP(mask, val)	(((typeof(mask))(val) << __bf_shf(ma=
sk)) & (mask))
> > +#define MTK_FIELD_GET(mask, val)	((typeof(mask))(((val) & (mask)) >> _=
_bf_shf(mask)))
>=20
> This seems to trigger a compiler bug on ARMv7 (e.g. MT7623) builds:
>=20
>   LD      .tmp_vmlinux.kallsyms1
> arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o=
: in function `mtk_flow_entry_match':
> /usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-m=
ediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:406: u=
ndefined reference to `__ffsdi2'
> arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o=
: in function `__mtk_foe_entry_commit':
> /usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-m=
ediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:533: u=
ndefined reference to `__ffsdi2'
> arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o=
: in function `mtk_foe_entry_l2':
> /usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-m=
ediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:134: u=
ndefined reference to `__ffsdi2'
> arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o=
: in function `mtk_foe_entry_commit_subflow':
> /usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-m=
ediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:611: u=
ndefined reference to `__ffsdi2'
> arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o=
: in function `mtk_foe_entry_ib2':
> /usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-m=
ediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:148: u=
ndefined reference to `__ffsdi2'
> arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o=
:/usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-me=
diatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:169: mo=
re undefined references to `__ffsdi2' follow

Hi Daniel,

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
>=20
> >  enum {
> >  	MTK_FOE_STATE_INVALID,
> >  	MTK_FOE_STATE_UNBIND,

--o/fDb3p0UsNpkYZx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYxu0agAKCRA6cBh0uS2t
rIASAQC4DrW2Z2WRfMzAKwO9ZVvP2jDgt/p3kM30a/xV699wywEA9xq3pzx4TYa7
H2xGS3bd8wdUqwiGkljU0zhYoWxG5Qg=
=WiH2
-----END PGP SIGNATURE-----

--o/fDb3p0UsNpkYZx--

