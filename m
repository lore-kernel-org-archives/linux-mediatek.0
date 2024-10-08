Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80C2CEF173
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aGEcuVZw3m3YXpk5HhLAFOUMtHT0mCLFSBTmYzosXQ=; b=hVD4AgRgCarp+F0lgsU9pTjAdE
	iho6SRVviVBXGANucQdlJmj6iTDdT2WK7hjSbE8A66KKzrYKZ+UsdmDFn4q3LlyGRWeab4s7F+xaU
	u+PdFLsw2hENEJkN0RVzLs4+mV9tW9MnTfYVorFJWyqKrn5tf22sBjgYZmKt39NMOpfUfPcXGUDcl
	+96QwoAjGUO9piEkS2U3sPN6Gfb0Q+qBXhJGRY1BTeaxKwYgW1FVVV8lwOtMzskI2lc5eZT1izaZX
	uBcFm3lTexfD65Jcekj4N10EXeYazU1VZrQGilPlQ7/ACtt1SlGtZx25RB06ymD/KGNRFpGGujrqs
	uFDK8kXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syAUn-000000062jN-35eO;
	Tue, 08 Oct 2024 13:43:25 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syAQu-000000061dV-0JTn
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 13:39:25 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fac3f20f1dso60485781fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728394761; x=1728999561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aGEcuVZw3m3YXpk5HhLAFOUMtHT0mCLFSBTmYzosXQ=;
        b=Tz7Dzd+YUIoBcxtrrVvuC+ehMRpaa9KjNhru73gjKntskDXEeo9sfsVe50HSPPPeE2
         3IfZ1zUGfndPu5uqFS+M/n2WgSK0QVel6blFGaeL2gyWy1vtuVDPFe7LoE3Olqnpg0ZX
         oLp0h9fq+z8Uvo1CnUmfeymU3b7ObGoKyssv6cs6Sx6ZXwz9mH/vC8dXROuTIgFoq2ek
         N12NCXG1/5SGpa6nRRsPVfjK4m+aDE6F/X/dL32QvkP5zzrgk3P62aVDxZXuBCeWv72F
         HKIvQqxWXWnvZK6b0e7H7I4KIcZ7hxHq8OO2IBBA9Af4AU/81+YS29WFMyIpT3PQ5ZM/
         n4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394761; x=1728999561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aGEcuVZw3m3YXpk5HhLAFOUMtHT0mCLFSBTmYzosXQ=;
        b=hutqpYAeeEB31C1K+dv6KBIHt9kerIiuTGiK+G0aA+APb6dRxPvPqA6GgBKiHSGST8
         D+ufwl/GRpZnDUGQl2lKw/xLzH+/6eX0+ZnFkzcjX8Xx0RNkRDr+PpJJCDI6VNAgE1Jv
         i2YgzyU7hRvTVZm32YfO1aZMbGkX9E0T9SVerIktRRGTOn9oEa0veCyMj2pZfTYEgaY2
         6ZdatEFD7Y0R4sA7o4B9KdXY6VfR+iLkJ1fRxMWce4JuDj3bzFPN+tMgDfXYVWwtrgXn
         sHw3l8Y7b0iYz4Mt4NWtOKsyC3lnhReFtF4ULYFwE+89PdEWfDnXIMg4n+fzbQhRcbbS
         bTEA==
X-Forwarded-Encrypted: i=1; AJvYcCXzT1y/W7UsELUSgL3jPi7f1NgJhLW4CfXHBhATv5+GNzK1Oo/SWHRCh0syqPIBNX9jpaMqeNUeSLmF5x6GVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+OMRfA+AUpXXtAthzt1HN+YnCi/cSW+zJR6JgdDA4FVQ3puze
	PzKRT3jhsyQNBtHtwHpW2EVD5PqJPudmTBq7gwMqC0N7Ngl30UbnMu82PP43tDZxzYt+TqyXGcC
	/0jsWOnVgiFWrEqSfVyiqWNd06TU=
X-Google-Smtp-Source: AGHT+IFRuFdiSaQmQPTm/iVOtBf4fHkAXNvgRlJA+uLxnNsq4xXy9ylkWdSDqJ6NdnkIL3gVC/tdOMK8VDVsrWaHGDA=
X-Received: by 2002:a05:651c:1502:b0:2fa:e03a:bee7 with SMTP id
 38308e7fff4ca-2faf3c64dffmr83701601fa.28.1728394761050; Tue, 08 Oct 2024
 06:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241008082721.4004100-1-wenst@chromium.org>
In-Reply-To: <20241008082721.4004100-1-wenst@chromium.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 8 Oct 2024 09:39:05 -0400
Message-ID: <CABBYNZ+UGx8TtW+aXZer_j=L79NYEP28+FcSeRqT3BKN7L+CGw@mail.gmail.com>
Subject: Re: [PATCH RESEND] Bluetooth: btmtksdio: Lookup device node only as fallback
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@kernel.org>, 
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_063924_134824_9C9039CB 
X-CRM114-Status: GOOD (  20.89  )
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

On Tue, Oct 8, 2024 at 4:27=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> If the device tree is properly written, the SDIO function device node
> should be correctly defined, and the mmc core in Linux should correctly
> tie it to the device being probed.
>
> Only fall back to searching for the device node by compatible if the
> original device node tied to the device is incorrect, as seen in older
> device trees.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I was hoping to see some Reviewed-by/Tested-by here, were the mediatek
made aware of these changes?

> ---
> Resending after three and a half months.
>
> This follows up on the MT7921S bluetooth binding and DT fixup patches [1]=
.
> This should not be backported.
>
> [1] https://lore.kernel.org/linux-bluetooth/20240412073046.1192744-1-wens=
t@chromium.org/
>
>  drivers/bluetooth/btmtksdio.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index cc097aedc1e1..a1dfcfe43d3a 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -1328,6 +1328,8 @@ static int btmtksdio_probe(struct sdio_func *func,
>  {
>         struct btmtksdio_dev *bdev;
>         struct hci_dev *hdev;
> +       struct device_node *old_node;
> +       bool restore_node;
>         int err;
>
>         bdev =3D devm_kzalloc(&func->dev, sizeof(*bdev), GFP_KERNEL);
> @@ -1411,13 +1413,24 @@ static int btmtksdio_probe(struct sdio_func *func=
,
>         if (err)
>                 bt_dev_err(hdev, "failed to initialize device wakeup");
>
> -       bdev->dev->of_node =3D of_find_compatible_node(NULL, NULL,
> -                                                    "mediatek,mt7921s-bl=
uetooth");
> +       restore_node =3D false;
> +       if (!of_device_is_compatible(bdev->dev->of_node, "mediatek,mt7921=
s-bluetooth")) {
> +               restore_node =3D true;
> +               old_node =3D bdev->dev->of_node;
> +               bdev->dev->of_node =3D of_find_compatible_node(NULL, NULL=
,
> +                                                            "mediatek,mt=
7921s-bluetooth");
> +       }
> +
>         bdev->reset =3D devm_gpiod_get_optional(bdev->dev, "reset",
>                                               GPIOD_OUT_LOW);
>         if (IS_ERR(bdev->reset))
>                 err =3D PTR_ERR(bdev->reset);
>
> +       if (restore_node) {
> +               of_node_put(bdev->dev->of_node);
> +               bdev->dev->of_node =3D old_node;
> +       }
> +
>         return err;
>  }
>
> --
> 2.47.0.rc0.187.ge670bccf7e-goog
>


--=20
Luiz Augusto von Dentz

