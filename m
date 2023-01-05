Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39DFC53210
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 23:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2S+YHARGxS/lPYmF+XRfEIryEQaGpt1m6vPT39p8Q+k=; b=rV48rPlHBHKbZljLPpgjeT1+Kl
	qXDPKQU2mvvepGeMgYZqx6iaafL+eDlA1nXTqYQadasN9RrsgWw36Yp06Yic35Sn1+QTQBi8Pg+W/
	/JH74cQowKi2NJ5QHmc0POn21Q82cew5USIAq2DMCSmMfIw/ueFfU85ABrO+4bEds3XV6YqApIJm7
	ByGEV+KmQudMXJ79U5VOcLJg65Stgc+bZ27QBM9y6PF1MvekGkmBuGrmrPN/9rZ9W9S/Hk78RiFR5
	N3lsjwt3mGMeaz3AWr/xht/Od96BYhyiZbUGNAMqJROjh8ZmkkwPFoqgYezmYVuD4iRkLt0x4jc7k
	ERz8kXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZEp-00FtcD-Pr; Thu, 05 Jan 2023 23:01:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVRX-00Du1x-4a
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2S+YHARGxS/lPYmF+XRfEIryEQaGpt1m6vPT39p8Q+k=; b=POtD06I/wRlNESYOAD5EGxSeek
	zJ5rRIx6jyKdSdw6PEnQRoTsz09i+HsgCg/W1GAzkf9/UUGnsJSnB5rje8R3wR2OWylvAtkLAwFbZ
	zmGLXr2pMtGzUbPC6Vq9vhLgY+rWUMSWOa5t2wASxYAiq5j1oVBXGnyFaqxLgjj0Vh1Oj2FSFS4Fw
	ZnReXwOzbeo/WpEX8PgXC204G3AUvjFwpsR7wRP+8TYuV2BCvQbuhUldvs6VuhhhffTGGRk5J3qFY
	qWWIQzODwWwDutRYeZVe2yPb7L7gWlqZyefUouGNuBwmqHI5mAU3WCWZcCj1Opm+PAwnN2LXpctAG
	mXA94Jkw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDPEv-001JDr-0a
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 12:21:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D85F0619F3;
	Thu,  5 Jan 2023 12:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA8FC433EF;
	Thu,  5 Jan 2023 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672921257;
	bh=juxFBCgvEME4z/TbdrM7n4SUdXzlYdWndiMH3p2yjwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOF4rvPzqICje2OAHhjX0BWdZCWMbvwykVOsHzs+FkENgUR5gjAQWAOalr8LP5dmI
	 6cPi0maWpuxIthwRwTqzrFnaJztN3/9ac5uAyYqUmROijWCIbjwPGZzToSTiX/tyUi
	 nyxzaAX5UkaGPlCNVLdSuh7z/nd46fEIhsPPXnB29KWlNRcug0kKBWuCI93gl+EZNP
	 34nnLezX9AeKyx5YjZPkuJXzC8OyCJj1ihPjw3wiqREbLa2sypjppYZBGZaZb5qdLV
	 nEueDRHzrz52VPmoMbvZLc0USoeXpyoCoZmc0Z3rMJDi2icqzDTZTULVriAbjFQ281
	 4lYaL+jcHbkjw==
Date: Thu, 5 Jan 2023 13:20:53 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Ryder Lee <ryder.Lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] wifi: mt76: mt7915: wed: enable red per-band token
 drop
Message-ID: <Y7bApSqBT2LXdBhu@lore-desk>
References: <20230105114711.31430-1-chui-hao.chiu@mediatek.com>
 <20230105114711.31430-2-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmQD/Wz6P1yDMR6h"
Content-Disposition: inline
In-Reply-To: <20230105114711.31430-2-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_122057_508499_8BC4C423 
X-CRM114-Status: GOOD (  22.13  )
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


