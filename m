Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC92C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 07:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE6861040
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 07:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BE6861040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMcKvqWLxH95mCQLscvNbcyrFL11utVSrWGFH90ljVE=; b=CVxB0LvGcF+PVU
	LLKogda1dC1wr4CxabR630OJ5CvKw4DuGrmXnSdB3ipMDtL+cVmdFQJPxgHFYxoi6r5Ie/GI35X61
	wjLf4SACgzEFdJQWiU5UcvM0/JsDnpnOocdXLeM38H5GBPJro/IIQYa+z+kjEgh5wicqSTvnqbt6l
	7QusZZCl77c65QOts0/XeRJZcQCVItWJnRWQ4v8A3o3RSpKLHCF2252UoRmI2EwXgE5S5ceSlhRAX
	EnHALcLDI+VYEiCDKZqJMXBm1f55s+a/goSqqmJEImHotZ8cNaULJQ0U631njT4p7QH7ayS1qxbwI
	1N77fjEB42VMm5Tqhx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBY92-008TgF-Ic; Thu, 05 Aug 2021 07:50:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBY8u-008Tdc-VJ
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 07:50:18 +0000
X-UUID: 0bd482f8d9ab4216bb4e864f11ca85e5-20210805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IEJasd7vjHMBovS93+J85TfhlcomEvjTWLhbIAGAdRQ=; 
 b=UpgIC1fh+kSRrf158pi4IEKdUT48vzl3akqYlDOOqHo/NPOW/amRzPzwA0ikCEWOW1ScG9FN5T9FA3NtIwXRkPMKBOajEqI6TVw/KSqx4O4eIZhLvegxfi5jp+Gj+IqSnOappnqkO1jHmBAwr3DGDfdfnlrwRMwqlIX5ms02trw=;
X-UUID: 0bd482f8d9ab4216bb4e864f11ca85e5-20210805
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 479595289; Thu, 05 Aug 2021 00:50:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 00:50:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 15:50:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 Aug 2021 15:50:03 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] mt76: connac: add support maximum regulatory Tx power
Date: Thu, 5 Aug 2021 15:50:02 +0800
Message-ID: <1628149802-26387-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YQuI/Zf8vYjKx9LR@lore-desk--annotate>
References: <YQuI/Zf8vYjKx9LR@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_005017_058168_6E1FB025 
X-CRM114-Status: GOOD (  16.82  )
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

From: Sean Wang <sean.wang@mediatek.com>

>> From: YN Chen <YN.Chen@mediatek.com>
>>
>> Consider .max_reg_power in struct ieee80211_channel to limit the
>> maximum power the wireless device allowed to transmit on the
>> corresponding channel according to the regulatory domain.
>>
>> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
>> ---
>> v2: consider the power limit that can be allowed on mt7663
>> ---
>>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 43
>> ++++++++++++++++++-
>>  1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> index d71393b1c5e6..80987af03efe 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> @@ -1773,6 +1773,43 @@ static s8 mt76_connac_get_sar_power(struct mt76_phy *phy,
>>	return target_power;
>>  }
>>
>> +static s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
>> +				   struct ieee80211_channel *chan,
>> +				   s8 target_power)
>> +{
>> +	struct mt76_dev *dev = phy->dev;
>> +	struct ieee80211_supported_band *sband;
>> +	int i;
>> +
>> +	switch (chan->band) {
>> +	case NL80211_BAND_2GHZ:
>> +		sband = &phy->sband_2g.sband;
>> +		break;
>> +	case NL80211_BAND_5GHZ:
>> +		sband = &phy->sband_5g.sband;
>> +		break;
>> +	default:
>> +		return target_power;
>> +	}
>> +
>> +	for (i = 0; i < sband->n_channels; i++) {
>> +		struct ieee80211_channel *ch = &sband->channels[i];
>> +
>> +		if (ch->hw_value == chan->hw_value) {
>> +			if (!(ch->flags & IEEE80211_CHAN_DISABLED)) {
>> +				int power = 2 * ch->max_reg_power;
>> +
>> +				if (is_mt7663(dev) && (power > 63 || power < -64))
>> +					power = 63;
>
>I guess now you are missing the value for mt7921. What I mean is something similar to mt76_connac_mcu_build_sku()
>
>int max_power = is_mt7921(dev) ? 127 : 63;

the power limit that can be allowed on mt7921 would be -128 to 127 and target_power is s8 type

so I think the boundary check for mt7921 case is unnecessary

>Regards,
>Lorenzo
>
>> +				target_power = min_t(s8, power, target_power);
>> +			}
>> +			break;
>> +		}
>> +	}
>> +
>> +	return target_power;
>> +}
>> +
>>  static int
>>  mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
>>				  enum nl80211_band band)
>> @@ -1840,10 +1877,12 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
>>				.hw_value = ch_list[idx],
>>				.band = band,
>>			};
>> -			s8 sar_power;
>> +			s8 reg_power, sar_power;
>>
>> +			reg_power = mt76_connac_get_ch_power(phy, &chan,
>> +							     tx_power);
>>			sar_power = mt76_connac_get_sar_power(phy, &chan,
>> -							      tx_power);
>> +							      reg_power);
>>
>>			mt76_get_rate_power_limits(phy, &chan, &limits,
>>						   sar_power);
>> --
>> 2.25.1
>>
>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
