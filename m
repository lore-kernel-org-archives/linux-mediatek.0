Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2ADC02185
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2025 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xmYZF3aY3IGdwvZxAqaP4zRoLJKQUo9DuM2QltNNDDU=; b=bXhNCf3wkyMvDQa9O1j77Dmtw/
	8Dsm3p5HDVfzGGoc00KM6FDfM9KVqB0kO6w5BGyToUn3dBIYXzKWoLEH/GgJcLT2lq59hR6wRsna9
	KIVBZyihdcWdk3oPH40BfdKlO6SmTEQbf0m7UvD2+w/zl3LmVzqsj+XTJJ6Ss5+/YhbRlYxeeFeJb
	lGBVyubrqf1boKOjodUKhRsc4yjA6h2J4WYICtbdx27hUwEuZpoQ3oWAdHSa/5tN95iIPmEf4LdPs
	9iNBd+lIK29rwZSjJwory6Vp1CRa63eyApUZvRiqvVeAsBVfrjH8CCgaJwdz6m1h0Ka7ttoL4xWab
	BRcjpVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoSZ-00000005FKn-0Deg;
	Mon, 20 Jan 2025 09:52:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo3h-00000005Alk-297q
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jan 2025 09:27:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361f796586so45592815e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2025 01:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365220; x=1737970020; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xmYZF3aY3IGdwvZxAqaP4zRoLJKQUo9DuM2QltNNDDU=;
        b=iCBLc4j+DrKqjEMbJFIuf3QHDqKce4rphKdrV8vwWXJL8B5iV1MyrbDeqrgfyMJBJY
         mXb4DDKPkpKpPpY2i9j8MkV3paEmKCANJUeuuTIDn6K3jZnV3/9yN9SAibcYhnoAJdcd
         8iqi41GiqW86pOmAOM0EfIdSl6ITKXNOZGtNSqpcypiPOHObt6UCweaYnAWbXYgKw9ew
         ziyL4ZlFxL52RIzPEYuMS2XfUUx65LnmI+L3DcPUFK+aA/JbZUk6MlQLFnmmMu49h+bP
         fw8RgMgc9ZKD43aadnb/xkeoo9ZMaYD5OVoT7i0txvh9Q8PxxiDUtAaRhd7I2AxWHuF5
         KRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365220; x=1737970020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmYZF3aY3IGdwvZxAqaP4zRoLJKQUo9DuM2QltNNDDU=;
        b=IwhIXhEtDW9OcW++t270X/T22bbTno0LJArhx0uk/6kHlrFZg9oBJelHHgn4KtPqnb
         mMy5AdTdo/YQGaw2czKWO0pC5DIy0RPvIpAgfipT8C6MFYY8CNoJ2doO8aT4I41fi8u3
         aN9RJ6q76amRqALr52JTUNZCvvuyg4UxtWkqCTUOkThJkQ9CRgQzeptOmh5fzz7d4g5x
         osLl+WOcGQb3q6z6X13L14PEKPa2fTmopqKfp4xFhHIBpu0rJJSUoWOpVXwl2AtS5Kjl
         0rYgWqQB5K70R385e+aQoZviwZOYpwU99zgXo/BI8ZqudVTCotXGTn7qkQ0PdmBpp+ln
         mEWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIEK+KKu6VvmdaYTuHGQcScFEQmqHmKSVydcO7PdhvASRkwZIJn2+DX0W0HmRq0a3UdQTU3fCPQVjGvHozdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKFbhNVqMJ73JoMswWLnQshIyhcLFDdS5xg64VOpJFnAZ+xPEd
	hZkUa/Btamm3K9wooVVbY6vf1b5mTVQQAbHCFGKB8Q2dE1J3xL2bAhfibPF7idkAfXMsOrH3G5K
	k
X-Gm-Gg: ASbGncuPaeZNFS0O7/afNVKd2FW3JmgUDdjWhsegANSqoRJMsNiFpoLUp/OjxbbjpRS
	WjkHieHEZB2JS5ZU0jMl1OzBUtfei/iU5EdeLTBl21uSztsv9Q3V4F06Cm/YmTd4zdeCJocdAf8
	3LjdlYJ2m/GEiR41RD2QL7mDzyYdm79v/97efi6Hq/CGkunekXX11KnbbNI3mwKTPz7gK5FQEXp
	k6BcZcAVtpsRR2oDblhO01uGhnQt9NO4LR055NbcWoKrl7U6QI+WXc1hXCbqNx3KuxXMrzukD8=
X-Google-Smtp-Source: AGHT+IEVRfdM1hjC3nGZZpvEdm6bzTgZFb7R/65Me2vRHosAaz6iorR5ffRyvaw1YPc15jH9CgTzcA==
X-Received: by 2002:a05:6000:2a6:b0:385:eb7c:5d0f with SMTP id ffacd0b85a97d-38bf566a239mr11066302f8f.26.1737365219788;
        Mon, 20 Jan 2025 01:26:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32755f0sm9891123f8f.76.2025.01.20.01.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:26:59 -0800 (PST)
Date: Mon, 20 Jan 2025 12:26:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: connac: rework connac helpers
Message-ID: <e8b8790f-e828-44ee-8389-68f82bc1b099@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012701_554512_81421B0B 
X-CRM114-Status: GOOD (  10.29  )
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

Hello Shayne Chen,

Commit a0facfc80ec1 ("wifi: mt76: connac: rework connac helpers")
from Jan 2, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:588 mt76_connac2_mac_write_txwi()
	error: we previously assumed 'vif' could be null (see line 510)

drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
   492  void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
   493                                   struct sk_buff *skb, struct mt76_wcid *wcid,
   494                                   struct ieee80211_key_conf *key, int pid,
   495                                   enum mt76_txq_id qid, u32 changed)
   496  {
   497          struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
   498          u8 phy_idx = (info->hw_queue & MT_TX_HW_QUEUE_PHY) >> 2;
   499          struct ieee80211_vif *vif = info->control.vif;
   500          struct mt76_phy *mphy = &dev->phy;
   501          u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0, band_idx = 0;
   502          u32 val, sz_txd = mt76_is_mmio(dev) ? MT_TXD_SIZE : MT_SDIO_TXD_SIZE;
   503          bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
   504          bool beacon = !!(changed & (BSS_CHANGED_BEACON |
   505                                      BSS_CHANGED_BEACON_ENABLED));
   506          bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
   507                                           BSS_CHANGED_FILS_DISCOVERY));
   508          bool amsdu_en = wcid->amsdu;
   509  
   510          if (vif) {
                    ^^^
This code assumes the "vif" can be NULL.

   511                  struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
   512  
   513                  omac_idx = mvif->omac_idx;
   514                  wmm_idx = mvif->wmm_idx;
   515                  band_idx = mvif->band_idx;
   516          }
   517  
   518          if (phy_idx && dev->phys[MT_BAND1])
   519                  mphy = dev->phys[MT_BAND1];
   520  
   521          if (inband_disc) {
   522                  p_fmt = MT_TX_TYPE_FW;
   523                  q_idx = MT_LMAC_ALTX0;
   524          } else if (beacon) {
   525                  p_fmt = MT_TX_TYPE_FW;
   526                  q_idx = MT_LMAC_BCN0;
   527          } else if (qid >= MT_TXQ_PSD) {
   528                  p_fmt = mt76_is_mmio(dev) ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
   529                  q_idx = MT_LMAC_ALTX0;
   530          } else {
   531                  p_fmt = mt76_is_mmio(dev) ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
   532                  q_idx = wmm_idx * MT76_CONNAC_MAX_WMM_SETS +
   533                          mt76_connac_lmac_mapping(skb_get_queue_mapping(skb));
   534  
   535                  /* mt7915 WA only counts WED path */
   536                  if (is_mt7915(dev) && mtk_wed_device_active(&dev->mmio.wed))
   537                          wcid->stats.tx_packets++;
   538          }
   539  
   540          val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + sz_txd) |
   541                FIELD_PREP(MT_TXD0_PKT_FMT, p_fmt) |
   542                FIELD_PREP(MT_TXD0_Q_IDX, q_idx);
   543          txwi[0] = cpu_to_le32(val);
   544  
   545          val = MT_TXD1_LONG_FORMAT |
   546                FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
   547                FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
   548          if (!is_mt7921(dev))
   549                  val |= MT_TXD1_VTA;
   550          if (phy_idx || band_idx)
   551                  val |= MT_TXD1_TGID;
   552  
   553          txwi[1] = cpu_to_le32(val);
   554          txwi[2] = 0;
   555  
   556          val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
   557          if (!is_mt7921(dev))
   558                  val |= MT_TXD3_SW_POWER_MGMT;
   559          if (key)
   560                  val |= MT_TXD3_PROTECT_FRAME;
   561          if (info->flags & IEEE80211_TX_CTL_NO_ACK)
   562                  val |= MT_TXD3_NO_ACK;
   563  
   564          txwi[3] = cpu_to_le32(val);
   565          txwi[4] = 0;
   566  
   567          val = FIELD_PREP(MT_TXD5_PID, pid);
   568          if (pid >= MT_PACKET_ID_FIRST) {
   569                  val |= MT_TXD5_TX_STATUS_HOST;
   570                  amsdu_en = 0;
   571          }
   572  
   573          txwi[5] = cpu_to_le32(val);
   574          txwi[6] = 0;
   575          txwi[7] = amsdu_en ? cpu_to_le32(MT_TXD7_HW_AMSDU) : 0;
   576  
   577          if (is_8023)
   578                  mt76_connac2_mac_write_txwi_8023(txwi, skb, wcid);
   579          else
   580                  mt76_connac2_mac_write_txwi_80211(dev, txwi, skb, key);
   581  
   582          if (txwi[2] & cpu_to_le32(MT_TXD2_FIX_RATE)) {
   583                  /* Fixed rata is available just for 802.11 txd */
   584                  struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
   585                  bool multicast = ieee80211_is_data(hdr->frame_control) &&
   586                                   is_multicast_ether_addr(hdr->addr1);
   587                  u16 rate = mt76_connac2_mac_tx_rate_val(mphy, &vif->bss_conf, beacon,
                                                                      ^^^^^^^^^^^^^^
This code dereferences vif without checking.  Technically the
mt76_connac2_mac_tx_rate_val() has a NULL check but it doesn't work
because the address of &vif->bss_conf can't be NULL since it's in the
middle of the struct.

   588                                                          multicast);
   589                  u32 val = MT_TXD6_FIXED_BW;
   590  
   591                  /* hardware won't add HTC for mgmt/ctrl frame */
   592                  txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
   593  
   594                  val |= FIELD_PREP(MT_TXD6_TX_RATE, rate);
   595                  txwi[6] |= cpu_to_le32(val);
   596                  txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
   597  
   598                  if (!is_mt7921(dev)) {
   599                          u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
   600  
   601                          if (!spe_idx)
   602                                  spe_idx = 24 + phy_idx;
   603                          txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX, spe_idx));
   604                  }
   605  
   606                  txwi[7] &= ~cpu_to_le32(MT_TXD7_HW_AMSDU);
   607          }
   608  }


regards,
dan carpenter

