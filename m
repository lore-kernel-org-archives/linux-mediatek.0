Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C259C47DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDhnj66Ip3nFPekOinF6//ytzTReqixTr3qlah8Aj9g=; b=FHDKl2sLTMp+KC2y4wC2z0UsA7
	jUr/+2DG1x2lxsEE/r6+S3VfrZMxTK57Wwq+FNLY3LoV5b05FF5QaACBb7gLhtNsqL9DcFRmGW2nV
	Ea0IEn0whFUw1iNZpVDrTfBzbegc4D1dvxzf3hzt493iq3T6YekV0hl50BEIhOdpBjjKIi0wy81m/
	WkImCTxBIOzRH+yA34qMQJwAA7EEyhnzTQwKU8DDTWXKzZwh/Gdh1WnwSDmRGBjnWkfd7zdIYwSuf
	8PQu45esvyMHWC2cVOKc9sDo8PlcO2ivzU9oNUMiUWuJm9GMGvI7+27Y+RkF53Ja6AlnMo8RzmuVC
	cAh3su/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPBF-0000000CHsM-3yuH;
	Mon, 29 Jan 2024 10:47:57 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPBC-0000000CHrS-2c0Q;
	Mon, 29 Jan 2024 10:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706525273;
	bh=8Au+/H7E9o8ti3xE3u2gCsCzYHjbfhoH5OhsSjspxj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0C0rvqiskSDGqyZG1knyWqrtpk+bGHC4dANO/XqqQ8pIbZK+5jHir+Fom/2ihzX2r
	 P2rr2NfMiZc/IO+YTd4qz7y4CmURH5LjUsD36HAHK1+WHqmwuSbWbjmh419yRsXmgk
	 xFKST7L1JsjYr+ypMyVV3h9I8jAE4EuAUvEeJ9u+3pmCLClBy/9VrNvfl1oqk1izAa
	 X+HF3L3lJLRVn609OYsayVO3DJrp9OdGVtLkFc6qIrnjW0+XZ8xnpz5YxPnm7NQSu8
	 3lWR+AQ0a3JDmJ8II7TEYDJzG56Q2dsSh591nfnGHBDDVFdxclKVAFKrigrZ2rpuuj
	 RROhr6N5EAeXQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A0793780C1F;
	Mon, 29 Jan 2024 10:47:52 +0000 (UTC)
Message-ID: <6f362f4c-7a84-4979-b507-2384363d63ef@collabora.com>
Date: Mon, 29 Jan 2024 11:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/6] video encoder on mt8186
Content-Language: en-US
To: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
 <170652472371.127352.1415914611175058375.b4-ty@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <170652472371.127352.1415914611175058375.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_024754_847480_AA31DE08 
X-CRM114-Status: GOOD (  11.45  )
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

Il 29/01/24 11:41, AngeloGioacchino Del Regno ha scritto:
> 
> On Thu, 28 Dec 2023 13:32:39 +0200, Eugen Hristev wrote:
>> This series adds support for the video encoder on mt8186.
>>
>> Few patches fix the binding, there is a patch for the DT node,
>> and one patch for the driver that fixes an imbalance.
>>
>> Changes in v3:
>> - removed the patch to add dma-ranges, because this was intentionally
>> removed (e.g. https://patchwork.kernel.org/project/linux-media/patch/20230303013842.23259-3-allen-kh.cheng@mediatek.com/ )
>> also removed dma-ranges and cells from the DT node
>>
>> [...]
> 
> Applied to v6.4-next/dts64, thanks!
> 

Sorry, typo: v6.8-next/dts64

> [2/6] dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
>        commit: b8248c4831787f0854e2e856fa83da68ad5afcde
> [3/6] arm64: dts: mediatek: mt8192: fix vencoder clock name
>        commit: 0157de54920b556d575ffc82ae5d16f2b4cb9494
> [4/6] dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
>        commit: 178eaba322868a75c2e0ad078fcf91c3a6f5abba
> [5/6] arm64: dts: mediatek: mt8186: fix VENC power domain clocks
>        commit: 2a08dba6bf6637295175f48ad870a24833955cd4
> [6/6] arm64: dts: mediatek: mt8186: Add venc node
>        commit: f971c7ee301bbd423e06f82bcae768223a4dd602
> 
> Best regards,



