Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE0EC61DD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 17:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2knjofwQvuzR1wr+XZv3xX6N0QAal6YKt6Ix7SMUxH4=; b=HqVs8xfLgId7TrkbV2T1/pe7+x
	cT6nAdaGdGZ64DCXvVupuDoUPOxQOxYobY05F9RMUjOPNKKU/f9Rb16Ym0ixvy+qSjLYXYiHUplHF
	msnAbMNTZ4SKAswiED7GZOTGBGQsH4l5ZFzRDbIWXuo4wOBhXiIByzdpZkib/nXQH/QXER4A4BK33
	K6YGogK2W2Jfy6pSeBBMnSgHve+Fy7Df5r2hK13QXEjtjdkZKPrXxSDcLBHcLcko2p8IbaiB9rE3k
	Y9xankwzB1NgHXS1oXpxWje2+fuw+aeuOu9B8PdzxlTn6E+E88yLrnYXhGb2qXiyy14hFm4kfqSZq
	nupYB8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rw7-0000000CkU3-1foW;
	Tue, 01 Sep 2026 17:06:15 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rw4-0000000CkT1-3LKi
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 17:06:14 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-866e57f63a3so2800827b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 10:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788282371; cv=none;
        d=google.com; s=arc-20260327;
        b=CP9t1vS1N8O5fI88DmtDHOAynLtA/O9BrILhijylsSYVBRRWbNceXywLkag/eTkjJt
         +5WDQeDXJbK9MvzZNiUdc+uFUT/83UXebm1wOMKtXryrr/aeaBpEE0pvywj6cOUWjOQa
         1VaYxs842WOQHDG3llq2Ff8cDdwi4nWkGlmoe2M9XWvQdUaaYYM3IO95iV7LvwSHrmr9
         0W2wscYBTU8QSD6DIlejUPtT6hTWo/wsYoU9Rk7ZPzLMhv9O8FJ/ORMJ5cHVdMUzF6//
         cBovU859meKd+2wQcZq+6YjTgSUXsCxHV3VMmi+LzPZ+M1PstS6xFi8L3/ftdtcLKZ3Z
         LCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2knjofwQvuzR1wr+XZv3xX6N0QAal6YKt6Ix7SMUxH4=;
        fh=h/qnpWNOW/gPriEWY3M64p9EZ5PU47Cf8pjSeK8TqnI=;
        b=AT887I41juzdQEgitm7V4u8GEIeGULopBiy9U62+f0Rz43dY2tyRKVQVlltb7HO3LA
         vB4q97GuOUPskS6vKamSw/KsTVKr4S0aOAsN5Zm7BDPZT/Da74xQFyI8xsDlh/0ZPAC5
         pVN5IwXmS8AjtnsMAjBcDHBKqQw/L9Athxl2VC9472dMgMP0JFOapm++oAoZhM+4rNzz
         kdCr0TMlHwSaU1qjxRIlgCLXw1fmMtBz3tj1RvgPNYhzlX0He8fhN131j9cKaALloSaO
         6uC3TQ1qfHzsYVfDVygNOIRwxZVfavXejEueKwF6enLn9012bEX+KabYOzV8fbrwuxRK
         NzmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282371; x=1788887171; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2knjofwQvuzR1wr+XZv3xX6N0QAal6YKt6Ix7SMUxH4=;
        b=LG7ABF1+QFu2wl6kquHfoeNfbLCewqq9XjdsflYfRvDQLZknujkOJvZcXMW06kZ5m3
         PA3WLRozFd9NngEZTUhoeBIUEwadfYU8aHmd9cY7YiOBwV1aT+0SB9lyya6Cjuz6JmEW
         d4mG2fJslHNFMlnE86j0lVnZBD0rPAn//fyjUSGCSIJ9gTEU+RSBkk9WP6tUcEm4CCR3
         O3kNLLJN6268XoUkm1VhFDa+l4vRzKUHhGNa7aBhkrsEJNdipBxNkCH/W+dq8ngj30Ck
         Sv1yP/14yduCiV02/Ypato41vq055XP334LOX7k2nrBlopczcejKkYGs1KGbn3IQXOek
         rGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282371; x=1788887171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2knjofwQvuzR1wr+XZv3xX6N0QAal6YKt6Ix7SMUxH4=;
        b=fmROIV1XH2akdWYD76FKp2AuJq1SBhGWWcRXVmTGc3w2aKII9ohf4goN/kDiNbh6iB
         7358wSbEhpJ1olMdufS2OjVSWHOCoWWIqMKf7dHSQZ1mRbhu2feNareFbaUWpX/c0Lkd
         9jPyy3fHPiD9xCkc8tqsUOl/zBMcNdDlTrrg4Ki7ovxdgCVhvc8mrxj4fieCaI8gVZjS
         +aFdHdnPwy9zhGwY9Qg+35h7SOaAnLD+9wTeEBF1B9WDvCD+oCkMIhNHLM0QYT7SNxLP
         4xlQpnddoxzclWIroP1rc9/pnyquKnArVsyY8NRHy1SfIhm4v1BhRVARPMAX/NHmjqSb
         yiiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB3LXG4fmQ33HpUwzdkBVKWTa9lSzs1Fx4jRapTUDt0CTrm+0UP7K5HSoFB8Ak1RTPrqJ7AmWZ3ajioX0sMg==@lists.infradead.org
