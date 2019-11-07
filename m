Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52107FC6194
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 02:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230FD21D82
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 02:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MU14WJfW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArKI6Gja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230FD21D82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lalIWMWNJaeXRkLZ1uYNcVLKnhnqH+pd4dEPv7FZ6jo=; b=MU14WJfWY0zyo7
	uW5gSKl3nqADjZR0CSSgrHHP2gyj6pQ01g3UyCfHrtAbvWa2c59Un1W1l39W54KiacQVqqgm0YPdY
	v7ZeRHoFDeo7L/v7Vnw/9dZPFmfcC+V4mP+UYs8LF2gOcP22AmJdxnuo5dGPYCtv++rg6QSAhAMck
	8lShUbKpkHOhDmxixFg2ibqfkPJwZrysysgvUYfB2QwlOlufYTJL2BN31tAx9CrPnRZ0xtDfKjsj+
	vFO6EL7T5XC1QHAn2PhLv5nMKgDA9bVS6yIw/meDaOtZPCQ8kHeF1ZJDsHWJ3f6TZr52sEg9CeyEV
	pK9iXWSFdLGgjyUMz8WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSXPI-0001Di-Qx; Thu, 07 Nov 2019 02:20:20 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSXPF-0001Cr-Od
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 02:20:19 +0000
Received: by mail-pl1-x641.google.com with SMTP id l4so343410plt.13
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 18:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H+QqKLPEQoeG1GGGgw3cHviviQT0DnHW7MBvGPeHz6k=;
 b=ArKI6GjaGqnXyXXJugquFesbMPo4+FgiRDM8C38iV5D242vyprAXN+S3nkmPK/OMVm
 SuIClw+4vYZMtzpL46SY9Q1c3tqqHMt0C8odoR6ghGzVtvoR1QVVjHRYjpR2GFqSu03K
 RoNm7pOKyX1kbfrT+ftQrMhpwUX2OZgavt9vT/tSLAOtvJJo4zc/k6uuAEQ/gt5nH3zl
 WaLigY0cKkQ+WUTN3M6i0YtWSKn2GA8f51dMOZawULnuJZ2X6p3irFUE5iLeE5YX4Csr
 fMucxcs03GCVx4tnBl1cSjKFf0ttE/ivjDB3O9/CHD/VLXG3Mxd7nKFHuRS3J9nizG/X
 NL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H+QqKLPEQoeG1GGGgw3cHviviQT0DnHW7MBvGPeHz6k=;
 b=RuwyIa49iSp8x9LHHHQkE9+LYb0AM8ua7kldaOFFL6dE33DtY14Rzghh70FOw/ZzaN
 1FFNkwAnkOV4XLn34liPStfssUFMiA59eYl/xMwIJSwIwjDaIIqgnMR5KCHnyeuj2w/p
 9mOdiSAQLrAms0m/QscX2bJKwiq1pnWN5hEFclm1MEP8rxfR3gqwH5mCORGapUCYobPH
 tIQgZ20z/rKSWUBKMctujcav14HNRg5znLnMlPD7erD7vd1HcQs/EasWFbMrNe5MVf/l
 P+8sVwQLivm5pQZ3A+GKTL/DzFjHYVSQyPm5YAtU4HgMQhOQU6KMn7zWc9aUgntDsEId
 lWdQ==
X-Gm-Message-State: APjAAAXG+X6lLr/Rms9dZKrheC1froatxevZuTJx44xbNkVrH5GhL4J3
 u5CcIoNzgro7W1Ck7TPUM8Pcaw==
X-Google-Smtp-Source: APXvYqw5NEouYeHvrSFPg8kUw7qbtEhGDZ0vtBPCr/SO2elR5vBWUuBiUcos9vmJW6rYBJKddhrR3w==
X-Received: by 2002:a17:902:8208:: with SMTP id
 x8mr1033222pln.232.1573093217114; 
 Wed, 06 Nov 2019 18:20:17 -0800 (PST)
Received: from localhost ([122.171.110.253])
 by smtp.gmail.com with ESMTPSA id j126sm354534pfg.4.2019.11.06.18.20.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Nov 2019 18:20:16 -0800 (PST)
