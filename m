Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14302D43361
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dct+rY0T9fHZuq9ATdOls+p68w568/KDj3ScHbfXOrE=; b=M9p1Wkxz2/cY6jBv8c1ccuuysL
	AwIqXCBpsV/VR5Gbu1FgkRf8Cugi3R0FxAYm7AFyIHtqkcfQMS6Oo3N3aWSRIG12wQCIaj9K2I0fp
	3wBzLz64Vl34fYyqBZkAF1Bpx+ezpdbhQeW4IC2yO5TJvvrSUs9oOnn3QnlcavtcZSh/kIa/UFB62
	tDrlEtEYWwAe+1gYoewvHSF4Bj8JferU0vZWw6rk6DGNKfOOk1nq7xv8TQ9WpXXWTtN2QoUcnCG3K
	AfrvfZHUJo6MfO4NHNoJQ8evlkV7bWMPKjwtDWYISrpagvxXd7XzfScZiJM/d93QXa2b7iPxFY6Ds
	CRgtfvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTqB0-0000000HQTp-1q1h;
	Thu, 11 Dec 2025 23:34:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTqAx-0000000HQTO-3Usf
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E159460132
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 23:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81252C4AF09
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765496062;
	bh=vn95PIaMLj6upgO5jMwgVKMQ1smNCYmC4ZDr1a/82Iw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ubvIHz+F1DDKY2LB0WZyytp+iqtNs3qy1BOeOM5ioX1N5WJdTxzKTyLZuhoX0ekEr
	 L3FnTX1iBYaZTu8uFnjJ9MqsBJzh/HqgU/m0Y3N8ZUS+9gUocvOuGaG9uGjEhJVXGQ
	 WxwUumUMQ3vLp6008fmEGaXFmk3SbkIdY4mqrLVf/CdNHX+iNwDQGQH99wWZI27xYF
	 ReErjsk8chIZxkpTKS/yO6CTHzj4IXLPtWwXh8lgYmv9DartuvAnOtiAkD3YyH4skn
	 6msDcFiXPZmc68YFSRYWk3KRhpJv+j0sErAG95ZpgLwR5IBBvlnQOhCXMaGB7YIKQw
	 Q3Udc4XdPb8MQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5958931c9c7so812806e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:34:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDE57CLq4Xa2TrJ2H9XW3SraQK2NSmf73z+me9fJJugx+d6H69upIWAyb9ymL2uKRzufW6B+eztxAE8UyUEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQdkubKLy5UfjnxnXekQeZ894c8pOQD3wERi+e94NN21PgqHi1
	FQLCzsrxmih+km9qS3+/4d8DzIEiG1DrqJDlfCGP9Fh+/WsJ1nnMhcyEyA/cxiEuYPpWh5ACtbL
	GwJUOkIdxbW9cxaTtvikjy/VelZrNIxI=
X-Google-Smtp-Source: AGHT+IEvQ91wmXN8XI7iCFfPklQkxRZiF0PCp/6Y8Gf/it+S6o+vKGFQFDujWCI6SAYtL+noliTTyYPhy2jqxa8s2Uk=
X-Received: by 2002:a05:651c:a0a:b0:37a:4c29:3a90 with SMTP id
 38308e7fff4ca-37fd05f238dmr820841fa.0.1765496060863; Thu, 11 Dec 2025
 15:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20251211124344.4172470-1-leon.yen@mediatek.com>
In-Reply-To: <20251211124344.4172470-1-leon.yen@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 11 Dec 2025 17:34:09 -0600
X-Gmail-Original-Message-ID: <CAGp9Lzo6DnBN+x-HGGDBJE2x-pqm6TPp77qch_VrFgq=cgKzQw@mail.gmail.com>
X-Gm-Features: AQt7F2qoFrXbjs6uKgJY9lNoURXQF9CRVoAGd6ZNwW-075Q2iDyH-RPqdeD-40s
Message-ID: <CAGp9Lzo6DnBN+x-HGGDBJE2x-pqm6TPp77qch_VrFgq=cgKzQw@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt792x: Fix a potential deadlock in high-load situations
To: Leon Yen <leon.yen@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, deren.wu@mediatek.com, 
	sean.wang@mediatek.com, mingyen.hsieh@mediatek.com, michael.lo@mediatek.com, 
	allan.wang@mediatek.com, quan.zhou@mediatek.com, sarick.jiang@mediatek.com, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Leon,

Nice catch! But I think this approach can still lead to deadlock.
If both workers fire at the same time, they may both see other =3D=3D 0,
both set their own state to 1, both start running, and then both try
to call cancel_delayed_work_sync() on each other.
Then since atomic_set/atomic_read are weakly ordered, we don=E2=80=99t real=
ly
get proper exclusivity on SMP without something stronger.
And given that ps_work is a low-level piece used all over the place,
blocking on it isn=E2=80=99t ideal. A non-blocking cancel avoids the "both
wait on each other" situation.

