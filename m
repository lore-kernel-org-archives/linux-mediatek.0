Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCFC47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaF2Jiurd59nzYq5ZA/z1X60527o29kX50+8qRqlg28=; b=Td1AUaaMBjRLa5Utz6OCdUAvtj
	GcBsgpl+ruQooxw14A7gViAPRONRJ9ewIoF73A9/bb3RmPc/C6HiKAbP6fBo1OsoPeJqhaZopfehl
	IJeXXPis+FNYxV5Kj4UL7qE2qN+7+S86+pFQTtxWrOoCikPvBKYrgO8CTfX6SnduejQ3b+GH4KyPj
	Y5ZVebkSiPI2kWPmiVsxOxxcOyLi/9jPTSLPaJepB4L6rE+I0l342ehJoCtDdBbgzfuzJ98AlK/yE
	JAmYKPHojb1SttUeY43ve3obVZE1qP53ghUU4ylDq2kll7uFv+3TcPp70g7+yvSteUIM4X5TIZG0h
	Y5/5oyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8M5-00000002wz1-1wcA;
	Wed, 31 Jan 2024 11:02:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6KA-00000002FEg-01lr;
	Wed, 31 Jan 2024 08:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706691118;
	bh=sZRwtejcYMIEZgWQriqWtikVuHIHGna18OXu9zMGt+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3aD75dZ1Tiz5t1wu15DjuxTcrDEFzNgyEpc7lpUD8aCqiQwIvigJTOFhFw8KnFzam
	 jH6JzJRt5ABEL7xbqk//fwUUtshQ+zAhCCvZU/YMh8SMjDqiVOKDedUAOADcBsxshN
	 lypYtjGTwQ8Fe9pDstbXQAoCPscw5syRcayrOs9O7ZowI5lVoCYwlJk6BTsX+VDzab
	 nMr1wpznNFp1HgmyAlcFZfxVh8RDbcuou2LwtB5gid7kxX+5nnZp3AVCp3zQ484gUz
	 iQxu44XhsQWs+UR9GAnWtB11zPJmkVjPZTREq9PaxaX0crUZsqzfjVacWOK7sF9/xy
	 Wbf3d/Y9tvYIw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B6FE378203B;
	Wed, 31 Jan 2024 08:51:57 +0000 (UTC)
Message-ID: <3561b91a-9e02-47c8-ba70-2b7f082b5ab4@collabora.com>
Date: Wed, 31 Jan 2024 09:51:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Drop bogus slew rate register
 range for MT8186
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240131071910.3950450-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240131071910.3950450-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_005202_233816_8265614E 
X-CRM114-Status: UNSURE (   8.24  )
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

Il 31/01/24 08:19, Chen-Yu Tsai ha scritto:
> The MT8186 does not support configuring pin slew rate. This is evident
> from both the datasheet, and the fact that the driver points the slew
> rate register range at the GPIO direction register range.
> 
> Drop the bogus setting.
> 
> Fixes: 8b483bda1e46 ("pinctrl: add pinctrl driver on mt8186")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Argh :-)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



