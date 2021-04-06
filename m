Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588D3C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:58:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F9E61055
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07F9E61055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sKDvmgPDrS2FE5faaf3opbenntnCwNKFo+EhlfaBE/s=; b=WTyUHmfMbnZTX8z7Wame80oc9
	omJ7UMMBb7DMJwx/h/H3yD5ZRTnM2KVMnG0qrD0IK4PQubG06TIpxMOqsKeiwh9z56JCkZta1IkwC
	5fDWPXpXySoOvzdNpWJhtOn1OyM8Z0weATzrp3kqyY+0hTdiQsd+IxRqdlFaIPsk/8rkgYMBBRLaM
	OM/dA4r1Z32DVj/ZtGg5+taj50+7S6co9AmqlD/rdnqgRq20Ztu6+nJxEmThFjMs4WXHMLzkE5K/B
	aLXVG+29Jz8GikrfEYrkwtZyMVqHEaiBS+KzB42MSnRICaSi2Zp2FKIRMI3m8FK9llciT9HvFvlgY
	ZHAHlsUGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjPq-002FYA-PX; Tue, 06 Apr 2021 10:58:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjPm-002FWF-NQ; Tue, 06 Apr 2021 10:58:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id v8so7264384plz.10;
 Tue, 06 Apr 2021 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3IuYdRBsCZ+Y5lWM9na+Xuq5U89d/EyLy2gspRBPEb4=;
 b=FsziQaUOv1JbF7KynLcN+6pB3PVIbPFR+bGV752KNJ3skTa5AW8O1A9ap3zp78AEca
 5MdyCKup+QqoikJdNpxq0BTsB8fRLylzK6nXv2cGr4zBWn4lcJ1VJwIfGJ8/6CQnHyfi
 lRtVL4ogwkwT2qqEJc4+tjS8YjWDRPCE8QsUNy8rxl+uZRSV1Qkmnl0SIWNjUj4n/ZVK
 BPcnoI/flie4X0c1pMGU1DR9aWB7LchawUTu9pExkTUwTpLAttRxlNsFpFypW77kHTM6
 Vjfi7vJYoPjgPoh/xr9BzOBaRhY1vfsqmNQy20rZH26fqHj3xIZPfNFX3DlO6O45BJIc
 gdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3IuYdRBsCZ+Y5lWM9na+Xuq5U89d/EyLy2gspRBPEb4=;
 b=BtZ+8PCA5iM6vHedJSKIwp7rr9eKS1ZKmbwYrIEdDVJDMTJSVjzcmg+GXG0QyruLTn
 d3oQpyZjuvBJxGVpAZdEJprEGT8o1HwggO/zALz9kttvool28pSRpWjt9+dFHZmoxZIc
 faFuxfObLP1gun4c2nAD+XvfcgovFS915jKN68Y3m1wTS3AUAMOl2U0YpkyCsA1pVWQF
 Q3gKFp4wVh9sUJpKLxw/rzEHW8Wc2Nry7nkc5sJkMFCKo4vfRzXZi/HrIauS20ghNZIa
 f1TiRpN0XyLtshYwKFC+B3BS89K4sQO6cg2pOj025UW9IF6dz/IAL7EhuPu6Dn9IMfvK
 mUWg==
X-Gm-Message-State: AOAM531u7n/iwTwRoZCRMVGSW8qPG2hgNGb8IeGO33IoJKswmwonE+0v
 R6/crrw3sbtYvpnKIo8LKBxylhKJzoX5zw==
X-Google-Smtp-Source: ABdhPJxjVxXlX98oAykoBDIlIyV+I6TAUjpWJ6VdilYsvNOBpM5pg6/IPv7OlHUAQlBWx9FT+L7Nqg==
X-Received: by 2002:a17:902:d706:b029:e6:90aa:24e0 with SMTP id
 w6-20020a170902d706b02900e690aa24e0mr28592949ply.42.1617706713246; 
 Tue, 06 Apr 2021 03:58:33 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id q2sm1630689pfk.143.2021.04.06.03.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 03:58:32 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: mediatek: mmsys: add mt8167 binding
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: mkorpershoek@baylibre.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210405200354.2194930-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <10e5739f-dfdf-d734-57a6-2b46e5d15220@gmail.com>
Date: Tue, 6 Apr 2021 12:58:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210405200354.2194930-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_115834_824800_C0F00F97 
X-CRM114-Status: GOOD (  15.23  )
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



On 05/04/2021 22:03, Fabien Parent wrote:
> Add binding documentation for MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied both patches to v5.12-next/soc-2

Thanks!

> ---
> V2: Rebased + fix typo in commit message.
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> index d8c9108c3b4a..78c50733985c 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> @@ -13,6 +13,7 @@ Required Properties:
>  	- "mediatek,mt6779-mmsys", "syscon"
>  	- "mediatek,mt6797-mmsys", "syscon"
>  	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
> +	- "mediatek,mt8167-mmsys", "syscon"
>  	- "mediatek,mt8173-mmsys", "syscon"
>  	- "mediatek,mt8183-mmsys", "syscon"
>  - #clock-cells: Must be 1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
