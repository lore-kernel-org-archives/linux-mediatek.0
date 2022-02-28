Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CYGZEmk3SA8zrRKFMlqDJ/9YaZWJtnzhFo+fxQyjEI=; b=q8c8jNJSsaaDxb
	JVhYrINuX5OWZxKYbNvoFSaY0CnHXaJAcNoCsEc4KCI+9eEggHCNmUyds7D8vnX24POWqswzRWtO8
	S1bx/WBDQEO+/eVWTWhVyQEpFs9GW8gdL7Q8vbcfJ2CdzxtPC35oyAwBMuxtB4zEI3IxNG6ngEg90
	osiZYVq/gpJW/lWejYGoiy82xT7I9OU9Pm7IMaXHZeyzWLEYmJJq3ceI+ldGvrl2nv39XbcMGK9bp
	IJP0lNLn27WP9LWZcNyZPpEWBOo/4hn2qPDlvxA0SnzgC/SXYdqkAx8h3BKilKCf1gsAy6RqBm4av
	0Gmoj20FES8u9CCQ5v+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeCx-00BsDO-Am; Mon, 28 Feb 2022 11:28:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdop-00Bg4A-Hu; Mon, 28 Feb 2022 11:03:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 10-20020a05600c26ca00b003814df019c2so2657847wmv.3; 
 Mon, 28 Feb 2022 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HvlBrGZe3k30BhTU3ooPh1DKTxRvIE/QsqhoPXiARb8=;
 b=YZDzVUA06hC7fLLgFFGDrJUe/L/Jhq8JcpzlSH+Tgsd8NHfbVCW0npEiPlXkWZsjbw
 cpkqPoYNF0qz47H7UqE6lglNuuW1aleetoteSyZHHtJS61PD8QeEjmcPgO7Kkofbe+7o
 D8lVZQOcqgUhG1AVNJtjxpIcRhsJB2yS5VFEuOMjsHTqlxI9kFGvaU4Sl1CPWoT1LEPT
 N67gzU9S4QkkTuFLT3KKeWwa6ATJObC3K7geSv6b03W/FOv+95S8lJCgjq7H583TsltU
 8s3X8yEvQsC63IVY5rT2yq3Gq/ws3Jb5Xz+BAvW+wojNJ8iuivq7kBAWJODQZFHL+mA+
 qWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HvlBrGZe3k30BhTU3ooPh1DKTxRvIE/QsqhoPXiARb8=;
 b=EE+G9Kr49Fp42EWkflTQra6+lxHNDOvZFJ+KYtPikbtWm2dcpWKQPzl6B8PacriZQj
 H6KGNUfSzd9uFSUfcScBvkl04kaQywuy1aO9fWKXLTIwdMpCq/BQs3t6+rA3fuVv8bqz
 BWANVJbbYHKjeAErmmA47FIJdkPODdZ03R02V0hZFBO1jz9yKfoDWzpfD6uYYDevuR3x
 egdz7fppeRFoB2JSblc8aLfe8FAOWcl1xfDtUg60kuojYodSmh+2RJcRPjl+0bS9T+1N
 ttenyZ1ZjMlmNz6jDsQt2ACjAjaeAvoigC3tuILvB3ARLwXer4nTBD7biQOCY3BjdU6T
 himg==
X-Gm-Message-State: AOAM532kLy+54mTPGc9iUYK3HjsXuUtdP5w8uv46NO5hyxXKiS4A0H2q
 GPLiUI3TznYS4ls7ahp1jisfdqC4dWZjHg==
X-Google-Smtp-Source: ABdhPJxw/8fh3j3lFYsbND79fHSYnmbZI1uniemUFfXnBo3sWPkcxqViNkBdJYKkKImNjmciYhDIaA==
X-Received: by 2002:a7b:c057:0:b0:37b:ebad:c9c8 with SMTP id
 u23-20020a7bc057000000b0037bebadc9c8mr12989438wmc.61.1646046233624; 
 Mon, 28 Feb 2022 03:03:53 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 10-20020adf808a000000b001edd413a952sm10342670wrl.95.2022.02.28.03.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 03:03:53 -0800 (PST)
Message-ID: <1b0ad14d-5843-b8f8-ad6b-d3366a611dde@gmail.com>
Date: Mon, 28 Feb 2022 12:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v2 0/2] Mediatek MT8186 power domain support
Content-Language: en-US
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220215104917.5726-1-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220215104917.5726-1-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_030355_658901_A444994A 
X-CRM114-Status: GOOD (  11.80  )
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



On 15/02/2022 11:49, Chun-Jie Chen wrote:
> This patch series adds power domain support for MT8186
> and depends on [1] based on 5.17-rc1.
>
Whole series applied,

Thanks.

Matthias



> change since v1:
> - change to dual license in dt-binding
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=609799
> 
> Chun-Jie Chen (2):
>    dt-bindings: power: Add MT8186 power domains
>    soc: mediatek: pm-domains: Add support for mt8186
> 
>   .../power/mediatek,power-controller.yaml      |   1 +
>   drivers/soc/mediatek/mt8186-pm-domains.h      | 344 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
>   include/dt-bindings/power/mt8186-power.h      |  32 ++
>   include/linux/soc/mediatek/infracfg.h         |  48 +++
>   5 files changed, 430 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mt8186-power.h
> 
> --
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
