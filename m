Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE0C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 20:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=maOS4ywDcz5IvC+hAViuZGO3E5ltb4jLPzs5aEw+NUY=; b=iVEBr+L+YQBBXw14AypfnZcGdy
	xHEGRbCQgNewDB2xEAHRYZ1SiGHJWJwFpdvUBmfEHml/9fi5zA0WgiJdQOcWQjpVi5a9F2AvzjJbA
	aSDUzt7gYu4XMYlNGe6qFvbPcX0fzC0QIiugaXpk3SOBKxqs9wyDj+XEs0lzQYiLIIrHqGkvrUF/p
	O7smozi6FLefZky6m1pJ3yua4M0sslPueJ5fgzDXEEHrALLkS3r4T4G7kaw9UEf4vEM9qwlqf2jWJ
	1gAKGW8BAVnb+JR4pkQrnwm6eEVchjbKdHMsdtUo7yo4ikBt11K0vQXW+VrS8p87gX7lzGdkQp9CE
	IlBH8rvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTSAS-00000008Gec-23w1;
	Mon, 15 Jul 2024 20:19:28 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTSAP-00000008Gdv-3gQJ
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 20:19:27 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-70365f905b6so2676374a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jul 2024 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721074763; x=1721679563; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=maOS4ywDcz5IvC+hAViuZGO3E5ltb4jLPzs5aEw+NUY=;
        b=YZQboEqWZjXKgiMh3LWWhIuQg50bhnnaHl6FcQps36N97PkCHz5f3qDQlJ1iCy7eDM
         GGh4R7ZMNchEukoOoMwClm2pPMz4WWT1/dyze2I9HO6wCYhkA++ikEBLCRYSa8XhKSaA
         6B9QFiu5R9vwLkY8EHPGwK73xAUUQqlELkJFghH9pHRvcs1tTtWshd+j0OtiZxVsm34T
         wWN8xBYTRJdXt9PhTgDCtr2a2FTPqp0EpECyDuOb3a0bWJ0SdIRVRAiKZYgRZJW0qd2p
         uE1x1OB2ZmQ91NoxHQKXiQzZM+8JX6GUez8VelS+Hlnd/G9rNczCYAWF2jTfF6F5jkeL
         rL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721074763; x=1721679563;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maOS4ywDcz5IvC+hAViuZGO3E5ltb4jLPzs5aEw+NUY=;
        b=UlZrp8f7DNeFMLx+4BxbHaZ3UZKVlS4w0Eb/hvvx04D81XDuV9OsNBpLARLkR8JRb4
         +3lGb3b35KbYA7rGjHGQNijKAY88u3mtQkleYSasAnsDFyLJaVbDReEzlojuRZ0HiQSL
         uA/8TVAGewEg1x3kMxKSXAQnk4Cp5uDBjakd2LDgQgpY6VDh6ruPUJ1//c5GSDxuvCRi
         b//fPXIgvmUx0ac9aczrbtRrSGPsUD+ck+8QNF85Qp05DwpGhDiYk/bkHKfEeZ0MeWZW
         lFvX0Cyt8/KcEqUCLNJwVMwdmLltMX2AukFQIPh3p20aSH5OZ6Obaco8Bfsi3blnaUda
         pidg==
X-Gm-Message-State: AOJu0YxwffEfdvPs5NURWsIbGQluM8bszVnyQcRgW+pApE+QCi6jmQIr
	Cqt+Uofot9EK4P8cXrzdstmTHH03WXRq49gOAYAWf860YwFt7A+pJlMBxnF53Lw=
X-Google-Smtp-Source: AGHT+IHNVYGe1Smcwc9yK0/5mEv4otm3vUzfR1CLvNE2S8tTqKDvSdCNGokr8chIYymtk1aMXadIVw==
X-Received: by 2002:a05:6830:3107:b0:703:79c6:a9bb with SMTP id 46e09a7af769-708d9960a41mr236090a34.7.1721074763029;
        Mon, 15 Jul 2024 13:19:23 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:750c:19a4:cf5:50a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708c0d20d33sm1088578a34.71.2024.07.15.13.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:19:22 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:19:19 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deren Wu <deren.wu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for
 mt7925 chips
Message-ID: <23b68000-ffde-449c-b23d-9ae673165e78@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_131925_962969_60A0642B 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
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

Hello Deren Wu,

Commit c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver
for mt7925 chips") from Sep 18, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7925/mac.c:810 mt7925_mac_write_txwi()
	error: we previously assumed 'vif' could be null (see line 745)

