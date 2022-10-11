Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF58C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwQVA3BL+rWlZOKPhb00MxpLTh5OUaHx557/3ki8i6o=; b=0Ld5VwfjfzNvFmzgpoPs23mNIJ
	alplVnrxNJRNUxmx2CPGlbOjBbS8eUJiR9OJcG6GlWkZphjBPZ/JPVM/JHMvXD2Eniu9gaZi1v0MK
	ig5/U4qBwyMC1LLbWz0TOzqcJeFcJjHkeRbFShbOzlToN6lWEKgzodA7Jy9uij0SoNuF9PsFw9Rrn
	K0011ETAhTZ8WJNpv30IZsAqqvKicWWxZcjouCWDiqoeMRzn3HT9B5PCpzISB5JH0ryiQPvQw6oWc
	kasdO6ydALonR8KbUVmTU1inrQWai9Jt0WLPGOc5PvwF1rdrrwQpYgU1Xvnvq8uaNmJgwqv0zpFt1
	xWGfwoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC0H-003u0D-Ij; Tue, 11 Oct 2022 09:56:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC06-003txD-FX; Tue, 11 Oct 2022 09:56:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F0C06601A43;
	Tue, 11 Oct 2022 10:56:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665482197;
	bh=Xu2VCk2uAhL/DhGGzHU1QNehUzJBsh9zGNcWOoQ33c8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aFMnE/IbYWGBPqrt4Eps9/ijTU5QsllXA1YwmcefHHWxr5kfmpDR+2QOMGgfmCQAh
	 lMw1pg3OvQcmBKjTypQkHfpwKqrupGlXcKzvA9ooe+gmEQs/5oCCJ82qXqJBTNCkn6
	 njrlP4RwkF+4/KstTcCoQ2LDH0ugN7Le5tqaazV80xeVmdSAE9BWNn85zTnVxBOmzE
	 QIsAD7V1T/LR67uWKmA1DjzFtQLucXteJcHus0C4HicWAxf5Kv8BNbDTe8FeIxXhrV
	 D5icW9IDwfLfU7qsLv5zVsyTSriEN9A9Ni9ixN5HNWXwWFnuO4tgIHoeye5oCXhWQY
	 aNo4rSAgTcdAg==
Message-ID: <5cda96ee-fca5-8b0b-8f38-dcff9a970cf5@collabora.com>
Date: Tue, 11 Oct 2022 11:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/3] dt-bindings: iommu: mediatek: add binding
 documentation for MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-mediatek@lists.infradead.org
References: <20221001-iommu-support-v3-0-c7b3059b0d16@baylibre.com>
 <20221001-iommu-support-v3-1-c7b3059b0d16@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221001-iommu-support-v3-1-c7b3059b0d16@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_025638_678745_A1D45ABF 
X-CRM114-Status: UNSURE (   8.00  )
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

Il 10/10/22 14:54, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add IOMMU binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



