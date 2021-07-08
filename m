Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A848CC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 06:20:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554A261C69
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 06:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 554A261C69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4edOposuVUeERTnfhVNPL0ju7CdtRKCv6bf09cgIHT4=; b=sIRYUaIplcj+CO
	pq/wANvjZfVeXBJl6I+tpxcF7o5O4QrL0A7eghCrQ7dEK5yeX4/duz+/zqwAaagDHztq9cNUmWfv1
	VSq0VzzFEjTIKPt5GzPb2YRabBG6fxOX3dc73b20LIOgiluGRtQG3BAP9944BkMQUAbpyeMqu9IbE
	Q7GyRiQWCGx1C89Dq3fI8VdoQXNQbVPayiHJstuQBHukq8gfT8S92p4E0N7l+/5TnqEIKGSGxdzzV
	8hjlKdeMA9GiXSrTUBTUEkDKYc0CzviTG+cJkJuLL+JaNrgge+IkF1RyIa0UX96DP6vpzkKqm4S7W
	Zhz+iIoIjQeXL9z1zamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1NOx-00G8G0-78; Thu, 08 Jul 2021 06:20:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1NOr-00G8Fc-8e
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 06:20:44 +0000
X-UUID: 084fe66c68c843d6a6641c50536cd519-20210707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RDpr6ntUglGbkmdoj5Vw+AU6YP2+5ZVSFjZgAehYXhU=; 
 b=ruYdacKVE2S7RePGOtuVS+QnGu9stWKXV1O3AM+3HhpXF59oQU5E7Gp0VuYo632clb7nf61w7ZQPdF6Nli89dK2nAXhadrdbuezLBHX01iSZgfY0D6Uv7Ht0p0JbQqMqUVpmTymZCXeI+JWBbqTILiec1IITSdPiOD4BFSvts1s=;
X-UUID: 084fe66c68c843d6a6641c50536cd519-20210707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 173494694; Wed, 07 Jul 2021 23:20:38 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 23:15:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 14:15:03 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Jul 2021 14:15:03 +0800
Message-ID: <60de68ca4e48d1388a90f0ec59f477a93f01ab3d.camel@mediatek.com>
Subject: Re: [PATCH 1/2] mt76: mt7921: fix mgmt frame using unexpected bitrate
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>, <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>,
 <Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 8 Jul 2021 14:15:03 +0800
In-Reply-To: <1625718546-14969-1-git-send-email-sean.wang@mediatek.com>
References: <1625718546-14969-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_232042_154544_592BB681 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu, 2021-07-08 at 12:29 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Fix the current driver mgmt frame is not respecting the basic rates
> field
> provided by the AP and then unconditionally is using the lowest (1 or
> 6
> Mbps) rate.
> 
> For example, if the AP only supported basic rate {24, 36, 48, 54}
> Mbps,
> mt7921 cannot send mgmt frame with the rate not in the group. So,
> instead, we pick up the lowest basic rate the AP can support to send.
> 
> The patch also fixed up the hw_value in ieee80211_rate for MT7921
> hardware.
> 
> Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/init.c  | 19 +++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 21 +++++++++++++++
> ----
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    | 14 +++++++++++++
>  3 files changed, 48 insertions(+), 6 deletions(-)
> 
> 
> +	int i, offset = 0;
> +
> +	if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
> +		offset = 4;
> +
> +	i = ffs(vif->bss_conf.basic_rates) - 1;
> +	rate = &mt7921_rates[offset + i];
> +
> +	return rate->hw_value;
> +}
> +
>  void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
>  			   struct sk_buff *skb, struct mt76_wcid *wcid,
>  			   struct ieee80211_key_conf *key, bool beacon)
> @@ -815,10 +831,7 @@ void mt7921_mac_write_txwi(struct mt7921_dev
> *dev, __le32 *txwi,
>  		/* hardware won't add HTC for mgmt/ctrl frame */
>  		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
>  
> -		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
> -			rate = MT7921_5G_RATE_DEFAULT;
> -		else
> -			rate = MT7921_2G_RATE_DEFAULT;
> +		rate = mt7921_default_basic_rates(dev, vif);

....

> 			
> \
> +	.bitrate = _rate,					\
> +	.flags = IEEE80211_RATE_SHORT_PREAMBLE,			\
> +	.hw_value = (MT_PHY_TYPE_CCK << 6) | (_idx),		\
> +	.hw_value_short = (MT_PHY_TYPE_CCK << 6) | (4 + _idx),	\
> +}
> +
> +#define MT7921_OFDM_RATE(_idx, _rate) {				
> \
> +	.bitrate = _rate,					\
> +	.hw_value = (MT_PHY_TYPE_OFDM << 6) | (_idx),		\
> +	.hw_value_short = (MT_PHY_TYPE_OFDM << 6) | (_idx),	\
> +}
> +

Nice catching. I shifted the wrong offset while bringing up mt7915, but
I used the correct offset in TxD resulting in this mt7921 issue. Can
you do me a favor to fix the offset of mt7915 as well?

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
