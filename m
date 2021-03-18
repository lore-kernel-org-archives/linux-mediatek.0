Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB03FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 09:14:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BE364F33
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 09:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87BE364F33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pHUT5QHigVpzJlDHdjctdg791bBR5jhLYgf6B3scp/8=; b=fsAwxT9VdgEZ15J8b7mZgqI5R
	ajcFFu6hqVi0grbLniuDare3rRQV7fMuh3nb/xV/7KbGM5dOWC8QwE6ie0rXOrGEAJVgP9IXPHXY9
	btyg6LS5Ws9CthbBEwjTnSv8eeEEX1iZdqgZ0BLKqs5gWVNfRq5aDhtZ4fmNwlw8t/9eAv476Z8sE
	TmRNo/FhpplnoUq7kvpliCm0bBsZD8fzr9VnuIB6JbajZSNuMmBZo+Ur/0DUH/0/hXX1Is4iYEpEx
	lrRbI3E7NhbhhyguwUzzLgkvJRSiy4nXGRcGvGCyBB5hKfRGkpLQRPl4Bm4wJx7t9OMZilBcF2Sou
	3htupNtlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMojl-004rzU-Jx; Thu, 18 Mar 2021 09:14:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMojb-004rxT-RO
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 09:14:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id b9so4675052wrt.8
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Uiv09UGTwFa3RRLsvY7QxQvxRJLPKqm4niX7REF+uBI=;
 b=coPhGBtIDCp11up6qLgepezHxSY9MAu+TIL4HmsjE1SENNt1EVWlXvVyN4/KFhHvND
 ZWEfg4iOZxb5sdttHrJQyfNcNKxiLHvhk5SHivOpsOaL+s1XROwwR79ZZn3g+Al3BusC
 DbUooT4K6XGJXBE+wAqn1msIvpva4OwXZEQeW1c3vFRKBxJ5MIX2/0Nj2m4XHNrzqLot
 XANEtb6ctkGxDim4PP3+ZcTUIhSTGgg0FxsHBJckeSgQwEQO2g+RDstg+VOeGVTv2WIX
 3ITK+0hRnIW4P4n7Gr+Zy+1rY7qWgmc+efNrUw3q6ceHH1f3lqU1GXZUpYRcB4SpDVBa
 oDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uiv09UGTwFa3RRLsvY7QxQvxRJLPKqm4niX7REF+uBI=;
 b=gVVEvn4cAhvf2YDiN7uZ/2Hhyj6Eus4++xF5KPkJ3OK0gd9qPFydk4pW7tmbSsHl/P
 ai8DTp8hAesOHu82hXp5gwWi1fCMlQvHegifpiRUjRD1b5/Y4l9EL6OaxqguLoIdOFYo
 491i9zOkxyijInuAXAz/aUZH30FBoVHZnV81ImrdbpLzNDW+dupe6XRc2RZ+jGKctJc4
 6r7P7oQg+WfWwJe0sZ13dPOZv9a3uC5tyQ20jelm8ORUbec2VC3BByh5+NSyWgRIcOys
 C/D4dkyTR7oUyTtelhzaK5Ou2Pf/Rzf4JX9UL/5CvMlImg2lIj0vh6BMqjjBlQHWokTs
 coXA==
X-Gm-Message-State: AOAM532QLbs5GNuQcRnofShsbacEox283jXBNL/vji4vk0jpkZuxNjs8
 HXyoAPRfvzonv5hUy47lVOopqg==
X-Google-Smtp-Source: ABdhPJwCAE5GuLxhwuncmpoKP2i/ihcBTLpoW7+Qpnjtwc5szQ26Ujm9zCiwDkLrmji6uToHNGYY1w==
X-Received: by 2002:adf:c64a:: with SMTP id u10mr8561102wrg.412.1616058866201; 
 Thu, 18 Mar 2021 02:14:26 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id l8sm2122201wrx.83.2021.03.18.02.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 02:14:25 -0700 (PDT)
