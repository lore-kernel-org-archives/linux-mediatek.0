Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZZVzqxEOB7HTl9TJLe6wsMXsnSIDFpFurffvUmVmwc=; b=Tokw1HZJRAaVCx
	ztsqCL34xgurlbr4F5DPiJedm8dXY9sFyNSyjrR3llAWpYtEJs89q0s+eQjERw8jM1p2NU0OI0c6b
	mIAN9fWVofgbWepaxPRGlRKz52PviTsG6my2FzD7+g8tGaF4uK6uY0tkzMIAtPXCbdPEtLWcLjqqW
	RQGHaFC0EswTqTNM0zwjyu+FS63gd278Ct6DWDfU1pPZCj84xukYcwD8rz38u6wezgrnhFV6VpN2r
	lG6jXOhB3MKeDP5UOCNoMbwiYeOEc3s9Qp9adAuaSAYBfJK3Mddy7W03Zs9BUkl+Lndf+Pu7Vz+uF
	13ILYGSBNmrBDfP5WdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4bn-007Efl-Bf; Thu, 28 Apr 2022 13:55:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4Pt-0079Mn-4S; Thu, 28 Apr 2022 13:42:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1DA3A1F458A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651153363;
 bh=lFSmPQ6PFhO5ERCn4hu/jKvQB+1Z2GRxC2+gfU9daR0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Br1Q7PegFMBxQSWK/j+TKX1R87dhrCv4H68XpuT+wJjXMu6ssa9WYeLkSnzTtSfW8
 giwvsb8RiWTKcGrDk//NCu/rFINIDOq5a/S02ytf8ZdRfb0fpYY/lnCKdsWvHTpXkQ
 ePzRFS7XpFgT1VohDudfoYmI6FSB6RQfiCLKlg2RCQXJwUr/AQs0dSE89H0RIGoehd
 dyHIPhmH7te1t35bMJOcYWrk8qmsCAsu73E+PgadWze8/IzoALhB8tNg9DO4QcRb0P
 FYOzXNLoetf/lUvQ2mT35NBGV0oTtypP/BliKJWs5K1r2P0E4vx67PY1kFn1IacoRG
 MqX6dIPunKhCQ==
Message-ID: <8552f214-3476-8140-47dc-5d5b95ebcb1f@collabora.com>
Date: Thu, 28 Apr 2022 15:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 13/16] dt-bindings: reset: mediatek: Add infra_ao reset
 bit for MT8192
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
 <20220428115620.13512-14-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428115620.13512-14-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_064245_402141_2A962606 
X-CRM114-Status: UNSURE (   6.02  )
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
> To support reset of infra_ao, add the bit definitions for MT8192.
> There are 5 banks for infra reset and 32 bits for each bank.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
