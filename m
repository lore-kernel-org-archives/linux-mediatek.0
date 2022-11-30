Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A05AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7VdVRgP9VHgi7HsQG70wephacfbNkhpd/gsmgXbQ/o=; b=c0WHDxFp6dC3l6Tx++LPitUnUA
	NcESF9oesBPlCyoNT6fZ0wKjNIIB5abf5ISEi6YX8/6Egvc66c+xbhzGHkxjKswgRMDBzguulHX+C
	34461zgBX0xLALLrUwGxanhjkm180Pk4SoDqjB0RNFkOuVxfz11SEcS3+wnjQrv732dAXW4R0N86k
	ryB0yj7Uv5nY4o+AnFxMikWSrK6voxGzVMqzOendkfWJ9/DV1OJSy4mEdFRCERSt/1LK2NUCiLCsb
	/bQONnn7LybRf458EuR/CZFx+JIXKxTXTIvvrBOf/ZwVyZjCtgkgYZJzmlWye2gc0tKOS20T75IM7
	yCesH/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OMK-00H2tD-Cb; Wed, 30 Nov 2022 14:46:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OMH-00H2qs-NF
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 14:46:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8791061C31;
	Wed, 30 Nov 2022 14:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F324C433D6;
	Wed, 30 Nov 2022 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669819601;
	bh=YVchIPb+wlDzlDK920Vs4DKwioM3oS1YihgCiriHvzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQ1iULdoEhZOi07uGkG7h6xg4lNrKADKjoRlYhmO+6Jvw55SVfLEwyUiNqVILfid7
	 fC3Emr52JAvDKTxypUhovKJLTGOVHRobU3D3xyrq5BKxQAIQWiwXPGPoXXiEZsUs32
	 cfDW+dInt7VaMk6aVBM15nWaAWCacgbtYleca69AF4VEl+tlvjYYgHXAVyZDnEoWwT
	 y9+3UAQexlx7ovJejTMmUp1FEsIA2FWqXbW6pRcrqryzUyAmWHSAPe3TWzaaOpq4GI
	 onYlRQorqRWOqwkeQXXckR2lUHoSXL4Wz5zFn4s1zfXFhMLMYbif/Amn2YSwl9Gv4r
	 dOrudNanIRLTg==
Date: Wed, 30 Nov 2022 15:46:38 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
	Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
	KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
	CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
	Stella Chang <Stella.Chang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: mt7921s: fix slab-out-of-bounds access in
 sdio host
Message-ID: <Y4dsznJ+GBalfzvx@lore-desk>
References: <631e6a06fb640ec4f81c92b57d31eb0f7b23c351.1669814212.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5xJ5KHOAxWbSzZPZ"
Content-Disposition: inline
In-Reply-To: <631e6a06fb640ec4f81c92b57d31eb0f7b23c351.1669814212.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_064645_904423_522E7CA9 
X-CRM114-Status: GOOD (  20.43  )
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


