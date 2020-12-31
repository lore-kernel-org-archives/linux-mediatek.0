Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141F0C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 09:02:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66CFE223C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 09:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66CFE223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lvOhBy3O9LXG9MvSLaD85LXc4TlPzQ1rEbfBVlfPT4M=; b=Bbp2KE6b6X8sKFOY5HojwQNAn
	kxSxz5ORN5nVszRrR77elw8pjqW9UhmuvwMwSjFgGq7PbxbcL1fTKmWaU4WdxxkO7YZ+HacMF9l4f
	x87z8YbCJb90kIdcbiLZAc/R3NEaNS57C87PCDXYyvuD7KeknD4S1CAymu1GYK/MmK2GLOVD3IdMu
	ywSx0FxuvIjwZT5B35Tr07io4kUBa+P3HCU3iFVHUHMClVmCXErtTfMTRXYU/1Q1eJ3rw9MEnGuB6
	Ln6f8+L0DqVape2lZpr439pUlkePKo7XiuVF8NjCu+zBiX8ymiorgiQGaqHMpfjdXy+6NSGzcGEuH
	2uE74GttQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kutqJ-00039p-5B; Thu, 31 Dec 2020 09:01:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kutqF-000396-O5
 for linux-mediatek@lists.infradead.org; Thu, 31 Dec 2020 09:01:57 +0000
X-UUID: 2472907951494085ac56ae1e3ef8bc3a-20201231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+l0F3UfPINeuQQDthlZCRT/biWv4vrO3YtRXXQfQwck=; 
 b=S7N8NI3Xg189PNdurdRvFAoVpT3UKa2gNkHcWbxk3bFKlvXqKw5ZLytfMWOvo4rq8a88sT59lL1+XeZPFUHvN/+E6k2oy0qcsgfHdysCF0XTpef0MDs/S2MMxDh4qDoeimAbnXKXy4T+LL1TWs+PitVVGaj2dCfpgVSLrMsLQ+Y=;
X-UUID: 2472907951494085ac56ae1e3ef8bc3a-20201231
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1595380984; Thu, 31 Dec 2020 01:01:51 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Dec 2020 00:55:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Dec 2020 16:55:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Dec 2020 16:55:46 +0800
Message-ID: <1609404946.23449.15.camel@mtkswgap22>
Subject: Re: [PATCH -next v4 02/13] mt76: mt7921: add MCU support
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>
Date: Thu, 31 Dec 2020 16:55:46 +0800
In-Reply-To: <38dc730fe632525472456816dd51620d9b3ba547.1609347310.git.objelf@gmail.com>
References: <cover.1609347310.git.objelf@gmail.com>
 <38dc730fe632525472456816dd51620d9b3ba547.1609347310.git.objelf@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 349190E50DED03C0D3D922A6AEB26916EB510F5C7EE67374E4672B8003FCD22F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_040156_553077_0FF48448 
X-CRM114-Status: GOOD (  18.10  )
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
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Lorenzo Bianconi <lorenzo@kernel.org>, Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-31 at 02:06 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> MT7921 contains a microprocessor with which the host can use command/event
> to communicate to implement offload features such as establish connection,
> hardware scan and so on. The host has to download the ROM patch, RAM
> firmware and finally activate the MCU to complete the MT7921
> initialization.
> 
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7921/Makefile    |    2 +-
>  .../net/wireless/mediatek/mt76/mt7921/mac.h   |  333 +++
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 2438 +++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 1050 +++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  353 +++
>  .../net/wireless/mediatek/mt76/mt7921/regs.h  |  413 +++
>  6 files changed, 4588 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mac.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/regs.h


