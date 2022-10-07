Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4835BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FC+6LQKfC9xt5gmV93NbwzXhUPmlNDu4mBYoiIe0VMM=; b=wMku6KaLClYACESFh6jYwLKWau
	7NQw+Jn3Q2f4GHBItfTYjOFsZP5AV5gUCnCVqYOO1fV7nA08xFb2GU9OI/DO9KdcEmYXlBScxO11Z
	E1Rvp89eFF8zakI/CdcMnDQz4IfyJ/qaZq31yQTZyQdJZ0+HmKrCEAWqyyiLu+iSkZAluBbMeesYH
	My2OkUwDGOeCJU3+hOJdXxyira29aQerr6s6TMzCFK0ZB/MX+R8ZPJ9ruvnS1LQ9CvQSGAFqUHL9p
	GH3qycckOu2ZSzZktt+osT6xe5nPcskDSNUDxnuevCyW3RCiTBNO630Nt9ESPx8QH1rCren+1G1y+
	kabQuOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj9l-008AFY-5S; Fri, 07 Oct 2022 08:56:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj9L-008A1M-8z; Fri, 07 Oct 2022 08:56:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CBA5660232B;
	Fri,  7 Oct 2022 09:56:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665132966;
	bh=rFxYZyUtvj4MLdJeshUQuH4lajevpz3SyEUSdmgqLIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=akWRnw9U+y68ThkuOQxMMw4GtD5nOi+fTgi0Ngd0w4BLy5sLx8oJmZAIgbDek2lpH
	 SVUjv95Cmn9Wt8NiEDz/VWMX4tXHG9kRBQEk02dmw/ayz4fmS9TSoXPXy9OxCiOxUG
	 0Wp/movsiX5hb863I6Xni1rgfrID4CC2aIoL8bCGd32aTCITZqPis8q2nhmHUlL03X
	 AKDp9YaHUIt85eoN4ngvwkw0+zD/80KcLO8900pKoSbQOXFcz4L/bnvDc7VjbHLopv
	 KdIZgTtrbsC+iG8mAvV+othEY0PFoFNCodVLNfUCQnGpLCY2eIaLCUR18ZJu49CXF3
	 lPDVbs9tq6/Uw==
Message-ID: <76dadecb-b396-a7bd-1dea-eb6cabc9647f@collabora.com>
Date: Fri, 7 Oct 2022 10:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/5] arm64: dts: mediatek: asurada: Add display
 regulators
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006212528.103790-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_015607_469927_5880F2C9 
X-CRM114-Status: GOOD (  10.06  )
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

Il 06/10/22 23:25, Nícolas F. R. A. Prado ha scritto:
> Add the regulators present on the Asurada platform that are used to
> power the internal and external displays.
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> Changes in v2:
> - Added missing vin-supply to regulators
> - Removed min/max-microvolt from regulators that are simple switches
> 


