Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A0FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e3F5D71cF/bG9VASeTMXoElF2aklDuCThZrSRDCupY=; b=d5qcy53uP6xr0A9PhMNcqwDNQw
	+YR2xdPOwsCWMF7USRB9ameCarzR+8t0rIeXnrXb/chLJ2w58zOg2vMAnY4zVUy/Gals9bS4awdRZ
	VThdTGf/KCKUs8Djm2E48M1MX0nhPO5qIKRWFdHUsUo8SYLD4s9IclXcaBsR6LIz1TFRAAhHBgAUM
	t76W3lk7suR4TQyQsbpcqrbgpXbWzXVBoBIpmU93tr1nJHT5ouBKppKiyE996+RHdbgDyICA4+12F
	uOOHGGRWylauYScxTHq2tozbDFBYVlG1yOg7NcPIQMw10EeY8UuUl+Egw6Af7V6IGY+BF3EO1qIDX
	/fKxLpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj9b-008A6O-BI; Fri, 07 Oct 2022 08:56:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj9I-008A0F-Qp; Fri, 07 Oct 2022 08:56:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 33E2A6602329;
	Fri,  7 Oct 2022 09:56:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665132962;
	bh=z2yoDJUQzSqyLq/HCRimKaAJVGrSi/DMVz+hMd0IFT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=klepZAq2fMI72AUgwsk46OGgVGu9kbEfpaqp5Ey6NRvxVkvR3YtwWj0ne70XK6FBG
	 95UmzYhSP5aOtbgLLJCqEXVxrGh4jWd17tB1HCsedMtwh17iO68MFIG4IeCrPE5SIB
	 bXKBNxzVNsPXBQIcLSG9f+a3IyWb76wmRwbB1khJbjQF7X0zctwcVPdVNJxQZcuAn4
	 6srNwS5E0yaVEQ/KTTxUAMPkesFm7AI0Tis4Da/qaFDbnGLZwjxwbQQh5vXd8g82kU
	 EwMu0rIDWqgXuIciHxIGIs1/Pevc0Z8grqlwyv9QaLltsecCOyM2YJmURXoAbMb4Yy
	 DxiGZY4k1FVeg==
Message-ID: <c88ccdd5-ff6a-1d16-03a2-fe8cb776f99d@collabora.com>
Date: Fri, 7 Oct 2022 10:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: asurada: Add aliases for i2c
 and mmc
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-6-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006212528.103790-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_015605_014120_C2337133 
X-CRM114-Status: UNSURE (   8.50  )
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

Il 06/10/22 23:25, Nícolas F. R. A. Prado ha scritto:
> Add aliases for the i2c and mmc nodes on the Asurada platform DT to
> ensure that we get stable ids for those devices on userspace.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



