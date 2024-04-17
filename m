Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECD5C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 21:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBkaCbNjydmVkpZXUhiI4uQ6IPkbRea+BjBhJXBTlwg=; b=iE0rRIskE12lTE6ykk8x/LpIQw
	T00yqFWu9Ar9l/sjyKIF0XObnn6ApQf8UOy35U+6n5Tm1nNwlgzgreuP6lGFU9deq3VUw/CmO19Xb
	VpRa+X+kgydQuEnxgji+cy3h6eXkn18+5BfeZ/58ehii1Ogvf9GAsPJVfAr2dVZImFEOgog6/V/px
	HKDaKsL6NugGCnNKYqPEpC8RBX96bNrHZsJuHyzaQ04uHhCuUdMw3FkVr9/PKRKCXN44NPvd+tikB
	hDH55dj3qlFX6mxtUx15J/OvzglQpCtBu8av9ZjOVjf2oJa68Z8wQpCfsbVds7cSdfELy05zRuu2A
	lcyvIJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxCfT-000000003Jb-0BNT;
	Wed, 17 Apr 2024 21:18:11 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxCfQ-000000003IS-08I7
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 21:18:09 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so3810261fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 14:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713388684; x=1713993484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBkaCbNjydmVkpZXUhiI4uQ6IPkbRea+BjBhJXBTlwg=;
        b=ULwl/U8psn3nIUpdHBrRwdPlGunZ5jOOAP0p5bbLG9tiBftu6ZTecbGm6xz4prjWYZ
         bXG+4T4LTOjj8TR3ADSdpn3n1647pcDWuqshsQeSIVrfuElyRAKmqN3tZVcvgFSc4/Ec
         vvpnhxVTZusRbChPaiYEM53H5tcwYfcOI3Tf5JrOnlfaa192wTeeh1UYQfTM1roa4aeV
         7dq9B/Q/bhCGtWGJOtW7lhSPcRfw7P2PBX2PRlVyZmZ4hgKxpa9oWaowSA0WT0qK5R5C
         JEIVgMw/MBoIx6tE7LTZErMGlQhjGWCOLb5va1xYx+DCeFVrItTurXnIgyadncF77Z8+
         Rhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713388684; x=1713993484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBkaCbNjydmVkpZXUhiI4uQ6IPkbRea+BjBhJXBTlwg=;
        b=djWO/ZUYRArC2J8y+wl9XWG/UYqox8IC3Gre2yckm8zfWQopKejGjiHgfGhXQvXwAI
         WI2jSkd4Tm+3hE8xPq+H/nE56XucBQZbKStLxS1MrWjlUGfwiH9e7RT5jFO1QCswT1Py
         MYnWTA6vYvEdv05VMqVawgur6ggvH0bO0WwWBGfDKyiRADcGDQSpjgfd+2i2OOFHGWHZ
         G0e/LJbmHVibr0lBl8BuU2g7aByQRWsAGyQyZdqu4LVgVzDjDo2mKzMy+K1SrZ6ikObz
         MaDkk6fRqhHJ647oqtWNevHU1pxYyCHXdwTktR675AxsHD2k4rrpuCjCswBM/2Sfad05
         98bA==
X-Forwarded-Encrypted: i=1; AJvYcCVvlYMG+lRRXgveKzcz0PKdnwLcyGmMPW92QaNOBeGeIDfPUoqk2BuRKxmib1OsHZgXCI/A+5XrF5Ckh9o2FWTN/YjbFIDWIdgwfTrQaw0gk75f
X-Gm-Message-State: AOJu0YyTVeyitN7oAU2zjX4+rLMsz/am9oRh0ZmUYu7OkG1hL5kRMnmV
	T0iMaFZ9UBI/nqctYxgUPr1z6j1cj2Tsiapk1NnhV5kOiJdegXGg7gI3QpXyDq7QRywGEf3NZ0c
	k6pdzJ8U7ofyIsxy3kOY7GHKUkt4=
X-Google-Smtp-Source: AGHT+IFtlAXpGYCpv+bg5gy1IxslsA0lmrPId3jvSe88OrBfqoz0X5D3GoSobh3u3Kz2TE2SrAf/xB9p3nkmG0nVIiw=
X-Received: by 2002:a2e:92d7:0:b0:2d8:6a04:3bcd with SMTP id
 k23-20020a2e92d7000000b002d86a043bcdmr312813ljh.3.1713388683280; Wed, 17 Apr
 2024 14:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240412095713.25641-1-hao.qin@mediatek.com>
In-Reply-To: <20240412095713.25641-1-hao.qin@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 17 Apr 2024 17:17:50 -0400
Message-ID: <CABBYNZJ-rvMuqHjFmQuxhmWv_K5fGFktAk-CeZfx8rw36L-Etg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Support auto revert for MT7922
To: Hao Qin <hao.qin@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_141808_097758_421A58BE 
X-CRM114-Status: GOOD (  14.37  )
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

On Fri, Apr 12, 2024 at 5:57=E2=80=AFAM Hao Qin <hao.qin@mediatek.com> wrot=
e:
>
> Add support for auto reverting MT7922 during reset process.

Need some more information of what auto reverting means in this
context and what problem does it solves?

>
> Signed-off-by: Hao Qin <hao.qin@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 4c0cc13adb47..0ad96ec8d31d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3032,7 +3032,16 @@ static int btusb_mtk_reset(struct hci_dev *hdev, v=
oid *rst_data)
>         usb_kill_anchored_urbs(&data->tx_anchor);
>         mediatek =3D hci_get_priv(hdev);
>
> -       if (mediatek->dev_id =3D=3D 0x7925) {
> +       if (mediatek->dev_id =3D=3D 0x7922) {
> +               btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
> +               val |=3D 0x00002020;
> +               btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
> +               btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001)=
;
> +               btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
> +               val |=3D BIT(0);
> +               btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
> +               msleep(100);
> +       } else if (mediatek->dev_id =3D=3D 0x7925) {
>                 btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &va=
l);
>                 val |=3D (1 << 5);
>                 btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, va=
l);
> @@ -3072,6 +3081,9 @@ static int btusb_mtk_reset(struct hci_dev *hdev, vo=
id *rst_data)
>         if (err < 0)
>                 bt_dev_err(hdev, "Reset timeout");
>
> +       if (mediatek->dev_id =3D=3D 0x7922)
> +               btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x0000=
00FF);
> +
>         btusb_mtk_id_get(data, 0x70010200, &val);
>         if (!val)
>                 bt_dev_err(hdev, "Can't get device id, subsys reset fail.=
");
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

