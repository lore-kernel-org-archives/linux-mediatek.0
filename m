Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9852CE8E86
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObLFhkfilDgkeJ8S/DOzsvtKeCP3rongHSO0w7aoSKI=; b=XdGdIem5wdS6SLF+FcicZzztk+
	6aKmLvgmkqqmuvkj/lDy9cgmVRfjTdB5YI53w8l6cqmuBSSzElkj49wWALldXg/yInUI4Z4UicanR
	hBQNSoRvblKnMQ2a9feLbfoYUXEz7hZDxUwO2UQT290OoPxcWm6nuC3Cnx6SL9KSb30H8MOgzmec6
	D1fm+vdHOGxemqQCDrBu8Hjz5MJpPzfBWmG2aKfRl/q3mRFmtXbbLDZ8KHZ7L3cPmeNZ8aRjcDj5I
	Xvj+3mmEjCK6NvscX5ARiGF0mFL0JdfcyvQOZq7dAIsx4+y3JW7lgpRWWZdwzA0jTMHzdSiwAm1A2
	9K3kkL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zAL-00000000oG7-32wZ;
	Thu, 24 Oct 2024 14:50:21 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z7e-00000000nld-2nNg
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 14:47:36 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso11209361fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729781252; x=1730386052; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObLFhkfilDgkeJ8S/DOzsvtKeCP3rongHSO0w7aoSKI=;
        b=YiQqEd2exNbG+lz4En+nrBgkA7pwZwOJ90BoOcrIrdJO92ZLzlPwrCjN61QzGL5Ehe
         5KdKwDsF269RUwK4ZLYwq3ZcN7n6H2XKmS2crH7nV8QPLh7z6VOn1WHSz5ExyvhLoywT
         1dM1TuFkXvTvHGxU1hMIHiY/WgNZ9za73kG/nw2opKBJUgyPjNV1t/BTAMmI0vmNF3ha
         /4826ZWFse2w26NIWFzGxNjPP+g5X3QnOEGCODclM7PNDXmtklTe7VrGUE9B8xLejAZz
         /roH7amqF0Y2bUmao4Gj1p9tcfd8xigE6Z4Hgr/j06HrcTlJFh26et9Uv0cY7dqSbCOb
         BsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729781252; x=1730386052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObLFhkfilDgkeJ8S/DOzsvtKeCP3rongHSO0w7aoSKI=;
        b=NN9lqfM8+HI1fTozaHXYTuGImGvpKheOlJnCtFRP7960FAQIq28dtpGvMn6PLcc3x/
         MuzfF5nA+p5P+U1IYQ4ZZCIFjwYqApK6Nkg8txC4B9vp24m2iKDI1uqI6HS28gzaOeyb
         yaPj5TpPbYhkehpq/NEd2npXHZo+fZ6DKZmEJQu8BjVIBOyPSoXgRUKNIJKF2TnY4GPW
         evzLnzWnxDqXN8Qua5p4lD1vT5xd5Ot0NDByjmHUYmw3n3NKOpeLpwWz2N7Bt3dtqQPJ
         IUKo9XW+YyzTH/eRTySvERZ+akJY5u0rEAscZWLEiAUqCw+5Es9xk6CIU/fUUUBkFGaJ
         DCZw==
X-Forwarded-Encrypted: i=1; AJvYcCXGMpN/x6UUBzBgig0drq26dx/lrxf7UsaP6NChVSMoiCDIYqR1tu3jQkdTY2ncaapn1wptdy1bRtIN8ZWB5A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3UET0ISoixiBUA0cHVtpzRHRo0myr6TUKkQWsZYbb7yBUgEgx
	WT9RE33SyBTUeWTni7y56rchchm8w5uL+gbUguOMcQqo/DrH/LWDyiXx60OPqL/KAFtmL1AYiQL
	U9/FyjUuNHxoLUo3me3x/V/wOVQo=
X-Google-Smtp-Source: AGHT+IEhbTehtHKBddJu+7LbhCF86DQkzEp93FtdZ2l7+F3VCRGEUWQWdfUNYvEcj3Aq130BBZJzRw2RGRA3wyZ/KUI=
X-Received: by 2002:a2e:4609:0:b0:2fb:6198:d230 with SMTP id
 38308e7fff4ca-2fca8201182mr11805571fa.18.1729781251392; Thu, 24 Oct 2024
 07:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241023113626.12236-1-chris.lu@mediatek.com>
In-Reply-To: <20241023113626.12236-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 24 Oct 2024 10:47:17 -0400
Message-ID: <CABBYNZLpMCTy8z8ObEU90gqenb58VoB2EZKbZJfWK_J=h45Qew@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btmtk: adjust the position to init iso data anchor
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_074734_743229_E21A45AB 
X-CRM114-Status: GOOD (  18.30  )
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

On Wed, Oct 23, 2024 at 7:37=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> MediaTek iso data anchor init should be move to where MediaTek
> claims iso data interface.
> If there is an unexpected usb disconnect during setup flow,
> it will cause a NULL pointer crash issue when releasing iso
> anchor since the anchor wan't been init yet. Adjust the position
> to do iso data anchor init.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>

Please add the backtrace or a Link tag if there is an issue/bug open.
Also it is important to always include a Fixes tag with tha hash that
introduced the problem, specially in case of a crash since it might be
a good idea to backport to fix.

> ---
>  drivers/bluetooth/btmtk.c | 1 -
>  drivers/bluetooth/btusb.c | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index b7fc14aafc74..8a3f7c3fcfec 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1215,7 +1215,6 @@ static int btmtk_usb_isointf_init(struct hci_dev *h=
dev)
>         struct sk_buff *skb;
>         int err;
>
> -       init_usb_anchor(&btmtk_data->isopkt_anchor);
>         spin_lock_init(&btmtk_data->isorxlock);
>
>         __set_mtk_intr_interface(hdev);
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 9970470c9d15..15c0885c37cd 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2628,6 +2628,8 @@ static void btusb_mtk_claim_iso_intf(struct btusb_d=
ata *data)
>         struct btmtk_data *btmtk_data =3D hci_get_priv(data->hdev);
>         int err;
>
> +       init_usb_anchor(&btmtk_data->isopkt_anchor);
> +
>         err =3D usb_driver_claim_interface(&btusb_driver,
>                                          btmtk_data->isopkt_intf, data);
>         if (err < 0) {
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

