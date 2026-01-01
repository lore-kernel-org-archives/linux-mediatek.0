Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E236EEB573
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 00:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zzksPKZPWZUHlNBpPimtH9Rx1z4lA3vMPadPMifw6g=; b=WuFGbUCEEjjI/Vq74VCtF2mXhg
	dJesldgzogj7VfgTCwMMmRuIwimgYrhzWPxOtjgV5PARLHLwaKyVly/MrwMiJrpUqvWMiWGfNpMU4
	0Fqy+gVKWMXNz3g7UeatBaXMqdIXyldzMNgs5kYeZUO28oqez37oPM1DlqGu7KlvpPJwiz+AmgF/m
	jHd7U9eeeMBkKghYUBKFg25r5nXqyHR+I5ZdPUXuA5xyK4pK9+o24PSfEtVYVfwHI15Ne80Q/dyZe
	uZfs8kG2C3NLXDTrhcOZwwTgrnAhRx+SRo3QFKZzQ7P6U6fl5zBR27aR4Y+KM6cbqcWF45rT7q9NM
	sKRXP9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6l5-00000006TGz-39UE;
	Thu, 01 Jan 2026 00:41:43 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6l2-00000006TG6-1yYb
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 00:41:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7a72874af1so1879727366b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 16:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767228098; x=1767832898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zzksPKZPWZUHlNBpPimtH9Rx1z4lA3vMPadPMifw6g=;
        b=RufPKiMaNw2FqvB1NhYpKbmkYz6N4e7eHxKwYznf9jzZ6Hg09WsHtPKncb5uncFHof
         4k4Lc3Ylp7Bv/pf5XvhvZFnfk7HhK5E3rD1I+5vCD2mguFX9A3ib+V5uA5W401D2TmLQ
         gZFho4kQPizDPjXAZH2ykZ21sev2odsaVs4wy8T1f2TxpIBShrqlYyv3JEOqT8YVekxt
         yJbGPlIa4pHVcX/7/yFdjGmYz0NXmqs+g7TJtXLOJrcd5zEu/jF2fHLskDdKXBcR83Ib
         ahAV4BftH7gwPehntkGPeWglJ8IWrxCJ4v7o/R+HceOBHb4rrbczE05amVV1ga7vrpkE
         ySGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767228098; x=1767832898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4zzksPKZPWZUHlNBpPimtH9Rx1z4lA3vMPadPMifw6g=;
        b=lZ61i2ogLs63MjYXiUvuZHjMcvB6bZRppWjlhovsdRu9SxxwRqYsgBHa5E7bkxaDiF
         BmLizx1T7CVEagkToRgLkd+fraM2hPq1BaoknFy/lx84wO8cwyMvAdsI5PheBCLOBYTG
         l0ws/fQKQW9zWwr8/h7niJs/8NGoNCtne72aKPkKN0OzVKAv3+t1ThgxbcMyDOU1HpfK
         jC6iwBTMyid7ij4mc60WPgEkRI97XcrGmoKLeZFvi7yXbGzOm/UmB5Mu6Ygkezt9lSJn
         QASHE1qRb4+eInNV4FUvgFPr2QimRLqmzFtgCDzcF3IVOlW6OolLoCvcaeJX87vexRje
         Gpbw==
X-Forwarded-Encrypted: i=1; AJvYcCV52zYr51qRhDzC/AbSQ2fPH+RTYqiHhoRmzfuCacU5ltqfwf5TOBPtk2lABdgIuhBf1ev+7Sf3uUHs5Gkq9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE4LSoANESjbx1wj+2/M19MITtwbOtB3/kLWZR0B/SNphDgwJF
	+Dnmhpz+o7j+4KQgXm9XLDqbVf8AK5EyyejpkL4Y+DxgO4xS1+ODkXn2nogGOuMfUTapCbmmNcr
	oNW51njYg2fwEm5dbSswL3DGyqXO5e6o=
X-Gm-Gg: AY/fxX5x9nJGtVn1IRUXP7iWvkKaHZkzKxE5Yi6oKXLqiWsa77fOTh5co4ifKosoU5X
	NvBM5v00hie28JoSutnfSs5mBy3vgfBqinmKHeIsyHBTqES+OR/akbxTeuE9nP8mHMKSEV/Z8xo
	bK3YiQWmQV+q/gmKwTYGXxt6affoWkoyf2iW4d77MgTt/mcEjGAON6t60zTqAI7ymCPFt4IPZ36
	a289czkKYQ09iEVaYsp/wvoknHR7qaHrCNQ+880NpmbTMH6Tpsr3ReU5nubgCHx7cfInI682bRN
	8eplTZzoydbpcmLCJDmyhs3CxeBmifSkmhCfoKSFZ5HqUIgYHpB8289Ou/tlyL1x0Ps=
