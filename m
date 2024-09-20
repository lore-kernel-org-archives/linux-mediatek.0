Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9230C78853
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Urf9epkit9Wnq7mh+mMh5qFW8LtYH5Rj1D3J2QjXNes=; b=SwpaYn4fcGkVKs5MrgqtsnIIyF
	QkaNtBs3qDelz3uYRSF+fOVy40SEY3rFHez35IlKtQO/xVjDoVTKYVsnbygHbAqDbW+U77eBBrmLP
	XN7UoKd6Kx7xpt1vE3RBEDJ6uOjpUnjOJLXNzbEsoFVNYAUfgf8DZ2zhet/gG/xWBiqPtvhhWOatX
	KWExRbjU6lU6roJ0ttiIYWCrWy2GqhPKc4lLjeTUaBtr0lXUbMI2l2P+W/Y1A0V9W9foZ8B2zed9W
	TaxdG1u7HpbqGRydDjE3rDWT2rpdfIBDWeE8U+7U0lw/Tada9VCpdMgzZLfKOAWspDRUSl8eQmLKt
	9o1l3jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srf2M-0000000CQKq-2j8U;
	Fri, 20 Sep 2024 14:55:10 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srf2J-0000000CQK7-2yOP
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Sep 2024 14:55:09 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f75428b9f8so31619901fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Sep 2024 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726844105; x=1727448905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Urf9epkit9Wnq7mh+mMh5qFW8LtYH5Rj1D3J2QjXNes=;
        b=je2kgwYmW1b2lQEtCA1lj5JJ3jCr0zT1PjWp3QbhoF7cRso4gJ/tGqJEpwVraQEzFo
         +1ZS7ZwX7Vg0HvOYM2/k6UqPMOjhBYa2MqTD9U3JxF+ZQPcLp3c2acslE5ub39FAcuyW
         duoeG7n4jVkHh3WF0yxjTpNlNcB3m9qmMLjoHVpaiMu9YKRsAy0gWxeJR7LdjLLwfWy2
         lyOO+874PY8e4ptlUmsO+7ooGFb2TH2Lf7/s/jqkdm8G585AcvKSWlpmwRjBO7sI/poi
         iNwkROk8EiwtU1/c/bw7fVCkwmVvtMH7fhk9aG5BJzN6EB8MIXPm73XVWvmTX1j6L3K5
         VBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726844105; x=1727448905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Urf9epkit9Wnq7mh+mMh5qFW8LtYH5Rj1D3J2QjXNes=;
        b=Itru8dpUnn+Sb6q0iUluqaU9dXzUpjMQqbV83ejiSRoZzucuFJEynnmcL3yvfVYG3z
         qQAkMCauT5k3KtKyOtOPM5ZJYvY6jmm7btxTWc73NlgTKFuPIPxP1eaXh3vcfQtl2NHp
         tc2JdIDBVA/oCeJCYg2Q2KsXMC/EGwcS/Ayj6IHtCJaynZCYRamt+D+SMnDUvUE02vO8
         h4Wc+Zkt9XyZ6vF1bObHpfhNY78Qz+r01Y8il1ltMROrh8kYdE9zX1XlBBp821byHE9n
         9asaMK1vQPxV5aDKTnNRBixVQRG8c184rn1aOKGFLyfdxOGrVBBNFK5w3co+lgb2J+M4
         WEdg==
X-Forwarded-Encrypted: i=1; AJvYcCXNweEELd5AGbZHCn3Zk4PUoZk6MIA5f7MiYIuUwhygKAC1bWbV/VPCljMe6V7c8sI/1acea0ETYwFUEPaw0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTD9U0f+HTvSC2PuNcPwvv7dNIuLwS/WDnjPT8PESidzbIyok9
	874CiSG92u4iP152/2CVr6eAexmO814bS/FXCABwyDteSskERw7+A/eDwk1umsWDq+kLOaiRbTw
	D4C6PyasUl2KvvpQCxnLV3GeYOIw=
