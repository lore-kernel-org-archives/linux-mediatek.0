Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9G4P+0yrmEaRuI5MIO3Oesp4aPWHjh2WPO0tE59C5A=; b=VkBoV50q1DxK00
	JN0sM2BQuCTbSpv6r8SQqlkLzR7t1twG0L8HARENN2O4GZ+qUx4epUOx98qju1ecGd4P2fLbHvkC/
	GSsweueScSHPnAfTvOpFY7fLfscFq3iKDYEnIhHCzKTBrkRTfAqgY4vlm7R07p9dCsuzxoqg4vkMv
	rsM+ONovngPWEq7GZbLc0Ei6Z5JT94HWknWCfvoLR4PQAxw9oZdMR19E8FwN7N2rJLoR+C63f2skK
	yrOEDuVF8zSmyz4bgD3BHIIn6Xq2Rw93obZMF0ZLi2gzvqQO1eOIjl1Go9DVZEmK4AQLn9aecUAxO
	VhjpNPN3AzApxKkbL2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5wO-003Yj9-7M; Mon, 23 May 2022 11:09:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4vf-0035GG-F1; Mon, 23 May 2022 10:04:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A2EE61F41C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653300286;
 bh=hUasYgHF+fPKLk/4YEcyxnSp3Yt3vaTDlOnRTUToFZs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SeWvtFpW6V9YfJIB8dnpoZx6ZnPvjZ+/pY+kzYk6SVo8WrMHyGcEkMGKjhJLpqe5/
 lhpUX91Ck326DdvEG6HNi2oTMFqXWupvA+lVtT5nw3AKS4V4C3Q2/8z/567oMn7PZH
 rJltzwZ3ecr8V1Yf2WzzbYEN8MXZijPXQjEFYs5d95/i+c7yEnKDo0FuYyTMb8c5RX
 3+Mz7em3WcGtrXC068EK2v4Sf7YYlh2JaWFIigtqU2m/IMYYNMRfNrtKV9ZtCEt59w
 IRLk6Ngmq+jhAKRSctfzVJwZZ0ImzzJx+aB3ERI+5G4P8nAbek4/mBStsTSrdz2pkg
 3r5dDg379tzdQ==
Message-ID: <fc68ebcd-74d1-4ed5-381a-ea6e676a7680@collabora.com>
Date: Mon, 23 May 2022 12:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/4] clk: mediatek: mt8183: mfgcfg: Propagate rate
 changes to parent
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220523085923.1430470-1-wenst@chromium.org>
 <20220523085923.1430470-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523085923.1430470-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_030447_688519_E22DAF62 
X-CRM114-Status: UNSURE (   7.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 10:59, Chen-Yu Tsai ha scritto:
> The only clock in the MT8183 MFGCFG block feeds the GPU. Propagate its
> rate change requests to its parent, so that DVFS for the GPU can work
> properly.
> 
> Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
