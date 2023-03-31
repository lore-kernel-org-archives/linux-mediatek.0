Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3702C77B6D
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gXwhUMy0y2+2yxPxkMFwxn/r+AVs1sHUXeEJCsGo+o=; b=4vgQ814CePlYj5QmEJdIILhxru
	SD7yEZfR02bMgUV9aD+S920FyuXNEvVxKgub8au2NkV9lJXYBZ1CR2VSPuPXWuPY4fBpzB2ZK9pq7
	O0RF0kuPmodq5EM5wJXlhKM870fPHyHrlr8HLp3m4wJzSclpxjSI0vGm0dtsvybVBXYvqu654Bzb2
	feBmK2WFLdaUSj07extH2/yEAX/KuEh7tOd4pzWzGfMH0Mx/YQ43BuZgSpssjwvKATEOkBNZuhjnO
	R2zJ0LwpAvMHdiBZlwPCG7NYh9BYKN0Nw2H4bW/4CWD5d4DRMvxyjtxeDNVMVmGTL11g2MA7LfSk3
	zKnjm9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBUL-006oYF-2M;
	Fri, 31 Mar 2023 09:56:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSZ-006nT3-2T;
	Fri, 31 Mar 2023 09:54:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D08E76603192;
	Fri, 31 Mar 2023 10:54:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256454;
	bh=PAGKONaTKq1YnfYU2EzRPSSilHlW2Eco8hII04P2OcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X6FQzA8zmjv+DogaO0Yjbyn3vRlk1A8D3P3TJhbCW9ciy3XrNnmjz+ROB4dJHz3AP
	 i8yjrxm3nyXr51tKtpQFGi3lej+05dq+878avx7VW/lzAVJBv/xkinqo9ZJPxzkECN
	 2JVTKzOVaJQtfPf7V/q108K6q44EyfFkHwVq9RiGAbBl/kQSbE8+VQbXZF7xFHNCA6
	 JtH2qSOEwslzciKvfgDORZR1RTwBkAC3HDhhEuN2bxSTIgU/drtjpzBaSqGurJkH28
	 jO8gLYE32o1sJfYFh7f7NoxZUckFr0CD4oMG9HkMt+Tu6AF6IIDu0DBrRM3Pxzpeaw
	 m9/gtiFzOCPEw==
Message-ID: <ee1085ba-a596-159a-2be4-7b81eb4fa4e0@collabora.com>
Date: Fri, 31 Mar 2023 11:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 13/19] clk: mediatek: Add MT8188 vdosys1 clock support
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
 <20230331082131.12517-14-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-14-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025416_098071_961559C5 
X-CRM114-Status: UNSURE (   8.36  )
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
> Add MT8188 vdosys1 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



