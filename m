Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1732D12D6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 04:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knhfiz6v1X/Y5Phw5qTTBL8KQ/Mw5RIdq1X0vCWMUt0=; b=fhGmXmCcgkpyKBYPZWa0VbfaeR
	UkrOiTk2zbm02wGsuuaTkxIel1qQVPzjxx+3Weuz3z1JiVCpb+VQhT3mxBMGn5l3EOxbAFVs7UgEP
	e1nRv0O9UjTkf3gcAhygIOQwT3UafwR/wGlzyz0CxuYHHEhRVfiOFITYuoOmwm2lCD4ls/Vtf+dgT
	UCwARZZNXwa0FxGs9p/Hqn2v1sc0BIOR2LSbFZvVubLetQgDSihPCQbeb1ydRpNuTG5CAsKS53WzU
	5D52OEvejWFLLnQmT6jAsO4qCHhgYH3yxuQr0XaIUUf+UMwRimCd0jNEjK9PAxdo5DiaAMD7+ePdT
	TtUsVv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALzp-0000000GJe4-2Reb;
	Mon, 11 Nov 2024 04:25:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALq5-0000000GIeH-2u4U
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Nov 2024 04:15:48 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20c8c50fdd9so34470855ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Nov 2024 20:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731298544; x=1731903344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=knhfiz6v1X/Y5Phw5qTTBL8KQ/Mw5RIdq1X0vCWMUt0=;
        b=Qh3h3k2Q2SZheWR/HAiz/YXNFc1ru7VHSZh4UmMLhdosh1asbtI5buNv3YwNMu4GVp
         jOwzU6XQsM0iJkL9OM6jvFgNewJSQz9E8uliYoi5paFpXywXTpZ2y8PHdzuaGpgPBycw
         /KhJ/2QCPH8k0dK+NdTTbRsVzQb3nfp2ZKVOk/B2ohgqcLq80zZtsVBpsmLl2rCKmIp4
         qA8IPhZU+1OZS4EhkFUbzFzFUql2NAla7gWPzkmjwuNDvL7+IRMNhGlv9A9YIKUP5/nT
         fpuqrJTv8kbFGr0j5y6QwpJ4Eun83G5NKFLoa9M3/zHAz7yF/BtPVXz0HU4dU51vDW0g
         DBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731298544; x=1731903344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knhfiz6v1X/Y5Phw5qTTBL8KQ/Mw5RIdq1X0vCWMUt0=;
        b=K0+HAEOkl8BBcbViQGTrruqx/4T5CvyEqDxBoh05uKbGWsS/6tWZBI87OxQvYMWfoa
         8lmZoD6IMSNxMTvpyFaoJV+Ndl9YZ86SN5RrGOzwVuYx7dxjbTeOg7slDa4XhRSKoNK/
         GNRfgrD/h2xonbHjLR8AW+0cwtMFIusC4YsjAcSaMNFAFrX1Hx1MLeAXQR4MiDlJ3mVi
         PoZPgdGb865j0/3oPWLQFwyagvGhicgh0NS5+9EdxSHw/WYXHh8i5bCXgmjmHsy31JGM
         +8X1uEWRZEiNe7PKs/pV59SbeBim6Ko1HHdL+SEgCwroRc0BPvMfotKw5G5VViFG8nzf
         U7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXl10/GObZCVPNTZQU9i/eiBwB6htdxk5a43a44q7Eyqif7PXS6r5lVC0wjmXTq8m8V2Jscay8HO9qSpY0KzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzZ47fB3eSg8LUVy6CGI3qgpgyN1biDN99vusLTt0DJTxActth
	fNZBSQUHzdMH6flgD/jKFoTRqCj6DUF/7wApVeA9QQcZURd6c+Sa3p5SxUAKAm0=
X-Google-Smtp-Source: AGHT+IHxCb9wscTjmGmnrU/ke01iamppePTNlMCSebsPTr/XCYGY/bNBzPupEwPaf2R5gdgxQNJBBw==
X-Received: by 2002:a17:902:d486:b0:211:74be:c09b with SMTP id d9443c01a7336-211821ae0e7mr198879005ad.12.1731298544156;
        Sun, 10 Nov 2024 20:15:44 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1a9fsm7577101a91.37.2024.11.10.20.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:15:42 -0800 (PST)
Date: Mon, 11 Nov 2024 09:45:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: rafael@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, hector.yuan@mediatek.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 RESEND] cpufreq: mediatek-hw: Fix wrong return value
 in mtk_cpufreq_get_cpu_power()
Message-ID: <20241111041540.7pfksjopw7qfupsx@vireshk-i7>
References: <20241107113841.989475-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107113841.989475-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_201545_798066_94B20D00 
X-CRM114-Status: GOOD (  15.47  )
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

On 07-11-24, 19:38, Jinjie Ruan wrote:
> mtk_cpufreq_get_cpu_power() return 0 if the policy is NULL. Then in
> em_create_perf_table(), the later zero check for power is not invalid
> as power is uninitialized. As Lukasz suggested, it must return -EINVAL when
> the 'policy' is not found. So return -EINVAL to fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2 -> v2 RESEND:
> - Update the commit subject and Cc Viresh.
> - Add Reviewed-by.
> v2:
> - Fix the driver instead of em_create_perf_table() as suggested.
> - Update the commit message.
> - Add Suggested-by.
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

