Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C752C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 16:13:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDE220786
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 16:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z4a8mkoo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7gWS7x5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDE220786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e890MTxcYy5/QnpqGdjy2dyrk4oOxeBXkkoBdeuIQ8s=; b=Z4a8mkoofwiMFoasq7LtX5V6T
	NlZqoYxwDqo5xyz7kHqsWPZjcgVUfGg6nxnfyM4rp/BYDkqisO6wf0PudDusYPUIiLigsLiOersxW
	AiIMHxarfV0wxY+Xoj+ULEMc/KKVyYNGHTQu8/jbkHzJ8kd9nn86KA11CfPJahLgsbkXquraB3JAd
	V2zqilYA1GaHjknETjqyGP2GsxCZMVIZzx5rjrB5FBv/tL/iEEHtpj9j5Zg+XocCmbSQx/fw8Si0M
	pnsUfq+VoIRRRkO2rx6NTrRLK/tKlWsAA9VFiC/vBinPeqFU7mI0ngsJU60aCANb02BsWiub1KdrL
	a9hZEpveg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kigMk-0005Gl-1Z; Fri, 27 Nov 2020 16:12:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kigMg-0005Fd-DI; Fri, 27 Nov 2020 16:12:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id i2so6120741wrs.4;
 Fri, 27 Nov 2020 08:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eXqA66SSXSjOYL7nUJMPq8DdoGjGHwevZLW6WLAEElY=;
 b=N7gWS7x5A52K8T1zw0wAND5sZ/5XsYmmE0RCNZ2Wuy9ZUeZIIVoT/ZY2NeuhNfP7ux
 7Huzi2chLlyuA68tfuMVetfMpzQGD9t5WWNHEhOCaoQSyWhTkn1GqLUNT0BD6xeHy7Z2
 A6YRxpUCcPof9j+1WMCgyzySpnsVdfVqqITxfAzcrM0vuDI9pj3PJFiiZUacgaqk+Mgj
 YS1vaabEloZ8bf9ViOar13AYkzqjGv9PBIF1zkODv6FoKfRoxUXyxrdV1cULmcGl/LUi
 ZIFmBkp95BINqX82z5eRaNaSJ/kA6XpGi9vqLSKGSTijln/npRSAfzAv+bg1ZV7dK1rb
 nZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eXqA66SSXSjOYL7nUJMPq8DdoGjGHwevZLW6WLAEElY=;
 b=Q2mrM9dEmW4vc+h2eaJJHAFOiZ2KSdymgP8cvUFa9J3LnT6kKQfeei+qQn+Jg2/alC
 8AVeIcp+uIKvA15n6gOIUxEgqLjHCSG8AIeD+2TDeuyqZwXwhMZFdK9k4fzBCBbpOJPe
 5ke/KS7H3XdhsV6ipI4KBPCraaYAka++vU7QFK2lI40q60+S8MIqPce+AwIMGX9z+fF+
 xrzX9QeTsj9ANQvAaEvTYTkmViJQ4V3xxg6LrL7PDtietHUL4wNdCwJemDKl01ACV5Fd
 4/nbtLJHv12jQ4DdnJsefHqXRnAGhWQ7B69UbSKXFchL5sHoXfiiIC8KduTabbBp9qzN
 PTfw==
X-Gm-Message-State: AOAM532IAySLEgI3yO3SwuQ5bIH6/Wbbw/fiXMNs2A45uTEqu2Tf+23G
 T3wxymzZL1yxazHFFpoTOvw=
X-Google-Smtp-Source: ABdhPJzp1q4bYCuJp9sGSOAEKbZTGkCjwZtlbkOLd/Quw+3RcvdAkkCqfaO9Of2YoaLukCQ8MNcbkA==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr11489578wrv.243.1606493573151; 
 Fri, 27 Nov 2020 08:12:53 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id z19sm13971840wmk.12.2020.11.27.08.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 08:12:52 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: assign mediatek headers to Mediatek SoC
 support
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20201103060733.25729-1-lukas.bulwahn@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9bce8087-b734-d6bd-c21a-3e9701cc1d94@gmail.com>
Date: Fri, 27 Nov 2020 17:12:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201103060733.25729-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_111254_588296_03E31243 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 03/11/2020 07:07, Lukas Bulwahn wrote:
> ./include/soc/mediatek/smi.h and ./include/linux/soc/mediatek/infracfg.h
> are currently not assigned to a specific section in MAINTAINERS.
> 
> ./include/soc/mediatek/smi.h is the header file for definitions in
> ./drivers/memory/mtk-smi.c, which is assigned to the section ARM/Mediatek
> SoC support in MAINTAINERS.
> 
> ./include/linux/soc/mediatek/infracfg.h is the header file for definitions
> in ./drivers/soc/mediatek/mtk-infracfg.c, which is assigned to the section
> ARM/Mediatek SoC support in MAINTAINERS.
> 
> Hence, assign those header files to ARM/Mediatek SoC support as well.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Matthias, please pick this minor non-urgent cleanup patch.
> 
> This patch is part of an initial experiment to assign all files to
> specific sections in MAINTAINERS. At the moment, about 3200 files are
> currently not assigned to specific sections and maintainers.
> 
> If you think these cleanup patch cause more churn than value, please let
> me know. Thanks.
> 
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b4197e9da495..1703c7d2e146 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2066,6 +2066,8 @@ F:	arch/arm/boot/dts/mt8*
>   F:	arch/arm/mach-mediatek/
>   F:	arch/arm64/boot/dts/mediatek/
>   F:	drivers/soc/mediatek/
> +F:	include/linux/soc/mediatek/infracfg.h
> +F:	include/soc/mediatek/smi.h

I the most important file is missing: mtk-mmsys.h
smi.h is part of drivers/memory and should be added to Krzysztof entry.

Regards,
Matthias


>   N:	mtk
>   N:	mt[678]
>   K:	mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
