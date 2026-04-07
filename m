Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB41FEEF55
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O+zSSK3GIsBsnq81maqI5w/67B+NUUKHtZOyjDy8dE=; b=Yy/URU+ln+sBcFc72rHaY8vNJl
	6/VCIQdr5Ype941+8AIjm/CFXZvsbEEQCJkdyvVtNLzF6EMjvLaYLVeDLo1mHl0dningAFASq/bys
	S/xVKH0OTmsgKubJ/fOb023HVRb7EWNy9yB6pHYTeRg3NiZhCChcVNhkXcZTQoZzfRKML+0nxC/ze
	UBHem67KofHpPIKdlTgVItn5z/Gc/azpbJQqbx12FEzXDaTvbuMx0270KYmo5NBryOQjwe90xcVOu
	E7+pAkxAKWnv7l0uf8pgLA5BaHLyvx9K6worQmAxAZdsZxDSxr3LUZS+0q8fnAjZXtDDsZ3QB4hPd
	lkMVc1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7pd-00000006elq-3VMH;
	Tue, 07 Apr 2026 14:55:09 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7pa-00000006elG-24tN
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Apr 2026 14:55:09 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-65005a8840dso5130155d50.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Apr 2026 07:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775573705; cv=none;
        d=google.com; s=arc-20240605;
        b=RajrGuqdMC7CDyPANpHB6HviWW1CG0errHWu8K2o/iUxvvrXfHgNe9QYQQRkp5seRM
         Ap2EzfdQMjutneNwTg3XAIFoHGViVCzuJRzkNKEHCU5HoHlWbfiJGBTxYNq1sCKskakg
         xOSyWCVM1CRIMERqS6p/gv+HoF17Y32lt19q1duS6mgGC1g1GUueHJVX35PYXr9HNAG0
         7GggyLe3u1GH8oSb0LF+VxKL7klsE3EQFzLXpFmkIf5sWpT4GLSZxg7LhfHqn6qXqNMl
         1d7iz/DlZjlBkk4olftQorriMSh5ttMpBvzykF4fp2Ksn4pc6Ht8gBZSZ24OwF12KNyT
         NfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7O+zSSK3GIsBsnq81maqI5w/67B+NUUKHtZOyjDy8dE=;
        fh=2uZE/PEDWvhZZnfixOzgnKMqzl/RozEmV20tsRQPl4M=;
        b=e2bNhfimkIRIyNWZIRf46IX539wbbPL0RzWTZlfWu88HqDAdkS1H7IAZT61+0i/czk
         b52bLWXvV6jqoya+hlxlVWXUnALICKr5p1UCA0EKWem5Fgk4T9MXEY0yk3B03hIKhZbf
         YpO6j3eeNPB0Re4JQ8Fssy2rdL8be8D/Q6DLwGEcuvC6Iigr0FMmeBacUhU1T/9LaJeJ
         K5jLhxsREyeoolcSeDdGt4YaQqyTu2HciyEtvPoiAX5NfSpFJHOTagIDacaiweQeLren
         GHhAEXv+1VaPGWYBP7vbUo9x8XN0VM2YuP+bO0FyL+VcqlfQpv1EyvG0zrC5UYxx5cLe
         rWaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573705; x=1776178505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O+zSSK3GIsBsnq81maqI5w/67B+NUUKHtZOyjDy8dE=;
        b=na84RH8MVpeGdLBstlE3r8aOJC+07id42RJ+q2AXQ1WbUmZn+eF9wem/PXSXmh8QKz
         hkQUwxsS8Ut5kfsi0IHyG5JI6vnwoSPg90SRJN8AY73FZcsjOd1kXS7Sws43M69F3q4+
         PxK4hRpmutLa9V+U6Hgy58NK//0bKf+3/esclBMxwDMn3iCjScS2sY87Mi4Vlq5k8tVG
         sBAGOOSMK7Xsm20Q+wekJfqMBnu7M+ZY4vGo+HCf4s2XSvM0dQ63Gi188UrFdeZ9REkX
         dm5gnr0q9fBlx90w4BvhBvO7a4ksAdy2ijxFLddcosbffIZI9TUePd+nqRNHIwdjcI+r
         Dgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573705; x=1776178505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7O+zSSK3GIsBsnq81maqI5w/67B+NUUKHtZOyjDy8dE=;
        b=HqgP1YwWOQaH09+MVZssn9MXOs4q6kKTBcy6KBg2b10yKUkT1P+UC+bMhgRVFYDBDH
         1sNqFiBWlFqrtSfl4eYXO5hER9SlQIhoJ1NbHO+R5tr99imi9Yr29brNzDOZSwuFE22h
         woiRx45zRBmAYMi2ugFEU0tuRS7jPEf18+3nnJwWTtf4+yZ43U/Ve4fdM71qph7HN+AT
         /NNFhjCaGLwNIeG1PD1NMz2sPoJepNUjkMI93+wQ9y10aZ3x1+87piE7ZRhNWCXephQW
         cMIEw1t89fxylb3NyPtZ+A6X0nLnOUKakyOPXNjCeSIDiiZf2IEfnQ8YoPoekhNeH3Nn
         OnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmGeGc+BBPx5x1xNt8cVDGMiCK8h6ZdOr6TgEsBY3PX/sxRGoXL2CicK7ADvtHR23x1i/E5Cnm0ZMEmd84ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpNH2qkhtCk8OC8dLaxBzfxTIzVBN0YEXQ7hkc7MeDdITWB0t0
	UzQ3Xp2VOcPUN2lIqzZqboaTDNDt78fAGCcNqvH+3ujIBfa3hUYrJ3ritYlk1Mc5MyCgddMvyea
	NX87b1dbmObP5ynmMfc/ZjtMhO41cCms=
