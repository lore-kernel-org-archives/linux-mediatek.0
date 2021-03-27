Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20450C433C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 19:28:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D9761954
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 19:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D9761954
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KSyP5AYHsQMfC1BR9n77kJIoKHDucKyJcsrwHH/TzMA=; b=oo/CBlwNJV4jkfiuDeLBqUttn
	48QPt4aLs9Vt55nJIbC/1XpcSEcF0/x7rvsxWJw4prPFmCa7EhL89rrHaDAALkbx+rF7ivqjeetu8
	wLnytw+xG2kyBclzg/VggXh+unM0h8eseJu9f2wJ6OBYL/kybfmgdHKB1MazTH7JntHERdSMNO8lt
	Pm7upMENheOeiqw4NZfEhh+JIZO+xBh3z8x/oyxyQoIwt3t47EL8bg8hueymqpnKJUrpMR7++btF8
	SfjkIhsivIRHOS78hkLwvBe8nchsbYv/ArjiKIb/QQSQfCikr+KsyZJloBXgsGxh/RNOwV09KX/WE
	3t9FQODnQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQEbl-005SB5-SR; Sat, 27 Mar 2021 19:28:29 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQEbi-005SAd-Dh
 for linux-mediatek@lists.infradead.org; Sat, 27 Mar 2021 19:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYnf1IKlMCYCPygSlBm3j96oJ03ojNQFUX944rUctNw=; b=IW12M+Cv33RD8bzqVwkwQIDqwz
 PvPnwJ7Si+XyPxRZs5cEZpgA2iscMX3oYHhz2Axv5wu8onXGiN+KiXIfhzlWeQVGBvJnJTCOdILzV
 LOCpKHal6HGiPjq+uZNIK4DqJIFoMJvy2FdZjNtfIOBa1zZyxNRYWOk3GroNY0+QdIUE=;
Received: from p4ff13c8d.dip0.t-ipconnect.de ([79.241.60.141] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lQEbd-0003V0-7C; Sat, 27 Mar 2021 20:28:21 +0100
To: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <ae8caa3a01d527e464b09b4932d6cca14b1d49a2.1616831454.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: report Rx timestamp
Message-ID: <41727e36-e165-5b8e-4d76-be96f61bc83e@nbd.name>
Date: Sat, 27 Mar 2021 20:28:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ae8caa3a01d527e464b09b4932d6cca14b1d49a2.1616831454.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_192826_585696_B88004C2 
X-CRM114-Status: GOOD (  14.50  )
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


On 2021-03-27 08:55, Ryder Lee wrote:
> Frame reception timestamp (low 32-bits) that indicates the value of the
> local TSF timer value at the time the first bit of the MAC header in the
> received frame (PPDU unit) arriving at the MAC.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/agg-rx.c   |  2 +-
>  drivers/net/wireless/mediatek/mt76/mac80211.c |  1 +
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  3 +-
>  .../net/wireless/mediatek/mt76/mt7603/mac.c   | 31 ++++++++++--------
>  .../wireless/mediatek/mt76/mt7603/mt7603.h    |  2 +-
>  .../net/wireless/mediatek/mt76/mt7615/mac.c   | 32 ++++++++++---------
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 +-
>  .../net/wireless/mediatek/mt76/mt7915/mac.c   | 29 +++++++++--------
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +-
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 29 +++++++++--------
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
>  11 files changed, 74 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> index 144e8a8910ba..a37b8db979c6 100644
> --- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
> +++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> @@ -77,7 +77,7 @@ mt76_rx_aggr_check_release(struct mt76_rx_tid *tid, struct sk_buff_head *frames)
>  		nframes--;
>  		status = (struct mt76_rx_status *)skb->cb;
>  		if (!time_after(jiffies,
> -				status->reorder_time +
> +				(unsigned long)status->reorder_time +
>  				mt76_aggr_tid_to_timeo(tid->num)))
>  			continue;
This doesn't work, you need to replace the time_after with a function
that takes u32 wraparound into account.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
