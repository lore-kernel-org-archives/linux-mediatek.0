Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C05CC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 14:13:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6BA2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 14:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cFo10iav";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9nVudIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA6BA2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N/JQqS5CIP8Ipyq3Dvk3l/y1IPbHEXCZhg7BdrMG+ho=; b=cFo10iavNCRs8P6pTz4QUaZzF
	Jiqc9DK8l6ucEvYbl0UbYuqFVjVhs7wDWrvVF9hlTuLQans4ZyWSZK+xBjMHz1gobEjK1wRPcbjQS
	zxp66GS9jbnPoTJjUyxylo5JnEoSDKtjHxcDEpf+r+VHbClB1VgxYFLg8UasQSFRGRdXCT6ovU8rc
	jqDEcro14zjA9TDwFa9P3IgOTjyYlVp81MRmtoL63LvIuSm/z+79hlTNzYoPR1R3UfVtC3uvO79mN
	FvxkUI89R9OPar1w2HwPXsR8N6Gr6PaWtrG54jrIjL4eqzU8AYEJL3lU4O7dRpqFYPA2e9yNBeloo
	czUlbwNuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Opl-0002r0-VB; Wed, 19 Aug 2020 14:12:58 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Opg-0002oe-AE; Wed, 19 Aug 2020 14:12:54 +0000
Received: by mail-wm1-x341.google.com with SMTP id 3so2371876wmi.1;
 Wed, 19 Aug 2020 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=55r+GV0StXEJZBwRtdXkjylCJHQxIxHaBu6RkMedZ5s=;
 b=n9nVudICteJ8j8jIz2NDG/6H2TmtP0ZZ3sNQu4a4sX+HsPGokvcMPcd5eK/ak7uVzk
 EO4U4x5+otGuSXT/ZlaNT9dAnuFwzmDZy3tU+ppJ34p+5QfcyMiLSodJNeDF429j+Sfs
 FUCYaoTMhssIx2/pI7ONtXMyMKdEhFKxsH8hKDGwIdXQxLNUTaCo7suyeJ63v7CS1uw0
 qYn7p3ADh/49MX/2hE1ErCfPQ6vq+HFRUHFZ43lO8Qm8eGxe2eRCOzseEM+TSPlAfdTN
 s8DvqllDABmt/BkKBewXh/t2WkbJmbIOSdNZlBdFR5SmOTNzJ4dZXnndTNuAS+wOaVHK
 NZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=55r+GV0StXEJZBwRtdXkjylCJHQxIxHaBu6RkMedZ5s=;
 b=tcpblpHVgofXh/CemoflBnCWl2G8aXaqxAxOZmCCraq5CC4s6WX5M54HEslxkf9cFd
 Ycm1DzUIsjDA/LWkMi4AVNk8bo+o+MCpJIw+WmAbr+OxzYlR2iBayEqLA8wPecd8V/4I
 yoRpWPXzjzFZvudCySzgHLgXtcWd2BDW/QGSgfjnUmEsGqRk+pWdyo8o4EYiJ0LWQVJO
 FzeHQl8G/hepkpQKIGOq3+zraDH1uWEkRN9kMzyPFCJjiu/ty7dLvfiSDPevHV3ix4RP
 Dh+KoojPHNuhQ9qGyf7PSCnqlpbgggq1XQP58vGesJk9JTTsDIqAXU7jJg0fUnzYWj2p
 jH1w==
X-Gm-Message-State: AOAM533kqOPFe/snZaVYPAawjXIqYxNmPGeVSo+CENH906sADZdt+MLd
 0rHmH2/T3sGJMDLPjREM/mY=
X-Google-Smtp-Source: ABdhPJx79OShzlNMo4wqrn3MV3o9egwejruvp6/fPqtC7XwO8xvrjNWbjTttIaLlH12tU80UuPi3AA==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr561763wmj.47.1597846369566;
 Wed, 19 Aug 2020 07:12:49 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
 by smtp.gmail.com with ESMTPSA id h11sm40724588wrb.68.2020.08.19.07.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 07:12:47 -0700 (PDT)
Subject: Re: [PATCH v12 25/29] arm: dts: mt2701: Add jpeg enc device tree node
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Xia Jiang <xia.jiang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Rick Chang <rick.chang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
 <20200814071202.25067-27-xia.jiang@mediatek.com>
 <9a35791d-51f6-2429-5bcc-2149ac1b60c7@xs4all.nl>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <355e2b60-d024-b76c-f0c6-ac599efd2999@gmail.com>
Date: Wed, 19 Aug 2020 16:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9a35791d-51f6-2429-5bcc-2149ac1b60c7@xs4all.nl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_101252_511953_6A7041F5 
X-CRM114-Status: GOOD (  19.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/08/2020 13:37, Hans Verkuil wrote:
> Hi Xia,
> 
> I made a PR for all other patches of this series for 5.10, so this patch can be merged
> by whoever takes care of these dts patches.

That's me. :)
Patch now applied to v5.9-next/dts32

Thanks!
Matthias

> 
> Regards,
> 
> 	Hans
> 
> On 14/08/2020 09:11, Xia Jiang wrote:
>> Add jpeg enc device tree node.
>>
>> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
>> ---
>> v12: no changes
>> ---
>>   arch/arm/boot/dts/mt2701.dtsi | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
>> index 8d43a502aada..1c1c2132234f 100644
>> --- a/arch/arm/boot/dts/mt2701.dtsi
>> +++ b/arch/arm/boot/dts/mt2701.dtsi
>> @@ -568,6 +568,19 @@
>>   			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
>>   	};
>>   
>> +	jpegenc: jpegenc@1500a000 {
>> +		compatible = "mediatek,mt2701-jpgenc",
>> +			     "mediatek,mtk-jpgenc";
>> +		reg = <0 0x1500a000 0 0x1000>;
>> +		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
>> +		clocks =  <&imgsys CLK_IMG_VENC>;
>> +		clock-names = "jpgenc";
>> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
>> +		mediatek,larb = <&larb2>;
>> +		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
>> +			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
>> +	};
>> +
>>   	vdecsys: syscon@16000000 {
>>   		compatible = "mediatek,mt2701-vdecsys", "syscon";
>>   		reg = <0 0x16000000 0 0x1000>;
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