X-Google-Smtp-Source: AGHT+IGRMbJOtLIe11lU8+yttfrugpnh34xPWQlgkz2BjnvZmPECE9B5LY05OCCCUvgqw8AZro92Tf2rVv9ya4d944k=
X-Received: by 2002:a2e:a9a2:0:b0:2ef:1b1b:7f42 with SMTP id
 38308e7fff4ca-2f7cb367bf3mr29478471fa.36.1726844104528; Fri, 20 Sep 2024
 07:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240919074925.22860-1-chris.lu@mediatek.com> <20240919074925.22860-4-chris.lu@mediatek.com>
In-Reply-To: <20240919074925.22860-4-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 20 Sep 2024 10:54:52 -0400
Message-ID: <CABBYNZJ62dw0JHTrNK7xe9_kO61_gH9+XGPm+UEWw4CGRVCnnQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: btusb: mediatek: add intf release flow
 when usb disconnect
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_075507_778029_E80BF4BB 
X-CRM114-Status: GOOD (  18.67  )
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

On Thu, Sep 19, 2024 at 3:49=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> MediaTek claim an special usb intr interface for ISO data transmission.
> The interface need to be released before unregistering hci device when
> usb disconnect. Removing BT usb dongle without properly releasing the
> interface may cause Kernel panic while unregister hci device.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dfc42bdc8aaf..37e67b451b34 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2614,9 +2614,9 @@ static void btusb_mtk_claim_iso_intf(struct btusb_d=
ata *data)
>         set_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags);
>  }
>
> -static void btusb_mtk_release_iso_intf(struct btusb_data *data)
> +static int btusb_mtk_release_iso_intf(struct hci_dev *hdev)
>  {
> -       struct btmtk_data *btmtk_data =3D hci_get_priv(data->hdev);
> +       struct btmtk_data *btmtk_data =3D hci_get_priv(hdev);
>
>         if (btmtk_data->isopkt_intf) {
>                 usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
> @@ -2630,6 +2630,8 @@ static void btusb_mtk_release_iso_intf(struct btusb=
_data *data)
>         }
>
>         clear_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags);
> +
> +       return 0;
>  }
>
>  static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
> @@ -2649,7 +2651,7 @@ static int btusb_mtk_reset(struct hci_dev *hdev, vo=
id *rst_data)
>                 return err;
>
>         if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
> -               btusb_mtk_release_iso_intf(data);
> +               btusb_mtk_release_iso_intf(hdev);

We can probably move the check for BTMTK_ISOPKT_RUNNING into
btusb_mtk_release_iso_intf to avoid having to duplicate it whenever
calling btusb_mtk_release_iso_intf.

>
>         btusb_stop_traffic(data);
>         usb_kill_anchored_urbs(&data->tx_anchor);
> @@ -2703,14 +2705,13 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>
>  static int btusb_mtk_shutdown(struct hci_dev *hdev)
>  {
> -       struct btusb_data *data =3D hci_get_drvdata(hdev);
>         struct btmtk_data *btmtk_data =3D hci_get_priv(hdev);
>         int ret;
>
>         ret =3D btmtk_usb_shutdown(hdev);
>
>         if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
> -               btusb_mtk_release_iso_intf(data);
> +               btusb_mtk_release_iso_intf(hdev);

Ditto.

>         return ret;
>  }
> @@ -3824,6 +3825,7 @@ static int btusb_probe(struct usb_interface *intf,
>                 data->recv_acl =3D btmtk_usb_recv_acl;
>                 data->suspend =3D btmtk_usb_suspend;
>                 data->resume =3D btmtk_usb_resume;
> +               data->disconnect =3D btusb_mtk_release_iso_intf;

I'd wrap (e.g. btmtk_usb_disconnect) the call to
btusb_mtk_release_iso_intf since that is only meant to release the ISO
endpoint.

>         }
>
>         if (id->driver_info & BTUSB_SWAVE) {
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

