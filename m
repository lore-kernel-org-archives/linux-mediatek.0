Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49445C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=if7MHjs3ox0AHNJEV938xiXcM7R7pv+fqHJUTSuq888=; b=wcoXhFD1L7xe9qPmfnhwJeNBr4
	nuwjbDVWLFmCPQ9esvnmIZfdKU7HB6IEwOC02gdnleVOykObxDaRk3tXdeIY0+4T3C1cCUoLWAHsI
	zMUUEHRR4cqLxOmmWFmA7qWL3VITTwTiYGjE/5PgTxZatE7BcY127Skjh314JIRn3vPQyTqd04Xmx
	vsp4o6GzOjGEk8akFCRVPv6qdy+UofvBYh/7lnWM2nwfNxqIcSZhlR5uaMXJwzUZlR9jDJx/EIxNz
	xQ1DRqTecx9ifli/0BXuMF4yF5YpysYaQ3/SD25bPGXnZfU4wO4eO+r3VGpM6YkiTGQ/S9v4xfNEU
	KoCGQXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6aa-000WoL-CV; Wed, 18 Jan 2023 11:26:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6aI-000WkI-Fw; Wed, 18 Jan 2023 11:26:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A0606602E0B;
	Wed, 18 Jan 2023 11:26:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674041184;
	bh=TZa+V1LhkWey8bm3oH+yJt3PmzhTZNJXbV1NIoHPsPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B3i27dX1GwzCbsjzOfbjgmGotgiUhd/C82YhEHJ5UVdLoIUXchaHILZPGpw5/B3O3
	 jGK0UuHMlxBZ8xsmANFlvG6tO09cU6jgy3nkK7Ixh0k0WuFM98XhhYho4Ci1OXVzum
	 yg5UWOCogBFiEDQPPvnS06umVkwFAIFMK36jCv2dMGQ38fcnjPjojwPmotsH5HPRHb
	 vDhkflAPr0mAhxsvUDcDdt3qxKs/ZcYFlXBZ4MsrBq+f49AG/MX3s4jtv59v5GTBs4
	 6lnE4FKVPb4U6HxRjZBdEXy7kDWpFzaAhmjCWajz2Vs0D1eIeeamD/aTPgjSYVMb7T
	 6jnzckf8SWBpQ==
Message-ID: <d8a19ad0-4db9-2c8b-d9db-63a0831dde52@collabora.com>
Date: Wed, 18 Jan 2023 12:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Initialize variable pullen and
 pullup to zero
To: Guodong Liu <Guodong.Liu@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Light Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
References: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
 <20230118062036.26258-2-Guodong.Liu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118062036.26258-2-Guodong.Liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_032626_689629_65BB25D2 
X-CRM114-Status: UNSURE (   9.92  )
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

Il 18/01/23 07:20, Guodong Liu ha scritto:
> Coverity spotted that pullen and pullup is not initialized to zero in
> mtk_pctrl_show_one_pin. The uninitialized variable pullen is used in
> assignment statement "rsel = pullen;" in mtk_pctrl_show_one_pin, and
> Uninitialized variable pullup is used when calling scnprintf. Fix this
> coverity by initializing pullen and pullup as zero.
> 
> Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration
> dump via debugfs.")
> Signed-off-by: Guodong Liu <Guodong.Liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



