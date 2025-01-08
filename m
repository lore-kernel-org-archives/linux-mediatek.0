Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7A1E77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ym5hD6ywS+FaW6RsCBxzPZyD9agxQLxj3Bf0fOoxgVI=; b=A/IPi72nKdNG3MCxOrhrQL3zZM
	v9qwh6abc6GzGb175pSqbOayKyBOPAyxXgefQT3wA2oKkJj1SyI/+YPz3uPDBXxip509HuX6d0Pok
	CMlByZM21XPRGCMWYABgX1MdLw2kPLIzTFCR/EZZ1X/DvCXmlM1yNJLHu8yrZU+jFedhffzT+j0Ie
	P/F2swN7ABx55WozPVTIbgY/XU7QhceLvFLZW8Tt/mb5oe6jfMMFb5xzEq11KkGdJoW39uxTncMky
	Aspxu+r25R8Rhle8AZs92zimTm4YgaI/yeLiaooVRopPrLp3tFf6RZi2r7tGbKIvsEEgupZBEy35u
	Wslrp85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSqF-00000007tPC-3MrU;
	Wed, 08 Jan 2025 09:59:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSeV-00000007rAo-0HYQ
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 09:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACAB0A40C1E;
	Wed,  8 Jan 2025 09:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEB7C4CEE0;
	Wed,  8 Jan 2025 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736329622;
	bh=KWNsPCfqO9/2m/mTXBmlfe8OilNN6stsaRNoqlVx2iY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=guRLpCOBmlIvvekLtna3SaDjA+ddQ+uDwLmPeVHp1G8XUN9AqXwWTQPPd7KwteI38
	 MkvogRjMbxXDNxekui72C4HPo/q98P55nt4h/gOVz37ntQBcVvOkBlVpMg9d0FJJMq
	 Aw8rjcBDcF9+QSoCeT+D1vGCautbPAyfbv4y51qdhL6BEqu47AlV/RpU0qxz6maFul
	 9vPJZ8Ce16izmmljpmrm3dmlGj5JoQKaLSkfIHHEgnQuBxi37iT2w9DaJfwImfRKFz
	 D4Wo08KhCBAIyoF7+IaGubP3XOZC4GJPuUPr8aVBx0g/dXM6sNlV3CR6W1lOxPypor
	 zqSrlMNqsAWCQ==
From: Kalle Valo <kvalo@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: shayne.chen@mediatek.com,  linux-wireless@vger.kernel.org,
  nbd@nbd.name,  lorenzo@kernel.org,  ryder.lee@mediatek.com,
  evelyn.tsai@mediatek.com,  linux-mediatek@lists.infradead.org
Subject: Re: Aw: Aw: [PATCH wireless] wifi: mt76: mt7996: fix invalid
 interface combinations
References: <20241007135133.5336-1-shayne.chen@mediatek.com>
	<trinity-67c63297-52b5-4d2c-bcdd-1e86936c4b26-1728494589152@3c-app-gmx-bap26>
	<trinity-0eec3a68-fc9a-4ec6-8c95-1cd58f3bcff8-1735990797237@trinity-msg-rest-gmx-gmx-live-bbc95d94c-9m2wx>
Date: Wed, 08 Jan 2025 11:46:58 +0200
In-Reply-To: <trinity-0eec3a68-fc9a-4ec6-8c95-1cd58f3bcff8-1735990797237@trinity-msg-rest-gmx-gmx-live-bbc95d94c-9m2wx>
	(Frank Wunderlich's message of "Sat, 4 Jan 2025 11:39:57 +0000")
Message-ID: <87frltr625.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_014703_168144_DEB443EA 
X-CRM114-Status: GOOD (  12.58  )
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

Frank Wunderlich <frank-w@public-files.de> writes:

> Hi
>
> this seems still not merged to next.
>
> can wireless/mtk Maintainer please pick this up?
>
>> Gesendet: Mittwoch, 9. Oktober 2024 um 19:23
>> Betreff: Aw: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface combinations
>>
>> Hi Shayne
>>
>> > Gesendet: Montag, 07. Oktober 2024 um 15:51 Uhr
>> > Von: "Shayne Chen" <shayne.chen@mediatek.com>
>> > Betreff: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface combinations
>> >
>> > Setting beacon_int_min_gcd and NL80211_IFTYPE_ADHOC in the same interface
>> > combination is invalid, which will trigger the following warning trace
>> > and get error returned from wiphy_register().
>> >
>> > [   10.080325] Call trace:
>> > [   10.082761]  wiphy_register+0xc4/0x76c [cfg80211]
>> > [   10.087465]  ieee80211_register_hw+0x800/0xac4 [mac80211]
>> > [   10.092868]  mt76_register_device+0x16c/0x2c0 [mt76]
>> > [   10.097829]  mt7996_register_device+0x740/0x844 [mt7996e]
>> >
>> > Fix this by removing unused adhoc iftype.
>> >
>> > Fixes: 948f65249868 ("wifi: mt76: mt7996: advertize beacon_int_min_gcd")
>> > Reported-by: Frank Wunderlich <frank-w@public-files.de>
>> > Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
>>
>> thx for the patch. I can confirm it fixes the issue/trace.
>
> if tested-by is necessary:
>
> Tested-By: Frank Wunderlich <frank-w@public-files.de>

Felix, should I take this directly to wireless-next? Ack?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

