Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CC6C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvz92mw5u/uPqURvQZPtQlsexkB/Un4oqnYboYNYc2k=; b=Yh1Ut/v6wSQW7LRun3fR1+e4Ym
	8LIq6zkZaThnbgRKHdPs1d3Vo/yPrTp7ey2B0IQ45ZR69qzLFFG7W3to61jYAjqURHjU+q8V4A/C+
	XjY9d/o9W3+Gm8kgzP+ulM1NVoNJE1vQKWBwb9/4weiqgE7lLzUql4R/WFHNuVSjgQZWJdclnmzsv
	3oSA3UL+gCm0Kw+krZ4ZdSgiVrJgH1geqPPJUjNNk9liaAK1sjbzQTgEY8bf8i55tqeA2FH4SpZGE
	zgnVXX0N4XcKqjPJUlMd3TBmkadxwbCRsILL5Co8mV24fUIqjcRa9+C+hA2bUdxeCJEK48w6SpoCk
	8IvBZ6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeSu-0019Pf-No; Thu, 03 Nov 2022 17:57:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeSr-0019OL-Aa
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 17:57:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4731861FAC;
	Thu,  3 Nov 2022 17:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FC9C433C1;
	Thu,  3 Nov 2022 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667498235;
	bh=epCxwcXuQo83AK3kK4fWvFDQ4y5LpONxVgcHjBSV7lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tl4HkpiEZpgIPUU/d6xsk4oz+mwoF+GPMzxh7x1P4w+Wkl4POcuB0DHBJGWdekkZd
	 GWwgm/+JvEfoq9edztarzU/pCH/j2m9cU3i6Vd1HKModcrsbXwU5TwaDgzXK+cO/1w
	 ifJ1EeIFoeTqbFGSpFEbYkBQeR567T8Sq3tsq7+Jrr5ps9cxZK2GZfRJsR7NImnLqm
	 jeoAovm2YC/VPlon+m6pTBJgiHY5BwvjLrw6mxHlOmpZC9kSYSTZ8FCpt9vLRrlWO1
	 Fe78eqMWAz10VzAxCiYqG9X/BtWf+wFviqb3qmIWL5YEZVbuvtk7+XEclMPCvNvKgP
	 ujBM1onujsV/A==
Date: Thu, 3 Nov 2022 18:57:11 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v3 net-next 3/8] net: ethernet: mtk_wed: introduce wed
 mcu support
Message-ID: <Y2QA989WNCTuqnDU@lore-desk>
References: <cover.1667466887.git.lorenzo@kernel.org>
 <01c82e3783373e04b609d60075ef7ecf71d0d24d.1667466887.git.lorenzo@kernel.org>
 <5248b495-710b-ad72-7813-869dc660cf31@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qxb2BrJNPvdY5tSy"
Content-Disposition: inline
In-Reply-To: <5248b495-710b-ad72-7813-869dc660cf31@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_105717_478259_88C16CAB 
X-CRM114-Status: GOOD (  30.65  )
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


