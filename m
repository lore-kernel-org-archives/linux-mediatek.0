Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7671CC7618B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAzgTAEIXXRPD2F5Qeu007nWdaJgMCWllUBT8+ELEVg=; b=Qc95GMFIDtYl3oyqt2jaEjtvPd
	lRkGdHXTvaqLnsOq/8mrQjMkSh1ntrKwNbZoE8NG7Z5yJTOHsM+uBw23G6kADysgmD4SD9qng30lK
	vzn5G865gtOYf93/IoYknNuqeerwCc+Q4jB+VMmEdrO36PC45q2pCpne1W7AeKUl4K4tg6MSUb0XO
	HqQwpmsQ4GjL8Cwo8MiE+seTra3Tu408NS8K+JklGWtMjkkTN/WXMQ/u/NCa5ac/RKqUbDXvoI+56
	gvX+palOyDCd+3xgxKqn8TbYwKzKVtGHw/Gu0aIjL5vptyfRcgJyOutDZuQQtv6iizZQYi0sgQqV+
	ZlVCVE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6V6-001kuf-2W;
	Fri, 17 Mar 2023 09:35:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6V2-001ktN-0j;
	Fri, 17 Mar 2023 09:35:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 35953660309E;
	Fri, 17 Mar 2023 09:35:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679045747;
	bh=nOzJwrg70k6TQ8N3v6z0ztOceAdYD1WfNSV65qWEcis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AztsVHJmKtbFxgdhXMu7cSIc+B5KBsDEzl2QrT0s7ZjZPj7mtQWs48nFiOJzqLU/s
	 11wkGp5L/cJ97/BE5tpA3mP9lYiwMIRzoRK3pg+0yl8+6HyJnhXhlfU/UlzzZYv9p7
	 L2tKh894VGTlSXxva12+UvKmH8Uzha5JoN/s6mGddh9kGhUMhCiyQpdCx4KxL5bZRZ
	 DaQY73lZHJjd8QhitLqBR1FQihBHYEoxOfOwjsZo34OhIAdnn//EnIZje/vsHYu00f
	 fTRpfAdpLUuwS2+30M6it+OOQ6gxSTGvdXEtHIVg61ygzYVCeeG2Y8wVSVX5+RdK3q
	 wqgzkHlPGLU+A==
Message-ID: <d931a368-b379-3dfa-8140-f9cb5ac74c0f@collabora.com>
Date: Fri, 17 Mar 2023 10:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 4/7] iommu/mediatek: Add enable IOMMU SMC command for
 INFRA masters
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230317085541.20447-1-yong.wu@mediatek.com>
 <20230317085541.20447-5-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317085541.20447-5-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_023548_409241_F52A7AC4 
X-CRM114-Status: UNSURE (   7.87  )
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

Il 17/03/23 09:55, Yong Wu ha scritto:
> From: "Chengci.Xu" <chengci.xu@mediatek.com>
> 
> Prepare for MT8188. In MT8188, the register which enables IOMMU for
> INFRA masters are in the secure world for security concerns, therefore we
> add a SMC command for INFRA masters to enable IOMMU in ATF.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



