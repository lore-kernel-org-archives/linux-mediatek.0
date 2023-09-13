Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C053CEE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McEVX1hx5k8f+NcqiKTD/lVS9HGO2QYi1j8mbG944+c=; b=45uC//riyTjR3nxBS7LdIB2OQt
	a0RttNI/3oGQv/3TfBi8411yD0qpxIjTFd/jwkFi5bqeC1JvX+ArfSV5RSM5EXG8Fll1OuUWZgL9Q
	QslbzllgfWHBi8Iz9j13NnVZgGBocdENaM86C/OOD3c1z8zaj6GSV8ZFmCfS7IdGceeAxiH9fP97W
	xRul/IShzxlD583ThtSUiad0By0S7ITdYX7clUTX5MrD1aENtmjQQULF79kXoh2MZfQYES3HlR1So
	M4T+w8z4ZuTcM9Kf7YsratiykdI6SrPMRNFJvOfvvkHHMxfoWGxqOJYtNtqjSNvMfEfgdNxehbGQE
	cmLvkeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZDO-006sbM-2b;
	Wed, 13 Sep 2023 23:24:10 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZDL-006sa4-20
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 23:24:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c1e128135aso2774325ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 16:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694647444; x=1695252244; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=McEVX1hx5k8f+NcqiKTD/lVS9HGO2QYi1j8mbG944+c=;
        b=NEMFNu6Qa0X8HHahzlHAQJBYbDXoEkm+ci3BI3Pw/uKKwyEU+gMniejefqACXAH7PG
         p8REu3D2Bedt/E7x6B8kBw2vKvfJPw073klw1B9bdw1Xu5qEzmn0kp04g5dMpwkt9Vup
         RLHuMKxXnZYmqF1BkDbNB75i18WYCfQYYr7LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694647444; x=1695252244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McEVX1hx5k8f+NcqiKTD/lVS9HGO2QYi1j8mbG944+c=;
        b=w1g4l7A/20SSlKgfje35SzF5HN2L/jyCvlvzPmP0TR8N+Bf83ulswxL9hQEDcPHhfU
         077zrU8+PkiiVsSxX0tPr2Y6K3UAoIBqYeuPKA9UxbTxPzqlsq9NEEeJ/OlI5BemWUvD
         65w0wXFNjN1cKyOGqzlSIurAnmMipF+Exy57Fpl1cZNKKiVXZQX8GVn9S9vAfnnpRg7r
         +BZ51pTDEI2JQnadFzqzRZs/d4St7OADdJqQH17+b49amR5+DxlSjLkm+mr34pDai0MX
         AbaCuqWF0ubdiKw799pbAoDafFClTDuLgwUc7gWmWz1kHUq8DIWc1miqx6+ZTOZziaQH
         Hp6Q==
X-Gm-Message-State: AOJu0YzIv0RRdaK7iGNDahrRiOoVOJucZTVivVrx8/7LT+mZ93CL37UQ
	KMkeYVrxPQTY+IV45oPZVBwUGQ==
X-Google-Smtp-Source: AGHT+IEhoRu0Lao0AX88usO4EFB8BidZ06eLDfk+p1OxG1nODfcmpktTieCBSCEMoiWnY1czPMaLqw==
X-Received: by 2002:a17:902:d2c4:b0:1c0:d575:d28 with SMTP id n4-20020a170902d2c400b001c0d5750d28mr4287074plc.50.1694647444198;
        Wed, 13 Sep 2023 16:24:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j21-20020a170902c3d500b001bb8895848bsm163538plj.71.2023.09.13.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 16:24:03 -0700 (PDT)
Date: Wed, 13 Sep 2023 16:24:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	tony.luck@intel.com, gpiccoli@igalia.com,
	mathieu.poirier@linaro.org, catalin.marinas@arm.com,
	will@kernel.org, linus.walleij@linaro.org,
	andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
	matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
	bmasney@redhat.com, quic_tsoni@quicinc.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Subject: Re: [REBASE PATCH v5 10/17] pstore: Add pstore_region_defined()
 helper and export it
Message-ID: <202309131620.34EB0F6972@keescook>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-11-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694429639-21484-11-git-send-email-quic_mojha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_162407_663140_B072F5A1 
X-CRM114-Status: GOOD (  21.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 11, 2023 at 04:23:52PM +0530, Mukesh Ojha wrote:
> There are users like Qualcomm minidump which is interested in
> knowing the pstore frontend addresses and sizes from the backend
> (ram) to be able to register it with firmware to finally collect
> them during crash for debugging.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  fs/pstore/platform.c   | 15 +++++++++++++++
>  fs/pstore/ram.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pstore.h |  6 ++++++
>  3 files changed, 63 insertions(+)
> 
> diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
> index e5bca9a004cc..fdac951059c1 100644
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -139,6 +139,21 @@ enum pstore_type_id pstore_name_to_type(const char *name)
>  }
>  EXPORT_SYMBOL_GPL(pstore_name_to_type);
>  
> +int pstore_region_defined(struct pstore_record *record,
> +			  void **virt, phys_addr_t *phys,
> +			  size_t *size, unsigned int *max_dump_cnt)
> +{
> +	if (!psinfo)
> +		return -EINVAL;
> +
> +	record->psi = psinfo;

Uh, this makes no sense to me. If this is a real pstore_record, you
cannot just assign psi here.

> +
> +	return psinfo->region_info ?
> +	       psinfo->region_info(record, virt, phys, size, max_dump_cnt) :
> +	       -EINVAL;

Common code style for this kind of thing is usually like this:

	if (!psinfo->region_info)
		return -EINVAL;

	return psinfo->region_info(...)

> +}
> +EXPORT_SYMBOL_GPL(pstore_region_defined);
> +
>  static void pstore_timer_kick(void)
>  {
>  	if (pstore_update_ms < 0)
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index ab551caa1d2a..62202f3ddf63 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -437,6 +437,47 @@ static int ramoops_pstore_erase(struct pstore_record *record)
>  	return 0;
>  }
>  
> +static int ramoops_region_info(struct pstore_record *record,
> +			       void **virt, phys_addr_t *phys,
> +			       size_t *size, unsigned int *max_dump_cnt)

But there's a larger problem here -- "virt", "phys" and likely
"max_dump_cnt" are aspects _specific to the ram backend_. This can't be
a generic pstore interface.

I'm not opposed to it being exposed only from ramoops, though.

But I think you'll want a pstore generic way to iterate over the
records...

-- 
Kees Cook

