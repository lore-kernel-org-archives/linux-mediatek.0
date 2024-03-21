Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D47DC54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms07hKGpFRuxTQ27Llrjq0ire7j23GTaoH28xKPNgZ4=; b=yFtcpO1sePH8PvdvJV/NjdUgQg
	1LlcN0mMN1n6YrQmn56u72KwRxep7891P5tkAWFarUvO+WpbkRPah5/Ac6j2XNBLp88Q+2Ktd6KxU
	8pKXzvTvacINqom3MAPqTdXgfbX7CbDYXIakRSBH03V3meL9VQFr8BDUT/ypusSyj8yiGoE6iomD1
	aNJ8MQm5OdkBpfYTHcP/OQYyHJ+49TrV3whqrTtnaQ7amsNKvWDgdd3Hz2pbwTL7ajExZTjydSMbH
	oaKLeDu1yO8dmMxIAvmJ4pgOzUbtjqzdUehlVWk0MDfC5c5BLPaVkhQ2YVsoL5noMryYu5luBYE3p
	QaUy8nzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEGA-00000002PYU-2nvH;
	Thu, 21 Mar 2024 08:58:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEG6-00000002PUg-1Gok;
	Thu, 21 Mar 2024 08:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711011524;
	bh=yYFcM1R+CKcYP2mcOiIsJdEoLpQ7IPORWmvpAQ9na44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tVbF/K+mb0Eu9ZjnRPYA8P1LauoTkbQ7m9y5xhBYKwiY0MbG5D7d5wdnQI6thThvo
	 crN6ldRQKBhwzWu/jpmfz7YoEFn4JHzcYEEdADVTgKjh5Bm0cGR01k/U5uuyqyq6qh
	 SkxuBNNF6nD7v623YTLH6oAA4BhDd/5KVZm51AfO8wnkonnpre4Z1hXJV2srwGdp2S
	 O+YMzApCQWLjCjubGFoxxdKuXQTK5jwOhtlVLtCj/di2ko4uXORA8EqA1lI1/PfEDD
	 O5VnDPajTEPa3PBQdCwUDfcgtj2eZh4xv5XaedKn00CGd05wFpisD60LJX4izDxKm6
	 wiT0PR4ROcPSw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 001D037813E1;
	Thu, 21 Mar 2024 08:58:43 +0000 (UTC)
Message-ID: <bf15d64c-79b4-4414-afdc-56a3050b93ae@collabora.com>
Date: Thu, 21 Mar 2024 09:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] spi: spi-mt65xx: Fix NULL pointer access in
 interrupt handler
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: Daniel Kurtz <djkurtz@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
References: <20240321070942.1587146-1-fshao@chromium.org>
 <20240321070942.1587146-2-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240321070942.1587146-2-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_015846_741329_7DCA5FD9 
X-CRM114-Status: GOOD (  10.18  )
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

Il 21/03/24 08:08, Fei Shao ha scritto:
> The TX buffer in spi_transfer can be a NULL pointer, so the interrupt
> handler may end up writing to the invalid memory and cause crashes.
> 
> Add a check to trans->tx_buf before using it.
> 
> Fixes: 1ce24864bff4 ("spi: mediatek: Only do dma for 4-byte aligned buffers")
> Signed-off-by: Fei Shao <fshao@chromium.org>

Honestly, the code in the !host->can_dma conditional is probably a good candidate
for just going into its own function, as it is effectively an alternative flow for
the ISR (fifo vs dma xceiv) but whatever, as long as it doesn't get any "longer",
it's still fine I guess.... so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


