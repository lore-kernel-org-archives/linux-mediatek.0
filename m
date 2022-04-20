Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74017C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 05:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9z9zM1vDYDfPAyQKdZ58cHaAz1ycq9XkPSiR92gQ08=; b=QNpLqLGJww06/j
	xL9XJPn1PWYjhVEXvcNjbMU+CDz7gIPve5S/FR9soSKdVRbuKhII128hMMce9TsnPqZIdAMUdR9Wb
	ffvJdRxNGi4fqz4QKLkU9tLdKhNW6C4cNVCtqGEVUJAagEc4DvwF0uxEcchP5nVIzlqeJ4XVjjUhq
	QKjquZqvQumbhBuOQ24DoMl9BdT6GQihP2NKk4O4nvGFJ9cyQYMVpPCDcj9065JQ43CuTDCeVBHx5
	MWPTZW1RgYNLn58Ci/K/KeGjEZaW/V63I1bZT4Np3m/kO1T1h9OgZpRGhc/zW93kmjjaYcB3ZxPQk
	NxWUlvEi8RR8aD/QPiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh2m0-007O9L-9E; Wed, 20 Apr 2022 05:21:04 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh2lw-007O80-Sz
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 05:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=YAZC9y8BBhsm62CdLgduktz90VpmUPVlcKmGJkLc64w=; b=lA91Tk/4hnua5jf4aEIAWRR1sV
 WIKl9OGKQoW/fH/6ev9Qqb5GdhIJfDlbokw0y2slAZs+912GNSY4xQo5i0jMUZ6yriao4VVjeVRcU
 EDZoEJ5JRE2U/IIspZKQSzr68VZANu47JkOMKteLVHw3KomerHBP9OqnnpEQphZkz4xo=;
Received: from p200300daa70ef200009e86881025829d.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:9e:8688:1025:829d] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nh2ll-00024n-85; Wed, 20 Apr 2022 07:20:49 +0200
Message-ID: <c7757409-9197-32d1-84f1-6c5588c92a73@nbd.name>
Date: Wed, 20 Apr 2022 07:20:48 +0200
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
References: <20220420040346.8378-1-bo.jiao@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: mt7915: report qos_ctl without ACK policy
In-Reply-To: <20220420040346.8378-1-bo.jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_222101_218050_F1544BAD 
X-CRM114-Status: GOOD (  16.03  )
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


On 20.04.22 06:03, Bo Jiao wrote:
> From: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> there is no need to report to the mac80211 layer the ACK policy which may
> cause rx out-of-order issue, because the hardware rmac module already handle it
> 
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> index b47aea6..5080280 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -675,6 +675,11 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
>   
>   		fc = cpu_to_le16(FIELD_GET(MT_RXD6_FRAME_CONTROL, v0));
>   		qos_ctl = FIELD_GET(MT_RXD8_QOS_CTL, v2);
> +		/*
> +		 * there is no need to report the ACK policy to the
> +		 * mac80211 layer, because hw has already processed it.
> +		 */
> +		qos_ctl &= ~IEEE80211_QOS_CTL_ACK_POLICY_MASK;
I don't understand this change at all. First of all, the qos_ctl field 
isn't really reported to the mac80211 layer, it's used in mt76 internally.
The rx reorder code uses it to detect no-ack policy in order to avoid 
reordering for it.
Since you're masking out the ack policy, the value will be 
IEEE80211_QOS_CTL_ACK_POLICY_NORMAL, which ends up forcibly enabling rx 
reordering, even when the policy indicates no-ack.
How does this help, and what part does the rmac module already handle?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
