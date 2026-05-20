Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DAECD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=; b=OiNpE2WLbb4VEB9XRp23fQLWEE
	S+jXyjddUpfoaj+qkt0OfDf6vxm3SPVbXx2mgLIhr4m59RTxkk/7XtnBzSUqPLAVUSu2Eehek1Yb5
	rTDKmysrJ0uGz8oVK1keO4dM4chE5RC5PIPOOFDHJ94lDd0FA/mvQAZQ4YYJEdJ+CliDOLLKtX9+v
	qhHeejLukgkq53ut7FJolsj/vkc+l/nsDHg2AU5u/Ab2XLogtQrd8Ajc9BcZGXapaXV/9hQMxFl6T
	k5KHpD7AVFJGvKsChd380VKmqLY+CTQmplbP0bnGVPGY966L6P2SYSi7E4lG2Y1cifR1TU1PqtuDe
	tZnLFSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgSu-00000004cOI-3yd5;
	Wed, 20 May 2026 12:56:00 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgSs-00000004cNK-3g9e
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 12:56:00 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-65c52bb5dd7so4651743d50.2
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 05:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779281757; cv=none;
        d=google.com; s=arc-20240605;
        b=Wh7SnSjeTeH+InQaPPJElML9c6Z2ma07ESF2aY3Bq1SCyJskRftIayni4GPdU9E9ql
         8gps5q8Pojn0piyaKGl1turCmS0GkuT4l1BYuaEb70z9MkHswt4SiMYOOfLg8NSxS2NT
         a7aPW8gEgnZcOedMRrWWBwaz/av8U5+9u5mg7UqHp5fYjtjds6ySDwUr/tCals4Q5gfe
         r0mNmeY3PgNyjEb1WAnIQvKZpNd3dG7+44s1L01Op7DW3IhFegvTT0dB/Hg7z6LNZPPm
         bYE8ialkYR1PV1fXVHC6fTHQslnebFk+pGXGh9T0PyUpAcoh6AN5dbY1VoPbfi+gau6O
         U6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=;
        fh=/o9xgxk3UtSE2ClK3OwJM/wJyotJ7HR5xKCSZfPrhoQ=;
        b=lvopbN7e0wHHGNOMm3IbkEaVUw1wMkK9skUyrSNsKpvv5aU3f17+7/uFYGLDaupmmi
         x7q5tRBydJFfZW2zXeP/aLMWWUKgP3O4KtmjrKJZY1QsPMA5AGEdnwqw8dLo/KHBaLpQ
         uIKGKPMcNrwu59RjnNZLdYD9aX/5UDXuAb8+ob53zP7P5GPNQYzWragz8gJ+DcNRACv4
         98onaaP+yAyAGio0UvbN3XDnsI4w1zOd48nya8GuNTiGAtOSiOauDITc4GB/Mwhq2OYA
         WKgQanqKlRvaWsJquhPYNiCFTesBBQLOg85Mvf1L1TCYeD/z7TPDVmLiNzIQQ8POuIfs
         Vnuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779281757; x=1779886557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=;
        b=LkKFTERuWHDYJcBtUmLZo/4UVOcUjSdVkH+UphlXjhX4HTC5Pr4KDgfE/8hSMKkmYM
         +3wvEDPH4ElegW2bZlZraf5SLP2PtvQOjIeDMFWH+K8Rb0E/NlYMw+LTFgycoseKIVDS
         71NiZluRJkVntDAQIONsGAv0iR8ofiBPBkQ9hYKVjaXGRmr6ZDUcrofTKmKTJ2Svzx4k
         JamQsgcUCnu3mrCzwLYD4eWXAkNi6Csqrla70+HgwW8t+eDeDGWo0kTWgq88StJ/3ozU
         Cms6luTnJ2LvluA9gh98G+31WppCv3Yml9MDq6FQjg1ifAelFO6LgxQRxRkDWNwKYQXE
         mGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281757; x=1779886557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=;
        b=Hfxeb+Ly6Gz26wYGueE1VpffZ4PHRfj5O6kebYaA0NTrEPB20NLtgKGt++3jqKZY6f
         qYKW8qkWi5DnMf1QBs4HPuSUK9sG4NIgwpTL/ouOhEZmzvwTwU/yfHPp7xvo8WsYsZnk
         ufEUHVgTrVAO79DwLaNCmJtQMJc0i7zJVcpnHN/oK4JHCd2Y4lz1k6Qw/r7cy1WKwXTu
         J0trB/nGUF7Oig4ph63KyX7Fk/VdO2gzB3PxWxLJmUzfjiWQ2kdmWeYB5RL4OpbhA13k
         2HjCeAYnmsHwPKUFoa1dGxU3GfNySwLNszyy4k7R7Ml8Z8oo4INTaxekI6L9oy7NPM+t
         YOkg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZBMWIUY3HMctRFlgjKB/ZeMTFR0gKE3VmSC1Ne83W9IOjQo3u0lr+T25mg/IziMr2PauaR6wD9NDk9qfPYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4zlxT88/lEVT6DGsYKLCTi2p2qzOaamP/b7UStmAjCVLaKJRK
	Cp365td0Y0RYbJdM0EpLfONft/7aaO4RQjfJc4r6f6ALV3Ii5CaT9d+miya3Im04mQ0ed4WQtsf
	RTvzqhjZ9boJvVtQRY0TQkyPcpgEXTJw=
