Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3436BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 05:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4C6F6124B
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 05:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4C6F6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAyBHBOjlzwnkSYvAo/t4xm/ArPkHR4iS6Kqw1nwN/Q=; b=shUjPLOLFrMMgg
	mn4Pgfy30nGjJmQMaqTaasEUjmqtBaputn6RYyRSdA+fNDjHdpa1lsqj6bKNHsZFFk7A5W2m78zoQ
	h1nzpLPYnXtN9tIVlOvVpYZYMePJSB+W514TjhQ7GseRKhDue7KudFapP70TBd2X4PK+qrRccivqg
	Frg884Oo/en14/xa7QuAr/3lzFg49vMyLX8qFcYCMbswwONNh5pCoyX+kg7V/9i75v5cgSvtW5PLc
	s1l8BjbeXNrVBrMg4ACF0zpnUhTKhTzPOcWpTvv8NfBerZ9QBEZksblF7U3/3CM5v3yAbYJegKDTD
	R+5EqZbSmlcawnFDF+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTdmm-00D7KP-Pl; Fri, 24 Sep 2021 05:30:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTdmj-00D7K2-L7
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 05:30:11 +0000
X-UUID: a7a3a1cef0ea4d4bbf271715cd0afac0-20210923
X-UUID: a7a3a1cef0ea4d4bbf271715cd0afac0-20210923
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1434845094; Thu, 23 Sep 2021 22:30:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 22:30:01 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Sep 2021 13:30:00 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
 <frankgor@google.com>, <jemele@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 06/16] mt76: connac: move mcu reg access utility
 routines in mt76_connac_lib module
Date: Fri, 24 Sep 2021 13:30:00 +0800
Message-ID: <1632461400-8440-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YUW8KBTC7t3PHJwF@lore-desk--annotate>
References: <YUW8KBTC7t3PHJwF@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_223009_728125_2551EE3C 
X-CRM114-Status: GOOD (  13.04  )
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
>>
>> Move mcu reg access shared between mt7663s and mt7921s in
>> mt76_connac_lib module.
>>
>> Tested-by: Deren Wu <deren.wu@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 27
>> +++++++++++++++++++  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |
>> 2 ++
>>  2 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> index ae692052de97..a53f6344a184 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> @@ -2406,6 +2406,33 @@ void mt76_connac_mcu_set_suspend_iter(void
>> *priv, u8 *mac,  }
>> EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_suspend_iter);
>>
>> +u32 mt76_connac_mcu_reg_rr(struct mt76_dev *dev, u32 offset) {
>> +	struct {
>> +		__le32 addr;
>> +		__le32 val;
>> +	} __packed req = {
>> +		.addr = cpu_to_le32(offset),
>> +	};
>> +
>> +	return mt76_mcu_send_msg(dev, MCU_CMD_REG_READ, &req, sizeof(req),
>> +				 true);
>> +}
>> +EXPORT_SYMBOL_GPL(mt76_connac_mcu_reg_rr);
>
>It seems quite a common code, does it worth to move them in mcu.c? (mt76 module)

My understanding would be mt76/mcu.c only provides the framework that handle the
pure software stuff and shouldn't contain any firmware or device related logic.

So I prefer to add those commands MCU_CMD_REG_READ and MCU_CMD_REG_WRITE to
mt76_connac_mcu.c like the other commands we have added there.

>
>Regards,
>Lorenzo
>
>> +
>> +void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32
>> +val) {
>> +	struct {
>> +		__le32 addr;
>> +		__le32 val;
>> +	} __packed req = {
>> +		.addr = cpu_to_le32(offset),
>> +		.val = cpu_to_le32(val),
>> +	};
>> +
>> +	mt76_mcu_send_msg(dev, MCU_CMD_REG_WRITE, &req, sizeof(req), false);
>> +} EXPORT_SYMBOL_GPL(mt76_connac_mcu_reg_wr);
>>  #endif /* CONFIG_PM */
>>
>>  MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>"); diff --git
>> a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
>> b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
>> index ea46dde364e1..6c410c4a8d6e 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
>> @@ -1111,4 +1111,6 @@ void mt76_connac_mcu_coredump_event(struct
>> mt76_dev *dev, struct sk_buff *skb,  int
>> mt76_connac_mcu_set_rate_txpower(struct mt76_phy *phy);  int mt76_connac_mcu_set_p2p_oppps(struct ieee80211_hw *hw,
>>				  struct ieee80211_vif *vif);
>> +u32 mt76_connac_mcu_reg_rr(struct mt76_dev *dev, u32 offset); void
>> +mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
>>  #endif /* __MT76_CONNAC_MCU_H */
>> --
>> 2.25.1
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
