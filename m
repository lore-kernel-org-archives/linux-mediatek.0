Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C651CC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 07:35:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45AF72222B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 07:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JnQ0tiT3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="fngvWTf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45AF72222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lnZKVzHNHkMQ75gAGVUW4OmqU1Kz51rmoskntJwaJm4=; b=JnQ0tiT3d0e2aZsvNXoP0h8mA
	N+Ehk/l5k+8lpgqpO057H61I/oTuzSOAaapaBIqpX7TQRdknJs4s/V1avZgDjKIsmyEOJ/uYunKfK
	mev3pTY269vSHBcq2rQiI7FXG0I9+uh8SpiUrA9NPKkY4a+H3I0amlNkTm/qtjmmkMkIqevR+CBEf
	zSaMlt1XMNjxaYAHWbfPlunXk7U/uoUdDFA+87G/hgZnpk8ZExvFl18LAAFCDq5+O8a8/eK231T1f
	E+dy/MSSCRfQyOIzG4NusYbmdfoYuabDwMEatjYULe6JAvjWW2eZgA9aw5t/D5xzYc6b2Vn4mG+Vt
	J4Sf8UKEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZqqs-0001AM-6n; Tue, 03 Nov 2020 07:35:34 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZqqp-00019b-8i; Tue, 03 Nov 2020 07:35:32 +0000
Received: from [192.168.0.114] (unknown [49.207.216.192])
 by linux.microsoft.com (Postfix) with ESMTPSA id 681AC20B4905;
 Mon,  2 Nov 2020 23:35:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 681AC20B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1604388928;
 bh=ih9ZiV/+m1a4u66NjJRUECF/WudDRLXa9Ud3sqbo1wU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fngvWTf5lX/PQrgJi0VtxZ5dfaIhHlQcoxLhWUSksXKq3J0YjeJMvR0wRt1bNwEbS
 KFSK/hRuuLQ6QGMj0gBvFxSMmNtaXMxfqjv+3wBbAwqC7EQkEkgdbRfhvCBhDoZRy8
 C/8Iwe6LSz3hZwNFTl+S6ezNQRgzo7ftmvUxBP28=
Subject: Re: [PATCH v2 0/3] wireless: convert tasklets to use new
To: Allen Pais <allen.lkml@gmail.com>, kvalo@codeaurora.org
References: <20201007103309.363737-1-allen.lkml@gmail.com>
From: Allen Pais <apais@linux.microsoft.com>
Message-ID: <c3d71677-a428-f215-2ba8-4dd277a69fb6@linux.microsoft.com>
Date: Tue, 3 Nov 2020 13:05:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007103309.363737-1-allen.lkml@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_023531_436282_C199A06D 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org, davem@davemloft.net,
 nbd@nbd.name
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



> 
> This series converts the remaining drivers to use new
> tasklet_setup() API.
> 
> The patches are based on wireless-drivers-next (c2568c8c9e63)

  Is this series queue? I haven't seen any email. This is the last
series as part of the tasklet conversion effort.

Thanks.

> 
> v2:
>    Split mt76 and mt7601u
> 
> Allen Pais (3):
>    wireless: mt76: convert tasklets to use new tasklet_setup() API
>    wireless: mt7601u: convert tasklets to use new tasklet_setup() API
>    ath11k: convert tasklets to use new tasklet_setup() API
> 
>   drivers/net/wireless/ath/ath11k/pci.c              |  7 +++----
>   drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
>   drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
>   drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
>   drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
>   drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
>   drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |  7 +++----
>   drivers/net/wireless/mediatek/mt76/usb.c           |  6 +++---
>   drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------
>   9 files changed, 27 insertions(+), 30 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
