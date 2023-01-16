Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00509C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqSdnbuYjbdUr7RakynntpFcYM9AAfVlC47GUYt3ZCE=; b=mUJ3iLWgODGhnXrR5IYTDTgiDQ
	WQhOFhxAhUuE94AsBQ+JO5m/vt5T6r0DdgtBWU+55V84Fc5Fni6rwEyLvRAEHOd0Tjn3prPlPYIvk
	tEC8seLmqjLk1O0zeKFKvOkwSY0HUI1uakchChJVnYwg3Qgo2AEG2NUxZo42zPwWZcLHPEzWMh7pR
	h3hvIWEZmk9o3qIYHn14gmbGuVV3A0zc60IKcvNXp0SqDqWocc+Bng6aRJgEJ4hZuO0qjiWcoH9oK
	zVDAngQXwq68z73jj6xn+mBhfS3BwhSssuh/WaQiGiMGow5aDl7VRHiFVktLsqU4a92SyQk5S37+g
	uZIDlkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHO7Q-009zwz-G8; Mon, 16 Jan 2023 11:57:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHO7O-009zw6-5e
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 11:57:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C57F26602AA1;
	Mon, 16 Jan 2023 11:57:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673870256;
	bh=SKhjba5Ic9MZRmS+zXRK7T5CUknOZvwgZFyHEBXNl+s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iXY29UKOyzjeqOYJhs2LHH2sfVFfkEb7VYeD4yqfFDjgizoJwkGBkFL03mK47XZzS
	 27HqVblTFZ7tWXOKVH9bRpQ8kMViok1vjHwCjIdg8ICQtqFdlaozRDg0KXDP8aOFN9
	 i9dSoXb+XJ5epbNx30J99NPcIoYePGZM+cI8VBxXAqZClzOKnZAhXSraiVh3WrhgSI
	 6D5H02oho/zvTuzPIGEhF8kJFT02BuFj+M+pJg3q6nvZcaSFlNmXu53ZPcScell4Ey
	 m+FdXKVLniID/bOTky6VBiG3bpwP3EYrNYCgJdkgnfeZ6ZZgZDKfWjDAHaGApL3yqB
	 UHXac/jncMAhQ==
Message-ID: <c33a1bb9-3311-02fc-162d-324dda589d79@collabora.com>
Date: Mon, 16 Jan 2023 12:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] wifi: mt76: add memory barrier to SDIO queue kick
Content-Language: en-US
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <2489b17e8249ef8db840edb6168888ff5c887a6b.1673754074.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2489b17e8249ef8db840edb6168888ff5c887a6b.1673754074.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_035738_362488_D68CC038 
X-CRM114-Status: UNSURE (   7.23  )
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

Il 15/01/23 05:44, Deren Wu ha scritto:
> Ensure the entry has been fully updated before SDIO bus worker access
> it. This patch would fix potential memory risk in both mt7663s and
> mt7921s.
> 
> Fixes: 764dee47e2c1 ("mt76: sdio: move common code in mt76_sdio module")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



