Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C4CCA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8sFu0+D3E77YJ4z9rbydrUcmzYi8cL1xr3GzlsZe4w=; b=bB/hTmWSK7QIjSBKwpjYz+Qqnz
	+8L7HU2gl9g5KUHsrlswMTj6SyMlRUKDIv9WjFvipxGgLPCusfM0yFmFd/quqW1DmH6CfdNd/o8pH
	x19DGIdhFZOPXzyLSPlU9QnQ6kG7hhJ6PWl3GiyISRm2KsB2sZ4NJikSt8Vt/eQK8uQT7JgfTFa/K
	T7CuNfhjA/sVwwC0VBIcBrlHy4hdbwLRUAZ6uzOKXRBiID1KA9UQhOC2irUzPR/ByCcbKeDpC+ehA
	bC0EDzl1W8dRSvUpF1Lb9EJsW5XiTqaiBO+7/JH5Q+ZiQ9igYdBhls7HRwc5QKRK3xzKPf0ECPzzy
	VcG2QmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4f9-003e7n-0h;
	Tue, 12 Sep 2023 14:46:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4f6-003e0X-0P;
	Tue, 12 Sep 2023 14:46:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4013454fa93so65117575e9.0;
        Tue, 12 Sep 2023 07:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694529993; x=1695134793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8sFu0+D3E77YJ4z9rbydrUcmzYi8cL1xr3GzlsZe4w=;
        b=igvWae73xwBTMk1qkgCwtdxG8IbCm0SKMwsbU1IMB4L4xIhQzw60puUtTpi0amxO5e
         QSjFO8BLEZ26wxoG5/y9hoxgaV3h5gmL0+Ax1iWPu+kim1AEzZ9Es55nFLNmAIzvC8+A
         gyYVq8a87GNHO+i5m3foH/iBWifUEXEzeMy12n/ebaQKacuqvhN8YpCBafKX8313xlg2
         e7OQ8w5bLamiArDdgGMk+KbmYyNF1LPLwva7yJH8FdkL0+2aLBPaofAJax0dH7F+Q8ae
         Jj+0kNPEqQhPRiUfBTU7LZ+1c3t3iu6RKjXw36afjl1PglmGZv2dTbfv8lNn+LAmHI+H
         ywow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529993; x=1695134793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8sFu0+D3E77YJ4z9rbydrUcmzYi8cL1xr3GzlsZe4w=;
        b=eaDRl9WQylIorQ7C7Ip9kV8a6iHorGH3Y5He/9eauIhUNxg6ZOjgXdh167z5/cjdAU
         FHY5Oabxlq+IdHuQZjLpeVHxrWJXerh2/PP7DKZlfL+OeztG0PzW2nLT7ZdKgxYQeKTt
         QmrXWsddO/E0Hwj/0ejEzaE4vZu/sz8OSJhfcWdpQTxZyORqpRJ0s515U02OMbQHqWaA
         h2ruDlyhK+IVD7RdgHZ13iGhAP5DxK/hjok1RIYM2D/Oc20KKn7QpZ3AWgdsFNEnOn4p
         YlIbbOZb3Tf+sRixyI/vSo1O3n1uhEiY/ASDowMb00dqdnuhpuo01qx4V0AcJ52DDUJ+
         MKFg==
X-Gm-Message-State: AOJu0YxTNE4eYhaqtoCpWyHonVe6Ixo3HUHQaLYrU7cVsA+kGHxlrsOY
	2rnpUsLqNuHVhVc9qB6vu84=
X-Google-Smtp-Source: AGHT+IGHXQb8saBAd6H+9uYnotfhWfZV5PqBMgupUePv5+BNFjR2MQXXacKt9iDypQAL5TYLBL9epA==
X-Received: by 2002:a05:600c:3b1e:b0:402:f536:41c5 with SMTP id m30-20020a05600c3b1e00b00402f53641c5mr10911758wms.3.1694529992631;
        Tue, 12 Sep 2023 07:46:32 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id t15-20020a7bc3cf000000b00402be2666bcsm16448614wmj.6.2023.09.12.07.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 07:46:32 -0700 (PDT)
Message-ID: <95797f3d-65bf-1bd9-9e19-6de42605cfe3@gmail.com>
Date: Tue, 12 Sep 2023 16:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "jstultz@google.com" <jstultz@google.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?=
 <kuohong.wang@mediatek.com>, "Brian.Starkey@arm.com"
 <Brian.Starkey@arm.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
 <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
 <23e71d1f-08c1-3834-5b1f-2b5714c7bfaa@gmail.com>
 <255ae6b9ac1b6bea9262069747824b8461475e70.camel@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <255ae6b9ac1b6bea9262069747824b8461475e70.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_074644_177829_7E4BBDDB 
X-CRM114-Status: GOOD (  23.02  )
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

Am 12.09.23 um 10:52 schrieb Yong Wu (吴勇):
> [SNIP]
>> But what we should try to avoid is that newly merged drivers provide
>> both a driver specific UAPI and DMA-heaps. The justification that
>> this
>> makes it easier to transit userspace to the new UAPI doesn't really
>> count.
>>
>> That would be adding UAPI already with a plan to deprecate it and
>> that
>> is most likely not helpful considering that UAPI must be supported
>> forever as soon as it is upstream.
> Sorry, I didn't understand this. I think we have not change the UAPI.
> Which code are you referring to?

Well, what do you need this for if not a new UAPI?

My assumption here is that you need to export the DMA-heap allocation 
function so that you can server an UAPI in your new driver. Or what else 
is that good for?

As far as I understand you try to upstream your new vcodec driver. So 
while this change here seems to be a good idea to clean up existing 
drivers it doesn't look like a good idea for a newly created driver.

Regards,
Christian.

>>> So I think this patch is a little confusing in this series, as I
>> don't
>>> see much of it actually being used here (though forgive me if I'm
>>> missing it).
>>>
>>> Instead, It seems it get used in a separate patch series here:
>>>     
>> https://lore.kernel.org/all/20230911125936.10648-1-yunfei.dong@mediatek.com/
>>
>> Please try to avoid stuff like that it is really confusing and eats
>> reviewers time.
> My fault, I thought dma-buf and media belonged to the different tree,
> so I send them separately. The cover letter just said "The consumers of
> the new heap and new interface are our codecs and DRM, which will be
> sent upstream soon", and there was no vcodec link at that time.
>
> In the next version, we will put the first three patches into the
> vcodec patchset.
>
> Thanks.
>


