Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10750C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 19:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGSXO/dPI5+jUcYdtbCw4JQ75NbzfN4qotDsVJGePCc=; b=XrbucUKxhQzFnIiWMd1omsHZ7d
	Xu2sntujxn5ueLBzW+IloiDLkebC5cTuoExrnTyeakPQDM70Qkd5DHcvMQplcBLKilOvrBQJwiNiu
	w7/Nllw/JJDHi1yXnFDDcsAH5Nd2pTlFsXfbj4qR2hzxHy0xle/iYObJzhvN8DP1XZ1HiA4deqEP2
	q5dh/u+eT1z/D21a0wPG3peKPuIWb3935qbfikLa7zsiI/24OI2Nn7PhN7ybOxSyxvwUiQ0q8doF4
	OW/YhehUHAz/L+OT3lAabxu1yxe95SsCKmtf1gas6lLmALRvieu8gPePEb+hZ2o8okEUC51+97UyY
	ZRWfajfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wgb-000000051Ov-0NbA;
	Mon, 21 Apr 2025 19:20:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wgY-000000051N5-147w
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 19:20:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54c090fc7adso4664048e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745263204; x=1745868004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGSXO/dPI5+jUcYdtbCw4JQ75NbzfN4qotDsVJGePCc=;
        b=C5lRHS+nvamVNTV+0FOJgQ+N71bofzyjFU602rXJI97v+W5BrNiMsqEp3oY/LQ1Npw
         19mZGTgFzHy47/9MccBDbfaF+TNuT6ksE+iu74ISmjoZKuhGhEi4Q5esJ6MyhRHDYV+t
         h2klVk/dCXomHTMR4s5IfuPfSNKgEA0I+B0AVK7jdM1KY4c76kyi54Y9+Y0Wf4ML859Q
         zNIZnODfzIDePtm/L6coHjJah9WPgnkkxMiHhdWP6evPnYHYupd/0m7jF//BO+y6pEzU
         444q3IYUWdz1CxsucoDU3rA0F4QaRX3gbXB7Kh6W4NTzghqa49vPhHdFDWzlsjK3XRVd
         2pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745263204; x=1745868004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGSXO/dPI5+jUcYdtbCw4JQ75NbzfN4qotDsVJGePCc=;
        b=bgmNDZmEcWkYRVD+WDHVO+Hg/xbIF8SE3iyx+I6QB9pxYMMHayk+j1Y8rUmoOVr2iJ
         jVUtXtxLNm073RZgSBKwEsnNx3xXHmhIaA6UHyWSmCzsl+GYTn3MO5x+k/54zUk8NkD6
         iE8OYtvlOVr2OJVQxHXsJU/4IsR0hT2W5I6QEhRI3VBpjhF9uKChva/YoeaGdbxQYK3y
         vqgJv7emWZ/plvw7vrGOWy8UStOVYGZ8prLgRVBByhwVG3DgxVKoFYbmwJmpO4xdxYk0
         YqC2B5KKMnHTmNidmpqCH21BLesiOVxzf+kZ62WtcYXrrQrvrWFYn+0/xMLKuQOfhWy0
         OXqw==
X-Forwarded-Encrypted: i=1; AJvYcCXLFMwdSovzWeR5w22gzyOG8OqKxbjoFSUAq7fN1luaHVWWPoKwWt4UTpxSHU+k/Iwf0uHh5OUneE43RnAUOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Vj0aNySeGzdfWlbFvOK0kJ55DIHPLoADR1qePxYo3zB0FokF
	VqyzS5EijDIG4G6NATnBpjcn2GR2rzqyInjwHY8L1CQS86TuL3EC0Q6OdZatV+g2aO1kyh/RsMU
	YpSTkzEh6Ag4V7SeOU5yqGFgUCBA=
X-Gm-Gg: ASbGncunyuqeZJGVIEv0kPujhljekUe7Jc24DS5/G21UufhmRX0mnXa9H25Wc/XEqci
	7TDVY+BNIYj22zWtSXsNlvJO4Agjb4jcNGsyvybL435eiRUpjyZHw6SQYVO3YS7CKD3E8VoTvxA
	r/Na5aYfAGrtwJyJDUJfv5deMjTAdzAU8=
X-Google-Smtp-Source: AGHT+IGWThofn9kjjT1rYmsVcaPR8mJeAZVdYEgrHXFQvPh13eYbpQ/cssZm6gZPLFnSLYTrbE/DfygAH4fyrYRssLM=
X-Received: by 2002:a05:6512:3b93:b0:54d:6574:faec with SMTP id
 2adb3069b0e04-54d6e62b403mr3576751e87.20.1745263204132; Mon, 21 Apr 2025
 12:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250421072914.466092-1-chris.lu@mediatek.com> <20250421072914.466092-3-chris.lu@mediatek.com>
In-Reply-To: <20250421072914.466092-3-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 21 Apr 2025 15:19:51 -0400
X-Gm-Features: ATxdqUGeWWnEGKGhSE2EeBxAvnphjMU67tQYCCQZGa1NbEsf5e652QVfEsmaqSg
Message-ID: <CABBYNZLb_yqUsnRzcUxxtFnqEYwhD4hRXaAn-QwT8s6cZvTv_A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Bluetooth: btmtksdio: Do close if SDIO card
 removed without close
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>, 
	Will Lee <will-cy.lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_122006_294548_99064B4C 
X-CRM114-Status: GOOD (  15.73  )
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

On Mon, Apr 21, 2025 at 3:29=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> To prevent Bluetooth SDIO card from being physically removed suddenly,
> driver needs to ensure btmtksdio_close is called before btmtksdio_remove
> to disable interrupts and txrx workqueue.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>

Ditto, please add Fixes tag.

> ---
>  drivers/bluetooth/btmtksdio.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index 3c66e3ee9834..c16a3518b8ff 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -1447,11 +1447,15 @@ static void btmtksdio_remove(struct sdio_func *fu=
nc)
>         if (!bdev)
>                 return;
>
> +       hdev =3D bdev->hdev;
> +
> +       /* Make sure to call btmtksdio_close before removing sdio card */
> +       if (test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
> +               btmtksdio_close(hdev);
> +
>         /* Be consistent the state in btmtksdio_probe */
>         pm_runtime_get_noresume(bdev->dev);
>
> -       hdev =3D bdev->hdev;
> -
>         sdio_set_drvdata(func, NULL);
>         hci_unregister_dev(hdev);
>         hci_free_dev(hdev);
> --
> 2.45.2
>


--=20
Luiz Augusto von Dentz

