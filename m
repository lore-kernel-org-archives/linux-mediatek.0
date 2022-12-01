Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED84C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcEiNeIHfhjQOz/UE8eyz9B4mtOnpXK5F0RGas0C0to=; b=PsAc+HFnHG81bJft6J5ebu4asF
	jYs4mXX9QhXg8fvdosXH9qZW7U3rL507D/JYwTxSzOlHAf2mIg8Lunglx6AS+iZPsAWygKURcuMJ/
	MCgcTeyxp6PPS8xYsAwGFNWPjZe6b2z5WEPXwSo6WcFSHoDsLvYNCrR3yMkKTeJQmTm8DD7HDujSP
	baMTsAOcXHhpjLCfnFgMQdOU/34ED7MDKE5L3/5ZJVDujNSFL9UJysSzh4HYxQ6f/RZC8NAs0XnJ/
	/wFZeRs7SeV7S7NXE0uGk/yTeUGim+TvjZ8joDA0W156YOAoVOuJ1aiMdb4LBWpiJbxnpu8bY5H7Z
	3kgrgETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gyT-006mqn-SF; Thu, 01 Dec 2022 10:39:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gyP-006mnv-Fc
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 10:39:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F72FB81EA1;
	Thu,  1 Dec 2022 10:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A74C433D7;
	Thu,  1 Dec 2022 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669891158;
	bh=6HpDL5+INCtBpEEy8dHsD96qaaRPVHYBzx/FxGGFGBA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GShxMvi6wsH6WZPhK1cDVmSP2184tK1y+0EXFrfZGpRErT+OfTWNK6yip4kn4xIfR
	 T3spuPKNdbTTiPwgVVae9s2xy9PkCoe73UVq11V5xwvMVrNkctS4jUzF9ur7qwAxdW
	 9n0bR0WFQlsLxlusG27XnMQtfapdS3Mb5hKLGQKtASo6NE8Jj02RiLIr+A0nts69gp
	 /HmoloTNQv69WFO213x6EpFheXlvHsqSkvQv6tunsBkIweinJ4+fvDH9VfKOZHAx/f
	 6CEm482EVEH/egY8WgcWMn9yKQqakejExU2NGt3nfCQBVCJvV//rAclOnaerC1URLq
	 oWa5EBfr2QuOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  linux-wireless <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee <ryder.lee@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  Bo Jiao <Bo.Jiao@mediatek.com>,  linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 5/9] wifi: mt76: mt7996: add MAC support
References: <20221122084554.9494-1-shayne.chen@mediatek.com>
	<20221122084554.9494-6-shayne.chen@mediatek.com>
Date: Thu, 01 Dec 2022 12:39:07 +0200
In-Reply-To: <20221122084554.9494-6-shayne.chen@mediatek.com> (Shayne Chen's
	message of "Tue, 22 Nov 2022 16:45:50 +0800")
Message-ID: <87zgc7mmr8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_023921_684683_87FAE17E 
X-CRM114-Status: GOOD (  10.03  )
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

Shayne Chen <shayne.chen@mediatek.com> writes:

> (Split the big patch into smaller intermediate patches by functionality
> for easier review. Refer to the cover letter for more info.)
>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

[...]

> +static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
> +{
> +	static const u8 ac_to_tid[] = {
> +		[IEEE80211_AC_BE] = 0,
> +		[IEEE80211_AC_BK] = 1,
> +		[IEEE80211_AC_VI] = 4,
> +		[IEEE80211_AC_VO] = 6
> +	};
> +	struct ieee80211_sta *sta;
> +	struct mt7996_sta *msta;
> +	struct rate_info *rate;
> +	u32 tx_time[IEEE80211_NUM_ACS], rx_time[IEEE80211_NUM_ACS];
> +	LIST_HEAD(sta_poll_list);
> +	int i;
> +
> +	spin_lock_bh(&dev->sta_poll_lock);
> +	list_splice_init(&dev->sta_poll_list, &sta_poll_list);
> +	spin_unlock_bh(&dev->sta_poll_lock);
> +
> +	rcu_read_lock();
> +
> +	while (true) {

In upstream we have a preference that there's some kind of limit for
loops, to avoid neverending loops.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