--nmQD/Wz6P1yDMR6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Enable RED to limit the number of token used by each band. If single band
> uses too many tokens, it would hurt the throughput of the other bands.The
> software path can solve this problem by AQL so enable RED for HW path onl=
y.
>=20
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 54 ++++++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
>  3 files changed, 54 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index f1e942b9a887..855a434ecf54 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1171,6 +1171,7 @@ enum {
>  	MCU_EXT_CMD_GET_MIB_INFO =3D 0x5a,
>  	MCU_EXT_CMD_TXDPD_CAL =3D 0x60,
>  	MCU_EXT_CMD_CAL_CACHE =3D 0x67,
> +	MCU_EXT_CMD_RED_ENABLE =3D 0x68,
>  	MCU_EXT_CMD_SET_RADAR_TH =3D 0x7c,
>  	MCU_EXT_CMD_SET_RDD_PATTERN =3D 0x7d,
>  	MCU_EXT_CMD_MWDS_SUPPORT =3D 0x80,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 37a3c1f082d9..a7bc2043a0db 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -2291,6 +2291,57 @@ mt7915_mcu_init_rx_airtime(struct mt7915_dev *dev)
>  				 sizeof(req), true);
>  }
> =20
> +static int mt7915_red_set_watermark(struct mt7915_dev *dev)
> +{
> +#define RED_GLOBAL_TOKEN_WATERMARK 2
> +	u16 nbuf =3D dev->mt76.mmio.wed.wlan.nbuf;

I do not think this patch compile if CONFIG_NET_MEDIATEK_SOC_WED is not ena=
bled

> +	struct {
> +		__le32 args[3];

please remove blank lines.

> +
> +		u8 cmd;
> +		u8 version;
> +		u8 __rsv1[4];
> +		u16 len;

I guess it should be __le16 here

> +
> +		__le16 high_mark;
> +		__le16 low_mark;
> +		u8 __rsv2[12];
> +	} __packed req =3D {
> +		.args[0] =3D cpu_to_le32(MCU_WA_PARAM_RED_SETTING),
> +		.cmd =3D RED_GLOBAL_TOKEN_WATERMARK,
> +		.len =3D cpu_to_le16(sizeof(req) - sizeof(req.args)),
> +
> +		.high_mark =3D cpu_to_le16(nbuf - 256),
> +		.low_mark =3D cpu_to_le16(nbuf - 256 - 1536),
> +	};
> +
> +	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_PARAM_CMD(SET), &req,
> +				 sizeof(req), false);
> +}
> +
> +int mt7915_mcu_set_red(struct mt7915_dev *dev, bool enabled)
> +{
> +#define RED_DISABLE		0
> +#define RED_BY_WA_ENABLE	2
> +	int ret;
> +	u32 red_type =3D enabled ? RED_BY_WA_ENABLE : RED_DISABLE;
> +	__le32 req =3D cpu_to_le32(red_type);
> +
> +	if (enabled) {
> +		ret =3D mt7915_red_set_watermark(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret =3D mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RED_ENABLE), &req,
> +				sizeof(req), false);
> +	if (ret < 0)
> +		return ret;
> +
> +	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
> +				 MCU_WA_PARAM_RED, enabled, 0);
> +}
> +
>  int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
>  {
>  	int ret;
> @@ -2339,8 +2390,7 @@ int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
>  	if (ret)
>  		return ret;
> =20
> -	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
> -				 MCU_WA_PARAM_RED, 0, 0);
> +	return mt7915_mcu_set_red(dev, mtk_wed_device_active(&dev->mt76.mmio.we=
d));
>  }
> =20
>  int mt7915_mcu_init(struct mt7915_dev *dev)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.h
> index 29b5434bfdb8..b9ea297f382c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
> @@ -278,6 +278,7 @@ enum {
>  	MCU_WA_PARAM_PDMA_RX =3D 0x04,
>  	MCU_WA_PARAM_CPU_UTIL =3D 0x0b,
>  	MCU_WA_PARAM_RED =3D 0x0e,
> +	MCU_WA_PARAM_RED_SETTING =3D 0x40,
>  };
> =20
>  enum mcu_mmps_mode {
> --=20
> 2.18.0
>=20

--nmQD/Wz6P1yDMR6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY7bApQAKCRA6cBh0uS2t
rAsvAP9mZKXqpp2epDkFm0bNBgQ7LTYmBaNqGJqwj5MS8FGkmAEAgZg22ZD7PjAh
MWyhtpouBJ86QGz4io2W9CGV0gtuzAw=
=S45w
-----END PGP SIGNATURE-----

--nmQD/Wz6P1yDMR6h--

