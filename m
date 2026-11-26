Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B7606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vgKlx8kG;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiROCWzd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=; b=vgKlx8kG8Vp/Xc
	92fUI1q67PYe2TZ37mvgvQpasFTUruyW3Gy0zinG+imvj8KduNmyHUpSctYNFDouoEkjPcMAuumW4
	QVAzjqVZjqfIL9yU8WZJm1JWxeQmbZC5HatAV4MoajVscrJ+MJnTq4uS9Gs+GAG6c2xchmJ3RjlT3
	phGjgh+iGi5qvK/ZteFFFL1x2FMdRLIxGJ0mTABJrUwAGCAg+Ihosz+wiyn7+e0bqJCE74XDv9IFq
	Iu+FCe9awUU/I8R7ghax1aADYEg7Cv9m9slGlLzHUuyhoICK06M2TGeLP2q3xcUaJXOZZM+M4sakH
	SFw+li6latb5sPQh5PlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSoF-0000000CAQW-47z5;
	Thu, 26 Nov 2026 06:18:19 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSoD-0000000CAPa-05Fr
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:18:18 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b0dba37a7fso53747317b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795673895; cv=none;
        d=google.com; s=arc-20260327;
        b=kWmgYqZcvjwmNz2bOdkQTHpXsl5pqnuzrEMGlK1igO1DwOMEesUnK7Pc52roXPdiyH
         n64TBT7+hHqNkdBlb2nCAROcR2JhhCIBCjjFpaU/meBFCs+E1jMmRRRM2quOF6yhJUiP
         4G17pJcBqVedkz2aHpVYQIqU5NEYieUfxMOF5o6kTC0cN4BoYzf1wfVtxodXflZZQjNr
         UUbu5pv45yBkfo0qYFM2jilkOGC/0eB7BmgX4nvI0MLuDffohS2END8w0cxdex5dWrr+
         Q0X+98StsR5/ApdJ+D5MsJLTWeQztG6unj9MTzwaVt0qdPpf+FtKr5WKiqNJoPeD71sP
         EDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        fh=Eb0d9J4evCU30iMqMtCTVziRT5REIi9In1GLHGc8Iv0=;
        b=sD2qnVNj2Kl0DjgU7a5yjQgfCBdmxL53l5dyE3MsOWHUMd6Zc4lGuM4dyX37C5hS5V
         PRNOvWyWhaSAf8dWOdmVyGUID27upiMG5JT7oAOjQwUQMp0WDH1jqc7PzvDoRRGZe07o
         ypuMWmS80CURlP1RrG6SnGox13OrSJaJGm0sMdTyN+uU4dPe6sTbKXDjBI98xbbku6r+
         rNffs73qxshBIJZUyGdKQLc9XsRrJ3Vx1cG35OON3Q7Wx+K0vxDD8mCt/OpfsucIP1S4
         VC1mafUR2lXFCLDctxHsB88CS0QCdI7XjU3zC0Xxqh83kwXmVsAMMAMAoLvhpSP/rXI3
         m6oQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795673895; x=1796278695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        b=WiROCWzdkZRZ7DFvBSYenLWyZ0nMo2AGHov7OL1T6XPitVMhAARt3UbY7Y7zZIu+8c
         pBDRiDqbEn1h8nvmHH9vtCgHX+HhLfb9+ECfck2+FbYfNIhdzMFGI3gMkTWmXyEHIkKa
         N+FgGWGKXYabC/qf8yEZtSAeqVi1DjrSBCgEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673895; x=1796278695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        b=Vjh0QDVMmggP8dWMaR9uMoMubaSPHJ9tCsDsd3+RDblFqlqSluJyEqCNI+Dd9qCiP6
         BhwbA1NHQg8EBG4R1TDOyUnT/4sOKKVu1ya2T+shLqwVZhuh5bN2XCyKPc4wn4sYeFia
         XnQW4vO/iRgH4/7xnv93YtnJDJ9qoj2eqwxryrIq90YcM+iJKeq5WMHxBUpOtEwC7w/u
         H0aSGCdRCJ7/r+VjkebO6kaN8XyAbHeQDJVvgveqMx8pjoWnYb9El5UVkI/I5hoa7erV
         sRrpr+hIZNmLG9Gy9BBBSbWvQmSmXbzaTesFWYxtlMo/G0EqBmdFGJLUt4cSEs5P2rDa
         yo/w==