X-Gm-Message-State: AFuF++k1bONu1mqvMBL0zJBxkHFbAuo34acfeZpRraYhAgdyK3rxHj38
	H2IEE9vlVyTOW2T9mBDboktjExzJLKVRtH9OzHCjDL3jx7fG4ev2RBIUxK99Czo7ZG6HlNb4mOV
	36cxnPU93xxP+9FF4petDo/hy6czQrKc=
X-Gm-Gg: AYBFou2Kd57mMSg6xine5aVB+G3IwMLU0hTsIpaNWLgu9IBMW7DlmZbF2ZlIOHyfyAM
	q3sO5gfu75lEwIrm18B5INPDXQIiz+E5kIlwFy/QTNwAd4tshTulinc9np3FfPRyOBsUupIp0Rt
	fjEEvQcISjRsFgHKbX/pQmZijgmHvCYxvEq0dODvpkuI5p1hLbm4h1df8HUIA3Ds/83tEjBlpi7
	FO3j4Bsk17onlGeHzK1+cTplrZDfrz2DQnVWjDZ6M3CzQ1KkeKUlR8yL//sKeLgPSRWuZVYGYMF
	K9UlvK7pHnBdEvwomTUTeyW0Oq3ACoVkLWULHnV72gcV1+cizCLka2r7U9tZdJEGk8aZ9LSHQRp
	/zmNgOO/uE2E22IezW3CQciYoAiWhU7s=
X-Received: by 2002:a05:690c:c384:b0:81e:5d2e:89c8 with SMTP id
 00721157ae682-85d69e05ecbmr139075427b3.14.1788282370489; Tue, 01 Sep 2026
 10:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe> <8783d4c77f112c55c9f9678b5a8e0a88d49c1141.camel@rong.moe>
In-Reply-To: <8783d4c77f112c55c9f9678b5a8e0a88d49c1141.camel@rong.moe>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 1 Sep 2026 13:05:58 -0400
X-Gm-Features: AcwNN1WyKYfoBfTCbGlRw4onwMdCpqeOdj0mqYvXld-ZqkdT9u9PeZktFapWL2M
Message-ID: <CABBYNZJ2J1Z5X+bb_3DLbXR-xVLP9Jzu62NjhDx1f+GErVTy8w@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
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
X-CRM114-CacheID: sfid-20260901_100612_857733_E59D2F44 
X-CRM114-Status: GOOD (  52.70  )
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

On Tue, Sep 1, 2026 at 12:42=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Hi Luiz,
>
> Gentle ping.
>
> On Wed, 2026-07-01 at 23:43 +0800, Rong Zhang wrote:
> > It is reported that a remote wakeup could cause MT7922/MT7925's btusb
> > interface completely unresponsive. Resetting the xHCI root hub doesn't
> > help at all, and recovering from such a state needs a power cycle.
> >
> > All reports seen to be relevant to Ryzen-based laptops. These NICs are
> > usually used as OEM components thanks to some sort of reference designs=
.
> > Their popularity on other platforms is unclear. While there is still a
> > chance that the quirk may exist on other platforms, be cautious and onl=
y
> > apply the quirk to direct children of Ryzen platforms's root hubs for
> > the time being. In most cases the root hub is on the SoC or PCH, which
> > needs the quirk. Unfortunately, this can't distinguish root hubs on PCI=
e
> > add-in cards. Such roughness should be acceptable, as PCIe USB
> > controller add-in cards are less commonly used nowadays. On the other
> > hand, applying the quirk doesn't hurt any functionalities either, as th=
e
> > device can still be used as a wakeup source if desired. Theoretically,
> > we could retrieve the root hub's PCI vendor ID with some hierarchy
> > magic, but that's too intrusive...
> >
> > Meanwhile, though device_set_wakeup_capable(false) is the correct fix
> > for other NICs with fake remote wakeup capabilities, doing so for
> > MT7922/MT7925 effectively prevents it from being used as wakeup
> > sources as per userspace requests. Hence, return -EBUSY on runtime
> > suspend to prevent the interface from being autosuspended while it's
> > still opened, which has the same effect as
> > device_set_wakeup_capable(false), since disabling remote wakeup simply
> > causes the USB core to gate runtime autosuspend as well due to
> > needs_remote_wakeup =3D=3D 1. The interface can be safely autosuspended=
 as
