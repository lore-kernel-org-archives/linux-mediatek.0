Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C66AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:36:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F5620708
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:36:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nRUngb8t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.b="a5I3j0I8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F5620708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EUCPqlXwzGhn1iN0/9P27rECSDw0J/zrm/WV8kZomjU=; b=nRUngb8tu+DV/4HN5EKwPB+6M
	4R0kIopYhKkRCdN5mQUMTigONYBzNqkr+D/2E+TtP8BxgG6N7OmWhgfFeP6dWYreztX4nGOFVr28X
	juFvdG8AKTbAqtenjAgp+MmhmcafheGjXWmRQFYsC0tBElBxImsw3eS7RTEtFsJy9Y1cAFe8/1Nss
	qhV9uxu6BvTGhQCvbNE3A2z97y0/KcPkZZiNW6IFY4gFm1RXtwhgT9btUKADIMDr4qWtjPYP4+XuV
	k5KSBf9DhI/703I75L6neEuASK6y7YbyBmUzhbOMNTSpiaQ5jurNA14U5OipRyDcl/w3RxfUBABYU
	lxtJZ3nFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRocx-0000cT-39; Mon, 12 Oct 2020 03:35:59 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRocu-0000bv-Ts
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 03:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yNJUJW5y6kE3RQZKIJlvBAwYPb5xKZVDlMJ3bAbVlyw=; b=a5I3j0I8kH5d3o9RzZFVPc4V8W
 K05HutY/BKARsiX1/idASE9nIIOy24OBx3dsTRQbrxoiDffQsio9bdzP9ltLpYM9Dia+muCSqMTRa
 vJJp0ifxYlh3gfqTE0OPtpC5uLoBp7kxxBOGLlnGaa4eSWswUngC4iuYTBQAZfZxXaWc=;
Received: from p54ae9462.dip0.t-ipconnect.de ([84.174.148.98] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kRocs-0001eW-5f; Mon, 12 Oct 2020 05:35:54 +0200
Subject: Re: [PATCH v2 08/10] mt76: mt7915: implement testmode rx support
To: Shayne Chen <shayne.chen@mediatek.com>
References: <20201012032538.21314-1-shayne.chen@mediatek.com>
 <20201012032538.21314-8-shayne.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <4333ebf5-3d19-3165-3275-6e6fac09abfa@nbd.name>
Date: Mon, 12 Oct 2020 05:35:53 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201012032538.21314-8-shayne.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_233557_177255_121113E7 
X-CRM114-Status: GOOD (  20.47  )
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
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2020-10-12 05:25, Shayne Chen wrote:
> Support testmode rx and display rx statistic by parsing RXV packet
> type, which is currently only enabled in testmode.
> 
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
> v2: change last_snr to u8
> 
>  .../net/wireless/mediatek/mt76/mt7915/dma.c   |  3 +
>  .../net/wireless/mediatek/mt76/mt7915/mac.c   | 37 +++++++
>  .../net/wireless/mediatek/mt76/mt7915/mac.h   |  5 +
>  .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  7 ++
>  .../wireless/mediatek/mt76/mt7915/testmode.c  | 97 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7915/testmode.h  | 30 ++++++
>  7 files changed, 180 insertions(+)
> 
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> @@ -169,12 +209,69 @@ mt7915_tm_set_state(struct mt76_dev *mdev, enum mt76_testmode_state state)
>  		mt7915_tm_set_tx_frames(dev, false);
>  	else if (state == MT76_TM_STATE_TX_FRAMES)
>  		mt7915_tm_set_tx_frames(dev, true);
> +	else if (prev_state == MT76_TM_STATE_RX_FRAMES)
> +		mt7915_tm_set_rx_frames(dev, false);
> +	else if (state == MT76_TM_STATE_RX_FRAMES)
> +		mt7915_tm_set_rx_frames(dev, true);
>  	else if (prev_state == MT76_TM_STATE_OFF || state == MT76_TM_STATE_OFF)
>  		mt7915_tm_init(dev);
>  
>  	return 0;
>  }
>  
> +static int
> +mt7915_tm_dump_stats(struct mt76_dev *mdev, struct sk_buff *msg)
> +{
> +	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
> +	void *rx, *rssi;
> +	int i;
> +
> +	rx = nla_nest_start(msg, MT76_TM_STATS_ATTR_LAST_RX);
> +	if (!rx)
> +		return -ENOMEM;
> +
> +	if (nla_put_s32(msg, MT76_TM_RX_ATTR_FREQ_OFFSET, dev->test.last_freq_offset))
> +		return -ENOMEM;
> +
> +	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_RCPI);
> +	if (!rssi)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->test.last_rcpi); i++)
> +		if (nla_put_u8(msg, i, dev->test.last_rcpi[i]))
> +			return -ENOMEM;
> +
> +	nla_nest_end(msg, rssi);
> +
> +	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_IB_RSSI);
> +	if (!rssi)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->test.last_ib_rssi); i++)
> +		if (nla_put_s8(msg, i, dev->test.last_ib_rssi[i]))
> +			return -ENOMEM;
> +
> +	nla_nest_end(msg, rssi);
> +
> +	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_WB_RSSI);
> +	if (!rssi)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->test.last_wb_rssi); i++)
> +		if (nla_put_s8(msg, i, dev->test.last_wb_rssi[i]))
> +			return -ENOMEM;
> +
> +	nla_nest_end(msg, rssi);
> +
> +	if (nla_put_s32(msg, MT76_TM_RX_ATTR_SNR, dev->test.last_snr))
> +		return -ENOMEM;
You updated the comment in the header file, but not this part which
actually generates the attribute.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
