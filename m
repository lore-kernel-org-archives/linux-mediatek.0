Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5502EC5478C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3pYtXHlcf+Bg2jiMbnGCra7ypaXgvmXgMcKoNI6C1s=; b=oySHiOEB9mdyXYW6PQp45HQCOq
	l3Nd0aFQnjcGb8mWy0DIfypMZhW7gRCuOUhNH/GcWuyZV+PTfsqCDm98lSzrOmX2BGvzL2CxY0y4X
	PIlbMO4CCH1jnsHwxnCbTAmPFlDtZOYcNkd8YX+IKxzohunQgqOKTzyA2N13u7vWz7j9ho4MpZDvR
	W6/6/Oxefdtctx1lL8xLYkFqPMM/wV6QNLwPnIFmth8/0bGeqMOce3/LYTNyCLkhNDPoldheVz76N
	AgPRBfiACkgcyA39DQptGoxliY+g/AXA3+337dPMB2U6p8Ar2B7kN2Ap/W+LFod3sDk3vZ1NV+zgZ
	mxUFtoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bX-00000008d7e-2jDq;
	Mon, 04 Mar 2024 10:31:31 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Nn-00000008Z1L-08sw;
	Mon, 04 Mar 2024 10:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D3pYtXHlcf+Bg2jiMbnGCra7ypaXgvmXgMcKoNI6C1s=; b=etvtPoxiLTdO5hbaDkVYjU0dX3
	Ts8J5eJviBJEklpAwcIpUwDCFFnNc5nSkm9yTu1VsLLIFzTb4JVfwxcE3ejHVkQGXBdcictioj1re
	FWO4w10K4+EWqlImnMyAKMjNEY3+3M88BQzkqS8PPYr0lzQJY+PO1u9nq389TPEmwIwhsco58kHMo
	rNMSJHd5afNs5iZ0kQmpCQ0Dd8Sso+exD7L6W2UZxVVcwZ3nxd/6Zz/M55JSPJCFJ4UKkkNKWWxRQ
	b/YcLeXgrWrXRPVqjMl9csynYqvfo+cOxvypM2TkQjQL55lHgzqs/HU2zXP9VvyIi0z+D17R5diGI
	/DEwRk2w==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Nk-00000004ndo-0Riw;
	Mon, 04 Mar 2024 10:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547432;
	bh=ltcyOw+TgqviIKZ8PQUG8CPcAe7I74uGtSNAStThC1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fb11IaKccd0sn7CyPKu2BXQKbFW2upyD39noI5TM03TJBBiM5ye+aWnCUUD2VbkIq
	 2TnHjnBrpEVsp4dAD81Wujg/2j3bYBUPN+PI1ui+pqh3XqbQ9AS1HyWi5D+Tm0y9Tl
	 NXav/eWcHeq9xhcHxEkGYzaSJGHAt9AJ4EHlVVVOCSkNGkqR4NwznUGaNk+vUJaiDE
	 IvaQKjCwcb0EBo5VHb7oK2HPqb7UUoSsCo+BnT+j04XQmITA8I8pylgLfe7w4TJCjv
	 GVclBtl4+0/QhrYVEDW+AR1QYgVcXe+cPtL2ufpRyVs+46CSb+DPwSEyEoDusH73BK
	 xCWmU2AHLwU7Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D33AE3781FE9;
	Mon,  4 Mar 2024 10:17:11 +0000 (UTC)
Message-ID: <fcb78476-d1e4-4354-99a6-0bb92a2ec3b6@collabora.com>
Date: Mon, 4 Mar 2024 11:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: connac: check for null before dereferencing
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240301144406.2808307-1-usama.anjum@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301144406.2808307-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101716_255489_6F84A284 
X-CRM114-Status: UNSURE (   6.74  )
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

Il 01/03/24 15:44, Muhammad Usama Anjum ha scritto:
> The wcid can be NULL. It should be checked for validity before
> dereferencing it to avoid crash.
> 
> Fixes: 098428c400ff ("wifi: mt76: connac: set correct muar_idx for mt799x chipsets")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



