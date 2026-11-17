Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7217606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pet95Ts2;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=gJDI6ysv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oytSVZw7ZCXwq1tGZIXRUB86K7ksbFjm2HjimDVfr+o=; b=pet95Ts2BIcGUr
	DKQ8B4Gr7B+aBtIxKDUbyxy4YcYHpOtChfeOXrK78HxsQkI1JFn+Uhz4VFRlNG/YWfTCJaYC5UCKf
	vtPOVUqEVpMwgOs23jlUwEzyrSa1GGSLQU6pGUbp9E+SP820QnR0EQKI8CZndfDcZtp4YWiTPkWVI
	CMxK1sZVgfyFRvAC5IAfyZmM0n6OWh2nIQGkP1G5AqbJXke/RvgURgTPv0wRp//5vZX7quocy0tFj
	Lk6jgCp8636Cv3/eADB5rLcGItsj+h4wdDC6bY2ascKdaHBsEEk0Uw6lYQSbdoRX1koaKfQdOuu7s
	o00UmQ0Fyle/4HUATJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI7J-00000005bO3-2C8o;
	Tue, 17 Nov 2026 12:16:53 +0000
Received: from mail-10630.protonmail.ch ([79.135.106.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI7H-00000005bNQ-07oo;
	Tue, 17 Nov 2026 12:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794917807; x=1795177007;
	bh=oytSVZw7ZCXwq1tGZIXRUB86K7ksbFjm2HjimDVfr+o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gJDI6ysv+wdI+SDlxMrJWOWEKZ7phoEHfS5PmswVJTZOEbtbGVNS/lHQf4voXPOWT
	 VtNIoujXPSw4Q0FNWnFI95wQmLKWv4AokZmi+TntaMonsy680wVcQKeUZ3SJ9aaW/N
	 3qq1jAri2D+Co8fRTCSEm15wtrBo2RdWJW5L3lCxmucaWBCP71GUBZrh01bt7ircUZ
	 qfMYJpEXpcRy18BE5QtSJJLmBwh4C94MfBCymT4Q4BTj02VrtAZOCHxOXnuoyX7KTB
	 Gbxd1jmoyc8R6j32VqsogcA1XI3MXxIs7r9Kdb0ATJbe6U/xm1wk70D3Pv5pVdzDS7
	 Ocu7hrTT8JrVg==
Date: Tue, 17 Nov 2026 12:16:40 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin post-processing
Message-ID: <HloHOTfn5uSaFV7GTvC6wE0WlkmHCnyVUIUmQ9LmSnsUGOXn6SZ6ilq-zC9KtWULMprm8ki_LR6qxwWLS0S6q5phg50aHxyE_xK4UzI57n0=@protonmail.com>
In-Reply-To: <6935d7a4-2f91-4abf-81e9-f77c2b6c80d2@collabora.com>
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com> <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com> <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com> <k8LLawty9o68P00hLr5LO1163o_m16f_vf8fBZvdD18nOatszy1i4Dp7DeC8Hv2--Q08YyZfhCRnQbVDps0lqB2zZrx-k_GxKUaqj6eT6r4=@protonmail.com> <6935d7a4-2f91-4abf-81e9-f77c2b6c80d2@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: bf6f75e33c8727bbe33e0b1401f772d263752cae
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_041651_253797_CF98EF6C 
X-CRM114-Status: GOOD (  25.91  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tuesday, November 17th, 2026 at 2:08 PM, AngeloGioacchino Del Regno <ang=
elogioacchino.delregno@collabora.com> wrote:

> On 11/17/26 13:02, Roman Vivchar wrote:
> > Hi Angelo,
> >
> > On Tuesday, November 17th, 2026 at 1:56 PM, AngeloGioacchino Del Regno =
<angelogioacchino.delregno@collabora.com> wrote:
> >
> >> On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
> >>> From: Roman Vivchar <rva333@protonmail.com>
> >>>
> >>> MediaTek SoCs are often released under the same marketing name, but w=
ith
> >>> different suffix for the speedbin. For example, mt6572m has 1 GHz lim=
it,
> >>> mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
> >>>
> >>> Since the speedbin is stored as a number in the efuse, add support fo=
r
> >>> converting it to the bitmask for opp-supported-hw usage in the DT.
> >>>
> >>> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> >>> ---
> >>>    drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
> >>>    1 file changed, 19 insertions(+)
> >>>
> >>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> >>> index 980c29d01337..d2e5c69c580e 100644
> >>> --- a/drivers/nvmem/mtk-efuse.c
> >>> +++ b/drivers/nvmem/mtk-efuse.c
> >>> @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context=
, const char *id, int index,
> >>>    =09return 0;
> >>>    }
> >>>
> >>> +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, =
int index,
> >>> +=09=09=09=09     unsigned int offset, void *data, size_t bytes)
> >>
> >> You can *literally* reuse mtk_efuse_gpu_speedbin_pp....
> >
> > No, I can't. On later SoCs CPU speedbin has different encoding.
> > For example, on mt6768 it can be stored in either low or high 4 bits.
>=20
> That's the part where you pass the right nbits in devicetree for the spee=
dbin cell,
> being it still 4 bits, that statement doesn't change the outcome.
>=20
> > This is out of scope for this series, but I'd like if we kept this
> > callback for the future SoCs.
>=20
> All that the logic of your mtk_efuse_cpu_speedbin_pp is doing is assignin=
g
>=20
> BIT(val[0])
>=20
> to val[0].
>=20
> All that the logic of mtk_efuse_gpu_speedbin_pp is doing is assigning
>=20
> BIT(val[0])
>=20
> to val[0].
>=20
> To me, that looks code duplication, and duplication is bad.

This is true for this exact patch, but for newer SoC I have other code:

if (val[0] & 0x0f)
=09seg =3D val[0] & 0x0f;
else
=09seg =3D bitrev8(val[0]);

if (seg >=3D 16)
=09return -EINVAL;

if (bytes >=3D 4)
=09put_unaligned_le32(BIT(seg), data);
else if (bytes >=3D 2)
=09put_unaligned_le16(BIT(seg), data);
else if (seg < 8)
=09val[0] =3D BIT(seg);
else
=09return -EINVAL;

return 0;

If you prefer using GPU post-processing callback in this series and
adding CPU only when newer SoC support arrives, please let me know.

>=20
> >
> >>
> >>> +{
> >>> +=09u8 *val =3D data;
> >>> +
> >>> +=09if (val[0] >=3D 8)
> >>> +=09=09return -EINVAL;
> >>> +
> >>> +=09val[0] =3D BIT(val[0]);
> >>> +=09return 0;
> >>> +}
> >>> +
> >>>    static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvme=
m,
> >>>    =09=09=09=09=09 struct nvmem_cell_info *cell)
> >>>    {
> >>> @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nv=
mem_device *nvmem,
> >>>    =09if (cell->nbits <=3D 3 &&
> >>>    =09    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-spe=
edbin"))) =3D=3D 0)
> >>>    =09=09cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
> >>> +
> >>> +=09/*
> >>> +=09 * On mobile SoCs, the CPU speedbin is a number. Convert it to
> >>
> >> Other SoCs have got the same efuse style as mobile SoCs: anyway, all M=
ediaTek
> >> SoCs (apart from networking ones) are (in a way or another) variants o=
f the
> >> mobile ones.
> >
> > They're not really variants, some of them have no direct mt81xx/83xx si=
bling.
> >
> Noone looked hard to find the siblings for some of them - though there mi=
ght be
> one (and just one) that has no sibling :-)

Some like mt6595/6795 are indeed very close to 8173. Though most SoCs are
usually mix of mt81xx, like mt6768 includes mt8183, 8186 and 8192 IPs.

Best regards,
Roman

