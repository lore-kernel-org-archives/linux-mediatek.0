Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4243AE66882
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgO+Zt6JaQWb39Yj1QsW4A1EaI3Ls/K898yAdxRAz2A=; b=e1lTPHAB/UG9cHIJT7L6hsjona
	CIRw3VSzYwdCsQChtHPzvqIsPPEkVJT6hILWVImrLPzGmHwB+i1F82unZlPnTUe2yllf4JwS/Kk/C
	bZFmF0pzQy6MdiCf67pUW0Smu3MCvJjpmjNlzM+DK3fkEk/0/394oaqt+fed2Bt3qzK1TtsfAAGRl
	7AFBkStwiiX3cd4WpXb2PROisVYZDg+inGIKSfxhPTT6pmNgU7ZQawbaHAxH3k5+mnZQne3q2SEmU
	BUChj85ugIkcRWMEGa3WC0N604B1zF+Ihgh3J1ZUvJC66evUOwJ17TZkb17hUFgIgetfnoSkw8ePc
	E/jPjkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhQk-0000000AyCH-2Fpx;
	Fri, 19 Dec 2025 20:50:30 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhQg-0000000AyBD-07BW
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Dec 2025 20:50:28 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766177416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LgO+Zt6JaQWb39Yj1QsW4A1EaI3Ls/K898yAdxRAz2A=;
	b=SJ0ZO+GMFeFboBd/whRfMpOQq3lufle+NcG9y7I0VXiB5ZDNRO1qGMbcgBVoG99JAM3ECL
	vEA2Ih8CrTNwT4RqJ0JekLOhxQPaje+ypt+yXhnI+DChKaONIm98CcnYm62wJSqXaEjaDz
	k3iCFBuc0TVBDAc2nJpzT+v+duZGLW4=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.11\))
Subject: Re: [PATCH v2] wifi: mt76: Fix strscpy buffer overflow in
 mt76_connac2_load_patch
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
Date: Fri, 19 Dec 2025 12:49:50 -0800
Cc: Mario Limonciello <superm1@kernel.org>,
 Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B33EA87-6175-472E-AFA3-88A08ADE1E27@linux.dev>
References: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
 <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_125027_177595_F2C2A24C 
X-CRM114-Status: GOOD (  15.65  )
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



> On Dec 5, 2025, at 8:12=E2=80=AFAM, Mikhail Gavrilov =
<mikhail.v.gavrilov@gmail.com> wrote:
>=20
> Commit f804a5895eba ("wifi: mt76: Strip whitespace from build ddate") =
introduced
> a kernel panic/WARN on systems using MediaTek MT7921e (and potentially =
others
> using mt76_connac_lib) due to an incorrect buffer size calculation.
>=20
> The error logged is:
> "strnlen: detected buffer overflow: 17 byte read of buffer size 16"
>=20
> This occurs because the field 'hdr->build_date' is a fixed-size array =
of 16 bytes.
> The patch allocated a 17-byte local buffer 'build_date' but used =
'sizeof(build_date)'
> (17) as the read limit for strscpy, causing Fortify Source to =
correctly detect
> an attempt to read 17 bytes from the 16-byte source field.
>=20
> To fix this, replace strscpy with memcpy, which is appropriate for raw =
data
> copying, and explicitly use the size of the source field =
(sizeof(hdr->build_date) =3D 16)
> to limit the read, followed by manual null termination.
>=20
> Fixes: f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Ran into this kernel panic while booting into 6.19-rc1 on my handheld, =
this patch fixed it.

Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>

> ---
> drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c =
b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index ea99167765b0..d2c4c65ec464 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -3125,8 +3125,11 @@ int mt76_connac2_load_patch(struct mt76_dev =
*dev, const char *fw_name)
> }
>=20
> hdr =3D (const void *)fw->data;
> - strscpy(build_date, hdr->build_date, sizeof(build_date));
> - build_date[16] =3D '\0';
> + /* hdr->build_date is 16 bytes. Copy exactly 16 bytes to the 17-byte =
buffer,
> + * and then add the null terminator at index 16.
> + */
> + memcpy(build_date, hdr->build_date, sizeof(hdr->build_date));
> + build_date[sizeof(hdr->build_date)] =3D '\0';
> strim(build_date);
> dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
> be32_to_cpu(hdr->hw_sw_ver), build_date);
> --=20
> 2.52.0
>=20
>=20