X-Gm-Gg: Acq92OHSk1+INIozZIuOoEhWuLIT5wWlBGv6wZVfu4hxab5wfSJy7EO3ciX13DDjn1a
	NYnWmNvEgFgY8kXud6ksKjnwUl/mrG6K/FOrg6bGWbqvsnuGQYFApy2Qn6r80iRL8t7ZTshaKbc
	NZITwn4EV0y+LR/F0dxmHiOZmowHriKzNktGPkYvx9KWShuAM/SMhAYYjYwxe6DDh+uTFK48MHl
	v/684QodXJXrcB6KTOx1TSGdvwbapy9gF6Sf8MWuFcBGZsP+r3b/kX1Kn1wYTx41ZdfPg7uSJs0
	46aFgOrqaBT6yh3Z+48miHUjclvrkDAxooLe+nrjWWJtsZ0PjOt8x/bHJixZ0y81GYww9Q==
X-Received: by 2002:a05:690e:4293:10b0:653:f72:f482 with SMTP id
 956f58d0204a3-65e2275e8fbmr18516144d50.22.1779281756819; Wed, 20 May 2026
 05:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260520021500.13504-1-liujiajia@kylinos.cn>
In-Reply-To: <20260520021500.13504-1-liujiajia@kylinos.cn>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 20 May 2026 08:55:46 -0400
X-Gm-Features: AVHnY4JAx00s9RY77VuK7Nfrn9COGaPLhAAlt5GNCqKcZP_N4w4YPkGy2JQbhi4
Message-ID: <CABBYNZLLNFNuSv0UBNQ7C2HTTg5W2m41hBTNpPw822GMAVNuhQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: remove extra copy in cmd array init
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_055558_924108_C701A6D5 
X-CRM114-Status: GOOD (  16.71  )
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

Hi Jiajia,

On Tue, May 19, 2026 at 10:15=E2=80=AFPM Jiajia Liu <liujiajia@kylinos.cn> =
wrote:
>
> In btmtk_setup_firmware_79xx, the data length indicated by wmt_params.dle=
n
> in the cmd buffer is MTK_SEC_MAP_NEED_SEND_SIZE + 1. Except for the first
> byte, the remaining length is MTK_SEC_MAP_NEED_SEND_SIZE. memcpy copied o=
ne
> more byte to cmd + 1 than the remaining length. Align the length passed t=
o
> memcpy to avoid exceeding current section map.
>
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>  drivers/bluetooth/btmtk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index ea7a031000cd..53cba71cb07f 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -188,7 +188,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, c=
onst char *fwname,
>                                        MTK_FW_ROM_PATCH_GD_SIZE +
>                                        MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i =
+
>                                        MTK_SEC_MAP_COMMON_SIZE,
> -                                      MTK_SEC_MAP_NEED_SEND_SIZE + 1);
> +                                      MTK_SEC_MAP_NEED_SEND_SIZE);
>
>                                 wmt_params.op =3D BTMTK_WMT_PATCH_DWNLD;
>                                 wmt_params.status =3D &status;
> --
> 2.53.0
>

Have you tested this on the actual hardware? If not we need a Tested-by.

--=20
Luiz Augusto von Dentz

