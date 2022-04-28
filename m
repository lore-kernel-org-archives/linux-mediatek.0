Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4010C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw1mtmgVt31L1wYXS1y9fBrLopnBE6REB65BA2b/fe0=; b=MDAmfZGnQ0gaYW
	u0Ooq7vFEtiW3gffG1zDBm/Eye5dmvIvYCSq3Al4SPZVxQip4lGd4q5yHi//sh2K4dWwPC4M5gISy
	Cs+llfZTMDVTJQzPxtzaZaibsqI8cpSJ1GITFLf+LGKXN/ryVyTLI+mfa+O2gE2LxwybtnqykZ6Ah
	I2BTRsTadLmNs/svOPLhMscAervCad6fsFYsOGvBYi7qpjCr/5gnb3DseOa9Ac/09pVjgl8hjQbOx
	K9Xwjo6EgKJPxw/1xU7rPyjBhRomoS9zVJ7gdzosynca1C6emxmxVw9XHCW4Y0OGRran2QKPk1zAp
	FJJ1OlwjUkvEW6YFMrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4Yt-007DH4-Sg; Thu, 28 Apr 2022 13:52:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4Ld-0077Ta-57; Thu, 28 Apr 2022 13:38:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A6BB21F458A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651153099;
 bh=cmIfSy8CafEA7WKzM2siN0tevY6CnBZ1OIjAqjL90Co=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bt4Q8bVE5cw+o5ezxzLR/F6y/Suo6+8SwvV5DVnTXw0ZJ5inAli4PziK4OhL7eH1T
 gxycmkloO9rgd4t7ACEOIVzKWompfyvDJpECT2xCsE3dqO7mtPSPtkSsuk6cLI2ZeU
 PzpQZFP2mpiZfeI4thXumVDg/VvmCyhwwNKA4pRsjwWzW6dxM40pt0/28EnlHc2lJy
 QAmFz1gayjcBfaHYU+KWB58mPpQ2hBil4dlb9uk1WotJ7VOv2T3la0jd+LQ18gG3xn
 88xImrSs7MBLUJZTe8fF9rIsumT43J3LfG/sQI7V1/8YuIJmAXw08gk1IR4/oF6gEO
 29uLM0zKmRUBA==
Message-ID: <79b2bdef-37b5-9b15-3739-5281d4bc8c9e@collabora.com>
Date: Thu, 28 Apr 2022 15:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 07/16] clk: mediatek: reset: Support nonsequence base
 offsets of reset registers
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
 <20220428115620.13512-8-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428115620.13512-8-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_063821_402950_617AD557 
X-CRM114-Status: UNSURE (   8.75  )
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

Il 28/04/22 13:56, Rex-BC Chen ha scritto:
> The bank offsets are not serial for all reset registers.
> For example, there are five infra reset banks for MT8192: 0x120, 0x130,
> 0x140, 0x150 and 0x730.
> 
> To support this,
> - Change reg_ofs to rst_bank_ofs which is a pointer to base offsets of
>    the reset register.
> - Add a new define RST_NR_PER_BANK to define reset number for each
>    reset bank.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
