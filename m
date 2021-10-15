Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4753C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 704DD60FDA
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 704DD60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jxu2QyDFg0suyiLhfS5P4oT/0SjlV58FjNMn5ClwD7I=; b=o7yc4P18ZlbwRk7aW3v+HnI6dv
	0E4yUHOS75Ym1dmUUog6Ti0szHas6CDNFUbqNaEdpk8/O81FlEVE0Qq+C/604lPXeOYhjutSXmRxz
	S74cENfphXdEUwTzxR7mS7kCecTcGFAGvYj/ge8FtECGhsx07x2jacghcsYRBqMzLCQAhI/25xDkw
	0qCM0hpGjT73uTbZ5GhiL5+/8l1EXrB5CHqa1qxCs4r4uVD/cOfUs55HHfMVq6phS4eF4vxqfMVki
	gPxXKnwJ9GImslsI0rx5eUfBWRpSJc6aiCb95xKyRdg5CdUV70hYKeEcK/uiOqb59wj6RngvFfHAj
	bgRn9Ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNyF-007Uuu-Ce; Fri, 15 Oct 2021 14:14:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbNVJ-007KzL-AZ
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 13:44:11 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2ACE73FFEE
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Oct 2021 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634305447;
 bh=eEc0Vi/iayffTVpVwLxFg1C5akct/CAQN7k1AuOgZVk=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=etBLXLep0l7NfOmPEpL/ilijAngOipqGmsxvre0p2t8ChFNnz9LqW1i8APn1Rdms+
 czpUEqoolGDnQ8IgR9ezYBLT4GW1OfAJWJ6tXVJEbmDloR53bxzC8X82PrdrQgW2wN
 uo+UtCUT0vbhebyZYvoI8Boq6OQMNOUP5K8lbBlKXdi+/COKbUxxhAtpYc/G/6B34K
 cHqLQY9zLXQV9oRmSyd+AjfuXLe74uxDhrCUMvIHnaocrm6t6aMBYTIVsPEZbE637P
 Ph6/a+gUkXmrpmBzpCbWIXOmzOe/VOg+MPnJF+qlrJj6G2lWHlvI3NmxwfE4mXnYJO
 xlfUE305CPTAQ==
Received: by mail-lf1-f72.google.com with SMTP id
 i19-20020a0565123e1300b003fdc4e26333so2412620lfv.12
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Oct 2021 06:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eEc0Vi/iayffTVpVwLxFg1C5akct/CAQN7k1AuOgZVk=;
 b=tqtKhP3ISNE0G0dZm3yctHQsTGHyUC/xZK2PyR650Wc3CIf4piMI+ddX7CtjsqHG4d
 qzyAFMX51yrbmynzP+hFpDJERna9F1WA4jC/UeXl+q+vNga/0kMczTcHArw7IaTS550f
 7mCc8x6XtKhQMk/pXNJGp4PUQHWsQqp5xaeBUdRe9BMe/8dfwpnh0SV5m9A+CGQycqdb
 WeZIKr5Y4pQ+cspmTfL/HCFcLNIrW9CoXAtOdn/HQUwfKsR/d9HydqiG2Uaj8z6TBv6G
 pvdfF5ohQw7CWJItcDpgw6iobVU3KRLzjDq1mlBqhivNs/0uo8tae5HYz1+Bh2EQySfn
 okyw==
X-Gm-Message-State: AOAM532fQhkouh+xgsSDmHWQhTKb28fs/iF7XTz20sOy8hTa4IdBtqNK
 BUVM7ZNg/ZzIUiVymVn64e6YnU51KWlIuMlBdnG0MTWZ0txsrN6ZVzXaTS7NtMZddzqyTd1XwMK
 +Y26RbZ/ahLCQ9iTtdQWEbsvBUtl2s+a1ec0VyXQtu2skhRkCJw==