X-Gm-Gg: AeBDieuQEJlwPLS5acuNkEescdhtV9YPI9SnyuoI5RvQvSS9bFD+3Cn7fN3RiaBz6Qb
	of2SxwL/aw80FCXy2SyINOI9dsxwS1S+TSybi/cH7ZEoTo1IZSVC+BCpEclG1ayInSiUd7EP7lW
	bQmjwJUplqmF0/4vdTIKq5C0XH21NUZYUIb6d0zYardlUf/UXxQFqn4aHzwCecm/ZU+g3yEdFU8
	GF/sywfQD2b49hwhhQ90iImNGgtBbEmn3hHKhOc3eQCgixpc8wMVodDza1BJZ48z/HHkSibE324
	rCxnTHI/7dQM3E+XbFUx1hMNuOXakMDch1hOmBtGYVgoQ3r2JFs2RFK7SkeU9VW0X5D8Ekd3dcf
	mLg==
X-Received: by 2002:a05:690e:1482:b0:650:7a8a:f89e with SMTP id
 956f58d0204a3-6507a8afa29mr3439862d50.9.1775573705119; Tue, 07 Apr 2026
 07:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260407114851.3087886-1-chris.lu@mediatek.com>
In-Reply-To: <20260407114851.3087886-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 7 Apr 2026 10:54:53 -0400
X-Gm-Features: AQROBzAHknm1LcaBHn6KcplFZfkI-H597cHtdCF_vlpcMyfjpqsUG1hHk8Yd4sw
Message-ID: <CABBYNZ+xi_ktCMSeXP_aNTVLZzKoz+Ye4gFZFvF7eiMRZcULww@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: btmtk: add event filter to filter specific event
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_075506_549965_C95437CA 
X-CRM114-Status: GOOD (  21.20  )
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

On Tue, Apr 7, 2026 at 7:48=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wro=
te:
>
> Add an event filter to filter event with specific opcode to prevent BT
> stack from receiving unexpected event.
>
> Event with opcode 0xfc5d is generated when MediaTek's Bluetooth enable
> firmware logs and is not expected to be sent to userspace.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
> v1 -> v2: update commit message
> ---
>  drivers/bluetooth/btmtk.c | 22 ++++++++++++++++++++++
>  drivers/bluetooth/btmtk.h |  7 +++++++
>  drivers/bluetooth/btusb.c |  2 ++
>  3 files changed, 31 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 55516b4602db..302d6ddf9062 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1503,6 +1503,28 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
> +
> +int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +       struct hci_event_hdr *hdr =3D (void *)skb->data;
> +
> +       if (hdr->evt =3D=3D HCI_EV_CMD_COMPLETE) {
> +               struct hci_ev_cmd_complete *ec;
> +               u16 opcode;
> +
> +               ec =3D (void *)(skb->data + HCI_EVENT_HDR_SIZE);
> +               opcode =3D __le16_to_cpu(ec->opcode);
> +
> +               /* Filter vendor opcode */
> +               if (opcode =3D=3D 0xfc5d) {
> +                       kfree_skb(skb);
> +                       return 0;
> +               }
> +       }
> +
> +       return hci_recv_frame(hdev, skb);
> +}
> +EXPORT_SYMBOL_GPL(btmtk_recv_event);
>  #endif
>
>  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index adaf385626ee..08b73927c8f3 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -218,6 +218,8 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
>  int btmtk_usb_setup(struct hci_dev *hdev);
>
>  int btmtk_usb_shutdown(struct hci_dev *hdev);
> +
> +int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb);
>  #else
>
>  static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
> @@ -296,4 +298,9 @@ static inline int btmtk_usb_shutdown(struct hci_dev *=
hdev)
>  {
>         return -EOPNOTSUPP;
>  }
> +
> +static inline int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff =
*skb)
> +{
> +       return -EOPNOTSUPP;
> +}
>  #endif
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index f9d515ee9124..daf8a387e660 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4150,6 +4150,8 @@ static int btusb_probe(struct usb_interface *intf,
>         } else if (id->driver_info & BTUSB_MEDIATEK) {
>                 /* Allocate extra space for Mediatek device */
>                 priv_size +=3D sizeof(struct btmtk_data);
> +
> +               data->recv_event =3D btmtk_recv_event;
>         }
>
>         data->recv_acl =3D hci_recv_frame;
> --
> 2.45.2


https://sashiko.dev/#/patchset/20260407114851.3087886-1-chris.lu%40mediatek=
.com

Both issues seem valid to me. That said, I wonder if it wouldn't have
been better to allow drivers to register with its own struct
hci_ev/struct hci_cc tables, that way the driver can extend event
parsing rather than intercepting it and performing custom parsing
which can lead to bugs like the ones mentioned above.


--=20
Luiz Augusto von Dentz

