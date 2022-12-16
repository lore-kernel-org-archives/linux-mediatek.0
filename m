Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90722C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 06:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rUerXbOEmt5V5gzJjUmVKxko4IOh2f7EbUvIJ/irUY=; b=LRJkKjNcduAUU+FMigt598Bpqq
	xJvyIkBFWCKa7zJ0mPJ4MzXFsi7NitjWEnBWxnk9gcu/0Ss9FyMDRoc85sD/UReKgNMUA5fCsKstV
	ER4zo3MP3uaiet7iuDtBjJrC/M+AIXttFBxhMNiuQ0fd7yB2aQiqeftGliDWNuPeVcm44gD8120Q3
	Itjuj7BI/m6MEt8h8Z2KR2bUkKSl7Uzhp2OJxSqrQgnkzpcznIBXOtwVAp8xUdW01nIupjZtdh0um
	9CAURprKqZ0HA0gjRZ4rtQJfyWG23YbHzYy0OyynyYlIiOP9g+oCcRdjS/j4w2r7RuRPOJmxU8oA2
	rbfQyiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p647B-00D8av-2V; Fri, 16 Dec 2022 06:22:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p646z-00D8WX-IJ; Fri, 16 Dec 2022 06:22:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B86761FFE;
	Fri, 16 Dec 2022 06:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B616C433F0;
	Fri, 16 Dec 2022 06:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671171743;
	bh=6AJD0sWhzcRVUgHGLoWzQ/D9RJTp+ed+Zwakh4Xu2Wc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G++PnC4NHAL5pOgQgytc/Xn9cxA0zIeeBlwAzcca9rZ5Gw+sMjU23PmHI9svj8HzM
	 +feTNrGfK2eP9NDFuhYRs8tTPiiKbc9puyGKO+VXz2SecKcEGGRd1aREz0CuSDlQBt
	 vM5c/08mkEpLq/W2cNQSDygYwo62nkqKhdMWRxqk/mmKyvVGugkTW/x/8q8Y8kyCf4
	 nlD/DMfVJUiMg9y78khnQzYxNdt8vkp7+AMCFpXGZaEvxas2CO37eHyqT3X/lBoURq
	 3/y0m6SEHawNm0U8oCYZJSAeThYh2q0VZ/xaIJ2LulTOoSQdckVRqm+/oP6ufbWpuZ
	 gtnopTFomImvA==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee <ryder.lee@mediatek.com>,  Arnd Bergmann <arnd@arndb.de>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Matthias Brugger <matthias.bgg@gmail.com>,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7996: select CONFIG_RELAY
References: <20221215163133.4152299-1-arnd@kernel.org>
Date: Fri, 16 Dec 2022 08:22:18 +0200
In-Reply-To: <20221215163133.4152299-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Thu, 15 Dec 2022 17:31:10 +0100")
Message-ID: <87iliblvfp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_222225_679274_3CBCF58B 
X-CRM114-Status: GOOD (  11.71  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Without CONFIG_RELAY, the driver fails to link:
>
> ERROR: modpost: "relay_flush" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_switch_subbuf" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_open" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_reset" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_file_operations" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
>
> The same change was done in mt7915 for the corresponding copy of the code.
>
> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
> See-also: 988845c9361a ("mt76: mt7915: add support for passing chip/firmware debug data to user space")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Felix, should I take this to wireless tree?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

