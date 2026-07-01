Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D14CC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXa34OubSbzCty4qUjMoYcxwd7ic9Igd3aMKODlP5w8=; b=UmW4SKYp9FkzrAK7FoCPJEN3Dk
	WHPj5PEWNx3IsKsC93fc9WvHyoW3x/6dTP3oJUvCNOon1ZtCGqTzlp2jlzzl10llcvcXnDFMY7ALa
	pN/z7c6ft2TaLihwxKNL4p4jtgAXR0RUQgD5HHnnX/WZazYMAGE2Rvc32+hQKjzzaMQNZ08vLf7g5
	D1sMh9doT0kkxOPmTwit4itp6fQB7GqxFl1VHPHkXb9kx+ZsljhtRvYrwOqfdQbaXIskH7w2dGasR
	ldzT/YrIxJjOi3lTWE+5lXxbj64ZYHJ0nri0RaaO48Sz/eObcl2FGnmQMp3eu/cKyy7FJ6Mm7dmF0
	P5nJKdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexHP-00000002RvE-1APg;
	Wed, 01 Jul 2026 15:55:15 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexHM-00000002Rua-31Mt
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 15:55:14 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-664d4478a64so930603d50.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2026 08:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782921312; cv=none;
        d=google.com; s=arc-20260327;
        b=YD8xgxvnlmTaWl64K3JOC/4UsauvoafGMk7HXgKIDUFYybtfLom0APCpLeSKqtjXOO
         2dj9HUD1gUkpM3I2OCdjlJcqEc2EzCxK9qUSX/5dADL4GchJ0CTRFNra9Y89T9QbDwYK
         RD2ogenfcufVRYD6w3h2Q0bUOQOWrxFHnW6DoUrO2/4F+h+NHAv3ZZzZNW08tlIGuCO8
         64oBpoKN3xualNq25GMyjqV1HBTwsbpRoBS4eW+GHlMhBHOkMPMcZniid1zc9VuOOhSz
         DDNYOLgSv7T8Fzw6jNdUxV4l56bcOefFTCWqMQIeCksfaLgNudVetX9sT/yuiy0Q19ZX
         unng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PXa34OubSbzCty4qUjMoYcxwd7ic9Igd3aMKODlP5w8=;
        fh=uSBY8Frv5ylcgGGbXJrRJoQBRCqPOR9o6v/ETewQ+70=;
        b=GyCDSCWwSSADG7umRbW2CqwRnD37L+r4WKJrq+50UcYFWOcXjYEh+UqzQaOudAu/Mh
         ydB50qbR/dcTKn5RJ28jTFj0DLppYOgHceLjIsmmfBoxVevAwZAYHWlXgxjbKJdXP1ps
         gJq+IiWSB25NBptNTEKP36Kb1Uq2Y2irtopDlGIgP15zMu6mc/rikFelQbLVcvHJStb3
         ZCCsExsR8eRIQ2MrtycGpGduDRzUEkFRuyA/Ru1qDfX/o/YVeUrD1g/3rPI+nPqE5QuB
         T5JC/1J93ebTxNNMBaNI2XFSmCIZVIoX4O8yVXlLO23DVpF/UedimDJJ7KsCWCQI40f9
         SM5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782921312; x=1783526112; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXa34OubSbzCty4qUjMoYcxwd7ic9Igd3aMKODlP5w8=;
        b=pSQu3+gf5oc7fnGu4dyO/Duq8QfEOY2aw0a/noTrGpyH1l8EEW12T7QcIMQEAmQnr6
         0WlNGhqZftmbjPTyD8W5yOhdDmXeGATEtAMBfbE1Dti589NfXsPavDkOmDuihTCv2UWK
         vPbkB0xw4A+kwA0eP8rAaEHZQqBsuv13tbEgUKh5m07RCASS4HQwa8hlPGdR18Cc5lgx
         w7/oxGBUnPclCshsQPzKV7AN/Ble1XrFhl9X4zywlkHZcNW+9QswO+hgoJpg+kCMvumS
         MhHho1I67y/94GFM/F12ksEpxkAEwoee8d7DdED7CCA+KShTR/kIvJ06aJPqxFUWMoZp
         h8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921312; x=1783526112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PXa34OubSbzCty4qUjMoYcxwd7ic9Igd3aMKODlP5w8=;
        b=MHTehxaeIblHsupcYHnwIM95wzT3qoyDjf9iKwS8OAF5zSJkEct1Bmkv/TE4ugtRP5
         65i4a41ZCrdNStjUegE9ciSfAMhTWpJ2zd14sPTY9ZJoI7cFKGgZQFfYPTFKKHz2ZtBA
         2oIHcR4SRZiiCEqlegcIv7rRYb40byGlKV2UMEyeuquOGDbYVDK9w4JBBZPkHmyTwCRW
         YCtv4GCsbVO5cnj60oFR+0/WY6YX1MOOEUNmX1FEOrKvs4b6MISfU7EdXj4UPVLAgRc2
         5QgOvEkU+gZttC8A/RUjk4HldCyy614YLnUqbFuNVKPFpU1u0TU0w/3kNHGBgsmOLHog
         3loA==
