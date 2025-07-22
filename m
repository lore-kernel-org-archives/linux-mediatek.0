Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA98C83F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=; b=PS/AXKEN4M+rN89jyyOlRoRRvg
	WvmS3FJi+Bf/hv+vXk/IrxPHuDk33HhViDaFzUhxQdpzokWfBlb54p10fZiCuT2UK++vzjZl+BD8Y
	vC7w8DUALoSZKOSrkVSgGtWsKBvPfxYEFo1AJSGvSq3UGoWxHuZvjac18U22J4Ke4H6VI8I5tlT0g
	l0mwiD2w6EYqJX0Hcs+9g6zQNpMW7VIj8Z3TacNBEeHHKpm2EwzrknuKEqGrN/wdoGflKR+/q8Ckg
	shYQrRCRxeoQnDXBY3EUxMBYwND78dAXLkiTovn7w85PepcI0EU1OAc+dDyqDnphCw8qOBQYKYRpn
	cF0hEeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7eb-00000001iJs-1mfu;
	Tue, 22 Jul 2025 07:43:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Zu-00000001hKz-32Zv
	for linux-mediatek@bombadil.infradead.org;
	Tue, 22 Jul 2025 07:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=; b=pzezr+Pz4UtSljpomfc2AckBfn
	0lLQTnw5z8BErgalOaM3pbfXWuk5+YyC76IVg3r+TEbbPdbHVomkmAFvYabj0T3QFjWeqksM5SQ+f
	oQRCnC8rtoEK1pPEfKlSLrrNK7LXslU9bUGd6B6wrs4lqNGPs39j0ky9Tgcq1CfiKkgtYmCkERQv0
	PBspCr5bV47HZ+HcWXTNJxuRR5Y7Y43tfDs1FdrkqhE+CwDvTgLu/yS8bD6vSpRyED4ZpBbdWZQjo
	uqNGrtSmuHMjeqyDRTUfNlov3uIXA0i8FF429X5jJB7Rn93laR6gNwADCHzjLytFv+oJ5xyfhaopj
	grUdLlZg==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Zr-0000000BEAM-1rEB
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 07:38:21 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-32f144d0db8so26937801fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Jul 2025 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753169897; x=1753774697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=;
        b=KAomp+UmzsqjK9yOKliV9aJWnbWRIHRbRk+/iG2e2GC7C3+cjPaTomY1/GgsmSX0YN
         sksof9v6HmcnI3HozqnniqpoIHTiNks6zjYanqQVTIH7gbZBFi8vVxn5jsu5NdQWDb8q
         iqEU4lTxFKbLAGZUXfmKBE/S5otSwKYngq2rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169897; x=1753774697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=;
        b=GGjcaYLD+STjd9h0MBAYbfmw/konUHHdqqGsZrw+1Yp5gDwOzhStkovas2XQpfi2pB
         eV5BDiDQfkqDGaFJMBYDYy0nNFLmaNITDJbNJQvoXfFtndqkNiCVZt8vSEz5mvg1/WKb
         Ce75Rlr56pdsK+Xwrw2guBw+RjTk4IG8D301Dy7mLd1AHMxdi+9jjunwZ8FGenWHgbDo
         y6juTnUA9STfEWExz62CYdD6QfhMa25dwog8yqX2pCkFnGuYhA6foCS2Ww/TJR6+eWKz
         OmzhvSJz3BKR4i9IAAlgcmnVmyj0vZJj8C3h7YFy5FSeiXBBiYfLHHpfShpIS97z/39k
         MVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM7LwMoI27EptahJV/fpa5CsjQEHCbcV91Qu8ZmuhGx4PwWiYpKWN3EIjryp86p1Yv/BYDypJNg1jzuMkIyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXZokX/LKnIySDMuV/gGi7Rtb68Pxy1M8VF2+WuSyQRMQmkSAy
	ukVyCvfWEoCtNONxEXY+PEebOFlaOuxSrpEHyXm2WSHZb9ecHf3KvFsnFUX5vxZjTBqS0n35Sw1
	0gxfAK6oo0x8KOfUSLCR4eZtSj/LaX3lxZuY/13Hd
X-Gm-Gg: ASbGncvNvH8r1Qf/ntIWOHr3fAaANPNeA/SYhHCiQXa8TmML11Sc2xzg9NAHy32+tib
	obfsgfXPtQZUFk4BXQVcm9XFJYvOeWbCHJul2KkDmN4SNRqAZI7F2jAZHUV6aT2BroKp2SaAL7Q
	Qwo4mM9Q7xXXXIP4Nw4MdplY+Bq817popqobxcAsG81KnwGJeYRFQVYbM02X+ErPp7ZkFT0OphW
	WlQpBtOLXwc/0MTyyMop2biQOBXUBRaoX4=
X-Google-Smtp-Source: AGHT+IHIEXGhSQKNLTR3joj0qjwcB1T77Dp8iSOMV7/+3N11OuF7i8eFvD4xY1tQQW+z6w+ni2WlHZTcDNTAtH00llM=
X-Received: by 2002:a2e:b8d1:0:b0:32a:e7b9:1dc9 with SMTP id
 38308e7fff4ca-330d24f7ef4mr6438751fa.3.1753169896490; Tue, 22 Jul 2025
 00:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-2-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-2-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 15:38:05 +0800
