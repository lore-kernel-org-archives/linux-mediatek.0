Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977BE10A88E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0aDv3pXPzRA3fsboUtQWOUMKwDX2cc1CXV7e/p5wkw=; b=DkVMHt1sElyAs4oKwJJpw5hkRu
	Fy8TPHxC2kh86GS/fp1VX+u89R83Qe4OYV7nDxjWiM0Hh+qqVpWa9Vj6Z1VA03ZgKAoLhs2sJ0s0V
	3mtClpkGs/SFCq/o/1gx50DhjKA/hxJQyILYobx81N2joe7oBg9YqrBLuny0XQ6eCGYvGcf57z8oK
	WxeCrl7jlHRoDJ+HP89kIke8zVTganTlhGbxM54Hetn16o7Hm7pXshdUfWxACtfafSB33Rh85d7Pb
	GlmA8FNPDFQSjSUQ066Q4h8u6AvPxQqgtbjo14H3fXMphtmVNAgUnqAw+qvG4QeanmbsEMwlHaQLF
	rbqYcXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oBS-00000005usR-0lnB;
	Thu, 26 Mar 2026 17:07:50 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oBO-00000005ur9-36nn
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 17:07:49 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774544852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0aDv3pXPzRA3fsboUtQWOUMKwDX2cc1CXV7e/p5wkw=;
	b=bX6FTEe74FQkmmro5vPJ3oUSL+4DVGfEVC9ep5hLXyac4bdeagUpYJ8fs7NETh78QHx5e4
	Mikk+rLRNEsuAUJ0fB/JaeqPrXIM15IcCmdL8fu0Puepr5o6bamD6HuPOa7rRm0ednA71s
	UrrZt0n74ITvJmWQPMeZPVXc3xuLyDs=
Date: Thu, 26 Mar 2026 17:07:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <3e63a5483ce20ddf03e9dd9feabfec89ef902993@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts: add missing fields for
 mt7987
To: "Frank Wunderlich" <linux@fw-web.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, "Daniel Golle"
 <daniel@makrotopia.org>, "Laura Nao" <laura.nao@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260312202433.39092-1-linux@fw-web.de>
References: <20260312202433.39092-1-linux@fw-web.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_100748_007083_B8658170 
X-CRM114-Status: GOOD (  10.81  )
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

Hi,

just a friedly reminder

@angelo do my mails get tagged as spam or similar?


Am 12. M=C3=A4rz 2026 um 21:24 schrieb "Frank Wunderlich" <linux@fw-web.d=
e mailto:linux@fw-web.de?to=3D%22Frank%20Wunderlich%22%20%3Clinux%40fw-we=
b.de%3E >:

>=20
>=20From: Frank Wunderlich <frank-w@public-files.de>
>=20
>=20Commit a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops=
 to
> support alternative conversion logic") added new ops field which causes
> crash on mt7987.
>=20
>=20[ 1.518540] Internal error: Oops: 0000000096000005 [#1] SMP
> ...
> [ 1.564481] pc : lvts_get_temp+0x84/0xc4
> [ 1.564492] lr : lvts_get_temp+0x60/0xc4
> ...
> [ 1.620900] Call trace:
> [ 1.631753] lvts_get_temp+0x84/0xc4 (P)
> [ 1.645471] __thermal_zone_get_temp+0x24/0x11c
> [ 1.656502] __thermal_zone_device_update+0x9c/0x52c
>=20
>=20Add the new ops member added in 7.0-rc1 for mt7987 too.
>=20
>=20Commit 6931d597c5ef ("thermal/drivers/mediatek/lvts: Make number of
> calibration offsets configurable") introduced field num_cal_offsets
> in lvts_data. Add this for mt7987 too.
>=20
>=20Fixes: 78c24e67d6f8 ("thermal/drivers/mediatek/lvts_thermal: Add mt79=
87 support")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
>=20diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/therma=
l/mediatek/lvts_thermal.c
> index a9617d5e0077..1224ce0c1507 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -2026,6 +2026,8 @@ static const struct lvts_data mt7987_lvts_ap_data=
 =3D {
>  .temp_offset =3D LVTS_COEFF_B_MT7987,
>  .gt_calib_bit_offset =3D 32,
>  .def_calibration =3D 19380,
> + .num_cal_offsets =3D LVTS_NUM_CAL_OFFSETS_MT7988,
> + .ops =3D &lvts_platform_ops_mt7988,
>  };
>=20=20
>=20 static const struct lvts_data mt7988_lvts_ap_data =3D {
> --=20
>=202.43.0
>=20

regards=20Frank

