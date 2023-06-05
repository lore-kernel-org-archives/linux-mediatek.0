Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F8C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 08:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRw3+HkwFM91BzkQgi187ejXbu5qSj8dxBM7C8zuoOg=; b=EXF/yXKWg9DnAVyKxQpY7D4JL7
	gnNt79+J56WQ7hHxRMXyODmJc8couC2crSBgsTXPSdEDG49yiqBKj8j2VpA6jg5CHI6f2bdwqWPxD
	ZAq/vaFyAn1IN4YfPnVmUT0nOQBaHmatinIIyC5C3O8RVY2RHKHpv6FDVxviHc5dru3xGsIizGMNn
	qhtpnPAlfsCLvptrVx4exlAqiSDVIfku+kxAkeGTcs/JUTNQPIo+obWifYiXP7Beqr9htGOVk/yvw
	zLHDS4t1EAzUSVYhoU0m95IpLU6dArlNNiDN0pffCWA9KAeMclEdQqv0V2BROcmx6ZGXoTDtWAxfj
	dfQOVrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65TW-00EhMt-2Q;
	Mon, 05 Jun 2023 08:22:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65TT-00EhLM-2w;
	Mon, 05 Jun 2023 08:22:01 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B133066056AC;
	Mon,  5 Jun 2023 09:21:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685953318;
	bh=VJJ5TugID6Q4W6b8RgUTwaQaM+UQcpqFmZpmE6t57EI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9Ck2tFBEAWtO399BEwFs1Yx0a6XkEl2E3oKh6tn7Q2OBeSI6MfSvGQ0ke/yUSRXj
	 rSbfCLVzUMnrv5WvJK9KRhgERLPJFtFmRAgIZhYRCHJTbHdO4AOqMov1kYDCu1g91c
	 akCSyrW7GspMYhDLgxL10cQDF/BzJr00mXnF6gQsl4EFD3xXZbnxvI6chKN65AKo4p
	 WCqfaZmCaHTqI7AldbLAGHTWTxeLqMe9ebPTJjdhL7X8SgnREYSKQZh3DeBqtXXxMe
	 Hs8MCZQmuezlwKPtDxljhKfvpwMW3wjJzmJwmjmUr3tKpqnLdv/T/NVqxnqfvdjL6L
	 mW+KO9Qg7twfg==
Message-ID: <01c88a42-274c-f8cf-73a6-29741579d9db@collabora.com>
Date: Mon, 5 Jun 2023 10:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230602183515.3778780-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230602183515.3778780-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_012200_115624_C7CEB246 
X-CRM114-Status: GOOD (  11.15  )
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

Il 02/06/23 20:35, Nícolas F. R. A. Prado ha scritto:
> The capacity-dmips-mhz parameter was miscalculated: this SoC runs
> the first (Cortex-A55) cluster at a maximum of 2000MHz and the
> second (Cortex-A76) cluster at a maximum of 2200MHz.
> 
> In order to calculate the right capacity-dmips-mhz, the following
> test was performed:
> 1. CPUFREQ governor was set to 'performance' on both clusters
> 2. Ran dhrystone with 500000000 iterations for 10 times on each cluster
> 3. Calculated the mean result for each cluster
> 4. Calculated DMIPS/MHz: dmips_mhz = dmips_per_second / cpu_mhz
> 5. Scaled results to 1024:
>     result_c0 = dmips_mhz_c0 / dmips_mhz_c1 * 1024
> 
> The mean results for this SoC are:
> Cluster 0 (LITTLE): 12016411 Dhry/s
> Cluster 1 (BIG): 31702034 Dhry/s
> 
> The calculated scaled results are:
> Cluster 0: 426.953226899238 (rounded to 427)
> Cluster 1: 1024
> 
> Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