X-Forwarded-Encrypted: i=1; AHgh+RoSSbDH6ALF8JbZmmpTdnROh8uXd2fXZKXUEDt82kVB7IqT2z8xj+vNZ05T40C8+E8ev8C1eG+rVInswgN7cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWy2JdKMRkVQ+jDKRFgkKUK1BNPJmOP5dxfLrNDZHRb0UdoPUe
	vcn9pl8ZpxQAU5dMc3nsH2+4HdKtME5dF6garHzEThzPi5Q4YRt4yYYOSAHNR/rHtxRJWntrEOr
	sRrmGbRx0IETMRLymd74vMdg1K7W4Erw=
X-Gm-Gg: AfdE7cnUmrGSYgdy+hwow/XHc7ynTcUhw/lzXnCdL7sx/I0iceJwTWE9RDcfxmWzUVZ
	uR/Jv3lo+FB0zF5z8vpXLhFyblUUJdOUjJ1lBBv6DZzJOyYlkXeWROTRXK2QnC+4+bJay0o/H9+
	JUoVon3IqEhs/77wEhJp7LGTOZfBkNR/2sZiZLTCFPKktxr/fqDE0ZcX6K2GRwa0CD8zPN/uyDO
	IFW19ieXXVlsDJ0VP/8Dt+1iSpE/JY/gPXuSk6mw6VWCTOE1N/z1TEBdGO73irSChN1AfDg+eMg
	ajhfduiy+cjrwqHApvNP4s9Fk+QFYgBzknnBRdDpTTE3GyIXklAN7f/IFmkbtSUYKTE=
X-Received: by 2002:a05:690e:1449:b0:664:c053:d6a2 with SMTP id
 956f58d0204a3-66521a0acd3mr2114483d50.23.1782921311536; Wed, 01 Jul 2026
 08:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260701121345.1231906-1-chris.lu@mediatek.com> <20260701121345.1231906-2-chris.lu@mediatek.com>
In-Reply-To: <20260701121345.1231906-2-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 1 Jul 2026 11:55:00 -0400
X-Gm-Features: AVVi8Cc0zrlvMcYjXiLQwVVmWaxkK7Jt0w4udvPGfPhOH5l9CxGEp5ydFE3Z1pA
Message-ID: <CABBYNZKOD8xFk2PVcKAqB=wYnhtSyDOiUTaXSOkumMF5o-dwxg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] Bluetooth: btmtk: Replace magic numbers with WMT
 packet flag enum
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_085512_769378_3057CBCC 
X-CRM114-Status: GOOD (  17.54  )
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

Hi Chris,

On Wed, Jul 1, 2026 at 8:13=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wro=
te:
>
> Add BTMTK_WMT_PKT_* enum to represent WMT download packet sequence flags,
> improving code readability. Replace magic numbers (1, 2, 3) in
> btmtk_setup_firmware_79xx() and btmtk_setup_firmware() with descriptive
> enum values:
>
> - BTMTK_WMT_PKT_START (1): First packet of a sequence
> - BTMTK_WMT_PKT_CONTINUE (2): Continuation packet
> - BTMTK_WMT_PKT_END (3): Final packet of a sequence
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Assisted-by: Claude:Sonnet-4.5
> ---
>  drivers/bluetooth/btmtk.c | 12 ++++++------
>  drivers/bluetooth/btmtk.h |  6 ++++++
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 02a96342e964..40c2a64aa6b7 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -230,12 +230,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev,=
 const char *fwname,
>                         while (dl_size > 0) {
>                                 dlen =3D min_t(int, 250, dl_size);
>                                 if (first_block =3D=3D 1) {
> -                                       flag =3D 1;
> +                                       flag =3D BTMTK_WMT_PKT_START;
>                                         first_block =3D 0;
>                                 } else if (dl_size - dlen <=3D 0) {
> -                                       flag =3D 3;
> +                                       flag =3D BTMTK_WMT_PKT_END;
>                                 } else {
> -                                       flag =3D 2;
> +                                       flag =3D BTMTK_WMT_PKT_CONTINUE;
>                                 }
>
>                                 wmt_params.flag =3D flag;
> @@ -314,7 +314,7 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const =
char *fwname,
>
>         fw_size -=3D 30;
>         fw_ptr +=3D 30;
> -       flag =3D 1;
> +       flag =3D BTMTK_WMT_PKT_START;
>
>         wmt_params.op =3D BTMTK_WMT_PATCH_DWNLD;
>         wmt_params.status =3D NULL;
> @@ -324,9 +324,9 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const =
char *fwname,
>
>                 /* Tell device the position in sequence */
>                 if (fw_size - dlen <=3D 0)
> -                       flag =3D 3;
> +                       flag =3D BTMTK_WMT_PKT_END;
>                 else if (fw_size < fw->size - 30)
> -                       flag =3D 2;
> +                       flag =3D BTMTK_WMT_PKT_CONTINUE;
>
>                 wmt_params.flag =3D flag;
>                 wmt_params.dlen =3D dlen;
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index c83c24897c95..51c18dde0a80 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -66,6 +66,12 @@ enum {
>         BTMTK_WMT_ON_PROGRESS,
>  };
>
> +enum {
> +       BTMTK_WMT_PKT_START =3D 1,
> +       BTMTK_WMT_PKT_CONTINUE =3D 2,
> +       BTMTK_WMT_PKT_END =3D 3,
> +};
> +
>  struct btmtk_wmt_hdr {
>         u8      dir;
>         u8      op;
> --
> 2.45.2

Ones last issue regarding SDIO from sashiko:

https://sashiko.dev/#/patchset/20260701121345.1231906-1-chris.lu%40mediatek=
.com

--=20
Luiz Augusto von Dentz

