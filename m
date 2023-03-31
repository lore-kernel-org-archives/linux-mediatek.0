Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A853C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4mBDbUTHX/Zgh4hVaH/m0z6Ct7Y+oEfIDmfFgTL5bQ=; b=l9n7AEv4GSmv/l/MIX6joZgGtp
	4WLWuQFwwl1ZfY/oieUEyAjpufHSKuYbm3uXhAdF3s9d7S8IG16o7cDXXz9dNis8SxvejPt47Sb2O
	1Ipe89cOiV1Z/VsB+A54kIxqTehAw6N/ClDvaDjB4n4hG+EX1hroPGLZ1q2x1FW/mQOZipNoL92ak
	Y8zsa0ubMlQN96ez1ohPgdRe+6j8q/VVxYuTVkHOukyB/sCeYTf8uaGyNpF4b+P1IfQIUl8+Om9/K
	c+hbQ7PAbmNSzAFbZiveQ0MAGrSMM7uqfklgIdkAw5ov2f9vzA7J0AMNXPwKB6gM6oldxJcxjA/FY
	Aej4sx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBT0-006nim-2l;
	Fri, 31 Mar 2023 09:54:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSA-006nHv-2i;
	Fri, 31 Mar 2023 09:53:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9B016603192;
	Fri, 31 Mar 2023 10:53:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256429;
	bh=XM3dwt3IvP6egtud1MI9b8fpQuNoN9rdgwjekWXd9io=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bj4TaHtn+ZBycR4pdtwnZKDOCp4MWZJAMSKfn0g0xyOnuuSt5RRa3e58uYETBI2K3
	 hhXy2ZZKkTjCRpbRzYemlZE585v4ISTpu9/AhXw8KKwBHhWeejRktrohHc072Mn6NF
	 +LfOmVvqecUCW/+G679UfwSFDWaoHDyUvCCL2wYtWtPJmibF/TtbW2jDvbVSPyMyQu
	 va+vUbbAZwzjWhTCcOkgv7YZT8lQ2r0+iCXrTzrIS9zjS4tMn6psujIvK/HDBxOAKm
	 mwuoYju3F+FG9CooqE8s+VDX5GzMpvN/htRXmIOO5NHuNK6qL+71NKBXmcFW4SgJ5O
	 YYpoxT/KH4wHQ==
Message-ID: <b29f0225-e20a-15e7-f5e3-6d7c83b45061@collabora.com>
Date: Fri, 31 Mar 2023 11:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 16/19] clk: mediatek: Add MT8188 vppsys1 clock support
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
 <20230331082131.12517-17-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-17-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025351_019044_5483DB4F 
X-CRM114-Status: UNSURE (   7.36  )
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
> Add MT8188 vppsys1 clock controller which provides clock gate
> controller for Video Processor Pipe.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



