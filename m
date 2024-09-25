Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE3ACF9C7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyPp28NYrJbi33YU5dd0/uz1wt5cUJUmG1p8KF+fEHg=; b=g7jAr1iZrRwU1GbbZYeykLRH2I
	PLfI9RB1jvXGhXf2ppymiFFwh08CcDav2Wi478AL+d47DFGqbpAN1GJiwUnxSfPz7O273MmRZ+ZeJ
	qdS5PmI5xekQJaZxjpPJrPhLTVLTuh3C77IyXsFoWpVdUTKE5k2IUVKvvqsKf9HQuyH7705gV9JX/
	hLtZoVKpGMmBwQUls0dUdf8H4s5B5skM3kIrs0Oinl82mYzM8foTPkT/rOQORD78+yLWsKI9NCGCb
	eL7kmdZ7/eUjO3quddWdYzOyW5iyOYWd6Oba0wW8m2mq/kQ97KSmBK8PLYzKwzDzfqt/ivLiMNaMn
	Cb+gGYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stTZN-00000005mLe-0Qmd;
	Wed, 25 Sep 2024 15:04:45 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTY9-00000005lqY-1cEJ
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 15:03:30 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f75f116d11so70888301fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727276606; x=1727881406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyPp28NYrJbi33YU5dd0/uz1wt5cUJUmG1p8KF+fEHg=;
        b=R5tD+TZdnpt+PgmSrkkPGAg1ZDErD3DNu+45eh4zrECqBVjgRKz2AgnDT14CTcWNNw
         ogMisPsxig96ngWRe2FpbLTpqoHZxTaV4Jp4d60k9Wp2ixaENqyIlYK+R6IOWQOEiwcg
         gOKBcef70UrEe/iaIEW9clTE3OZ2/BwIR+8zhv26/o7oeQCDGFUYSwzkWvNEX7OZuIOn
         tLnEd6A94/zhLZPTIhtzJ388JtyvFm4B8B10jud+SnAx6+f1B/v7a08EI63ckoKU4Zje
         agJ2u4BHS/IxtH9chIHE43nY2YzHSjUJC03vyVVMeEJzAG7ggvbsDRLK1ZGeYI8rP9MG
         XaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276606; x=1727881406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyPp28NYrJbi33YU5dd0/uz1wt5cUJUmG1p8KF+fEHg=;
        b=heA/83fP84PCpFDjn7YpRWhBX/jsYloj7kZKDXUCLquavuJ3a7RDq8XKsY2id4Cz1b
         H+GeDg1xZOxpOt0RYFwbtoi0YO/lNm5i62fMtTg/r+GT5L3lEnIRDbuy9BDVilq3ERi7
         2I/Ezv49owDhd3uAwHK6Uq++V1YYMkpYdY+3CzghxPE3+7viGphAIPStgWnXPq9HHJHq
         ggA8xu3pFPNx0oVN8IzQ1YdZx8yr3wGD8G/FXuXFjh+5rITs1RTi0BmrTUhWsuopFKTd
         rl9DfAaBSEZSTYfHGyHYxrMNl5yWQR1tzyU4Xy3nnn5VhjoOXAAzmJgzKzALMrVR+IAS
         yVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCsKTWfJIa3ZdU+j6ae/UgVEdKru+Gv7X8+g81UO3aEXPDQu5jRJMp16Ter8WRGJDOB9pVgzHXd34ba/v7ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsRCXE0HR/XWuuooErGUX57WnHXf6/GhUSMyzZg2lDZFBxHsya
	fJmVETcAr+0rBDdSZ9Dhbdh6WSBc7zdppDVYn+KesJr0LcIGsW/v0hfGRvn9gQ8MFyeeABUDEe7
	5EnavpgcWm/6HqU9d5E1DFHOojJk=
X-Google-Smtp-Source: AGHT+IHclq8G6lZmqiClsVpYhUU8uH4PHhqZcQ11/na9kXhX5DTaYq0EOx8xyP3fN0UlxUQFfY9EZIk5HvE68VZXH/k=
X-Received: by 2002:a05:651c:b14:b0:2f7:90b9:7534 with SMTP id
 38308e7fff4ca-2f915fe4a35mr20741691fa.11.1727276606111; Wed, 25 Sep 2024
 08:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240916032228.6601-1-jiande.lu@mediatek.com>
In-Reply-To: <20240916032228.6601-1-jiande.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 25 Sep 2024 11:03:13 -0400
Message-ID: <CABBYNZJQ4WVAgTPpQBsPp+wBqymN_inisdFZXoMT_b9YdXf2Jw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: Add USB HW IDs for MT7920/MT7925
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_080329_452705_CFBD0FAA 
X-CRM114-Status: GOOD (  17.45  )
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

Hi Jiande,

On Sun, Sep 15, 2024 at 11:22=E2=80=AFPM Jiande Lu <jiande.lu@mediatek.com>=
 wrote:
>
> Add HW IDs for wireless module. These HW IDs are extracted from
> Windows driver inf file and the test for card bring up successful.

Well this is not enough if we don't have firmware published for them,
or you have confirmed that firmware is available and it does load
properly? In that case please add the information about the firmware
as well and perhaps some logs that it can be loaded properly.

> Signed-off-by: Jiande Lu <jiande.lu@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6c9c761d5b93..8946aafae640 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -563,6 +563,16 @@ static const struct usb_device_id quirks_table[] =3D=
 {
>         { USB_DEVICE(0x043e, 0x3109), .driver_info =3D BTUSB_MEDIATEK |
>                                                      BTUSB_WIDEBAND_SPEEC=
H },
>
> +       /* Additional MediaTek MT7920 Bluetooth devices */
> +       { USB_DEVICE(0x0489, 0xe134), .driver_info =3D BTUSB_MEDIATEK |
> +                                                    BTUSB_WIDEBAND_SPEEC=
H },
> +       { USB_DEVICE(0x13d3, 0x3620), .driver_info =3D BTUSB_MEDIATEK |
> +                                                    BTUSB_WIDEBAND_SPEEC=
H },
> +       { USB_DEVICE(0x13d3, 0x3621), .driver_info =3D BTUSB_MEDIATEK |
> +                                                    BTUSB_WIDEBAND_SPEEC=
H },
> +       { USB_DEVICE(0x13d3, 0x3622), .driver_info =3D BTUSB_MEDIATEK |
> +                                                    BTUSB_WIDEBAND_SPEEC=
H },
> +
>         /* Additional MediaTek MT7921 Bluetooth devices */
>         { USB_DEVICE(0x0489, 0xe0c8), .driver_info =3D BTUSB_MEDIATEK |
>                                                      BTUSB_WIDEBAND_SPEEC=
H },
> @@ -636,6 +646,8 @@ static const struct usb_device_id quirks_table[] =3D =
{
>                                                      BTUSB_WIDEBAND_SPEEC=
H },
>         { USB_DEVICE(0x0489, 0xe11e), .driver_info =3D BTUSB_MEDIATEK |
>                                                      BTUSB_WIDEBAND_SPEEC=
H },
> +       { USB_DEVICE(0x0489, 0xe139), .driver_info =3D BTUSB_MEDIATEK |
> +                                                    BTUSB_WIDEBAND_SPEEC=
H },
>         { USB_DEVICE(0x13d3, 0x3602), .driver_info =3D BTUSB_MEDIATEK |
>                                                      BTUSB_WIDEBAND_SPEEC=
H },
>         { USB_DEVICE(0x13d3, 0x3603), .driver_info =3D BTUSB_MEDIATEK |
> --
> 2.45.2
>


--=20
Luiz Augusto von Dentz

