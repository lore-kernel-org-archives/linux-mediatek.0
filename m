Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEB8C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfEbC+QvlmYRFEpM334dDDmHLZzT53TFZ7pAp7zhwe4=; b=lhi8gVKxtfFPmy41uJOT+UrlIA
	v/OMxd49IYmpCZo8FEnxaBCcM9psgEvuExKDz0I0ChRLtOPas3WpbsmM0Ekok1PFVDx4KHAjTxdDa
	Lwii5cV+U9QjSqABtlFlUiO5nPc6+Ec9BBslK8wQETEE2RhO4SuI7FSRwmEOiTM+GxpRSp/XG+BcI
	yIBwHyhjvmZIxAIAV7gBlLC6M0gFTsnI9qJPefA4hRcN1AQ7EMhcFWODyD1fFCrfCxL0+nP0eVgnG
	oQNrwedzgodfNSQJG+MVZ0KyRebIJY0vQawOf3oXiffWYJV4hJaSs9gMRfPv4pBfAN0d5NLjIngi0
	IDfNPvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5Wy-00DiuP-2d;
	Tue, 28 Mar 2023 09:22:16 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5Wv-00DitW-34
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 09:22:15 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id i6so14183596ybu.8
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679995333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfEbC+QvlmYRFEpM334dDDmHLZzT53TFZ7pAp7zhwe4=;
        b=O+6rpHUxMrocg+PNRSUNrl09ruDw8nFucVYoEuKiSkUoYU+rAaaZhtmXvt6TdGkwNP
         M1b8yBJvevc5Zt7Jyzawt3sUx2+8btHWzfMFZYbqpV5ujpvuCnm6uUn66khGbaDrI4/b
         BnOZaXOaZ1QBeFNUU7FRBwi2CjsBQzbK8g1XLS5nhmorHOweLMGd0v+/YX2qMdHObYeV
         flOhgDotNum9SI+7uxyc4MfExqnGRtrmIxceFdg59KEnFajy5Cv80DUd+NdLRx8k3RA4
         7LEesg4hoH8OgLFhlxClH+aKYg8loDZNrIsxSLEo9AIGjCJ+YOTdQbIxwY0yUZUkHLT6
         Rexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfEbC+QvlmYRFEpM334dDDmHLZzT53TFZ7pAp7zhwe4=;
        b=M5GJy2NzTiiOcpMpxe1uxW+rHWQGlcRVTxqdWp00y9xrFvrV2TqF+5MhMRgCwIjM+W
         qfs942qyQYVKi7dslAERHoFahU9PqJpE4/MYFeLELCZb8bxpRTn2Fqbq0KDBreL6rS0Z
         fUEWVBkYJiecBZYGU1fTNy73V5621QaQ3Tw5VUrsM+s+ZKYZ345/4BZex4ImJasI8ho8
         ChGyKw3vxixHbOEFqOJwlCvtldG3fdsoVsF1q3Cl34jHlLyhaYdmtW/MU77s6v6YM0dZ
         e56hkN/WUTzbzTtlXvL0rBn5Sr2sazOeIgVTFJt6bP3MH9vjaWrqNsppJ7+O9VeeZxMe
         YaNg==
X-Gm-Message-State: AAQBX9fJxTNlrU2jdDZ0/IZ5/03bk7NaABDz5MJXmmGD/jxUwQx0+pG+
	8A/On1lQSVh3iMwuwSZsVGa7PCTCQu4VtJVWoVya8w==
X-Google-Smtp-Source: AKy350auimLGCr8ILoBzGItiYAiR4pgO8LPEdWrnD1Vk5Z4GVtmW4pyg+5kEg5lZTH5zOTSGFwsCl8xX2CPkdVQT06U=
X-Received: by 2002:a25:a2c3:0:b0:b78:1b26:a642 with SMTP id
 c3-20020a25a2c3000000b00b781b26a642mr6658558ybn.1.1679995333140; Tue, 28 Mar
 2023 02:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com> <20230324094205.33266-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230324094205.33266-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 28 Mar 2023 11:22:02 +0200
Message-ID: <CAFGrd9pjm97+Et-auw2rh4nWUJAcqXzy2cix42QJRx4UHNzq2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
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
X-CRM114-CacheID: sfid-20230328_022213_986751_EBF10B26 
X-CRM114-Status: GOOD (  14.40  )
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
> In preparation for adding new members with name abbreviations describe
> the struct pwrap_slv_type with kerneldoc to enhance human readability.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 5c500be48f7c..a33a1b1820cb 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1218,11 +1218,17 @@ struct pwrap_slv_regops {
>         int (*pwrap_write)(struct pmic_wrapper *wrp, u32 adr, u32 wdata);
>  };
>
> +/**
> + * struct pwrap_slv_type - PMIC device wrapper definitions
> + * @dew_regs:      Device Wrapper (DeW) register offsets
> + * @type:          PMIC Type (model)
> + * @regops:        Register R/W ops
> + * @caps:          Capability flags for the target device
> + */
>  struct pwrap_slv_type {
>         const u32 *dew_regs;
>         enum pmic_type type;
>         const struct pwrap_slv_regops *regops;
> -       /* Flags indicating the capability for the target slave */
>         u32 caps;
>  };

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre

