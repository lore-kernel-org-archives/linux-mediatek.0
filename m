Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD0AC3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DS07n3S2EpZ5vKJ03RyX8V+ApT3KBt/z3ClQ42xfto=; b=vzsWXf1n0R7/oIxuHPSbdtKGSC
	iUgm/NvejVZ/pERmigx6UvHxOutF78BAZj6JRPnYqUx0QzQU3WnmPtkkimhlWVeM6Ygc0gO36PHMR
	sBFY4jvsl/S1MVNHxpu1HSMz7HwmfOUuQn3xyiN7H1DRwiS+1c3ZNglEVpcLZfRfVW2n7NotWPz3r
	AQ/WkhuNd+wFHxMbKyzhcrWO8PfQwJxE4c7412aWqbUp64bdl3BafdZFcChA+a1BFIiHLjG6b4/Go
	gfKMhqeFaqjxGQPOY+uiRkQ7gJiY+KfA8QnyFLWZdDvbJIgi0lurT2eVfIZtzHQg8GAxSxezn2Wvu
	FdIKTfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiEz-00000002wHx-113v;
	Mon, 08 Jul 2024 06:52:49 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiEc-00000002w9P-1CWz
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jul 2024 06:52:28 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3737dc4a669so12892575ab.0
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Jul 2024 23:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720421545; x=1721026345; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+DS07n3S2EpZ5vKJ03RyX8V+ApT3KBt/z3ClQ42xfto=;
        b=IY9Y2+Mm2u0zhMxGnyh8fqNE+2PXUr5oOWWNWlJ+x0DpR1fRBpr4wDblkuHRkKoFXl
         CBn43FKPEmAXZZB/fhpW3OUgOW/Uqk7swXRzpSUJuf095NZDjfTrPCZRJy6M2ZmFVyON
         9sye5+93E6p+qpUFb44QC+ZoAVRhStecCbD54eFOoGrw3yFJW+OygbTE4+amAeYqCNiO
         XiW50ce6j9Rw4VwZY9vPYYi9KtZc7mgxjBfTaAzvSsiCfcTgPNZ+N/eMYnHYVTZeeDiY
         2Gi7E/9ZLRsASS/NL+B2KQSo8+pmznCAeXX5TuPPdEa3c+dRbbnguT+nl27+k6V7EygJ
         JcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720421545; x=1721026345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DS07n3S2EpZ5vKJ03RyX8V+ApT3KBt/z3ClQ42xfto=;
        b=ZhXaq8E9uplM427PXMsAwNiMBXMO2SgeAtJC2EbrZDax7uDseCsuVC5CbDyfobFe35
         S7cAp0vsXkPzdCQCb4GUNjN1tjC7z4sU4ywqDqQJgqcK97A5pse27wMy6NrTy1BMNuax
         cX7ZUFMRjQ9Iw3ydPIl1Q0VHigt2Mp+Mheq60oI7QRZQvZOtQRgYMWmTLOSau46PRVPR
         CMtTv+mtued7vr8Q1iB/9WfkPdBpaV0+4FGA/pw75KMjVOuhPz4+WBAfHmbg3+7sS7yD
         zfVuiccFpnFb7V1CkvKC28YoxJgwNNZxH43AjaqIPoYI6wqjbVyVDmqPI5znhr5o4/44
         23EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXViANT+qtfifuONeHq/yRQHxRQkLOZcsmI6Z6MNoO3gOE3UDq6n9D7CkAq1ayaisU2Z2lJvi/ECyU0VDajuBB//mHEbIJl9qSQsrqGDHimjAbH
X-Gm-Message-State: AOJu0YxccggO3xnzptKhCCQM0Gt3uO9QYS0GsjR9693sBuF2wG95Eahq
	95m4O4LR5ohU/3ZnaNS3CmYpVNtmTgauWXcuQk65bDSkySJ+GDmeeVYYYokYfT0=
X-Google-Smtp-Source: AGHT+IFBya5V2xQbhJizaPr/Q8T7hEPEzcZGX3jK6EfAM0X5nJdKs0HW0u+/neZnaqmpTki+tnx14w==
X-Received: by 2002:a05:6e02:1d86:b0:376:4049:69d2 with SMTP id e9e14a558f8ab-38398710582mr172377945ab.6.1720421545272;
        Sun, 07 Jul 2024 23:52:25 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b2248b69esm3094293b3a.144.2024.07.07.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 23:52:24 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:22:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] cpufreq: mediatek: Use dev_err_probe in every error
 path in probe
Message-ID: <20240708065222.iip3hzlffn2dthjg@vireshk-i7>
References: <20240705-mtk-cpufreq-dvfs-fail-init-err-v2-1-3a7f91b02ab0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705-mtk-cpufreq-dvfs-fail-init-err-v2-1-3a7f91b02ab0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_235226_374843_F3C66FFD 
X-CRM114-Status: GOOD (  16.47  )
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

On 05-07-24, 11:54, Nícolas F. R. A. Prado wrote:
> Use the dev_err_probe() helper to log the errors on every error path in
> the probe function and its sub-functions. This includes
> * adding error messages where there was none
> * converting over dev_err/dev_warn
> * removing the top-level error message after mtk_cpu_dvfs_info_init() is
>   called, since every error path inside that function already logs the
>   error reason. This gets rid of the misleading error message when probe
>   is deferred:
> 
>     mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Fixed one occurrence of the error code being set after the usage
> - For the paths that need to set the `ret` variable to the error code,
>   changed them so they set it from dev_err_probe()'s return, in a single
>   line.
> - Link to v1: https://lore.kernel.org/r/20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 72 ++++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 38 deletions(-)

Applied. Thanks.

-- 
viresh

