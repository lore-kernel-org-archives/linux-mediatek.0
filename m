Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC01C77B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5njlobF3eeelykUr/A1hMXHVSfI+ZyWq2savRv42Yo=; b=2DIMhR9BczRNahno8ckUCvUgq/
	whB/jm7ur/+TMaYMf6rJBk5P4gQ18/tR/C5O+pbo7l8UGG9A/NbBajMnvEdI6aRJnfJbJs/SPf/Lk
	1GOrxSie/GkGNwoGK4VH8870InEKNIFby9uVd3wyS8NDjUmte2/PVXpOL/20KBusxQP5s3dTCfSUO
	dJM2lo2ToKd6BNwvbFM5ZMn8B9eRUekLYGatzLd0ZTOJnXaIGP2Tl6M2Xv1VHNfbEeQWLjbocr4rS
	389VT3SgvdTMAYFAAnK4NgHF5JuIxlkCWBVbRA6iW4WGn/9TFXvbUdCfxov5fOz0humamv1Gc7nN2
	EHAXqPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Kb-00Gs2m-22;
	Tue, 11 Apr 2023 08:26:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9KX-00GrzV-1R;
	Tue, 11 Apr 2023 08:26:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A64666031E2;
	Tue, 11 Apr 2023 09:26:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201580;
	bh=1EJIU+CRPpP1xKF3/p64yjfQTt6nYIObhWzz1RZ4Ikg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q2FF9hYg51YGmo61pOtWIJZZWjfwKpZVisempjxWqN40K87NBkF2URkZ+Jxc4VGXh
	 HXs8j+F2PUHvTDAju5jbaYTmHZbqHwMqGCFxS3gmzrebv8dz5bhlOyeCCNfhdBZBeF
	 dqQSJlxtdkhehdbJbPVhtrutqpxZUaZZ5bBQwL5rswyZFgM11IujBKStdoOadFQuMp
	 Q8bwTfOAiZY/DuDKn0BThodOXzG/Q3F7pxU6KvrDFwt5/hQLsOXRyIcQXiOy0I3xbP
	 z7YutKD+ppmiEgMJqeh7vtS0g8VnyGUhFd4eiDXQnkoIkvgAnf1ibaHe5/KCXx7V2x
	 4qa/d+Kecy8dw==
Message-ID: <449ba03e-4187-e3ae-06ee-a51810533d9e@collabora.com>
Date: Tue, 11 Apr 2023 10:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 3/7] arm64: dts: mediatek: add apu support for mt8365
 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
 <20230207-iommu-support-v3-3-97e19ad4e85d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v3-3-97e19ad4e85d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012621_609612_4DCF2962 
X-CRM114-Status: UNSURE (   9.08  )
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

Il 07/04/23 11:34, Alexandre Mergnat ha scritto:
> AI Processor Unit System (APUSYS) is a highly efficient computing unit
> system which is most suitable for AI/CV algorithms. It includes one
> programmable AI processor (Cadence VP6) for both AI and CV algorithms,
> and an eDMA engine for data movement between external DRAM and VP6
> internal memory.
> 
> For more detail, ask Mediatek for the MT8365 AIoT application processor
> functional specification.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



