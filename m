Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E4DC982CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 03:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOi7CXctaFFUMBybDADhVggCvS8Wu5ozw9CR2j33Eu0=; b=iGXQq/NyyzhVDsyMMrGC69pgnP
	Yg3skahSZpuBF9rdYyxfrY8dzbQFdh1oyGfuTS2CG7rqQOd2B2tGETLB2YgIHhMG1QicvNgZ7eWNE
	xMqhNl06XHSVJq3Olyqkf0MMfi9oaMxyPLDefZi+3IuUcFWtT6okjCYD0MrzTYzJRHwLFbkiOElBU
	3hQTV5x0rrSS/oGiPoTl6IF4rrlA5tz8krG0AjK3GI372/gqtKdyi6wlDXfdU2kaKFaWwz+1Idx0v
	M2vYO9O/b/jIR64f3R6yOHAl4RUcD7sMdpRXe97/v9UcKNLjRm8s5F8T2vucEm/mZE0sMTzh4k03w
	4DqrXzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88YQ-0000000Gpzq-3cZt;
	Sun, 20 Sep 2026 03:49:26 +0000
Received: from out-96.mta0.migadu.com ([2001:41d0:1004:224b::60] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88YN-0000000Gpyc-3M2U
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 03:49:25 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8tIQ0S7jyLanjgsT+/AQf2DFwUVOBpd95+f9sHDtt4o=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789876159; v=1; x=1790480959;
 b=vmUDhVGj00l43S/QW961TuRHUxxHFxffVUUNNFnildCOsnfg9R7uUtQjrPKwTHpDOEFfbNQk
 4fOsLql6VlZpkVP2Q8MaCH+4FSKqHFrpeHB10V9Lfb9si+YCsAZKiEvdEDuE5CobNJJaOFLIjn/
 1TGe/OiBhEaMKiSWmvAdgHjDRO8LZ7WiPPxZhVYvw5hFg4DqxDc4rBnx0SFu0Gbg7IA3KO9MFGh
 GyUysxPEZsjYbE9cEo7s49/y2HGtvGiZcNq/DhJLFqTOhqtVWo9AgOMeb0ksBFxqOTFhLcVmEle
 JgSKMYXrDyMNZya0btqvaWHKPMh5OzPDVM+HkTz5SwIyQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e762d4409d191228;
	Sun, 20 Sep 2026 03:49:09 +0000
X-Mizu-Trace-ID: e762d4409d191228
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: Re: [RFC 1/2] wifi: mt76: disable NAPI before deleting in dma_cleanup
Date: Sat, 19 Sep 2026 20:49:07 -0700
Message-ID: <20260920034907.199687-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916204750.1439984-1-greearb@candelatech.com>
References: <20260916204750.1439984-1-greearb@candelatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_204924_306346_447091AE 
X-CRM114-Status: UNSURE (   6.75  )
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

On 9/16/26 13:47, Ben Greear wrote:
> +		napi_disable(&dev->napi[i]);
>  		netif_napi_del(&dev->napi[i]);

Ben,

The warning and the softirqd spin are both real, and your 2/2 looks like
the right place for them.

On 1/2 there is a snag. mt7921e and mt7925e already stop RX themselves,
and they do it early:

	mt76_unregister_device()
	napi_disable() on each rx queue
	tx_token_put()
	mt792x_dma_cleanup()

It has to be early. A poll still in flight can come back with a transmit
status and take an entry out of the table tx_token_put() is tearing
down. By the time the shared cleanup runs RX is already stopped, so a
second disable there just sits:

	task in D state, refcount -1
	napi_disable_locked <- mt76_dma_cleanup <- mt7925_pci_remove

That was on MT7927. The USB parts tear down a different way and never
arrive, which is probably why this is easy to miss.

Would putting the disable next to the IRQ and tasklet work in your 2/2
cover mt7996? That keeps it where the driver already knows whether it
has stopped RX.

Devin

