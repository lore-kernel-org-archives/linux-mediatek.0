Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F7FCCA47B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9QmThtu4go9HzihM4m1+h31nGqN0rJgERCEcMmjwdk=; b=EHXpcbMLul1b5S
	UwsBiFiPCN/2DZTWZxpUDu9kwjzsIV33S/sh18aJX1jNsoF1PGbwnhnDc2Yrx4ThhLbTdpBV/E7M+
	JF1vaHcdgz2mcFLF0XMTGYpUo5M/KFm1CxkDoMhH0l9arlrJjx1IV2EzOZNn+yvksnbH1be8J8AEs
	lBeq89hmitReSjfYkngj/pz2Woo1ygWClwFyohzjH3f7Sn3RcuunEG4oIhHkgvZStmgLo+XF7Pb51
	HIyK5xX6S+UUWIFgBX+doIGWErZ52p8atHRir58LJYPwOycxIzgxt29Ixs0tmWGwq+9CeM3yUooqT
	zTw3zrW1WYn6crT4rcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fCr-002CPc-Pn; Mon, 13 Jun 2022 08:13:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fCL-002C4J-Ks; Mon, 13 Jun 2022 08:13:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B924660163F;
	Mon, 13 Jun 2022 09:13:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655107997;
	bh=nngcLlLkWokhulYNje5MIUVohalGmGQRGzNdGDIqhOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oUJLCpDwf6d8vCEwFuLYeiFLaqPJ3EL68/bcBr6sbAbGzc+N/DXSCCdHMIGrwe9ml
	 bN1WxFu0/szl4ZkMs77VDe868k+7i2zq94TTq/sYBpB+AZLVdeyxCfWdHoRSvXvqfw
	 78roJdyviEA8KQtMfXF3SN579GsYRv8qwbkHmrHXAFURrEC44PsMKIdobYnmyq9bLx
	 PgY6B9oTiBQclhsLYbiZM1R55H+F7GMMsgy76kt8n5wNyz91LluFdLVpUH0HnoeQQe
	 6Sb0GPrzbO1qFd5SeZVpBoCwqnt5uJOWy6RFQdX0NkmV2fN4m1diJhIc7Wzroyef2H
	 PcqPencC5Of5g==
Message-ID: <80c7fa61-e25a-fc45-bdcb-60ac3796b96e@collabora.com>
Date: Mon, 13 Jun 2022 10:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 6/6] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to pericfg
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
 <20220609100802.54513-7-angelogioacchino.delregno@collabora.com>
 <db422fe4d0b5391ee2aacae989d7e48209e1095f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <db422fe4d0b5391ee2aacae989d7e48209e1095f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_011321_969545_09E3B830 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/06/22 07:32, Yong Wu ha scritto:
> On Thu, 2022-06-09 at 12:08 +0200, AngeloGioacchino Del Regno wrote:
>> On some SoCs (of which only MT8195 is supported at the time of
>> writing),
>> the "R" and "W" (I/O) enable bits for the IOMMUs are in the
>> pericfg_ao
>> register space and not in the IOMMU space: as it happened already
>> with
>> infracfg, it is expected that this list will grow.
> 
> Currently I don't see the list will grow. As commented before, In the
> lastest SoC, The IOMMU enable bits for IOMMU will be in ATF, rather
> than in this pericfg register region. In this case, Is this patch
> unnecessary? or we could add this patch when there are 2 SoCs use this
> setting at least?  what's your opinion?
> 

Perhaps I've misunderstood... besides, can you please check if there's any
other SoC (not just chromebooks, also smartphone SoCs) that need this logic?

Thanks,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
