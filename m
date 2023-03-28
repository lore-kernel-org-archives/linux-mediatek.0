Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E12C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rydAqL2xjCh9m8x5P5P2xf+yVVNlT8mq2EopIER2YF4=; b=3giR2oMaKtpJ3fPXA/okLnCQzT
	yu+zbClVcwkzZ5iC5QmvwGG1rG7T7dzYHQtjoF2Cc8ke9fUSSmS0r/3zIWlzv60j2/sEpiHppOq5z
	D6YqwL4lklcjpsnBcYODCnkYbcmdNfFYKRqSBI17hFmYYY3LAVAos9OcHwJkNix0uHx3A8d6gSmP2
	9epHNr0KRbr3ASBvmO97TZOZ/QmyQ9YsV1ArjBJPMDaUqytDaMntx9SubJVAfF5PupwtJS25250jb
	6KlGPmsgPJionpiS2xWIHhhAzvO6u9tF56w/DagxY5WdFveh+gJE6xlprn3orUu31KbhozYfEP2U4
	cxVSa9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5Ux-00DiVY-1L;
	Tue, 28 Mar 2023 09:20:11 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5Us-00DiTJ-1D
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 09:20:08 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id p204so14134797ybc.12
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679995203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rydAqL2xjCh9m8x5P5P2xf+yVVNlT8mq2EopIER2YF4=;
        b=Rjr+MdnqwFCGnuQdLml0S8Rg+dbGWPtX0rYliRuYF6Vx1BGLHxmv6BqbxyH+0adZWt
         F4F25hvkqcOJZlpWwo6b5GR+8oC7WRANZsp1iZtlM10kl43ujXjzT4mVnjn+QN7nkgH/
         ylTdaoxbTSTFpvfWJ/g0nndUO0lYAvmY9yhg1/8mIWR5OEvmAWMkjDfOKgUuhqZKCqbd
         /XnCOmgTUB7Jaf88M6jctxsTiOC4cPYSWTzYQ3VK+ZC/OsqtaI+LviwJ68FcYbjcW2li
         1YKX3WbXfqFml0Qo8EG3vuVsx79HR+CcCAm0vKhI+PvaHiudqk1bm6pgS6G6pcpgh7yx
         iwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rydAqL2xjCh9m8x5P5P2xf+yVVNlT8mq2EopIER2YF4=;
        b=FtZAs2sWOV00oosEPY/Rwn8y+Pu8a5YCwrs4DoDjCl0xrQGYqxCX+2piclt1gMq0vN
         3+mv/QqvlZq5avSk221wz9Gxtsd849IN4Y37JSvHIxW5zsKldYP5hXUc2DHI8wGazKwl
         jqP+22w1RxDK6n1LTt1Knkha/xhucm82gTRF6Okqa+C/Z1b2ZQQo1nOpO4k65d2AAGlj
         hAHzj/E2GVABw+oHoPR/Eg4SB8hgFzA4+zqg7HSfTE5+E4hlY2ASyIlj13Q0hN8D7Dtt
         VLbjGftFo4TbVqj27d5SEJtaIkZnNq5eUdu4ZMDLqCBRVYlwR4bGxCMLB7SmUQyHhOle
         wnBw==
X-Gm-Message-State: AAQBX9dSgbcmmwd95zTdOfW86nORF1c9IAouPgT8dIqkAP3HD3zKDijf
	N4QOAQKQEiXBzeIdcNR3UIyZuyaOPNQ1t/qrb4ojRQ==
X-Google-Smtp-Source: AKy350bysJsJQEMIVvOgRrtDQqvgDbyfnCMQZJxShJfJthTEA4O/F/mDGDMWyhxv19f8BsA5jRUCcPGquZnZUmPXvCU=
X-Received: by 2002:a05:6902:1586:b0:98e:6280:74ca with SMTP id
 k6-20020a056902158600b0098e628074camr9294491ybu.1.1679995202855; Tue, 28 Mar
 2023 02:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com> <20230324094205.33266-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230324094205.33266-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 28 Mar 2023 11:19:52 +0200
