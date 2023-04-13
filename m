Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37185C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lqc9XpofSCjGXM4JfJaOE/4qcRn1pz3Sh9WtnU5GgQc=; b=he8Sd4wUWwI+D77JDktf+kR+ZL
	neQwQkudVK9BGDEWnKNHfHL+dikr5rq19qbhc+D5320cm9aEJTfwUSyHl5WM8QiYyBZO9bD2NiTd+
	7N++cEHWmpJPOWG4DuKoLOxeChHhwRZbYdmLNc3sWaFIUZMAVEc4VJT2sM9pqpz8ClJzjYd8R7cKK
	eKn0Aa88BzjCHdMHCf3/RFT33zi8gnKeeAkfHdEDSlvSP+obdlzgz0nYR18qNCJfOPlFbsw6zFP39
	VC11W6eHyJzLLJpwFXQYFnHHeFClwJKp8f+RMoKEO2ZuHfo9BFv14T488iHKrAj4r7tNLRzQiz2QZ
	0wE9m/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwpi-006EWq-2b;
	Thu, 13 Apr 2023 13:17:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwpe-006EUV-2y;
	Thu, 13 Apr 2023 13:17:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F5626603218;
	Thu, 13 Apr 2023 14:17:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681391864;
	bh=AKdwCtT8AfTALdA/zT12K56nin3cggmWrGxfMSOgZfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJVtAcCK0erupdx7mB0Yi+0evnU4PRAj7tacSem0um7VfGlqlvhRaRAD4yWjHmsQ4
	 f3sgHre/YRWFk2c5CxLvY7rqKMU4k0d8WON0H25AUVd3quopPamB7MniHkDSkAYbAu
	 IwglaX143kKSBm3a/T4fgG+eybIGrSXbMNkpjWVCDD7z3JxGF0Mw6AgSRvvdpad1DQ
	 1CXmFCfGfURTcyCokZKs4jk9z7CsjLB2i+G9KbMfrLZHFnRM0mnATSTRoD+N4pjoE1
	 oqBkCfpKQeTYKDUXvyEevV2FDXqDWmdrpGAheRQBijSKpb4UQjQU2w0a0l+eDyWQK7
	 AL7Vw7RWcPEuQ==
Message-ID: <b59fd0d6-b08e-9c80-a2f0-6b6084038353@collabora.com>
Date: Thu, 13 Apr 2023 15:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/7] ASoC: mediatek: mt8188: remove supply AUDIO_HIRES
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-2-trevor.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413104713.7174-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_061747_168892_B63E7437 
X-CRM114-Status: UNSURE (   6.83  )
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

Il 13/04/23 12:47, Trevor Wu ha scritto:
> AUDIO_HIRES is not required in MT8188. Because top_audio_h is disabled
> when hires clock is not used, set_parent is a redundant operation.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