So I=E2=80=99d suggest switching to:

@@ -375,7 +378,8 @@ void mt792x_pm_power_save_work(struct work_struct *work=
)
        }

        if (!mt792x_mcu_fw_pmctrl(dev)) {
-               cancel_delayed_work_sync(&mphy->mac_work);
+               cancel_delayed_work(&mphy->mac_work);
                return;
        }

to break the waiting loop.

This should make things safer without changing the overall flow, and
keeps the code easier to read and maintain.
Any pending mac work will get canceled, and if a mac work is already
running, it will schedule another ps_work once it completes.

                  Sean

On Thu, Dec 11, 2025 at 6:44=E2=80=AFAM Leon Yen <leon.yen@mediatek.com> wr=
ote:
>
> A deadlock may occur between two works, ps_work and mac_work, if their wo=
rk
> functions run simultaneously as they attempt to cancel each other by
> calling cancel_delayed_work_sync().
>
> mt792x_mac_work() ->   ...  -> cancel_delayed_work_sync(&pm->ps_work);
> mt792x_pm_power_save_work() -> cancel_delayed_work_sync(&mphy->mac_work);
>
> In high-load situations, they are queued but may not have chance to be
> executed until the CPUs are released. Once the CPUs are available, there
> is a high possibility that the ps_work function and mac_work function wil=
l
> be executed simultaneously, resulting in a deadlock.
>
> This patch ensures that the ps_work function and mac_work function can ru=
n
> exclusively by adding two flags to indicate their running status.The work
> function will reschedule itself if the opposite is currently running.
>
> Signed-off-by: Leon Yen <leon.yen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h        |  1 +
>  drivers/net/wireless/mediatek/mt76/mt76_connac.h |  1 +
>  drivers/net/wireless/mediatek/mt76/mt792x_mac.c  | 13 +++++++++++++
>  3 files changed, 15 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index d05e83ea1cac..0414a4898d80 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -892,6 +892,7 @@ struct mt76_phy {
>  #endif
>
>         struct delayed_work mac_work;
> +       atomic_t mac_work_running;
>         u8 mac_work_count;
>
>         struct {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/n=
et/wireless/mediatek/mt76/mt76_connac.h
> index 813d61bffc2c..eefa0147f883 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> @@ -107,6 +107,7 @@ struct mt76_connac_pm {
>         struct mutex mutex;
>
>         struct delayed_work ps_work;
> +       atomic_t ps_work_running;
>         unsigned long last_activity;
>         unsigned long idle_timeout;
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt792x_mac.c
> index 71dec93094eb..22345031e262 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
> @@ -15,6 +15,10 @@ void mt792x_mac_work(struct work_struct *work)
>                                                mac_work.work);
>         phy =3D mphy->priv;
>
> +       if (atomic_read(&phy->dev->pm.ps_work_running))
> +               goto out;
> +       atomic_set(&mphy->mac_work_running, 1);
> +
>         mt792x_mutex_acquire(phy->dev);
>
>         mt76_update_survey(mphy);
> @@ -27,8 +31,10 @@ void mt792x_mac_work(struct work_struct *work)
>         mt792x_mutex_release(phy->dev);
>
>         mt76_tx_status_check(mphy->dev, false);
> +out:
>         ieee80211_queue_delayed_work(phy->mt76->hw, &mphy->mac_work,
>                                      MT792x_WATCHDOG_TIME);
> +       atomic_set(&mphy->mac_work_running, 0);
>  }
>  EXPORT_SYMBOL_GPL(mt792x_mac_work);
>
> @@ -356,6 +362,11 @@ void mt792x_pm_power_save_work(struct work_struct *w=
ork)
>         mphy =3D dev->phy.mt76;
>
>         delta =3D dev->pm.idle_timeout;
> +
> +       if (atomic_read(&mphy->mac_work_running))
> +               goto out;
> +       atomic_set(&dev->pm.ps_work_running, 1);
> +
>         if (test_bit(MT76_HW_SCANNING, &mphy->state) ||
>             test_bit(MT76_HW_SCHED_SCANNING, &mphy->state) ||
>             dev->fw_assert)
> @@ -376,9 +387,11 @@ void mt792x_pm_power_save_work(struct work_struct *w=
ork)
>
>         if (!mt792x_mcu_fw_pmctrl(dev)) {
>                 cancel_delayed_work_sync(&mphy->mac_work);
> +               atomic_set(&dev->pm.ps_work_running, 0);
>                 return;
>         }
>  out:
>         queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work, delta);
> +       atomic_set(&dev->pm.ps_work_running, 0);
>  }
>  EXPORT_SYMBOL_GPL(mt792x_pm_power_save_work);
> --
> 2.45.2
>
>