Message-ID: <CAFGrd9oyOz8-gf10-1QkaBzZwTvm9V7b63BZeoUbbM45CO8E1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] soc: mediatek: pwrap: Move PMIC read test sequence
 in function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, flora.fu@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_022006_419119_A7E51C47 
X-CRM114-Status: GOOD (  17.40  )
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

Le ven. 24 mars 2023 =C3=A0 10:42, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> The PMIC read test is performed in two places: pwrap_init_dual_io()
> and pwrap_init_sidly().
> In preparation for adding support for PMICs requiring a companion
> part, move this sequence to a new function pwrap_pmic_read_test().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 32 +++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 15789a03e6c6..5c500be48f7c 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1455,6 +1455,18 @@ static int pwrap_regmap_write(void *context, u32 a=
dr, u32 wdata)
>         return pwrap_write(context, adr, wdata);
>  }
>
> +static bool pwrap_pmic_read_test(struct pmic_wrapper *wrp, const u32 *de=
w_regs,
> +                                u16 read_test_val)
> +{
> +       bool is_success;
> +       u32 rdata;
> +
> +       pwrap_read(wrp, dew_regs[PWRAP_DEW_READ_TEST], &rdata);
> +       is_success =3D ((rdata & U16_MAX) =3D=3D read_test_val);
> +
> +       return is_success;
> +}
> +
>  static int pwrap_reset_spislave(struct pmic_wrapper *wrp)
>  {
>         bool tmp;
> @@ -1498,18 +1510,18 @@ static int pwrap_reset_spislave(struct pmic_wrapp=
er *wrp)
>   */
>  static int pwrap_init_sidly(struct pmic_wrapper *wrp)
>  {
> -       u32 rdata;
>         u32 i;
>         u32 pass =3D 0;
> +       bool read_ok;
>         signed char dly[16] =3D {
>                 -1, 0, 1, 0, 2, -1, 1, 1, 3, -1, -1, -1, 3, -1, 2, 1
>         };
>
>         for (i =3D 0; i < 4; i++) {
>                 pwrap_writel(wrp, i, PWRAP_SIDLY);
> -               pwrap_read(wrp, wrp->slave->dew_regs[PWRAP_DEW_READ_TEST]=
,
> -                          &rdata);
> -               if (rdata =3D=3D PWRAP_DEW_READ_TEST_VAL) {
> +               read_ok =3D pwrap_pmic_read_test(wrp, wrp->slave->dew_reg=
s,
> +                                              PWRAP_DEW_READ_TEST_VAL);
> +               if (read_ok) {
>                         dev_dbg(wrp->dev, "[Read Test] pass, SIDLY=3D%x\n=
", i);
>                         pass |=3D 1 << i;
>                 }
> @@ -1529,8 +1541,7 @@ static int pwrap_init_sidly(struct pmic_wrapper *wr=
p)
>  static int pwrap_init_dual_io(struct pmic_wrapper *wrp)
>  {
>         int ret;
> -       bool tmp;
> -       u32 rdata;
> +       bool read_ok, tmp;
>
>         /* Enable dual IO mode */
>         pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_DIO_EN], 1);
> @@ -1546,12 +1557,9 @@ static int pwrap_init_dual_io(struct pmic_wrapper =
*wrp)
>         pwrap_writel(wrp, 1, PWRAP_DIO_EN);
>
>         /* Read Test */
> -       pwrap_read(wrp,
> -                  wrp->slave->dew_regs[PWRAP_DEW_READ_TEST], &rdata);
> -       if (rdata !=3D PWRAP_DEW_READ_TEST_VAL) {
> -               dev_err(wrp->dev,
> -                       "Read failed on DIO mode: 0x%04x!=3D0x%04x\n",
> -                       PWRAP_DEW_READ_TEST_VAL, rdata);
> +       read_ok =3D pwrap_pmic_read_test(wrp, wrp->slave->dew_regs, PWRAP=
_DEW_READ_TEST_VAL);
> +       if (!read_ok) {
> +               dev_err(wrp->dev, "Read failed on DIO mode.\n");
>                 return -EFAULT;
>         }

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre

