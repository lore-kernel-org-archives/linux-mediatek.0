Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A322EC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=; b=IKUgBYg29ebHRfEpR3N+BDnP5z
	IMhfW7rEScHZWwL9oMpyEUXRw7iSK9Je5guTNuAeNFQGkyWYRjuNnOMXvpMP495uvxc5jWmeQFPYm
	3T/ODsdoPGrmL1zNJ8j6tuXz/gRtx6qYB6ZaiaaJyhwJT6Na7yPHk97VPEGKqXidfW/3BUObbBIBP
	59hv4tdGzxjRg2qzOTw2ADUrtH90ma2AqzXBa7ym83jXsIhIJV0K8j7cjgZsZRsuZlTIxQlucOyoX
	9RY9SfA9N/IDvVQRaAK4FDkBHs8DwbPw+KTRcUiQBN1MFTduO84DkdDeAKjhv3NanBCvyEtBfbppA
	DpC5ghng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecy3-000000001zV-1yoD;
	Tue, 30 Jun 2026 18:13:55 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecy0-000000001yK-0eQJ
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 18:13:53 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-495ee8e807aso579085b6e.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 11:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782843231; cv=none;
        d=google.com; s=arc-20260327;
        b=Ibs2UVjTEafuLwa7riGbJWT0MoKiJSnkn1ETHKunwLgCUdbCOK71ePBcPpYguTJKMd
         /aNVTaYGIa2ZBds+s3lJwpMt6kitHxUw0WFJnfHW6b3LchNCOrq6MhoOIWJ4grLnDrTR
         CFXhN2HqasRHAGtKLfexwa0tWvXhjOEjjjG6g8dr47NdNysiZZYP0lzdgRu4Dz8bEppH
         6L1OQtk4dpwB5Gbf0wTIxJsmblVsSwHLM/HMARUJ+SkVpOxTnbhI2yboCdbsjV8dFma6
         uJZUXI7pFrYFSAn70kcCcMViLQk2WMQLcB0ZQ7KzHAfeE6hQ1faXMyRFoA0YAtZUFKRy
         q1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=;
        fh=x89XGqRF9NaDVma9h2mvAnfDP9rn2boIOwAbKB3aue4=;
        b=c4+m8tTJmkp7jF5vPP7pxfHrX2eR6Z9w3ozQc80izebHsmhj0sGNuhlMGRpHjf8b8j
         jW2jVuL+OkUpSjRvOna21pEBkwqgfllhhiEiTbtB/4gpcv457/eP+JBiQ41IA+V3SpkB
         9+3HXNi1YCCJwSVq2jMOZmf7BYf9Ek1c8cWRsa+2UOs1Ia4aLDtRJgLPRN9j+GJggR9U
         pp3SecCqRQaMn3047uNLjIJUD4UdbK/qEmXMSV9ysctJU9dDHv3E5QL1DZVrxYQRBA8i
         7HHZbbUaFHXsvhmqKe7ujaKnSEVKIOxDyFRM31svgtvwyMYlkw4kQ+xAaB2/mnP6fKH+
         sddw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782843231; x=1783448031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=;
        b=UspCb5fgGcaC8AHUXecWAGs3d/tuhQ94bI6Z+hraBUtVAbGWPP3WlbhajqaM6htORz
         4I3Va+g0IktANgzGeamXB99MkvsaupihQLIn2/REWPzddGF84cg0e3y4hVscJdF9JPp0
         ONoXugi40gYd2h2RV/1hcHJqye1vep+h/EOHxVKmRC2jAaI/t72mW8r1Gd5/MXWl0dqb
         BaZ80AZO2pnUpkDGpIHk7GW1Z+vD/uhd3FRM6YER+HeshVEKXfOIKx1XUQOD8gimqjdL
         UPR6lE0zuGquea1CRICNTpOFYUjLIsnoT/B7YJKw1h1z6bWxRaEEfRvDSctiHP7XwFaN
         KkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843231; x=1783448031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=;
        b=o6vYhZA4yNOdAAMIymEkBDl9WkHOxS5rhqjKAzlLZfmqAv7wVHsBy2LovzjeLehvdy
         J2pUpPx5LnogKSJc1uzUhnFozdCtAgI5eKYIQtKff/horcDuIGjHqXpBajnJghlSaVTI
         79Z3dtLR0rBdtDssTMXn0CERSPNi6GwIeVMWpDmeWcpahAmtchKilK7H0FapziNto9pk
         BFrdpXPkcOa/a02qqge332oSiBHAZFYQlIm6XudsjfnQL97qsocyLW4FTt8crZuPsbfO
         vW6kdd6OV+qljiLCkciqKsK5s+QAaZF51kNjLxKbi0ik4cy/4L69HHe1tbS2UgzwrRyT
         7SYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tbpIqmwt+z/wtW3S+uCTheZwDXIN2LnZC1vsHgJmiaW5CNB/RItH0O2pzq9D5vEWkqyRfP25OHSroJ0kKbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQSs2TMupE01AMxo3UknP4u9jvd05XoF6veWh3Ajacd7KvnMk1
	bAXzCO+/1K2ADmQHEEhLu0PSC60ytUJej2boUnYJFY2Ws+oqz4iZY1U/xMMM2IuG0w2Tzn84BMJ
	/zbzuus4LSN/ZPmScY7g+qos3E1KNtM8=
X-Gm-Gg: AfdE7clo58iYLvqigcVyuQv06sMzzbKzMfe/9U3BCpW0nEIj04RcrJu1tCtLK6/1+c3
	DW4anxVNxKn5KDfHDBYl0I/02Fq9cc5834xH/XjjPj4OmiWC12KnWJjlEkGUyVEepAAfKGIbqXD
	/gB/5LYQnIGRhx3LWGGzVSBPkgN8FQBtsQ4DXmiY0yxm6gyu2CZ900YUERecLKT1Q661NobywD3
	GYXYrIr1BVJLWb3VoMzufm5BCNcDWVi1HdT+8MwZP9nPCSWmE91CpHo4xZfxUagAk1yxkRei5aw
	+7NM9cfEzM5jyqBcsC6jnEcCsiwhlVZmuLQF2sDfjyWbFCX4NVQlRZvMh79/6HBY2Bo=
X-Received: by 2002:a05:6808:1308:b0:48b:626c:77b0 with SMTP id
 5614622812f47-495eaef2c2emr3952635b6e.26.1782843230620; Tue, 30 Jun 2026
 11:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-btmtk-ryzen-remote-wakeup-v1-1-1d2f1cee6d22@rong.moe>
In-Reply-To: <20260629-btmtk-ryzen-remote-wakeup-v1-1-1d2f1cee6d22@rong.moe>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 30 Jun 2026 14:13:39 -0400
X-Gm-Features: AVVi8Cf_dKRwkrq_lWyyBPSPON224TZvf1AOfBhLImbCwdJjDU6urnQUGZKhu3Y
Message-ID: <CABBYNZLhqQF-V8sJORwMW2C_4FxFY+pkAK=cSDg4aeWJYfiJrA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
To: Rong Zhang <i@rong.moe>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>, 
	=?UTF-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>, 
	=?UTF-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_111352_219325_6BF7548B 
X-CRM114-Status: GOOD (  39.72  )
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

Hi Rong,

On Mon, Jun 29, 2026 at 11:28=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> It is reported that a remote wakeup could cause MT7922/MT7925's btusb
> interface completely unresponsive. Resetting the xHCI root hub doesn't
> help at all, and recovering from such a state needs a power cycle.
>
> All reports seen to be relevant to Ryzen-based laptops. These NICs are
> usually used as OEM components thanks to some sort of reference designs.
>
> Their popularity on other platforms is unclear. While there is still a
> chance that the quirk may exist on other platforms, be cautious and only
> apply the quirk on AMD platforms for the time being.
>
> Meanwhile, though device_set_wakeup_capable(false) is the correct fix
> for other NICs with fake remote wakeup capabilities, doing so for
> MT7922/MT7925 effectively prevents it from being used as wakeup
> sources as per userspace requests. Hence, return -EBUSY on runtime
> suspend to prevent the interface from being autosuspended while it's
> still opened, which has the same effect as
> device_set_wakeup_capable(false), since disabling remote wakeup simply
> causes the USB core to gate runtime autosuspend as well due to
> needs_remote_wakeup =3D=3D 1. The interface can be safely autosuspended a=
s
> long as remote wakeup is disabled, i.e., after closing the HCI device.
>
> Specifically, the interface may still take the advantage of remote
> wakeup in order to wake up the system from sleep if userspace has
> enabled it as a wakeup source.
>
> Fixes: e31d761628ad ("Bluetooth: btmtk: Disable remote wakeup for MT7922/=
MT7925")
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/bluetooth/btmtk.c | 10 ---------
>  drivers/bluetooth/btusb.c | 57 +++++++++++++++++++++++++++++++++++++++++=
++----
>  2 files changed, 53 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 02a96342e964..4614434dd57b 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1381,16 +1381,6 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>                 break;
>         case 0x7922:
>         case 0x7925:
> -               /*
> -                * A remote wakeup could cause the device completely unre=
sponsive, and
> -                * recovering from such a state needs a power cycle.
> -                *
> -                * Since the remote wakeup capability is super broken, ju=
st disable it
> -                * to get rid of the troubles. The device can still be au=
tosuspended
> -                * when the bluetooth interface is closed.
> -                */
> -               device_set_wakeup_capable(&btmtk_data->udev->dev, false);
> -               fallthrough;
>         case 0x7961:
>         case 0x7902:
>         case 0x6639:
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 08c0a99a62c5..023ae782f41a 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -6,6 +6,7 @@
>   *  Copyright (C) 2005-2008  Marcel Holtmann <marcel@holtmann.org>
>   */
>
> +#include <linux/cpufeature.h>
>  #include <linux/dmi.h>
>  #include <linux/module.h>
>  #include <linux/usb.h>
> @@ -957,6 +958,7 @@ struct qca_dump_info {
>  #define BTUSB_USE_ALT3_FOR_WBS 15
>  #define BTUSB_ALT6_CONTINUOUS_TX       16
>  #define BTUSB_HW_SSR_ACTIVE    17
> +#define BTUSB_WAKEUP_BROKEN    18
>
>  struct btusb_data {
>         struct hci_dev       *hdev;
> @@ -2936,10 +2938,20 @@ static int btusb_send_frame_mtk(struct hci_dev *h=
dev, struct sk_buff *skb)
>         }
>  }
>
> +static inline bool platform_is_ryzen(void)
> +{
> +#ifdef CONFIG_X86
> +       return boot_cpu_has(X86_FEATURE_ZEN);
> +#else
> +       return false;
> +#endif
> +}
> +
>  static int btusb_mtk_setup(struct hci_dev *hdev)
>  {
>         struct btusb_data *data =3D hci_get_drvdata(hdev);
>         struct btmtk_data *btmtk_data =3D hci_get_priv(hdev);
> +       int err;
>
>         /* MediaTek WMT vendor cmd requiring below USB resources to
>          * complete the handshake.
> @@ -2956,7 +2968,29 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>                 btusb_mtk_claim_iso_intf(data);
>         }
>
> -       return btmtk_usb_setup(hdev);
> +       err =3D btmtk_usb_setup(hdev);
> +       if (err)
> +               return err;
> +
> +       switch (btmtk_data->dev_id) {
> +       case 0x7922:
> +       case 0x7925:
> +               /*
> +                * All reports seen to be relevant to Ryzen-based laptops=
. These
> +                * NICs are usually used as OEM components thanks to some=
 sort
> +                * of reference designs.
> +                *
> +                * Their popularity on other platforms is unclear. While =
there
> +                * is still a chance that the quirk may exist on other
> +                * platforms, be cautious and only apply the quirk on AMD
> +                * platforms for the time being.
> +                */

Is this going to be a reliable way to detect if wakeup is broken or
not? Since USB is a bus capable of hotplug, this check would block not
only internal/built-in controllers with the above IDs but also those
plugged via external ports if the CPU happens to be of the ZEN
familly.

> +               if (platform_is_ryzen())
> +                       set_bit(BTUSB_WAKEUP_BROKEN, &data->flags);
> +               break;
> +       }
> +
> +       return 0;
>  }
>
>  static int btusb_mtk_shutdown(struct hci_dev *hdev)
> @@ -4532,11 +4566,26 @@ static int btusb_suspend(struct usb_interface *in=
tf, pm_message_t message)
>
>         BT_DBG("intf %p", intf);
>
> -       /* Don't auto-suspend if there are connections or discovery in
> -        * progress; external suspend calls shall never fail.
> +       /*
> +        * It is reported that remote wakeup events could sometimes cause=
 some
> +        * adapters completely unresponsive. Resetting the xHCI root hub =
doesn't
> +        * help at all, and recovering from such a state needs a power cy=
cle.
> +        * Since disabling remote wakeup simply causes the USB core to ga=
te
> +        * runtime autosuspend as well due to needs_remote_wakeup =3D=3D =
1, let's do
> +        * this ourselves to make our life easier. The interface can be s=
afely
> +        * autosuspended as long as remote wakeup is disabled, i.e., afte=
r
> +        * closing the HCI device.
> +        *
> +        * Don't auto-suspend if there are connections or discovery in pr=
ogress.
> +        *
> +        * External suspend calls shall never fail. Specifically, a devic=
e with
> +        * broken remote wakeup may still take the advantage of remote wa=
keup in
> +        * order to wake up the system from sleep if userspace has enable=
d it as
> +        * a wakeup source.
>          */
>         if (PMSG_IS_AUTO(message) &&
> -           (hci_conn_count(data->hdev) || hci_discovery_active(data->hde=
v)))
> +           ((test_bit(BTUSB_WAKEUP_BROKEN, &data->flags) && data->intf->=
needs_remote_wakeup) ||
> +            hci_conn_count(data->hdev) || hci_discovery_active(data->hde=
v)))
>                 return -EBUSY;
>
>         if (data->suspend_count++)
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 230ba8c9-btmtk-ryzen-remote-wakeup-055a407682ef
>
> Thanks,
> Rong
>


--=20
Luiz Augusto von Dentz

