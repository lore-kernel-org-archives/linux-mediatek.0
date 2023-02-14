Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D4C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPHxS6Gt9CRpdqgfrSxThlEc47Gdj72BiMEo3RCEil0=; b=GdwEKAdVXcXbMuzjUocHQiwhmB
	5eM5Dprr/ug/Lo94hhzKQX7smxi/lLmUx1EtWhjHtb0oFqmrBHnk2j5ABEgx2TPryteITyW/ZJeCY
	ts5CxtG2aAQ8StIhuIq4vOBPGmewgjFP5bZVbIgcr+1aTKjvO3fT6/8sl9aUaYVOLXWl0wcqtThSB
	/1zPp/SWApFdKSLFVT3AlqaxS9TExRl9vLAVmwrEqsd2F+Qsaz+lTxk5jDf9tstNgZuiuUDDxD/aC
	vSJsUVnf4PYOaL8P3Z2ln/BpGlZEMuAHjjjBUZcuFg2OHAsza+b9F/kzIyeYW9hPtZB9dWSmpK/5g
	I2lijVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs2P-000pXU-3E; Tue, 14 Feb 2023 09:55:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs2F-000pUb-Fc; Tue, 14 Feb 2023 09:55:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B28E8660216A;
	Tue, 14 Feb 2023 09:55:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676368538;
	bh=GPjPDcw1DbLNEhZjsESUC0x1/RTrz5my5LsVvj59CxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WKwDiZfZDreJQUUcDZVtXsHfDDDLyl4UY9y5+xPfwoy1SISoTcKrDPhBym55Bcxx5
	 l/NEVmt5QUxTz+rQieXWPq0PIOLKzLoyXH9eZP6Kt3dF6udQc8jaQC7ognMDzA9j+7
	 Gm4I4LdqadFRsS2EHDa5H5bP0acoBppYfrf3R3FYVCYEHtCoQt0VP3TKSj+oejLUvh
	 ekDYMFfeEhZWh8YKfV5AaHlxg4M0wygu/UbdszAaOU1F9+0gKHX15r8DGX87/JaPKI
	 MNT1y1sdhN6wRZFjT6s3HkJO5TAmaZ7dhlF0atET7citXogkyWw3Ol9VnHECD/Cw1Q
	 ozGbkXm89CUhw==
Message-ID: <5f66275f-5440-38ee-60e7-3b4ea276aae7@collabora.com>
Date: Tue, 14 Feb 2023 10:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 08/11] iommu/mediatek: Add a gap for the iova regions
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230214031114.926-1-yong.wu@mediatek.com>
 <20230214031114.926-9-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214031114.926-9-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_015539_680126_7529E2A7 
X-CRM114-Status: GOOD (  12.40  )
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

Il 14/02/23 04:11, Yong Wu ha scritto:
> As the removed property in the vcodec dt-binding, the property is:
> dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> 
> The length is 0xfff0_0000 rather than 0x1_0000_0000, this means it
> requires 1M as a gap. This is because the end address for some vcodec
> HW is (address + size). If the size is 4G, the end address may be
> 0x2_0000_0000, and the width for vcodec register only is 32, then the
> HW may get the ZERO address.
> 
> Currently the consumer's dma-ranges property doesn't work, IOMMU
> has to consider this case. Add a bigger gap(8M) for all the regions
> to avoid it.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



