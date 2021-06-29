Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DEAC11F64
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 02:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D857161C9C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 02:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D857161C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1B+8o8nivb+STlHEbcaZIYpDD+JDBu6xkaktRz/T8E=; b=hAgDqS75cq9kbF
	0XPER52sY5J/ZNFF3NXhp2X9iJSwdasrFG2mzQk0qWMKR2tXYV9adEZ+iqm4dkNNl93wqQ7ZuKeds
	FyRYCqgf6P86F1QLjWkaDssNv4Ug+FjaBczaW23aywQTppismKYnTkfNzDHxM1+JZB+0cKelj9IOs
	Ufox4c53Gd+XdbRRniaglys2HKjdfLnEqjfaL4Myz/HHA2/7Y95SioBYWxkWYs29oygNwm3JGMzVM
	TPgQnUt3IQc/IlxyCsPpYS8kfD+F2Bnjq1nQX0biXYZEJsWy0gcJUssmoySh7sDnCZF6hpKxtJiy0
	YIwOhAkNc72bnMrtj27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly3mZ-009evL-OU; Tue, 29 Jun 2021 02:47:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly3mW-009eu9-TW
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 02:47:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id c8so15957176pfp.5
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 19:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7XkSm09MKTlM+5bwgXywqiRc/y2ECGYZ1RMaAnCDj3I=;
 b=MXBSx4F3iU6Y+Ma58riJet5owe0RIF1IMqpaH6s9GQuTTRHroBGiaGJtyp+fGPdv6w
 UGvv9406FQKnaM3b7NIOfd5D6pJpat9cBR12XDVC5Z9OnCzEO8xvntTqolhgXhMrlL/5
 wVxzeyUl2QIJFHK233jyO7dpM1mNTqVUNSvBSPxl28/Y2Dv9MNoWjgL3EIUzIzJcuxYC
 5yPHvfwnjgH5sHdZjl4dhhTdesHE5ro3XJ6HbstXzSEaF9z1QC82bHEwSYIlnfg+q3CV
 W6mEy3dCOADQQ58WMbCXdXe2HIbtCRkWIpNtKdvisDYsSq3wM464fLebA92I7Vf72Lv5
 iI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7XkSm09MKTlM+5bwgXywqiRc/y2ECGYZ1RMaAnCDj3I=;
 b=kGAGMUFtFb3fvkodI/hpwMOxRXIWSJ/JLCYoCViBu2mzoU4nEkyYyYux0ZVM+NQZII
 n7JeT/QUwmYuQVav9d4nRMfxGzsSFpNX/fFWJp1K2oyrRjjjRq4ZX44rG5+GUo0TMtrT
 yJvReGF8b2+Fss3j/dpS66MrPerzTA91l2CXYqFBQJtdu+o98XVivNNvu8D6w1toDMy8
 aO1Vz11SIKgLgRxZ7payvERgQIX37TFwons8AF0N+YPBOpblaC7LsmbjcrFiZq9h1Gg9
 w2NOn6N1aVW6tMrTG1zuAGBOKYbhQ64rb8QFuAogPkBgLX/QbzDEGy8csA5/t03ELBpS
 kNCA==
X-Gm-Message-State: AOAM532yGYofaxRI4jngg2eB17fgUG/CenHEc0SvS0Qe6AbUg0phuRhZ
 4AV93GINYY/e5Aiw27xWSSVwUQ==
X-Google-Smtp-Source: ABdhPJzBbHxrQoJIVh4lFxHUalObQTAP2E8pdUf5xARTxUNTgGWy1WTe62ZdZ9+VZxPTS6POT5Yn6Q==
X-Received: by 2002:aa7:82cb:0:b029:2e6:f397:d248 with SMTP id
 f11-20020aa782cb0000b02902e6f397d248mr28195726pfn.52.1624934842154; 
 Mon, 28 Jun 2021 19:47:22 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id i18sm4132270pfa.37.2021.06.28.19.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 19:47:21 -0700 (PDT)
Date: Tue, 29 Jun 2021 08:17:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Hector Yuan <hector.yuan@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v12 1/2] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210629024719.nmcygaigtx5wn7g5@vireshk-i7>
References: <1622307153-3639-1-git-send-email-hector.yuan@mediatek.com>
 <1622307153-3639-2-git-send-email-hector.yuan@mediatek.com>
 <20210614104058.jdwb7godqzhf7rgd@vireshk-i7>
 <1624781848.1958.16.camel@mtkswgap22>
 <20210628072641.amqk5d3svwolvhic@vireshk-i7>
 <20210628090956.uwkrozdqvawsm3xp@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628090956.uwkrozdqvawsm3xp@bogus>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_194725_017184_354B0320 
X-CRM114-Status: GOOD (  11.24  )
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

On 28-06-21, 10:09, Sudeep Holla wrote:
> Probably in driver/cpufreq or some related headers if it needs to access
> related_cpus and is more cpufreq related in that way ?

It just needs to set a mask, so doesn't really depend on cpufreq. I
was wondering if drivers/opp/of.c may be used for this, and I am not
sure.

> Orthogonal to that, I prefer to make the generic function take list_name
> and cells_name as generic. I see we can reuse that qcom-cpufreq-hw.c
> with "qcom,freq-domain" and "#freq-domain-cells".

Yes.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
