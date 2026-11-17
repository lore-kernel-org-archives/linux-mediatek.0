Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E85606A32F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iuzV2OFQ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g5Zst9//
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LFj3lXy8NNHrgy9P4EuYba2xkoAH+TOYY0+5Iczv/q8=; b=iuzV2OFQ7tCXWI
	tuA6q8lmgZfLFRpE5xxpuHGwztEIA/CFYcVf3+mzYnmtrHmc3SJh1TwIMeXQzPTCTbtIJ/ooSOKfG
	zxnVbuTQ1Fix0BrmjT2K4CTCRPDwzmKWBZxEpvFI16UGy4ZYLAy0OMvHIZxGMSrtAEGU0i184hEPh
	+xIb63sTkJ/+t/kLLnk6OeoaRavWmoe2xSt60JvvnAw/6xWOjryJGjYNFEthu7bGlti0/HBfmBRYz
	Cfxw+zbRa0/53izjkyyDW+sajZOa1E7ek8dzZak33gdsR32mZif0NSOq1hdsxrkWUngs4INUWEr8t
	ET0kXfI5DOAjjD0+Fdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHzI-00000005YRT-0bCN;
	Tue, 17 Nov 2026 12:08:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHyn-00000005YJ5-1uoG;
	Tue, 17 Nov 2026 12:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794917283;
	bh=qGJ17IHmxkOflCOJsC/QkOY+G2dnIFle6zJPxp+P/7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g5Zst9//jEGwPRI2YVRn13Ge4CrvbaNDygbVKekV3LEcFCHtNupowTPbIecPAePKM
	 zhNFpAjFJOOOCUoFV5dvjgYDgOmbcSrLROXZdi/gcOgujS3XxFXoC7YwkqP+IKXdqx
	 1R9e6RQCGFonunfgM/RicojeTaKvGIkScD4cBgcW9CgghkiILWL89MzeFBvQi1Ihxp
	 I9Gn1MRFjOSqS/hTCpoJLSlv3OY2wGeCBACLVD/llWvGnulPUZm0FCupxM3sz3EQwe
	 K0rLoXI+2M312jQ6LP2d2zStRgnbsL1GxW9HzjQjR+kO4Nz+jNmXL6IJo/gDPErav0
	 gBB8gzRb00kRg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9365A17E00E8;
	Tue, 17 Nov 2026 13:08:02 +0100 (CET)
Message-ID: <6935d7a4-2f91-4abf-81e9-f77c2b6c80d2@collabora.com>
Date: Tue, 17 Nov 2026 13:08:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin
 post-processing
To: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
 <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
 <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
 <k8LLawty9o68P00hLr5LO1163o_m16f_vf8fBZvdD18nOatszy1i4Dp7DeC8Hv2--Q08YyZfhCRnQbVDps0lqB2zZrx-k_GxKUaqj6eT6r4=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <k8LLawty9o68P00hLr5LO1163o_m16f_vf8fBZvdD18nOatszy1i4Dp7DeC8Hv2--Q08YyZfhCRnQbVDps0lqB2zZrx-k_GxKUaqj6eT6r4=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_040811_022079_F9AC981F 
X-CRM114-Status: GOOD (  20.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 13:02, Roman Vivchar wrote:
> Hi Angelo,
> 
> On Tuesday, November 17th, 2026 at 1:56 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
>>> From: Roman Vivchar <rva333@protonmail.com>
>>>
>>> MediaTek SoCs are often released under the same marketing name, but with
>>> different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
>>> mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
>>>
>>> Since the speedbin is stored as a number in the efuse, add support for
>>> converting it to the bitmask for opp-supported-hw usage in the DT.
>>>
>>> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>>> ---
>>>    drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
>>> index 980c29d01337..d2e5c69c580e 100644
>>> --- a/drivers/nvmem/mtk-efuse.c
>>> +++ b/drivers/nvmem/mtk-efuse.c
>>> @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
>>>    	return 0;
>>>    }
>>>
>>> +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int index,
>>> +				     unsigned int offset, void *data, size_t bytes)
>>
>> You can *literally* reuse mtk_efuse_gpu_speedbin_pp....
> 
> No, I can't. On later SoCs CPU speedbin has different encoding.
> For example, on mt6768 it can be stored in either low or high 4 bits.

That's the part where you pass the right nbits in devicetree for the speedbin cell,
being it still 4 bits, that statement doesn't change the outcome.

> This is out of scope for this series, but I'd like if we kept this
> callback for the future SoCs.

All that the logic of your mtk_efuse_cpu_speedbin_pp is doing is assigning

BIT(val[0])

to val[0].

All that the logic of mtk_efuse_gpu_speedbin_pp is doing is assigning

BIT(val[0])

to val[0].

To me, that looks code duplication, and duplication is bad.

> 
>>
>>> +{
>>> +	u8 *val = data;
>>> +
>>> +	if (val[0] >= 8)
>>> +		return -EINVAL;
>>> +
>>> +	val[0] = BIT(val[0]);
>>> +	return 0;
>>> +}
>>> +
>>>    static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>>>    					 struct nvmem_cell_info *cell)
>>>    {
>>> @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>>>    	if (cell->nbits <= 3 &&
>>>    	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
>>>    		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
>>> +
>>> +	/*
>>> +	 * On mobile SoCs, the CPU speedbin is a number. Convert it to
>>
>> Other SoCs have got the same efuse style as mobile SoCs: anyway, all MediaTek
>> SoCs (apart from networking ones) are (in a way or another) variants of the
>> mobile ones.
> 
> They're not really variants, some of them have no direct mt81xx/83xx sibling.
> 
Noone looked hard to find the siblings for some of them - though there might be
one (and just one) that has no sibling :-)

Regards,
Angelo

