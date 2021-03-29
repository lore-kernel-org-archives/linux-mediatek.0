Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A19DC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:11:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A44961934
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A44961934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/yAtwcv9PgvZMvW+UzqtaoqCnrYjMcudlH//0iaObqc=; b=kcAFNvfyEaVfk4846Jdi6klX/
	B/tnwgV+z03i2gVE0bvdyEo3FNS3o3LMf57Nu4ZGFC7/np9Qx6vSzd9wYvk+D7mkQPKaVVKJD6Hjx
	xgQHkTh7QNK52VAMlrHlQvOND0BXNcNkxi8WNJrVuFGu8abKSBv6K9sTAHjROwdsElUvAYq4/3hmW
	xHFhFh2rhF0ze6T/t43ynC2+NDNhYl1lyqNpEGLpqs/PjOQ6ou/V1wgSGJT5nmxdJttXNnpb6RsmY
	lw920W/V3IzMd18YMp69H4iVGfM13upWRTZBDVoQD4l8/+x/Yz6YcFntjKVoeVUXk7leWpZXAXxCY
	ITscXWj0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxHw-001Bqb-KI; Mon, 29 Mar 2021 19:11:00 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq5L-000cND-00; Mon, 29 Mar 2021 11:29:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id j9so10751725wrx.12;
 Mon, 29 Mar 2021 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i2Q5jhlwjrk9FBYJg4e9MsdVUp4rHTY83siPq5FBlxc=;
 b=tZ/j8mBOAsEl8O51Jd/uLW/7eD7Yc0kadz6MTsdOPkHO62+I2TOPHXn2I3XDFtQo6s
 KILd/fbgO82YSdcx7sT4Cv7TYGcson5CtGe62Eh5aD/ybie/wVhfWV2nT1ZzJ1WBz9+B
 +5bqRICvmP79uZ0Ce1nC8BH0a7/O0NkaWhu10n0PKXOrKLx+kJGvvuPRyVaX60bxzCeF
 NUFChgzyHjgLpAkofiZqbkOM+dzdyBah9Ip2OiXIaUPK6jA78RCXSujTloex5u0Usmro
 DTe0nF9jLinyH3KTX5ga6l82h6ERfqNwqClBmmqG3/VwOJDHSUQrEzrQZgHmstXpgab6
 eIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i2Q5jhlwjrk9FBYJg4e9MsdVUp4rHTY83siPq5FBlxc=;
 b=GhEU+FQfGYg3n8ScmszcgL4tJ7b4DLjlR6rIxdAM/056OIhsZBTFDsJCN7GDE/eK8N
 5AlReemeZta5LUABu7hMNNL/F6umeCw6GFwOm6xvzydRtllnbiVU4t4lkru183cbzG8v
 aVSGcB491n9qtHmQ/IYt+5zloZKpxPlPhJ8d32hk8FB5sN/hL0lncCvAFB+w9rQfVXwt
 AYqseo8a5R58W+vSlaqj7bpyXQOnPY0f4kxKw/b927z70lgJRMm11MtzZ9lvY+Pm0XFk
 a6p9+X3xXZ1Ph8vXH5sddyINW6O9NfnzVoRGYw75HHLUx244OL8+m02O7UPNwmEcwGQH
 tDAg==
X-Gm-Message-State: AOAM531AAVeWdmkriJX59FanavaWUOi2UXBr9GkbIiOnVEDK4ajYi9c7
 iySpASJj6yARj7gRDDWMBSw=
X-Google-Smtp-Source: ABdhPJy/hWvL+p84DPBEAVpW9viyFKwk9h3tUV6b9J6xEIHRfpzQ202GV7+umxvUEZOSt8Cc/97NXw==
X-Received: by 2002:a5d:6384:: with SMTP id p4mr23695472wru.368.1617017370459; 
 Mon, 29 Mar 2021 04:29:30 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id k13sm34402847wri.27.2021.03.29.04.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:29:29 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: cpufreq: update cpu type and clock name
 for MT8173 SoC
To: Seiya Wang <seiya.wang@mediatek.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
References: <20210326031227.2357-1-seiya.wang@mediatek.com>
 <20210326031227.2357-2-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e460b0b8-9e99-974d-e6bc-e6fc89177ecb@gmail.com>
Date: Mon, 29 Mar 2021 13:29:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326031227.2357-2-seiya.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_122931_166360_246467E5 
X-CRM114-Status: GOOD (  14.58  )
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



On 26/03/2021 04:12, Seiya Wang wrote:
> Update the cpu type of cpu2 and cpu3 since MT8173 used Cortex-a72.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

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
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
