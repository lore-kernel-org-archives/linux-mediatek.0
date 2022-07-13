Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DC7C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hD4KEwPzNfl5o1koTVtn6yv0evJzRj0Wo+FLQNpDrDE=; b=ZuFvnXKpQky0xE6EyyhqgpvhoV
	4ir/KYC5EY7d2nr0kN8lQfN1o0eazfRRkj1wdrp6O36jr3W7v+e5BNpuws1pLyg7fIP5JrbSMXqO0
	q4kwPD7j10tBPEKns1zysCPEJJz6CzlsIcIG4liC0IqkMcwD46T7/IG8XHEnfw+PdRXP5aLZyi015
	CLGxubT0LOK4lpha0P3vaTXsYS5Pp44VpH3iGPsYGX5w4PiVkfCKpsCE9JOjtN5uobyjaWLXVAMHF
	Z20YUpYwSfWJ4OnrGZrTrqmbD0id0koI+ypOQ5Q/koWBLhBQsqRtFQ/av+Nsabpm9vsn8WBHy9QP6
	E1UGl06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXSf-001WQP-PX; Wed, 13 Jul 2022 08:11:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXSV-001WN0-6Y; Wed, 13 Jul 2022 08:11:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BCD84660159E;
	Wed, 13 Jul 2022 09:10:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657699855;
	bh=SYXH3VV5ZDj1Hp31QoluVhawUYk9CSuIakPAfiP/RDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B58lSA6mYO+vxcsz/XDdSZoo8bNzhTBWQ79EyX0dwUfixquA+WkdvHS4jEk6qbxAc
	 r/LJ0DdIuhk5uwcsFlyLrVftGLCQsSzSpUykRb9ywJqab8f+O38BoymJbk3g/MUkb5
	 cySE0opDa+R6dqjcdb5gsCGOlMq16WSVY0tHnh0P7u/IwnNgH9lAM6TnDaOeGHyV7L
	 pruGCeK9fjERA9Fdx8LGsCWyen6zJSytLJi6Ll6TBv/HzhaF16BUIiZS6cWsUdGuGV
	 8S92+cKm8sMoi9p01AmEyP0AXvVcI9lVKXsIXvXtfyCbviXrXVD+MrO8wcoJnqRRbY
	 s8t9LnpY0Q+DA==
Message-ID: <eeb303a0-4a00-dee0-6982-b9eff13e55da@collabora.com>
Date: Wed, 13 Jul 2022 10:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/5] arm64: dts: mediatek: Add mmsys #reset-cells
 property for mt8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
 <20220712114046.15574-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712114046.15574-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_011059_479872_85BB675C 
X-CRM114-Status: UNSURE (   7.87  )
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

Il 12/07/22 13:40, Allen-KH Cheng ha scritto:
> To support reset of mmsys, we include mt8192-resets.h and add
> property of #reset-cells in mmsys.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

