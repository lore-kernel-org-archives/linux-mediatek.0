Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED2606A323
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IH0ekV3d;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=q3ivFl7X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TRDoGgRwa5KsWvB/IflpQ73VDTml/plhE/c6Vl1BGL4=; b=IH0ekV3dOAiz0g
	w4u8cHPRXIiRMOUe/vg/IYIknMYpnRtJNAElH57uUv2RG5/hM/xko1xS7nAQ+FjOV/+offDBusXz0
	GInfX9aSlXAZgQjNzg/7NYUxGEVu5adHMlv1rNjNTjLstVLiG0SD9T+2MsNLa8LcFEGhFn6Orq921
	V00GNE6Rhu4Wbh3EUKmlv+g8fR5rzfw6G5eu2qBrpCC/+VBStA8z7JD1aftmhmdmWo8Wsh3tsBwUb
	AGFYbD3KI4VDtM4pzZDy2s3drtQeEf2q3FH6fogPaK88l/kFhnozUnctSt9OYzssnTiCtCoBB+LZa
	+HSa8bVT2P2W0SmpRqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHvl-00000005WmN-3YGq;
	Tue, 17 Nov 2026 12:04:57 +0000
Received: from mail-106119.protonmail.ch ([79.135.106.119])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHtL-00000005WRr-1wjC
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 12:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794916942; x=1795176142;
	bh=TRDoGgRwa5KsWvB/IflpQ73VDTml/plhE/c6Vl1BGL4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=q3ivFl7XnsQ4mk+NCr+/jvp24S4+bJ6ole8RRhDBj5kzXDzs2Zl29mveKSMA9lSt5
	 hTXrgC4nxQJwDA4XOSo+CcmC64Y+nLiQhp2el26uv4Gqv9wlckMppTUXACcZyxt5/p
	 ql2WZVOAoDauiGGY9bGFHEW/XAMKfYO2wgJiRFvf6TVBW4GHbDrEPmFAC1id/oXmiJ
	 n6zy/KLADPUKutgw8Ks/23t/rfeSRJlr0ap0VDd5nrP/QzJ9qZe/Yt/vM/QwafeO3w
	 fokzQWn0HK2N4bAEKDKjuu+NB1dI0nL3UGYMrQwKYGXaJCzz/EbPXmGi+riMTqW8pV
	 UQZeXEMYNaIlA==
Date: Tue, 17 Nov 2026 12:02:15 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin post-processing
Message-ID: <k8LLawty9o68P00hLr5LO1163o_m16f_vf8fBZvdD18nOatszy1i4Dp7DeC8Hv2--Q08YyZfhCRnQbVDps0lqB2zZrx-k_GxKUaqj6eT6r4=@protonmail.com>
In-Reply-To: <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com> <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com> <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 4dc8420aa797847c5bd3778dc677e8a39e520ad9
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_040247_366191_4D690DDB 
X-CRM114-Status: GOOD (  19.23  )
X-Spam-Score: -2.5 (--)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On Tuesday, November 17th, 2026 at 1:56 PM, AngeloGioacchino Del Regno <ang=
elogioacchino.delregno@collabora.com> wrote:

> On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > MediaTek SoCs are often released under the same marketing name, but wit=
h
> > different suffix for the speedbin. For example, mt6572m has 1 GHz limit=
,
> > mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
> >
> > Since the speedbin is stored as a number in the efuse, add support for
> > converting it to the bitmask for opp-supported-hw usage in the DT.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >   drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > index 980c29d01337..d2e5c69c580e 100644
> > --- a/drivers/nvmem/mtk-efuse.c
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, =
const char *id, int index,
> >   =09return 0;
> >   }
> >
> > +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, in=
t index,
> > +=09=09=09=09     unsigned int offset, void *data, size_t bytes)
>=20
> You can *literally* reuse mtk_efuse_gpu_speedbin_pp....

No, I can't. On later SoCs CPU speedbin has different encoding.
For example, on mt6768 it can be stored in either low or high 4 bits.
This is out of scope for this series, but I'd like if we kept this
callback for the future SoCs.

>=20
> > +{
> > +=09u8 *val =3D data;
> > +
> > +=09if (val[0] >=3D 8)
> > +=09=09return -EINVAL;
> > +
> > +=09val[0] =3D BIT(val[0]);
> > +=09return 0;
> > +}
> > +
> >   static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
> >   =09=09=09=09=09 struct nvmem_cell_info *cell)
> >   {
> > @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvme=
m_device *nvmem,
> >   =09if (cell->nbits <=3D 3 &&
> >   =09    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedb=
in"))) =3D=3D 0)
> >   =09=09cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
> > +
> > +=09/*
> > +=09 * On mobile SoCs, the CPU speedbin is a number. Convert it to
>=20
> Other SoCs have got the same efuse style as mobile SoCs: anyway, all Medi=
aTek
> SoCs (apart from networking ones) are (in a way or another) variants of t=
he
> mobile ones.

They're not really variants, some of them have no direct mt81xx/83xx siblin=
g.

Best regards,
Roman