X-Forwarded-Encrypted: i=1; AL+hErELzFZv76ome6oqhhQsGl9hfUY5HHizW//U36v/j/yMj534HUCz8EzuL+3HodzJOnkkhI0M6Mk5TcmkyjjzAA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8IddR8g5oqKG+WoawEU8rlbcW8frQsPFHfFvfxJNWrhcCb89lz
	EbJXQshIIkK6SbJZqR+oumjvvsxNjqnPQN81ZxgYUu58jprHf5cNKyz9Q4mR+AUVcokSV4ckBXI
	sYjMB3cqnLcbg8BPhwfnDzuh4kAnbaENWpMJLJRT/
X-Gm-Gg: AZFdTZeJ0oATIlSwIAJ+K2K6LYm8geVkVszwonLsYNwemzPk7Vu+nK9M4yFIPfib15W
	tuqu3v0/urUwLFAvWpUo/zatfqfZtfXEf7QXr9SQd3r8pY9epYoVAuyzpwgw/xbcmcVwZXuHtuk
	CWqPU5Hr5fS+sFqRgIffyZtrsjQPBSiLMMT4HkGgqlqXBSNPIXYlUEK07KLvIbVO5IgsDRZhg8P
	DloA0xUNzI7OX842Pfiz52Nn4RuGeiL0TCH8DpitIfOMmkd+EiOTsFkSWS9q2aMpb0GCwFMwyA9
	D/fK71671P2ISm6xkcjsyI5bUf6Z4ADtkbsdezlLCmfIN3XWscZy8okRw7F7+cZd8VSuGyOlIfM
	u8B5Z8uNUWhXsvu+oQImRdlfKpIPUe7Soemy2ZC+kRe+wz2AjG/3n3BJvVzTZGOCPo84=
X-Received: by 2002:a05:690c:29a:b0:8b3:b5f1:89b4 with SMTP id
 00721157ae682-8b520472ed1mr75612087b3.28.1795673895189; Wed, 25 Nov 2026
 22:18:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125234822.94684-1-iasnezhkov@gmail.com>
In-Reply-To: <20261125234822.94684-1-iasnezhkov@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Nov 2026 14:18:03 +0800
X-Gm-Features: Aa3M54olT77g2PTxdeOuWYsBXJkE8EBtJ7XPbNnfHF5Q5XhrfHNOZbtGC_6G3kA
Message-ID: <CAGXv+5FgDoHPGcSHqMvGKb1R+2me0_JPr3xq_twbw-n693KNHg@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6358: fix MT6366 VDRAM2 vosel_mask
To: iasnezhkov@gmail.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_221817_110224_ED09D448 
X-CRM114-Status: GOOD (  18.42  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 7:48=E2=80=AFAM Ilia Snezhkov via B4 Relay
<devnull+iasnezhkov.gmail.com@kernel.org> wrote:
>
> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>
> mt6366_regulators[] declares VDRAM2 with vosel_mask =3D 0x10 (a single
> bit, bit 4) on MT6358_LDO_VDRAM2_ELR0, even though vdram2_selectors[]
> uses values { 0, 12 } (0x0 and 0xc) which live in bits 3:0.
>
> MT6358 in the same file (mt6358_regulators[]) and MediaTek's downstream
> MT6358/MT6366 regulator driver both use vosel_mask =3D 0xf on
> MT6358_LDO_VDRAM2_ELR0.
>
> Change MT6366 VDRAM2 vosel_mask from 0x10 to 0xf.
>
> Found and drafted with an AI coding assistant while auditing MT6366.
>
> Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator=
")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>

Unfortunately the datasheet does not include these registers, but I think
it makes sense that the mask should match that for the MT6358.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/regulator/mt6358-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6=
358-regulator.c
> index d6a0ec4..1d62c25 100644
> --- a/drivers/regulator/mt6358-regulator.c
> +++ b/drivers/regulator/mt6358-regulator.c
> @@ -604,7 +604,7 @@ static const struct mt6358_regulator_info mt6366_regu=
lators[] =3D {
>         MT6366_REG_FIXED("vrf18", VRF18, "vs1-ldo1", MT6358_LDO_VRF18_CON=
0, 0, 1800000),
>         MT6366_REG_FIXED("vaud28", VAUD28, "vsys-ldo1", MT6358_LDO_VAUD28=
_CON0, 0, 2800000),
>         MT6366_LDO("vdram2", VDRAM2, vdram2, "vs2-ldo1",
> -                  MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x1=
0),
> +                  MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0xf=
),
>         MT6366_LDO("vsim1", VSIM1, vsim, "vsys-ldo1",
>                    MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00=
),
>         MT6366_LDO("vibr", VIBR, vibr, "vsys-ldo3",
> --
> 2.54.0 (Apple Git-157)
>
>
>
>

