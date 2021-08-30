Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F91BC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 05:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A8760F12
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 05:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6A8760F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZYS3gemasUdlO/bthsECqgg0JOCkXOoIEX1vDgk1ek=; b=c+sT1TaH2L1/fU
	VWfIdGH5697B08+4fNrLOv27NLea9VLgtGfTUSk+It9kj5qNZBqU+h6UwsAqww/Ybu2gi0W2WNMWs
	Y+h0XvIX4cZ/oJk807iQz8r8C9KNkDV7WgaWgpuUEjZs2bz65q/2dxe8HOeyG8QiDZHBgxd3JEm32
	wfbm7S3PZiwU6QtYIEIiBELbLHddFr1Xfdzi6of9iQLaXe+Vbz4lO90I4IeanOILDkk4s7WgDR9Rf
	atWgk3kYwBDhcrHZamDtOWfHVjRUA8UXosC+uBkaZmFFEcPp3tHychR0oOhUyJutci+vRmde71Z++
	F4UMTVWVsGZpHq/6IYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKZZl-00GS31-6z; Mon, 30 Aug 2021 05:11:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKZZg-00GS20-0O
 for linux-mediatek@lists.infradead.org; Mon, 30 Aug 2021 05:11:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id u6so10620738pfi.0
 for <linux-mediatek@lists.infradead.org>; Sun, 29 Aug 2021 22:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cWgVMXSad5yZ3bSOJM1fkZY0lTxqB0etZLZP8BLZWaQ=;
 b=Dvm58Zl/eh6Y1ogYPdZEXoLGCZocbMiYuV4MhZMMRvGkLgoz6LoR1BoePfSII1Lj3C
 a7eu0FRp7nYY6JoY5ko7EEdcBQoRpYYwtLXHNgzvckvM8WPawZhen5cxszM0mrWe8IdE
 1mxJJ7tsp6tLFbdClK0nmHM7hnsQOLqT3XXkv+lys8t0NLfN3pTESrrY3iNdLQlwBQy4
 voGZtnxgH/TN8mMMztgF62xy6l57HbXhX0b3yh9XIj7VW4PJMsWIbdu39LDfmVzCaEg8
 0HwaT0UNS6R2IKLAD5xPefpCveIQ20hoAvBqir+0cj8F8gvqIw+KBxmuaoQ7aRmZ3HMp
 A90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cWgVMXSad5yZ3bSOJM1fkZY0lTxqB0etZLZP8BLZWaQ=;
 b=gnMP2/8WATc5FCJRtEjC0cJkqwJLAfmF3kelh9saIkwZblGdGg3Etuy0B/JgEROuxA
 FiZ/kO3uxMLLs2Ee5dinULFxGU2Jwha4yEhLL5tFZCP1pOulyGUlpY0IF/jXPFm7LS8N
 edzEpCWLUB71bWAE+pnw9h9PS/uTKWC8RYI8l4xkC/ByknDXi/RFwImZW+lrP1BtiLh9
 M1P4V+0XRlRawKPLBEgFxP2UUStQo5ejC+CsVE3RU2Up6DyT0YLwjbhWgX1vn8Rk/hoc
 jZjgu6JNWvPhd1oDjbSibUmfigE+ZkJk5UxGzwoJ0YWJuUE2pnGMA8k8aLba750vob3g
 w05Q==
X-Gm-Message-State: AOAM5334ykj/RJ6xn/GDAEaxZ2oabzwWIojye3dAsi5xfRFgNbBS1kE8
 Ytq4bgHMcs/j4cHJk25VgrY03w==
X-Google-Smtp-Source: ABdhPJxVvZKVY4Tk4ROefO4P5N5TZZU6g+xJz7KhOKoLTAr78z/oKOO+sfplxt4Y96r0FgOav2n/rA==
X-Received: by 2002:a62:a20d:0:b029:35b:73da:dc8d with SMTP id
 m13-20020a62a20d0000b029035b73dadc8dmr21842513pff.54.1630300271022; 
 Sun, 29 Aug 2021 22:11:11 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id d5sm2729182pjs.53.2021.08.29.22.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 22:11:10 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:41:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v14 3/3] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210830051108.xgfwp2uvh724syeu@vireshk-i7>
References: <1630162872-25452-1-git-send-email-hector.yuan@mediatek.com>
 <1630162872-25452-4-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630162872-25452-4-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_221112_102019_C2CDB660 
X-CRM114-Status: GOOD (  10.79  )
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

On 28-08-21, 23:01, Hector Yuan wrote:
> +static int mtk_cpu_resources_init(struct platform_device *pdev,
> +				  struct cpufreq_policy *policy,
> +				  const u16 *offsets)
> +{
> +	struct mtk_cpufreq_data *data;
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	int ret, i;
> +	int index;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	index = of_perf_domain_get_sharing_cpumask(policy->cpu, "performance-domains",
> +						   "#performance-domain-cells",
> +						   policy->cpus);

You pass CPU here, while the first patch accepts index. Does this even work? Or
work just by chance ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
