Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6D5C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 05:28:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20AF361A36
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 05:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20AF361A36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rfTOBDWVRCsuo5Z51tGqkWVOjwbtXc8/TJqY8uFE/zA=; b=ig+iNfqtfrHq7kycrt8zuEA0h
	CiR0/E8/9hraBtlWwJJFGlUBv0LFF2W1UHSEdljbmAWCH+o2pyilvBvg3SrEFQYCL7z9nySvW187n
	c1Myd3tMlaFzgc+j5RogNG6K5iewWucyvvvftVMJNXCiWuLyDaCtCKkvlYYkzbsr5ytkXhjQkvEGB
	hPsTEq1K7Gg5/EV96BVy7BiQLyVJ1B2YuKgLmVZlmok6Al9DJBvwu8bom2pNbg3n4ydD55BDOJ2Ey
	ATcTBUXpuHUE0W3JUB1VCPimH7BKzQHv5/rZOT5GBF23uLKFrsWuVpKNuOmIHBM5wRQyjWXfKLCH3
	CdrVY0QWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPf1A-002oKC-FW; Fri, 26 Mar 2021 05:28:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPf0x-002oIj-Gh
 for linux-mediatek@lists.infradead.org; Fri, 26 Mar 2021 05:28:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id v8so356842plz.10
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Mar 2021 22:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Wg6jUsg0M3YkhkdRzAVV3NbGB+vpbZqU99QuVAslRAA=;
 b=xvkqgsknbTJsMGYLWLXMOMuDyGiIL+HYSOxfmlrzC8pH9prf/c17KrqMLTezyaLY5z
 UFrUHgePtcdCwNfKI/L5B3dkzOP309lMmgBEaoDoimwnvAUvAVram5bw1b5c4IsOW36L
 glKK55/C9x9q+UH2sTromVPOCqZJW6gK1S5a/mg9hwfKvXSSDSO+D1rkgNDrtzKAXCCw
 4Zlnln6+vmLQC0vhK99ogtcJPKADJOaaTYCnJhUcHp97Qgr5m3+J/+bxPBLMgi/a9Tf5
 njtm414zYbzcDpKn+6GdLoMnWlIxYSvVVnNN6w+DU/bP/6re1n5CAFD4Cg0zDSf7em2Z
 sJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wg6jUsg0M3YkhkdRzAVV3NbGB+vpbZqU99QuVAslRAA=;
 b=iy7giWlMqVP29Yz3j/1DTuWsBZd9gUquZUfJEIYLc9ATLPwFopT87gXBBhVtK6kII+
 dp5mSUaC8e6lsjrxNouT1E25B7tVrAorvYUg+mSO0vACgTk3F53XdyWaNhlCEGALHOgw
 gtPHwfIZo6NSPLwBDL9F8c482tDUtZSfPrScjct6pkXMq14WFZow8Pd/Tu2BsKZovaoY
 7IcbMw5geBaIzgBmHMZ9rs3bhaau7jVWIRKlPCwgT+QpOeUECZvpWvOCaH+O2Tbq0g85
 er5CLtPRWoE+ntgiisDotvugS7RZ6AthGLeGRwWryYiwZvaomCDO8ar2NLOtw8IS0be+
 QcKw==
X-Gm-Message-State: AOAM532FPcmKWN1ihlylcaSaGVfqkFLgeoeempZq/U9GNQp06jXKcxdI
 QPvXqfqvFuSFM/n2AqfXKMymuw==
X-Google-Smtp-Source: ABdhPJwpBoVDsdAvwPB+8Iw81E4aSQxXUKlwva1pexONAu6KmF6kD8g/LRd8g3u/J3em4uVil+Wm7w==
X-Received: by 2002:a17:90b:358:: with SMTP id
 fh24mr12111965pjb.109.1616736483711; 
 Thu, 25 Mar 2021 22:28:03 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id n38sm367408pgb.2.2021.03.25.22.27.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Mar 2021 22:27:58 -0700 (PDT)
Date: Fri, 26 Mar 2021 10:57:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH 2/2] dt-bindings: cpufreq: update cpu type and clock name
 for MT8173 SoC
Message-ID: <20210326052756.ozalnigxh7x3hvqr@vireshk-i7>
References: <20210326031227.2357-1-seiya.wang@mediatek.com>
 <20210326031227.2357-2-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326031227.2357-2-seiya.wang@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_052807_789000_424A7EB8 
X-CRM114-Status: GOOD (  13.37  )
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

On 26-03-21, 11:12, Seiya Wang wrote:
> Update the cpu type of cpu2 and cpu3 since MT8173 used Cortex-a72.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> index ea4994b35207..ef68711716fb 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> @@ -202,11 +202,11 @@ Example 2 (MT8173 SoC):
>  
>  	cpu2: cpu@100 {
>  		device_type = "cpu";
> -		compatible = "arm,cortex-a57";
> +		compatible = "arm,cortex-a72";
>  		reg = <0x100>;
>  		enable-method = "psci";
>  		cpu-idle-states = <&CPU_SLEEP_0>;
> -		clocks = <&infracfg CLK_INFRA_CA57SEL>,
> +		clocks = <&infracfg CLK_INFRA_CA72SEL>,
>  			 <&apmixedsys CLK_APMIXED_MAINPLL>;
>  		clock-names = "cpu", "intermediate";
>  		operating-points-v2 = <&cpu_opp_table_b>;
> @@ -214,11 +214,11 @@ Example 2 (MT8173 SoC):
>  
>  	cpu3: cpu@101 {
>  		device_type = "cpu";
> -		compatible = "arm,cortex-a57";
> +		compatible = "arm,cortex-a72";
>  		reg = <0x101>;
>  		enable-method = "psci";
>  		cpu-idle-states = <&CPU_SLEEP_0>;
> -		clocks = <&infracfg CLK_INFRA_CA57SEL>,
> +		clocks = <&infracfg CLK_INFRA_CA72SEL>,
>  			 <&apmixedsys CLK_APMIXED_MAINPLL>;
>  		clock-names = "cpu", "intermediate";
>  		operating-points-v2 = <&cpu_opp_table_b>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
