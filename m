Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDFFC48295
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Feb 2024 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxPsHxOelrRc2YH78R8+8vjWXvGYxbflc2NxdmiBy8g=; b=XK3qImwMixOb17g3v2sFDT/xUT
	xpj1Gjt8ycUj4xIpHC1Uvce3J9IGQ8H+MCTOGFrnnzfRVVFl2h+zM0pnOWv7AHvwbFQ5H2sHSs8PA
	p1XGOMWyK95p2mDUAwtxiPBwd6YsRUZu3Wjr5qy0TCoshjs5etLVEyA5FaFBfqt7/tmemn6sdUZ+N
	58yY/i4H2A+uLnTFQUMxSfL7eSPF0tRLhhJtAN/Mv3TwHv2PRZH7hZ34j45Bx8yoUAm1bZ+2YYDs6
	aASI/x3QcCm5PdL34TunHzbT7iidNs0DBRKCc4sCZeor6/J0lMlENvViVWd5Sxd0kK5UefU+R3x89
	J14DfsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uG-0000000DwLt-2YAZ;
	Sat, 03 Feb 2024 00:29:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uD-0000000DwIX-028v
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Feb 2024 00:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A351CE2E89
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Feb 2024 00:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9030EC433C7
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Feb 2024 00:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706920149;
	bh=9TtDN1r4VnqbVkMbIdvO5V9mK3wtnObkCogkcygbwo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fkJShWdwEJvycdkTp0BR6okr208Rn+CRxEsYXN8dp8LGq20F5iMEMPf/LKG2rRSwU
	 i86MAVC9Lg8lRpv87YNIHKkgSFn/WtbEVpDSLSVunszCH04cXeKk8NmmcTPvxyIUC4
	 SBwOAug5vdJuF1W8jHSw3tCnThvEGK+4N/4r+FYRiYQkooe9ONd8axRsCk1cxmxgyS
	 hg6wJnx7rYERvEeAvVQNHQ4WWTw899IsHWvCJQyJv5sKNmh0efJ/DFNc/vQmoKOCl4
	 kT1uMjkJj1VHspspmatx/LYjW1DoPQn+CHWTbs2PAMgZAPRiAqPBETVlrZlNIerMmQ
	 nM9+l0OcDUf+A==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a352d9c0f9dso77298366b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Feb 2024 16:29:09 -0800 (PST)
X-Gm-Message-State: AOJu0YxIH2Ts0nR8kXd6ekk21ecXOe09kq5g1tawgRQyicAyXGnMpoT2
	K1exNMgz4otO2EHsVrdquEKFx5ksalrMRcRFQYlXVYyKkvrZA6K7kb/GLVOjtJIgU9lrYFV713R
	yBdFkwZR3PBEWatG9QWI3RTZUrnE=
X-Google-Smtp-Source: AGHT+IFZ3ZGMvuqs3thX1yxw7hTJ2qyHWlAIiaxSWDC0fd6vOK5H12/qSr7bNlL3hDdiX5obbzjZ0yxKiPDlE9ehK0A=
X-Received: by 2002:a17:906:3c02:b0:a36:95cd:5e62 with SMTP id
 h2-20020a1709063c0200b00a3695cd5e62mr4340840ejg.7.1706920147920; Fri, 02 Feb
 2024 16:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20240102124747.21644-1-hao.qin@mediatek.com>
In-Reply-To: <20240102124747.21644-1-hao.qin@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 2 Feb 2024 18:28:56 -0600
X-Gmail-Original-Message-ID: <CAGp9LzpuLr4vKGSfBoCdES9kKyduADw+2DZp8aZqbR78S_sOuQ@mail.gmail.com>
Message-ID: <CAGp9LzpuLr4vKGSfBoCdES9kKyduADw+2DZp8aZqbR78S_sOuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Bluetooth: btusb: mediatek: refactor
 btusb_mtk_reset function
To: Hao Qin <hao.qin@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_162913_503089_05875F39 
X-CRM114-Status: GOOD (  19.86  )
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

On Tue, Jan 2, 2024 at 6:49=E2=80=AFAM Hao Qin <hao.qin@mediatek.com> wrote=
:
>
> From: "hao.qin" <hao.qin@mediatek.com>
>
> Extract function btusb_mtk_subsys_reset from btusb_mtk_reset
> for future handling of resetting bluetooth controller without
> USB reset.
>
> Signed-off-by: hao.qin <hao.qin@mediatek.com>
>

The patch doesn't modify any logic; it simply divides the existing
logic into two parts,
each prepared to be called in a specific context. Thus,  Acked-by:
Sean Wang <sean.wang@kernel.org>

> ---
> V1 -> V2: refactor btusb_mtk_reset function
>
> Link:
>   https://lore.kernel.org/all/20231215063714.7684-1-hao.qin@mediatek.com/
> ---
>  drivers/bluetooth/btusb.c | 45 +++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 0926e4451802..abefcd1a089d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2994,28 +2994,13 @@ static u32 btusb_mtk_reset_done(struct hci_dev *h=
dev)
>         return val & MTK_BT_RST_DONE;
>  }
>
> -static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
> +static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
>  {
>         struct btusb_data *data =3D hci_get_drvdata(hdev);
> -       struct btmediatek_data *mediatek;
>         u32 val;
>         int err;
>
> -       /* It's MediaTek specific bluetooth reset mechanism via USB */
> -       if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
> -               bt_dev_err(hdev, "last reset failed? Not resetting again"=
);
> -               return -EBUSY;
> -       }
> -
> -       err =3D usb_autopm_get_interface(data->intf);
> -       if (err < 0)
> -               return err;
> -
> -       btusb_stop_traffic(data);
> -       usb_kill_anchored_urbs(&data->tx_anchor);
> -       mediatek =3D hci_get_priv(hdev);
> -
> -       if (mediatek->dev_id =3D=3D 0x7925) {
> +       if (dev_id =3D=3D 0x7925) {
>                 btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &va=
l);
>                 val |=3D (1 << 5);
>                 btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, va=
l);
> @@ -3059,8 +3044,32 @@ static int btusb_mtk_reset(struct hci_dev *hdev, v=
oid *rst_data)
>         if (!val)
>                 bt_dev_err(hdev, "Can't get device id, subsys reset fail.=
");
>
> -       usb_queue_reset_device(data->intf);
> +       return err;
> +}
>
> +static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
> +{
> +       struct btusb_data *data =3D hci_get_drvdata(hdev);
> +       struct btmediatek_data *mediatek;
> +       int err;
> +
> +       /* It's MediaTek specific bluetooth reset mechanism via USB */
> +       if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
> +               bt_dev_err(hdev, "last reset failed? Not resetting again"=
);
> +               return -EBUSY;
> +       }
> +
> +       err =3D usb_autopm_get_interface(data->intf);
> +       if (err < 0)
> +               return err;
> +
> +       btusb_stop_traffic(data);
> +       usb_kill_anchored_urbs(&data->tx_anchor);
> +       mediatek =3D hci_get_priv(hdev);
> +
> +       err =3D btusb_mtk_subsys_reset(hdev, mediatek->dev_id);
> +
> +       usb_queue_reset_device(data->intf);
>         clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
>
>         return err;
> --
> 2.18.0
>
>

