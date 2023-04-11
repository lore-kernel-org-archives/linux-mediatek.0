Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9369BC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4RTO4oNbK/YZKpBIo9Ybm77r9URK0y64PTnOeW/Jw8=; b=s/zchi/jb0yhIK4gLVORGcbF9y
	tCf9e4WvGY0338HK0JSurAxLgJK7TnGycrQc1F7IY+J+krS2/NYTUK9TF+CzPhkeqgpdo+aB4h2bZ
	ve1Qn/MukUcK41SlzpKxF+mPdgVTDs4AMq6g+UiqgXTV/pVdjl/HYlD7Vy+re71SJLWhBUswWwZOg
	EySyzhptnTev3+oGZ0MSjaIvv9E4Mo65IEa+Z+sW1xcOjeRseRwB2n2RnOvossPUnpM3I3W6qCsze
	3bG1DflV6C6PTiVghjFMedjyd1NYlWucOmdZjEjffu08vEcwYStF44s/xJzr+9YLiTTREBvXMb4pO
	G9nkdyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9lg-00Gxzg-1v;
	Tue, 11 Apr 2023 08:54:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9ld-00GxzA-1q
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 08:54:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C86CF60B54;
	Tue, 11 Apr 2023 08:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88352C433D2;
	Tue, 11 Apr 2023 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681203260;
	bh=YLf/DK1KNzt1ZYhHVyFbWlEQpV0F1StEcKaschfCFjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgEkXQnR6UYuE113W4whZvCkjSXx7/HhTDG+uyu9qMEHwoeaV4iYCrhDVaj5EneW9
	 76PgvQSdRfagpchx7Vaqo48FBpmyU3WZGzSzCA08gvpOFZ1XIApiwvUjqCNsmulXa5
	 YDFTSNVrckUbAFxKJjHd1beZu4NDrUvm5Iaxd/nbvGZHdhB0vC+EmHHsaJMnfeR7P5
	 n4UMGXrp/25+4DAbeB+uUsD++hasnooY+QmEJoTxtTluXDwt5BHUEFFOcUJC2PyPFK
	 ClguvzJZNJSZuyS8qujCehxBOGEmm2yTVV+cZP6SDnepMfC2Qt6rcSH8GnJqQaFHJg
	 0pzGSK4ONue4g==
Date: Tue, 11 Apr 2023 10:54:16 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
	Deren.Wu@mediatek.com, km.lin@mediatek.com,
	jenhao.yang@mediatek.com, robin.chiu@mediatek.com,
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
	ted.huang@mediatek.com, Stella.Chang@mediatek.com,
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
	arowa@google.org, frankgor@google.com, kuabhs@google.com,
	druth@google.com, abhishekpandit@google.com, shawnku@google.com,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: fix kernel panic by accessing unallocated
 eeprom.data
Message-ID: <ZDUgOLpLJwYOi3a6@lore-desk>
References: <c9e2a44da4daa00166c802a8c10527359358219d.1681158440.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jmj7sJj+1zKfEFoN"
Content-Disposition: inline
In-Reply-To: <c9e2a44da4daa00166c802a8c10527359358219d.1681158440.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_015421_705338_9D79F9FA 
X-CRM114-Status: GOOD (  19.11  )
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


--Jmj7sJj+1zKfEFoN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> The MT7921 driver no longer uses eeprom.data, but the relevant code has n=
ot
> been removed completely since
> commit 16d98b548365 ("mt76: mt7921: rely on mcu_get_nic_capability").
> This could result in potential invalid memory access.
>=20
> To fix the kernel panic issue in mt7921, it is necessary to avoid accessi=
ng
> unallocated eeprom.data which can lead to invalid memory access.
>=20
> [2.702735] BUG: kernel NULL pointer dereference, address: 0000000000000550
> [2.702740] #PF: supervisor write access in kernel mode
> [2.702741] #PF: error_code(0x0002) - not-present page
> [2.702743] PGD 0 P4D 0
> [2.702747] Oops: 0002 [#1] PREEMPT SMP NOPTI
> [2.702755] RIP: 0010:mt7921_mcu_parse_response+0x147/0x170 [mt7921_common]
> [2.702758] RSP: 0018:ffffae7c00fef828 EFLAGS: 00010286
> [2.702760] RAX: ffffa367f57be024 RBX: ffffa367cc7bf500 RCX: 0000000000000=
000
> [2.702762] RDX: 0000000000000550 RSI: 0000000000000000 RDI: ffffa367cc7bf=
500
> [2.702763] RBP: ffffae7c00fef840 R08: ffffa367cb167000 R09: 0000000000000=
005
> [2.702764] R10: 0000000000000000 R11: ffffffffc04702e4 R12: ffffa367e8329=
f40
> [2.702766] R13: 0000000000000000 R14: 0000000000000001 R15: ffffa367e8329=
f40
> [2.702768] FS:  000079ee6cf20c40(0000) GS:ffffa36b2f940000(0000) knlGS:00=
00000000000000
> [2.702769] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [2.702775] CR2: 0000000000000550 CR3: 00000001233c6004 CR4: 0000000000770=
ee0
> [2.702776] PKRU: 55555554
> [2.702777] Call Trace:
> [2.702782]  mt76_mcu_skb_send_and_get_msg+0xc3/0x11e [mt76 <HASH:1bc4 5>]
> [2.702785]  mt7921_run_firmware+0x241/0x853 [mt7921_common <HASH:6a2f 6>]
> [2.702789]  mt7921e_mcu_init+0x2b/0x56 [mt7921e <HASH:d290 7>]
> [2.702792]  mt7921_register_device+0x2eb/0x5a5 [mt7921_common <HASH:6a2f =
6>]
> [2.702795]  ? mt7921_irq_tasklet+0x1d4/0x1d4 [mt7921e <HASH:d290 7>]
> [2.702797]  mt7921_pci_probe+0x2d6/0x319 [mt7921e <HASH:d290 7>]
> [2.702799]  pci_device_probe+0x9f/0x12a
>=20
> Fixes: 16d98b548365 ("mt76: mt7921: rely on mcu_get_nic_capability")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index c5e7ad06f877..00c84680c723 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -20,7 +20,6 @@ static int
>  mt7921_mcu_parse_eeprom(struct mt76_dev *dev, struct sk_buff *skb)
>  {
>  	struct mt7921_mcu_eeprom_info *res;
> -	u8 *buf;
> =20
>  	if (!skb)
>  		return -EINVAL;
> @@ -28,8 +27,6 @@ mt7921_mcu_parse_eeprom(struct mt76_dev *dev, struct sk=
_buff *skb)
>  	skb_pull(skb, sizeof(struct mt76_connac2_mcu_rxd));
> =20
>  	res =3D (struct mt7921_mcu_eeprom_info *)skb->data;
> -	buf =3D dev->eeprom.data + le32_to_cpu(res->addr);
> -	memcpy(buf, res->data, 16);
> =20
>  	return 0;

I think we can just get rid of mt7921_mcu_parse_eeprom() here and use 'else'
branch in mt7921_mcu_parse_response() since now we just perform skb_pull().
Agree?

Regards,
Lorenzo

>  }
> --=20
> 2.25.1
>=20

--Jmj7sJj+1zKfEFoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZDUgOAAKCRA6cBh0uS2t
rMGOAP9d4XmtzbcmDuc/9FR40HlTd2JX1EQMv5I3gNysAnsURgD+PlwKt5vhOAsQ
z8JjJSvF0wMhpTTPQ/hgLIXEvPqLfQs=
=HqOK
-----END PGP SIGNATURE-----

--Jmj7sJj+1zKfEFoN--

