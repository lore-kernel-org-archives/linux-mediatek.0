Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D2FC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSgCVY+vAFXXeXiyRlCt5Cnq8mWyv6UDzmSk4uNZjHY=; b=DbozUFnxeYKeguFbfu0MX/uNYk
	KYcJFe+NV42H8VcdVU+2YUYThIC+1hvtK4XyZYRJfi+0MU5wl9TUCGhXxZetApb6HPkN0H68VdrAr
	l29/IbIVQhSEhqPlw44OlwQfiW3zwMfxVugklxlsakC085Zuin20u2EbM1wgdNBNhyiK/gvLFSxrL
	8ek6tH6LatqLCg32hp7pmrz2bsao7dUxyQa8gGhTvwpT+CuQqcSYxJld6jNY8TmktbooxrInpPCNJ
	6NDPDmqx6OLNVBP5V5lfqqGfoq2s3EKOqWHvWWQfDp7qkTcaOXfwCoylxm7eJdUWKWNJDINbRMU6V
	pFHCMyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3YFY-002vBa-2i;
	Thu, 16 Nov 2023 09:01:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3YFV-002vA6-15;
	Thu, 16 Nov 2023 09:01:22 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 291886607337;
	Thu, 16 Nov 2023 09:01:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700125279;
	bh=3GtzmtDRJWmMBIANQu8gF1p+cuSCdiSRabli1wCj1UM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ShrG+huoA/Fle80o9Bpdz+qisL2slIJUpwcb9gd8NKwgxClm+rk0XBWUgljhC2nFP
	 karFwLtwgT2vsniRZ5aXMO8OrKd09u2LUKtMgbI/iwX3VwcDPDBva7Vw0OYo+NJYki
	 DC0z4+Yfan5kRj5Bwy/HT5ohVr4iKli2bW9AA1r61CeEWP9sR3p7r85mvc0/a+CYze
	 6AEnkwM9QYXA+bAyqQPm3firbcbzr/Tk1JjJ8Nuu6E8yhk7nrS5qE20OLzCJncYBu7
	 5rvUh5W8ywl8v0dtFbQePiwv7KnWt+/rLeqBdNlLVvI9sV8w7qQbXEssdhEg4PQ6cO
	 /wm3Kr7cihhTw==
Message-ID: <8973ce67-9f87-4a21-89f9-68ed5d6d75bd@collabora.com>
Date: Thu, 16 Nov 2023 10:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] soc: mediatek: svs: Add support for MT8186 SoC
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231011034307.24641-1-chun-jen.tseng@mediatek.com>
 <20231011034307.24641-3-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231011034307.24641-3-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_010121_503851_0255F8F4 
X-CRM114-Status: UNSURE (   6.07  )
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

Il 11/10/23 05:43, Mark Tseng ha scritto:
> MT8186 svs has a number of banks which used as optimization of opp
> voltage table for corresponding dvfs drivers.
> MT8186 svs big core uses 2-line high bank and low bank to optimize the
> voltage of opp table for higher and lower frequency respectively.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