> +static int
> +mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
> +			int cmd, int *wait_seq)
> +{
> +	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
> +	int txd_len, mcu_cmd = cmd & MCU_CMD_MASK;
> +	enum mt76_txq_id txq = MT_MCUQ_WM;

Implicit conversion from enumeration type 'enum mt76_mcuq_id' to
different enumeration type 'enum mt76_txq_id' 

Should be enum mt76_mcuq_id


> +static int
> +mt7921_mcu_sta_key_tlv(struct sk_buff *skb, struct ieee80211_key_conf *key,
> +		       enum set_key_cmd cmd)
> +{
> +	struct sta_rec_sec *sec;
> +	struct tlv *tlv;
> +	u32 len = sizeof(*sec);
> +
> +	tlv = mt7921_mcu_add_tlv(skb, STA_REC_KEY_V2, sizeof(*sec));
> +
> +	sec = (struct sta_rec_sec *)tlv;
> +	sec->add = cmd;
> +
> +	if (cmd == SET_KEY) {
> +		struct sec_key *sec_key;
> +		u8 cipher;
> +
> +		cipher = mt7921_mcu_get_cipher(key->cipher);
> +		if (cipher == MT_CIPHER_NONE)
> +			return -EOPNOTSUPP;
> +
> +		sec_key = &sec->key[0];
> +		sec_key->cipher_len = sizeof(*sec_key);
> +		sec_key->key_id = key->keyidx;
> +
> +		if (cipher == MT_CIPHER_BIP_CMAC_128) {

This was copied/pasted my wrong flow from mt7915 so I guess BIP_CMAC_128
cannot work. I've fixed this recently for mt7915. You may take a look at
https://patchwork.kernel.org/project/linux-wireless/patch/fc6abcd810a74bb4e8568b0f46bfc851fdcfd800.1607445161.git.ryder.lee@mediatek.com/

Or, fallback to sw version

> +extern const struct ieee80211_ops mt7921_ops;
> +extern struct pci_driver mt7921_pci_driver;
> +
> +u32 mt7921_reg_map(struct mt7921_dev *dev, u32 addr);
> +
> +int mt7921_register_device(struct mt7921_dev *dev);
> +void mt7921_unregister_device(struct mt7921_dev *dev);
> +int mt7921_eeprom_init(struct mt7921_dev *dev);
> +void mt7921_eeprom_parse_band_config(struct mt7921_phy *phy);
> +int mt7921_eeprom_get_target_power(struct mt7921_dev *dev,
> +				   struct ieee80211_channel *chan,
> +				   u8 chain_idx);
> +void mt7921_eeprom_init_sku(struct mt7921_dev *dev);
> +int mt7921_dma_init(struct mt7921_dev *dev);
> +void mt7921_dma_prefetch(struct mt7921_dev *dev);
> +void mt7921_dma_cleanup(struct mt7921_dev *dev);
> +int mt7921_mcu_init(struct mt7921_dev *dev);
> +int mt7921_mcu_add_bss_info(struct mt7921_phy *phy,
> +			    struct ieee80211_vif *vif, int enable);
> +int mt7921_mcu_sta_update_hdr_trans(struct mt7921_dev *dev,
> +				    struct ieee80211_vif *vif,
> +				    struct ieee80211_sta *sta);
> +int mt7921_mcu_add_key(struct mt7921_dev *dev, struct ieee80211_vif *vif,
> +		       struct mt7921_sta *msta, struct ieee80211_key_conf *key,
> +		       enum set_key_cmd cmd);
> +int mt7921_set_channel(struct mt7921_phy *phy);
> +int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
> +int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif);
> +int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
> +int mt7921_mcu_get_eeprom(struct mt7921_dev *dev, u32 offset);
> +int mt7921_mcu_set_mac(struct mt7921_dev *dev, int band, bool enable,
> +		       bool hdr_trans);
> +int mt7921_mcu_set_rts_thresh(struct mt7921_phy *phy, u32 val);
> +int mt7921_mcu_get_rx_rate(struct mt7921_phy *phy, struct ieee80211_vif *vif,
> +			   struct ieee80211_sta *sta, struct rate_info *rate);
Just a quick look. Seem some unused functions (used by mt7915) are
exported here. e.g. mt7921_mcu_get_rx_rate()

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
