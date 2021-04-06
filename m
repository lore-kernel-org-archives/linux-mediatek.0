Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E51EC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:50:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B75613CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B75613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vk66tW6V0hE6jN72JdDuUuQi6g89X5vaEypxNa0JRcY=; b=lYVqp98mLJsr3mTQOcdo9pIwO
	exUpb5OJ+bIeF0tQ28eTs3D1dAXW+MQ03jyQMxzdalD/jrgAE2xG/EGYI3GvSKpVHG8R8UCwQU+47
	1UJQnocSd9PpUfLOqYzbTj6ufLFhgkE7YOH6wtLyP7SWwOwfuPc4cF9NWl+Yf4Up6w8yWq2rRw501
	/3XD8CclQSb5GPTuWqm4DuKIjbS7iwsYEt2i5dPss42kfSC0hFFlvvpXvpb9cPKeq2MSy6gMJ1sQd
	lTmyhtqCfC+3KqiOYvJWzAjdHf2R4Ce6xP/xnhMQ7oh17AEzRZDZWHVC3DYA4o8V7r4gzOPwf8vgH
	pGLmw8U4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjHq-002DjO-MM; Tue, 06 Apr 2021 10:50:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjHm-002DhZ-Qy; Tue, 06 Apr 2021 10:50:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id a6so7692899wrw.8;
 Tue, 06 Apr 2021 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C1JdH9qMTW9Ct0cY1by9NdoLJ5D/IrcneC7TbnQot4U=;
 b=APVJ86nA+ezkgBslLllPedosijYCehd73iMhlwkNMVDrebQAbIUO949N9bX1f16lXP
 Puozc8Ict2gEwTlJ3JEL99ksHK17NVlb5XJBaj+l/YhmnHlGpEKvkWapOoSN5fyeaKlC
 1ramhmb2uUbCoKIu0BTZuW5NZQvAe2XbUqAqARSTXK3vV5F2sAd/pN2EvdxHN33PuzRU
 70NiqqGkf5f1tpXt54Hu5xerDphos5e3cPg/7yTbbfrhSoaFBfs6NUGCHW5Ar9Bf6qKa
 du49yXti9LYC8oUsIIJLWeet8v/rtbbjgG3QDQSBTJKthGcghU1u0ljkigMnntt/DfhW
 Vukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C1JdH9qMTW9Ct0cY1by9NdoLJ5D/IrcneC7TbnQot4U=;
 b=gPdf2hPwNG3t+fjpS7Z2k/pPokyJFApzSq3DJHK9jjEOB1hO4sMLyESdr+0KdfQkdU
 17ysJ/GaKS+dpDgwnqySDt88GruFwvIRqyKZUyL6QI6n84KpVjP1IulgeeKTmryDQrE4
 OgV8fUN83AohJyc2q8+YBUXgY0isbuGXVh5lIxp5542yA7qRQXx2rzjKzK+yA8Bio7b/
 0syFasKD6kZVqBddRvhYY6takJL4L7XdFfaSAYIEgV18JtJN7+d69XRA9pyDtm6GzKJR
 dPUQntjnorWgBsZ6P6yl/fEdtSLxNNZ1TRqpEmziz44+KH6f7OHr257JzQKgOf+T6n72
 Mkxw==
X-Gm-Message-State: AOAM532qCy0Y1wGDkICRKHClDki85EUfAXPdwoF2GNc3268DUKaG/eu6
 mrFZkIwm9NAjTgLyjThZ5SPCcnFMhoyzuQ==
X-Google-Smtp-Source: ABdhPJy2a8YOzQ5NrFn1DlBHGsLFv04sefVLfR7KIezOh75tsd5Xy3kNyYeGS3gXeoNGZH74FSzwPg==
X-Received: by 2002:adf:ec88:: with SMTP id z8mr16164322wrn.315.1617706217556; 
 Tue, 06 Apr 2021 03:50:17 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id u9sm2304351wmc.38.2021.04.06.03.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 03:50:17 -0700 (PDT)
