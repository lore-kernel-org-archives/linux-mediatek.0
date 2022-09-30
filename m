Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D39C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUPHkLfCnOExIOPw36MI3hiNQgUNOyt/+Ejs2msZtGo=; b=bfx6k6zc8cLgHY+VicWsaBP5Fi
	orCd+W9EpqoVQwE57TZOODWP3mudNz98t3w6dftt+1E0XezxldiLz8qxRXb4umLNQTqKLrwTXs68j
	4neOVnoN40r8MMR7OQn3kav4zvFHejBNAsWlyrOz7wwtgdGJad4Gjh3WqjkEljHaSrKUWyyb+l6SO
	RWwSGeOTb0t+TEtfdU4ao5/YWg2SFBhvqUNRltTaBsZ6cM2bZLNQ6vFbgVEciSJ5YDHCMbRAGnR0H
	PogErMIyadOg31ONI+PxStkrDivqZuegPEAEZ87pCQtcYM/m2pz2RbnWrMFfh5TePPlorSQ0bHMLN
	0ikVeCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFwd-009Lqn-AY; Fri, 30 Sep 2022 13:20:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFwQ-009LlN-MQ; Fri, 30 Sep 2022 13:20:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so4948962wmb.0;
        Fri, 30 Sep 2022 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rUPHkLfCnOExIOPw36MI3hiNQgUNOyt/+Ejs2msZtGo=;
        b=oaRVIi/nM4qtf2LWlFNRoa6QLY6sjwD6WQdykKgiDYikNPedM+I06euEHolmIDII1A
         GgjLJmjePVj/Q4Ylfn+cT+al+ZX0EA+Wug+ov9QlQ7N4DcHAp40UUwJjfruL1JnRarjD
         UzqUkcxUSWsy0pdzX8F95RU2Iv14z8W9P9iVHGI1RzEVsPtVWWZR5VnQ4qHarYmuL5a5
         5gbUPzro/PlyNUslpWj0Hu01LK27NOwoo8UqZsvmaZyEUQ5FY531oEJfTLu7khO0llTY
         8yAuBxqnjJw+QpuBLKuUyFcr5CJK7fjKJzcLKmP0dec62/I9V1TT9aC96Q9pk+D8ML3k
         cLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rUPHkLfCnOExIOPw36MI3hiNQgUNOyt/+Ejs2msZtGo=;
        b=Zml7M22u1INF6FYcOsrdPQ7Ppuwu3nMxS4Dd/luWagQfTurBPDBdZSqYyOOjKqAKe5
         1qf0olLaCQS+ArEimTHs4TRqBqWtrsovNCQt6bLzFgyTa5IaMD3TrLVaB98ygrIiH29b
         7AR7r+0kF4WIh7MawoPGRsN2c9ThTAaFiNF/5J5dr60Hamyoh6fclTB3oZTzlWYGR6NW
         MalmZ48Y4hqqqhgB725HeIYAgtRhVh8z+vyw56VWD2hQqk9aIBwnAwsThWWyXIg4HQd5
         sLyXYNQjjRBgeLtnIQqLEXbGmCfWgBJm2KFPPqww8EK2GZm6xOM7ZuYhl0FmmzhZiDPn
         Msgw==
X-Gm-Message-State: ACrzQf3n005kPn5v/nyhyvzXHBb7FHHmu/tf7typa7c4vrMrFR9Ojwii
	qrKU4xBB1mLi0H4Al3cIkdI=
X-Google-Smtp-Source: AMsMyM4pt64tMe4+pb2vpJpg8/j08+dib/aZWGT5IUsBTYyfLgJ+EoR6u38rGNGwI7+uqxhv/rIdEw==
X-Received: by 2002:a7b:ce0d:0:b0:3b4:8728:3e7e with SMTP id m13-20020a7bce0d000000b003b487283e7emr5601443wmc.182.1664544031821;
        Fri, 30 Sep 2022 06:20:31 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id b3-20020adfee83000000b0022cc3e67fc5sm1987475wro.65.2022.09.30.06.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 06:20:30 -0700 (PDT)
Message-ID: <bc6a4fe5-3f9e-6552-eeab-f1665d691f56@gmail.com>
Date: Fri, 30 Sep 2022 15:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7, 1/3] mailbox: mtk-cmdq: add gce software ddr enable
 private data
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220930095915.13684-1-yongqiang.niu@mediatek.com>
 <20220930095915.13684-2-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220930095915.13684-2-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_062034_782264_40792889 
X-CRM114-Status: GOOD (  23.17  )
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



On 30/09/2022 11:59, Yongqiang Niu wrote:
> if gce work control by software, we need set software enable
> for MT8186 Soc
> 
> there is a handshake flow between gce and ddr hardware,
> if not set ddr enable flag of gce, ddr will fall into idle
> mode, then gce instructions will not process done.
> we need set this flag of gce to tell ddr when gce is idle or busy
> controlled by software flow.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9465f9081515..04eb44d89119 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -38,6 +38,8 @@
>   #define CMDQ_THR_PRIORITY		0x40
>   
>   #define GCE_GCTL_VALUE			0x48
> +#define GCE_CTRL_BY_SW				GENMASK(2, 0)
> +#define GCE_DDR_EN				GENMASK(18, 16)
>   
>   #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
>   #define CMDQ_THR_ENABLED		0x1
> @@ -80,6 +82,7 @@ struct cmdq {
>   	bool			suspended;
>   	u8			shift_pa;
>   	bool			control_by_sw;
> +	bool			sw_ddr_en;
>   	u32			gce_num;
>   };
>   
> @@ -87,6 +90,7 @@ struct gce_plat {
>   	u32 thread_nr;
>   	u8 shift;
>   	bool control_by_sw;
> +	bool sw_ddr_en;
>   	u32 gce_num;
>   };
>   
> @@ -129,7 +133,11 @@ static void cmdq_init(struct cmdq *cmdq)
>   
>   	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
>   	if (cmdq->control_by_sw)
> -		writel(0x7, cmdq->base + GCE_GCTL_VALUE);
> +		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);

Thanks for doing this, but I think this should be part of a seperate patch. It's 
a cleanup and has nothing to do with the new sw_ddr_en, correct?

Regards,
Matthias

> +
> +	if (cmdq->sw_ddr_en)
> +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> +
>   	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
>   	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
>   		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> @@ -543,6 +551,7 @@ static int cmdq_probe(struct platform_device *pdev)
>   	cmdq->thread_nr = plat_data->thread_nr;
>   	cmdq->shift_pa = plat_data->shift;
>   	cmdq->control_by_sw = plat_data->control_by_sw;
> +	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
>   	cmdq->gce_num = plat_data->gce_num;
>   	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
>   	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,

