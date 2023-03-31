Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5345C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql3LlAzPSc/b10AtJneJFY+V8sTHlqZqk9AvW/0p1PA=; b=TRdLw0WKgRUCyr2vBz5VgGz+mX
	/m39xVcB/OGxPPrAqQWe2yrgfY4MYEoPyTcpkPun5tzvkYAl9ZKAxMGjv3Gh8yrp5UZ1z04++/6Nn
	8aQdO2SRmgnzPKmk2H1ObtyoNZjKcPgfkNgW588WIUcDKKhcB8hlJaHPcedTlJ+DIAc8G39zv+u/g
	UaE0umsEqpEFAvDxqfiXIxYVU6zS6JxzoIsgalf2NoWWv4KepPaG6gBKehb/qmM3/8Xjo0a2sECxc
	ijTmw3+YYzRQxMVen45NmpV9TXfjqqEFIlW4UQ+H6Ps2xb2BfI6+FRMd9iqE9FCFfErRz5y1HcXc2
	1zS6Zigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBU6-006oLY-2S;
	Fri, 31 Mar 2023 09:55:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSV-006nRL-23;
	Fri, 31 Mar 2023 09:54:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF4796603192;
	Fri, 31 Mar 2023 10:54:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256450;
	bh=ZBCQn016iwXgnipVJtiUDU6o6gD6F5wcju+0vXKUkEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A//eGqjPRKM0g77iItFJXe/kjvb/awIEMkSQDDqiM1xirEYtxOIbU8d0pDO8pTNZo
	 HYUUo7s0MyqAApGuyhfLXYjuh8i0Mdpv9wPsH02Tjr/aQhR7q0xgJ9RffSHVevExob
	 n1fpmHa2qFWFMIo9G/kxo7E86qZUOXMU46CzWAqXOp6W9as4JAlGfR/JRU2PzLYgWT
	 UyM8ja9fi72+Rfmbr6fBAuAangKRSHUbamXN8C4TVUvv2n9rFnLr58R6zOQPal/0Cr
	 qoX/4YDgwqRyd3sLnorlGG4ODVZn1h53QMBY0uBzjpdyXzhQpvD0Xoac6Z+NpS6llc
	 e7i2P7Qr1Bk9w==
Message-ID: <6af57c40-741c-63d5-74d1-f4d7f6c59b26@collabora.com>
Date: Fri, 31 Mar 2023 11:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 14/19] clk: mediatek: Add MT8188 vencsys clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-15-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-15-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025411_800298_4B35E69E 
X-CRM114-Status: UNSURE (   7.34  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 vencsys clock controllers which provide clock gate
> control for video encoder.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



