Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD31C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQTLJNUbO9R1cxBV+Sp3G73p0WXDaDKlAr6Ci9COlzM=; b=Wo7EqX0Uqbl1JCzNlkGXHkhr56
	wncYiJMa6FqgzIdFEr3dxoh1twqsx8vsjZoukhYhFLE+/81MKkcn9IQk3poZNpIKxk9Wot5qWYiSd
	v77mmBLxST38DrjGrUyCsBmV0bG7VIwBIo6BjRkGXaTObWEVG0h3Av7npK/R8c+ARWbuhgncBD2oU
	KSnmuN/zjBTjpqOLUJbHcFD1ys/CfnMcKddvuz245yfoBK/eY2iU6gVOSbFqAGT+xFpo3Ms0ULj0r
	CjA4Ug2rmhWxIwlPxrQtAmwmjDcgMx8VAMKm7maOaeXuwYqOoqEupnxP8KG2GLbKcCGc2gHHt2PxA
	0Krukm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZIQ-008wAa-HU; Mon, 27 Feb 2023 08:55:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZHr-008vwD-Ao; Mon, 27 Feb 2023 08:55:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A540B660230B;
	Mon, 27 Feb 2023 08:55:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677488110;
	bh=EjaYFBwDB7oJOzKkOcfvbq7aToe4HGyjAniTzS7dVhw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MLMz2grNB9y1t4yGJYtvRD75Nt9J+f/ogs/R8ktXmFAbKH13/v/9tYE9QwO3c9NEM
	 aOygyoizpYQ9/bN64fSRvRKdUGnZoRBptA+ERmd232Y7fIOlR2SsEyHNx5SKD/nCEd
	 R/JqAN+kB2FnvWH5KFllP037SfHBTbsSIopX8nDg5xm2ol8v5c+K+Fw7MPjlkh3V8M
	 rPRrL89E7Ai8fSbgm3fy8UIKE2i1ti1TyroxwZz0/jQlWO+rpYEyN0FX3in5R5bHc3
	 gcJpzTo1tCn/fEsAC4oWi/cV89pMUYdtjQ25bf0SiZ4/k53jgCz57fE2FQbdQc9wor
	 3Cwmt+bga2vMw==
Message-ID: <d85c5a95-046c-905d-048c-dfe5da7e5f0d@collabora.com>
Date: Mon, 27 Feb 2023 09:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ASoC: mt8183: Remove spammy logging from I2S DAI
 driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
 <20230224-asoc-mt8183-quick-fixes-v1-1-041f29419ed5@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-1-041f29419ed5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005511_543525_025E664D 
X-CRM114-Status: UNSURE (   7.92  )
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
> There is a lot of dev_info() logging in normal operation in the I2S DAI
> driver, remove it to avoid spamming the console.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



