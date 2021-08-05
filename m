Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9365C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 09:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B059C60E8D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 09:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B059C60E8D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LlzMbVvarLgOdCqyiJKrwGjAffopLTPn9TIJj555eOw=; b=zBejj+EWuf8aW9v+zCNC6Vlbbr
	cRm67CKoMOxsYuY+78KBo6omYO2kddhu6kTVUGAP1NTsybsf3ZICzUtVAssAdRso8ctugixQFgbCe
	3B5YE31my0kC3Rl+YhcrUjlFGQJ3BMcasU/11drIJh/uKezTvqHFGW+YWGXU7UgnqyYWfgMYySJKk
	iQKQ5TJtI/jqrf6YwLmdKYBi7L3xoaqJWcFriCG8aTkct0g3ABDpET/HnUT9QwKRZzMlha0I1GiyZ
	P6qg75EWJ5XxyN7cwe85kSWa2iy7v3tThKxd1ELHgrDUxyce9XuAFEugWBC+IW+S3U6iimfAZHN+U
	ml+C8OFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBZGi-008lPp-Jt; Thu, 05 Aug 2021 09:02:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBZGg-008lOj-5s; Thu, 05 Aug 2021 09:02:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j2so5494134wrx.9;
 Thu, 05 Aug 2021 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xBlRW4pHwPqeNhDYb3jb+UKe1vgH2+ct0ssi2hqlwPM=;
 b=T/NNtBWp1hlPqv+7LVAlo4n5mwPuaPeTKAQZUALxBb0FAeCToK7EqgYlUFOl3+nh4o
 YN9SoH0koBcHle96RWaKXYda49qYxkrqzOGQWmH0WxCM0CaPN4twacDWy3JA4m4ZUn6Q
 pOp6KV0Ll6eFYk3Nm31HaVFfpilsBM09wtzGy84q5Mqkm0M+xWxkHyH9dQd6v5iSTyZQ
 Dhly2i7XPGmoeUzcIU9IJ3guaanU+lgHjMEjUtCTtVGS0vKhLhDLaFscjtv081YZXYDd
 49+zaYI+Q4ZPYyMjZXobg+Va33wS3pZM9pBMUMILVjBo+mhnZf9b1GgShs5Z0fzgOgCw
 detA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xBlRW4pHwPqeNhDYb3jb+UKe1vgH2+ct0ssi2hqlwPM=;
 b=ejoUA24TMu0ri/7c1MaoLjoOGBfED4ErSpY8FyCmXayK0815NpRPkaLc6CSy385wVk
 juq84NKXTNSULjemZdX1BV+17NV6T6WA0cioX/qNqfJMDq5e6d774xZ35azgJStsfHOX
 BZd2AIh2Fou4v6uiUozxQzf4LXoLV3MWNBHnfcB5sMCL/haQjtj7KHAiU+hQcM86gIqf
 62js9Tcy1TRuIFWHI2uY6RE5wJl0vBHgQSv5thkuvLlMvab6VhK355bvHOGRoIg35su7
 RZHooVxfxfaW4b105ldd3ve5vrWfePrjdOVn0toCR4REk6YzdgAowgFk4um8t6bOyjz+
 ZoYg==
X-Gm-Message-State: AOAM530wFsxO44jEfe6zQ27r8KNXeMuHCVfOUPrJxGjvs6lsYmNLHp7q
 VhBvHnzqS4W3UKgm5l5D+0E=
X-Google-Smtp-Source: ABdhPJzKbFRpmxJ0dvD48+AuEhrq0GTbFHBf7r/VfElGFxVhmyP60WIE14hxSG+ITUCWJx5wGhBKeQ==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr3995180wrs.125.1628154140435; 
 Thu, 05 Aug 2021 02:02:20 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id t1sm4901451wma.28.2021.08.05.02.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 02:02:19 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210804044033.3047296-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d48087c2-ddff-0c58-c7e6-a0ba526a393f@gmail.com>
Date: Thu, 5 Aug 2021 11:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804044033.3047296-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_020222_277342_B1CC26F6 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Linus,

On 04/08/2021 06:40, Hsin-Yi Wang wrote:
> Move mt8135-pinfunc.h into include/dt-bindings/pinctrl so that we can
> include it in yaml examples.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm/boot/dts/mt8135.dtsi                                   | 2 +-
>  .../boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h   | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename {arch/arm/boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h (100%)
> 

If that's fine with you, I'll take patch 1+2 through my tree. IMHO the best for
patch 3 would be to go through your tree.

Sounds good?

Regards,
Matthias

> diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
> index 0e4e835026db0..a031b36363187 100644
> --- a/arch/arm/boot/dts/mt8135.dtsi
> +++ b/arch/arm/boot/dts/mt8135.dtsi
> @@ -9,7 +9,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/mt8135-resets.h>
> -#include "mt8135-pinfunc.h"
> +#include <dt-bindings/pinctrl/mt8135-pinfunc.h>
>  
>  / {
>  	#address-cells = <2>;
> diff --git a/arch/arm/boot/dts/mt8135-pinfunc.h b/include/dt-bindings/pinctrl/mt8135-pinfunc.h
> similarity index 100%
> rename from arch/arm/boot/dts/mt8135-pinfunc.h
> rename to include/dt-bindings/pinctrl/mt8135-pinfunc.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
