Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2305EDE9BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 21:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv5fo7Rx01cUTSuDskW80x6kWJqo6Wo9rqCQzEFIL+0=; b=Qju3wkoF6TGE5aRfh1qaQV/DFq
	WcTGgq26jtn6e4SgZSdLzHl3w7MrM22ZPFtC1rmvAeUsDxSARTlxLBrxOjd4eBcVb5riVKeuD/Bf3
	W51xu7YSPj2ekVhwxdbtfHg4KSCXLR4z8qNRs0sZ3yOV2OBxquiRvJMh3oUMrTSYYu9twVCkeidDw
	yKihKw6SjhPm/HeTDsci9Wh6qKYk22Xdhlwt0dBa0swjGpCEX8SIj4oR9zB3IKYDmLlQZue4rbKEM
	Ok+5H6aLLWAWyFagrJWhAeiJm1BG+OFzzpRCzMM7CeMOUIfb5TrnBl3HV3PhGKfBANHlRdSghfQ2b
	TAw3fWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so84E-000000079QS-2XfW;
	Tue, 10 Sep 2024 21:06:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so84B-000000079PH-0z6E
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 21:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 504BDA41DC4
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 21:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81744C4CED0
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 21:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726002385;
	bh=sAAUUXopCmPL0PMCAYsW78syDaV3KkSs6EW1eKZ0Pmo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X2fD7PH+mHRNrCaO4Z7tCmklng/Ey6lIQHpErGFbCGOaNisXnH6aaFfyEXehoCE4M
	 X05aE7N3jBUfOhLVZUh0ATOXrqmXuVSbPMZxHl1P9+iRTDKfXPHHjczdX0P5Lkp9Cw
	 +ZX5+2uYiMzLvDrYg2gkdu+5CGjmvIklbZzAxaBN0nqlrwsOOnx+RVoC3YtZuzxqVk
	 6Ig3IJ5xQUnRKT/r6WtlMkzLJhvCEkouZpQcX3SugVEaarUeN3utuUUv4eWBiGfpEO
	 pkaL1HLu4AJ+nVUxCrJkTw9fl5aKjuCEFYjXlkBb8YFMpZHWgj7nzDGI6zWWx9LV6e
	 QM2C3N4V2k1zg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so508320566b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 14:06:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlJ7PunhVm6zKeoFFCkQsjaCfL4jngRvQQeTx824/mZBRAfv9xAVGk6W8KeIoAYgV1PvC3Diuo00WlhFOmQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBze/PtqCnk4SlRfaInaCiaM82hCixYYSslXKjsA60xevbEbhe
	I25lqJWp35zK3KeOhELb4V/8Krkb5hIqYFAooraKeGZg9/zuGKxYY3EdSf6Nifx1ORxSxdRWdQw
	/QY9XeuC0Z31m6grTb34gnQsdkqw=
X-Google-Smtp-Source: AGHT+IGnLhBkB5leOVLLDMlXbrpQP36pdpkIvt6BFCVPK70qmwiwtXFYMt9UWPjoQzm24KD5Nu1Qlu/SvnqRElM7ENA=
X-Received: by 2002:a17:907:7f8e:b0:a8d:5472:b56c with SMTP id
 a640c23a62f3a-a8ffab2a1a8mr194700366b.22.1726002384095; Tue, 10 Sep 2024
 14:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <1ac1ae779db86d4012199a24ea2ca74050ed4af6.1721300411.git.quan.zhou@mediatek.com>
In-Reply-To: <1ac1ae779db86d4012199a24ea2ca74050ed4af6.1721300411.git.quan.zhou@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 10 Sep 2024 14:06:11 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzo=gErNFtYiR4a33jbo9LCHmWZf+j7GLAgSGPgFN9xbmA@mail.gmail.com>
Message-ID: <CAGp9Lzo=gErNFtYiR4a33jbo9LCHmWZf+j7GLAgSGPgFN9xbmA@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix a potential scan no APs
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <Deren.Wu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, KM Lin <km.lin@mediatek.com>, 
	Posh Sun <posh.sun@mediatek.com>, Shengxi Xu <shengxi.xu@mediatek.com>, 
	Eric-SY Chang <Eric-SY.Chang@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, 
	Robin Chiu <robin.chiu@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Quan Zhou <quan.zhou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_140627_430739_F5D85AA2 
X-CRM114-Status: GOOD (  17.22  )
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

Hi nbd,

It seems the patch hasn't been merged into the current tree yet. The
patch is beneficial for improving scan stability since we=E2=80=99ve applie=
d
ROC. If there's any opportunity for further improvement from your
perspective, please let us know.

    Reviewed-by: Sean Wang <sean.wang@mediatek.com>

         Sean



On Thu, Jul 18, 2024 at 6:51=E2=80=AFAM Quan Zhou <quan.zhou@mediatek.com> =
wrote:
>
> In multi-channel scenarios, the granted channel must be aborted before
> station remove. Otherwise, the firmware will be put into a wrong state,
> resulting in have chance to make subsequence scan no APs.
> With this patch, the granted channel will be always aborted before
> station remove.
>
> Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 2e6268cb06c0..84d6881eb4c9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -359,9 +359,9 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
>         del_timer_sync(&phy->roc_timer);
>         cancel_work_sync(&phy->roc_work);
>         if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
> -               ieee80211_iterate_active_interfaces(mt76_hw(dev),
> -                                                   IEEE80211_IFACE_ITER_=
RESUME_ALL,
> -                                                   mt7921_roc_iter, (voi=
d *)phy);
> +               ieee80211_iterate_interfaces(mt76_hw(dev),
> +                                            IEEE80211_IFACE_ITER_RESUME_=
ALL,
> +                                            mt7921_roc_iter, (void *)phy=
);
>  }
>  EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
>
> @@ -861,6 +861,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, str=
uct ieee80211_vif *vif,
>         struct mt792x_dev *dev =3D container_of(mdev, struct mt792x_dev, =
mt76);
>         struct mt792x_sta *msta =3D (struct mt792x_sta *)sta->drv_priv;
>
> +       mt7921_roc_abort_sync(dev);
>         mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->deflink.wcid);
>         mt76_connac_pm_wake(&dev->mphy, &dev->pm);
>
> --
> 2.18.0
>
>

