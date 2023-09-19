Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BD6CD5BA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZ4e4+/sTjQNWHJ3idqipkBIiCifW78C2Q4BoJLS8hA=; b=qBLnvZ/jyP8HuG
	QYNuAiUcbP3+0al3pOXJ5G82dU59K8LmveAxbDe08R6+dY6/NWFMbsXJi6eMrpbcz3CYEK9QMfiQ9
	5fmdBgKHP0zk5CtL1+Gsf+FZsuqF5aG+iejTKH3vfiD6Xx1sb2y/lc0QZNmUJTsvidFC4h8aXS4uU
	ZeJtOAgz+wbzMKSJbrX6sWLYS2RhEEgnph5/avB7WKIfFPuM2asaSKrOq4ol5Mn9z/jVobtOWm167
	+zwQOhzSUtflV6yEGUu/1oZq38RF5utcQupahLZwHRJDReDSQyMZwhuLlXUtX5FJ5xPcioOr8Scgx
	EkDAvutTHCLW5w2LyekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZRQ-000M6H-2v;
	Tue, 19 Sep 2023 12:02:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZRN-000M5L-0z;
	Tue, 19 Sep 2023 12:02:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F20B66003AF;
	Tue, 19 Sep 2023 13:02:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695124967;
	bh=WqbMfAO//Ooj16UaG3MjBLlfRdTE5RHHSY9kCbs4IbU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dletyGywwkOCWcnz/FvfvmrEVZFb5ZT8J17MakCWaK93yTFNc+HJtCiMeiQ3Z0uUM
	 VDNNvcdcmbLGiYyFTDnkQRv+KO8TauLXAks7f+/CySkg/XWVXiB/P93U1XeuHprr36
	 hw6Ct0Ua0lJuMCZ+2MXGQ933g9ZDGDr57s4J+znkms65vGPLuY8zWTEt9KlyuuLhG+
	 ohWJXgqV6ejRZzYNaJwbNHf/6ANbjgOxmNMOZVgMsqY2YhP/+DiOgrZEKU91NFSLEy
	 0lOyrnH7Pw5hVL4WVaMDimemLDm1jn1MokHdQqV5YcC8qUMdaEMxFZGYyyT6PBs41V
	 8M7Ur0osWQBag==
Message-ID: <c79766f1-5830-556e-45d5-b45f867bda1c@collabora.com>
Date: Tue, 19 Sep 2023 14:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] thermal/drivers/mediatek: Fix probe for THERMAL_V2
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230918100706.1229239-1-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918100706.1229239-1-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_050253_525002_DB5ACCCE 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/09/23 12:07, Markus Schneider-Pargmann ha scritto:
> Fix the probe function to call mtk_thermal_release_periodic_ts for
> everything != MTK_THERMAL_V1. This was accidentally changed from V1
> to V2 in the original patch.
> 
> Reported-by: Frank Wunderlich <frank-w@public-files.de>
> Closes: https://lore.kernel.org/lkml/B0B3775B-B8D1-4284-814F-4F41EC22F532@public-files.de/
> Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Closes: https://lore.kernel.org/lkml/07a569b9-e691-64ea-dd65-3b49842af33d@linaro.org/
> Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

I have no idea how it happened that I didn't notice that mistake.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



