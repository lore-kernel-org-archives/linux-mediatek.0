Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CDBCDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTN2loqrcEaBYbY1WHMRH/B8y09M49Nf4CIuqrkaHwM=; b=mYrGl8P5s8UhR2KTjb8/zU3a7l
	D1tDsNJF0jXqFCicc3f5MEWpPnXX6aiMwmfhn0vcqENdvUodH6crim+U3kAhhZscYcYfw9lpC1rvE
	y4pDk7yKRAEgAwvzztoVJko44v1mgb7YNPog1fHlXwrlwaTjHiLqce6WmxiA3BDc1/tEv6tDOOd0O
	xlyCqMei4Xw5B/ICCGltez871kAB9YYSPG5LYBbqZn+ALrPbSXVzzQYOM3oLu4GIYF0jzvcFixvOp
	oJE3D/hK6QnT/j1N8NjOuOCmxrWUAURAgnSj2HSg8xIiQ37ncUudPlpU22OvPJd3GfUZoHElL9vKV
	vXPzWgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrL6e-003sZu-1b;
	Fri, 13 Oct 2023 16:33:44 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrL6c-003sYb-0g
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Oct 2023 16:33:43 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1e10ba12fd3so1288572fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Oct 2023 09:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697214820; x=1697819620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTN2loqrcEaBYbY1WHMRH/B8y09M49Nf4CIuqrkaHwM=;
        b=Ve7eiEFVLlVuUESOFgS0l7LZ7EImikVBbyVZjdp41WoG6h2ei7uXOmNNOa+ObCXlDn
         ybiaPMFM+woOsGqYMgLxb3G21WrzTCaV7wiG4iZLze3Cs3gkuij/XHRZoFCcUWItWjf0
         BH53kY9V0Uxt0XLgIroOxqHrISX6POkaIv4uhCLM2cnm2okTMGteMK4+NSXuGQQ0fHJc
         Gmjtr8yGibhvhMGcAjC7Io330lewVlJj68rtbron6pnchiTYbxeTtZ0nzGn2W+75bSX5
         tzyOTRJaFGBmGzxQwViParuPxeE3qU8I5zkVvxcQ/iuzpOe4pZpuXr2FJR2oh33R0a2S
         DPTQ==
X-Gm-Message-State: AOJu0YwRczrYal4EMNghVZf65wJ8KieBMdwhGprOeH4C9hD5xYc0dMEF
	FYlsece6XlXOrYrFcO5B29g=
X-Google-Smtp-Source: AGHT+IErzh9fHI8XgM9IAnJuH3I/OxiTpALdkmg+1lAEo52E44ghLqKHqaBGLD4ZVEM3FM4nPb3ZOQ==
X-Received: by 2002:a05:6870:8181:b0:1e9:b653:94d with SMTP id k1-20020a056870818100b001e9b653094dmr5709127oae.1.1697214819921;
        Fri, 13 Oct 2023 09:33:39 -0700 (PDT)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id c14-20020a63724e000000b005897bfc2ed3sm3581014pgn.93.2023.10.13.09.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 09:33:39 -0700 (PDT)
Message-ID: <dd6f13e7-ae2f-4821-849d-8ca43ad48144@acm.org>
Date: Fri, 13 Oct 2023 09:33:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ufs: core: fix abnormal scale up after last cmd
 finish
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230831130826.5592-1-peter.wang@mediatek.com>
 <20230831130826.5592-3-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230831130826.5592-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_093342_252375_348C1232 
X-CRM114-Status: UNSURE (   5.36  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/31/23 06:08, peter.wang@mediatek.com wrote:
> When ufshcd_clk_scaling_suspend_work(Thread A) running and new command
> coming, ufshcd_clk_scaling_start_busy(Thread B) may get host_lock
> after Thread A first time release host_lock. Then Thread A second time
> get host_lock will set clk_scaling.window_start_t = 0 which scale up
> clock abnormal next polling_ms time.
> Also inlines another __ufshcd_suspend_clkscaling calls.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

