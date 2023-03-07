Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F96C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYmJDHUqmbnQAT0dQTF9YTpjiFP7U+8z8HHtvptj84s=; b=ZLh7nW9Xe9TF2EM9BlSL6IEmr5
	96042WA/Jz+DHJyjohNSnGcAuNzmGZ5iAZHs8i7poOy4ffc+hqkH7iV6Weu+e2xl41sAJakR8YVGA
	9VL8EgF1zPndfecOLBENAG5M6E/NNUoX2iU2DT6AA7ASB6G4dKKYg1hUAQfEOkohlx6xMddnjjh7E
	n/X9JEUj9Y+UCiCAYiXmgSS75q4WHoRjrkzmEKASZk0dFQ3cL1o409Uc5ZvUjsu5jDClJ8yIOWmNa
	jhAEUCRZjqLH1D1Zy+yo04RHKTkh0mHFbZMpoXAtvf1uvSOBQBfG3DED3G7rkbj+FTBqod+yGA3HD
	1FJ9+esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTyu-00H2i4-LO; Tue, 07 Mar 2023 09:51:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTyk-00H2dh-0E; Tue, 07 Mar 2023 09:51:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C39856602FE5;
	Tue,  7 Mar 2023 09:51:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678182688;
	bh=vkkFYd3loRrOSSOnY088flgwXtY2fsz3MI2px8MiqHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FvjkZSoKncFHS3NEPw0+fU1qd1+2i3EiXrC6U9A1GQ+9sb9zw2STaKQRZaLD63ii0
	 Zff6jfIyfc7M3vzAkM0UtGpuFYeDkRWxH6Dn8UwkRadngbfhh0sxFJK9gWWURrp7Ws
	 5hOABq0FmfjP1t19KBgpd5Eym35qs3J9xT9zJSgvKwztrdQQTAKn6u2NDA1tuuea3G
	 x/g55xmr8/N9BgmPqUZOpE9AZ/r/wsbrSPRr+qt6TlwI8IvdTtiY/jcn28jX3At/zS
	 6euu71DP9uXJuT3uKiN2VHx3s+tJhKwQjVu6KFZ7fomQeQugkXe2RLr738NfeV36EX
	 s1C1e7kFrsVQA==
Message-ID: <d74bbde8-c419-c906-2df3-7bc31fc6563c@collabora.com>
Date: Tue, 7 Mar 2023 10:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/7] dt-bindings: mediatek: mt8188: Add binding for MM
 & INFRA IOMMU
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
 youlin.pei@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230307080555.14399-1-yong.wu@mediatek.com>
 <20230307080555.14399-2-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307080555.14399-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015130_200315_81935F8A 
X-CRM114-Status: GOOD (  14.00  )
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
> From: "Chengci.Xu" <chengci.xu@mediatek.com>
> 
> Add descriptions for mt8188 IOMMU which also use ARM Short-Descriptor
> translation table format.
> 
> In mt8188, there are two smi-common HW and IOMMU, one is for vdo(video
> output), the other is for vpp(video processing pipe). They connects
> with different smi-larbs, then some setting(larbid_remap) is different.
> Differentiate them with the compatible string.
> 
> Something like this:
> 
>    IOMMU(VDO)          IOMMU(VPP)
>        |                   |
> SMI_COMMON_VDO      SMI_COMMON_VPP
> 
> ---------------     ----------------
>    |     |    ...      |     |    ...
> larb0 larb2  ...    larb1 larb3  ...
> 
> We also have an IOMMU that is for infra master like PCIe.
> And infra master don't have the larb and ports.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Yong, if you're sending someone else's patch, you have to add your own signoff tag,
otherwise it's not going to be accepted.

With that fixed:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



