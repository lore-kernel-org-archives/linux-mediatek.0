Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12830C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:11:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B986195C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B986195C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r6+CJqfp6nWB7sNq3xfI1d6QNBLmMhVPxplzH5QGfJI=; b=dHhGrTvCHf+VAm/UYoC1uxGVe
	1cZarEquEL/NtJrAV90hm6isAjk6jqJsrhknwKy/ZyFHwnOLsyNzm4eF3O4OeXrEx+HCWTit2J6MY
	Y99GYMt8hSxu0O/Qio5qi6KjlD49M6zQdmww/yVlTxRN9uIqUeGtI05fS0lu7oR+64aQrkfVvtoqo
	3BqiL2Naix1qIEQo6NbHDp6+dfiE9AuvOQallODnBNpERNvXvcYipIdj4sWOuP2O1NUVg0BVtUtP0
	LScVtaqfCLs+E1GoBICvQg7crbAlUbD6s+pEBi0gvsVVEm6iuIeGoNzwsVDgnOXqqQ5dqWU7Dx/vx
	DmZgSZG2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRYkL-006NP0-R8; Wed, 31 Mar 2021 11:10:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRYbX-006Ju1-8w; Wed, 31 Mar 2021 11:01:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id k8so19220117wrc.3;
 Wed, 31 Mar 2021 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:references:from:subject:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HAhIfCQ+mBWnswdejnwbejzH4FaA9h1d0ZjzSYKZEME=;
 b=YCnGKukVouS7rkCDjXX6Yc62SurfBGZOtz54DQy1yOspgkm7F0w62awSMcn7a96KRi
 JX9RaIjV7sfDccUnUF8FTNxFBfTqjlEz2ZqrmHenFQLVaX2g7uy3ialDzFAENwez/osI
 Vr26DAANq2zjrTqqUCvZvI8CiXJ5912isBPh+MgFKgz5CiTMT/7qIH+LAuMU8O6yIlyu
 3onfV4KtxU5PycHKJDiFKSgVoD4MTzCstQENeiah8YxxTWXAOawB17iQMPHFemZJpf9N
 +1yGPfFV/cugOfo6s5ZqX3juRuTP+zI3NYEG7kC4fAnrmqQvTFr/ijEblv4/EjrJ0g/r
 gUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HAhIfCQ+mBWnswdejnwbejzH4FaA9h1d0ZjzSYKZEME=;
 b=droH70+0ddF62g2YyNTeQ9FHkRdeyMfObLQJ4GduPRSg7DhzWHFE5+UJLpsT7l++Qx
 pItDlM65Lutm6YjjR9oNLpSjVxHoG3i+6Nd4WWlUb9d/KzJrjH3KK14kCQUp3GtnCAw7
 DI22yYSwkNGaEaIMFLpNM6bh7pmTOrJkILhw6QaOOBXIl23PRdnGo1hHoe7Yr1HK3U7n
 SF3gd48eryHREmb36FOp5TG1xe7asL/qMLmHkGarhmz7FP8LS0+tibaUNyqpZcPbT1WY
 lRd7Aj7mmjTvVk1V6V59j5zeYrybWkL6GHO9Coyk/ha5Aw5qcPobSfAvIUplw+shxHmF
 M4Vg==
X-Gm-Message-State: AOAM5321ou2zBUWuzoZ/T/usZS7UmUFTSCXVguvzwlyI2VZ5aSovCOA1
 yUhf1sBdJTgPpOwtzXNWTP8jtbg733Zl0A==
X-Google-Smtp-Source: ABdhPJyzvkcg1Nzw2O81sq2cyAk9HlnaAuUBneSFAcMDEfnmxGsPYbbm0P14gKvDv8IQKwks3v4eig==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr3041345wrd.132.1617188502697; 
 Wed, 31 Mar 2021 04:01:42 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id f7sm3270564wmq.11.2021.03.31.04.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 04:01:42 -0700 (PDT)
To: Bilal Wasim <bilalwasim676@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, enric.balletbo@collabora.com,
 hsinyi@chromium.org, weiyi.lu@mediatek.com,
 Fabien Parent <fparent@baylibre.com>
References: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
 <20210201121416.1488439-2-Bilal.Wasim@imgtec.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/3] soc: mediatek: pm-domains: Use correct mask for
 bus_prot_clr
Message-ID: <c0cace72-e114-6b00-0254-c103e52a7b1f@gmail.com>
Date: Wed, 31 Mar 2021 13:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210201121416.1488439-2-Bilal.Wasim@imgtec.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_120143_555878_EEE0A6D3 
X-CRM114-Status: GOOD (  19.93  )
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



On 01/02/2021 13:14, Bilal Wasim wrote:
> When "bus_prot_reg_update" is true, the driver should use
> INFRA_TOPAXI_PROTECTEN for both setting and clearing the bus
> protection. However, the driver does not use this mask for
> clearing bus protection which causes failure when booting
> the imgtec gpu.
> 
> Corrected and tested with mt8173 chromebook.
> 
> Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

BUS_PROT_UPDATE_TOPAXI is also used in mt8167. I'd need feedback if this would
break that SoC before accepting this patch.

Regards,
Matthias

> ---
>  drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 141dc76054e6..7454c0b4f768 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -60,7 +60,7 @@
>  #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
>  		BUS_PROT_UPDATE(_mask,				\
>  				INFRA_TOPAXI_PROTECTEN,		\
> -				INFRA_TOPAXI_PROTECTEN_CLR,	\
> +				INFRA_TOPAXI_PROTECTEN,		\
>  				INFRA_TOPAXI_PROTECTSTA1)
>  
>  struct scpsys_bus_prot_data {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
