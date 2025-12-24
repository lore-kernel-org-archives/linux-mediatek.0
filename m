Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B633BE7545C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub/18GJ25fDacSsVJieCeokU7It3HAFq//YyevGHRnM=; b=PA0ItOdwYEX7o8lI/rx/D4JaTv
	uEkjm11CNx53ppG28fV4KDHf+6vbVMnzTr1AqErSST9bb65YdNdBDymlSVMG/izypys7+w+f4cpXt
	nPvKkztWcdxKBgwF4wZ3C1EwZNiVqyHR6RZ6nvV3/FkWiHSMECL/Z4P6DY2ueH+MT1hhNvHEsFBpF
	0pKwbEwvrT1DHTwlTfqhKgp52/ONGdVyZEhlZbUTQNjY8uMPuZ0fkjUEPoPjInpIzD333IxVnwFce
	aIIOqwzBPCo+k7u+bN8O3q7T+GwTatTHUi4nos97WK9Muvbzzb9h4Z7cUhMjWQjNsYAv3V4F1D7Ri
	pd1PG2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQjw-0000000H6Kk-07pV;
	Wed, 24 Dec 2025 15:25:28 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQjq-0000000H6JL-0xEn
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 15:25:26 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-37b9728a353so75142681fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766589920; x=1767194720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub/18GJ25fDacSsVJieCeokU7It3HAFq//YyevGHRnM=;
        b=Qr1VowU4g/WhHubFgNPKD52npY1Nlu4UVO2IUjKvhDrX92T72k+KapZfjSJKx2kgA7
         1OP3alGmKPGw2ibNdN41dXs6nGDOjBSkRKIkWZCVl9bXnbpC8t/JcnYvMC9NXRINEzCT
         hDAAgdPV1oJZeH9IjPVjrkqIwKNryStGDesjL184qIkhuC209s4YjhPnfIll9WcFHN2E
         AUZxNVzfsBL+K3I4OhfFGYuVkGUy8wHARXm+e/F6esz0b8tLXn0xOSyawCHUXlfodaxE
         Lo7VFJXsfxJgyUebgYZxSyxILkRGu+qKsYyw+dJSwO/5F2geBeep3IsmQkHnotRWza2n
         G06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589920; x=1767194720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ub/18GJ25fDacSsVJieCeokU7It3HAFq//YyevGHRnM=;
        b=dnpCQ1wliR9B2J7ygDWFG5wU8RHhDvRFzUDePfgO/txOcWJ0/AnjloJZFJYsZk3z+R
         6bpKZqkzj+dLqrX04Br38ADK/NpV0IuehJeGiH61d2eLtiEPylhItP5TxfiGOCSh1ra+
         zoSApY3xu8dlkTEOvr6Jda6fPnsrGJAuuw6/XQ02e7CpSUygbUPI0LDRJbyOFEBFDqyb
         vKWgd0HAm7npRGGq4lZ2l0pb6IVGjribDUWYycw7+aJmW2FMGiOi8BfcLNq0XupnD5O+
         SmkNPgBh9QfCEtnUUVL+Hii2eRzMNKbkrv1nDd/UCK8XgYr6BACvF+TvZWtGL4P9WFuS
         u6/g==
X-Forwarded-Encrypted: i=1; AJvYcCW5jAa6WYnpSkokxbQpxY2xe/iQw1Kz0RjbWollTF+fZ+OeTdXXlOjcDuAOcljsbxNwBT2tbn15UbImC50ofg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN+aHnAKKBus1f2PpFpy5PvRPGYzfohKh0MAG54SfCHhccC1dx
	6rzfOZQVPxGMQmkTxkTnIHU1Cbvd6uQaZvoCBhyhbi1MDXbgTHBOHn9qBlXglHKPwy0uErCL8xL
	QjnEd7gWJdW5VG/F+uYRnJ9rbt6gGgzkYSJMZwBBHAg==
X-Gm-Gg: AY/fxX4qhJqtMn3hQYbhOAbLOyPu3Ve/r1U9SDDX9DqYA+KD8IUZD4gVGzMbXQJMdGy
	+nkmX2C4PqPKUhrgD2UYLbG4oxcQe9TUvP7bffC51mhXrPj7hijLnbp+nOHB5zk2CwxFKUA42u8
	OwkvixVISGgq9u+ChHtk5X1Jtazh6lDPtBGjYEGkyO/yss8NDBDgMdR1NjBcaQmpdCliZrCvSY0
	dsl0oMZTQ5xd2vOO5myFV72fCpJM4fm9VuPv9E6yFYu66XgoGJbimAxjq5Tfz3LzHDr3j/WTxna
	d+D8Ql3NuTXx4OKuRJHfrC+v3G+2
X-Google-Smtp-Source: AGHT+IE18Td0Nc/XUXi4Cl/TcjHngwFgeghpA9tqLowzRzDj1icyD8qdVib+ULxbElUN5zQM7gG2Jag6BgFnSaqID8k=
X-Received: by 2002:a05:651c:b23:b0:37f:c5ca:b70a with SMTP id
 38308e7fff4ca-381215671e0mr64786141fa.7.1766589920090; Wed, 24 Dec 2025
 07:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20251114104325.116471-1-marco.crivellari@suse.com>
In-Reply-To: <20251114104325.116471-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 16:25:08 +0100
X-Gm-Features: AQt7F2pdx_yqBW3dZWH9yjaq2tVaCtyoU5kwu2elkW6Y4N6ZypwXb883yj0Z2S4
Message-ID: <CAAofZF51pkOzrg_nO0Mhx6g9b3JPtO3n+0YE=WtSgj_F6wnY4w@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_072522_843978_5FE2F36D 
X-CRM114-Status: GOOD (  11.29  )
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

On Fri, Nov 14, 2025 at 11:43=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>[...]
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index b9098a7331b1..95764b82da39 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -343,7 +343,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
>         dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainmas=
k;
>         dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainmas=
k;
>
> -       queue_work(system_wq, &dev->init_work);
> +       queue_work(system_percpu_wq, &dev->init_work);
>
>         return 0;
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/init.c
> index d7d5afe365ed..e33ab4849e8a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> @@ -420,7 +420,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
>         dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainmas=
k;
>         dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainmas=
k;
>
> -       queue_work(system_wq, &dev->init_work);
> +       queue_work(system_percpu_wq, &dev->init_work);
>
>         return 0;
>  }


Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

