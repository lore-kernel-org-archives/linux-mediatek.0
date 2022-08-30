Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D6CECAAD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8vmLognCb4cq5ttqqVPB5pmzzr/6TxVDkZzUAA4gpg=; b=RXvCJ/dAPhODeXRvhr0TXMQ3uZ
	NIfNSPymq+rXXvpolcYU6PwwhSCkGtdtIg/F8PZTyiwZJ4+o7YnSJV8ZpRPeECWeJANHPGU6xpwm5
	gZj/+h9R0Yp0QTaEycj/rxl9vSRQP8GimErQt10+E2cK19ejaRM4vqfWbgEW1Hi7HRaRHNNQA1ED7
	xTMGCXsg8mDK15qicjjIZEn8LEXO10aXcBJqXRbUPK4u9XA/Oqj3Uu+mrjTNAzTB2iwn7oDBo6kb0
	KQFMSh/RJlwGLGVbZ0yXqpkqSxFV0HrrI4NAalXb6NgpJ6nvr+/SlZjWTUIChwmUJ6iNv+lphJQu8
	I40EYVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxpC-00FozA-Ij; Tue, 30 Aug 2022 09:46:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxoy-00FopG-Mc; Tue, 30 Aug 2022 09:46:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A63706601BF7;
	Tue, 30 Aug 2022 10:46:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661852769;
	bh=7NH/EXIiW5hWC5H9t9DQGyotstr4olgJLQgNTwzp/C0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ymye1lGrfdxigfShYYUIVvi7r95fDUhK4e4974B4iDYIAiBYxLglwM5Zx1JIudhh+
	 qQd/kHqwWlthmJw7ljMkC9gtLSrrsTTWibJXUYf7yt8lwVx9bWVpkd1EAQshrwriHd
	 upLDiDialsAl6zeY55Ca0LUoZtAwThFnWI48VEPIFQvVh1byuX5q6TqABk3d+0R2PV
	 iJK1GEZ4Dpi26jWfpb7vHP/jWW26kAPm1aueWLW0rL8F3m1pXXF2OA5EQpF9eOYmRT
	 L2hkp92qrECr6k7PggheYYrl19Vw1DtRcI5EXHRU78ZXVGPlz3zyBh8hQB1l+uf57s
	 lJdiuUgwhJg2A==
Message-ID: <cb85942d-1f41-ee8c-c777-0c47336fb36c@collabora.com>
Date: Tue, 30 Aug 2022 11:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] spi: mt7621: Use the devm_clk_get_enabled() helper to
 simplify error handling
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, broonie@kernel.org,
 matthias.bgg@gmail.com, gregkh@linuxfoundation.org, neil@brown.name,
 blogic@openwrt.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
 <05a7fd22719008c8a905d6328aa9548ce40f2a7a.1661599671.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <05a7fd22719008c8a905d6328aa9548ce40f2a7a.1661599671.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_024613_010309_19A8F7D0 
X-CRM114-Status: GOOD (  12.80  )
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

Il 27/08/22 13:42, Christophe JAILLET ha scritto:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This helper is well suited for cases where the clock would be kept
> prepared or enabled for the whole lifetime of the driver.
> 
> This simplifies the error handling a lot.
> 
> The order between spi_unregister_controller() (in the remove function) and
> the clk_disable_unprepare() (now handle by a  managed resource) is kept
> the same.
> (see commit 46b5c4fb87ce ("spi: mt7621: Don't leak SPI master in probe
> error path") to see why it matters)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


