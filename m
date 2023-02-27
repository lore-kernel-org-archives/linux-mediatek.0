Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC54C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OrtW7t1BdnRksPuVd9Mz246r9hb7FU6JZaAbFeLzME=; b=RS4tW7EyfS/umj8tJ0Cj3OcHRK
	nQY5qPrt1rGPO7dqklET865vhnCxlw3D9AgYrTXrC7a1revwM9fAYoyzoRayXP6Oxw7wUPLJpoYJq
	tzaHh7/0p6ib4QW7kSwxCpVcVjRMLHZTGYJXhAX/D5zXJOGWMudh+7gVeuroNAHKAvWslOLLCqmDN
	QH9DEBHU0WpVfj3Cgop+itZG6W/3FR7A1Ud066LMDi5QCxIrkicbgFEqlZP1jHMainOJMTe14TgR9
	8F1ncYrYYTqCbiq0sZ4BynE21khJSyujdX5VkPr7lh/cNz7AaKV1wbdJzm96Pb5GWE9vI36Rp0UeM
	MAw7Aq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZI3-008w1I-Ki; Mon, 27 Feb 2023 08:55:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZHp-008vvM-UF; Mon, 27 Feb 2023 08:55:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3AF786602216;
	Mon, 27 Feb 2023 08:55:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677488108;
	bh=TMi4EMDMJ6BN+G43IUeSNqmzFjjGoOITcOTDgs0VSYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ljlsB1ra7Ty9HhGq2NFp6Bc47GzvflrpVfEmvUEbWZS95vIELcjJNeKM42l8azOrX
	 D8rL642+hjIqgCXm0ypYkIYUzTTmHm3kzLuLM7hfP78KOc6m8aVjOUEpGENff1GHSG
	 pihyoJueMobh7WmKB+hgibecmYvgdMvi4vdtvoPDT/GuXCE8V/F6Vgh4HTtGfaWHLK
	 LzQwwFpFeMDrkaRshDG9xQwklts5+uhHFbLaqUrXZGnpE1+YkJ1yBWiKA5QyNe+m/2
	 PTq+0AXDfJPKRqpn8ieN3TqLurwxa0kLehCa2cJbM2hIRSLQGWq2kHKFG7/u5BSz4B
	 pJR211/AOMxpw==
Message-ID: <ece739cc-7d75-8f99-2a43-06ff8490c5b8@collabora.com>
Date: Mon, 27 Feb 2023 09:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ASoC: mt8183: Fix event generation for I2S DAI
 operations
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
 <20230224-asoc-mt8183-quick-fixes-v1-2-041f29419ed5@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-2-041f29419ed5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005510_140606_6F2A172C 
X-CRM114-Status: UNSURE (   7.84  )
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

Il 26/02/23 13:49, Mark Brown ha scritto:
> ALSA control put() operations should return 0 if the value changed so that
> events can be generated appropriately for userspace but the custom control
> in the MT8183 I2S DAI driver doesn't do that, fix it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



