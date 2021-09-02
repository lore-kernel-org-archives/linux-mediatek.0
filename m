Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AE1C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 13:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC12C61059
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 13:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC12C61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBT78BOifdVKUEaRqE/QAE0kbB3KSodsjtPtxSUskLA=; b=lkOa1R/FOVD99uZkiZIGLVbioV
	WWWH9eEikuQh/95LLbN3e4t77vOKV0zysY403OqzwHMeM7UyBkoZ5FeLb7XQCCrNfBNWATmrWMQuI
	vnoOutmxMCoKtpI9HjfUuG0rJPQD9muCTrsZbpEi88TsjjEvRFv2Dx0A0pVPhviB8xpI/kssf6qsI
	49HGFuKVnRlORJMU2N3xL94GiNsERxbHuxF8iB0uop+3nAg+y/BEvFG2TKlnxmy2TifqA5DSetYE6
	q+FQXA4fNtdT7GJnzPX2/O/yciHaUcgOrOI66fFU5XbHGtYqgqvLKNxt9nkOqBiyMJVLl74sCBaHU
	Swk5d5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLn0U-009juI-6F; Thu, 02 Sep 2021 13:43:54 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLn0R-009jtF-GN; Thu, 02 Sep 2021 13:43:52 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso2508209ott.13; 
 Thu, 02 Sep 2021 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HE235/mk/bT/zxikKcuwhXM6G64fh6+hmbGzpNdUjKk=;
 b=ivdbizEGV4wUWpUSChSsswSUp1vDcIzdNH51EL1xTFsqgMvjN06Z53ZUte0lZipv2H
 HY/EXq4DZvSqEGxjZu0VxoqF5DGtJEY6CEIIDF54r6GX+T9jSYo3vMRKSZ3+EKaj0tTh
 j7LEwuDV91aJJJztofZZJgyXDfEwffga72yTysYx5e7AiQjiVgt+m0uSM6LnTpuSAX7/
 ARAwjfz/yfxjAb75yhxyomktUso3zseD+aFCSjhTEPMJggF7nF81vThVx3KNdBHdNA21
 2+qnm7gTotuifhGSqeWScp8SNTBdtYJuv+xKzWBZhk/YO5hK9j2YkEo19awMN7LPAdIV
 ml8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HE235/mk/bT/zxikKcuwhXM6G64fh6+hmbGzpNdUjKk=;
 b=dXxZvkk7vLpnytl70jJOWNRdi4RI4Obgf9Znzro1VUQw7qdawLMIC16tDO1Twii3AX
 KVTNK0roGjgVCMkXSRTIgS8fdqJp9XQoI87vk9fgrCHMJ7g5hqei8C3kvm2wQyRjK5E0
 ZpnSVIKLFTNpEcrr2wfJsbbn/k57zNBSdHsLZ9cHA+E2wah6lQw4k3ZfMCHoIh0BcCRZ
 vxfNILYXb1Z4QuQcvRUyT4pe8Pw01ZpZkFlCJUxVrbmExgLIC2KdrwaPUnoWF4ERx7yt
 QBbNkUW/EbVyCnJ565ETGIYUE46JU52UjH8DtuDKUXHuayFlEWuBA974zkjePAc7QB4o
 aUCQ==
X-Gm-Message-State: AOAM533kj4zXlky3d8LW4GerQQfTGc0AuKGw/EyepQnHSfhETEAWWs0B
 aWCVEWg+fofRxLBHO2E18go=
X-Google-Smtp-Source: ABdhPJzvT9pgA/VoTeJa1wp735xrELEdJoBuboxjZ3tM94W9m/5OuIAGxdBFRadPLGFIQ1Jmqq3WfA==
X-Received: by 2002:a05:6830:124b:: with SMTP id
 s11mr2657581otp.90.1630590224195; 
 Thu, 02 Sep 2021 06:43:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f5sm387641oij.6.2021.09.02.06.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:43:43 -0700 (PDT)
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
 <1630569881-6032-2-git-send-email-Fengquan.Chen@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5fe9c774-c619-604e-1f74-12ff6bfe826f@roeck-us.net>
Date: Thu, 2 Sep 2021 06:43:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1630569881-6032-2-git-send-email-Fengquan.Chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_064351_600033_AB8A0855 
X-CRM114-Status: GOOD (  22.42  )
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

There should not be such From: line.

> 
> In some cases, we may need watchdog just to trigger an
> internal soc reset without sending any output signal.
> 
> Provide a disable_wdt_extrst parameter for configuration.
> We can disable or enable it just by configuring dts.
> 
> igned-off-by: Fengquan Chen <fengquan.chen@mediatek.com>

Missing "S".

> ---
>   drivers/watchdog/mtk_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993..4824c07 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -63,6 +63,7 @@ struct mtk_wdt_dev {
>   	void __iomem *wdt_base;
>   	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>   	struct reset_controller_dev rcdev;
> +	bool disable_wdt_extrst;
>   };
>   
>   struct mtk_wdt_data {
> @@ -240,6 +241,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>   
>   	reg = ioread32(wdt_base + WDT_MODE);
>   	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	if (mtk_wdt->disable_wdt_extrst)
> +		reg &= ~WDT_MODE_EXRST_EN;
>   	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>   	iowrite32(reg, wdt_base + WDT_MODE);
>   
> @@ -309,6 +312,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   		if (err)
>   			return err;
>   	}
> +
> +	mtk_wdt->disable_wdt_extrst =
> +		of_property_read_bool(dev->of_node, "disable_extrst");
> +

The new property needs to be documented and approved by a DT maintainer
(separate patch). Something like "mtk,disable-extrst" would probably be
a better property name.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