X-Received: by 2002:a05:6512:308b:: with SMTP id
 z11mr11244764lfd.330.1634305435701; 
 Fri, 15 Oct 2021 06:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ+/w4Io+W6PbEi76wSIW7Mdthem4+NCuHObjSgdwIOXIeUa8NDjlAeavafuyp7tD/WUbVmQ==
X-Received: by 2002:a05:6512:308b:: with SMTP id
 z11mr11244728lfd.330.1634305435410; 
 Fri, 15 Oct 2021 06:43:55 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id bd19sm557333ljb.28.2021.10.15.06.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 06:43:54 -0700 (PDT)
Subject: Re: [PATCH v4 03/13] memory: mtk-smi: Use clk_bulk clock ops
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, Ikjoon Jang <ikjn@chromium.org>
References: <20210914113703.31466-1-yong.wu@mediatek.com>
 <20210914113703.31466-4-yong.wu@mediatek.com>
 <e466b3fb-d9fe-bb20-23c2-f9766a35f120@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ab5c6dd1-7eed-4515-8781-c79e5317d038@canonical.com>
Date: Fri, 15 Oct 2021 15:43:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e466b3fb-d9fe-bb20-23c2-f9766a35f120@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_064409_530453_530B648D 
X-CRM114-Status: GOOD (  20.63  )
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

On 15/10/2021 15:38, AngeloGioacchino Del Regno wrote:
>> Use clk_bulk interface instead of the orginal one to simplify the code.
>>
>> For SMI larbs: Require apb/smi clocks while gals is optional.
>> For SMI common: Require apb/smi/gals0/gal1 in has_gals case. Otherwise,
>>                  also only require apb/smi, No optional clk here.
>>
>> About the "has_gals" flag, for smi larbs, the gals clock also may be
>> optional even this platform support it. thus it always use
>> *_bulk_get_optional, then the flag has_gals is unnecessary. Remove it.
>> The smi_common's has_gals still keep it.
>>
>> Also remove clk fail logs since bulk interface already output fail log.
>>
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> Hello Yong,
> thanks for the patch! However, I have an improvement to point out:
> 
>> ---
>>   drivers/memory/mtk-smi.c | 143 +++++++++++++++------------------------
>>   1 file changed, 55 insertions(+), 88 deletions(-)
>>
>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>> index c5fb51f73b34..f91eaf5c3ab0 100644
>> --- a/drivers/memory/mtk-smi.c
>> +++ b/drivers/memory/mtk-smi.c
>> @@ -60,6 +60,20 @@ enum mtk_smi_gen {
>>   	MTK_SMI_GEN2
>>   };
>>   
>> +#define MTK_SMI_CLK_NR_MAX			4
> 
> This refers to mtk_smi_common_clks[] and should be probably moved after that.
> In any case, I don't think that there's any need to manually define this as 4,
> as you can simply use the macro ARRAY_SIZE(mtk_smi_common_clks).
> Using that will make you able to not update this definition everytime an update
> occurs to the mtk_smi_common_clks array.
> 
>> +
>> +/* larbs: Require apb/smi clocks while gals is optional. */
>> +static const char * const mtk_smi_larb_clks[] = {"apb", "smi", "gals"};
>> +#define MTK_SMI_LARB_REQ_CLK_NR		2
>> +#define MTK_SMI_LARB_OPT_CLK_NR		1
>> +
>> +/*
>> + * common: Require these four clocks in has_gals case. Otherwise, only apb/smi are required.
>> + */
>> +static const char * const mtk_smi_common_clks[] = {"apb", "smi", "gals0", "gals1"};
>> +#define MTK_SMI_COM_REQ_CLK_NR		2
>> +#define MTK_SMI_COM_GALS_REQ_CLK_NR	MTK_SMI_CLK_NR_MAX
>> +
> 
> Apart from that,
> Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

The patchset was merged around a month ago:
https://lore.kernel.org/lkml/163229303729.7874.4095337797772755570.b4-ty@canonical.com/


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
