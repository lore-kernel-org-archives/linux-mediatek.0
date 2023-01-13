Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E468C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 15:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy3H7/cm6qwaEzsvZ6Ibt0qAZNE5wC8oiAsqhQvvNa8=; b=SXo2PCeDgNhWCfHYzicT94N0Vx
	hcqvcnoijmhFy1sg4yoM53eXZCvMuC7lQzaPI0v73Shw8dnR2+dIVxv8PBDcpuGMpGKU63lhRp/Nf
	iIWY1kDo5sF9oxlMDvY+E6mR3XwPQXYxbXpBTApEid3jnfJSHGf38E9Vd2kIVdWKVU1FyZUmxnyXY
	J9OYmPRWu4ZriiVlW/aRNp7J4VBOZ4vkIewEoQV3N1WG0CDkVEfgCUemCNPKGonlUv8O96EWl3aIc
	uVW9+sdvOq2uwWnPlzpXPpzoLT7v8BXhCUxxfaRfAekwLUMnYz09DR6sFLOHNjs0ll0qh6/uZ4b5T
	eTkMSq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLcL-0035zi-52; Fri, 13 Jan 2023 15:05:17 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLcH-0035wX-Ds
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 15:05:16 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 13 Jan
 2023 18:04:52 +0300
Received: from localhost (10.0.253.157) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 13 Jan
 2023 18:04:52 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
	<linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alexey Khoroshilov" <khoroshilov@ispras.ru>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10 0/1] mt76: move mt76_init_tx_queue in common code
Date: Fri, 13 Jan 2023 07:04:45 -0800
Message-ID: <20230113150445.39286-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y8AD4jdyOpqrPT9a@kroah.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.157]
X-ClientProxiedBy: Ex16-01.fintech.ru (10.0.10.18) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_070513_505444_B76FE616 
X-CRM114-Status: UNSURE (   6.44  )
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

My apologies, I should've have explained my reasoning better.

1. My issue with 5.10 version of mt7615_init_tx_queues() in drivers/net/wireless/mediatek/mt76/mt7615/dma.c is that return value of final call to mt7615_init_tx_queue() is not taken into account
when returning result of mt7615_init_tx_queues(). So, if last mt7615_init_tx_queue() fails (due to memory issues, for instance), parent function will still erroneously return 0.

2. To correct the issue, I turned to Lorenzo's patch in b671da33d1c5973f90f098ff66a91953691df582 which solves my petit problem as well as rewrites a single mt76_init_tx_queue() function to be used
across all mt76 drivers.

3. I was torn between writing my own little patch to fix a single mistake or use an existing one that increases code readability and uniformity. I settled on latter.

4. As for this patch exclusivity to 5.10.y branch, I have an incentive to prioritise prioritize 5.10. Wasn't sure I should be the one to suggest the patch for other branches.

Thanks,

Nikita

