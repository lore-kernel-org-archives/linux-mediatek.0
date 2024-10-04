Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496B1CF34D7
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 00:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEGQ4q0sOHf6fH//tRJ7zrlO1NuAAAduCg0MWkR5zYk=; b=WUpLH87iSS+GWMQTGfgqOueXXm
	uTqJLxH/hivtfXUdMKa6L3Yn5TaUr+22GZ5obYUk8AU4qgF0SnrYLlaWIsMlPy30AEllN43Y3pFJ6
	uHz74qudOjv8kd0bVO8rFvwbvOXCbkpizH7BwYxqlEdO1xzX+fIcVYQGChHTCX/Wlvt9KQOk8KYM4
	QLyzITj6e5KdqAWoFDUabDrLllB5I8ubgP2I7jv4YgtTUnWH0qb1SEp/dSd3WsfhNOgzhTwJN+h6E
	21ZSpFgYH+4PnQgvm+kEX5H2J4eE/ojLjdapRNZ86bHFhPnhz0vy1iTGVVV+HH+zCa1DZAMnIMscN
	VAe8Q+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swW8P-0000000AjKg-0oHB;
	Fri, 04 Oct 2024 00:25:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swW78-0000000AjGv-38D7;
	Fri, 04 Oct 2024 00:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC537A4431E;
	Fri,  4 Oct 2024 00:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F4DC4CEC5;
	Fri,  4 Oct 2024 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728001448;
	bh=VV/M8B6D4ybuFpByBidICXy+GE+2iyQZz9Zy1n63kEE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XRDc4xiW+6w0E3UJqID2Xtw2o0K3Wm4mI+L5vxrMetgFOUdx02Ihj1toI36TShH3h
	 P5Bl0eNE/iJjXcr+R6xqWPmM4ilQkGKHqc9QClU89MBRLbfwi7RkZAPSdqpKOPPiha
	 8bMuDCeec3RgUNl8Wy5Y1+A6THRMUJsF+5/VCO+bImWthJNdJ9/+0NtZ2aMttxYtSN
	 stzwGDvKtQarZOKlmqaFwrzP0y5PGGr7qxggoJW5rIBeyQHCAWjahz4WCucoFU9c3b
	 TTI0qjlwXg2TTHD18+MgXNgAdTilMHtGOBlmJJ1vnQOgw9QIv+ZD+leYfQ1MJguF/b
	 LNeFV3KbmRbcg==
Date: Thu, 3 Oct 2024 17:24:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next] net: airoha: Implement BQL support
Message-ID: <20241003172407.1bf35bf1@kernel.org>
In-Reply-To: <20240930-en7581-bql-v1-1-064cdd570068@kernel.org>
References: <20240930-en7581-bql-v1-1-064cdd570068@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_172410_883297_85EF5F9A 
X-CRM114-Status: UNSURE (   8.98  )
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

On Mon, 30 Sep 2024 14:58:35 +0200 Lorenzo Bianconi wrote:
> Introduce BQL support in the airoha_eth driver to avoid queuing to much
> packets into the device hw queues and keep the latency small.

This patch got set to Superseded in patchwork, somehow, but I don't see
a newer version. I think you're missing resetting the BQL state in
airoha_qdma_cleanup_tx_queue() ?
-- 
pw-bot: cr

