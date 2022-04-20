Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F43EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpKvWgf9jp+4OnWRlq8Cbf7xGTYOIHWVazuxUOu6pz0=; b=nyrOod+AQcvy4V
	Q3oxUHSkq2+OgvLa0h1Jccc9oSsvdCWfzYjVUE0vFilWRdtr3N54JvLkXvgdGWbREauA5tst1ZXKY
	1z0g59csD9DD5Q2WdrdbtWL1Gok6uygIJpR3gwXMkkiueN2CRkKHpNl/nXEX9napgQ8dvW0T4cd9a
	4LJgTl4Ps+GIHwp64GTUAEMSb/SIkqIS0t3actkdHOLWpTfvcSQvjLFEB7CMrVM7PMtLM5moShv+f
	P7uVexl2Mtw188MyOqzgJAy/V3K0GIKOmFUetrJZiddz25D0aw6qjRvfSpPEoIuqiMAeGVK1g9IUB
	WaQWB2dp3BIOdQeJxxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7lQ-008f4y-Os; Wed, 20 Apr 2022 10:40:48 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7lN-008f3P-Iv
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 10:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=xrdUu+yKR208snaeMzpnrs+5q8YWPSlam6DSqshiSeE=; b=PUVXTLo/6+1yhdJtiTu2sJ1hpg
 NdlydQPxXhonjWFfR+xs2fIETB7bHCvCUIDTLbW/bpkI/soiKk1djeaiW4gTGVTvbHqlUJF+62Lbj
 rcUL5TnoxMNY+4jr5YWXcr9gwL8jdLDFKpirp36XdWVb7VArC7cWFVZK5qOgj2xB7fzs=;
Received: from p200300daa70ef200009e86881025829d.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:9e:8688:1025:829d] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nh7lE-0004wA-4s; Wed, 20 Apr 2022 12:40:36 +0200
Message-ID: <ad0756ac-ebaa-b5b3-6680-539e6986a11a@nbd.name>
Date: Wed, 20 Apr 2022 12:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Content-Language: en-US
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20220420031451.6770-1-bo.jiao@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: mt7915: fix msta->wcid use-after-free in
 mt76_tx_status_check()
In-Reply-To: <20220420031451.6770-1-bo.jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_034045_907252_76079CD9 
X-CRM114-Status: GOOD (  18.81  )
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

On 20.04.22 05:14, Bo Jiao wrote:
> From: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> fix msta->wcid use-after-free in mt76_tx_status_check when the sta
> has been removed.
> 
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7915/main.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> index 800f720..160d80e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -701,6 +701,11 @@ void mt7915_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
>   	if (!list_empty(&msta->rc_list))
>   		list_del_init(&msta->rc_list);
>   	spin_unlock_bh(&dev->sta_poll_lock);
> +
> +	spin_lock_bh(&mdev->status_lock);
> +	if (!list_empty(&msta->wcid.list))
> +		list_del_init(&msta->wcid.list);
> +	spin_unlock_bh(&mdev->status_lock);

I'm trying to figure out where this use-after-free bug is coming from,
and I can't seem to find the cause of it.

Some context:
mt7915_mac_sta_remove is called by __mt76_sta_remove, which also calls
mt76_packet_id_flush afterwards.
mt76_packet_id_flush calls mt76_tx_status_skb_get in a way that makes it
iterate over all pending tx status packets and clearing them from the
idr.
If the idr is empty afterwards, it calls list_del_init(&wcid->list).
The only way I can see your patch making a difference would be if
clearing the idr fails. That could happen if for some unknown reason,
cb->pktid is out of sync with the id that was used to add the packet to
the idr.

Can you please try the patch below and see if it avoids use-after-free
issues and if it also shows the warning I added?

Thanks,

- Felix


---
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -181,7 +181,8 @@ mt76_tx_status_skb_get(struct mt76_dev *dev, struct mt76_wcid *wcid, int pktid,
  		/* It has been too long since DMA_DONE, time out this packet
  		 * and stop waiting for TXS callback.
  		 */
-		idr_remove(&wcid->pktid, cb->pktid);
+		WARN(id != cb->pktid, "Packet id %d does not match idr id %d\n", cb->pktid, id);
+		idr_remove(&wcid->pktid, id);
  		__mt76_tx_status_skb_done(dev, skb, MT_TX_CB_TXS_FAILED |
  						    MT_TX_CB_TXS_DONE, list);
  	}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
