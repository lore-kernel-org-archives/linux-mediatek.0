Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C6EC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrKr2d416JzQHKIv35xrEFZoyi5LKcgnoNGnsbgsisI=; b=Pe47fCFl0RhKmkaDn4nAY+5N2L
	/Be9fwJa0mm2Nu32de0oL19PgRXelsjwJ/U4B+VT0LbkBQCBYaSMxHfhAqf9ak5sdqXO+g3mXQxG8
	niwBM0g5AFEQgnRpVbFNVPK33kjVxHi91gTzs6XeCzy4N2yd/W/UZSSAwk5zva0zWulmoV+aaiEdg
	F/aoNzBouB9uVXZJRcWZnEyBB2Q4voDvFFrshgZQYV0FHLZl2a1ntE+jyTknHt9/ebSDeMbHS/+3Q
	N+hAY5W5YQv6cMbNYWU1B3TAgZjpYvTc9un1mXMXYZEPwLJv6nCsUQAQ19pwUV3jZa3+W3BbWTP33
	Pd0PX46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IdK-00ECjE-Kj; Thu, 23 Jun 2022 08:56:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IdH-00EChT-J6
	for linux-mediatek@lists.infradead.org; Thu, 23 Jun 2022 08:56:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 361F86601792;
	Thu, 23 Jun 2022 09:56:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655974568;
	bh=gaH+QcLCd0GRKyU8drx8USepwlQGvVb6yCGKaphFNNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cuCsRuTLsIDqKPWMRVmQgSzxlM8pDZi4hyxmxcuxRzEKHteOiiMWYqkJ5VQiMitdX
	 Be9zJbGH16+7YhjeCKiqFkS/F5gCF8CMdWnDtfp5Shqy7HZetNySJM80eg0ev3/VpR
	 2PW4iWlZnEcWZTOQCe4ds4Jpi2kWU/5+BanhWsqeKs9GUMxamgkdGYU/b+I/YvEfjV
	 68mUhnzDQqW3o/HOAzjEiDyLfmKvayvWuB4jmDsDNrCWyFUWU+a99qROkWtlLFmWc0
	 KNadWwyEIIMs7P6ZoFlf5AK1Gei8TnVDAEjL5WX3uJ6UGGGAxeJXBE+tswTIQMPfAl
	 bKeIFnTn52OeA==
Message-ID: <b398e6c6-c120-049a-bfba-aaafa9763c72@collabora.com>
Date: Thu, 23 Jun 2022 10:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] mt76: mt7921: reduce the mutex lock scope during
 reset
Content-Language: en-US
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, kuabhs@google.com, druth@google.com,
 abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <753f19393f169ad4a5fc127f68e16074f1617306.1655944385.git.objelf@gmail.com>
 <b10be44b0f968475268895b99864973d18a3b86e.1655944385.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b10be44b0f968475268895b99864973d18a3b86e.1655944385.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_015611_808471_DAC6B16F 
X-CRM114-Status: UNSURE (   9.04  )
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

Il 23/06/22 02:35, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Reduce the mutex lock scope for reset to get rid of possible task hung
> e.g wpa_supplicant and to allow the user-space process to keep running
> during we need more retries to complete the reset.
> 

To actually, effectively, reduce the chance to get a hung task, and also
to improve the general responsiveness, I think that the best way would be
to manage the locking inside of the reset callback(s) for each dev/bus.

This is especially because some of these reset functions (like the SDIO one)
may end up waiting for more than *two seconds*.

However, I get that this proposal requires way more effort, and this commit
will anyway improve the situation as it is... so, you get my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Suggested-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

