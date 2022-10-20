Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A25C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEyeAqRkz8ofVgcg3/w5/1i7hyOQQ7idefgTfAJdXBA=; b=TVacrQu5idqDeTMuGbhEEoAZgt
	xpNFLCUcsbEqMxrwtuzS94LO0PdTTKExtRd7AFa2Z7CeSpGg4YZ4ahSw5hf2uJFEnFlYCAsshdgCw
	yan0pB9wA/cWgqiksMftZEs+0G8zxYo05wVXu8Kd61XQ090rwsRN0uGnjA9scI3wHyg5BVJ5UCIWx
	w3FRb7qygNmMC/zV6PEUnRphTZBRgG0g8h9TlPRvhj3j7GSIveVOjchxsfyoxQGPcrnwygZHLvB0B
	r/4QEpbcHJNlu0ocJno66a9yvrAjUPJ6rrGw3FIl7MRX+JOCkan6yAZhZwMiB7ti72oSCNu3787Bz
	jzfCHxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQGL-00BvJR-Hs; Thu, 20 Oct 2022 07:46:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQGA-00BvH3-0Z; Thu, 20 Oct 2022 07:46:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso1689918wma.1;
        Thu, 20 Oct 2022 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEyeAqRkz8ofVgcg3/w5/1i7hyOQQ7idefgTfAJdXBA=;
        b=hEm1IpxaWE2L7Eu+1FXjU4xARijFwJiRezVcpAN8LvztZOmcmf5UMeNzJIsGAHNStS
         GJvsug79uDSID7yxrGnqitO5AS8WhrhOFqCYLHeJdTe9mHx/L3VeywC20Ow90NgeVuOJ
         IGLre+lmBJNGL8nbT7lPc3y/3bHDdsordGbJTugTfAWGthwjO4kSx1eKKHh7dLzRED0R
         u/2mzANKneQkAE3cC4GSHMP3sZ0f6wWbWu4Kk7WnfUmrOQBK9D1fmqCRdlMuNa+VBeWd
         60y3OuxfGkIjF7mZRIGeLpFO5QEyWeksnBkczvSV6K/66gT5FKoPmJ9SAoW7Iv7g4g+V
         2+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEyeAqRkz8ofVgcg3/w5/1i7hyOQQ7idefgTfAJdXBA=;
        b=g6td+maa+fhMyNuSO4wsO83tylk0sUkT0oNOyAnzaOKa4Y9Z0zhL88EwdNZ0NMGK4S
         F0ErO7MPH+InkA5gHGwek749ZHkc5UO/JL5S7GZuFe2bc4OW0ivs0woA+Af2Zd1RII25
         XN8+EPWT94CmiCMA2FD15muwubhT1nE9Lfu8JCGtpM5UqyA568LdKDlDoa7//DNvQdMa
         +ZYLyNe3MOHS4VGcvLDG2jCvJ2zVr41D9SsjDm94XpQNUoW0AGAk8kLco5ULd/nQczNN
         6sg+0okJCt61WLMu5aiWZsp4yPS0yHAkl8t3oithZKlRnt8UVD6SiLPmzkHaxy3a2c5s
         ub2A==
X-Gm-Message-State: ACrzQf2Qv0ctxPc4ClENeS4LKIZsnvnGh2C4oJ2EksimAv16ngvGFPfq
	uYFdFx6s2y5wTmT+YBkbn6rpjq5zAxqcIDD/AZU=
X-Google-Smtp-Source: AMsMyM7foOl//px0n7jl3Vt65n1YnsctUT9xAkTfMET5Nopr3O+wC1Zh2V8CGM5ugkwnsDIRtm3in3v0vqFWNk2VCH4=
X-Received: by 2002:a05:600c:198d:b0:3b4:a62c:a085 with SMTP id
 t13-20020a05600c198d00b003b4a62ca085mr27820940wmq.140.1666251989062; Thu, 20
 Oct 2022 00:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <1664416817-31590-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1664416817-31590-1-git-send-email-u0084500@gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 20 Oct 2022 15:46:17 +0800
Message-ID: <CADiBU38+r48uxAasbHSCEFvJc2w4_-nz8vHpAX=OOBq2NPE81Q@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6360: add bound check in regmap read/write function
To: lee@kernel.org
Cc: matthias.bgg@gmail.com, gene_chen@richtek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_004634_083212_4E902826 
X-CRM114-Status: GOOD (  17.35  )
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

cy_huang <u0084500@gmail.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=8829=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Fix the potential risk for null pointer if bank index is over the maximum=
.
>
> Refer to the discussion list for the experiment result on mt6370.
> https://lore.kernel.org/all/20220914013345.GA5802@cyhuang-hp-elitebook-84=
0-g3.rt/
> If not to check the bound, there is the same issue on mt6360.
>
> Fixes: 3b0850440a06c (mfd: mt6360: Merge different sub-devices I2C read/w=
rite)
> Cc: stable@vger.kernel.org
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Since v2:
> - Assign i2c bank variable after bank index is already checked.
>
> ---
>  drivers/mfd/mt6360-core.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
Any comment?
> diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
> index 6eaa677..d3b32eb 100644
> --- a/drivers/mfd/mt6360-core.c
> +++ b/drivers/mfd/mt6360-core.c
> @@ -402,7 +402,7 @@ static int mt6360_regmap_read(void *context, const vo=
id *reg, size_t reg_size,
>         struct mt6360_ddata *ddata =3D context;
>         u8 bank =3D *(u8 *)reg;
>         u8 reg_addr =3D *(u8 *)(reg + 1);
> -       struct i2c_client *i2c =3D ddata->i2c[bank];
> +       struct i2c_client *i2c;
>         bool crc_needed =3D false;
>         u8 *buf;
>         int buf_len =3D MT6360_ALLOC_READ_SIZE(val_size);
> @@ -410,6 +410,11 @@ static int mt6360_regmap_read(void *context, const v=
oid *reg, size_t reg_size,
>         u8 crc;
>         int ret;
>
> +       if (bank >=3D MT6360_SLAVE_MAX)
> +               return -EINVAL;
> +
> +       i2c =3D ddata->i2c[bank];
> +
>         if (bank =3D=3D MT6360_SLAVE_PMIC || bank =3D=3D MT6360_SLAVE_LDO=
) {
>                 crc_needed =3D true;
>                 ret =3D mt6360_xlate_pmicldo_addr(&reg_addr, val_size);
> @@ -453,13 +458,18 @@ static int mt6360_regmap_write(void *context, const=
 void *val, size_t val_size)
>         struct mt6360_ddata *ddata =3D context;
>         u8 bank =3D *(u8 *)val;
>         u8 reg_addr =3D *(u8 *)(val + 1);
> -       struct i2c_client *i2c =3D ddata->i2c[bank];
> +       struct i2c_client *i2c;
>         bool crc_needed =3D false;
>         u8 *buf;
>         int buf_len =3D MT6360_ALLOC_WRITE_SIZE(val_size);
>         int write_size =3D val_size - MT6360_REGMAP_REG_BYTE_SIZE;
>         int ret;
>
> +       if (bank >=3D MT6360_SLAVE_MAX)
> +               return -EINVAL;
> +
> +       i2c =3D ddata->i2c[bank];
> +
>         if (bank =3D=3D MT6360_SLAVE_PMIC || bank =3D=3D MT6360_SLAVE_LDO=
) {
>                 crc_needed =3D true;
>                 ret =3D mt6360_xlate_pmicldo_addr(&reg_addr, val_size - M=
T6360_REGMAP_REG_BYTE_SIZE);
> --
> 2.7.4
>

