Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89040C4828F
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Feb 2024 00:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHgRL79/hBiqk4St6zPJFt7ZpAdljnLawCcHONgZpZQ=; b=FMcbOnyqBrzNRW4fjrG2ui3jEa
	hIux03XgGzuBgAsb1XE/acJF/XklwNlvsuQpNM6KdhK70qmoFsJKWH1dFwxtNTO+dr6YdvU6JxN3N
	urotNcQ4eV+oNSUzMapJfquQL7+iEU6s54OMm98IcE8Y2GcCNwRF8k1OrACvwDLIR4whhUkMSVtKK
	+pgpVMwLnpgDOTCsXO5dBBeK/2osmMobbnI8BV3O8kq/nnsAer+Cff8i5AgQvAN2duLjJJbQWTLS8
	ZPsD+lhDW9Nw++Os8crVyzPxw6vuRS7tPdUtbYSabS0OXdNFh0BgTn3p+4A7e0uTRbmh0YPHrN8OL
	CN3xI32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW43z-0000000Dyll-4298;
	Sat, 03 Feb 2024 00:39:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW43x-0000000DylH-1Fdv
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Feb 2024 00:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40E44CE2E89
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Feb 2024 00:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD17C43394
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Feb 2024 00:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706920753;
	bh=CDhdZtJRM4I5jnsGxAP6SnwAa6RKbZAw/Fvw+maWkNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Srn9foryvIJS0xs4P8A+nbDK/UMUPIPdIrEvrTmEmvXmJGrCd4aROuFdXJG0C9EWi
	 W7X2HidnRAH5brgcd/78Y7FReHPk2xqwF6bsm8yQ0CW8JEkIjn1K5c3uxgrgPiovmS
	 H+If+q12AMFYoxWPEaC5/pmN3bWRCeGpQn2PAFeuJX8kJyD7fYNqrxlnwWnDHotdbr
	 pS3GlimcfeApUKGAZeSCq7m+sRLk5PzlKBpTmd57B4xi7KKSqpayq4JcQG9FWORJEf
	 qsv4UC4Js35rhLdxVUM6y0GvVHsP/PERKPxyLTL51zMmPCyb5FPxt6aJprlpYzWDAy
	 Uf1XThzoYDL5Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d08d9b9667so2258901fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Feb 2024 16:39:13 -0800 (PST)
X-Gm-Message-State: AOJu0Yyp1BGjw4HJljbxIEm6bQPoDQNLk93X5H6Y25jCbX9nS3E7cjI4
	pMAjZjnCK8KXI+Wf/e8EIcXDbgSt9c1L2XQSyjYF4C0+JuN02mXW7wniXYipTg2awodfGcRnlK5
	ndEZqLAMDrfOXIHxjaefNx+KGi58=
X-Google-Smtp-Source: AGHT+IHa4ZO2VYWT1mFTKA5zcN1ID/fl9uj+ci0IbUmuSvFG2RP3o0Caq0GTCM9Bplwg/QtZJRfRCtjULrwGAZocaX8=
X-Received: by 2002:a05:6512:313b:b0:511:4643:d913 with SMTP id
 p27-20020a056512313b00b005114643d913mr20056lfd.6.1706920751563; Fri, 02 Feb
 2024 16:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20240102124747.21644-1-hao.qin@mediatek.com> <20240102124747.21644-2-hao.qin@mediatek.com>
In-Reply-To: <20240102124747.21644-2-hao.qin@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 2 Feb 2024 18:39:00 -0600
X-Gmail-Original-Message-ID: <CAGp9LzqejefGFLpuntAghHUsA58mN_2EQqKynBC-JCYXAEUSZg@mail.gmail.com>
Message-ID: <CAGp9LzqejefGFLpuntAghHUsA58mN_2EQqKynBC-JCYXAEUSZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Bluetooth: btusb: mediatek: add a recovery method
 for MT7922 and MT7925
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
X-CRM114-CacheID: sfid-20240202_163917_709066_D8AC727D 
X-CRM114-Status: GOOD (  21.22  )
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
> For MT7922 and MT7925, add USB reset retry to recover from patch
> download failure, and perform a reset before patch download to
> avoid unexpected problems caused by unkonwn status of dongle.
>
> Signed-off-by: hao.qin <hao.qin@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index abefcd1a089d..26ad4864d06c 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3000,17 +3000,26 @@ static int btusb_mtk_subsys_reset(struct hci_dev =
*hdev, u32 dev_id)
>         u32 val;
>         int err;
>
> -       if (dev_id =3D=3D 0x7925) {
> +       if (dev_id =3D=3D 0x7922) {
> +               btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
> +               val |=3D 0x00002020;
> +               btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
> +               btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001)=
;
> +               btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
> +               val |=3D BIT(0);
> +               btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
> +               msleep(100);
> +       } else if (dev_id =3D=3D 0x7925) {
>                 btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &va=
l);
> -               val |=3D (1 << 5);
> +               val |=3D BIT(5);
>                 btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, va=
l);
>                 btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &va=
l);
>                 val &=3D 0xFFFF00FF;
> -               val |=3D (1 << 13);
> +               val |=3D BIT(13);
>                 btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, va=
l);
>                 btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001)=
;
>                 btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &va=
l);
> -               val |=3D (1 << 0);
> +               val |=3D BIT(0);
>                 btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, va=
l);
>                 btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x0000=
00FF);
>                 btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
> @@ -3040,6 +3049,9 @@ static int btusb_mtk_subsys_reset(struct hci_dev *h=
dev, u32 dev_id)
>         if (err < 0)
>                 bt_dev_err(hdev, "Reset timeout");
>
> +       if (dev_id =3D=3D 0x7922)
> +               btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x0000=
00FF);
> +
>         btusb_mtk_id_get(data, 0x70010200, &val);
>         if (!val)
>                 bt_dev_err(hdev, "Can't get device id, subsys reset fail.=
");
> @@ -3128,8 +3140,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>                 fwname =3D FIRMWARE_MT7668;
>                 break;
>         case 0x7922:
> -       case 0x7961:
>         case 0x7925:
> +               btusb_mtk_subsys_reset(hdev, dev_id);

Is there any reason we cannot perform a subsystem reset for 0x7961?
I believe it would enhance robustness under any circumstance, such as
cold reboot, warm reboot, or suspension,
ensuring that the controller can be reset to its initial state

> +               fallthrough;
> +       case 0x7961:
>                 if (dev_id =3D=3D 0x7925)
>                         snprintf(fw_bin_name, sizeof(fw_bin_name),
>                                  "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x=
_hdr.bin",
> @@ -3143,6 +3157,11 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>                                                 btusb_mtk_hci_wmt_sync);
>                 if (err < 0) {
>                         bt_dev_err(hdev, "Failed to set up firmware (%d)"=
, err);
> +                       if (dev_id =3D=3D 0x7922 || dev_id =3D=3D 0x7925)=
 {

Similarly, is there any reason we cannot apply the same approach for
mt7961? Using a less specific condition would reduce maintenance
effort in the future.

> +                               btusb_stop_traffic(data);
> +                               usb_kill_anchored_urbs(&data->tx_anchor);
> +                               usb_queue_reset_device(data->intf);

If an error occurs during firmware download, I guess we can
subsequently attempt to download the firmware again through several
retries.
This helps the controller to autonomously recover from any potential
errors and ensure we can complete the initialization process.

> +                       }
>                         return err;
>                 }
>
> --
> 2.18.0
>
>