To: Henry Chen <henryc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Arvin Wang
 <arvin.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <1614656863-8530-1-git-send-email-henryc.chen@mediatek.com>
 <1614656863-8530-4-git-send-email-henryc.chen@mediatek.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH V9 03/12] soc: mediatek: add driver for dvfsrc support
Message-ID: <c1c96a65-b322-44ad-39ad-5f9f27fdc4a4@linaro.org>
Date: Thu, 18 Mar 2021 11:14:22 +0200
MIME-Version: 1.0
In-Reply-To: <1614656863-8530-4-git-send-email-henryc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_091428_101925_90E057E0 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Henry,

On 3/2/21 05:47, Henry Chen wrote:
> Add dvfsrc driver for MT6873/MT8183/MT8192
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig            |  11 +
>  drivers/soc/mediatek/Makefile           |   1 +
>  drivers/soc/mediatek/mtk-dvfsrc.c       | 421 ++++++++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk_dvfsrc.h |  35 +++
>  4 files changed, 468 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
>  create mode 100644 include/linux/soc/mediatek/mtk_dvfsrc.h
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index fdd8bc0..2dcf023 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -26,6 +26,17 @@ config MTK_DEVAPC
>  	  The violation information is logged for further analysis or
>  	  countermeasures.
>  
> +config MTK_DVFSRC
> +	tristate "MediaTek DVFSRC Support"
> +	depends on ARCH_MEDIATEK
I'm wondering whether adding COMPILE_TEST would make sense here, but it's
also fine as is.

> +	help
> +	  Say yes here to add support for the MediaTek DVFSRC (dynamic voltage
> +	  and frequency scaling resource collector) found
> +	  on different MediaTek SoCs. The DVFSRC is a proprietary
> +	  hardware which is used to collect all the requests from
> +	  system and turn into the decision of minimum Vcore voltage
> +	  and minimum DRAM frequency to fulfill those requests.
> +
>  config MTK_INFRACFG
>  	bool "MediaTek INFRACFG Support"
>  	select REGMAP
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index b6908db..4ead103 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
[..]
> +void mtk_dvfsrc_send_request(const struct device *dev, u32 cmd, u64 data)
> +{
> +	int ret, state;
> +	struct mtk_dvfsrc *dvfsrc = dev_get_drvdata(dev);
> +
> +	dev_dbg(dvfsrc->dev, "cmd: %d, data: %llu\n", cmd, data);
> +
> +	switch (cmd) {
> +	case MTK_DVFSRC_CMD_BW_REQUEST:
> +		dvfsrc->dvd->set_dram_bw(dvfsrc, data);
> +		return;
> +	case MTK_DVFSRC_CMD_PEAK_BW_REQUEST:
> +		if (dvfsrc->dvd->set_dram_peak_bw)
> +			dvfsrc->dvd->set_dram_peak_bw(dvfsrc, data);
> +		return;
> +	case MTK_DVFSRC_CMD_OPP_REQUEST:
> +		if (dvfsrc->dvd->set_opp_level)
> +			dvfsrc->dvd->set_opp_level(dvfsrc, data);
> +		break;
> +	case MTK_DVFSRC_CMD_VCORE_REQUEST:
> +		dvfsrc->dvd->set_vcore_level(dvfsrc, data);
> +		break;
> +	case MTK_DVFSRC_CMD_HRTBW_REQUEST:
> +		if (dvfsrc->dvd->set_dram_hrtbw)
> +			dvfsrc->dvd->set_dram_hrtbw(dvfsrc, data);
> +		else
> +			return;
> +		break;
> +	case MTK_DVFSRC_CMD_VSCP_REQUEST:
> +		dvfsrc->dvd->set_vscp_level(dvfsrc, data);
> +		break;
> +	default:
> +		dev_err(dvfsrc->dev, "unknown command: %d\n", cmd);
> +		return;
> +	}
> +
> +	/* DVFSRC need to wait at least 2T(~196ns) to handle request
> +	 * after recieving command

Nit: s/recieving/receiving/

Thanks,
Georgi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
