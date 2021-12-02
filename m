Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A28C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qW7X2Bvr069COm7ILA8I5ZfjK38etfpkLHehLYbMJL0=; b=fqHEVc6IuUqN/O
	TGCRMVmuVkQkt/9SW29JU+uWjCrVAPY/iOWRdJDXwyXutE0ClbY9L0CMpR5xRvTBLk7xGgXt6/cR2
	QKeKJ9KQbgWc91tuKf+wvLDHDfdLu2AiRL+yEuQamG4otVUKFBTfGXQrWdjSdZ0cg9rGcFymlvHwc
	WHzG8xZZ2ocu1+AZEIMSBXcWw1D94HgqAApuEErHX8RwOHhftfV6BYK/l+LVDd2riUzsvXOULVxQl
	MgpZJ8yUvCkJBOeXWeHKZA2o4970HI43AWWqFr/WcIHvgI8pEdf8XKhOzqA8OsWks7/5gGMp+G5dQ
	tFgKz/O70Bl10DQGr0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msj17-00BlPl-Oa; Thu, 02 Dec 2021 10:08:41 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msj0y-00BlLl-7T
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 10:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m93bZXnn0ptcKyOblSvacBdPrGTPrIFdEuo/yL258tw=; b=X8pAOI1vI2MbkjRmspqSnAgp7x
 XwjG7ZUFnRTqXSNyyRx022hX14l4ino/5nXN/5+V661zgi6QNl8N4goAS4Pccy0lkarp2cR/0irEf
 3dTW1kZ6OK8zzYT6uwJW4Y+SYjcglqjV67GCTLnO6xT/AYh8D1vNYqrFQSsdL3zfHJXU=;
Received: from p54ae943f.dip0.t-ipconnect.de ([84.174.148.63] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1msj0n-0002sV-BI; Thu, 02 Dec 2021 11:08:21 +0100
Message-ID: <4e21b944-398a-8960-08fd-a515f58af1cb@nbd.name>
Date: Thu, 2 Dec 2021 11:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] mt76: fix 802.3 RX fail by hdr_trans
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
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
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <0b88b34cc5103e247c134901f9c39614128eb599.1638424783.git.deren.wu@mediatek.com>
 <4994484d-a053-a870-65e6-6461979ef74f@nbd.name>
In-Reply-To: <4994484d-a053-a870-65e6-6461979ef74f@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_020832_509595_87489E11 
X-CRM114-Status: GOOD (  14.48  )
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


On 2021-12-02 09:37, Felix Fietkau wrote:
> 
> On 2021-12-02 08:40, Deren Wu wrote:
>> From: Deren Wu <deren.wu@mediatek.com>
>> 
>> Should not run hdr_trans process for 802.3 packets,
>> this would cause all data frame RX fail.
>> 
>> Fixes: d9930ec65b9f ("mt76: only set rx radiotap flag from within decoder functions")
>> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
>> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
>> ---
>>   drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 2 +-
>>   drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 3 +--
>>   2 files changed, 2 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> index 6c14cb1cfd5a..5757284b24a5 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> @@ -794,7 +794,7 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
>>   		status->flag |= RX_FLAG_8023;
>>   	}
>>   
>> -	if (rxv && mode >= MT_PHY_TYPE_HE_SU)
>> +	if (rxv && mode >= MT_PHY_TYPE_HE_SU && !(status->flag & RX_FLAG_8023))
>>   		mt7915_mac_decode_he_radiotap(skb, rxv, mode);
>>   
>>   	if (!status->wcid || !ieee80211_is_data_qos(fc))
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> index e17c8f4c9747..eaffe665cb28 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> @@ -780,7 +780,6 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
>>   			mt76_insert_ccmp_hdr(skb, key_id);
>>   		}
>>   
>> -		hdr = mt76_skb_get_hdr(skb);
> This line is not safe to remove, since mt76_insert_ccmp_hdr moves the
> header. However, there is a redundant call to mt76_skb_get_hdr above
> this part, which you can remove. Please do that in a separate patch
> though, since it has nothing to do with the rest of the changes.
I folded this patch into the commit that it fixes (excluding the
mt76_skb_get_hdr bit).

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
