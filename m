Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F9AD4335B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE8dB8+Bk2ztdABOLiwHRk6AqFL+/lBOFn7Oe9CFD7c=; b=LCZQ6Mu6ybvXSrb1c3aCidWrdN
	flrAq87SLNpkEjzgAGkbCFUJIgtrwzH4zJyR7G1pmiJld1+jpb3aLUkGKuPbdiHJS3MVDU/foAr2M
	xgAOZwnDWv8/1hzdP1I6zHV5wnWPWDQKl5Xn+kGPtEewxTzPI/mMUE33yhNZvVddupFKW35/VPqF2
	X84QL0UXjXK1ZSRMCGVdGIBGsN1YalC55ZniUdR/CdS+JJBHNilcDDvVD87oMO0Qs3b3FwH2/YBL8
	JfhqQVw5RxDHbkxYLkiHfQOdUtp/W5HVvvpD+hLmKCtA4IT5Zn2HPTiP2LkR2jd58p/W39XGm+xF9
	+jKrmZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTqNj-0000000HQq5-3jpd;
	Thu, 11 Dec 2025 23:47:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTqNh-0000000HQpx-3RCE
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F409960152
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 23:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004FC2BC86
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 23:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765496852;
	bh=bje5S2tO81LcR3oEMnuyNXK8MCzYbRCVPpr/63ZWRy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SNkUhi0vsFDkEFIDfZxCrKAjqVeRqvOyZSo6pxD6CVg4rMq9qSAIbjSxD/ITtWyaM
	 EnJL3KBqMXuSrWqNE0bMN9U/+DOL8qiD+UbrOQArKHhgFEtCUKkAJX3roHiqkPHEpN
	 TEjdNMHc0bp0xqBPZuWzfYMxBeeD3UDoYcX8ZJZ0b+mfH9IKqQERdsJHLRW+XB2z+B
	 6iQAfzob7H0O5MBgwxrH65b6FRP/vlx3DQ+2R+G2zfFhmfKMArhF8Wyr2Hdawq3mAs
	 FSdoRFpsuyJwX4YiJQcQkdL7XAvsYra4dii4cDafnR5MpMSAnVnw+6pqQSUQUK5St4
	 RAQ6O/vZs+/AA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959105629bso723315e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:47:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFDmHrKFXjI98NfrkTd8n8ydlxXuB272boo2ygP6tCDH+TWcXnr+D1XWP1aR4ktCgp3OsrtBQQA94Zjxk5Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNP/7+a3fnGrGoQ09xI9d+Rrgb7JKeJW/pK5dGiLn8IrX0kegY
	s5xvRv9LfpLAgADvo77s77lPaKEzYMdk2zwDTyal4+SkO1NjRJHlOl/VwGzuzGNAeBLTKEM37w6
	iPlzwLRZ5nIxvkib6I4A11bUNLVPhwRE=
X-Google-Smtp-Source: AGHT+IG+tynJrEuFVmI9CGQVNWs1wGZ9mj2gwDEXwVEvTcf/I9XnBHIRwne+P0Qk/JsMpdmNrWEUtWaXp3jTSpSY9bs=
X-Received: by 2002:a05:6512:3da8:b0:598:853e:72fa with SMTP id
 2adb3069b0e04-598faa996cemr6981e87.52.1765496850964; Thu, 11 Dec 2025
 15:47:30 -0800 (PST)
MIME-Version: 1.0
References: <d5960fbced0beaf33c30203f7f8fb91d0899c87b.1764228973.git.quan.zhou@mediatek.com>
In-Reply-To: <d5960fbced0beaf33c30203f7f8fb91d0899c87b.1764228973.git.quan.zhou@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 11 Dec 2025 17:47:19 -0600
X-Gmail-Original-Message-ID: <CAGp9LzrvD+Go=StCU=iU4KERyXfK5VB_xvonHNFkGxDyy7p6mg@mail.gmail.com>
X-Gm-Features: AQt7F2rPOclLMuFQPaVaug5PVxJnxqf4ihQeSo3tetqH5UXKLK7pgKOl-k9a8rM
Message-ID: <CAGp9LzrvD+Go=StCU=iU4KERyXfK5VB_xvonHNFkGxDyy7p6mg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7925: fix AMPDU state handling in mt7925_tx_check_aggr
To: Quan Zhou <quan.zhou@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <Deren.Wu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Allan Wang <allan.wang@mediatek.com>, 
	KM Lin <km.lin@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, 
	Shengxi Xu <shengxi.xu@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, 
	CH Yeh <ch.yeh@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, stable@vger.kernel.org
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

On Thu, Nov 27, 2025 at 1:55=E2=80=AFAM Quan Zhou <quan.zhou@mediatek.com> =
wrote:
>
> Previously, the AMPDU state bit for a given TID was set before attempting
> to start a BA session, which could result in the AMPDU state being marked
> active even if ieee80211_start_tx_ba_session() failed. This patch changes
> the logic to only set the AMPDU state bit after successfully starting a B=
A
> session, ensuring proper synchronization between AMPDU state and BA sessi=
on
> status.
>
> This fixes potential issues with aggregation state tracking and improves
> compatibility with mac80211 BA session management.
>
> Fixes: 44eb173bdd4f ("wifi: mt76: mt7925: add link handling in mt7925_txw=
i_free")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
> ---
> v2: modify to avoid weakening atomicity
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mac.c
> index 871b67101976..5e5b1df78633 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> @@ -881,8 +881,10 @@ static void mt7925_tx_check_aggr(struct ieee80211_st=
a *sta, struct sk_buff *skb,
>         else
>                 mlink =3D &msta->deflink;
>
> -       if (!test_and_set_bit(tid, &mlink->wcid.ampdu_state))
> -               ieee80211_start_tx_ba_session(sta, tid, 0);
> +       if (!test_and_set_bit(tid, &mlink->wcid.ampdu_state)) {
> +               if (ieee80211_start_tx_ba_session(sta, tid, 0))
> +                       clear_bit(tid, &mlink->wcid.ampdu_state);
> +       }
>  }
>

Reviewed-by: Sean Wang <sean.wang@mediatek.com>

>  static bool
> --
> 2.45.2
>
>