Date: Thu, 7 Nov 2019 07:50:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 06/11] thermal: mediatek: Appease the kernel-doc deity
Message-ID: <20191107022012.o7wfyoerhomc3ztu@vireshk-i7>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
 <2961e4ac4b32ea7db8b5f6916751a5c02ee85960.1573046440.git.amit.kucheria@linaro.org>
 <20191107021929.hsuyzswcl27n7wqt@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107021929.hsuyzswcl27n7wqt@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_182017_842235_DD773F2B 
X-CRM114-Status: GOOD (  18.21  )
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

On 07-11-19, 07:49, Viresh Kumar wrote:
> On 06-11-19, 18:58, Amit Kucheria wrote:
> > Replace a comment starting with /** by simply /* to avoid having it
> > interpreted as a kernel-doc comment. Describe missing function
> > parameters where needed.
> > 
> > Fixes up the following warnings when compiled with make W=1:
> > 
> > linux.git/drivers/thermal/mtk_thermal.c:374: warning: cannot understand
> > function prototype: 'const struct mtk_thermal_data mt8173_thermal_data =
> > '
> > linux.git/drivers/thermal/mtk_thermal.c:413: warning: cannot understand
> > function prototype: 'const struct mtk_thermal_data mt2701_thermal_data =
> > '
> > linux.git/drivers/thermal/mtk_thermal.c:443: warning: cannot understand
> > function prototype: 'const struct mtk_thermal_data mt2712_thermal_data =
> > '
> > linux.git/drivers/thermal/mtk_thermal.c:499: warning: cannot understand
> > function prototype: 'const struct mtk_thermal_data mt8183_thermal_data =
> > '
> > linux.git/drivers/thermal/mtk_thermal.c:529: warning: Function parameter
> > or member 'sensno' not described in 'raw_to_mcelsius'
> > 
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  drivers/thermal/mtk_thermal.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> > index acf4854cbb8b8..76e30603d4d58 100644
> > --- a/drivers/thermal/mtk_thermal.c
> > +++ b/drivers/thermal/mtk_thermal.c
> > @@ -358,7 +358,7 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
> >  static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
> >  static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
> >  
> > -/**
> > +/*
> >   * The MT8173 thermal controller has four banks. Each bank can read up to
> >   * four temperature sensors simultaneously. The MT8173 has a total of 5
> >   * temperature sensors. We use each bank to measure a certain area of the
> > @@ -400,7 +400,7 @@ static const struct mtk_thermal_data mt8173_thermal_data = {
> >  	.sensor_mux_values = mt8173_mux_values,
> >  };
> >  
> > -/**
> > +/*
> >   * The MT2701 thermal controller has one bank, which can read up to
> >   * three temperature sensors simultaneously. The MT2701 has a total of 3
> >   * temperature sensors.
> > @@ -430,7 +430,7 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
> >  	.sensor_mux_values = mt2701_mux_values,
> >  };
> >  
> > -/**
> > +/*
> >   * The MT2712 thermal controller has one bank, which can read up to
> >   * four temperature sensors simultaneously. The MT2712 has a total of 4
> >   * temperature sensors.
> > @@ -484,7 +484,7 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
> >  	.sensor_mux_values = mt7622_mux_values,
> >  };
> >  
> > -/**
> > +/*
> >   * The MT8183 thermal controller has one bank for the current SW framework.
> >   * The MT8183 has a total of 6 temperature sensors.
> >   * There are two thermal controller to control the six sensor.
> > @@ -495,7 +495,6 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
> >   * data, and this indeed needs the temperatures of the individual banks
> >   * for making better decisions.
> >   */
> > -
> >  static const struct mtk_thermal_data mt8183_thermal_data = {
> >  	.auxadc_channel = MT8183_TEMP_AUXADC_CHANNEL,
> >  	.num_banks = MT8183_NUM_SENSORS_PER_ZONE,
> > @@ -519,7 +518,8 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
> >  
> >  /**
> >   * raw_to_mcelsius - convert a raw ADC value to mcelsius
> > - * @mt:		The thermal controller
> > + * @mt:	The thermal controller
> > + * @sensno:	sensor number
> >   * @raw:	raw ADC value
> 
> This doesn't look related to $subject

I take this statement back :)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
