Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaaRVG2md5mGCSatFiJ6xoNHtgSVyZc1SaUSblNeO9s=; b=TZ8u++BRbD9arI
	MRyppKV1vSTvYH+BEMK1KxKK4VaaACsSjaNBeg5Q2PtVCWRt+D+D3jSyMj0EG72gmPcCU9FnC078j
	AKy9pDX0QipxZR80kcuiDiE/QjWBlKuiiVIalf/BAR8HVhY9krPqlReOODreksDWdN+uYaz8I9uSR
	3cc7LHsS3snzkNWUfxCVzncP8tGhrDR7FTWMvePrTOlcwSwF69gWMU9MMQQ8pTu7CuMNKIEwPzl3F
	gs+stmNbBtiNRKOWiriNyWadxX6rXd+SkPiUR+jUXQGJMsU1ISy8/hFn5T3h3fPdZH1einsi+/4m0
	RpxR/MbMncRFJGQvPkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqJyd-008VcL-BM; Thu, 25 Nov 2021 19:00:11 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqJya-008Vbk-9w
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 19:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Qh8CbPWy8w8H9DNtx5NktwSprKG+JU6TmFF/d5OU70=; b=hBmGezTe+n0ROXHLMSsGzeoBGn
 QdBtPIz8Wtf3Od1j6DPemUPZHGPzQScoavpzeydI9QTNh+bMRvRiLSrs6kcjXw4pJdukF6ofI8mWA
 DTLLLmTsPu3Ud+qjhBHzE48V8Lje95uo2uKN5yo0Xd01W4e1m7kSQU6H7XZxAgtaRP8A=;
Received: from p54ae9f3f.dip0.t-ipconnect.de ([84.174.159.63] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mqJyV-0001Wd-G8; Thu, 25 Nov 2021 20:00:03 +0100
Message-ID: <52d90d6b-6d67-776b-784d-bd4871de721b@nbd.name>
Date: Thu, 25 Nov 2021 20:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] mt76: mt7915: update station's airtime and gi from event
Content-Language: en-US
To: Ryder Lee <ryder.lee@mediatek.com>,
 MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Sujuan Chen <sujuan.chen@mediatek.com>
References: <20211125091330.27770-1-MeiChia.Chiu@mediatek.com>
 <7e06ea885e336e261b6ca458d371921df44af6b8.camel@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <7e06ea885e336e261b6ca458d371921df44af6b8.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_110008_563491_680DC403 
X-CRM114-Status: GOOD (  14.38  )
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

On 2021-11-25 19:56, Ryder Lee wrote:
> On Thu, 2021-11-25 at 17:13 +0800, MeiChia Chiu wrote:
>> From: MeiChia Chiu <meichia.chiu@mediatek.com>
> 
> Should be [RFC].
> 
>> To avoid race condition in firmware,
>> if firmware support airtime and gi event,
>> driver update station's airtime and gi from event.
>> 
>> Reviewed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
>> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
>> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
>> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
>> Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
>> 
>> ---
>>  .../net/wireless/mediatek/mt76/mt7915/init.c   |   2 +
>>  .../net/wireless/mediatek/mt76/mt7915/mac.c    |  35 ++++++++----
>>  .../net/wireless/mediatek/mt76/mt7915/mcu.c    | 138
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>  .../net/wireless/mediatek/mt76/mt7915/mcu.h    |  28 ++++++++++
>>  .../net/wireless/mediatek/mt76/mt7915/mt7915.h |  11 ++++
>>  5 files changed, 204 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
>> b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
>> index 4b56358d..a5f6d25d 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
>> @@ -960,6 +960,8 @@ int mt7915_register_device(struct mt7915_dev
>> *dev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	dev->fw_ver = mt76_rr(dev, MT_SWDEF(0x7c));
>> +
>>  	return mt7915_init_debugfs(&dev->phy);
>>  }
>>  
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> index 1041d88f..b2e20251 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> @@ -1433,7 +1433,8 @@ mt7915_mac_tx_free(struct mt7915_dev *dev,
>> struct sk_buff *skb)
>>  		mt7915_txwi_free(dev, txwi, sta, &free_list);
>>  	}
>>  
>> -	mt7915_mac_sta_poll(dev);
>> +	if (!mt7915_firmware_offload(dev))
>> +		mt7915_mac_sta_poll(dev);
> 
> @ Sujuan, can you double check if MCU_EXT_EVENT_TXRX_AIR_TIME works for
> all firmware versions? Maybe we can use this single event directly if
> everyone agrees with this change.
> 
> I'd suggest adding some persuasive testing datas into the commit
> message to help reviewers make adjudgement.
How often is this event sent? I think the effectiveness of airtime 
fairness after this change needs to be carefully verified.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
