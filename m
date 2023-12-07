Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C47C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNdLN+nlANvsNdrnLFJnVlG43QaUuXoTuqo8IUjpiZ4=; b=MRAPoMC4aksu7gSgCyfNu0TX3m
	o/aC+oSpiAa1x1hvt3JuD7F5Ag9V5epvR6hxHk4QGgVsm5r6QTm/pjdjYeEVAld+KX+arwGi6x6kf
	G/f0lML3WIWSIJUQvnllvkYRBLio9COopaecmFwY3OFpBtOSyFtg1tNZZdNPji+oLdI96UClsDYWp
	IDnxJ9Px8lFQTV/iABGAzI8EVhUcmXYGzRgWBYKOw1kG2WueJMII0JwPPbBVig+u016G7I8Y8SkKy
	IAF81Jbe7CtUIoPFfK6Usj1SuGIUirQwXdTHMmMCVFH1TYuGmi+e+4hMNJOGF4ruXyn1GA8NafrgZ
	xynERyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEbU-00CvUw-06;
	Thu, 07 Dec 2023 13:39:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEbO-00CvTP-2P
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 13:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7178620D0;
	Thu,  7 Dec 2023 13:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C2CC433C8;
	Thu,  7 Dec 2023 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701956381;
	bh=s7jYxlzNX2yYW5vVt8RohmUajx++qo4dRr8Rg4mal/g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GgGQ8NZ4PcR3ka5ZOwKjavJqVLskdjudvyceGDwnmWAU+dd400scPzPGHvhUk+23Y
	 qh9mYm7SeaRJR+h/DKJzqO33mpZqo8hOdUPUmK0go56vz9LeALrMswd3LHj6blYGMt
	 WgfRHhbfFCjQ2QeaJn/ek15m0H7MZamVExqiFA6QbHR4/Y2VUertAbB9ayggAuLZXE
	 gOSUQl21+z8EMyxbHbeJgg6LSUKAvl/TSvHPDkMYjGMdeDyOWrYhkjb3TNEWHzpAbI
	 l35u7hZ8CwBbk19Gb10VMG4G5BBZm+kvBHwqjbaAHQRDJbkwooJNqIwkTFLzELI2k4
	 nwR88E5ncWFCA==
From: Kalle Valo <kvalo@kernel.org>
To: Allen Ye <allen.ye@mediatek.com>
Cc: <linux-wireless@vger.kernel.org>,  Johannes Berg
 <johannes.berg@intel.com>,  Felix Fietkau <nbd@nbd.name>,  Lorenzo
 Bianconi <lorenzo.bianconi@redhat.com>,  Evelyn Tsai
 <evelyn.tsai@mediatek.com>,  "Money . Wang" <money.wang@mediatek.com>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mac80211: Update bssid indicator with real BSS
 numbers
References: <20231206024911.7668-1-allen.ye@mediatek.com>
Date: Thu, 07 Dec 2023 15:39:38 +0200
In-Reply-To: <20231206024911.7668-1-allen.ye@mediatek.com> (Allen Ye's message
	of "Wed, 6 Dec 2023 10:49:11 +0800")
Message-ID: <87cyvi5dyd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_053942_827635_2B76CED6 
X-CRM114-Status: UNSURE (   7.25  )
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

Allen Ye <allen.ye@mediatek.com> writes:

> From: "Allen.Ye" <allen.ye@mediatek.com>
>
> The cnt member in mbssid is the count of total number of MBSSID elements
> instead of BSSID. Therefore, we fix this by reading the MaxBSSID Indicator
> field directly.
>
> Signed-off-by: Evelyn.Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Money.Wang <money.wang@mediatek.com>
> Signed-off-by: Allen.Ye <allen.ye@mediatek.com>

All the names, both in From and s-o-b, use '.' instead of space in names.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

