Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C059BC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qI5EkK+8ta4GQoZN+dOBvE5SIdeEYDJm/d4qXr4UJ3E=; b=jyLF8xXTcf45TTvpM5ObEthrFY
	UFXS1e0NEHzSGJ2olsqbS5wUyzdOzcaOiEcK8uYhh4Essj1jqYqKL2/VSQhRAzcWCojVcfxNwSvpT
	dmKFG3o4bJR77XaWb2FUwFC0zIFDhi+8y4VXk4rMECh1lkiUPvwVPzSKk2D6Bnwb0L3fkhfJep8o3
	d28EqomSKoPJt57iof0FzcLxbnNPsljx0y6AD+G288WMGW3vBNO8bFJV74ywxi1CsX9efdnrdlHtW
	ZMcZU7o+uHyc5e2+6FGR2AHsNoRxFV5ijtUQeHUAjIZK+TRrevoA3yGsgpJ26rmnHpFJEHISxmNJw
	jb8iXm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBTj-006o5L-0C;
	Fri, 31 Mar 2023 09:55:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSP-006nO2-06;
	Fri, 31 Mar 2023 09:54:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 193BA6603192;
	Fri, 31 Mar 2023 10:54:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256443;
	bh=0dPnd6Fgko7qqGMCvP12V2AuQERoDOru3ESqRVX5ej4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UBzhBwDFtSm/uOXMchdPDkv9Zj+5pvlftDP/xHW69jx3tSUHviSjGsZeuSNjcIjVR
	 6E+vin4P9uJUUbFEW7ggYGpec1Ct3VXO/Zq5XZX7K47IVu8B1lV/s9ZYXlkA3s0k1t
	 cxEvU9o7+5ooR2mWtA9Cn47e/Tv6rFWhxLoB8qJxqnKVMF0iUd7LPmUzmJluzeCXdR
	 VnSDbTPEFjuYR7GM8S7OsQ4qHBlofbaM8n+lxNKKhzqxxUvQ+K9hu6y7BmAFCBqe2M
	 F0aOMuZUGcIsZptaG/H2d5cfRfAjAEnym2LtMA9MTv5/N5jnmd9wWiy+UtTz17qUPp
	 1/VgEvXVwLhAg==
Message-ID: <870718c4-b37f-a21d-4478-b853883d5067@collabora.com>
Date: Fri, 31 Mar 2023 11:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 05/19] clk: mediatek: Add MT8188 infrastructure clock
 support
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
 <20230331082131.12517-6-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-6-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025405_198130_B30CCD4A 
X-CRM114-Status: UNSURE (   8.10  )
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
> Add MT8188 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



