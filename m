Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB259C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzJAUCZ6cxLrmbrtWQpROUkZsp4GEMuB07PexleiZ+w=; b=BkPIYWVTLhOp9gLYICLnjqt2Io
	K5c4zPZGvqUTHwI5bEugx4m+yhuQjZNNl5nK+jEugjbz79Osf1n417jVKlmwPT182fskft89BpI/R
	1U36Lq7g81XMGuvn+EsLUWdIh1SPHZUQDEfCiprIkPc/E+4JFw4jD5vwtRMOMu/796nBXVOuyR+HA
	eYvV24KCxjgGLXsL5V0wmINSCV5M8fPnzUvjKhxmt9CQnxc0fi/X7n9O57pfgVxbD8msLQlmWhOFs
	WedgvYbILI8RPM72mAEyHc48sulmVVOoh/Fq5datxY7jBu6ELjyVXOi0eG8ik1XIBm4wfHy4xcyZQ
	c2QisiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5Kw-00APOh-2P;
	Tue, 14 Mar 2023 14:09:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5Ku-00APKo-1h
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Mar 2023 14:09:09 +0000
Received: by mail-ed1-x52f.google.com with SMTP id ek18so31401523edb.6
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Mar 2023 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678802939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzJAUCZ6cxLrmbrtWQpROUkZsp4GEMuB07PexleiZ+w=;
        b=XWYGpCXsXZSlzHoyVy0l5aiph3FOO2/v3CYmo3g2Q6Y8p9WODnROgeWPRB5msTBbwo
         7l3tqUWOjzgqts93xe51UgHj5V8paUByMG2sa5LGco51hN5okT/iWqxklrtCwG1riHhc
         3MB+mkutYvDHWdjhcPs3ly350WIiGXC3lDrE7poc+bBNajIbhM+sJ8hiWZW808Omn0lU
         P6F7w1GsdIwRxU/8jTii8fyE/wvXgit0oCCGkjYGf+ha0qAJnVSnubn3Jd6Fi27kI8DL
         rPsX+XA/nChlURMKCHsIUW/eLGf782bfXH+Iot8jOvHbbOkTi0jqXfSITCHp4OgMWKha
         dkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678802939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzJAUCZ6cxLrmbrtWQpROUkZsp4GEMuB07PexleiZ+w=;
        b=m7kA0eeFhuhuPOX30IvTZ9Nl7N0J6sdkzOkmlxxhMStPoVDoKnptL0NdNf5ImHe/5s
         +qtmGvMEBHRolDimcuUQDJtuqEO3rT7nYw+kivvdxt6ip+RE58hfZQqBw3gbDTOsvmv/
         u+IGFr3L1q2Bx2TMYWrqx5mC38qNToLknflPIPGFPY6pFvMIMr7rdJy07WhOUTDSkJny
         sbd2pKoPW73OEE5FLgoCfLFsuoSLuK4+nn4PQSyTxhR0AW71wh9FmEN0YaijA/cqRqWc
         ixfbxrklBWURLJi6MmY3prSRMZCw+U417eP/OGmN3eR8Rt9D38m9o0czz6so6S5GI1Vz
         5Kbg==
X-Gm-Message-State: AO0yUKV55T7SvpiQlPGKow/3JfrWHDEGlieGTp8RUDv4FektgSbmvPTE
	WyDlV71/3nI/tRcBa05Q3s50fc9GpP9KiRy9pCI=
X-Google-Smtp-Source: AK7set9aDeRx5ilJ6vQTpGKrxu3nveAK78en09LF2SpzRa5pCE4uh4jYbgWXGNpLBKydzg7vdbhePQ==
X-Received: by 2002:a05:6402:692:b0:4fb:892c:9ec7 with SMTP id f18-20020a056402069200b004fb892c9ec7mr8065848edy.18.1678802939660;
        Tue, 14 Mar 2023 07:08:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm1079104edb.88.2023.03.14.07.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 07:08:59 -0700 (PDT)
Message-ID: <d3e49808-368d-f92a-b710-6d359fc6b7c2@linaro.org>
Date: Tue, 14 Mar 2023 15:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/7] dt-bindings: mediatek: mt8188: Add binding for MM
 & INFRA IOMMU
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 =?UTF-8?B?Q2hlbmdjaSBYdSAo6K645om/6LWQKQ==?= <Chengci.Xu@mediatek.com>,
 =?UTF-8?B?WUYgV2FuZyAo546L5LqR6aOeKQ==?= <YF.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?TWluZ3l1YW4gTWEgKOmprOm4o+i/nCk=?= <Mingyuan.Ma@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
References: <20230307080555.14399-1-yong.wu@mediatek.com>
 <20230307080555.14399-2-yong.wu@mediatek.com>
 <388e2274-d46a-68a4-3e85-5bd597085041@linaro.org>
 <aba29e7fd9a461f2d94c83cf2c7496521433847d.camel@mediatek.com>
 <4ac7e2e0-9b19-c911-7297-3510e55d6cfd@linaro.org>
 <43989ca5ffa67be0a21874dbdbdf38872f16378e.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <43989ca5ffa67be0a21874dbdbdf38872f16378e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_070908_563851_F4AB4868 
X-CRM114-Status: GOOD (  15.19  )
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

On 14/03/2023 11:14, Yong Wu (吴勇) wrote:
> On Tue, 2023-03-14 at 07:46 +0100, Krzysztof Kozlowski wrote:
>> On 14/03/2023 03:41, Yong Wu (吴勇) wrote:
>>> Hi Krzysztof,
>>>
>>> Thanks very much for your help review.
>>>
>>> On Wed, 2023-03-08 at 11:35 +0100, Krzysztof Kozlowski wrote:
>>>> On 07/03/2023 09:05, Yong Wu wrote:
>>>>> From: "Chengci.Xu" <chengci.xu@mediatek.com>
>>>>>
>>>>> Add descriptions for mt8188 IOMMU which also use ARM Short-
>>>>> Descriptor
>>>>> translation table format.
>>>>>
>>>>> In mt8188, there are two smi-common HW and IOMMU, one is for
>>>>> vdo(video
>>>>> output), the other is for vpp(video processing pipe). They
>>>>> connects
>>>>> with different smi-larbs, then some setting(larbid_remap) is
>>>>> different.
>>>>> Differentiate them with the compatible string.
>>>>>
>>>>> Something like this:
>>>>>
>>>>>   IOMMU(VDO)          IOMMU(VPP)
>>>>>       |                   |
>>>>> SMI_COMMON_VDO      SMI_COMMON_VPP
>>>>>
>>>>> ---------------     ----------------
>>>>>   |     |    ...      |     |    ...
>>>>> larb0 larb2  ...    larb1 larb3  ...
>>>>>
>>>>> We also have an IOMMU that is for infra master like PCIe.
>>>>> And infra master don't have the larb and ports.
>>>>>
>>>>> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
>>>>> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> Indeed, I missed broken checkpatch/DCO chain.
>>>
>>> Just confirm what this means.
>>>
>>> Do you mean MAINTAINERS need to be updated since we add a prefix
>>> "mediatek," for the header file?
>>
>> No it means, run checkpatch.
> 
> 
> "WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does
> MAINTAINERS need updating?"
>   
>  This is the only warning when I run checkpatch. I will update the
> MAINTAINERS in next version. Please tell me if I missed other parts.

Hm, I guess you are right. Your Signed-off-by is missing.

Best regards,
Krzysztof


