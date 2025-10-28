Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8A2CCD1BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lEnOrPU7t9BTi0lIm6AXk0/RgDoLHUnhIVJitTcT88=; b=BOvyuP8zo7IByl6UpfcYxror+u
	AnPXj0KG3JpZrJ0LGnSPG8nHT5UKT/OcgBEgZNYLa+PfZklynkFw3thhL0Bk7V5UgLm5ceICLpBRh
	7fVXbkVwyfwuJVVD9/3ntQ4MNmVy5vesJ39cEeN/IBGO5wG3nvUv2YYNJsKce1zclFUsxitO0eehX
	vD1cPXQxVdRp2zvvJj0ZhnirJNdSrKuvNGN6h/LEXR2UZub0j2aBXZaCQS1mT0/6gMCsR9Pa77kGU
	kfAW1Bu1+OQapFASVsuXU4WUERvkzNXmfXa2juBMVxKUFhOYSqVVhpN6u/no/l6kJpD222TDKzf1T
	iWNUXfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqAq-0000000GbVC-0aj8;
	Tue, 28 Oct 2025 20:20:08 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqAn-0000000GbUl-3IgB
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 20:20:07 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-63e17c0fefbso6955605d50.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Oct 2025 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761682804; x=1762287604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lEnOrPU7t9BTi0lIm6AXk0/RgDoLHUnhIVJitTcT88=;
        b=fkdP/sLl+9dkONw16xgDdJAllMt4j3LDFU54ar7JNxI/TWCAKDDpia1GMX+g+CuAmy
         4ZeKjcz+NqxNJKuMA8sdH6+94RbZZ3sr5QDyBbv+o2GPgfn9z78C/vYxv+dV4d2FmeYu
         uxK8llK+lp0urpeNn4dRDt9tlmaIZoOje1bjRV156xS4+qLYumAS3v912sGlpKu/bZ4X
         VCWI9u9QNecNaCVTp+/+1+R9w+aH+iOMjY4GFY8vs9tfhn39HblzF4ynsnhEadramkmO
         PJKfNkpYmYYiRp0YdU44HIWoaXhWfyXq6aHVt82+2NatjyjOaXdOZM4A+iqotP9+SjKo
         zMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761682804; x=1762287604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lEnOrPU7t9BTi0lIm6AXk0/RgDoLHUnhIVJitTcT88=;
        b=NJroXhMWNzthVltCBR49YobpA95cUhEkGQjKqWRmjtWMNUgcS0vTz7wZMwvzh0TJwH
         uLA2QalgXIeY2n2Pz+/bGDMo6pFELdcltqqfEZa68ZkXBkA1kHoB6hePE3sBGttBHFN1
         dzMui141QbMg2ZsObYWSuwp1vpdgsfj6OaysW7lwArJ+Od6+i/4/+SjYjMRWSLT3j1gJ
         GJ7/AhKnwC7e9deOAimdwkHk8SPbmhKNhOU2hL47tIwSjhOorZfqtKjBzOROWbmByRTV
         ZaXGj9ytY0A4tirzxESC4hNRJQyJexQmvmxV7cm1XltuBJae4Lr6F/+QQ4ncT6qPmsG/
         yQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX/zqSGrZZtNFEm7luzuZOV6nX4iE8aq2kHjoWBddV6UnjAnolS88f9m9Cd9XSRmpCfaZ61KrCwsVxiDwnMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2XDBWmV04dHQ9xIqRQL2xH2z/X9adbIvyVvRTsz9hHFyCDhPr
	Xxm1EQtTz6+OJVJWYWgh2y8eYr7wjqfW3rnQmF7raJD78r8GaKnCsqqzQ3lTzBpZk5fd8Tl7xZ6
	5QYQYVNOoQn3WimVQ7BX6JKNTpWB8cvM=
