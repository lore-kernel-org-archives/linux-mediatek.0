Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02663C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMYITQPLKDqV+G0I6L3lc0dSsfmLpOaJEJXMME+zBaw=; b=kyYXaQ/9f+qy6PynCx6hf1WFhs
	t7876w6vdAc7otVVGRKV4vz0jz9xkTn1hJBycGAxkY0SBsAkK7EJdNoEawuImXS760+SwcB4byZxm
	jU1s/7RRkqYhwejToH/mQA2LJGqbt+2/ZmnVmijdBuE4ULVCXKu2zo183M8ytMpM/Tle148csok6K
	JjbjyNO+tB/r+Xo3KvgMfSFSDH/p+MEhqBvxYEybgzFI2CfgHYN7QM5we22/2UY++F/TFyWm1T7DG
	Xpq/Ick9PYPgiCAnYJ3ZXmR76BaHRq2e1/NxbIAZm4qC3GpLSdKm2mHRl5h6gGAucnR7ZEzSvof5P
	N3cYAlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApoM-0008oW-CN; Mon, 11 Jul 2022 09:34:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApoA-0008co-Vw; Mon, 11 Jul 2022 09:34:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2123466017A6;
	Mon, 11 Jul 2022 10:34:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657532061;
	bh=Q8aXS7UAPdgDFOD5KMy8Y+lPX5el8z3AKk3/QrPYySU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AtWudmr9LZIkFa+8leH6uC+sN6AJCdvs4MfWhRxTqrlvkN3Mb4bldFyF6Qjg38G+Z
	 o8nmVmTlnQuEOehEi4YiB/5ysQvxGoDkZLKs+3l8k7WpM4qks1F8T1EikTiRkFE792
	 Y+AfNo0YyPSqHlGjfxd5CSBstPbJTEJTD99EDL9ZW2lKs/ik+L9JAL0BnIZp9mNLR8
	 SxmQgsOZPKw7Pio+BNIqEkxngpq6ayihUpW0ZuxBo0fQ+0kXb2Mh0VNJkiauwlegHZ
	 YVVoQ/dWpTSrqL75a6Zy3F9nseIjfaZzBpnb44O+c7Hx2hI10z89jM8YZDDd5WHL9x
	 m+7x/+70DCqVA==
Message-ID: <5a4e0bfe-e332-42af-5888-b59b3afff24d@collabora.com>
Date: Mon, 11 Jul 2022 11:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: mediatek: Add missing xHCI clocks for mt8192
 and mt8195
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220708194314.56922-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708194314.56922-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_023427_256987_EB0A5266 
X-CRM114-Status: GOOD (  15.22  )
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

Il 08/07/22 21:43, Nícolas F. R. A. Prado ha scritto:
> The MediaTek xHCI dt-binding expects a specific order for the clocks,
> but the mt8192 and mt8195 devicetrees were skipping some of the middle
> clocks. These clocks are wired to the controller hardware but aren't
> controllable.
> 
> Add the missing clocks as handles to fixed clocks, so that the clock
> order is respected and the dtbs_check warnings are gone.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> A previous attempt to solve this also made all clocks required and
> updated all MediaTek DTs using the xhci binding [1].
> 
> To avoid the DT change noise, the binding change is now being reverted
> [2] and only mt8192 and mt8195 DTs are updated in this commit to get rid
> of the warnings.
> 
> [1] https://lore.kernel.org/all/20220623193702.817996-4-nfraprado@collabora.com/
> [2] https://lore.kernel.org/all/20220708192605.43351-1-nfraprado@collabora.com
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi |  9 ++++++---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 18 ++++++++++++++----
>   2 files changed, 20 insertions(+), 7 deletions(-)

