Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE25AC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 03:22:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7918E207DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 03:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fzOo5E2Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYPX3N/C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7918E207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=THU6SxUS6V7drpAI5Cg4SxYAfXJMpNcXskNbKrsJsME=; b=fzOo5E2YSeUL0BQwqpNMpshJY
	7huUalV7RM1MhZG76vnmFL94N/Hz8IraEbs2cOB8mZ9OE9F2pItXuJJRzUn5cxAvXlJF2Aqj/JcV/
	cEEp8QbYCcGXlBlpaJnKLdL1tNZrrsPFT6q2atwINO5zvc1SkW1u10kTIK4azXeJeD2VW1gQW6W0t
	V7KKJVopRotGYqvSLz021i4Q8YvPCcvPinoKy8mJJO3ob3o2SOZ6Ms41YOodY4/kpt0GRD8llit41
	Npm3FjoU+QhWsckxcUPCc0jq2/lgUsam4ux0vKbcbbYDh7kT3gvvxfG5wzpV6BXFSL9dElF+Ynu2X
	7EVGPjcHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxir4-0000Qp-0U; Tue, 21 Jul 2020 03:22:10 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxiqx-0000O7-Ka
 for linux-mediatek@lists.infradead.org; Tue, 21 Jul 2020 03:22:05 +0000
Received: by mail-pg1-x541.google.com with SMTP id p3so11301141pgh.3
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2020 20:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ijZcvY+9HThogPQGU1zhNOmg7ddSlcdPOxTGsylYukU=;
 b=jYPX3N/CYwrP8xdNoZm6Jr5f6CFeNAOzox2cznLatSc6OzyK71rLS2Q01WaRr9xjWw
 EwjoYXhjMJGl88p2OYXPm0Y8GrymObK4q3Gr6KyQpSpctoA/7Pz+kGPUQRqh7DMbKbm1
 xRCj9BQnbsXzzoeJ7amj+1JJGbQXy9NWlFc+IZ1N8aPvU7v0jcG/yvTmBLvVaoYMn+Vs
 OTZa5qdb9I06AvZg1of6xQzxglhtCqYrU6lupDFQh7DRm5dr17cb0rv0RNJgjw8OOexG
 MTU2rlNhDi+qC/Si0jn6sbgB75I26/HWknjIVwFgUnc2OBePW4wx3JVfQgpg4O2EvPOo
 o8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ijZcvY+9HThogPQGU1zhNOmg7ddSlcdPOxTGsylYukU=;
 b=jTu3cNgM4tHmlXeztmkdbDbwKKtd5qw/Nn8cL+qHcjKQUULLP7LhvXM/0k7gtwi+mj
 L7O+24V9JgdBOq4Z0DWu0hF7Y0QCqFvrd9S7Z3RTYrPbbt17iCKHoSHK5Qld91XOuk1+
 rtDinJrLOAgk/lwtLgBJRi4ga1tPOV4IXBd4zMKTxu/HsP5mO9UGN000Bd6hmyqqr6hc
 V8lYSWdBXgLHpFAigHngPOU7BXYXP76FhWlfR7YQeoy/6/3MmQX+vq4IYigmYMsSd7yB
 GEjv0k9gyEezVAB4tsUU3Dep8GTNFmmZpVv7piYmybMRmZGCsNVkFCL6qnbG4/ypgWeH
 jH5g==
X-Gm-Message-State: AOAM532G9yYmYSDW/HaTke1MpjmDmRQIrNArfFE5U13MDrhrDUJ5aSfN
 o+A4de8thJYH564ubEJAlig8QQ==
X-Google-Smtp-Source: ABdhPJx61jmy8+lIZewjXQ+YePZ0gDxMGB+c3iKHDGI3JWW31i4NNS2itBhvkd+VWS/UiHU4wWEQKw==
X-Received: by 2002:a65:408b:: with SMTP id t11mr20670837pgp.407.1595301721432; 
 Mon, 20 Jul 2020 20:22:01 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id t1sm16787715pgq.66.2020.07.20.20.21.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 20:22:00 -0700 (PDT)
Date: Tue, 21 Jul 2020 08:51:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: thermal: Get rid of thermal.txt and
 replace references
Message-ID: <20200721032149.prgxcmwjxonml4u6@vireshk-mac-ubuntu>
References: <e9aacd33071a00568b67e110fa3bcc4d86d3e1e4.1595245166.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9aacd33071a00568b67e110fa3bcc4d86d3e1e4.1595245166.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_232204_110206_916F0287 
X-CRM114-Status: GOOD (  13.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mans Rullgard <mans@mansr.com>, Heiko Stuebner <heiko@sntech.de>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Florian Fainelli <f.fainelli@gmail.com>, daniel.lezcano@linaro.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Stefan Wahren <wahrenst@gmx.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Ray Jui <rjui@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Talel Shenhar <talel@amazon.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 lukasz.luba@arm.com, Sudeep Holla <sudeep.holla@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20-07-20, 17:23, Amit Kucheria wrote:
> Now that we have yaml bindings for the thermal subsystem, get rid of the
> old bindings (thermal.txt).
> 
> Replace all references to thermal.txt in the Documentation with a link
> to the appropriate YAML bindings using the following search and replace
> pattern:
>  - If the reference is specific to the thermal-sensor-cells property,
>  replace with a pointer to thermal-sensor.yaml
>  - If the reference is to the cooling-cells property, replace with a
>  pointer to thermal-cooling-devices.yaml
>  - If the reference is generic thermal bindings, replace with a
>  reference to thermal*.yaml.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> Changes since v1:
>  - Rebase onto v.5.8-rc6 to make it apply again
>  - Fix cpufreq/nvidia,tegra20-cpufreq.txt
>  - Fix bindings/arm/freescale/fsl,scu.txt
> 
> 
>  .../bindings/cpufreq/cpufreq-dt.txt           |   3 +-
>  .../bindings/cpufreq/cpufreq-mediatek.txt     |   4 +-
>  .../cpufreq/nvidia,tegra20-cpufreq.txt        |   2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
