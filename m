Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40259C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYQLsdy+QbfplWqoKg59FYGgXWIim/p0GvNKmnJsekk=; b=kd8LRlgx5vjmJr12pICO4HqPjv
	X2kqbsiiNFO7bohvfF5ndRiGqS+0N0hMb8Jzos9tJtoqfjkY5zsjv4cGmvPOm3MVcJXwhTMx5P5BC
	h8UefPFfBwLF2ImS+imnzRytSsToCsvgnx4q4Uk3OWLF0T6HuBwN8l0qbgqFmNAgJ/PAvpNvlzO0D
	icO2Ts+e4CY+6ziNj9eOdnW6Fh3381dfmJexkpYaPR+7wQhKM1rnuaxAQ3pZ4ivkbhTe4reXzJkfp
	cAWr8b7CTE629rVXkoFAU0n4A27EYxA6sruraXUfpoT/8kIoYtJNvvMTjaQEP7AVQnahH4FbM3Ffu
	Wrpzcwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6ub-001pTI-2Y;
	Fri, 17 Mar 2023 10:02:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6uY-001pRb-10;
	Fri, 17 Mar 2023 10:02:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6AAF6660309E;
	Fri, 17 Mar 2023 10:02:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679047329;
	bh=TMHaDRJxVsbdEfgdoNDcUPXT2v6iasHxnqvCenh9+X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nRxass+X8shswNMfVMRW/AmV5JHvJisYGFQf5YbGjCAd9oBrSiE5/xYPt+JpDxv4C
	 V4OVbjdOlo0uUaevwmu7gF6WZaXY1vMv1wt5Xdf4Ghbo2Qlq8d3A4EZyDGs6s7n+GE
	 X8pyP+uVkYvembkADaDvzVSM0V2SbURmCpcX0LEcqed4xOQWeH4OHH0BWrsZBmSEJU
	 N08TPchsnVMLlia2J+UAz2h+Jkn0CjgDozzA9VqlC4WeHcMDqntjl8xUBwJoWo8pzg
	 LJHAldj2+Ggm6Mp/h05j08JF7ZgfzEI+Ry9aDdtArT09k0nrNb7LDeax4zDppMikPq
	 iGPLaQSXji0Vw==
Message-ID: <58bcc0b7-331b-1670-2702-3e04f5565a56@collabora.com>
Date: Fri, 17 Mar 2023 11:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 4/7] arm64: dts: mediatek: mt8186: Add ADSP node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
 <20230317060917.15175-5-allen-kh.cheng@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317060917.15175-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_030210_481150_9449450F 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 17/03/23 07:09, Allen-KH Cheng ha scritto:
> Add ADSP node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



