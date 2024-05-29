Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A607C41513
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka2Maam5Ei5EuRcb2P0MO3/hFv2w3w7reQQ7Fg93ZTo=; b=XPP2i8qEDnpjIkSMJjZBK4BORJ
	qkrAUvokS982OyD+UGoDXlQBj+/nVWksfod1nshIu3FC+ik6KyVjeQraMp+ZVYAHr/XcyOk3G8oAf
	P9lFO2Aa/RxOsSgiY5mNfwcirWBggVL3wfuJZgJs1QBk5V/zKLOnGf16X2Ja86i2MxllTCSmmQ6lt
	r4dS+sdz6UXwrlpCPcrY+YIP0cvbXNhb+cnTOUNOfRoSB+gvNTgagFsrZ/D50W1dj9bvWBKQoJyrH
	hFkv9xvlfocmICbSSU2pz9oiWuHzqDVa8sORBOKArnk+kLd4td1ARSMKfRVV3bKQ5853U9Yz2sbN+
	8olcTlUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDyb-00000003BvQ-3wto;
	Wed, 29 May 2024 07:44:01 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDyY-00000003BuF-2e9t
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 07:44:00 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52ac99930c6so582211e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968636; x=1717573436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ka2Maam5Ei5EuRcb2P0MO3/hFv2w3w7reQQ7Fg93ZTo=;
        b=br7KtXjf+Q4+V4jKTkURqoCSjRI7FgE30Q93JWJGSGyTX6EAJIZvwD3zUirYWsTvAE
         bzsvpeoBNaZdCbUHJXktG9N8ircW2VNHrY3WYFyVDpVj7N1be+sv8cU2X+VcjL62ACCh
         karxT4Gd0FEqa4Pfha7uj5T3US7VRIAynlhTAkbBWrUdvQZGA9o6WD6CAS7NDzdWLMsr
         O1YTOj56YsAYmxijjWIDtmuUUv4OablaUaQsuFn6Pt8UPY6TCGFEvYRxASlhXUlzSu//
         t87zWvwb1QlsBj+250mk87RzHRvcfzo3A7Xtp6QwV9ePyj6au4C1ze5zLqVtxKxIsrHz
         1OBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968636; x=1717573436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka2Maam5Ei5EuRcb2P0MO3/hFv2w3w7reQQ7Fg93ZTo=;
        b=rkzeI4EhWtwSEupFXsVkNTKucD8ZgGNaqrbLxzUzueKj+UtXAqiy+Hkd8fEOp/NNk4
         6GW+qAQYFcCqnfWhbBMMPfyJKCNB5VIL4U5gi4IJ2MtGp93UJxqUBhcM0tANRcdmIjy6
         fA8Alx3QDNQ5p9WwJXlgsnOtRsdL47hMyb9arWEjmfnUBIvlLAGyTMOovTJvksw4/vQ2
         N7VNC8phk1D0cH4WT1MJw4A87p1W3r5rNu+8UIeReNq//usM+sIMUM+K/mTyRBoobEMH
         OCJmqg8t/+jkXfSjDFg1mAmXu6Cv/GTTeCKCpPWAILx6ob2zFX2RY1AYXyA5Q1ZPxDSW
         sK/w==
X-Forwarded-Encrypted: i=1; AJvYcCXHiqcDkDubeYt8FaPhixfxuA12mN4hRXOuz7scNloKOf/X6XAAdblk76uvJf5urblUATI683O5T3qnP2pvn6+hx2uA+H6X/wfzDvCElRG00Zak
X-Gm-Message-State: AOJu0YyZWUIwSTR1z+rBZeqz83Le59ZUG8Wl+P7flzoV/OPf59fRYVG6
	nquEvbGJRJbYy+6oSPEN306ekFPsfBCYRDwsMbIQV3Ykvd9HFJ9YHuWuwWu7ihI=
X-Google-Smtp-Source: AGHT+IEpKoJxeYMMRmRHKz19pKO8ijGaGc5T6KYCnRuUNFgdev3K9Yfz0P6oPUoZ1/TYqG8Ww0hnig==
X-Received: by 2002:a05:6512:3241:b0:51c:df1f:2edc with SMTP id 2adb3069b0e04-529644ebe8cmr7988541e87.2.1716968635950;
        Wed, 29 May 2024 00:43:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a50b1d85sm978336e87.113.2024.05.29.00.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:43:55 -0700 (PDT)
Date: Wed, 29 May 2024 10:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] drm/ci: add farm variable
Message-ID: <xhdcswueynlctjznqnxo663v2k6q2lrk55jjdodrkd7ojijaiw@lg3e2e5qcnny>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-3-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_004358_695868_68896B13 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 29, 2024 at 08:10:45AM +0530, Vignesh Raman wrote:
> Mesa uses structured logs for logging and debug purpose,
> https://mesa.pages.freedesktop.org/-/mesa/-/jobs/59165650/artifacts/results/job_detail.json
> 
> Since drm-ci uses the mesa scripts, add the farm variable
> and update the device type for missing jobs.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v3:
>   - New commit to add farm variable and update device type variable.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

