Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D5CC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 15:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6DD86135F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 15:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6DD86135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=m0uKLpmTHZrL1bavfPcNGQ3lOYHczlOeVvHlVrE3mtw=; b=J5yWyqiDwJe9LdiBmZQS1tHK5N
	4vFhzyf+Dx4E7rJXUUTMXwlpQ8R3WnAGH6NYF+h7O1zeOdKkJO0MrgBw9rd28oa9O6ICOoe2TOKDK
	lygLtgHWHZOmCRW9TaxjX5iZJBMBMz1/u+mbZ1HiKgoFUWxUMsW4hKG41BHRxcaKu6/mJP2DXK++x
	GZAxc0oN5AwBpt9MBZW5DAcyBswSEoqOAfYMoHVzwaXHKBZVSWWCzula8SqFnC9zk76fiyG6jwE0I
	0alzxTG1qPP1ubH0Zvpk8WZ2rYJr/g0DyNCEu4y0WbcnIR5zTd+85eNKgl8Hikn0Jj9oCpkUkECuA
	mWTGTdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Qhy-009OkI-Fj; Mon, 05 Jul 2021 15:40:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Qhw-009Ojm-5H; Mon, 05 Jul 2021 15:40:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id i8so9701269wrp.12;
 Mon, 05 Jul 2021 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+SRLE0tPUsz9JGstgxnhEOYaBDJCX4/2/ht+oLnNatg=;
 b=AnNCZDrC3XgFdjPmO4zWV+8xVX1Th2OcBIhf7ZUoCjVQqYTtQji90c/PaaZ998+M6x
 z+LgD+6xEdGuyQMtGu5eVL3xsvJRnlRlrbSnsrETnUchmH8g60zFl1eodg9a7wMptgt2
 mtJnBD4uyv0FmTr1SjqDvXieQ6XJ0jicfWlDxlN7vH3mPI3hUvpRwhGEqNZMPJkn9XvH
 h3GPLdT/qrgj9hrBLFogAitMbbhjNCHgUvAiWrBRkW5EZC/eDLGvSHphrlChLj4OyOT0
 uGOTXi3M91mqAwcxUIcmir3cGsRO0QSK03TgAP65Ykpr94a50/1JgBItbp5e0Op9AHUc
 3QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+SRLE0tPUsz9JGstgxnhEOYaBDJCX4/2/ht+oLnNatg=;
 b=OMJir6nJNJu7+sTJ8nIs7PphgbzGfxoPey88oQZK0hvS5PL6NpdDAwgSNgbUCZU51u
 Evf1V8EKr5H39YdogiYR6YwApkZjf+U9dfQxPA7pJ51Ymzg4mSgmBsjQcGlLlRXTOQQy
 XZDlbUUL+N2azBpXJaEJHWJn2X8+c+Iv1vZLnV5a4UqwFn3pjRH97j5qOQO2OCmdCoUh
 b4KdABQCYMGKPWj2QK48MpAI/onAJy/cFLNEAa/FdDyRfSZf0x+9fbrYDG4UKHWbNf8p
 O2mzqCmvTfc8sczStK6lxpue7HJ7z7fjYwqXlqG8c89qWPir/pw+Kjq7Tzqez9yBsguC
 PSOg==
X-Gm-Message-State: AOAM530R84zE7cMAOH7M8xtZiHPR/j2VTaBQzB1O2kPW/eBxyyZZeGJu
 PilD0vUdvfdF1NiyOwl39ko=
X-Google-Smtp-Source: ABdhPJzIVjdY5LyWZGNBnQbxixb6xvnvBMZ3/L2ZACruHYs5eHf+9pOKYeyPGKILeKujuggFhiDH3w==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr16172872wrs.259.1625499625999; 
 Mon, 05 Jul 2021 08:40:25 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id 31sm14971533wrs.79.2021.07.05.08.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 08:40:25 -0700 (PDT)
Subject: Re: [v12 02/20] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
 <20210705033824.1934-3-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <564fa3c8-1d85-5e98-f3f9-f83cb17e905a@gmail.com>
Date: Mon, 5 Jul 2021 17:40:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210705033824.1934-3-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_084028_256007_7A6BFDF6 
X-CRM114-Status: GOOD (  15.62  )
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



On 05/07/2021 05:38, Chun-Jie Chen wrote:
> This patch adds the mmsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> index 78c50733985c..9712a6831fab 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> @@ -16,6 +16,7 @@ Required Properties:
>  	- "mediatek,mt8167-mmsys", "syscon"
>  	- "mediatek,mt8173-mmsys", "syscon"
>  	- "mediatek,mt8183-mmsys", "syscon"
> +	- "mediatek,mt8192-mmsys", "syscon"
>  - #clock-cells: Must be 1
>  
>  For the clock control, the mmsys controller uses the common clk binding from
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