X-Google-Smtp-Source: AGHT+IEsDAjrzY7RYgrHd/ztJQ1jHCf1aLEL7TFb54prQWsJy57fUQAi+XFSKVoGBeMqqqjI2GIY9k7RUSPJXb6X6lE=
X-Received: by 2002:a17:907:720f:b0:b73:8639:cd96 with SMTP id
 a640c23a62f3a-b8036f3a367mr3846484166b.24.1767228098167; Wed, 31 Dec 2025
 16:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20251231223702.30957-1-zbowling@gmail.com> <20260101002321.19332-1-zbowling@gmail.com>
In-Reply-To: <20260101002321.19332-1-zbowling@gmail.com>
From: Zac Bowling <zbowling@gmail.com>
Date: Wed, 31 Dec 2025 16:41:27 -0800
X-Gm-Features: AQt7F2pI_dhOs-zbE7FGIXVKviexl5P5mc0QK9CuuCDaL6zAWkJg3ebgrIT0Ccc
Message-ID: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: mt76: mt7925: fix missing mutex protection in
 runtime PM and MLO PM
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com, 
	sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_164142_027928_8E58D469 
X-CRM114-Status: GOOD (  22.36  )
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

Note, this is an update to the original patch I sent.

In this v2 patch, I moved mutex protection from inside
mt7925_roc_abort_sync() to the
call site in pci.c. The previous approach caused a self-deadlock when
roc_abort_sync was
called from the station remove path, which already holds the mutex.

I created a repo with all these patches if that makes it easier:
https://github.com/zbowling/mt7925

These bugs also exist in the mt7921 driver, which this mt7925 driver
seems to fork from.
These lock patterns match the much older mt7615 driver and other wifi drive=
rs.

Zac Bowling

Zac Bowling


On Wed, Dec 31, 2025 at 4:23=E2=80=AFPM Zac Bowling <zbowling@gmail.com> wr=
ote:
>
> From: Zac Bowling <zac@zacbowling.com>
>
> Two additional code paths were identified that iterate over active
> interfaces and call MCU functions without proper mutex protection:
>
> 1. mt7925_set_runtime_pm(): Called when runtime PM settings change.
>    The callback mt7925_pm_interface_iter() calls mt7925_mcu_set_beacon_fi=
lter()
>    which in turn calls mt7925_mcu_set_rxfilter(). These MCU functions req=
uire
>    the device mutex to be held.
>
> 2. mt7925_mlo_pm_work(): A workqueue function for MLO power management.
>    The callback mt7925_mlo_pm_iter() was acquiring mutex internally, whic=
h
>    is inconsistent with the rest of the driver where the caller holds the
>    mutex during interface iteration. Move the mutex to the caller for
>    consistency and to prevent potential race conditions.
>
> The impact of these bugs:
> - mt7925_set_runtime_pm(): Can cause deadlocks when power management
>   settings are changed while WiFi is active
> - mt7925_mlo_pm_work(): Can cause race conditions during MLO power save
>   state transitions
>
> Note: Similar bugs exist in the mt7921 driver and should be fixed in a
> separate patch series.
>
> Reported-by: Zac Bowling <zac@zacbowling.com>
> Tested-by: Zac Bowling <zac@zacbowling.com>
> Signed-off-by: Zac Bowling <zac@zacbowling.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index 3001a62a8b67..9f17b21aef1c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -751,9 +751,11 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
>         bool monitor =3D !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
>
>         pm->enable =3D pm->enable_user && !monitor;
> +       mt792x_mutex_acquire(dev);
>         ieee80211_iterate_active_interfaces(hw,
>                                             IEEE80211_IFACE_ITER_RESUME_A=
LL,
>                                             mt7925_pm_interface_iter, dev=
);
> +       mt792x_mutex_release(dev);
>         pm->ds_enable =3D pm->ds_enable_user && !monitor;
>         mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
>  }
> @@ -1301,14 +1303,12 @@ mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ie=
ee80211_vif *vif)
>         if (mvif->mlo_pm_state !=3D MT792x_MLO_CHANGED_PS)
>                 return;
>
> -       mt792x_mutex_acquire(dev);
>         for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
>                 bss_conf =3D mt792x_vif_to_bss_conf(vif, i);
>                 if (!bss_conf)
>                         continue;
>                 mt7925_mcu_uni_bss_ps(dev, bss_conf);
>         }
> -       mt792x_mutex_release(dev);
>  }
>
>  void mt7925_mlo_pm_work(struct work_struct *work)
> @@ -1317,9 +1317,11 @@ void mt7925_mlo_pm_work(struct work_struct *work)
>                                               mlo_pm_work.work);
>         struct ieee80211_hw *hw =3D mt76_hw(dev);
>
> +       mt792x_mutex_acquire(dev);
>         ieee80211_iterate_active_interfaces(hw,
>                                             IEEE80211_IFACE_ITER_RESUME_A=
LL,
>                                             mt7925_mlo_pm_iter, dev);
> +       mt792x_mutex_release(dev);
>  }
>
>  void mt7925_scan_work(struct work_struct *work)
> --
> 2.51.0
>

