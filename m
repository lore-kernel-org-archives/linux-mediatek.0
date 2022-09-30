Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C30C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 13:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgiQh7mP8KwG/YiurXPmj99tTlJmmSjn1FaGlOzYS6k=; b=IAWWBwsKmBadI2E84Vr6acKfra
	XrC6fJkDkx9Mufbpcd1znPvvS628V4xl/w9x5I11yKF454herfJDDyaz4h8r5KNhQCUbs9j9oUISc
	lPcF9BlfwKCpqLZ3INtK9B/7IJr8Zsy3Z+IM67BnRGf465xdgurjLeXWjAofb9BBuYbm3+Ks0pal5
	2nDw11rQ+bqDZlKBUml130FiZqcMhADGCh3H5mcnAsXbbbVitOnpxlZi9CEFQrGb6SlW/42KgPpUp
	MMHE+Wy5Kt22kJXN8gkedtVI6oqsf5cgpqTt1XbIvJ/fR7WLQSuYNWThdRZ55kf2XEspF3bf94zNU
	DaCER5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFuP-009LBc-OL; Fri, 30 Sep 2022 13:18:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeFuE-009L7h-Ug; Fri, 30 Sep 2022 13:18:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id r6so6826843wru.8;
        Fri, 30 Sep 2022 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rgiQh7mP8KwG/YiurXPmj99tTlJmmSjn1FaGlOzYS6k=;
        b=J1PVYqGiQwSCTJwk6eVIAkLAaoQVwcWlWx4og5FPF95IVoe6rxARW+ZU41LLZswjVt
         DRPTvp+v2tfeM9CDKgXfaoanO+imTxYP0lmngQncZU4UWV5A44gOUtTFW4mn60SmHu9D
         nzF2eMtbimnzY1CS7bwZCjigOB9eE4Nc7OEkx1g9u1CG0cnE7xwjOVh2EPgoW006/TUP
         dzZNzAKPhutYm4HxNkyT7LZnDgorgnH47yiReW+k2fetW47+h8CgvCHVO4EA2ecSW8/l
         yDo6Yt9XqtuwWsIY6cxb5hn+x7kA+Osks6uETGpuek+lEtC8Bh7GeTFk0gX93epDA/qK
         BQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rgiQh7mP8KwG/YiurXPmj99tTlJmmSjn1FaGlOzYS6k=;
        b=oqRy15bGKDijaaGNkAvBrj6KM1BC/zT64dJB8b/HvjAuMjBS1PUNZYWx5Re4GrGnaG
         tg8r2vLj8ex3AMRXJ+u+M9XGNdKiNT7YDMT3YUl/ib94QM16t6Nsb/QYFhBC+fGev9+f
         hrDglmpOPAIJGGHsohhUWuqhz8xKWBsQmNqlNOg9t8Z2HEIkvXB1kTXZYInSXskGFoL9
         fHBhigQxS9rfVdHgxjMh3CmpsMPNIhVcng2OQwo7QBCdmtFB+1SLh0wnB4W5eU3nmT0i
         E9CbPBUIE3uGPQ4yV+5WEp7YegDYC+sglJBQ46VNi2SQMmQtfcX6VFXSPS1u/Q35c/jd
         jQnw==
X-Gm-Message-State: ACrzQf3BtoSdxbSEWFoMLPEx0nI5qWvu4a0ojBDPjtKq/ac/dNf0G4cM
	rgFFl8cVJHflsnkWKdHC1Fc=
X-Google-Smtp-Source: AMsMyM6MIuxu3qhuv0DkvpGaMMPc5S7P2yhXwxKVeIELOYwNdBiCpSdvg15YKFUyFTlXEXuBQmIHhg==
X-Received: by 2002:a5d:64e4:0:b0:22a:4997:c13c with SMTP id g4-20020a5d64e4000000b0022a4997c13cmr6029240wri.621.1664543895204;
        Fri, 30 Sep 2022 06:18:15 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id ay26-20020a05600c1e1a00b003b4868eb6bbsm2565061wmb.23.2022.09.30.06.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 06:18:13 -0700 (PDT)
Message-ID: <3de55ec9-568a-6240-c13a-f35adff228d3@gmail.com>
Date: Fri, 30 Sep 2022 15:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7, 2/3] mailbox: mtk-cmdq: add gce ddr enable support
 flow
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220930095915.13684-1-yongqiang.niu@mediatek.com>
 <20220930095915.13684-3-yongqiang.niu@mediatek.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220930095915.13684-3-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_061819_023915_93C2DA08 
X-CRM114-Status: GOOD (  18.11  )
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
> add gce ddr enable control flow when gce suspend/resume
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 04eb44d89119..84a60750d0c4 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -94,6 +94,21 @@ struct gce_plat {
>   	u32 gce_num;
>   };
>   
> +static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
> +{
> +	if (!cmdq->sw_ddr_en)
> +		return;
> +
> +	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> +
> +	if (enable)
> +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> +	else
> +		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> +
> +	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> +}
> +
>   u8 cmdq_get_shift_pa(struct mbox_chan *chan)
>   {
>   	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
> @@ -319,6 +334,8 @@ static int cmdq_suspend(struct device *dev)
>   	if (task_running)
>   		dev_warn(dev, "exist running task(s) in suspend\n");
>   
> +	cmdq_sw_ddr_enable(cmdq, false);

I'd say
if (!cmdq->sw_ddr_en)
should be checked before calling cmdq_sw_ddr_enable().

Regards,
Matthias

> +
>   	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
>   
>   	return 0;
> @@ -330,6 +347,9 @@ static int cmdq_resume(struct device *dev)
>   
>   	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
>   	cmdq->suspended = false;
> +
> +	cmdq_sw_ddr_enable(cmdq, true);
> +
>   	return 0;
>   }
>   
> @@ -337,6 +357,8 @@ static int cmdq_remove(struct platform_device *pdev)
>   {
>   	struct cmdq *cmdq = platform_get_drvdata(pdev);
>   
> +	cmdq_sw_ddr_enable(cmdq, false);
> +
>   	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
>   	return 0;
>   }

