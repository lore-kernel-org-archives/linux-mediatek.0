Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzkYvNgBIkGsl2OIY2uF3Q5Un4Lqq6FPTkviTEQ5p/g=; b=33Nc9nJhv0nG3x
	Ovk74I34ej84ODeBKKvIgpRdy+b7IOxSySBY/ceWa6vFeiSZQTJERxuNqGyNywAxVLaAJBrdjw1vF
	lytJfAomE2vUwEEMcjoge5pfUuhx56owKPmFI7I97sHdOFn5HqIwTj2L5CprjY10EeglBljnTnke0
	HUGgIPt2RP+x+vKeLNC/PeSl8t5olEq8kF6/WRQVdSw3Vpe9ESGwAKMh9x6Qehet1ypPJGSk34A6/
	74/Lw1m4cDNGy1d6h6BjELXcosLd5BofHc5ZD2KFdpwob78QnxFbXTm0KOSpmcJrF+HO6bagj6JAD
	+11Tc76K6Btg/p/NCxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nri9n-007zbt-Mu; Thu, 19 May 2022 15:33:43 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nri9g-007zYM-8q
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 15:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qdN7kX6gtg59GiEPD4pwZac2Oz5xropt2h9Xzi0szOk=; b=oIdtimg3tkSPoUPgEVYuDZtdmN
 7uJjpEqvJ77FneYTrCZ5CUhB1SG8CBNhgCd5RoK3fw9ovz2+iJNl6TcT3Rj/FzYrROQCnOkCtN+En
 QCTbheKSF+HRb40u5aWrrnnDJ7e5fFQ7EGfo/O15fzcsegZ43MTh+RWL5OaUK77SM11U=;
Received: from [217.114.218.28] (helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nri9b-0001tZ-6Z; Thu, 19 May 2022 17:33:31 +0200
Message-ID: <8207b98b-0c10-aff4-55c4-6c7118454832@nbd.name>
Date: Thu, 19 May 2022 17:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] mt76: mt7921: introduce BIOS SAR config in tx power
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
References: <cover.1652941276.git.deren.wu@mediatek.com>
 <2e6b69a763d60897639101506e39a2b1a81d8eab.1652941276.git.deren.wu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <2e6b69a763d60897639101506e39a2b1a81d8eab.1652941276.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_083336_555565_390606B7 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 19.05.22 08:38, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> Add new function mt7921_set_tx_sar_pwr() to update SAR power from
> .set_sar_specs and BIOS setting. Both settings would be merged into
> mt76_freq_range_power for final tx power value.
> 
> Reviewed-by: Sean Wang <sean.wang@mediatek.com>
> Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7921/init.c  |  3 +-
>   .../net/wireless/mediatek/mt76/mt7921/main.c  | 32 +++++++++++++------
>   .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
>   3 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index 80279f342109..c86d8805f291 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1469,20 +1469,34 @@ static void mt7921_ipv6_addr_change(struct ieee80211_hw *hw,
>   }
>   #endif
>   
> +int mt7921_set_tx_sar_pwr(struct ieee80211_hw *hw,
> +			  const struct cfg80211_sar_specs *sar)
> +{
> +	struct mt76_phy *mphy = hw->priv;
> +	int err;
> +
> +	if (sar) {
> +		err = mt76_init_sar_power(hw, sar);
> +		if (err)
> +			return err;
> +	}
> +
> +	mt7921_init_bios_sar_power(mt7921_hw_phy(hw), !sar);
> +
> +	err = mt76_connac_mcu_set_rate_txpower(mphy);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(mt7921_set_tx_sar_pwr);
Why is this exported?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
