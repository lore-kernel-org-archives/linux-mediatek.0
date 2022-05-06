Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F14FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 18:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYsMhzF+GirpWhuJqvGy8iNAQfsmqPGwL21kdFlcYjI=; b=PnPnkmowGJE4yF
	7CF8CC6NPZIIzO3pPJyaMKzDwocOx17QyciIoJcVqoYiu2yA4EVpt3qI8IlBomNHvyH08KQYlY1sN
	LEt5jONeWfY/jItO266PuqQdSJnBVr3k8LsAnDgiIMYcjde1Elladk+ko+bZ0lQtGJYyMh47VbLfQ
	fWhQskP5c1mNR3IO4NO03QDshtfS6eT1XX10BXor7y4rPvtHcfQ9db+HKbL0DaTaJPQ6HE5Fc2rOJ
	T9Bmv2SgOyxWNzZEGZNEmiX8PIMrfSgtgl64t/nH7fFuDvLMMZbRxym0FD3LtXmr+tSKpLCYgp9B0
	FeU+z7UGLkCTPkdgwLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn39H-004lDj-Pf; Fri, 06 May 2022 18:57:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn396-004l8z-1w; Fri, 06 May 2022 18:57:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so11569571pjb.5; 
 Fri, 06 May 2022 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5dIUR/9OXHaQsKnUQAHcXzPBR02zvSDjZjPrNBgbY9g=;
 b=DaeLIIPtkaJwU2ohwvQwOr2wNsG1sQaw7AS57MJTXBgPqvfNufTSm+3mgl+5whqVHY
 LF3OCd7rcRp2Hgi1/MOmOJUl6J2nYDETr/Sf3NJPSoJmy8zVUp+YQOFrAFgHHG2uYRtM
 lIpagkR7Qe3Z983zssmXonzy3CJ7pvhunuxShrdNbjsbROJJFDs+NBdPzI2frJkVzyV0
 sE8WNgIBCSlhOovX1BYMC1hdUJf/gt/q7/GORKm31Bxmk0EIk2lTRRm1So2Ac+dVW6ja
 b6XIMliP0fLhrUKVwYaDP+pfE4vRXy5vaPjKhHSTLQPwj2X224N8hYJI/u5ymK3yv8zu
 L6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5dIUR/9OXHaQsKnUQAHcXzPBR02zvSDjZjPrNBgbY9g=;
 b=5/MIoYW9ZrW+QqdMkFiNaTj7/gzvBh0wjQAlVcY5QkTxjDnpwee05/68g69Q4y0Dsd
 Gj4bLVAfFFva1OpyOTf2fUrlaIS2jyY6E7ZMLfTnpkzjGIzP0Oem3OQaSVdTIkzsgJZm
 RjKK/3OGTbW/etw89VTfAOsxnulyW2M9qfz7G/ITpUxCPBvWe5toHkmPeDc3mMLdGv7M
 +viVHtgX4QlScjBhrLGfkPNgAz8u39BAsGBvLtQri1BylcyySp/S1jlhf+B/WrTGkY4R
 VRzFbXW6rapRnCS/LJg9yErGZbzfiYnAOpn+lR+jDuHVIkyAG3paVP5UMab8xFOGNFjA
 4aXQ==
X-Gm-Message-State: AOAM530ZPNW930CffbmXzBl+e8wKnG/RUQ81fu2+6xBXeDkCccOXTn0y
 yx5vvYG3ljoHdr2XFoZENloyBMMYmCfynQ==
X-Google-Smtp-Source: ABdhPJwO9azZKG2bTIvQhKP+wtX/+CwAnPeV5w1hcVnkdo01SGMmgOolv2xkl/VupuzuRn0jDb7hdQ==
X-Received: by 2002:a17:902:ec8c:b0:15e:a371:ad89 with SMTP id
 x12-20020a170902ec8c00b0015ea371ad89mr5098775plg.157.1651863461060; 
 Fri, 06 May 2022 11:57:41 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5]) by smtp.gmail.com with ESMTPSA id
 y4-20020aa79e04000000b0050dc762814fsm3756790pfq.41.2022.05.06.11.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 11:57:40 -0700 (PDT)
Message-ID: <0846a062-2ea2-e6d4-03c8-992c2f2e24a0@gmail.com>
Date: Sat, 7 May 2022 03:57:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-3-johnson.wang@mediatek.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220425125546.4129-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_115744_142998_4F561C29 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Johnson,


On 22. 4. 25. 21:55, Johnson Wang wrote:
> We introduce a devfreq driver for the MediaTek Cache Coherent Interconnect
> (CCI) used by some MediaTek SoCs.
> 
> In this driver, we use the passive devfreq driver to get target frequencies
> and adjust voltages accordingly. In MT8183 and MT8186, the MediaTek CCI
> is supplied by the same regulators with the little core CPUs.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
> This patch depends on "devfreq-testing"[1].
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing
> ---
>   drivers/devfreq/Kconfig           |  10 +
>   drivers/devfreq/Makefile          |   1 +
>   drivers/devfreq/mtk-cci-devfreq.c | 474 ++++++++++++++++++++++++++++++
>   3 files changed, 485 insertions(+)
>   create mode 100644 drivers/devfreq/mtk-cci-devfreq.c
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

I updated the passive governor on devfreq-testing[1] branch
[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing

Could you please test your patches based on devfreq-testing[1] branch?


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
