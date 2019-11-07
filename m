Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99234FC6196
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 02:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EF321848
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 02:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dd0JPjSU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQ+vAjWj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66EF321848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRiaUu6vhPmzlpnNDIqUKS3JzZTA/sWABgCplU0LmbI=; b=Dd0JPjSUy1Mtbg
	2H5iO0pX5h00HRIG44r9SwXZmBMeW2rySdooFqFVk2l0awNpFAWTS5En7u3TD8koYVuTNkV/TfePM
	Z7hgikqAbEkm43dSiQdgykqz5P0DgE8uV0+8I3Jyr4gB+gTFK5jf/pzEiSxTYfDIck2wNak1SUW70
	oMSvuaqBgbE98MG0KbR4LPxAkwUchT5wlc/0H0m5Cj0BFMdIEb4WIxwy8ApZzYSN8mN+2bHU36g2P
	bcccjir5f/VGZf1LoIId+8Ho8HgOl/vAo7+SHAzE55mkDI7wJs3/9xr13PYlOniLNs5TNLLDsH9kZ
	6UNSzAl2xWiA/imJfKzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSXOb-000834-4c; Thu, 07 Nov 2019 02:19:37 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSXOY-00082K-KZ
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 02:19:36 +0000
Received: by mail-pl1-x642.google.com with SMTP id g9so381170plp.3
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 18:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ESzujBJ49FNysqkrVH1S+PaByQD/Q6RQe2i3iP7hmcM=;
 b=CQ+vAjWjwKpOYgW5Xyc54KVd3YtC1W1XfT9E7/13c3afe+Gm2USP4E3PiAbquqxZg7
 /1670zoX75D9BbW6a8xPRRePRFOK+2c+oTAVaom4A0q6A7wXgaxMev9B6Og+bKDLY10C
 Vxz6KZiDCsRmdESG+0qB3MTSl7mQpRUTPjQCpBEhB4/hokqLHFOg5+qySvrDNVUnz/Vh
 6q4iGvc1ftMGWazfBjEs9SRIOPGFu8kzaGpedFlQYnODyT4q1oTNc9qFVxrsGnFgWtGb
 MpXOhIxyyt8pCBLTChlEtAhCNmX5uV3mLjmN0jNrGH4JIvcKbJPHDNRxQPRlIfomwzPc
 UOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ESzujBJ49FNysqkrVH1S+PaByQD/Q6RQe2i3iP7hmcM=;
 b=q+lTltMp/kNJkpsLnhBHfMohbfNy1Rd683qsiKVS4j7nugRIRcmR81YscJIV4/ykLW
 TkaDefxqCr0gOsOC3Ck6FP4fBSedPwkUJfe9AoKJ2Zo3hMOPE2lUhIg7F7Y/5ljZg9/R
 A/Ao7SQGB1m9AuRC8+t3EBY1+nERlVcEnr3phzOkaejFPPYs8vbPp0NgfCXG71UnBKOn
 W8+qplx/oC3lRESgLuAcHtNeP9WWR3rhR/f9aKZrGJFRqLXo9EeZvJlrZDWD+Y2iKFgP
 l8qMryZfq/MjxGUSFDEiDlyPAfWOg+flIgmkgGNYdzsqWFmNzM7gLyzoxwrEV3m0adzr
 kP9g==
X-Gm-Message-State: APjAAAUG2L7My65V9sLHZxLPqx7kNa7jKZEliIPFa6QzwsMVsZSlBqMw
 mwVaOi8bLCrlEDlYKZxkjFZuyw==
X-Google-Smtp-Source: APXvYqyTCT2RMDMNz8+2YYJV3LUjn/Klv43+gbS5xwV5bRqIZGp7VCOVlGfe0Z7XNl3ydRk+i1cnmw==
X-Received: by 2002:a17:902:7d8c:: with SMTP id
 a12mr970607plm.221.1573093173408; 
 Wed, 06 Nov 2019 18:19:33 -0800 (PST)
Received: from localhost ([122.171.110.253])
 by smtp.gmail.com with ESMTPSA id a33sm394632pgb.57.2019.11.06.18.19.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Nov 2019 18:19:32 -0800 (PST)
