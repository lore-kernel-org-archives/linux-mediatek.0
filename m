Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEB5C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Fm+NLvT+TCdHe6ozx4fjIKLBXM6oVkJk5kZy+5K90Q=; b=rWB87wl5ZHTBcRgohWdJ3wEhPZ
	D0MNuy1OMKce2gBFvCmc9NAV5t6Guje4bsvLd2U+v7v6kTf14A8X5Px/7G+fStM4SQbaX9xioN6r0
	XdCZEUywT7n+aZceZn/w0NOvCGDdIeY3Ju8GuIu5Z//CC4jGdzhv6Lq0uQ0IjetR+MrHKZJeKu0iv
	UmRtrE3izqR6GnjMbzuvMaW4QACMQUBfPASIoMpbmx5ARmigPef54PUWFq/rXB/lSDqRYsoN7eHVM
	QG1L1aCef5v+WH+Pby6UMCB+7koT0WJddygZYmYL2ZPQgttLA2ra4rfQjnGhqTM55a7CISZQV7W6i
	XK/373MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU6h-00H6V2-I0; Tue, 07 Mar 2023 09:59:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU3k-00H55B-T1; Tue, 07 Mar 2023 09:56:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1524D66018CA;
	Tue,  7 Mar 2023 09:56:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678182999;
	bh=b2sW59AfaGFgFUY1ZzjTm6KZ66xi/bkthdwC/r+4TgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LJxMvDvw6Q83K+ttDjzaDidUrhIXIZx+I98if6nPAtt4g6mQCFgOVenRXYHxce70M
	 67XrHxS+XgTAN5WD1IsqbuC8VE0QJWcNQDfBAYbcMQ+6De/Rtijk5uN6v2X8Wfp8eq
	 PncHZ6GVV3tgwpc5Ng+Hdvhrg+B4r/kwJuSnkD/fKgEeREj2g/SavYamspcy2n+RUU
	 AisM8yrgNrCJLUvVRnTTISHlXA68st2K3KUrkNNsOu5BGY0QKljeMKDNN+EabQ5yK5
	 nZOn3tKpQtOx4ZbnM5C6FH5av8/Kkc7Mjhkf4ARmofNjomCzaxxwBkFAy9oekokfwI
	 8q2PjlQJqqxJg==
Message-ID: <7e5aac3a-8edc-fd90-666b-0649182ad8a5@collabora.com>
Date: Tue, 7 Mar 2023 10:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 7/7] iommu/mediatek: mt8188: Add iova_region_larb_msk
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com,
 youlin.pei@mediatek.com
References: <20230307080555.14399-1-yong.wu@mediatek.com>
 <20230307080555.14399-8-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307080555.14399-8-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015641_131250_69E9A9A8 
X-CRM114-Status: UNSURE (   8.94  )
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

Il 07/03/23 09:05, Yong Wu ha scritto:
> Add iova_region_larb_msk for mt8188. We separate the 16GB iova regions
> by each device's larbid/portid.
> Refer to include/dt-bindings/memory/mediatek,mt8188-memory-port.h
> 
> Note: larb19(21) as commented in that h above, it means larb19 while its SW
> index is 21.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Please clarify the commit description:

"larb19(21) as commented in that h above" => "As commented in the code, larb19(21)
means .."

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


