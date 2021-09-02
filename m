Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBDEC43214
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 13:39:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA73610A0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 13:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAA73610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxh4anfjnL7GyxtLOWAFhL5DzC+DdtluZT16UcGD+pA=; b=hj7D2cDqwhJwD34ygVMH9Ku+7g
	I9ABExGt9DnBdZHRB7hceJwgjKtOV4u9ueQs/otm3hBbXx44JsWCg4ttOrjdgAALJDbtXpImJvhOM
	84EwdBNDa39xyIBXajMXy9Z8LqDFd5QbWB1q2uugGT699iCN5ws3Lg2LOEajO9r0aWuUHLcfPx9cn
	70FBzI0N1XAmiayRvkK7yvy04eZm62qLywZj38K1kgD2r6RG4vkNG1nrtk7U+d5FT0EvXeh4zPNBm
	r2c0emBKodnsHDxw2R7VsrDpQJJA2CZpteN2pSKndnHDqJ9EYKvGD53aQt5G0yyMkmhZZ2yIV4Gjd
	MgdE3RZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmw4-009jY2-Fr; Thu, 02 Sep 2021 13:39:20 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLmw2-009jXU-2N; Thu, 02 Sep 2021 13:39:19 +0000
Received: by mail-oo1-xc29.google.com with SMTP id
 y16-20020a4ad6500000b0290258a7ff4058so527261oos.10; 
 Thu, 02 Sep 2021 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3i9b/QDZb0cse/arJkVkj0b5E9JeYEobASX++MvsNrs=;
 b=NfYAO8z9mtmm847ShzIy99zyzotuORd5O5hOaViSCS4pfEiM87XvbYr67wtREsZZQ/
 OkJ/irNVWESUmnQXvAxZV9FR9ZSTpECRewMRz2LhQioy5Dxa9C3dDVspRT8aN595yDYc
 ZVxGv0uq8/qD9BIdg7KQN2FzModAbyf0clX1uUwPmQ94Yf5BuZVMe5o3hXk+peBhtPO1
 XxWiSd66X17EYcD2qctpzkmnSWMiFe7zlytAPbB+Bz65nRk3DWE5NrDsHPTgV9bcWJrH
 7BddXBHw7dHINar0EU6Kqbw5rRjgybCOXtuX7ivD6d0jGTVSmKN+mtiKekgO2eoL3zlG
 YDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3i9b/QDZb0cse/arJkVkj0b5E9JeYEobASX++MvsNrs=;
 b=Q+g72i1VP//Dw8Fdvnr09U0POzn8ZYRku7m3fEUAKi3kY0ok+Txb5OCuSrr9C6mM8q
 knQdnhxjACsQjcissm4jeFMFcLLxK7Jgdn8q6YxAnHZ18qljGSqfvthKDWNK/zvzcxAN
 53PN1IxmTcm6IpPAZ34EmhzNkM4JPA6swVT/DGsSzREOFIOWKdK+vLma3yWqzFW2WOCq
 xRpohr8KJQCfdxE5URtfn/LWxuH604S+q++SyvWlMrhS+KIPUp7aaTGbI78vptDxaf1F
 bF9IvrC6L3Aoyn71uqWW1HuITlo2r5a4XDbMwEIMNxvEzJiglinVZHyc+OOGU+rw2Wl0
 TQyw==
X-Gm-Message-State: AOAM533XEIdEeeBoEergg23Zje9MhjXSnq1bhMwKbcyyhFf0bHiKbobZ
 K2t7soNDMh7jGv0ZCoHKpXaQKMtkm/4=
X-Google-Smtp-Source: ABdhPJw6UxVSqB/f6mIJ0rQpsJAWLniTlOizp9qJQDJ94lgl/iCffTkeQbomVaSHwrz0N7O+ZtgJRw==
X-Received: by 2002:a05:6820:613:: with SMTP id
 e19mr2630962oow.67.1630589953913; 
 Thu, 02 Sep 2021 06:39:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n13sm339294otr.11.2021.09.02.06.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:39:13 -0700 (PDT)
Subject: Re: [PATCH] watchdog: mtk: add disable_wdt_extrst support
To: Fengquan Chen <Fengquan.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: tinghan.shen@mediatek.com, randy.wu@mediatek.com,
 rex-bc.chen@mediatek.com, christine.zhu@mediatek.com, joe.yang@mediatek.com,
 zhishuang.zhang@mediatek.com
References: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4a7c1fa7-cd56-54c0-7b3c-ed48ec0e886d@roeck-us.net>
Date: Thu, 2 Sep 2021 06:39:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_063918_170880_11A94540 
X-CRM114-Status: GOOD (  14.69  )
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

On 9/2/21 1:04 AM, Fengquan Chen wrote:
> From: "fengquan.chen" <fengquan.chen@mediatek.com>
> 
> In some cases, we may need watchdog just to trigger an
> internal soc reset without sending any output signal.
> 
> Provide a disable_wdt_extrst parameter for configuration.
> We can disable or enable it just by configuring dts.
> 
> fengquan.chen (1):
>    watchdog: mtk: add disable_wdt_extrst support
> 
>   drivers/watchdog/mtk_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 

A single patch does not require an introductory e-mail.
Also, if provided, it needed to be numbered (PATCH 0/1)
to distinguish it from the actual patch.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