--Qxb2BrJNPvdY5tSy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 03/11/22 10:28, Lorenzo Bianconi ha scritto:
> > From: Sujuan Chen <sujuan.chen@mediatek.com>
> >=20
> > Introduce WED mcu support used to configure WED WO chip.
> > This is a preliminary patch in order to add RX Wireless
> > Ethernet Dispatch available on MT7986 SoC.
> >=20
> > Tested-by: Daniel Golle <daniel@makrotopia.org>
> > Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > ---
> >   drivers/net/ethernet/mediatek/Makefile       |   2 +-
> >   drivers/net/ethernet/mediatek/mtk_wed_mcu.c  | 364 +++++++++++++++++++
> >   drivers/net/ethernet/mediatek/mtk_wed_regs.h |   1 +
> >   drivers/net/ethernet/mediatek/mtk_wed_wo.h   | 152 ++++++++
> >   include/linux/soc/mediatek/mtk_wed.h         |  29 ++
> >   5 files changed, 547 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> >   create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.h
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/Makefile b/drivers/net/ether=
net/mediatek/Makefile
> > index 45ba0970504a..d4bdefa77159 100644
> > --- a/drivers/net/ethernet/mediatek/Makefile
> > +++ b/drivers/net/ethernet/mediatek/Makefile
> > @@ -5,7 +5,7 @@
> >   obj-$(CONFIG_NET_MEDIATEK_SOC) +=3D mtk_eth.o
> >   mtk_eth-y :=3D mtk_eth_soc.o mtk_sgmii.o mtk_eth_path.o mtk_ppe.o mtk=
_ppe_debugfs.o mtk_ppe_offload.o
> > -mtk_eth-$(CONFIG_NET_MEDIATEK_SOC_WED) +=3D mtk_wed.o
> > +mtk_eth-$(CONFIG_NET_MEDIATEK_SOC_WED) +=3D mtk_wed.o mtk_wed_mcu.o
> >   ifdef CONFIG_DEBUG_FS
> >   mtk_eth-$(CONFIG_NET_MEDIATEK_SOC_WED) +=3D mtk_wed_debugfs.o
> >   endif
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/=
ethernet/mediatek/mtk_wed_mcu.c
> > new file mode 100644
> > index 000000000000..20987eecfb52
> > --- /dev/null
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
>=20
> ..snip..
>=20
> > +
> > +int mtk_wed_mcu_init(struct mtk_wed_wo *wo)
> > +{
> > +	u32 val;
> > +	int ret;
> > +
> > +	skb_queue_head_init(&wo->mcu.res_q);
> > +	init_waitqueue_head(&wo->mcu.wait);
> > +	mutex_init(&wo->mcu.mutex);
> > +
> > +	ret =3D mtk_wed_mcu_load_firmware(wo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	do {
> > +		/* get dummy cr */
> > +		val =3D wed_r32(wo->hw->wed_dev,
> > +			      MTK_WED_SCR0 + 4 * MTK_WED_DUMMY_CR_FWDL);
> > +	} while (val && !time_after(jiffies, jiffies + MTK_FW_DL_TIMEOUT));
>=20
> Here you can use readx_poll_timeout() instead: please do so.

ack, I will fix it in v4

>=20
> > +
> > +	return val ? -EBUSY : 0;
> > +}
> > +
> > +MODULE_FIRMWARE(MT7986_FIRMWARE_WO0);
> > +MODULE_FIRMWARE(MT7986_FIRMWARE_WO1);
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net=
/ethernet/mediatek/mtk_wed_regs.h
> > index e270fb336143..c940b3bb215b 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> > @@ -152,6 +152,7 @@ struct mtk_wdma_desc {
> >   #define MTK_WED_RING_RX(_n)				(0x400 + (_n) * 0x10)
> > +#define MTK_WED_SCR0					0x3c0
> >   #define MTK_WED_WPDMA_INT_TRIGGER			0x504
> >   #define MTK_WED_WPDMA_INT_TRIGGER_RX_DONE		BIT(1)
> >   #define MTK_WED_WPDMA_INT_TRIGGER_TX_DONE		GENMASK(5, 4)
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.h b/drivers/net/e=
thernet/mediatek/mtk_wed_wo.h
> > new file mode 100644
> > index 000000000000..2ef3ccdec5bf
> > --- /dev/null
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
> > @@ -0,0 +1,152 @@
>=20
>=20
> ..snip..
>=20
> > +
> > +#define MTK_WO_MCU_CFG_LS_BASE				0 /* XXX: 0x15194000 */
>=20
> Since that definition is zero, you can safely remove it: like so, the ones
> following will be a bit more readable.

(removing the XXX) this is a pattern already used in the driver and in mt76=
=2E I
would prefer to keep it as it is.

>=20
> > +#define MTK_WO_MCU_CFG_LS_HW_VER_ADDR			(MTK_WO_MCU_CFG_LS_BASE + 0x00=
0)
> > +#define MTK_WO_MCU_CFG_LS_FW_VER_ADDR			(MTK_WO_MCU_CFG_LS_BASE + 0x00=
4)
> > +#define MTK_WO_MCU_CFG_LS_CFG_DBG1_ADDR			(MTK_WO_MCU_CFG_LS_BASE + 0x=
00c)
> > +#define MTK_WO_MCU_CFG_LS_CFG_DBG2_ADDR			(MTK_WO_MCU_CFG_LS_BASE + 0x=
010)
> > +#define MTK_WO_MCU_CFG_LS_WF_MCCR_ADDR			(MTK_WO_MCU_CFG_LS_BASE + 0x0=
14)
> > +#define MTK_WO_MCU_CFG_LS_WF_MCCR_SET_ADDR		(MTK_WO_MCU_CFG_LS_BASE + =
0x018)
> > +#define MTK_WO_MCU_CFG_LS_WF_MCCR_CLR_ADDR		(MTK_WO_MCU_CFG_LS_BASE + =
0x01c)
> > +#define MTK_WO_MCU_CFG_LS_WF_MCU_CFG_WM_WA_ADDR		(MTK_WO_MCU_CFG_LS_BA=
SE + 0x050)
> > +#define MTK_WO_MCU_CFG_LS_WM_BOOT_ADDR_ADDR		(MTK_WO_MCU_CFG_LS_BASE +=
 0x060)
> > +#define MTK_WO_MCU_CFG_LS_WA_BOOT_ADDR_ADDR		(MTK_WO_MCU_CFG_LS_BASE +=
 0x064)
>=20
> ..snip..
>=20
> > +
> > +static inline int
> > +mtk_wed_mcu_check_msg(struct mtk_wed_wo *wo, struct sk_buff *skb)
> > +{
> > +	struct mtk_wed_mcu_hdr *hdr =3D (struct mtk_wed_mcu_hdr *)skb->data;
> > +
> > +	if (hdr->version)
>=20
> 	if (hdr->version || skb->len < sizeof(*hdr) || skb->len !=3D le16_to_cpu=
(hdr->length))
> 		return -EINVAL;

This is just a matter of test, I would prefer as it is.

>=20
>=20
> > +		return -EINVAL;
> > +
> > +	if (skb->len < sizeof(*hdr))
> > +		return -EINVAL;
> > +
> > +	if (skb->len !=3D le16_to_cpu(hdr->length))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
>=20
> Regards,
> Angelo
>=20

--Qxb2BrJNPvdY5tSy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2QA9wAKCRA6cBh0uS2t
rMhpAQDc9B6HxmY3gmPng0upEbDvspJB1OpZ+c0/aZdHHXsryAD/cIMRUWxDR5Qo
8lKx2gmO4kmxM2y2GoYPcoKMESn/7QE=
=Etms
-----END PGP SIGNATURE-----

--Qxb2BrJNPvdY5tSy--

