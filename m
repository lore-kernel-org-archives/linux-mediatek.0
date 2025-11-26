Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E37D1118A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lfm4X4CU5cUE0t2Goov7FwMFpqKv5wELRxHh6zuc9s=; b=31carkDg1QPl2bj/5NuN2QjGXq
	IngbDfvFSCA92bPc7zzSZ9yVP6UsUQUBXZinxpYgEqjp+/iZsQ7RGUuXcYNkX93Ug8zIlXXJxUHgP
	7/S2qOy8PnO2ekfD0mPRUozA0QH7paQ5lu4tnibhWwmOClbk17SWP2hZegjoxNyTStxLUVO1T/2tP
	5mxk0Et+Q1PBIEfEP5OngXQpgFLt0r+X2hIY4HO789QNTh+vnq1Iz5aO/zHmZ2szIlf1boIZ30Vqq
	cCwCOGirv24pXG9xjdeKwPT43Sk4veo35B8A7AO/RMmT/6ix/cXHoAu5fzicjZA873X+VNB5lBfsd
	0S7qaKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJ7D-0000000FNUo-3xUp;
	Wed, 26 Nov 2025 17:15:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJ7B-0000000FNTd-24y5
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 17:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80C9444355
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D305C19425
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764177336;
	bh=6SHs66WoWGtjQH3L9Iq2Mny6L7Qlns6ivX9++VOuwbI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wmoze9Mi0Vnp7inKtGSe7+8xdZVkSjmcxN7co9xZwh1frBeWLcoh5QnNVTxibFa0M
	 lmSweWooHBs2h653K8u18HiHm49MnWwsFed/45XvHsTjbpFJpKF4vxcNhSkrIs76vS
	 Y8PeFB44mzZP99XC5OKoF4o669mWR3ZNBs8kSeBO6S0zUh0zydJmOaMq2ONh0yyZxO
	 dhwj1VH9wSfmpGZwP2pFGiaBjr04Hnxe88vaz0w9ZAkDWWPd0JBmeriSBKj4ug+NRG
	 6Et/GhlVIBSrfh+iavRmNd9e4/sdh6pUFGR7H7Mkz4FnHV6cJogtsbS1dHncHFhxeE
	 xHxBIj5UDUbtQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378e8d10494so227401fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt9H+0k7YZ+t2q+gBHDpjCkuJAZxw5t9h2fbMLR11+dNHe+owPOKc+TfnES6q/QgD4Pk6NoBcuflEU1uQ9pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp59kdhLQm8q4WRhjIDLsMBtG7MxG8HcWcxwlOHK2OwwNhkTfT
	Xwb8TaxQcVBJQYkGe6ykC25A2g1922ArqOchrYQjoVyD62csj/sR5h1pfncX1tToHw6k9ornyaT
	0jlQXOTtl864QqPajLTISUYXYpAsYpos=
X-Google-Smtp-Source: AGHT+IHrrmzPVAFgQsvrRntuuZ9ayKDwDD7s4AL9NeupFWgcsn821aySl20O7AgRZrwewB+5f3lrU1vBbbvI8Usz7N0=
X-Received: by 2002:a2e:9654:0:b0:37b:9b58:dcf7 with SMTP id
 38308e7fff4ca-37cd9202938mr51693681fa.23.1764177334607; Wed, 26 Nov 2025
 09:15:34 -0800 (PST)
MIME-Version: 1.0
References: <bf6a29cfa16e31e5c2fc2956a294dd8ed97ebd26.1764138361.git.quan.zhou@mediatek.com>
In-Reply-To: <bf6a29cfa16e31e5c2fc2956a294dd8ed97ebd26.1764138361.git.quan.zhou@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 26 Nov 2025 11:15:22 -0600
X-Gmail-Original-Message-ID: <CAGp9LzqH+xoxF_9LxtQ5WFrqRLob7Xv=M2BmETbW0950OuJpXg@mail.gmail.com>
X-Gm-Features: AWmQ_bmLzOYeG7nxvWUli-MEBvOI5aoCbnBKmP5FcgziO0TVq1L7Jx7AHGKwGu8
Message-ID: <CAGp9LzqH+xoxF_9LxtQ5WFrqRLob7Xv=M2BmETbW0950OuJpXg@mail.gmail.com>
Subject: Re: [patch] wifi: mt76: mt7925: fix AMPDU state handling in mt7925_tx_check_aggr
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_091537_575240_B5DB62B0 
X-CRM114-Status: GOOD (  20.74  )
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

Hi, Quan

On Wed, Nov 26, 2025 at 1:04=E2=80=AFAM Quan Zhou <quan.zhou@mediatek.com> =
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
>  drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mac.c
> index 871b67101976..80f1d738ec22 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> @@ -881,8 +881,9 @@ static void mt7925_tx_check_aggr(struct ieee80211_sta=
 *sta, struct sk_buff *skb,
>         else
>                 mlink =3D &msta->deflink;
>
> -       if (!test_and_set_bit(tid, &mlink->wcid.ampdu_state))
> -               ieee80211_start_tx_ba_session(sta, tid, 0);
> +       if (!test_bit(tid, &mlink->wcid.ampdu_state) &&
> +           !ieee80211_start_tx_ba_session(sta, tid, 0))
> +               set_bit(tid, &mlink->wcid.ampdu_state);
>  }

It is a nice catch. The change works today but switching from
test_and_set_bit() to a separate test_bit() + set_bit() weakens the
atomicity that this state transition was originally designed to have.
It might not break right now, but it creates a subtle trap. Future
code may assume the transition is atomic and accidentally reenter BA
start path which can lead to hard to debug regression.
To keep the logic solid and aligned with the current design, the safer
approach is to use atomic acquire with a rollback.

if (!test_and_set_bit(tid, &mlink->wcid.ampdu_state)) {
    if (ieee80211_start_tx_ba_session(sta, tid, 0))
        clear_bit(tid, &mlink->wcid.ampdu_state);
}

This keeps semantics clear and avoids future maintenance landmines.

>
>  static bool
> --
> 2.45.2
>
>

