Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C11C47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 09:21:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D99608FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 09:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2D99608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZVLAjH02U73pA9Twsv03uMUnCiBiUzicCz5w5eqFkOE=; b=T0+EroXeGU3BpUVm+uOwCVYWjT
	jPZZv+m+m9E+0+AOfH+59xVYCv28dmkgty87f7UiC3Rc1Wqw8YLkm/qlfvKbjQ6Vc1SIlD2xdObkY
	8jC6NsiBaIbhQE1FcVnZdPSDbTiJtG4PylwXCSLwh8g0+zUNKPT0Vd8BK0pZAOPtGLHlC4KdQO5tl
	I5IDylxiSLVos/8jix38io+N/o8T5FVFkLmIodBKuEQBr6N9Q4gEJ8RxibFG+NRxPG/Pj3mrIIYvh
	PMU1IVB2QaQhi/rEmOdD5LypV3lt+qC/tVA26osYBnkWlF6+KUTU2FcUTYJ2ShgpCl353dhllHQx+
	8oPNB2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrGsR-000A8s-VQ; Thu, 10 Jun 2021 09:21:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrGOM-0000Iz-OD; Thu, 10 Jun 2021 08:50:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso6019864wmg.2; 
 Thu, 10 Jun 2021 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=44JZKXW5mlJ+V66lNHP+kLdlMsmv+wQwqYhG+XePn7c=;
 b=M7yW14u97s0esMMs5NLjNyxtwj6BNY8fZyF5sZK8eL0iaCFu/ff14nbLM1WLXapT8c
 xP7B3ubFVTXi9zKXlwpz5T5vTGo23jRWOKqANUpzdn+rnOFbL+yzyg0rdCD0Qi4mkyXy
 W0FyMfdZ13WgAMGzxC5wF+A/vEhYx4C2Y2BE7ytxDwXGLkTBiNtfQE71ZDGT18v2CKfY
 jfrfHYgByJTSqEK+uybf+x3IEJ8H7rAO8ePDaBcvHs6FAtFlKnhTk6JA1UwImYLFt998
 etkfyMgFQDdru6TrrZTaXxFnR87EmbRST5fl46lwAsJcdKQFsCnWaQwodLq3I0AmOcLq
 p3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=44JZKXW5mlJ+V66lNHP+kLdlMsmv+wQwqYhG+XePn7c=;
 b=gD5Ymps201GZ8BS6/WvvhrSLfkXiR5kH8n2kXhDM/ndNYyPzpxvynEKYskCh7MtZVJ
 Gh+wL5VzYAnE2YsfAhpt05FAT3YUswRpCMgmZWDxAoehv6RaXAl6OaIniFFZpYBprexc
 A9mf5H++e1Q9CRH26vUa4FuCljiOM3Z5SsZ1/XKoeR325P0tyuaRueDspDmAzoHoVbR/
 +lPE7AS4/XdJSHcuv84Shm/FXJ6Zk7jUBP1kacFUQ/QRbHRq4Nozt/6k3mYP/r8YrfLy
 +W8x7zStOC6Zy6u1OAGPrGXmX7nR6MoKW3a3jcgSwzcYM38End4+84CLcm3Ur4yPVlL3
 CeCg==
X-Gm-Message-State: AOAM530sQnak0gpko4W4fODb/7JLMk5R1WpMI/x01yqksZGSmfEOPITw
 fnUAbe5uXZNfvhlLxLY8JAI=
X-Google-Smtp-Source: ABdhPJzipKj0+rm+nYuqnnIexKWbIJ3xlkSONQUmo8ETNx/aSznC0DwV2AcZ+4LyWwkx6A/f1k88hw==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr3798921wmc.127.1623315019312; 
 Thu, 10 Jun 2021 01:50:19 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id v7sm2650858wru.66.2021.06.10.01.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 01:50:18 -0700 (PDT)
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "chun-jie.chen" <chun-jie.chen@mediatek.corp-partner.google.com>
References: <20210610023614.5375-1-chun-jie.chen@mediatek.com>
 <20210610023614.5375-4-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/3] soc: mediatek: pm-domains: Add support for mt8195
Message-ID: <f050f072-1732-b6f0-f505-2d0a44563ce5@gmail.com>
Date: Thu, 10 Jun 2021 10:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210610023614.5375-4-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_015022_855141_37F9C8F6 
X-CRM114-Status: GOOD (  17.29  )
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

Hi Chun-Jie,

Thanks for the patch, comments below.

On 10/06/2021 04:36, Chun-Jie Chen wrote:
> From: "chun-jie.chen" <chun-jie.chen@mediatek.corp-partner.google.com>
> 
> Add the needed board data to support mt8195 SoC.
> 

Please try to come up with a better commit message. Especially mention that we
have to increase the SPM_MAX_BUS_PROT_DATA.

> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>

I suppose your name would be "Chun-Jie Chen"

Please also fix your git settings to that From and Signed-off-by matches.

[...]

>  
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 8b86ed22ca56..1b8967b9829e 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -37,7 +37,7 @@
>  #define PWR_STATUS_AUDIO		BIT(24)
>  #define PWR_STATUS_USB			BIT(25)
>  
> -#define SPM_MAX_BUS_PROT_DATA		5
> +#define SPM_MAX_BUS_PROT_DATA		6
>  
>  #define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
>  		.bus_prot_mask = (_mask),			\
> @@ -72,8 +72,6 @@ struct scpsys_bus_prot_data {
>  	bool ignore_clr_ack;
>  };
>  
> -#define MAX_SUBSYS_CLKS 10
> -

Good catch, not needed define. Can you put that in a new patch please?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
