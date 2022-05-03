Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CBAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMMectk+lEZOvlsXbYFfJjRjJyT97EIZI40EBwF61zM=; b=3PRmm0hKcbbfZK
	ide3tMO4dboype5YmfxkbgwBrSSiUZdQPwoJQmljYTQ41Y5SUtHuQ3pAJMF5YdWTzM2Jei5hVUiBK
	MhLQbvWaWBvTRHvSfesz6X73r2a4CO1bXSMSB2p6I9aRS0QEcaYbpvsy/fU1u8A3rFCCfwTpocp5Y
	Jnfqh6vy+kms/91ZrQN77VdLCJAXff+2B3fsf9UqYCedyOGDab/XtF5kJztjjRKQBb7IoEaM8T5vR
	bYNhSLUYB0jiGL7vifqbTeg+6VXEx8JogpGUqsWVoogNq8iCPA9jYpoSroGevCOmCgTN/doikWIYd
	5bNsn1Tkl5MHzA9y7tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrmy-005pKf-Ph; Tue, 03 May 2022 12:38:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrmd-005p7K-8t; Tue, 03 May 2022 12:37:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4F5261F43133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651581458;
 bh=7VuOPvGY7gfJ1yQFSlWvOMk6/J1XVQumw5PI167sPuQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D3qsFLgG/nlxwB/bxz9aDy4RGpf4k8RSj8GlTpew+AlGOXFco0SNvdi6KQFWSRoev
 EbaZ1YyjWp1t0y3421SwoqnY+d72dlsSHW5MVlJAltDLOolfdj21w2atJE/wKCBmpD
 Dlvc2WStmJLD66Lao0Qvhx2fQQRrtxKPTQwvcfEkl7uwOIOTCrRPYJ34gMYVSwtvfS
 b2hO3o++49k/vrX0vw+F2gbzpK8LSGmwqK/kIjUbLlR8DNAKVWOUoHyZk20V9jw8Ie
 jjcU/8hfQ7ZR+tb7Nd3luwmaOJhNOqfEHAK+McWe49vTC6MHmdqLRc63WbZ81fy54y
 ZkkPl4dXN4Gpw==
Message-ID: <d09c4605-e4c5-bcd4-8212-b1e977b0e3f3@collabora.com>
Date: Tue, 3 May 2022 14:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 12/16] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192/MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <20220503093856.22250-13-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503093856.22250-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_053739_499666_4F1818D4 
X-CRM114-Status: UNSURE (   8.21  )
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

Il 03/05/22 11:38, Rex-BC Chen ha scritto:
> We will use the infra_ao reset which is defined in mt8192-sys-clock
> and mt8195-sys-clock.
> The value of reset-cells is 1.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