> > long as remote wakeup is disabled, i.e., after closing the HCI device.
> >
> > Specifically, the interface may still take the advantage of remote
> > wakeup in order to wake up the system from sleep if userspace has
> > enabled it as a wakeup source.
> >
> > Fixes: e31d761628ad ("Bluetooth: btmtk: Disable remote wakeup for MT792=
2/MT7925")
> > Signed-off-by: Rong Zhang <i@rong.moe>
>
> Could you kindly take a look at the patch?
>
> Chris Lu from MediaTek has relied with a "LGTM" to the patch, and there
> is already a Tested-by from Rafael Passos. Additionally, based on
> Rafael's debugging observations, the issue does exist on AMD PCHs, so
> matching X86_FEATURE_ZEN is appropriate.

Please resubmit so it can be retested, since it has already been
archived for being over 30 days old.

> Thanks,
> Rong
>
> > ---
> > Changes in v2:
> > - Only apply the quirk to to direct children of Ryzen platforms's root
> >   hubs
> >   - Theoretically, we could retrieve the root hub's PCI vendor ID with
> >     some hierarchy magic to further limit the range down to only root
> >     hubs on the SoC or PCH, but that's too intrusive -- the hierarchy
> >     magic really made me nervous once I saw what I have wrote, so I gav=
e
> >     it up
> > - Link to v1: https://patch.msgid.link/20260629-btmtk-ryzen-remote-wake=
up-v1-1-1d2f1cee6d22@rong.moe
> > ---
> >  drivers/bluetooth/btmtk.c | 10 -------
> >  drivers/bluetooth/btusb.c | 73 +++++++++++++++++++++++++++++++++++++++=
+++++---
> >  2 files changed, 69 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> > index 02a96342e964..4614434dd57b 100644
> > --- a/drivers/bluetooth/btmtk.c
> > +++ b/drivers/bluetooth/btmtk.c
> > @@ -1381,16 +1381,6 @@ int btmtk_usb_setup(struct hci_dev *hdev)
> >               break;
> >       case 0x7922:
> >       case 0x7925:
> > -             /*
> > -              * A remote wakeup could cause the device completely unre=
sponsive, and
> > -              * recovering from such a state needs a power cycle.
> > -              *
> > -              * Since the remote wakeup capability is super broken, ju=
st disable it
> > -              * to get rid of the troubles. The device can still be au=
tosuspended
> > -              * when the bluetooth interface is closed.
> > -              */
> > -             device_set_wakeup_capable(&btmtk_data->udev->dev, false);
> > -             fallthrough;
> >       case 0x7961:
> >       case 0x7902:
> >       case 0x6639:
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 08c0a99a62c5..eef6e3b43bf9 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -6,6 +6,7 @@
> >   *  Copyright (C) 2005-2008  Marcel Holtmann <marcel@holtmann.org>
> >   */
> >
> > +#include <linux/cpufeature.h>
> >  #include <linux/dmi.h>
> >  #include <linux/module.h>
> >  #include <linux/usb.h>
> > @@ -957,6 +958,7 @@ struct qca_dump_info {
> >  #define BTUSB_USE_ALT3_FOR_WBS       15
> >  #define BTUSB_ALT6_CONTINUOUS_TX     16
> >  #define BTUSB_HW_SSR_ACTIVE  17
> > +#define BTUSB_WAKEUP_BROKEN  18
> >
> >  struct btusb_data {
> >       struct hci_dev       *hdev;
> > @@ -2936,10 +2938,25 @@ static int btusb_send_frame_mtk(struct hci_dev =
*hdev, struct sk_buff *skb)
> >       }
> >  }
> >
> > +static inline bool platform_is_ryzen(void)
> > +{
> > +#ifdef CONFIG_X86
> > +     return boot_cpu_has(X86_FEATURE_ZEN);
> > +#else
> > +     return false;
> > +#endif
> > +}
> > +
> > +static inline bool is_direct_child_of_root_hub(struct usb_device *udev=
)
> > +{
> > +     return udev->parent =3D=3D udev->bus->root_hub;
> > +}
> > +
> >  static int btusb_mtk_setup(struct hci_dev *hdev)
> >  {
> >       struct btusb_data *data =3D hci_get_drvdata(hdev);
> >       struct btmtk_data *btmtk_data =3D hci_get_priv(hdev);
> > +     int err;
> >
> >       /* MediaTek WMT vendor cmd requiring below USB resources to
> >        * complete the handshake.
> > @@ -2956,7 +2973,40 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
> >               btusb_mtk_claim_iso_intf(data);
> >       }
> >
> > -     return btmtk_usb_setup(hdev);
> > +     err =3D btmtk_usb_setup(hdev);
> > +     if (err)
> > +             return err;
> > +
> > +     switch (btmtk_data->dev_id) {
> > +     case 0x7922:
> > +     case 0x7925:
> > +             /*
> > +              * All reports seen to be relevant to Ryzen-based laptops=
. These
> > +              * NICs are usually used as OEM components thanks to some=
 sort
> > +              * of reference designs.
> > +              *
> > +              * Their popularity on other platforms is unclear. While =
there
> > +              * is still a chance that the quirk may exist on other
> > +              * platforms, be cautious and only apply the quirk to dir=
ect
> > +              * children of Ryzen platforms's root hubs for the time b=
eing.
> > +              *
> > +              * In most cases the root hub is on the SoC or PCH, which=
 needs
> > +              * the quirk. Unfortunately, this can't distinguish root =
hubs on
> > +              * PCIe add-in cards. Such roughness should be acceptable=
, as
> > +              * PCIe USB controller add-in cards are less commonly use=
d
> > +              * nowadays. On the other hand, applying the quirk doesn'=
t hurt
> > +              * any functionalities either, as the device can still be=
 used
> > +              * as a wakeup source if desired.
> > +              *
> > +              * Theoretically, we could retrieve the root hub's PCI ve=
ndor ID
> > +              * with some hierarchy magic, but that's too intrusive...
> > +              */
> > +             if (platform_is_ryzen() && is_direct_child_of_root_hub(da=
ta->udev))
> > +                     set_bit(BTUSB_WAKEUP_BROKEN, &data->flags);
> > +             break;
> > +     }
> > +
> > +     return 0;
> >  }
> >
> >  static int btusb_mtk_shutdown(struct hci_dev *hdev)
> > @@ -4532,11 +4582,26 @@ static int btusb_suspend(struct usb_interface *=
intf, pm_message_t message)
> >
> >       BT_DBG("intf %p", intf);
> >
> > -     /* Don't auto-suspend if there are connections or discovery in
> > -      * progress; external suspend calls shall never fail.
> > +     /*
> > +      * It is reported that remote wakeup events could sometimes cause=
 some
> > +      * adapters completely unresponsive. Resetting the xHCI root hub =
doesn't
> > +      * help at all, and recovering from such a state needs a power cy=
cle.
> > +      * Since disabling remote wakeup simply causes the USB core to ga=
te
> > +      * runtime autosuspend as well due to needs_remote_wakeup =3D=3D =
1, let's do
> > +      * this ourselves to make our life easier. The interface can be s=
afely
> > +      * autosuspended as long as remote wakeup is disabled, i.e., afte=
r
> > +      * closing the HCI device.
> > +      *
> > +      * Don't auto-suspend if there are connections or discovery in pr=
ogress.
> > +      *
> > +      * External suspend calls shall never fail. Specifically, a devic=
e with
> > +      * broken remote wakeup may still take the advantage of remote wa=
keup in
> > +      * order to wake up the system from sleep if userspace has enable=
d it as
> > +      * a wakeup source.
> >        */
> >       if (PMSG_IS_AUTO(message) &&
> > -         (hci_conn_count(data->hdev) || hci_discovery_active(data->hde=
v)))
> > +         ((test_bit(BTUSB_WAKEUP_BROKEN, &data->flags) && data->intf->=
needs_remote_wakeup) ||
> > +          hci_conn_count(data->hdev) || hci_discovery_active(data->hde=
v)))
> >               return -EBUSY;
> >
> >       if (data->suspend_count++)
> >
> > ---
> > base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> > change-id: 230ba8c9-btmtk-ryzen-remote-wakeup-055a407682ef
> >
> > Thanks,
> > Rong



--=20
Luiz Augusto von Dentz

