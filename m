Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD072C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cukYnh7YzrvpsQcy8CflblHBgUiu2QOawbA8hrGiwU=; b=Qn+5gbhLO4zRXenR/6mT32+9iz
	G4krFte96+hFmHoV6vKXCyweeWPRoU1WCCDGaSoTqZkdDYYcwCwiuR1Rba4A7t50tG7ktqlUdnAad
	hqmM0sCLlwhLVh2n3ksYok1Ipcbuk8G+Y+jlQsIpK6e/xbBZ8NToaeMdP4fEZBLw0Mg1+CJ8h8l+2
	1RBua22Tj93SV29rEE+fRHVoCYRA3CRa8GEU2/C+h+PD6zYy2APaz+V9AA0wPzPS3XGVFiQPhvFje
	bCeJS02+4xV6tlGHJ7P/4mHUb/YurbXcWw+Wp8ows9+IvuZa11bA2mPFXK+mze6i/Wn8uVTooHEJp
	DpufNPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkCA-0000000Cdcr-2FlL;
	Tue, 16 Apr 2024 14:54:02 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkC7-0000000CdcE-40Bo
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 14:54:01 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso54684231fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713279236; x=1713884036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cukYnh7YzrvpsQcy8CflblHBgUiu2QOawbA8hrGiwU=;
        b=hiK4JsxwZFudELAgMCyQu+5QEkFTxeke2+lPI95xYBra17spRU0faTALBU25xx0OKb
         CEw1iBV4f1wAhuE0M8qZLshhzPVZRzZ4VxTl5mdm0Pyv/D4vrwBDrW5U7qdTkzbR1Aan
         WOQISI/kQ4+bLtz/25XAwvn8ecAKKPe/uf3IRy0PE+IltGxLoKkRzOJbMgp1QAPG2vGg
         1nDIncvteJx515H7NoU3ScbozDVxMYaSZUS7s3Zp83Eb0AUmkqJQ9f40ex8rxHEAZfaO
         KQin6wkUPJtJ+v7tDxAZM1iOic9wD6ITt9hbz/Qsf00RkEG2kzngSYa1TinXnJzn50ur
         0u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713279236; x=1713884036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cukYnh7YzrvpsQcy8CflblHBgUiu2QOawbA8hrGiwU=;
        b=eNAspb91t62iyvy9TCKiB9cFqMKI4gNHCFZZwYO/Wfen/nlKHwQv2OQr3ly1/nAp4Z
         EDEA/YmJydupQMFq1WkbbtTnwtKiHnINHEzDgOdDGUJ0xfuNFt3KUZgkxVqR04QyOGhZ
         prlHnYwzxK9QvTpRnc7iYgJoFT5QbYfKG8M9fq6n+xTNkAI84QzJDARwoUJWK5s4TUWl
         91kuShWPk/H3G3Cs5tKceL2MLrfSrcRpTzbhuC+sd76ZTZyUbEtOqb97C09cOoDhsccq
         s2RXFi8yg92ZScwnnLH1hAOuyqEbwmyhRIT5AU/JlC/+1KFN36dC+3xX9BGBWqym/y9T
         vA1A==
X-Forwarded-Encrypted: i=1; AJvYcCUKocSdIR8EWLNYIfVI0aYu+mIJYMjPmgAqThp9NiNiWKwYeNHCvX82DgKqQo00P9PHnP7uwuXgWW6uFTVks0IPDpExR9Fgtz7FZKjpSFZuiW3l
X-Gm-Message-State: AOJu0YwKRgLBGE7+JlfPy9T2z56syrRmWEfMFD/A8UAaqi6zGnxOCOsu
	WAse+ASsn4dWaMRMLJEQQ5wnm/EG5W4EvdXQoYYduFX2iVbRZ+1uquIv8WPwCiEG5VzX2Kc0van
	9QVzr2N0nAMSjVPobMjHxSlwmoOE=
X-Google-Smtp-Source: AGHT+IG5vvSLyFxVVk4DVxlcD5kc+Ye3Ncgbh0mG8jzgwD3uq3A+QxoqnzDmUrKBBFElmhmuw0XcQmFWvPGap+QBNzk=
X-Received: by 2002:a2e:3209:0:b0:2d9:fa96:1620 with SMTP id
 y9-20020a2e3209000000b002d9fa961620mr11726167ljy.29.1713279235879; Tue, 16
 Apr 2024 07:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240412084128.24452-1-hao.qin@mediatek.com>
In-Reply-To: <20240412084128.24452-1-hao.qin@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 16 Apr 2024 10:53:43 -0400
Message-ID: <CABBYNZLGocaksAKCTso3zL-bAuSKaBurTtOFZx_rw=HiKMmqtA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Add usb reset for firmware
 setup failure
To: Hao Qin <hao.qin@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_075400_020523_C0A6ABD9 
X-CRM114-Status: GOOD (  15.69  )
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

On Fri, Apr 12, 2024 at 4:43=E2=80=AFAM Hao Qin <hao.qin@mediatek.com> wrot=
e:
>
> Add usb reset to recover BT device from a firmware setup failure,
> it will restore the device to its original state and attempt setup
> firmware again.
>
> Signed-off-by: Hao Qin <hao.qin@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 4c0cc13adb47..c5aab361795e 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3160,6 +3160,9 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>                                                 btusb_mtk_hci_wmt_sync);
>                 if (err < 0) {
>                         bt_dev_err(hdev, "Failed to set up firmware (%d)"=
, err);
> +                       btusb_stop_traffic(data);
> +                       usb_kill_anchored_urbs(&data->tx_anchor);
> +                       usb_queue_reset_device(data->intf);

What if this was already caused by a reset? Wouldn't that create a
loop resetting the device over and over again?

>                         return err;
>                 }
>
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