drivers/net/wireless/mediatek/mt76/mt7925/mac.c
   728  mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
   729                        struct sk_buff *skb, struct mt76_wcid *wcid,
   730                        struct ieee80211_key_conf *key, int pid,
   731                        enum mt76_txq_id qid, u32 changed)
   732  {
   733          struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
   734          struct ieee80211_vif *vif = info->control.vif;
   735          u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0, band_idx = 0;
   736          u32 val, sz_txd = mt76_is_mmio(dev) ? MT_TXD_SIZE : MT_SDIO_TXD_SIZE;
   737          bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
   738          struct mt76_vif *mvif;
   739          bool beacon = !!(changed & (BSS_CHANGED_BEACON |
   740                                      BSS_CHANGED_BEACON_ENABLED));
   741          bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
   742                                           BSS_CHANGED_FILS_DISCOVERY));
   743          struct mt792x_bss_conf *mconf;
   744  
   745          mconf = vif ? mt792x_vif_to_link((struct mt792x_vif *)vif->drv_priv,
                        ^^^
This assumes vif can be NULL.

   746                                           wcid->link_id) : NULL;
   747          mvif = mconf ? (struct mt76_vif *)&mconf->mt76 : NULL;
   748  
   749          if (mvif) {
   750                  omac_idx = mvif->omac_idx;
   751                  wmm_idx = mvif->wmm_idx;
   752                  band_idx = mvif->band_idx;
   753          }
   754  
   755          if (inband_disc) {
   756                  p_fmt = MT_TX_TYPE_FW;
   757                  q_idx = MT_LMAC_ALTX0;
   758          } else if (beacon) {
   759                  p_fmt = MT_TX_TYPE_FW;
   760                  q_idx = MT_LMAC_BCN0;
   761          } else if (qid >= MT_TXQ_PSD) {
   762                  p_fmt = mt76_is_mmio(dev) ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
   763                  q_idx = MT_LMAC_ALTX0;
   764          } else {
   765                  p_fmt = mt76_is_mmio(dev) ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
   766                  q_idx = wmm_idx * MT76_CONNAC_MAX_WMM_SETS +
   767                          mt76_connac_lmac_mapping(skb_get_queue_mapping(skb));
   768  
   769                  /* counting non-offloading skbs */
   770                  wcid->stats.tx_bytes += skb->len;
   771                  wcid->stats.tx_packets++;
   772          }
   773  
   774          val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + sz_txd) |
   775                FIELD_PREP(MT_TXD0_PKT_FMT, p_fmt) |
   776                FIELD_PREP(MT_TXD0_Q_IDX, q_idx);
   777          txwi[0] = cpu_to_le32(val);
   778  
   779          val = FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
   780                FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
   781  
   782          if (band_idx)
   783                  val |= FIELD_PREP(MT_TXD1_TGID, band_idx);
   784  
   785          txwi[1] = cpu_to_le32(val);
   786          txwi[2] = 0;
   787  
   788          val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
   789  
   790          if (key)
   791                  val |= MT_TXD3_PROTECT_FRAME;
   792          if (info->flags & IEEE80211_TX_CTL_NO_ACK)
   793                  val |= MT_TXD3_NO_ACK;
   794          if (wcid->amsdu)
   795                  val |= MT_TXD3_HW_AMSDU;
   796  
   797          txwi[3] = cpu_to_le32(val);
   798          txwi[4] = 0;
   799  
   800          val = FIELD_PREP(MT_TXD5_PID, pid);
   801          if (pid >= MT_PACKET_ID_FIRST) {
   802                  val |= MT_TXD5_TX_STATUS_HOST;
   803                  txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
   804                  txwi[3] &= ~cpu_to_le32(MT_TXD3_HW_AMSDU);
   805          }
   806  
   807          txwi[5] = cpu_to_le32(val);
   808  
   809          val = MT_TXD6_DAS | FIELD_PREP(MT_TXD6_MSDU_CNT, 1);
   810          if (!ieee80211_vif_is_mld(vif) ||
                                          ^^^
But here "vif" is dereferenced without checking

   811              (q_idx >= MT_LMAC_ALTX0 && q_idx <= MT_LMAC_BCN0))
   812                  val |= MT_TXD6_DIS_MAT;
   813          txwi[6] = cpu_to_le32(val);
   814          txwi[7] = 0;
   815  
   816          if (is_8023)
   817                  mt7925_mac_write_txwi_8023(txwi, skb, wcid);
   818          else
   819                  mt7925_mac_write_txwi_80211(dev, txwi, skb, key);
   820  
   821          if (txwi[1] & cpu_to_le32(MT_TXD1_FIXED_RATE)) {
   822                  struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
   823                  bool mcast = ieee80211_is_data(hdr->frame_control) &&
   824                               is_multicast_ether_addr(hdr->addr1);
   825                  u8 idx = MT792x_BASIC_RATES_TBL;
   826  
   827                  if (mvif) {
   828                          if (mcast && mvif->mcast_rates_idx)
   829                                  idx = mvif->mcast_rates_idx;
   830                          else if (beacon && mvif->beacon_rates_idx)
   831                                  idx = mvif->beacon_rates_idx;
   832                          else
   833                                  idx = mvif->basic_rates_idx;
   834                  }
   835  
   836                  txwi[6] |= cpu_to_le32(FIELD_PREP(MT_TXD6_TX_RATE, idx));
   837                  txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
   838          }
   839  }

regards,
dan carpenter

