Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F603C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 06:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhbXxJ4vpNqee73M6/vRlz+kqj3z39OL4xPkGR3We6k=; b=CHoxPOm5OzxpuAJ+Qr5wSbDh/P
	fkJm+BqXvHVEXITzIttIajEyXJOBcdGN5dAgP7cC4SPFWDmnTmm3u2OivVgBY56ALSiA4APY3rP7O
	WDZBgeHijS5IKExHseaQKe0nmonOji69vOZdvgLykwOH3Q2oozJTeLs9jXbbYG7E0F1nKRdwpdDjP
	g0S0WGuBlaot6xHy/k71zJ0zXBt8R3cIro2+wWaoCXE4vS0QixfG58pRakztpkz0ztOIXDoDr8TjR
	nOK8nCJL7fReRfyxzxaRnmgHw5/kPXb64/3srtmg56du2fTEPAkf5bgdHmYl81hJdSQ7QKcpMlB/I
	h3cDlrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbyQc-009EQR-2v; Tue, 14 Mar 2023 06:46:34 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbyQL-009EL4-3W
	for linux-mediatek@lists.infradead.org; Tue, 14 Mar 2023 06:46:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id n2so18600057lfb.12
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Mar 2023 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678776370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LhbXxJ4vpNqee73M6/vRlz+kqj3z39OL4xPkGR3We6k=;
        b=GoWSTZrQsLS4XERhO2xMfwRPzK1whV8/7rN0TtUVHDXr6O3pyEMAtvwjGOv+9k0X0b
         fY3z2pXoNlajopNs9VcuylCpda5CLsWW/4neKFcFVm2ODY+63VagW6eessvxkCtqesVQ
         VB+eCpTKR6i+TCPxyzXgoNWVwFnzIK34Ql+ePGeI4WNemHqDOofhVWXoMv/jIm8te4Xk
         6CjPrigAmIAWdgkr+k7dMYjGOs5FsqyEH+1sodzPTVFrCx4V9Q4rlrZ4lh1S720e91Ji
         BPH46ULT+WyKwZC7wq7xK0Hn7Z21UlMVjiRKiPJxDaMbD14Lr+ybYHCaNVj8Xj1D4MZ5
         KrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678776370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhbXxJ4vpNqee73M6/vRlz+kqj3z39OL4xPkGR3We6k=;
        b=xUv9gk7YgMTDZB/BWKEKzoWh1SUD73MeRDkOPL4HZ4nRaGKId7/ZcPEdYbJcRV/zCO
         oN9QGy7USofTknGWjfPQ8YXbymdz9kMxDUlllJqDo6/+EaUpyfYi9WRi99F7YBYCg4Re
         MAWDSgVeN9lFYFvbkRT5vcfULj3ahobXS3hK2Xw5orjcCqO7B8robt2d4r31M6D057q+
         RcFlhHYDXm6IwSP4J+doYw77I5enXGoHfFo1AB1PqYPMzrtFS4xM5kdONQZoliQTv2sy
         wIUgKtRko7ACXPX1cD0nvOU9U5h3PzbtIZXfmSsTTLbBBeX8hhObWkUMiBpmmSIwphRy
         esdA==
X-Gm-Message-State: AO0yUKUTs5D0QCjusPZ44lv9f/wf7rT9sU9rojaMj/Sgnbl+2l3jsufH
	KFaLyrQakZwXoyjwVyKaNrEo+Q==
X-Google-Smtp-Source: AK7set+h2ndOB4p0HTaSRJEa23fwejgd1QQBXJIK8545r8GXILzHRgIM69D8cqAOd6eDDgave0Vz3Q==
X-Received: by 2002:ac2:4191:0:b0:4e8:401a:3e2b with SMTP id z17-20020ac24191000000b004e8401a3e2bmr448737lfh.5.1678776370465;
        Mon, 13 Mar 2023 23:46:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6932:5570:6254:9edd? ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id t13-20020a19ad0d000000b004db45096c99sm272438lfc.85.2023.03.13.23.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 23:46:09 -0700 (PDT)
Message-ID: <4ac7e2e0-9b19-c911-7297-3510e55d6cfd@linaro.org>
Date: Tue, 14 Mar 2023 07:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/7] dt-bindings: mediatek: mt8188: Add binding for MM
 & INFRA IOMMU
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?UTF-8?B?Q2hlbmdjaSBYdSAo6K645om/6LWQKQ==?= <Chengci.Xu@mediatek.com>,
 =?UTF-8?B?WUYgV2FuZyAo546L5LqR6aOeKQ==?= <YF.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 =?UTF-8?B?TWluZ3l1YW4gTWEgKOmprOm4o+i/nCk=?= <Mingyuan.Ma@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230307080555.14399-1-yong.wu@mediatek.com>
 <20230307080555.14399-2-yong.wu@mediatek.com>
 <388e2274-d46a-68a4-3e85-5bd597085041@linaro.org>
 <aba29e7fd9a461f2d94c83cf2c7496521433847d.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aba29e7fd9a461f2d94c83cf2c7496521433847d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_234621_367888_FF3AE7C4 
X-CRM114-Status: GOOD (  14.29  )
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

On 14/03/2023 03:41, Yong Wu (吴勇) wrote:
> Hi Krzysztof,
> 
> Thanks very much for your help review.
> 
> On Wed, 2023-03-08 at 11:35 +0100, Krzysztof Kozlowski wrote:
>> On 07/03/2023 09:05, Yong Wu wrote:
>>> From: "Chengci.Xu" <chengci.xu@mediatek.com>
>>>
>>> Add descriptions for mt8188 IOMMU which also use ARM Short-
>>> Descriptor
>>> translation table format.
>>>
>>> In mt8188, there are two smi-common HW and IOMMU, one is for
>>> vdo(video
>>> output), the other is for vpp(video processing pipe). They connects
>>> with different smi-larbs, then some setting(larbid_remap) is
>>> different.
>>> Differentiate them with the compatible string.
>>>
>>> Something like this:
>>>
>>>   IOMMU(VDO)          IOMMU(VPP)
>>>       |                   |
>>> SMI_COMMON_VDO      SMI_COMMON_VPP
>>>
>>> ---------------     ----------------
>>>   |     |    ...      |     |    ...
>>> larb0 larb2  ...    larb1 larb3  ...
>>>
>>> We also have an IOMMU that is for infra master like PCIe.
>>> And infra master don't have the larb and ports.
>>>
>>> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
>>> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Indeed, I missed broken checkpatch/DCO chain.
> 
> Just confirm what this means.
> 
> Do you mean MAINTAINERS need to be updated since we add a prefix
> "mediatek," for the header file?

No it means, run checkpatch.

Best regards,
Krzysztof