Subject: Re: [PATCH v4,2/3] arm64: dts: mt8173: Separating mtk-vcodec-enc
 device node
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Irui Wang <irui.wang@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tomasz Figa <tfiga@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, yong.wu@mediatek.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
References: <20210325122625.15100-1-irui.wang@mediatek.com>
 <20210325122625.15100-2-irui.wang@mediatek.com>
 <245594e6-a4c9-0f53-58e3-1b32ca6dc651@xs4all.nl>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <dd87cbf6-1c79-63e1-a92e-7831eaa63f52@gmail.com>
Date: Tue, 6 Apr 2021 12:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <245594e6-a4c9-0f53-58e3-1b32ca6dc651@xs4all.nl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_115019_140048_D1B8C1F0 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/04/2021 12:46, Hans Verkuil wrote:
> Hi Irui,
> 
> On 25/03/2021 13:26, Irui Wang wrote:
>> There are two separate hardware encoder blocks inside MT8173.
>> Split the current mtk-vcodec-enc node to match the hardware architecture.
> 
> I've accepted patches 1 & 3, so this patch can be merged by whoever maintains these dts
> files.

Thanks for the info, patch 2 is now part of v5.12-next/dts64-2

Regards,
Matthias

> 
> Regards,
> 
> 	Hans
> 
>>
>> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 60 ++++++++++++------------
>>  1 file changed, 31 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> index 7fa870e4386a..f5950e9fc51d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> @@ -1458,14 +1458,11 @@
>>  			clock-names = "apb", "smi";
>>  		};
>>  
>> -		vcodec_enc: vcodec@18002000 {
>> +		vcodec_enc_avc: vcodec@18002000 {
>>  			compatible = "mediatek,mt8173-vcodec-enc";
>> -			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
>> -			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
>> -			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
>> -				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
>> -			mediatek,larb = <&larb3>,
>> -					<&larb5>;
>> +			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
>> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
>> +			mediatek,larb = <&larb3>;
>>  			iommus = <&iommu M4U_PORT_VENC_RCPU>,
>>  				 <&iommu M4U_PORT_VENC_REC>,
>>  				 <&iommu M4U_PORT_VENC_BSDMA>,
>> @@ -1476,29 +1473,12 @@
>>  				 <&iommu M4U_PORT_VENC_REF_LUMA>,
>>  				 <&iommu M4U_PORT_VENC_REF_CHROMA>,
>>  				 <&iommu M4U_PORT_VENC_NBM_RDMA>,
>> -				 <&iommu M4U_PORT_VENC_NBM_WDMA>,
>> -				 <&iommu M4U_PORT_VENC_RCPU_SET2>,
>> -				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
>> -				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
>> -				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
>> +				 <&iommu M4U_PORT_VENC_NBM_WDMA>;
>>  			mediatek,vpu = <&vpu>;
>> -			clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
>> -				 <&topckgen CLK_TOP_VENC_SEL>,
>> -				 <&topckgen CLK_TOP_UNIVPLL1_D2>,
>> -				 <&topckgen CLK_TOP_VENC_LT_SEL>;
>> -			clock-names = "venc_sel_src",
>> -				      "venc_sel",
>> -				      "venc_lt_sel_src",
>> -				      "venc_lt_sel";
>> -			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
>> -					  <&topckgen CLK_TOP_VENC_LT_SEL>;
>> -			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>,
>> -						 <&topckgen CLK_TOP_VCODECPLL_370P5>;
>> +			clocks = <&topckgen CLK_TOP_VENC_SEL>;
>> +			clock-names = "venc_sel";
>> +			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
>> +			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
>>  		};
>>  
>>  		jpegdec: jpegdec@18004000 {
>> @@ -1530,5 +1510,27 @@
>>  				 <&vencltsys CLK_VENCLT_CKE0>;
>>  			clock-names = "apb", "smi";
>>  		};
>> +
>> +		vcodec_enc_vp8: vcodec@19002000 {
>> +			compatible = "mediatek,mt8173-vcodec-enc-vp8";
>> +			reg =  <0 0x19002000 0 0x1000>; /* VENC_LT_SYS */
>> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
>> +			iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
>> +				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
>> +				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
>> +				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
>> +			mediatek,larb = <&larb5>;
>> +			mediatek,vpu = <&vpu>;
>> +			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>> +			clock-names = "venc_lt_sel";
>> +			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>> +			assigned-clock-parents =
>> +				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
>> +		};
>>  	};
>>  };
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
