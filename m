Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3753C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yN9hHGkNFpD247CfiZrTUgq+2mtk1hAUk9h5kqQis1E=; b=VjpcMxFmVRl6iqklm+xxz7A7fg
	Smakqq50Vjg8wIF2Th8RJIGLBIV1Zkjecz3tmwj4XhD99YWNzg6OzHCQPN5MsmH/CnpsR056CbJra
	FNi4TGsQpUj83iornmbTs7YbgxaaRlpJsi8SZNGhD8B82QhbnDBBkeb6LtEyR4F8jkmpULNLI8Z7a
	NLIFCbyD5Y3o9UH7BOgOxWDIlak/4Pp0HPPShbY0pYZy9BHZ1IZr7HoNlnL8Axzxh7UzLXzdBq1jF
	XYRvugcJur+/oGbbrWPO6KUTq4jlCEBfDeR45bULFlVDyrymen37yyqfMHgWpdyKXv+vr7fcGYi/m
	DSZ5BHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBUc-006omp-2d;
	Fri, 31 Mar 2023 09:56:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSi-006nXz-09;
	Fri, 31 Mar 2023 09:54:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 267DB6603193;
	Fri, 31 Mar 2023 10:54:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256462;
	bh=hEGzv+JDzU4d3qPPVBti2c7o58r62uco4cnG4Jtynz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PNiIx+mKXyz6mVbNAZJDKYBw5HQixbOLas+MABpHoGzWaiVRV94oIX+EQ3vJVUuKr
	 ctE9eSTH+5lhjkaPD8szE8iaAw6+K7FHRaO9hWi7dVw9gaCdJFqz7MjrQ0VNOHj65H
	 RBHVkx7YubsSfxqSG4+Uxf3gCCGTx6bpkCd8TNZLmMI44G9B9+10fcn11P1zxwkSm1
	 H7O/AJltRC6PmCCknm6e9V99Cus+uX2GsluJCIohelir/xoUI4OuPUB3hYAzfgiPzz
	 ZhOQnoBZabBTLdS+k2XmQs0ZfqHhrpsn9B4d5bMzxEjp4WVab0alh64YwFQg8HBMEw
	 gAaK1jB8/p/0Q==
Message-ID: <d590c78c-18db-3ad7-b769-c0545d70d545@collabora.com>
Date: Fri, 31 Mar 2023 11:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 11/19] clk: mediatek: Add MT8188 vdecsys clock support
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
 <20230331082131.12517-12-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-12-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025424_285195_D9C3C8FB 
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
> Add MT8188 vdec clock controllers which provide clock gate
> control for video decoder.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



