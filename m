Return-Path: <SRS0=JELp=2Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B68EC32767
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 04:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7C8215A4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 04:48:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oWIlYfMm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBTSi1z8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D7C8215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pzdd+yawmNtqcJ+L4XOaH3U2mGLJAXo/1BEj5EZBCr4=; b=oWIlYfMmUKNfhv
	jux0aSK7UzqZHV7sl0l5WlxCCF894q33T/MXn/ja2ql6CPZFVh2g/6Ksg0nxV78RB/1Rd1dy6LJ0a
	87ZPRtFOSvxuWqm+L3rZ9K0FITxO9cVwVTARFglyHFDdx6bB07HObGPQGzCeSA47Mf5IEun5yk9BL
	1cSBWKl3sikO4gZJbTXua/1I0ZjxEjoKVOCRXbeen/nL+imHg47fU9pXtZsTk/jIEkANttzcA5c/i
	FiNQSOHpOsLnI6vc0DyK9Pf1ZLE26OojusS/6I5hpC09Aw4zb2Jego9W8sUfOokfZLBuzgCRYrFmI
	KHwEF9q5SOOAjsLc+0WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inbM8-00016P-OL; Sat, 04 Jan 2020 04:48:08 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inbM5-000166-RI
 for linux-mediatek@lists.infradead.org; Sat, 04 Jan 2020 04:48:07 +0000
Received: by mail-pl1-x642.google.com with SMTP id x17so19746582pln.1
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2020 20:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IoTdl+/r/+1PDTOBmkAtOt/aNfrTYnx6/vTmYpcU8Bk=;
 b=mBTSi1z8HQ5QN8ZL9wZwgjOBZcLjA6/1s/o81QkxPC3Gn1LJt7QS6MSGiI9NCCsJQI
 xwlIpwfxl+81MT4OH+Ckc3va0uV+gymXyyRkywUt0qEDLxF58/3e0bZADpvWzRffBzIE
 GcKkw5L+y2wKmxDXXvMBoASIBpbhEyI8xYgbuP4ry+pvA791SlDRFw1pYcK6NWSZ5q1q
 LXogHhdlAPDW2pO92kNmXoZzMbA38eBex2xeF0DNY8C3Y3/tlP6CLmRBf+0C+WGo6JXe
 uja8rjA9pbwrcxkn0rBxxp0IELwQsbYQtEOA5DqAN5DkVUr2CMlDifi9y9ZNiZuHjuj1
 l0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IoTdl+/r/+1PDTOBmkAtOt/aNfrTYnx6/vTmYpcU8Bk=;
 b=uKwIe8SGTzPh19aSYjQslOiR+doBs+nbHvxVF8retU7PiO+lB2nSzdU/uRiEpFD9yU
 EIAczfpvC/BzDYC/n2jFH39/+DnodnuSiPgyveoDwtWayLLclYJVns1O3ZSWq+rgbYCE
 xQdXTtbeqLM+5qI6RNDbruv8s47vtvJZ48+ljtVB8fWPdPKtODBKYmwbAiygCEjoHykA
 7KE+L90L+AijZBSUxI2pBkalaJJhwuGjG0d5Ni+caEeeefApo2vhhn8XOToRGxa9383t
 GSpphnLLZkX/NJKQpxJYkrz2thYVjvqPJ+JKTfMfIXQWI+rdVeFCC2Rws/2tbDq0BrUs
 GJbw==
X-Gm-Message-State: APjAAAURTvsVmfbMZJ1V357e97hnDNYqOb6WeCUc8sOQ02yowcP04ltj
 j/amIwO2baxfBmJvtUmPeoA=
X-Google-Smtp-Source: APXvYqzeds3/bTBx5/Pdi8NGCNH+FlJbUxV+IYl0LmLIGJ2scfHO4JnsggAhidTbq2sCByFRUHkqMQ==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id
 b44mr31811177pjc.9.1578113285104; 
 Fri, 03 Jan 2020 20:48:05 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id h12sm53934136pfo.12.2020.01.03.20.48.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Jan 2020 20:48:04 -0800 (PST)
Date: Sat, 4 Jan 2020 12:48:01 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Light Hsieh <light.hsieh@mediatek.com>
Subject: Re: [PATCH v7 2/6] Supporting driving setting without mapping
 current to register value
Message-ID: <20200104044801.GA13072@nuc8i5>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_204805_909926_551FD7B9 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: linus.walleij@linaro.org, sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 31, 2019 at 09:41:43PM +0800, Light Hsieh wrote:
> MediaTek's smarphone project actual usage does need to know current value
> (in mA) in procedure of finding the best driving setting.
> The steps in the procedure is like as follow:
smartphone ?

> 
> 1. set driving setting field in setting register as 0, measure waveform,
>    perform test, and etc.
> 2. set driving setting field in setting register as 1, measure waveform,
>    perform test, and etc.
> ...
> n. set driving setting field in setting register as n-1, measure
>    waveform, perform test, and etc.
> Check the results of steps 1~n and adopt the setting that get best result.
> 
> This procedure does need to know the mapping between current to register
> value.
> Therefore, setting driving without mapping current is more practical for
> MediaTek's smartphone usage.
> 
> Change-Id: I8bd6a2cecc0af650923704589b5b90097b0ff77e
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 32451e8..1212264 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1077,8 +1077,8 @@
>  	.bias_disable_get = mtk_pinconf_bias_disable_get,
>  	.bias_set = mtk_pinconf_bias_set,
>  	.bias_get = mtk_pinconf_bias_get,
> -	.drive_set = mtk_pinconf_drive_set_rev1,
> -	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.drive_set = mtk_pinconf_drive_set_raw,
> +	.drive_get = mtk_pinconf_drive_get_raw,
>  	.adv_pull_get = mtk_pinconf_adv_pull_get,
>  	.adv_pull_set = mtk_pinconf_adv_pull_set,
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index d63e05e..2247eae 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -608,6 +608,18 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>  	return 0;
>  }
>  
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, u32 arg)
> +{
> +	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
> +}
> +
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, int *val)
> +{
> +	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> +}
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>  			     const struct mtk_pin_desc *desc, bool pullup,
>  			     u32 arg)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 1b7da42..75d0e07 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>  			       const struct mtk_pin_desc *desc, int *val);
>  
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, int *val);
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>  			     const struct mtk_pin_desc *desc, bool pullup,
>  			     u32 arg);
> -- 
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