Date: Thu, 7 Nov 2019 07:49:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 06/11] thermal: mediatek: Appease the kernel-doc deity
Message-ID: <20191107021929.hsuyzswcl27n7wqt@vireshk-i7>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
 <2961e4ac4b32ea7db8b5f6916751a5c02ee85960.1573046440.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2961e4ac4b32ea7db8b5f6916751a5c02ee85960.1573046440.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_181934_670008_9141C42A 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: Amit Kucheria <amit.kucheria@verdurent.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, edubezval@gmail.com,
 Kukjin Kim <kgene@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>,
 linux-pm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jun Nie <jun.nie@linaro.org>,
 Javi Merino <javi.merino@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06-11-19, 18:58, Amit Kucheria wrote:
> Replace a comment starting with /** by simply /* to avoid having it
> interpreted as a kernel-doc comment. Describe missing function
> parameters where needed.
> 
> Fixes up the following warnings when compiled with make W=1:
> 
> linux.git/drivers/thermal/mtk_thermal.c:374: warning: cannot understand
> function prototype: 'const struct mtk_thermal_data mt8173_thermal_data =
> '
> linux.git/drivers/thermal/mtk_thermal.c:413: warning: cannot understand
> function prototype: 'const struct mtk_thermal_data mt2701_thermal_data =
> '
> linux.git/drivers/thermal/mtk_thermal.c:443: warning: cannot understand
> function prototype: 'const struct mtk_thermal_data mt2712_thermal_data =
> '
> linux.git/drivers/thermal/mtk_thermal.c:499: warning: cannot understand
> function prototype: 'const struct mtk_thermal_data mt8183_thermal_data =
> '
> linux.git/drivers/thermal/mtk_thermal.c:529: warning: Function parameter
> or member 'sensno' not described in 'raw_to_mcelsius'
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/mtk_thermal.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index acf4854cbb8b8..76e30603d4d58 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -358,7 +358,7 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
>  static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
>  static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
>  
> -/**
> +/*
>   * The MT8173 thermal controller has four banks. Each bank can read up to
>   * four temperature sensors simultaneously. The MT8173 has a total of 5
>   * temperature sensors. We use each bank to measure a certain area of the
> @@ -400,7 +400,7 @@ static const struct mtk_thermal_data mt8173_thermal_data = {
>  	.sensor_mux_values = mt8173_mux_values,
>  };
>  
> -/**
> +/*
>   * The MT2701 thermal controller has one bank, which can read up to
>   * three temperature sensors simultaneously. The MT2701 has a total of 3
>   * temperature sensors.
> @@ -430,7 +430,7 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
>  	.sensor_mux_values = mt2701_mux_values,
>  };
>  
> -/**
> +/*
>   * The MT2712 thermal controller has one bank, which can read up to
>   * four temperature sensors simultaneously. The MT2712 has a total of 4
>   * temperature sensors.
> @@ -484,7 +484,7 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
>  	.sensor_mux_values = mt7622_mux_values,
>  };
>  
> -/**
> +/*
>   * The MT8183 thermal controller has one bank for the current SW framework.
>   * The MT8183 has a total of 6 temperature sensors.
>   * There are two thermal controller to control the six sensor.
> @@ -495,7 +495,6 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
>   * data, and this indeed needs the temperatures of the individual banks
>   * for making better decisions.
>   */
> -
>  static const struct mtk_thermal_data mt8183_thermal_data = {
>  	.auxadc_channel = MT8183_TEMP_AUXADC_CHANNEL,
>  	.num_banks = MT8183_NUM_SENSORS_PER_ZONE,
> @@ -519,7 +518,8 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
>  
>  /**
>   * raw_to_mcelsius - convert a raw ADC value to mcelsius
> - * @mt:		The thermal controller
> + * @mt:	The thermal controller
> + * @sensno:	sensor number
>   * @raw:	raw ADC value

This doesn't look related to $subject

>   *
>   * This converts the raw ADC value to mcelsius using the SoC specific
> -- 
> 2.17.1

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