X-Gm-Gg: ASbGncsp7MXqf/O7nLQ0djjxDL4vxecchjwSzr/Is6QcfrhHAJU0GkjVI9Gike+4/mQ
	kGGzNVv+pmhV5M4DKpRtwuQO0k/C75fTPAPSlLfTzvgmuJ8S6DnfOWwFxdoi3pLEPUhiNB5zzuV
	MEDW/9F5v0CG7WXbueI6GFbQWXcyUrc9h20A78fXM8D4wTwiwjtA3aS+PfB2MMQx6sR0cHAANSe
	DsF4BevDpFtPU4f6DPr8aSyk/D610/iMupBpyoCquIP0Jo9YDrPKlZbGeA=
X-Google-Smtp-Source: AGHT+IHgKGGElaUgkNdyxfVG3niQuHRbpKqrhRCCJLjNWkcWpoez/iaqA+lCNPGD4ysIgKN9cdylbUkkCIi+yZAgSns=
X-Received: by 2002:a05:690e:42d1:b0:635:4ecf:bdc6 with SMTP id
 956f58d0204a3-63f76dcb9eamr529307d50.40.1761682804232; Tue, 28 Oct 2025
 13:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251027171759.1484844-1-cjd@cjdns.fr>
In-Reply-To: <20251027171759.1484844-1-cjd@cjdns.fr>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 28 Oct 2025 21:19:53 +0100
X-Gm-Features: AWmQ_bnFo7mm_j1RGqm_idjiztE8WhG05zba6SQTIj4ViGB8NtmMx-tKQzB1yd8
Message-ID: <CAOiHx=nSEP=4s2xZuPtLEO43YDbkNEYzw6V11JbXG0H2iPn7Ag@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big Endian
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_132005_876781_9DF081DB 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, Oct 27, 2025 at 6:19=E2=80=AFPM Caleb James DeLisle <cjd@cjdns.fr> =
wrote:
>
> When on a Big Endian machine, PCI swaps words to/from LE when
> reading/writing them. This presents a problem when we're trying
> to copy an opaque byte array such as firmware or encryption key.
>
> Byte-swapping during copy results in two swaps, but solves the
> problem.
>
> Fixes:
> mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
> mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
> mt76x2e 0000:02:00.0: Build: 1
> mt76x2e 0000:02:00.0: Build Time: 201607111443____
> mt76x2e 0000:02:00.0: Firmware failed to start
> mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -145
>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/net/wireless/mediatek/mt76/mmio.c | 34 +++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wire=
less/mediatek/mt76/mmio.c
> index cd2e9737c3bf..776dbaacc8a3 100644
> --- a/drivers/net/wireless/mediatek/mt76/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mmio.c
> @@ -30,15 +30,49 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u32 of=
fset, u32 mask, u32 val)
>         return val;
>  }
>
> +static void mt76_mmio_write_copy_portable(void __iomem *dst,
> +                                         const u8 *src, int len)
> +{
> +       __le32 val;
> +       int i =3D 0;
> +
> +       for (i =3D 0; i < ALIGN(len, 4); i +=3D 4) {
> +               memcpy(&val, src + i, sizeof(val));
> +               writel(cpu_to_le32(val), dst + i);
> +       }
> +}
> +
>  static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
>                                  const void *data, int len)
>  {
> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> +               mt76_mmio_write_copy_portable(dev->mmio.regs + offset, da=
ta,
> +                                             len);
> +               return;
> +       }
>         __iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(len,=
 4));

Maybe just replace this with memcpy_toio() which does no swapping at
all instead of double swapping on BE?

>  }
>
> +static void mt76_mmio_read_copy_portable(u8 *dst,
> +                                        const void __iomem *src, int len=
)
> +{
> +       u32 val;
> +       int i;
> +
> +       for (i =3D 0; i < ALIGN(len, 4); i +=3D 4) {
> +               val =3D le32_to_cpu(readl(src + i));
> +               memcpy(dst + i, &val, sizeof(val));
> +       }
> +}
> +
>  static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
>                                 void *data, int len)
>  {
> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> +               mt76_mmio_read_copy_portable(data, dev->mmio.regs + offse=
t,
> +                                            len);
> +               return;
> +       }
>         __ioread32_copy(data, dev->mmio.regs + offset, DIV_ROUND_UP(len, =
4));

And memcpy_fromio() here.

Best regards,
Jonas

