Return-Path: <SRS0=KhaQ=L4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D912C07E95
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 19:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1258C613F1
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 19:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1258C613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJZBvsJIZYGeRrZkpNEGTeoQFO4HISatDFszpeLTX/g=; b=5FrZki1riB7FyP
	b5+rHNt9CXuhXkp7W0m0JhKozjXrqbwdYAbfnOmrJPrXAfRujqQTD+Fb1LWtsSpAnqOqGxawJ4jd9
	ZTxch/IhfDSP5+PBtZ7pD6kRAsZ2Cz7r9gh2XXV4jnE3lKgqiOk5mWfKsZlFDok50iZNPNOzB6z6t
	u3HfFaWxUvmUyQsTxSICMTgVkK1fYh/p0maIC7iIkq7/coIZ36r+epDrUoomqTchn0czJ9ltJRrAu
	B5KvXY72/NIWcz7PqpZnvidvtwONks8q260mE50VByrJi90QlYGQgW5VetKxqoMJcNfaDZXKzzpvB
	QeHYKbag9JuNKdvhnZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m07Tk-006f6M-0u; Sun, 04 Jul 2021 19:08:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m07TY-006f4p-Ch; Sun, 04 Jul 2021 19:08:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88470613E2;
 Sun,  4 Jul 2021 19:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1625425699;
 bh=VLiKGR1v+9NnuwU1LjnHuZ6Su0GWomCpRT6OA2j6uFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qiTAXYmDvRFSZ4zinz8MPMNQnVXr4AtbiXkUHkBDWjOEGJ+slrPQMfdzp6h7mX+Ao
 KADweRq9ekxgcqmCe2PhV4qQV1cKm/qgHZXfChr9CcUjmBenf4z+teDmOIf4zX8j9S
 919rdrq7H8t0db/BiLYpq3pf4GVvdnOh6m4eaoZc=
Date: Sun, 4 Jul 2021 21:08:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: John Wood <john.wood@gmx.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mt76/mt7915: Fix unsigned compared against zero
Message-ID: <YOIHIC3qLsVdRjdh@kroah.com>
References: <20210704145920.24899-1-john.wood@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210704145920.24899-1-john.wood@gmx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_120820_492840_93BFFEF0 
X-CRM114-Status: GOOD (  19.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jul 04, 2021 at 04:59:20PM +0200, John Wood wrote:
> The mt7915_dpd_freq_idx() function can return a negative value but this
> value is assigned to an unsigned variable named idx. Then, the code
> tests if this variable is less than zero. This can never happen with an
> unsigned type.
> 
> So, change the idx type to a signed one.
> 
> Addresses-Coverity-ID: 1484753 ("Unsigned compared against 0")
> Fixes: 495184ac91bb8 ("mt76: mt7915: add support for applying pre-calibration data")
> Signed-off-by: John Wood <john.wood@gmx.com>
> ---
> Changelog v1 -> v2
> - Add Cc to stable@vger.kernel.org
> 
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index b3f14ff67c5a..764f25a828fa 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -3440,8 +3440,9 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
>  {
>  	struct mt7915_dev *dev = phy->dev;
>  	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
> -	u16 total = 2, idx, center_freq = chandef->center_freq1;
> +	u16 total = 2, center_freq = chandef->center_freq1;
>  	u8 *cal = dev->cal, *eep = dev->mt76.eeprom.data;
> +	int idx;
> 
>  	if (!(eep[MT_EE_DO_PRE_CAL] & MT_EE_WIFI_CAL_DPD))
>  		return 0;
> --
> 2.25.1
> 
<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
