Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F788C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 03:06:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF5E860FEF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 03:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF5E860FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PT4GvIX4gYDtWoLTWcQn3XzC6QgJK1AJT1yfmBeLOQ8=; b=IZvlrpdx/3Ru5FwixuPpa5eC6
	X0xU4MGpUHyZQRLJ8++8L5jr+MF8PGKbZWO/9rOoYEtSOe+kf2sSU8z628nvGWptxO9C4AERw5wj4
	rgHbQgflbDHH2DUjLwu4FN47Ke66lhBiZe77TxQQiOuO+SUyTJNUH8Apwy6F0J91M14TD8WxAcJcT
	lBMiz2etxD7TH1i3VGuX7/n2M7+cWd+aot8ogWtpD1hxwTlUlQR4QD1hDNR3c3wvmWYDpJ4uxBKMU
	MKpDhdcDrtmnBUq0qwWdGl8aXVAWXElOMsLS8I/oB8XgamiKa15gAdJG6J2jSCbSIRcZovOVTxjPq
	IrTsoZ05A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYKER-008zGV-Ah; Mon, 19 Apr 2021 03:05:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYKEP-008zGD-Df
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 03:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=5wHCKMseMB/d4e36/0EUb4xkpvSgVztyBR3iAjP7k+0=; b=OC3CUrzklym0oJPRyPnHrTRHy7
 Rw38TBWoV2aPD2mAOTeNk6Ku/PVyWZQmMLyJY7ZJX4i3+Vc0OD6SAhP6PuBR+P3y8Rpt65PvbHXiP
 4wJhMGKt/Qw1WKwlqmFjZ8bdXepo3RKr8S9crENERANWTk5c/UlRILXeJgR4mk5Bz9YKztJbgnAuB
 rwDU2bEDM1TeeFZgitbSQqpHQM6xVQpnGrAdyIn4aZNpBrr3z8/W5SUmvWt44EJA62AParQ1Yx8nm
 7B59o5MmTWyX6Cj/1EfVAaeTzzTdRCDLXtimLww+RWbhUSLftUVkrJU+O9dXwvYiUgF+G1TB9dSB7
 saqINs9Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYKEI-00AuOw-1U
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 03:05:46 +0000
X-UUID: 11a9b3249de0413daf1d009e03fbe07f-20210418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5wHCKMseMB/d4e36/0EUb4xkpvSgVztyBR3iAjP7k+0=; 
 b=Fljoagrgj+J9BxPrUUElD5CMCPhZOUbvmJB0vc6AJABjm+UtCy4x7+/VtrLA2e7EgE05hWHw73Uz6aanbFF+11/p+3M7uiksLAUMRnSCEOifEhHa1JjohBJtVz9FVg+6hrD6E6iN3MwsV8BXBAbVRQxRZlu2bv/ETJZysaBSDyM=;
X-UUID: 11a9b3249de0413daf1d009e03fbe07f-20210418
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2069193032; Sun, 18 Apr 2021 20:05:39 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Apr 2021 20:04:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 11:04:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 11:04:38 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4/6] mt76: mt7921: introduce mt7921_wpdma_reinit_cond
 utility routine
Date: Mon, 19 Apr 2021 11:04:37 +0800
Message-ID: <1618801477-20003-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YHxi1+jRHIfAuKJa@lore-desk--annotate>
References: <YHxi1+jRHIfAuKJa@lore-desk--annotate>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E907B49C48B4F74737ED0C98072937E5F9662D470DDAD9C8DA53356B95152BB32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_200542_247436_2113F569 
X-CRM114-Status: GOOD (  13.17  )
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

>> From: Sean Wang <sean.wang@mediatek.com>
>
>I guess here we should use my 'From' tag

That is my fault, I'll change it in the next version.

>
>Regards,
>Lorenzo
>
>>
>> Add mt7921_wpdma_reinit_cond to check dummy reg if driver needs to
>> reinitialized WPDMA after driver_own operation
>>
>> Co-developed-by: Leon Yen <leon.yen@mediatek.com>
>> Signed-off-by: Leon Yen <leon.yen@mediatek.com>
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  .../net/wireless/mediatek/mt76/mt76_connac.h  |  4 +++
>>  .../wireless/mediatek/mt76/mt7921/debugfs.c   | 13 ++++++++++
>>  .../net/wireless/mediatek/mt76/mt7921/dma.c   | 25 +++++++++++++++++++
>>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  6 +++++
>>  4 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> index b811f3c410a1..3b5bff80a462 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
>> @@ -58,6 +58,10 @@ struct mt76_connac_pm {
>>	struct delayed_work ps_work;
>>	unsigned long last_activity;
>>	unsigned long idle_timeout;
>> +
>> +	struct {
>> +		unsigned int lp_wake;
>> +	} stats;
>>  };
>>
>>  struct mt76_connac_coredump {
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> index 5a54cd8d2ce4..bd2aca654767 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
>> @@ -256,6 +256,17 @@ mt7921_pm_get(void *data, u64 *val)
>>
>>  DEFINE_DEBUGFS_ATTRIBUTE(fops_pm, mt7921_pm_get, mt7921_pm_set,
>> "%lld\n");
>>
>> +static int
>> +mt7921_pm_stats(struct seq_file *s, void *data) {
>> +	struct mt7921_dev *dev = dev_get_drvdata(s->private);
>> +	struct mt76_connac_pm *pm = &dev->pm;
>> +
>> +	seq_printf(s, "low power wakes: %9d\n", pm->stats.lp_wake);
>> +
>> +	return 0;
>> +}
>> +
>>  static int
>>  mt7921_pm_idle_timeout_set(void *data, u64 val)  { @@ -322,6 +333,8
>> @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
>>	debugfs_create_file("idle-timeout", 0600, dir, dev,
>>			    &fops_pm_idle_timeout);
>>	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
>> +	debugfs_create_devm_seqfile(dev->mt76.dev, "runtime_pm_stats", dir,
>> +				    mt7921_pm_stats);
>>
>>	return 0;
>>  }
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> index 8c556ff3ae93..72f5704f8f11 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
>> @@ -329,6 +329,31 @@ int mt7921_wpdma_reset(struct mt7921_dev *dev, bool force)
>>	return 0;
>>  }
>>
>
<snip>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
