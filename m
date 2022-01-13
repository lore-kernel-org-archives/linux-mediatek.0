Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFDFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 22:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bPepXpOmR6P6tM0x7Z52LO5P8jhCt9kXHHjIumJ8SU=; b=gRFXIIy9oQDerL
	g55PUHpN0wZJPpMYnzaTIgzPLj8dT8nCgpd4JMj2EiAHc28o9dF50QXH5mnpDpw1tyEYUXRELbEI2
	aqa97HdHof380DA1FfCB7iKKBQIrcQtXWesinX0vTM3QJkd36QiO52T4mBkiueTIHoGgIK+JB7tAz
	HGVUMyKii90sXfS5F62n1IpoYiw8otPMoBRTaRYAl2tp4EMAaBj9av/qCZrW1Kss0hAEJ2jxwb0Fe
	q0ZLPx1YeauDpGz6vPokXuFdUj0M731X6Xam0Q8fTL2wVfDoarDOnP3xToL7Y8FZCcZ/brG5PVDbG
	rBSiGIqFZ7NXMjE/HTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n88p8-007ENX-Ot; Thu, 13 Jan 2022 22:44:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n88p3-007EN5-8s
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 22:44:01 +0000
X-UUID: c199958fd67a482a8b98b07b028299ef-20220113
X-UUID: c199958fd67a482a8b98b07b028299ef-20220113
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1666054791; Thu, 13 Jan 2022 15:43:55 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 14:43:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Jan 2022 06:43:39 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Jan 2022 06:43:39 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/3] mt76: sdio: honor the largest Tx buffer the hardware
 can support
Date: Fri, 14 Jan 2022 06:43:38 +0800
Message-ID: <1642113818-9675-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <Yd/sYYP1XJ3J8RuR@lore-desk--annotate>
References: <Yd/sYYP1XJ3J8RuR@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_144357_345843_3B8AC68F 
X-CRM114-Status: GOOD (  12.26  )
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

<snip>
>> @@ -299,6 +301,17 @@ int mt76s_hw_init(struct mt76_dev *dev, struct
>> sdio_func *func, int hw_ver)  }  EXPORT_SYMBOL_GPL(mt76s_hw_init);
>>
>> +u32 mt76s_get_xmit_buf_sz(struct mt76_dev *dev, u32 dev_max_len) {
>> +	struct sdio_func *func = dev->sdio.func;
>> +	u32 host_max_len = min_t(u32, func->card->host->max_req_size,
>> +				 func->cur_blksize *
>> +				 func->card->host->max_blk_count);
>> +
>> +	return min_t(u32, host_max_len, dev_max_len); }
>> +EXPORT_SYMBOL_GPL(mt76s_get_xmit_buf_sz);
>
>I think we can squash this patch with the previous one and move the code above in mt76s_init(). Agree?

these comments you have in the patchset all look fine to me, I will post v2 soon.

	Sean
>
>Regards,
>Lorenzo
>
>> +
>>  int mt76s_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid)
>> {
>>	struct mt76_queue *q = &dev->q_rx[qid]; diff --git
>> a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> index a04cd2444247..9fcf507e09bd 100644
>> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> @@ -254,7 +254,7 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q)
>>		}
>>
>>		pad = roundup(e->skb->len, 4) - e->skb->len;
>> -		if (len + e->skb->len + pad + 4 > MT76S_XMIT_BUF_SZ)
>> +		if (len + e->skb->len + pad + 4 > dev->sdio.xmit_buf_sz)
>>			break;
>>
>>		if (mt76s_tx_pick_quota(sdio, mcu, e->buf_sz, &pse_sz,
>> --
>> 2.25.1
>>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
