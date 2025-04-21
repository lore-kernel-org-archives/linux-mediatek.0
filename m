Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25C4C369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJcRqfa5CCPmTaOo2sTvJJGxZ9DlOMCI9iLuHheiPr8=; b=teKWfIlwfKZe2kRdxlTPqBV6+X
	lWrdMG8Gt9qQUwkslWEKzvMdrGpJ+V+Tq/u30VU35xb3/FE84/a4GKICG0Cd8EcB0Y/9wpVS0OSNR
	oQew406okuqst8yOID0Kz0ff2mMOq8Uji+QgPXnIzWRFNP/ysJa/US4e06M42U6pErNupl1bCnnBN
	9RyTCwVfYNe5sr0fpBoXpdvCL9sG4K+JxA42QfcbfTbmnU2ogbpt00qxcosNB+cXxQ8wwRb/Wb4Rr
	ed9axJ5CsAanjE2HpNft+YRHTB9o4SE2YfGS31Z1afbyQRQL9eJ3Qh0Kcps+vXuQ+CGJoIwkp0PwQ
	pQZsIGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wfm-0000000517M-36qR;
	Mon, 21 Apr 2025 19:19:18 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wfj-0000000515u-37Vp
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 19:19:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so6020863e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745263153; x=1745867953; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJcRqfa5CCPmTaOo2sTvJJGxZ9DlOMCI9iLuHheiPr8=;
        b=QWFmaCepZKl92xPiGNk7RkQlVzlNLtrqGH9ESWARvc5EcLF1/3p/cn80zLwuYS7PKc
         FtL7ZOFjCdqJsbm4ECUA45jOe3A4xSCeS00Pid77+hGN4qAXYNcLpcWb7VSBK1Zi1FkB
         fZRo+Lctuik1Y8CDzIzXrcShdBNOzc6lvjSD+TKC0GU7+JLSm2Dmgaw3PJmass3IdUAl
         m6p1VPvINyI76LjEMHDFkx0rnQb2HMGhWvkFPrWqnaLRO3ZH/CvYyB7mVfY4A8LbRHSt
         qHzKvqMYmlaJh1wNHuDaql6T2Fj8QxRnx+IQWTsMfrC+jfQX9LPAhgTrJFnwldzKAj0P
         frUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745263153; x=1745867953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJcRqfa5CCPmTaOo2sTvJJGxZ9DlOMCI9iLuHheiPr8=;
        b=LYETNZbwpx2IrxcjzyaCpBpcKCgTTpNCAnI+ciyB6jIv/eV1EdVutKHXHiFBCrGBoD
         fAdc9EnGlwM8FcUA6dNdFsJ4olLFaOKxd76Xhmd6FQzIcTD1wVfRz8GDzSBmNCOxah6U
         PIIBfAOe6PgXBOZNjV5sZcqntyS58yNeMghYg1axjXw9pOdiLzjDg1UfUiWhA6Yoz3jJ
         azIyoG7TWwZoIRnTRvlWDxioyqi9NkR8ztgUt9SVvRqIDNBbStAGXvKo/OdE2b7I3eVA
         gnSeDnkFvajfifhSjf5+D7WxpawkB1/qVH/u+iQpSQxE/aG9Ji+NHC3/qhYhi1D50PrE
         MLfw==
X-Forwarded-Encrypted: i=1; AJvYcCXbCXXC0h4ngi7+XfFBl7fqL/VqdNlcZOaz0HHGlIqzPdr57wxxqM3ye14XApPtz0T8OxQorqQlF+EQx03i0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEOc+M+c1ZnUlX7IVTzregYi/oXkDSmQgwHeVliSTjotvVhQLB
	CgIaC0lpCo4VvkjnXy4q1/pRZziT+FesSEWcwCI4oEOHF9oBec2Kxv694F8C0aoXOo8+XPI5hCo
	lyXaMs7p2j2yg9sQ+OrCjRto+Wlg=
X-Gm-Gg: ASbGncsR/ubUqNCfBcwI8wjkhfYiIde0wrlnrBOMr3Q0tHvxe8bUlna8Ul/GyM+DwFT
	r5xrjCeqWPeX7OiauHNYXQSweL4KK6/CcQjJtfhNR9DbO5DO/GKazM2RSfQqAnJz7wyy1aEBnO1
	QWmoXEwVpAw0TN3RO5kWf7
X-Google-Smtp-Source: AGHT+IHXHFlrF4EijWInQ0q6byiERQ/3YNIJpnij63pytbHmgcPlJabHpsS0ZaHrvX3ER21PDg85XpuTKP5mo+QMWuE=
X-Received: by 2002:a05:6512:4020:b0:54c:a49:d3de with SMTP id
 2adb3069b0e04-54d6e61ba8amr3683500e87.10.1745263152985; Mon, 21 Apr 2025
 12:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250421072914.466092-1-chris.lu@mediatek.com> <20250421072914.466092-2-chris.lu@mediatek.com>
In-Reply-To: <20250421072914.466092-2-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 21 Apr 2025 15:19:00 -0400
X-Gm-Features: ATxdqUGL3FDMyjw1v0Rvzf5QBxrifSLl3fT6ELdaZgKRxwz3EqxSIe_IBUO2sh0
Message-ID: <CABBYNZLZ7tx6nm1=gzuShgrp5xV4_4AT4_Y=kvAg8zbWjTR5dQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Bluetooth: btmtksdio: Check function enabled
 before doing close
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
X-CRM114-CacheID: sfid-20250421_121915_780152_A45CC23E 
X-CRM114-Status: GOOD (  13.91  )
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
> Check BTMTKSDIO_FUNC_ENABLED flag before doing close to prevent
> btmtksdio_close been called twice.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>

Please add Fixes tag.

> ---
>  drivers/bluetooth/btmtksdio.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index 566c136e83bf..3c66e3ee9834 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -723,6 +723,10 @@ static int btmtksdio_close(struct hci_dev *hdev)
>  {
>         struct btmtksdio_dev *bdev =3D hci_get_drvdata(hdev);
>
> +       /* Skip btmtksdio_close if BTMTKSDIO_FUNC_ENABLED isn't set */
> +       if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
> +               return 0;
> +
>         sdio_claim_host(bdev->func);
>
>         /* Disable interrupt */
> --
> 2.45.2
>


--=20
Luiz Augusto von Dentz

