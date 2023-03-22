Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1455C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCpbJJa/3YWythHIeMEMRIxdl4fiLuWiHN0nIR7uJkE=; b=eVcUNj/e598AVzVtCIOiq7uaMj
	Y0sDQwgG2nRddclCdpwQfk3ng+PvMS/AgBqHH3MpnyNVz6gi0yehJMucH9DLLimnsUGzktcec8gI2
	ZsE659/RvHk1axeaxXOrZn3rw85xcmEcqq1K38Q8giRPiBWV0hBksy7rtJHMMpoEnrTUn7H/QpUK8
	eIDDWjWiPr6t+tjNkFWuQLlkSR0OaDTjH6q0Wqnhl5aEfIUYG6ONynep5gwoRPNug88psV6z/WrC6
	AZRLE1lPUe4SjSWy73uMRPcSexEjPxcPcGcm9pWonqPLr4iCkwuR4UN3k7LnbaN4+UeJbcxxtHe2c
	/O2DGO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peukp-00FPNv-2c;
	Wed, 22 Mar 2023 09:27:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peukk-00FPLL-0g;
	Wed, 22 Mar 2023 09:27:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 286D566030E5;
	Wed, 22 Mar 2023 09:27:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679477248;
	bh=tm5AC8oAxj/BLJH6P7jdDgG/1QqkIQicoTd5DZz6WME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MgA/2lFUfyd5k/VBWnuu40eTYWS2U1TrrofgOMA0I9jVpdy3eEamqWcf4tagLMjHR
	 EYG/Dt6rR/CXT5QPXB2XGairw7NZ2vJCFTiZN697ZjU9mBhuR+1jIwTZefhoaLWlDK
	 IioRzVI4LUF9Xb0aUoln0A4Wfn4KFUNMQOdmen5CL1mdqaxXlr70en5Rgjk8S++LDi
	 Q0rUGgJJ5+ebU1NWOdfgRTaiSLobW7Zl4UsgTdJ6LMafovrR9E9Y/VTbCenyiGT6Mh
	 rAtqlpa++uhnmOtjEPtFRybdL2w7YOFX7V0OGBtvN5z6PXidEdYSooaBfd+nwFBCUM
	 cDXjooq2zQlDw==
Message-ID: <7b9b09fe-1049-26b6-7bec-0051e7304b5b@collabora.com>
Date: Wed, 22 Mar 2023 10:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/2] dt-bindings: reset: mt8188: Add reset control for
 DSI0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230322032202.12598-1-shawn.sung@mediatek.com>
 <20230322032202.12598-2-shawn.sung@mediatek.com>
 <83eb4c5c-b4ea-1fee-7212-c88821b90771@linaro.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <83eb4c5c-b4ea-1fee-7212-c88821b90771@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_022731_833202_98A37B7B 
X-CRM114-Status: GOOD (  12.47  )
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

Il 22/03/23 09:34, Krzysztof Kozlowski ha scritto:
> On 22/03/2023 04:22, Shawn Sung wrote:
>> Add reset control for DSI0.
>>
>> Signed-off-by: Shawn Sung <shawn.sung@mediatek.com>
>> ---
>>   include/dt-bindings/reset/mt8188-resets.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
>> index 377cdfda82a9..5c9e74130ef0 100644
>> --- a/include/dt-bindings/reset/mt8188-resets.h
>> +++ b/include/dt-bindings/reset/mt8188-resets.h
>> @@ -33,4 +33,7 @@
>>
>>   #define MT8188_TOPRGU_SW_RST_NUM               24
>>
>> +/* VDOSYS0 */
>> +#define MT8188_VDO0_RST_DSI0                   21
> 
> Why this is not 0? IDs start from 0.
> 

Because mtk-mmsys needs to be fixed, bindings IDs are *again* 1:1 with HW bits,
there's no mapping like the one that was "recently" done in clk/mediatek resets.

Since VDO0/1 have got lots of holes in reset bit mapping, it's definitely time
to fix this situation now.....

Shawn, please fix.
For your reference, look at [1] and [2].

[1]: https://lore.kernel.org/all/20220523060056.24396-9-rex-bc.chen@mediatek.com/
[2]: https://lore.kernel.org/all/20220523060056.24396-15-rex-bc.chen@mediatek.com/

Regards,
Angelo


> 


