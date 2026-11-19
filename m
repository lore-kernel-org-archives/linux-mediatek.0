Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A16606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z7A8u4hr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWty2gY2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o4GEyz5U9vFXXKUrCPhLjfd8PplmyKlfLDn43zCRhVs=; b=Z7A8u4hrnSByIg4eYcyLrFgKj7
	h+lDDJnTkkUzRRYV+hu7ZvrQumettyZH+BA+vG3gZlwgfoTxHUrl8BoTWljMYj3DfGWXNY4a8smwK
	aBV/il/gShdQCVPlJRyKMC2A0NsoNDaEQKrYN1dbxhg3gF4K+Ph+eF6ElR5SOKTA8rQpgA1EF2ycB
	IGt/Tx3ukqTLHEh8HP+WJsCqDLIKht0LLIc6RiAJ/LxX9q/JJGwqs6Ivk35UoTvPKEMY0nZbodbdr
	zW632VvigtASJywoWJIsZ02Kz7Zn5BS7ccOHjorfiOe9vCGX0nowq1hIoZ0acoDrm8WYf/eVh7U3a
	38u85PVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzul-0000000BeFO-1qNQ;
	Thu, 19 Nov 2026 11:02:54 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzuh-0000000BeE0-0dth
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 11:02:48 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-15dd124bbe7so2776166c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795086166; x=1795690966; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4GEyz5U9vFXXKUrCPhLjfd8PplmyKlfLDn43zCRhVs=;
        b=JWty2gY2ATPjpQQGP+Fx5gqa+GIZ7KBEOqkZUiXw0KX2K+rO2G1+78p8jXH2uyYfXI
         aU6NlPU14OzwkQkefDjy6wDfknKHULndAOIgOcFL6V2IljFjX5W18WFfp4CJxJB1sT6P
         8lxwtocKxpV0LCbsuUY74W1yxKcyM7/iuWxv46V6mUeR3L+R16vu573Nzbktne4rfT9I
         YL3oDbK9g+02athV5tGctg4eo0ysGITA0gGCBemDw3cap0KhZg8tRdJmZUjOfKEUjq02
         E9i+66CNKbpNspGWBOTp41upmb41EtiTcU9nm5DbmK/KJfeUiP1ePTp83qYfe9ACNIW6
         VPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086166; x=1795690966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4GEyz5U9vFXXKUrCPhLjfd8PplmyKlfLDn43zCRhVs=;
        b=zvd05PMehyDiHOML8TJhzj8QK2pHurzIdEGJPUlMT4rs5KjpyCu2bFmVoKXZasbBbS
         PoY9UeP1QxFsqu8CK9NT+dsE77rbQ0zlh5/X6KiOobQKrKIzzAStHahTmnHssJICkXX2
         Gstal97cXMrtNHW/cM70zGTisAANJhzCQNoQySsX4kpvLXlNIQFo3o3aYyYU2NRR0D6N
         NxU49x4vHdK9b0tXLAAlv/bxBfoaJND7Tcs+S8hEFYl7QJ8t/eM9X5w+GCCVr3nWCdwl
         eRJostHBWQbXtywFgpWSeQD9WLOiB1SeRjSZkL9XmKv9H8r2esXYlp7m9cU11UT2JngB
         ZP8g==
X-Forwarded-Encrypted: i=1; AL+hErGUw7DJ3WFyrJJVDbWxPdgXcJfJJfxLeWLiuODqZGEo+q0Irb6Nkv1zXKLcpvezJ3jJ5Y5VJGxGBTHhjHXwdQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+opXvylR2L3aRon/knv/MTNcwKmEhxgKoy/wpf4w6qiwOlQrnj
	Bm5sjTyW3kRoXTyV9YkBFw5GqdChJ0lTjV78nGWXyPrbQpIzr5i0IM/ejZaFhn78N5g=
X-Gm-Gg: AYBFou2ArOAxLsblXmXX7qyda78v2b+iZ6fojS61dcOuvEy8XcXHz/Qu3tMcA20QHzP
	TxnbR11YCCAA0G5zh6gt2qTB654E5/pVD2VOA/l+5HSQBgdbgCvqA26nLM4Ovd2J/V9b5nfMV5L
	y6nxT7vKg5nQ+WG8fiIegPEA6fvPjkIoJxdN+zsJDNS0UZpxspifLEtkqBsokysV+he2Mvk3MxU
	wMVuiMMbqG4m3bnCiKRWjMUeeWqFO9RtowkgtoLhXtl7tdEvis7WMOXDYiHlYLFer7r4a0AFesC
	pvIs9Av8u8psUbvo2jDbQWuKlQby2N8Qk7aVS77Ie4yMoi1dFp9HlH+/acplsaKe6IDhggXHB01
	zif7JV5cVu39vVtTo4rNMxk8JrudNo/oEZ8N4SeLmBqAwvbWFmPeZc2imQ0xxFzC20legNCCRdU
	NKKqT5K1x1Gn9dahnhPZRbFmvRmRFcx5cnuvZF/ML4KFOAEQwDUDp6nGDG0PU5yQQHg4ZpMBfyn
	2oLNBLam0Et9Q2YnZyJrVkZiStAHL2xY0ySU3rkNekxxDgd4UdDMT/Fn+LHWcT8YgUM7zXFbGzh
	Fw6GaRY/QrTeXqN6+Of1ud1iYJbuLg==
X-Received: by 2002:a05:701b:205b:20b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b543c144c7mr5006926c88.26.1795086165423;
        Thu, 19 Nov 2026 03:02:45 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5ec9sm14665466c88.8.2026.11.19.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:02:44 -0800 (PST)
Date: Thu, 19 Nov 2026 16:32:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: rafael@kernel.org, zhongqiu.han@oss.qualcomm.com,
	hector.yuan@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek-hw: Fix initialization resource
 leaks
Message-ID: <av7XUQCgTkhJB43V@vireshk-B250M-D3H>
References: <20261119052811.2877720-1-haoxiang_li2024@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119052811.2877720-1-haoxiang_li2024@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_030247_211204_86C3393C 
X-CRM114-Status: GOOD (  11.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19-11-26, 13:28, Haoxiang Li wrote:
> This series fixes two resource cleanup omissions introduced by commit
> d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case").
> 
> Patch 1 releases the resources when the CPUFreq hardware fails to become
> enabled.
> 
> Following Zhongqiu's suggestion during review, patch 2 handles the
> additional failure path where mtk_cpu_create_freq_table() fails after
> the registers have been mapped and the memory region requested.
> Thanks to Zhongqiu for pointing out this omission and suggesting a
> separate fix.
> 
> Changes in v2:
> - Keep the original hardware enable failure fix unchanged as patch 1.
> - Add patch 2 to clean up on frequency table creation failure, using
>   the same Fixes tag.
> 
> Haoxiang Li (2):
>   cpufreq: mediatek-hw: Release resources when hardware enable fails
>   cpufreq: mediatek-hw: Clean up on frequency table creation failure

Applied. Thanks.

-- 
viresh