X-Gm-Features: Ac12FXx-ybyxFVMO-dZm2uMvhIKao-9eybKP9nlbQtMW_02h967WNikXB-wqqjk
Message-ID: <CAGXv+5HQcGiUnsaOxHz86Y8JxUHh6e0ypusFEBLKchNx3fqKBA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] ASoC: mediatek: common: modify mtk afe platform
 driver for mt8196
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_083819_704160_0ED80657 
X-CRM114-Status: GOOD (  23.12  )
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

On Tue, Jul 8, 2025 at 7:33=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Mofify the pcm pointer interface to support 64-bit address access.

  ^ Modify

And the subject should say the same, or shorter:

    Support 64-bit addresses in PCM pointer callback

> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++-------
>  .../mediatek/common/mtk-afe-platform-driver.h |  2 +
>  2 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/=
soc/mediatek/common/mtk-afe-platform-driver.c
> index 70fd05d5ff48..cab4ef035199 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -86,29 +86,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_=
component *component,
>         const struct mtk_base_memif_data *memif_data =3D memif->data;
>         struct regmap *regmap =3D afe->regmap;
>         struct device *dev =3D afe->dev;
> -       int reg_ofs_base =3D memif_data->reg_ofs_base;
> -       int reg_ofs_cur =3D memif_data->reg_ofs_cur;
> -       unsigned int hw_ptr =3D 0, hw_base =3D 0;
> -       int ret, pcm_ptr_bytes;
> -
> -       ret =3D regmap_read(regmap, reg_ofs_cur, &hw_ptr);
> -       if (ret || hw_ptr =3D=3D 0) {
> -               dev_err(dev, "%s hw_ptr err\n", __func__);
> -               pcm_ptr_bytes =3D 0;
> +       unsigned int hw_ptr_lower32 =3D 0, hw_ptr_upper32 =3D 0;
> +       unsigned int hw_base_lower32 =3D 0, hw_base_upper32 =3D 0;
> +       unsigned long long hw_ptr =3D 0, hw_base =3D 0;
> +       int ret;
> +       unsigned long long pcm_ptr_bytes =3D 0;
> +
> +       ret =3D regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lowe=
r32);
> +       if (ret || hw_ptr_lower32 =3D=3D 0) {

I'm not sure how the hardware is, but I think hw_ptr_lower32 =3D=3D 0
should no longer be a failure, since it could be 0x100000000 or
some other address with the lower 32-bits all zero. Instead the
check should be done once the addresses are put together.

> +               dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
>                 goto POINTER_RETURN_FRAMES;

This is out of scope, but maybe this should just return zero directly
to simplify reading.

>         }
>
> -       ret =3D regmap_read(regmap, reg_ofs_base, &hw_base);
> -       if (ret || hw_base =3D=3D 0) {
> -               dev_err(dev, "%s hw_ptr err\n", __func__);
> -               pcm_ptr_bytes =3D 0;
> -               goto POINTER_RETURN_FRAMES;
> +       if (memif_data->reg_ofs_cur_msb) {
> +               ret =3D regmap_read(regmap, memif_data->reg_ofs_cur_msb, =
&hw_ptr_upper32);
> +               if (ret) {
> +                       dev_err(dev, "%s hw_ptr_upper32 err\n", __func__)=
;
> +                       goto POINTER_RETURN_FRAMES;
> +               }
>         }
>
> -       pcm_ptr_bytes =3D hw_ptr - hw_base;
> +       ret =3D regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lo=
wer32);
> +       if (ret || hw_base_lower32 =3D=3D 0) {

Same here.

> +               dev_err(dev, "%s hw_base_lower32 err\n", __func__);
> +               goto POINTER_RETURN_FRAMES;
> +       }
> +       if (memif_data->reg_ofs_base_msb) {
> +               ret =3D regmap_read(regmap, memif_data->reg_ofs_base_msb,=
 &hw_base_upper32);
> +               if (ret) {
> +                       dev_err(dev, "%s hw_base_upper32 err\n", __func__=
);
> +                       goto POINTER_RETURN_FRAMES;
> +               }
> +       }
> +       hw_ptr =3D ((unsigned long long)hw_ptr_upper32 << 32) + hw_ptr_lo=
wer32;
> +       hw_base =3D ((unsigned long long)hw_base_upper32 << 32) + hw_base=
_lower32;

Instead the check should be here. And to follow the original logic,
if either pointer value is zero, the function should return zero here
directly.


ChenYu

>  POINTER_RETURN_FRAMES:
> -       return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
> +       pcm_ptr_bytes =3D MTK_ALIGN_16BYTES(hw_ptr - hw_base);
> +       return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes=
);
>  }
>  EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
>
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/=
soc/mediatek/common/mtk-afe-platform-driver.h
> index fcc923b88f12..71070b26f8f8 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> @@ -12,6 +12,8 @@
>  #define AFE_PCM_NAME "mtk-afe-pcm"
>  extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
>
> +#define MTK_ALIGN_16BYTES(x) ((x) & GENMASK_ULL(39, 4))
> +
>  struct mtk_base_afe;
>  struct snd_pcm;
>  struct snd_soc_component;
> --
> 2.45.2
>
>

