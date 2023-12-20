Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A614CC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 22:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbBBqHh5fKcUfXzPQSFe7Mc3xQp0cVkOSlT5xsu4+tM=; b=LA+LPd5lCabV94HHJwYhPlnGG3
	w+AYEQ8vfVHg60PUJe8pcQzzXQJrzWwlq0UUuTptSv9PH4QoX9EBWR4WaYT2ShWCOAiayRqCDqs/c
	44nZu04SOcp/r4Fpmc1frz0wNoOc39xm+RecJqUewB+SMBVaS08xqbklD0meiIdfIz9kpTRj/XgMP
	m0DtYYYO3e3zABDeUN6hv4bts3hYRRz7H1FhZRE/5Kl6cjwqM0qXc5JT7WzHU06I8IBaoAKDxBlw6
	kMpxLSrWN5HCoxiufFLNrOsDV6at7MFBH98Y0neDMeVNObzwukxbfVrXfxz/OOIv758AOLq35+y0Q
	IGVtKKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG4me-00122U-22;
	Wed, 20 Dec 2023 22:11:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG4mc-00121z-14
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 22:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A940CCE180B
	for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 22:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86A3C433CA
	for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 22:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703110273;
	bh=rxDWW9QQfeURQ6v06XkkImaEoG89S2ehL9UgQ+cUoeA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WGdmIwZrgaS4iKYsgfiyk4PJt2NEUCZdE82cSr+sKOgC46vX6YZwye7l0B69icPv7
	 D72cgncPEjzaJhxcsk8bAFIcyB0PHq8Cl3b3awZ+tqoi3O+O/VMfonNqb65qhhQfQo
	 +hrdyqTgoPpbMsNTRQQKdR+9R+ZwhZCfG6BAGK0X4p+8oYWm3qbliXgklmgwf2XO/b
	 2GxuNMVEAMI6+bJ2u9Qq6Ed9gZN+DSAhLyvlfbtC3rmtiUnAoKqtH36qgBX2VOD91a
	 kciaHzPSYJIEMYZJrDJ9yyam++bkFUZqCpTjsEoSSUYvyKoBoIWPebmeU6Db4HA3/F
	 raKZP3himDs8Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e4e36c09cso53625e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 14:11:13 -0800 (PST)
X-Gm-Message-State: AOJu0YyTRK+2qTdtXVnfS63muBIBKXnuZxbshra0YN+TeCmyDZm5ot8r
	byM5DV7FSQOEYKJPcQj5KMbNPh0ddaJ/HnG5Rmk=
X-Google-Smtp-Source: AGHT+IEjwS9CUhYy5Y14XEyQPAzBrDZRuoUZgOQ5H8WeRazoWY/3VWAE0atf0hicbr0SYACedWqrgT52JeFq/jX9a0Q=
X-Received: by 2002:a05:6512:15a2:b0:50e:3216:ca49 with SMTP id
 bp34-20020a05651215a200b0050e3216ca49mr8560824lfb.3.1703110272104; Wed, 20
 Dec 2023 14:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20231220092138.12830-1-mingyen.hsieh@mediatek.com> <20231220092138.12830-3-mingyen.hsieh@mediatek.com>
In-Reply-To: <20231220092138.12830-3-mingyen.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 20 Dec 2023 16:11:00 -0600
X-Gmail-Original-Message-ID: <CAGp9LzoB5FRiectZD4RL2m6twBicSZvk3TvBM9EQgrsPyHG69g@mail.gmail.com>
Message-ID: <CAGp9LzoB5FRiectZD4RL2m6twBicSZvk3TvBM9EQgrsPyHG69g@mail.gmail.com>
Subject: Re: [PATCH 2/4] wifi: mt76: mt7921: fix potential command timeout
 issues when suspend
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com, 
	Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, 
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
	ch.yeh@mediatek.com, posh.sun@mediatek.com, Quan.Zhou@mediatek.com, 
	Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_141118_853507_3AEA15B5 
X-CRM114-Status: GOOD (  16.08  )
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

Hi Mingyen,

On Wed, Dec 20, 2023 at 3:22=E2=80=AFAM Mingyen Hsieh
<mingyen.hsieh@mediatek.com> wrote:
>
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> An ongoing command may be interrupted if suspended, leading to a
> command timeout. Add a lock to the suspend function in order to
> protect the ongoing command from being interrupted.
>
> Signed-off-by: Leon Yen <leon.yen@mediatek.com>
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 57903c6e4f11..e1c53f18abdc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -409,7 +409,9 @@ static int mt7921_pci_suspend(struct device *device)
>         if (err < 0)
>                 goto restore_suspend;
>
> +       mt792x_mutex_acquire(dev);
>         err =3D mt76_connac_mcu_set_hif_suspend(mdev, true);
> +       mt792x_mutex_release(dev);

I had assumed that all commands would finish up before the suspend
handler is called, given that processes are frozen before the
suspension can progress. Could you provide more details on the
specific conflict between these two commands and how it results in the
command timeout?

Moreover, while I understand you've identified some potential issues,
I suggest we work towards a comprehensive solution to address timeouts
caused by potential command conflicts, not just for the specific
command. For instance, we should take into account other MCU commands
during suspension and extend this consideration to similar scenarios
in SDIO suspension.

>         if (err)
>                 goto restore_suspend;
>
> --
> 2.18.0
>
>

