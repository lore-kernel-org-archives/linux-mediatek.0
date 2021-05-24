Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F7BC04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA83461404
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 22:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA83461404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd19edjNTJPkyfNm9Rgo0HFr+R2b69XK029DdwzkMEk=; b=rURh/dT8mr2oZd
	Z8jUnOzOFuBKe//1x0vSp7Md+0YP6adMeV/vSu+h30NzEtHiCXTcHk6Cbd7OxjDNaCCWoLuj6camr
	FeNxLRWgQn2Vt111K1MwzNrXkK8B+mwH7wZGiwAqO+wWvCTSTLsXznp3mLCxUSGQXDwiRd74RD55B
	NuCmvQxGRMDR/10Zn7bDKzRAMM6ds5D5sJvQOOfuI5Aasu3wAi5tuPUtJfD8em2YGMV61TGPDTLuW
	zGFMhAu0rJsZMZmyrKpibZQmCG1FXwGcL5LloCSH9EdpT6H3mZzZS+TZ4Oc1GKyUdFsz1qVSIFRsN
	QaTKK0Ew+QbaEXZkAjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIhW-0022vV-Nr; Mon, 24 May 2021 22:05:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll6ja-000nVF-3A
 for linux-mediatek@lists.infradead.org; Mon, 24 May 2021 09:18:51 +0000
Received: by mail-pf1-x434.google.com with SMTP id c17so20361942pfn.6
 for <linux-mediatek@lists.infradead.org>; Mon, 24 May 2021 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0c5Qxjp+4tL19l2WuaML9jbCExKjLNfzcff3PqhK+VE=;
 b=h6aeeuYGuMndMeWE+tDnkHaFLWogpyi0c/FjQoc8wSMIdgESd1urJM9QEg454F/5qA
 nsK+XL02e94ks6Ow+C3qCU1cWazB1c/RcK0eL7zt0ZG7THaIUM+tII/H6fGBmKVIxzA5
 ze6RcWJrILiN3M0ZBwYrxZ9N6gMBkmTtwaSYTIKk9wpW24qmqR6gUmQSwLfKktktNO/k
 1Kpa1iQnqx7w0JEOSJ4UY/A+OyqY+hFMUGAGIN8XUHQ7wg+a6tXpFTUyhsOWijG+v/i4
 CJyeIlRdWYUHHfZATciNR2WziCr3Zw1l/vOQvzR6zegUblt31P5bNzTFUa7sIgw1wxQd
 MSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0c5Qxjp+4tL19l2WuaML9jbCExKjLNfzcff3PqhK+VE=;
 b=mzubOMrjiMqkLShqs/EmC5sBioIkUX0lEPSBtd0cxdhsF8UazX6e8CfVJdbllepCH2
 gIh8mlAXvnHXq2+/hR3n43T5z24DRGEvCRLi+rfcRyoMUMvw1qJia5IDphHENoxHpWfX
 DdSsy0a0AFnkEQmvzDAFgVS2srFE+5eI/9RuIyeSS6Fo9rLeUU4pxU+VtrQ4BWYQjgGQ
 yj/Uylslz85vjYaE7MthHZovhvIxYbf8kJc4jusRLZ+uadv5wWqPksQKctHV2uc6ql2H
 FL9wxZ/BL9vTr+AdmAEfDlK6RcnqvlWj8PzU7LOE1O2I8LLfEWKYXLAu7ht+yzHS5s5N
 vw6A==
X-Gm-Message-State: AOAM5315etHHdu7AQRge90Wc592ewV5KB6l1LKFn4lLZMCn0eaIr/q+j
 11ILtT06vL6CzhopbNY1sMx0cg==
X-Google-Smtp-Source: ABdhPJzP2RUqZymnC2lnFHYSor1AieszJZmgrX4DEQ4so867X8K+jZMC2gm2x7if1QXdo4oFdo6teQ==
X-Received: by 2002:a63:8f15:: with SMTP id n21mr12327462pgd.366.1621847928173; 
 Mon, 24 May 2021 02:18:48 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id p8sm10169150pfw.165.2021.05.24.02.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 02:18:47 -0700 (PDT)
Date: Mon, 24 May 2021 14:48:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v10] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20210524091845.wlikxun3x2qou7zs@vireshk-i7>
References: <1609222629-2979-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609222629-2979-1-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_021850_192913_C33C4D2F 
X-CRM114-Status: GOOD (  12.34  )
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

On 29-12-20, 14:17, Hector Yuan wrote:
> The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> The driver implements the cpufreq driver interface for this hardware engine. 
> This patch depends on MT6779 DTS patchset[1] submitted by Hanks Chen.
> 
> >From v8 to v9, there are three more modifications.
> 1. Based on patchset[2], align binding with scmi for performance domain.
> 2. Add the CPUFREQ fast switch function support and define DVFS latency.
> 3. Based on patchser[3], add energy model API parameter for mW.

Hi Hector,

You can refresh this series based on the patch from Sudeep:

https://lore.kernel.org/linux-devicetree/20210517155458.1016707-1-sudeep.holla@arm.com/

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
