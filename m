Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE7BC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L1R8lLe1gZIHjcMdHJGuHA0DLPqVHd/zex9GWPw2YM=; b=0/ll+/MZY6G6LssiSTjYc+zibQ
	pl6/jQkYWjcfLmi9DVf1sL9wul5y4cPHl3Y1q7Iodn7sJ9jMr8KmaRgvI1w0Ei6i6tFVeOo0MkBYb
	PhNjcddxgSCZyi0NsqZKqZ0EuhPGbAEnb7Qzwnl4Ye4oPX+oauKtSXr/WlbIZiXG8PHpGGd05VZQM
	1YYlvD4dyk5Vf67WbqEBBzAIeE5eWqh2vqBUVUvXVfp1qZpWAryJpiGtifbqjtL3fUvIgF0UI3Xhv
	UYicopAqs+zcW58ahZ4RkniBXiCcvkWe8+7wmJNmZKVNfNGK6bfrU/yulxPzsc16FbZYSylcH1gL7
	EgQByFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPru-007HVb-DM; Tue, 22 Nov 2022 09:47:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPrp-007HO5-O5
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 09:47:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 57465B8190B;
	Tue, 22 Nov 2022 09:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01D6C433D6;
	Tue, 22 Nov 2022 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669110419;
	bh=FRhndoOcferDeIuztrGP96RT7Ozf4cEJuLD549BxEBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8wBRVoXoLFM0Bdtanbdd1H4aj0MBq9HnKke7wOuFCjA+de3MNvhce2l7DNhiiZV+
	 BABDd9UYq8zPT7Jqxl56iGI+3JBelUaZzEf7UaTWFwVrqG4cFte07Ax+upMwop53jJ
	 qC+3BCEPp5I+3uWIR6EoEaNo03ejBpXHrU64Bh1KNhLJKzIRgYM5TOEuksgz5uHx6u
	 80zwwgk8/9K7wPWkrvxt/HjgzX+HEQMnrc/iOylk8wG9OYZAymX6HvwsSd3iWKuH3T
	 /mgDOSZD+QdZXmH9l1ljWGDFyeAntmlDejK/lwV+e6u0WXPJ5j0Ofm2ulZSLXA71yt
	 /tk7ZjA6yF4+Q==
Date: Tue, 22 Nov 2022 10:46:53 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <bo.jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH,RESEND] net: ethernet: mtk_wed: add wcid overwritten
 support for wed v1
Message-ID: <Y3yajX0EF/aU5HJr@localhost.localdomain>
References: <217932f091aa9d9cb5e876a2e958ca25f80f80b2.1668997816.git.sujuan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MyQooNMZNzUlLsws"
Content-Disposition: inline
In-Reply-To: <217932f091aa9d9cb5e876a2e958ca25f80f80b2.1668997816.git.sujuan.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_014702_110103_113EFE1E 
X-CRM114-Status: GOOD (  20.53  )
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


--MyQooNMZNzUlLsws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> All wed versions should enable wcid overwritten feature,
> since the wcid size is controlled by the wlan driver.
>=20
> Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Co-developed-by: Bo Jiao <bo.jiao@mediatek.com>
> Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c      | 9 ++++++---
>  drivers/net/ethernet/mediatek/mtk_wed_regs.h | 2 ++
>  include/linux/soc/mediatek/mtk_wed.h         | 3 +++
>  3 files changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethern=
et/mediatek/mtk_wed.c
> index 7d8842378c2b..a20093803e04 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -526,9 +526,9 @@ mtk_wed_dma_disable(struct mtk_wed_device *dev)
>  			MTK_WED_WPDMA_RX_D_RX_DRV_EN);
>  		wed_clr(dev, MTK_WED_WDMA_GLO_CFG,
>  			MTK_WED_WDMA_GLO_CFG_TX_DDONE_CHK);
> -
> -		mtk_wed_set_512_support(dev, false);
>  	}
> +
> +	mtk_wed_set_512_support(dev, false);
>  }
> =20
>  static void
> @@ -1290,9 +1290,10 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_=
mask)
>  		if (mtk_wed_rro_cfg(dev))
>  			return;
> =20
> -		mtk_wed_set_512_support(dev, dev->wlan.wcid_512);
>  	}
> =20
> +	mtk_wed_set_512_support(dev, dev->wlan.wcid_512);
> +
>  	mtk_wed_dma_enable(dev);
>  	dev->running =3D true;
>  }
> @@ -1338,6 +1339,8 @@ mtk_wed_attach(struct mtk_wed_device *dev)
>  	dev->irq =3D hw->irq;
>  	dev->wdma_idx =3D hw->index;
>  	dev->version =3D hw->version;
> +	if (hw->version !=3D 1)
> +		dev->rev_id =3D wed_r32(dev, MTK_WED_REV_ID);

nitpick: since rev_id is valid just for hw->version > 1 and it will be used=
 by
mt76 in the future, you can move it few lines below where we already check
hw->version and get rid of the unnecessary if condition. Something like:

	if (hw->version =3D=3D 1) {
		...
	} else {
		dev->rev_id =3D wed_r32(dev, MTK_WED_REV_ID);
		ret =3D mtk_wed_wo_init(hw);
	}

Regards,
Lorenzo
> =20
>  	if (hw->eth->dma_dev =3D=3D hw->eth->dev &&
>  	    of_dma_is_coherent(hw->eth->dev->of_node))
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net/e=
thernet/mediatek/mtk_wed_regs.h
> index 9e39dace95eb..873d50b9a6e6 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> @@ -20,6 +20,8 @@ struct mtk_wdma_desc {
>  	__le32 info;
>  } __packed __aligned(4);
> =20
> +#define MTK_WED_REV_ID					0x004
> +
>  #define MTK_WED_RESET					0x008
>  #define MTK_WED_RESET_TX_BM				BIT(0)
>  #define MTK_WED_RESET_TX_FREE_AGENT			BIT(4)
> diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/med=
iatek/mtk_wed.h
> index 8294978f4bca..1b1ef57609f7 100644
> --- a/include/linux/soc/mediatek/mtk_wed.h
> +++ b/include/linux/soc/mediatek/mtk_wed.h
> @@ -85,6 +85,9 @@ struct mtk_wed_device {
>  	int irq;
>  	u8 version;
> =20
> +	/* used by wlan driver */
> +	u32 rev_id;
> +
>  	struct mtk_wed_ring tx_ring[MTK_WED_TX_QUEUES];
>  	struct mtk_wed_ring rx_ring[MTK_WED_RX_QUEUES];
>  	struct mtk_wed_ring txfree_ring;
> --=20
> 2.18.0
>=20

--MyQooNMZNzUlLsws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY3yaigAKCRA6cBh0uS2t
rEr4AP9K5LW+TfRnHDcSOOOP+dKxO6PgQE0ugOWGTgAXgNlp1wEA/2aDm26mVuQz
kYSSHOserEgot90J1cmRQ3i0vhn8WAE=
=aXsx
-----END PGP SIGNATURE-----

--MyQooNMZNzUlLsws--