--5xJ5KHOAxWbSzZPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> SDIO may need addtional 512 bytes to align bus operation. If the tailroom
> of this skb is not big enough, we would access invalid memory region.
> For low level operation, take xmit_buf instead of skb to keep valid memory
> access in SDIO.
> Note: xmit_buf is big enough for single skb size
>=20
> Error message:
> [69.951] BUG: KASAN: slab-out-of-bounds in sg_copy_buffer+0xe9/0x1a0
> [69.951] Read of size 64 at addr ffff88811c9cf000 by task kworker/u16:7/4=
51
> [69.951] CPU: 4 PID: 451 Comm: kworker/u16:7 Tainted: G W  OE  6.1.0-rc5 =
#1
> [69.951] Workqueue: kvub300c vub300_cmndwork_thread [vub300]
> [69.951] Call Trace:
> [69.951]  <TASK>
> [69.952]  dump_stack_lvl+0x49/0x63
> [69.952]  print_report+0x171/0x4a8
> [69.952]  kasan_report+0xb4/0x130
> [69.952]  kasan_check_range+0x149/0x1e0
> [69.952]  memcpy+0x24/0x70
> [69.952]  sg_copy_buffer+0xe9/0x1a0
> [69.952]  sg_copy_to_buffer+0x12/0x20
> [69.952]  __command_write_data.isra.0+0x23c/0xbf0 [vub300]
> [69.952]  vub300_cmndwork_thread+0x17f3/0x58b0 [vub300]
> [69.952]  process_one_work+0x7ee/0x1320
> [69.952]  worker_thread+0x53c/0x1240
> [69.952]  kthread+0x2b8/0x370
> [69.952]  ret_from_fork+0x1f/0x30
> [69.952]  </TASK>
>=20
> [69.952] Allocated by task 854:
> [69.952]  kasan_save_stack+0x26/0x50
> [69.952]  kasan_set_track+0x25/0x30
> [69.952]  kasan_save_alloc_info+0x1b/0x30
> [69.952]  __kasan_kmalloc+0x87/0xa0
> [69.952]  __kmalloc_node_track_caller+0x63/0x150
> [69.952]  kmalloc_reserve+0x31/0xd0
> [69.952]  __alloc_skb+0xfc/0x2b0
> [69.952]  __mt76_mcu_msg_alloc+0xbf/0x230 [mt76]
> [69.952]  mt76_mcu_send_and_get_msg+0xab/0x110 [mt76]
> [69.952]  __mt76_mcu_send_firmware.cold+0x94/0x15d [mt76]
> [69.952]  mt76_connac_mcu_send_ram_firmware+0x415/0x54d [mt76_connac_lib]
> [69.952]  mt76_connac2_load_ram.cold+0x118/0x4bc [mt76_connac_lib]
> [69.952]  mt7921_run_firmware.cold+0x2e9/0x405 [mt7921_common]
> [69.952]  mt7921s_mcu_init+0x45/0x80 [mt7921s]
> [69.953]  mt7921_init_work+0xe1/0x2a0 [mt7921_common]
> [69.953]  process_one_work+0x7ee/0x1320
> [69.953]  worker_thread+0x53c/0x1240
> [69.953]  kthread+0x2b8/0x370
> [69.953]  ret_from_fork+0x1f/0x30
> [69.953] The buggy address belongs to the object at ffff88811c9ce800
>              which belongs to the cache kmalloc-2k of size 2048
> [69.953] The buggy address is located 0 bytes to the right of
>              2048-byte region [ffff88811c9ce800, ffff88811c9cf000)
>=20
> [69.953] Memory state around the buggy address:
> [69.953]  ffff88811c9cef00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
> [69.953]  ffff88811c9cef80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
> [69.953] >ffff88811c9cf000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc
> [69.953]                    ^
> [69.953]  ffff88811c9cf080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc
> [69.953]  ffff88811c9cf100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc
>=20
> Fixes: 764dee47e2c1 ("mt76: sdio: move common code in mt76_sdio module")
> Tested-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net=
/wireless/mediatek/mt76/sdio_txrx.c
> index bfc4de50a4d2..ebea5c4e8da5 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> @@ -254,7 +254,8 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev, s=
truct mt76_queue *q)
> =20
>  		if (!test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state)) {
>  			__skb_put_zero(e->skb, 4);
> -			err =3D __mt76s_xmit_queue(dev, e->skb->data,
> +			memcpy(sdio->xmit_buf, e->skb->data, e->skb->len);

(even if it is not critical for performance) iirc the skb from the mcu is
always linear, I guess we can use __skb_grow() instead. What do you think?

Regards,
Lorenzo

> +			err =3D __mt76s_xmit_queue(dev, sdio->xmit_buf,
>  						 e->skb->len);
>  			if (err)
>  				return err;
> --=20
> 2.18.0
>=20

--5xJ5KHOAxWbSzZPZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY4dszgAKCRA6cBh0uS2t
rAgTAPwMIJ9KUCyWclUFy5IDZIpNv5DeKfZeKOYQaRjRj6mtWAEAjPCYaotcj+uz
bP2qte9vjlIvKenXO0LYTwhIpkYc8AQ=
=ffuc
-----END PGP SIGNATURE-----

--5xJ5KHOAxWbSzZPZ--

