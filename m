Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371ACE77188
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np4AwC2TG2aANO3tq1hKZ8t1XEyTiu7VAIhJj+aPhl4=; b=evqdr5qNj4MUPVxGW60yhs1xy0
	8I1/N1hOMk67JGGzJHccfPtBaYd5CRXKmh26YImWX08MM5PWANGWMoRQUB48n1ht1q0ueDE2ZBIiH
	0k2NqJHuc5xVPxrcwbgYcggy6a4dVsnTm1u7q6Kd5mWzX1fExdTACst/e+wGrT22dK8Qg3JCqnEBX
	luAiUUHwjFilkF4gorhr4v4xfMzwLwQAJYF+rf9U+4JlP1WaXcn3mTRQezAeBIemJRMc7EtiMMILN
	/WmIlFKobYxJihMFUX3aF8gqpqGvdWHAGjkWQXaQM+aMyUx/Cs5jXcNzgFMMya2eV0bvPslL1D79i
	yiTyEjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtxV-00000002cqG-1LKS;
	Mon, 06 Jan 2025 20:44:21 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtxS-00000002cpR-2Ym7
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jan 2025 20:44:19 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30167f4c1deso142267781fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jan 2025 12:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736196255; x=1736801055; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=np4AwC2TG2aANO3tq1hKZ8t1XEyTiu7VAIhJj+aPhl4=;
        b=F20Jxe8XuH9LjrmcHFjkOO/y3PP/1E0Rmq8YmZaUydOp7erWuk69ZZIa9vNKfNAKhv
         7NQ58HnXjm80WzNqRlk2SSRyvmTisu2vTStA27Su3kSxjLNK33KOfQAEeDhFZ7EAKZ+V
         ntujw2aXCJq98tGsNVaYYnKnspvCVIW1+kDt2QY/MzaaMgdG+5/Ou30USZYRI3KmEhr1
         +/IdIRx5aJwX/tWarveAQGzRUVJRxx5F/fLZZGr+TQz0OpQhP2zHW3UydDb2hMf9ZlFd
         hBqJbaMs5R9OL/FvKXboU5bzZ5H+bVTg1aPV8Bq9w7HVeTlNc35vRih0ppyEsk4YRiQT
         mgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196255; x=1736801055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=np4AwC2TG2aANO3tq1hKZ8t1XEyTiu7VAIhJj+aPhl4=;
        b=m2A8+0NVSsj3hzzCdjr0CWftkJAq0ZnlNkKLzLd7xub0O2ZMaOkH9aSFTAKOLi/G44
         IcKqnEyU/GrqeiTJYJzrqSCJO3S4m2u8jbQjGwI9xSG5S+XCxCVGR17r7sD446ZHDxC4
         mylImP8vgSU0omrI6GOwrq+7O5K/fbZfiaIR7+5eF2SfUmXu+7VfSoXJoXA3CR6RqMpl
         nSRYbqumKuGjO6t7Lf1anur8/HOfO3AOPJfj2UzEY0tbPdjaR6vdYq1dB8IM9YO/Xrzd
         HjV8YDpkZydskdYr/nU6kvQCoFySSNxED4HrrnI12PcRHzCCjEczU+/IW8bfihy75iDK
         RCrw==
X-Forwarded-Encrypted: i=1; AJvYcCXdDv5ZtV1uRkyPscVMHcTqRuh/DqiXtLoeM5yynyBFWJ0F6ecIjMjM4lu7ynLhIRHCdaj/YujW16xrlLQBLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZU9K2ZFMFAwDepCIHdRqR4+ICNqsYBcBVWtYMXAyrxOBbVcVX
	rt8oE5WwrC03oTZ6Qrzg74bII3FpCMjGwb/hrnk5TVzT3rUa5+etRwTO1aRwnTL1PkdKVeY8El2
	OxkDXUeatfoJII8ozcLyWImy2nPE=
X-Gm-Gg: ASbGncsb9Vtg69i28+eUGCwDXQr9IM8eqx+FXzuBquNxwMma5ISLcwjTwwib+vlu4kR
	Eka/pIOSsjygBqSpuA7X+sDO3COldIn7Zr7HIVyE=
X-Google-Smtp-Source: AGHT+IGkYZlQg/yqsRPPg9FkH6/8PxzQuROlITJwodFva38BJJMwG50n8RqMSHpEAyC7kyvAhTepS3DNAW8b69FGyds=
X-Received: by 2002:a2e:be06:0:b0:302:4147:6d21 with SMTP id
 38308e7fff4ca-30468552157mr156651621fa.4.1736196254731; Mon, 06 Jan 2025
 12:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20241223085818.722707-1-chris.lu@mediatek.com>
In-Reply-To: <20241223085818.722707-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 6 Jan 2025 15:44:02 -0500
Message-ID: <CABBYNZJOEi_=vLiivGFt7tKiq8TMn9YG=FkC20y-6M75Bi8vYg@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btmtk: Fix failed to send func ctrl for
 MediaTek devices.
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_124418_650041_3D5F41D9 
X-CRM114-Status: GOOD (  18.10  )
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

On Mon, Dec 23, 2024 at 3:58=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> Use usb_autopm_get_interface() and usb_autopm_put_interface()
> in btmtk_usb_shutdown(), it could send func ctrl after enabling
> autosuspend.
>
> Bluetooth: btusb_mtk_hci_wmt_sync() hci0: Execution of wmt command
>            timed out
> Bluetooth: btusb_mtk_shutdown() hci0: Failed to send wmt func ctrl
>            (-110)
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>

Missing Fixes tag, Ive been adding it myself for some time now but you
better create the practice to include it so I don't have to go find
what commit introduced btmtk_usb_shutdown to then do git log -1
--pretty=3Dfixes and git commit --amend.

> ---
>  drivers/bluetooth/btmtk.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 7fd9d5ddce02..224eafc27dbe 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1472,10 +1472,15 @@ EXPORT_SYMBOL_GPL(btmtk_usb_setup);
>
>  int btmtk_usb_shutdown(struct hci_dev *hdev)
>  {
> +       struct btmtk_data *data =3D hci_get_priv(hdev);
>         struct btmtk_hci_wmt_params wmt_params;
>         u8 param =3D 0;
>         int err;
>
> +       err =3D usb_autopm_get_interface(data->intf);
> +       if (err < 0)
> +               return err;
> +
>         /* Disable the device */
>         wmt_params.op =3D BTMTK_WMT_FUNC_CTRL;
>         wmt_params.flag =3D 0;
> @@ -1486,9 +1491,11 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
>         err =3D btmtk_usb_hci_wmt_sync(hdev, &wmt_params);
>         if (err < 0) {
>                 bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err=
);
> +               usb_autopm_put_interface(data->intf);
>                 return err;
>         }
>
> +       usb_autopm_put_interface(data->intf);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
> --
> 2.45.2
>


--=20
Luiz Augusto von Dentz

