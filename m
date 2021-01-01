Return-Path: <SRS0=xQRD=GE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A38C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jan 2021 12:37:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 664A322202
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jan 2021 12:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 664A322202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pcQdTNHxMRVk+0yV0LoDRKFna1EJgUZKC8SAKdNoZws=; b=j0JuJULoMVPF9kPj9iDbpdg77
	3yiVXnU/cBo4GQ6nB4BhjXVLw9CUHdXTRkbftoqu3G7LpfKjvEppRsio+N9afR3hOPHiGr8z93iBQ
	o/5n4T282AZWaIMg1SK/Lrs8yPzS1G3Dk41g5ublqKy03OmSMl8XiInTFHe3F4FHvUml+OJWf8PCO
	kmA+XvYM6NHXS4B1En07BZ6FpAABAFFadc0el/0G+R3C/Y0zxJRL5axRIAtb8waRPfiZ5UXtuK6Zx
	O2g23cqnBnkocmS9cqrTsaNm227LsuwT9O4HZTFZi/v0o3di9aJQqjpQmRDuyDgOuj5cPAxOF7wYR
	fZYtwETBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvJfn-0005RK-6n; Fri, 01 Jan 2021 12:36:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvJfi-0005PU-GJ
 for linux-mediatek@lists.infradead.org; Fri, 01 Jan 2021 12:36:48 +0000
X-UUID: 09b405ae84224b078c820dfdc9dc2aea-20210101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Q5BiJP6pcOQhqJPYn05K90YILm1scb/ffGfvfQ98pyo=; 
 b=Qad6OTYX1JgGnCJf5ThaOyLsBAHbBPZp0rpSoE01ItqcpVIeGmrLN3hnYELXwMAq7Gff46r3WmnqZiwxQ/5ivUbtH70P08E9awk2OhOgdjfGvd+jULV8UTRLaEq2RKQOnZn3JeYeG5TLVKo9qtSxJRnZtEJKZKhOt5YDry3S/yE=;
X-UUID: 09b405ae84224b078c820dfdc9dc2aea-20210101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 104043042; Fri, 01 Jan 2021 04:36:36 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Jan 2021 04:36:34 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Jan 2021 20:36:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Jan 2021 20:36:14 +0800
From: <sean.wang@mediatek.com>
To: <ryder.lee@mediatek.com>
Subject: Re: [PATCH -next v4 03/13] mt76: mt7921: add MAC support
Date: Fri, 1 Jan 2021 20:36:13 +0800
Message-ID: <1609504573-16814-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1609455495.20208.8.camel@mtkswgap22--annotate>
References: <1609455495.20208.8.camel@mtkswgap22--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210101_073647_296533_3A50CAEF 
X-CRM114-Status: GOOD (  11.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, posh.sun@mediatek.com,
 YN.Chen@mediatek.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

>On Thu, 2020-12-31 at 02:06 +0800, sean.wang@mediatek.com wrote:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Add Rx packet description parsing, Tx packet description compositon,
>> handle packet recycling and provide MAC information mt76 core needs to
>> support mac80211.
>>
>> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
>> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  .../wireless/mediatek/mt76/mt7921/Makefile    |    2 +-
>>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 1364 +++++++++++++++++
>
>Why not put mac.h into this patch?

I remember mcu.c would refer to something in mac.h but it seems better move mac.h to here.

>
>>  2 files changed, 1365 insertions(+), 1 deletion(-)  create mode
>> 100644 drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>
>> +int mt7921_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
>> +			  enum mt76_txq_id qid, struct mt76_wcid *wcid,
>> +			  struct ieee80211_sta *sta,
>> +			  struct mt76_tx_info *tx_info)
>> +{
>> +	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
>> +	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
>> +	struct ieee80211_key_conf *key = info->control.hw_key;
>> +	struct mt76_tx_cb *cb = mt76_tx_skb_cb(tx_info->skb);
>> +	struct mt76_txwi_cache *t;
>> +	struct mt7921_txp_common *txp;
>> +	int id;
>> +	u8 *txwi = (u8 *)txwi_ptr;
>
>Moreover, hardware cannot add LLC-SNAP when skb->data_len is 0, which causes Tx stuck. We found this case happened on mt7915 (station mode) quality test with few packets whose skb->len = 14
>
>So,https://github.com/nbd168/wireless/commit/6b6605e4061c94c9909ff82acc0e02bfd3a8d40e
>

We'll add the fixes in the next version including mcu one you suggested in the other mail thread.

Happy new year
	Sean

>Ryder
>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
